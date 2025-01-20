@interface IUISessionCoordinator
+ (BOOL)_useRTIInterfaceForAutoFillOnIphone;
- (BOOL)needsToReloadInputSource;
- (IUIInputSourceViewController)inputSourceViewController;
- (IUIRTIInputSource)textInputSource;
- (IUISessionCoordinator)initWithQueue:(id)a3;
- (NSMutableDictionary)pendingSuggestions;
- (OS_dispatch_queue)dispatchQueue;
- (RTIInputSystemDelegate)autofillUIServiceDelegate;
- (RTIInputSystemServiceSession)currentSession;
- (id)_main_didTeardownExistingDelegateCallback_withSessionChangeAssistant:(id)a3;
- (id)_main_inputSourceForChangeContext:(id)a3;
- (id)_main_placeholderInputSourceForSession:(id)a3;
- (id)_main_placeholderServiceSessionWithIdentifier:(id)a3 documentTraits:(id)a4;
- (id)_main_willSetupNewDelegateCallback_withSessionChangeAssistant:(id)a3;
- (id)assertionForOptions:(id)a3;
- (id)serviceSessionPayloadDelegate;
- (id)sessionChangeQueue;
- (void)_endSession:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_main_handleSessionChange:(id)a3;
- (void)_queue_queueSessionChange:(id)a3;
- (void)handlePendingSuggestionsDataIfNecessary;
- (void)inputSource:(id)a3 didGenerateTextActionPayload:(id)a4;
- (void)inputSystemService:(id)a3 didCreateInputSession:(id)a4;
- (void)inputSystemService:(id)a3 inputSession:(id)a4 didAddRTISupplementalLexicon:(id)a5;
- (void)inputSystemService:(id)a3 inputSession:(id)a4 didRemoveRTISupplementalLexicon:(id)a5;
- (void)inputSystemService:(id)a3 inputSession:(id)a4 documentStateDidChange:(id)a5;
- (void)inputSystemService:(id)a3 inputSession:(id)a4 documentTraitsDidChange:(id)a5;
- (void)inputSystemService:(id)a3 inputSession:(id)a4 performInputOperation:(id)a5;
- (void)inputSystemService:(id)a3 inputSession:(id)a4 performInputOperation:(id)a5 withResponse:(id)a6;
- (void)inputSystemService:(id)a3 inputSession:(id)a4 textSuggestionsChanged:(id)a5;
- (void)inputSystemService:(id)a3 inputSessionDidBegin:(id)a4;
- (void)inputSystemService:(id)a3 inputSessionDidBegin:(id)a4 options:(id)a5;
- (void)inputSystemService:(id)a3 inputSessionDidDie:(id)a4;
- (void)inputSystemService:(id)a3 inputSessionDidEnd:(id)a4;
- (void)inputSystemService:(id)a3 inputSessionDidEnd:(id)a4 options:(id)a5;
- (void)inputSystemService:(id)a3 inputSessionDidEnd:(id)a4 options:(id)a5 completion:(id)a6;
- (void)inputSystemService:(id)a3 inputSessionDidPause:(id)a4 withReason:(id)a5;
- (void)inputSystemService:(id)a3 inputSessionDidUnpause:(id)a4 withReason:(id)a5;
- (void)inputSystemService:(id)a3 inputSessionDocumentDidChange:(id)a4;
- (void)invalidateAssertionIfNeeded:(id)a3 resetKeyboardAlpha:(BOOL)a4;
- (void)reloadInputSource;
- (void)setAutofillUIServiceDelegate:(id)a3;
- (void)setCurrentSession:(id)a3;
- (void)setInputSourceViewController:(id)a3;
- (void)setNeedsToReloadInputSource:(BOOL)a3;
- (void)setPendingSuggestions:(id)a3;
- (void)setTextInputSource:(id)a3;
@end

@implementation IUISessionCoordinator

- (IUISessionCoordinator)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IUISessionCoordinator;
  v6 = [(IUISessionCoordinator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
  }

  return v7;
}

