@interface IUIRTIInputSource
- (BOOL)_disableAutomaticKeyboardUI;
- (BOOL)canBecomeFirstResponder;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isPlaceholder;
- (BOOL)respondsToSelector:(SEL)a3;
- (CGRect)_lastRectForRange:(id)a3;
- (CGRect)_rectForLineIntersectingRange:(id)a3 firstLine:(BOOL)a4;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)firstRectForRange:(id)a3;
- (IUIRTIInputSource)init;
- (IUIRTIInputSourceDelegate)dataTransportDelegate;
- (IUIRTIInputView)remoteInputView;
- (NSUUID)identifier;
- (RTIInputSystemSessionDelegate)sourceSessionDelegate;
- (RTIInputSystemSourceSession)sourceSession;
- (RTIInputViewInfo)inputViewInfo;
- (_UILayerHostView)remoteInputViewLayerHost;
- (id)_additionalTextInputLocales;
- (id)_rtiSourceSession;
- (id)inputView;
- (id)selectionRectsForRange:(id)a3;
- (id)textInputContextIdentifier;
- (id)textInputMode;
- (void)didMoveToWindow;
- (void)handleTextActionPayload:(id)a3;
- (void)ingestDataPayload:(id)a3;
- (void)ingestDocumentState:(id)a3;
- (void)ingestDocumentTraits:(id)a3;
- (void)matchInputDestinationFrame;
- (void)setCanBecomeFirstResponder:(BOOL)a3;
- (void)setContinuousSpellCheckingEnabled:(BOOL)a3;
- (void)setDataTransportDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInputViewInfo:(id)a3;
- (void)setPlaceholder:(BOOL)a3;
- (void)setRemoteInputView:(id)a3;
- (void)setRemoteInputViewLayerHost:(id)a3;
- (void)setSourceSession:(id)a3;
@end

@implementation IUIRTIInputSource

- (IUIRTIInputSource)init
{
  v10.receiver = self;
  v10.super_class = (Class)IUIRTIInputSource;
  v2 = [(IUIRTIInputSource *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(IUIRTIInputSystemSourceSession);
    sourceSession = v2->_sourceSession;
    v2->_sourceSession = (RTIInputSystemSourceSession *)v3;

    [(RTIInputSystemSourceSession *)v2->_sourceSession setPayloadDelegate:v2];
    [(IUIRTIInputSource *)v2 _setSafeAreaInsetsFrozen:1];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.inputservice.layerTransform", v6);
    layerTransformQueue = v2->_layerTransformQueue;
    v2->_layerTransformQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)matchInputDestinationFrame
{
  v4 = [(IUIRTIInputSource *)self window];
  if (!v4)
  {
    objc_super v10 = sub_10000BBB0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: nil window", buf, 0xCu);
    }
    goto LABEL_12;
  }
  v5 = [(RTIInputSystemSourceSession *)self->_sourceSession documentTraits];
  unsigned int v6 = [v5 contextID];

  dispatch_queue_t v7 = [(RTIInputSystemSourceSession *)self->_sourceSession documentTraits];
  id v8 = [v7 layerID];

  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    objc_super v10 = sub_10000BBB0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v6;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: destinationContextID = %u, destinationLayerID = %llu", buf, 0x1Cu);
    }
LABEL_12:

    goto LABEL_13;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0xA010000000;
  *(void *)&buf[24] = "";
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v13 = dispatch_group_create();
  layerTransformQueue = self->_layerTransformQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BC04;
  block[3] = &unk_10001C770;
  unsigned int v34 = v6;
  block[4] = buf;
  block[5] = v8;
  dispatch_group_async(v13, layerTransformQueue, block);
  unsigned int v15 = [v4 _contextId];
  v16 = [v4 layer];
  uint64_t RenderId = CALayerGetRenderId();

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0xA010000000;
  v24[3] = "";
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v18 = self->_layerTransformQueue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000BC64;
  v22[3] = &unk_10001C770;
  unsigned int v23 = v15;
  v22[4] = v24;
  v22[5] = RenderId;
  dispatch_group_async(v13, v18, v22);
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000BCC4;
  v19[3] = &unk_10001C798;
  objc_copyWeak(&v20, &location);
  v19[4] = buf;
  v19[5] = v24;
  dispatch_group_notify(v13, (dispatch_queue_t)&_dispatch_main_q, v19);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(buf, 8);
LABEL_13:
}

- (void)setContinuousSpellCheckingEnabled:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)IUIRTIInputSource;
  [(IUIRTIInputSource *)&v3 setContinuousSpellCheckingEnabled:0];
}