+ (BOOL)_useRTIInterfaceForAutoFillOnIphone
{
  if (qword_1000293C0 != -1) {
    dispatch_once(&qword_1000293C0, &stru_10001C570);
  }
  return byte_1000293B8;
}

- (void)reloadInputSource
{
  if (qword_1000293D0 != -1) {
    dispatch_once(&qword_1000293D0, &stru_10001C730);
  }
  if (!byte_1000293C8)
  {
    v3 = objc_alloc_init(IUIRTIInputSource);
    [(IUIRTIInputSource *)v3 setDataTransportDelegate:self];
    [(IUIRTIInputSource *)v3 setHidden:1];
    v4 = [(IUISessionCoordinator *)self inputSourceViewController];
    id v5 = [v4 view];
    [v5 addSubview:v3];

    [(IUISessionCoordinator *)self setTextInputSource:v3];
    v6 = +[UIApplication sharedApplication];
    v7 = [v6 systemDelegateMultiplexer];
    [v7 setPrimaryDelegate:self];

    v8 = [(IUISessionCoordinator *)self textInputSource];
    [v8 setCanBecomeFirstResponder:0];

    objc_super v9 = sub_1000029D8();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Input source did load", v10, 2u);
    }
  }
}

- (void)setCurrentSession:(id)a3
{
  v4 = (RTIInputSystemServiceSession *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  currentSession = self->_currentSession;
  self->_currentSession = v4;
}

- (void)inputSource:(id)a3 didGenerateTextActionPayload:(id)a4
{
  id v5 = a4;
  v6 = [(IUISessionCoordinator *)self currentServiceSession];
  if (!v6)
  {
    v7 = sub_1000029D8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000DD1C(v7);
    }
  }
  [v6 handleTextActionPayload:v5];
}

- (id)serviceSessionPayloadDelegate
{
  v2 = [(IUISessionCoordinator *)self currentServiceSession];
  if (!v2)
  {
    v3 = sub_1000029D8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10000DDA0(v3);
    }
  }

  return v2;
}

- (id)assertionForOptions:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && ((id v6 = [v4 animated], v7 = objc_msgSend(v5, "offscreenDirection"), v7)
     || (v6 & 1) == 0))
  {
    objc_super v9 = [(IUISessionCoordinator *)self textInputSource];
    v10 = [v9 keyboardSceneDelegate];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    }
    v13 = v12;

    v8 = [v13 requestAnimationAssertionWithDirection:v7 animated:v6];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)invalidateAssertionIfNeeded:(id)a3 resetKeyboardAlpha:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4) {
    +[UIKeyboard setKeyboardAlpha:1.0];
  }
  [v5 invalidate];
}

- (id)sessionChangeQueue
{
  v3 = [(IUISessionCoordinator *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  sessionChangeQueue = self->_sessionChangeQueue;
  if (!sessionChangeQueue)
  {
    id v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v6 = self->_sessionChangeQueue;
    self->_sessionChangeQueue = v5;

    sessionChangeQueue = self->_sessionChangeQueue;
  }

  return sessionChangeQueue;
}

- (void)handlePendingSuggestionsDataIfNecessary
{
  v3 = [(IUISessionCoordinator *)self pendingSuggestions];
  BOOL v4 = [(IUISessionCoordinator *)self currentSession];
  id v5 = [v4 uuid];
  id v12 = [v3 objectForKey:v5];

  if (v12)
  {
    id v6 = [(IUISessionCoordinator *)self pendingSuggestions];
    id v7 = [(IUISessionCoordinator *)self currentSession];
    v8 = [v7 uuid];
    [v6 removeObjectForKey:v8];

    objc_super v9 = +[UITextSuggestion decodeTextSuggestions:v12];
    v10 = [(IUISessionCoordinator *)self textInputSource];
    v11 = [v10 inputDelegate];
    [v11 setSuggestions:v9];
  }
}

- (RTIInputSystemDelegate)autofillUIServiceDelegate
{
  if (!self->_autofillUIServiceDelegate
    && +[UIKeyboard supportsAutoFillPanel]
    && [(id)objc_opt_class() _useRTIInterfaceForAutoFillOnIphone])
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)qword_1000293D8;
    uint64_t v13 = qword_1000293D8;
    if (!qword_1000293D8)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10000AE98;
      v9[3] = &unk_10001C518;
      v9[4] = &v10;
      sub_10000AE98((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    BOOL v4 = v3;
    _Block_object_dispose(&v10, 8);
    id v5 = (RTIInputSystemDelegate *)objc_alloc_init(v4);
    autofillUIServiceDelegate = self->_autofillUIServiceDelegate;
    self->_autofillUIServiceDelegate = v5;
  }
  id v7 = self->_autofillUIServiceDelegate;

  return v7;
}

- (id)_main_didTeardownExistingDelegateCallback_withSessionChangeAssistant:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005CE8;
  v6[3] = &unk_10001C598;
  id v7 = a3;
  id v3 = v7;
  id v4 = [v6 copy];

  return v4;
}

- (id)_main_willSetupNewDelegateCallback_withSessionChangeAssistant:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005E00;
  v6[3] = &unk_10001C598;
  id v7 = a3;
  id v3 = v7;
  id v4 = [v6 copy];

  return v4;
}