- (CGRect)firstRectForRange:(id)a3
{
  [(IUIRTIInputSource *)self _rectForLineIntersectingRange:a3 firstLine:1];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_lastRectForRange:(id)a3
{
  [(IUIRTIInputSource *)self _rectForLineIntersectingRange:a3 firstLine:0];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_rectForLineIntersectingRange:(id)a3 firstLine:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v38 = 0;
  long long v39 = (CGRect *)&v38;
  uint64_t v40 = 0x4010000000;
  long long v41 = "";
  CGSize size = CGRectNull.size;
  CGPoint origin = CGRectNull.origin;
  CGSize v43 = size;
  id v8 = [(RTIDocumentState *)self->_documentState documentState];

  if (v6)
  {
    if (v8)
    {
      BOOL v9 = [(RTIDocumentState *)self->_documentState documentState];
      objc_super v10 = (char *)+[IUIRangeTransform rangeInDocumentState:v9 fromTextRange:v6 inUITextInput:self];
      uint64_t v12 = v11;

      if (v10 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v36[0] = 0;
        v36[1] = v36;
        v36[2] = 0x2020000000;
        char v37 = 0;
        uint64_t v30 = 0;
        long long v31 = &v30;
        uint64_t v32 = 0x3010000000;
        v33 = "";
        unsigned int v34 = v10;
        uint64_t v35 = 0;
        if (v4) {
          uint64_t v13 = 0;
        }
        else {
          uint64_t v13 = 2;
        }
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10000C0C0;
        v29[3] = &unk_10001C7C0;
        v29[4] = &v38;
        v29[5] = v36;
        v29[6] = &v30;
        v14 = objc_retainBlock(v29);
        -[RTIDocumentState enumerateRectsWithOptions:range:granularity:block:](self->_documentState, "enumerateRectsWithOptions:range:granularity:block:", v13, v10, v12, 1, v14);
        unsigned int v15 = (char *)v31[4];
        uint64_t v16 = v31[5];
        if ((v15 != v10 || v16 != v12) && &v10[v12] > &v15[v16]) {
          -[RTIDocumentState enumerateRectsWithOptions:range:granularity:block:](self->_documentState, "enumerateRectsWithOptions:range:granularity:block:", v13);
        }

        _Block_object_dispose(&v30, 8);
        _Block_object_dispose(v36, 8);
      }
    }
  }
  if (CGRectIsNull(v39[1]))
  {
    [(RTIDocumentState *)self->_documentState firstSelectionRectInWindow];
    double x = v17;
    double y = v19;
    double width = v21;
    double height = v23;
  }
  else
  {
    double x = v39[1].origin.x;
    double y = v39[1].origin.y;
    double width = v39[1].size.width;
    double height = v39[1].size.height;
  }
  _Block_object_dispose(&v38, 8);

  double v25 = x;
  double v26 = y;
  double v27 = width;
  double v28 = height;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  [(RTIDocumentState *)self->_documentState caretRectInWindow];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  documentState = self->_documentState;
  id v6 = [(RTIDocumentState *)documentState selectedTextRange];
  uint64_t v8 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000C3A4;
  v11[3] = &unk_10001C7E8;
  id v9 = v4;
  id v12 = v9;
  -[RTIDocumentState enumerateRectsWithOptions:range:granularity:block:](documentState, "enumerateRectsWithOptions:range:granularity:block:", 2, v6, v8, -1, v11);

  return v9;
}

- (id)_rtiSourceSession
{
  return self->_sourceSession;
}

- (RTIInputSystemSessionDelegate)sourceSessionDelegate
{
  return (RTIInputSystemSessionDelegate *)[(RTIInputSystemSourceSession *)self->_sourceSession sessionDelegate];
}

- (id)inputView
{
  double v3 = sub_10000BBB0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    sourceSession = self->_sourceSession;
    double v5 = [(RTIInputSystemSourceSession *)sourceSession documentTraits];
    int v40 = 138412546;
    long long v41 = sourceSession;
    __int16 v42 = 2112;
    CGSize v43 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "inputView, sourceSession: %@, traits: %@", (uint8_t *)&v40, 0x16u);
  }
  id v6 = [(RTIInputSystemSourceSession *)self->_sourceSession documentTraits];

  if (!v6)
  {
    remoteInputView = self->_remoteInputView;
    self->_remoteInputView = 0;

    remoteInputViewLayerHost = self->_remoteInputViewLayerHost;
    self->_remoteInputViewLayerHost = 0;

    goto LABEL_15;
  }
  uint64_t v7 = [(RTIInputSystemSourceSession *)self->_sourceSession documentTraits];
  uint64_t v8 = [v7 inputViewInfo];

  id v9 = sub_10000BBB0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    inputViewInfo = self->_inputViewInfo;
    unsigned int v11 = [v8 contextId];
    [v8 size];
    id v12 = NSStringFromCGSize(v51);
    [v8 insets];
    int v40 = 138413314;
    long long v41 = (RTIInputSystemSourceSession *)v8;
    __int16 v42 = 2048;
    CGSize v43 = inputViewInfo;
    __int16 v44 = 1024;
    unsigned int v45 = v11;
    __int16 v46 = 2112;
    v47 = v12;
    __int16 v48 = 2048;
    uint64_t v49 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "inputView, inputViewInfo: %@ (_inputViewInfo %p), contextId: %u size: %@ insets: %f", (uint8_t *)&v40, 0x30u);
  }
  if (![v8 contextId])
  {
    long long v36 = self->_remoteInputView;
    self->_remoteInputView = 0;

    char v37 = self->_remoteInputViewLayerHost;
    self->_remoteInputViewLayerHost = 0;

    v33 = self->_inputViewInfo;
    self->_inputViewInfo = 0;
LABEL_13:

    goto LABEL_14;
  }
  if (([v8 isEqual:self->_inputViewInfo] & 1) == 0)
  {
    v14 = [IUIRTIInputView alloc];
    double y = CGPointZero.y;
    [v8 size];
    v18 = -[IUIRTIInputView initWithFrame:](v14, "initWithFrame:", CGPointZero.x, y, v16, v17);
    double v19 = self->_remoteInputView;
    self->_remoteInputView = v18;

    if (objc_opt_respondsToSelector()) {
      -[IUIRTIInputView setShouldShowDockView:](self->_remoteInputView, "setShouldShowDockView:", [v8 shouldShowDockView]);
    }
    id v20 = objc_alloc((Class)_UILayerHostView);
    [v8 insets];
    double v22 = -v21;
    [v8 size];
    double v24 = v23;
    [v8 size];
    double v26 = v25;
    [v8 insets];
    double v28 = v26 + v27;
    long long v29 = [(RTIInputSystemSourceSession *)self->_sourceSession documentTraits];
    uint64_t v30 = (_UILayerHostView *)objc_msgSend(v20, "initWithFrame:pid:contextID:", objc_msgSend(v29, "processId"), objc_msgSend(v8, "contextId"), 0.0, v22, v24, v28);
    long long v31 = self->_remoteInputViewLayerHost;
    self->_remoteInputViewLayerHost = v30;

    [(IUIRTIInputView *)self->_remoteInputView addSubview:self->_remoteInputViewLayerHost];
    uint64_t v32 = (RTIInputViewInfo *)[v8 copy];
    v33 = self->_inputViewInfo;
    self->_inputViewInfo = v32;
    goto LABEL_13;
  }
LABEL_14:

LABEL_15:
  uint64_t v38 = self->_remoteInputView;

  return v38;
}

- (id)textInputContextIdentifier
{
  v2 = [(RTIInputSystemSourceSession *)self->_sourceSession documentTraits];
  double v3 = [v2 textInputContextIdentifier];

  return v3;
}

- (id)textInputMode
{
  double v3 = [(RTIInputSystemSourceSession *)self->_sourceSession documentTraits];
  id v4 = [v3 textInputModeData];

  if (!v4
    || (+[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:0], (double v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)IUIRTIInputSource;
    double v5 = [(IUIRTIInputSource *)&v7 textInputMode];
  }

  return v5;
}

- (id)_additionalTextInputLocales
{
  double v3 = [(RTIInputSystemSourceSession *)self->_sourceSession documentTraits];
  id v4 = [v3 additionalLocaleIdentifiers];

  if ([v4 count])
  {
    double v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned int v11 = +[NSLocale localeWithLocaleIdentifier:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          if (v11) {
            [v5 addObject:v11];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)IUIRTIInputSource;
    double v5 = [(IUIRTIInputSource *)&v13 _additionalTextInputLocales];
  }

  return v5;
}

- (void)ingestDataPayload:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v10 documentTraits];
    double v5 = [v4 textInputTraits];

    id v6 = [v10 documentState];
    documentState = self->_documentState;
    self->_documentState = v6;

    if (v5)
    {
      id v8 = +[UITextInputTraits defaultTextInputTraits];
      [v8 overlayWithTITextInputTraits:v5];
      uint64_t v9 = [(IUIRTIInputSource *)self performSelector:"_textInputTraits"];
      [v9 takeTraitsFrom:v8];
    }
  }
  [(RTIInputSystemSourceSession *)self->_sourceSession handleTextActionPayload:v10];
  [(IUIRTIInputSource *)self matchInputDestinationFrame];
}

- (void)ingestDocumentTraits:(id)a3
{
  id v4 = a3;
  id v9 = +[UITextInputTraits defaultTextInputTraits];
  double v5 = [v4 textInputTraits];
  [v9 overlayWithTITextInputTraits:v5];

  id v6 = [(IUIRTIInputSource *)self performSelector:"_textInputTraits"];
  [v6 takeTraitsFrom:v9];
  id v7 = +[RTIInputSystemDataPayload payloadWithData:0];
  [v7 setDocumentTraits:v4];

  id v8 = [(RTIInputSystemSourceSession *)self->_sourceSession uuid];
  [v7 setSessionUUID:v8];

  [(RTIInputSystemSourceSession *)self->_sourceSession handleTextActionPayload:v7];
  [(IUIRTIInputSource *)self matchInputDestinationFrame];
}