- (void)_queue_queueSessionChange:(id)a3
{
  id v4 = a3;
  id v5 = [(IUISessionCoordinator *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 sessionChange];
  unsigned __int8 v7 = [v6 isBeginningSession];

  v8 = [v4 sessionChange];
  unsigned __int8 v9 = [v8 isEndingSession];

  uint64_t v10 = sub_100003290();
  v11 = v10;
  if (v9 & 1) != 0 || (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[IUISessionCoordinator _queue_queueSessionChange:]";
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s  Ready to handle session change: %@", buf, 0x16u);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100006074;
    v14[3] = &unk_10001C5C0;
    v14[4] = self;
    id v15 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000DE24(v4);
    }

    uint64_t v12 = [[IUISessionChangeResponse alloc] initWithResponseState:2];
    uint64_t v13 = [v4 completion];
    ((void (**)(void, IUISessionChangeResponse *))v13)[2](v13, v12);
  }
}

- (id)_main_inputSourceForChangeContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(IUIRTIInputSource);
  [(IUIRTIInputSource *)v5 setHidden:1];
  [(IUIRTIInputSource *)v5 setCanBecomeFirstResponder:0];
  id v6 = +[RTIInputSystemDataPayload payloadWithData:0];
  unsigned __int8 v7 = [v4 sessionChange];
  v8 = [v7 beginSessionDocumentTraits];
  id v9 = [v8 copy];
  [v6 setDocumentTraits:v9];

  uint64_t v10 = [v4 sessionChange];
  v11 = [v10 beginSessionDocumentState];
  id v12 = [v11 copy];
  [v6 setDocumentState:v12];

  uint64_t v13 = [v4 sessionChange];

  v14 = [v13 beginSessionID];
  id v15 = [v14 copy];
  [v6 setSessionUUID:v15];

  [v6 updateData];
  [(IUIRTIInputSource *)v5 ingestDataPayload:v6];
  v16 = [(IUISessionCoordinator *)self inputSourceViewController];
  v17 = [v16 view];
  [v17 addSubview:v5];

  [(IUIRTIInputSource *)v5 setCanBecomeFirstResponder:1];

  return v5;
}

- (id)_main_placeholderInputSourceForSession:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(IUIRTIInputSource);
  [(IUIRTIInputSource *)v5 setHidden:1];
  [(IUIRTIInputSource *)v5 setCanBecomeFirstResponder:0];
  id v6 = [v4 uuid];
  [(IUIRTIInputSource *)v5 setIdentifier:v6];

  [(IUIRTIInputSource *)v5 setPlaceholder:1];
  unsigned __int8 v7 = [v4 currentDataPayload];

  [(IUIRTIInputSource *)v5 ingestDataPayload:v7];
  v8 = [(IUISessionCoordinator *)self inputSourceViewController];
  id v9 = [v8 view];
  [v9 addSubview:v5];

  [(IUIRTIInputSource *)v5 setCanBecomeFirstResponder:1];

  return v5;
}

- (id)_main_placeholderServiceSessionWithIdentifier:(id)a3 documentTraits:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)RTIDocumentState);
  v8 = +[RTIInputSystemServiceSessionPlaceholder placeholderServiceSessionWithIdentifier:v6 traits:v5 state:v7];

  return v8;
}

- (void)_main_handleSessionChange:(id)a3
{
  id v4 = (IUISessionChangeContext *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v5 = sub_100003290();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(IUISessionChangeContext *)v4 sessionChange];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[IUISessionCoordinator _main_handleSessionChange:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  begin session change: %@", buf, 0x16u);
  }
  id v7 = [(IUISessionChangeContext *)v4 sessionChange];
  unsigned int v8 = [v7 isEndingSession];
  unsigned int v9 = [v7 isBeginningSession];
  uint64_t v10 = [(IUISessionCoordinator *)self currentSession];

  if ((v8 & (v10 != 0)) == 1)
  {
    v11 = [(IUISessionCoordinator *)self currentSession];
    id v12 = [v11 uuid];
    uint64_t v13 = [v7 endSessionID];
    unsigned int v14 = [v12 isEqual:v13];

    if (v14)
    {
      id v15 = [v7 options];
      unsigned int v16 = [v15 shouldResign];

      int v17 = v16 ^ 1;
      unsigned int v14 = 1;
    }
    else
    {
      int v17 = 0;
    }
  }
  else
  {
    int v17 = 0;
    unsigned int v14 = 0;
  }
  __int16 v18 = sub_100003290();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = "-[IUISessionCoordinator _main_handleSessionChange:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v8;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v9;
    LOWORD(v78) = 1024;
    *(_DWORD *)((char *)&v78 + 2) = v10 != 0;
    HIWORD(v78) = 1024;
    LODWORD(v79) = v14;
    WORD2(v79) = 1024;
    *(_DWORD *)((char *)&v79 + 6) = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%s  \n  changeEndsSession:   %d\n  changeBeginsSession: %d\n  hasCurrentSession:   %d\n  endingSessionMatchesCurrentSession: %d\n  createPlaceholderInputSource: %d", buf, 0x2Au);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v78 = sub_100006D00;
  *(void *)&long long v79 = sub_100006D10;
  *((void *)&v79 + 1) = 0;
  if ((v9 & (v10 != 0)) == 1)
  {
    id v19 = sub_100003290();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = [(IUISessionCoordinator *)self currentSession];
      sub_10000DFA0(v20, (uint64_t)v4, v76, v19);
    }
  }
  if (((v14 | v8 ^ 1) & 1) == 0)
  {
    v22 = sub_100003290();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v23 = [(IUISessionChangeContext *)v4 sessionChange];
      sub_10000DF34(v23, v72, v22);
    }

    v24 = [[IUISessionChangeResponse alloc] initWithResponseState:2];
    v25 = [(IUISessionChangeContext *)v4 completion];
    ((void (**)(void, IUISessionChangeResponse *))v25)[2](v25, v24);

    v26 = 0;
    goto LABEL_36;
  }
  if (v10)
  {
    v63 = [(IUISessionCoordinator *)self textInputSource];
    if (v9)
    {
LABEL_17:
      v21 = [(IUISessionCoordinator *)self _main_inputSourceForChangeContext:v4];
      v62 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    v63 = 0;
    if (v9) {
      goto LABEL_17;
    }
  }
  if (v17)
  {
    v61 = +[NSUUID UUID];
    v27 = sub_100003290();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v72 = 136315394;
      v73 = "-[IUISessionCoordinator _main_handleSessionChange:]";
      __int16 v74 = 2112;
      v75 = v61;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s  Creating placeholder service session with identifier: %@", v72, 0x16u);
    }

    v28 = [v63 sourceSession];
    v29 = [v28 documentTraits];
    id v30 = [v29 copy];

    [v30 setAutofillMode:0];
    [v30 setAutofillSubMode:0];
    [v30 setAutofillContext:0];
    id v60 = objc_alloc_init((Class)RTIDocumentState);
    uint64_t v31 = [(IUISessionCoordinator *)self _main_placeholderServiceSessionWithIdentifier:v61 documentTraits:v30];
    v32 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v31;

    v21 = [(IUISessionCoordinator *)self _main_placeholderInputSourceForSession:*(void *)(*(void *)&buf[8] + 40)];
    v33 = [IUISessionChange alloc];
    v34 = [v7 endSessionID];
    v35 = [v7 options];
    id v36 = [(IUISessionChange *)v33 initEndSessionWithID:v34 andBeginPlaceholderSessionWithID:v61 documentTraits:v30 documentState:v60 options:v35];

    v37 = [IUISessionChangeContext alloc];
    v38 = [(IUISessionChangeContext *)v4 service];
    uint64_t v39 = *(void *)(*(void *)&buf[8] + 40);
    v40 = [(IUISessionChangeContext *)v4 completion];
    v41 = [(IUISessionChangeContext *)v37 initWithService:v38 session:v39 sessionChange:v36 completion:v40];

    v42 = [v36 options];
    [v42 setShouldResign:1];
    v43 = [IUISessionChange alloc];
    v44 = [*(id *)(*(void *)&buf[8] + 40) uuid];
    id v45 = [(IUISessionChange *)v43 initEndSessionWithID:v44 options:v42];

    v46 = [IUISessionChangeContext alloc];
    v47 = [(IUISessionChangeContext *)v41 service];
    v62 = [(IUISessionChangeContext *)v46 initWithService:v47 session:*(void *)(*(void *)&buf[8] + 40) sessionChange:v45 completion:&stru_10001C600];

    id v7 = v36;
    id v4 = v41;
  }
  else
  {
    v62 = 0;
    v21 = 0;
  }