- (void)ingestDocumentState:(id)a3
{
  objc_storeStrong((id *)&self->_documentState, a3);
  id v5 = a3;
  id v7 = +[RTIInputSystemDataPayload payloadWithData:0];
  [v7 setDocumentState:v5];
  id v6 = [(RTIInputSystemSourceSession *)self->_sourceSession uuid];
  [v7 setSessionUUID:v6];

  [(RTIInputSystemSourceSession *)self->_sourceSession handleTextActionPayload:v7];
}

- (void)handleTextActionPayload:(id)a3
{
  id v4 = a3;
  id v6 = [(IUIRTIInputSource *)self dataTransportDelegate];
  id v5 = [(IUIRTIInputSource *)self sourceSession];
  [v6 inputSource:v5 didGenerateTextActionPayload:v4];
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = (__objc2_prot *)a3;
  id v5 = [(IUIRTIInputSource *)self sourceSession];
  id v6 = [v5 documentTraits];

  unint64_t v7 = (unint64_t)[v6 delegateConformanceType];
  if (&OBJC_PROTOCOL___UITextInput == v4)
  {
    self = (IUIRTIInputSource *)((v7 >> 1) & 1);
  }
  else if (&OBJC_PROTOCOL___UITextInputPrivate == v4)
  {
    self = (IUIRTIInputSource *)((v7 >> 2) & 1);
  }
  else if (&OBJC_PROTOCOL___UIKeyInput == v4)
  {
    LOBYTE(self) = v7 & 1;
  }
  else if (&OBJC_PROTOCOL___UIKeyInputPrivate == v4)
  {
    self = (IUIRTIInputSource *)((v7 >> 4) & 1);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)IUIRTIInputSource;
    LOBYTE(self) = [(IUIRTIInputSource *)&v9 conformsToProtocol:v4];
  }

  return (char)self;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  id v5 = [(IUIRTIInputSource *)self sourceSession];
  id v6 = [v5 documentTraits];

  unsigned __int8 v7 = [v6 delegateConformanceType];
  if (!sel_isEqual(a3, "handleKeyWebEvent:withCompletionHandler:") || (v7 & 0x20) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)IUIRTIInputSource;
    BOOL v9 = [(IUIRTIInputSource *)&v11 respondsToSelector:a3];
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)_disableAutomaticKeyboardUI
{
  double v3 = [(IUIRTIInputSource *)self sourceSession];
  id v4 = [v3 documentTraits];

  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v5 = [v4 disableAutomaticKeyboardUI];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)IUIRTIInputSource;
    unsigned __int8 v5 = [(IUIRTIInputSource *)&v8 _disableAutomaticKeyboardUI];
  }
  BOOL v6 = v5;

  return v6;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)IUIRTIInputSource;
  [(IUIRTIInputSource *)&v3 didMoveToWindow];
  [(IUIRTIInputSource *)self matchInputDestinationFrame];
}

- (BOOL)canBecomeFirstResponder
{
  return self->canBecomeFirstResponder;
}

- (void)setCanBecomeFirstResponder:(BOOL)a3
{
  self->canBecomeFirstResponder = a3;
}

- (IUIRTIInputSourceDelegate)dataTransportDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataTransportDelegate);

  return (IUIRTIInputSourceDelegate *)WeakRetained;
}

- (void)setDataTransportDelegate:(id)a3
{
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (RTIInputSystemSourceSession)sourceSession
{
  return self->_sourceSession;
}

- (void)setSourceSession:(id)a3
{
}

- (IUIRTIInputView)remoteInputView
{
  return self->_remoteInputView;
}

- (void)setRemoteInputView:(id)a3
{
}

- (_UILayerHostView)remoteInputViewLayerHost
{
  return self->_remoteInputViewLayerHost;
}

- (void)setRemoteInputViewLayerHost:(id)a3
{
}

- (RTIInputViewInfo)inputViewInfo
{
  return self->_inputViewInfo;
}

- (void)setInputViewInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputViewInfo, 0);
  objc_storeStrong((id *)&self->_remoteInputViewLayerHost, 0);
  objc_storeStrong((id *)&self->_remoteInputView, 0);
  objc_storeStrong((id *)&self->_sourceSession, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataTransportDelegate);
  objc_storeStrong((id *)&self->_layerTransformQueue, 0);

  objc_storeStrong((id *)&self->_documentState, 0);
}

@end