LABEL_27:
  v48 = [(IUISessionChangeContext *)v4 sessionChange];
  v49 = [v48 options];
  v50 = [(IUISessionCoordinator *)self assertionForOptions:v49];

  v51 = +[UIKeyboardImpl sharedInstance];
  v52 = [[IUISessionChangeAssistant alloc] initWithController:self sessionChangeContext:v4 outgoingInputSource:v63 incomingInputSource:v21];
  v53 = [(IUISessionCoordinator *)self _main_didTeardownExistingDelegateCallback_withSessionChangeAssistant:v52];
  v54 = [(IUISessionCoordinator *)self _main_willSetupNewDelegateCallback_withSessionChangeAssistant:v52];
  [v51 setDidTeardownExistingDelegate:v53];
  [v51 setWillSetupNewDelegate:v54];
  if (v21)
  {
    [v21 becomeFirstResponder];
  }
  else if (v63)
  {
    [v63 resignFirstResponder];
  }
  else
  {
    v55 = sub_100003290();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      sub_10000DEB4();
    }
  }
  [(IUISessionChangeAssistant *)v52 finalizeSessionChange];
  [(IUISessionCoordinator *)self invalidateAssertionIfNeeded:v50 resetKeyboardAlpha:v21 != 0];
  [(IUISessionCoordinator *)self handlePendingSuggestionsDataIfNecessary];
  [v51 setDidTeardownExistingDelegate:0];
  [v51 setWillSetupNewDelegate:0];

  if (v62)
  {
    dispatch_time_t v56 = dispatch_time(0, 50000000);
    v57 = [(IUISessionCoordinator *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006DC0;
    block[3] = &unk_10001C628;
    v26 = v62;
    v65 = (IUISessionChangeResponse *)v26;
    v66 = self;
    v67 = buf;
    dispatch_after(v56, v57, block);

    v24 = v65;
LABEL_36:

    goto LABEL_37;
  }
  v26 = 0;
LABEL_37:
  v58 = sub_100003290();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    v59 = [(IUISessionChangeContext *)v4 sessionChange];
    *(_DWORD *)v68 = 136315394;
    v69 = "-[IUISessionCoordinator _main_handleSessionChange:]";
    __int16 v70 = 2112;
    v71 = v59;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%s  finished session change: %@", v68, 0x16u);
  }
  _Block_object_dispose(buf, 8);
}

- (void)inputSystemService:(id)a3 didCreateInputSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = sub_1000029D8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "did create session %@, service: %@", buf, 0x16u);
  }

  unsigned int v9 = [(IUISessionCoordinator *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000706C;
  block[3] = &unk_10001C650;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)inputSystemService:(id)a3 inputSessionDidBegin:(id)a4
{
}

- (void)inputSystemService:(id)a3 inputSessionDidBegin:(id)a4 options:(id)a5
{
  id v8 = a3;
  unsigned int v9 = (char *)a4;
  id v10 = a5;
  id v11 = sub_1000029D8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v36 = v9;
    __int16 v37 = 2112;
    id v38 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "did begin session %@, service: %@", buf, 0x16u);
  }

  id v12 = [(IUISessionCoordinator *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007584;
  block[3] = &unk_10001C678;
  void block[4] = self;
  id v13 = v8;
  id v32 = v13;
  id v14 = v9;
  v33 = v14;
  id v15 = v10;
  id v34 = v15;
  dispatch_async(v12, block);

  if (qword_1000293D0 != -1) {
    dispatch_once(&qword_1000293D0, &stru_10001C730);
  }
  if (byte_1000293C8)
  {
    id v16 = [IUISessionChange alloc];
    __int16 v17 = [v14 uuid];
    id v18 = [v14 documentTraits];
    id v19 = [v14 documentState];
    id v20 = [(IUISessionChange *)v16 initBeginSessionWithID:v17 documentTraits:v18 documentState:v19 options:v15];

    v21 = sub_100003290();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v36 = "-[IUISessionCoordinator inputSystemService:inputSessionDidBegin:options:]";
      __int16 v37 = 2112;
      id v38 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s  queuing input session did begin: %@", buf, 0x16u);
    }

    v22 = [[IUISessionChangeContext alloc] initWithService:v13 session:v14 sessionChange:v20 completion:&stru_10001C698];
    v23 = [(IUISessionCoordinator *)self dispatchQueue];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000076E0;
    v29[3] = &unk_10001C5C0;
    v29[4] = self;
    id v30 = v22;
    v24 = v22;
    dispatch_async(v23, v29);
  }
  else
  {
    v25 = [(IUISessionCoordinator *)self dispatchQueue];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000076EC;
    v26[3] = &unk_10001C650;
    v26[4] = self;
    v27 = v14;
    id v28 = v15;
    dispatch_async(v25, v26);
  }
}

- (void)_endSession:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v11 = [(IUISessionCoordinator *)self currentSession];
  id v12 = [v11 uuid];
  id v13 = [v8 uuid];
  unsigned __int8 v14 = [v12 isEqual:v13];

  if (v14)
  {
    if ([v9 shouldResign])
    {
      id v15 = [(IUISessionCoordinator *)self assertionForOptions:v9];
      id v16 = [(IUISessionCoordinator *)self textInputSource];
      [v16 resignFirstResponder];

      [(IUISessionCoordinator *)self invalidateAssertionIfNeeded:v15 resetKeyboardAlpha:0];
      __int16 v17 = [(IUISessionCoordinator *)self textInputSource];
      [v17 setText:0];
    }
    else
    {
      [(IUISessionCoordinator *)self setNeedsToReloadInputSource:1];
    }
    v22 = [(IUISessionCoordinator *)self textInputSource];
    [v22 setCanBecomeFirstResponder:0];

    [(IUISessionCoordinator *)self setCurrentSession:0];
    +[UIKeyboard setKeyboardAlpha:1.0];
    if (v10)
    {
      id v19 = [(IUISessionCoordinator *)self dispatchQueue];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100007C48;
      v23[3] = &unk_10001C6C0;
      id v20 = &v24;
      id v24 = v10;
      v21 = v23;
      goto LABEL_11;
    }
  }
  else
  {
    id v18 = sub_1000029D8();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "ignoring inputSessionDidEnd for %@ because it's not current session", buf, 0xCu);
    }

    if (v10)
    {
      id v19 = [(IUISessionCoordinator *)self dispatchQueue];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100007C38;
      v25[3] = &unk_10001C6C0;
      id v20 = &v26;
      id v26 = v10;
      v21 = v25;
LABEL_11:
      dispatch_async(v19, v21);
    }
  }
}

- (void)inputSystemService:(id)a3 inputSessionDidEnd:(id)a4
{
}

- (void)inputSystemService:(id)a3 inputSessionDidEnd:(id)a4 options:(id)a5
{
}

- (void)inputSystemService:(id)a3 inputSessionDidEnd:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = (char *)a3;
  id v11 = (char *)a4;
  id v12 = a5;
  id v13 = a6;
  unsigned __int8 v14 = sub_1000029D8();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v50 = v11;
    __int16 v51 = 2112;
    v52 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "did end session %@, service: %@", buf, 0x16u);
  }

  id v15 = [(IUISessionCoordinator *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008178;
  block[3] = &unk_10001C678;
  void block[4] = self;
  id v16 = v10;
  v46 = v16;
  __int16 v17 = v11;
  v47 = v17;
  id v18 = v12;
  id v48 = v18;
  dispatch_async(v15, block);

  if (qword_1000293D0 != -1) {
    dispatch_once(&qword_1000293D0, &stru_10001C730);
  }
  if (byte_1000293C8)
  {
    id v19 = [IUISessionChange alloc];
    id v20 = [v17 uuid];
    v21 = [(IUISessionChange *)v19 initEndSessionWithID:v20 options:v18];

    v22 = sub_100003290();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v50 = "-[IUISessionCoordinator inputSystemService:inputSessionDidEnd:options:completion:]";
      __int16 v51 = 2112;
      v52 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s  queuing input session did end: %@", buf, 0x16u);
    }

    v23 = +[InputUIApp sharedApplication];
    id v24 = [v23 servicePausedLock];
    [v24 lock];

    if ([v23 isServicePaused])
    {
      v25 = (void (**)(void))objc_retainBlock(v13);

      id v13 = 0;
    }
    else
    {
      v25 = 0;
    }
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000082D0;
    v43[3] = &unk_10001C6E8;
    id v27 = v13;
    id v44 = v27;
    id v28 = objc_retainBlock(v43);
    id v34 = v16;
    v29 = [[IUISessionChangeContext alloc] initWithService:v16 session:v17 sessionChange:v21 completion:v28];
    id v30 = [(IUISessionCoordinator *)self dispatchQueue];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000082E8;
    v41[3] = &unk_10001C5C0;
    v41[4] = self;
    v42 = v29;
    uint64_t v31 = v29;
    dispatch_async(v30, v41);

    id v32 = [v23 servicePausedLock];
    [v32 unlock];

    if (v25)
    {
      v33 = sub_100003290();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v50 = "-[IUISessionCoordinator inputSystemService:inputSessionDidEnd:options:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s  InputUI service is paused: calling end input session completion immediately", buf, 0xCu);
      }

      v25[2](v25);
    }

    id v16 = v34;
  }
  else
  {
    id v26 = [(IUISessionCoordinator *)self dispatchQueue];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000082F4;
    v35[3] = &unk_10001C710;
    id v36 = v17;
    __int16 v37 = v16;
    id v38 = self;
    id v39 = v18;
    id v27 = v13;
    id v40 = v27;
    dispatch_async(v26, v35);

    v21 = v36;
  }
}

- (void)inputSystemService:(id)a3 inputSessionDidDie:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000029D8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "session %@ did die, service: %@", buf, 0x16u);
  }

  id v9 = [(IUISessionCoordinator *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000857C;
  block[3] = &unk_10001C650;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)inputSystemService:(id)a3 inputSessionDocumentDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000029D8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "did change document for session %@, service: %@", buf, 0x16u);
  }

  id v9 = [(IUISessionCoordinator *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008810;
  block[3] = &unk_10001C650;
  id v13 = v7;
  id v14 = v6;
  id v15 = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)inputSystemService:(id)a3 inputSession:(id)a4 documentTraitsDidChange:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1000029D8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "did change document traits for session %@, service: %@", buf, 0x16u);
  }

  id v12 = [(IUISessionCoordinator *)self dispatchQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100008B94;
  v16[3] = &unk_10001C678;
  id v17 = v9;
  id v18 = v8;
  id v19 = self;
  id v20 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(v12, v16);
}

- (void)inputSystemService:(id)a3 inputSession:(id)a4 documentStateDidChange:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1000029D8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "did change document state for session %@, service: %@", buf, 0x16u);
  }

  id v12 = [(IUISessionCoordinator *)self dispatchQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100008F20;
  v16[3] = &unk_10001C678;
  id v17 = v9;
  id v18 = v8;
  id v19 = self;
  id v20 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(v12, v16);
}

- (void)inputSystemService:(id)a3 inputSession:(id)a4 textSuggestionsChanged:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1000029D8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "did change text suggestions for session %@, service: %@", buf, 0x16u);
  }

  id v12 = [(IUISessionCoordinator *)self dispatchQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000092AC;
  v16[3] = &unk_10001C678;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)inputSystemService:(id)a3 inputSession:(id)a4 performInputOperation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1000029D8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "did receive input operation from session %@, service: %@", buf, 0x16u);
  }

  id v12 = [(IUISessionCoordinator *)self dispatchQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100009720;
  v16[3] = &unk_10001C678;
  id v17 = v9;
  id v18 = v8;
  id v19 = self;
  id v20 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(v12, v16);
}

- (void)inputSystemService:(id)a3 inputSession:(id)a4 performInputOperation:(id)a5 withResponse:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_1000029D8();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v11;
    __int16 v27 = 2112;
    id v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "did receive input from session %@, service: %@", buf, 0x16u);
  }

  id v15 = [(IUISessionCoordinator *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009BEC;
  block[3] = &unk_10001C710;
  void block[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  dispatch_async(v15, block);
}

- (void)inputSystemService:(id)a3 inputSessionDidPause:(id)a4 withReason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1000029D8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "did pause session %@, service: %@", buf, 0x16u);
  }

  id v12 = [(IUISessionCoordinator *)self dispatchQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000A0B8;
  v16[3] = &unk_10001C678;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)inputSystemService:(id)a3 inputSessionDidUnpause:(id)a4 withReason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1000029D8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "did unpause session %@, service: %@", buf, 0x16u);
  }

  id v12 = [(IUISessionCoordinator *)self dispatchQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000A398;
  v16[3] = &unk_10001C678;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)inputSystemService:(id)a3 inputSession:(id)a4 didAddRTISupplementalLexicon:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1000029D8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "did add RTI supplemental lexicon for session %@, service: %@", buf, 0x16u);
  }

  id v12 = [(IUISessionCoordinator *)self dispatchQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000A678;
  v16[3] = &unk_10001C678;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)inputSystemService:(id)a3 inputSession:(id)a4 didRemoveRTISupplementalLexicon:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1000029D8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "did remove RTI supplemental lexicon for session %@, service: %@", buf, 0x16u);
  }

  id v12 = [(IUISessionCoordinator *)self dispatchQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000AAAC;
  v16[3] = &unk_10001C678;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (IUIRTIInputSource)textInputSource
{
  return self->_textInputSource;
}

- (void)setTextInputSource:(id)a3
{
}

- (RTIInputSystemServiceSession)currentSession
{
  return self->_currentSession;
}

- (IUIInputSourceViewController)inputSourceViewController
{
  return self->_inputSourceViewController;
}

- (void)setInputSourceViewController:(id)a3
{
}

- (BOOL)needsToReloadInputSource
{
  return self->_needsToReloadInputSource;
}

- (void)setNeedsToReloadInputSource:(BOOL)a3
{
  self->_needsToReloadInputSource = a3;
}

- (void)setAutofillUIServiceDelegate:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSMutableDictionary)pendingSuggestions
{
  return self->_pendingSuggestions;
}

- (void)setPendingSuggestions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSuggestions, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_autofillUIServiceDelegate, 0);
  objc_storeStrong((id *)&self->_inputSourceViewController, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_textInputSource, 0);

  objc_storeStrong((id *)&self->_sessionChangeQueue, 0);
}

@end