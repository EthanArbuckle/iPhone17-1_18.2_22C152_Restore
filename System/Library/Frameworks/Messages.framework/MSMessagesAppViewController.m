@interface MSMessagesAppViewController
- (BOOL)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4;
- (BOOL)_isAppleInternalAppAndWantsSafeAreaInsets;
- (BOOL)_isInsideUserGeneratedStickerExtension;
- (BOOL)_ms_isInSheet;
- (BOOL)_presentationStyleIsFullScreenModal:(unint64_t)a3;
- (BOOL)displaysAfterAppearance;
- (BOOL)isReadyForDisplay;
- (BOOL)needsSizeMatchBeforeSnapshotSwap;
- (BOOL)providesExplicitSizeSnapshot;
- (BOOL)viewHasAppeared;
- (CGRect)initialFrameBeforeAppearance;
- (MSConversation)activeConversation;
- (MSMessagesAppPresentationContext)presentationContext;
- (MSMessagesAppPresentationStyle)presentationStyle;
- (MSMessagesAppViewController)init;
- (MSMessagesAppViewController)initWithCoder:(id)a3;
- (MSMessagesAppViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3;
- (UIEdgeInsets)_balloonMaskEdgeInsets;
- (UIEdgeInsets)additionalSafeAreaInsets;
- (_MSMessageComposeExtensionImplProtocol)appContext;
- (_MSMessagesAppPresentationControllerDelegate)sheetPresentationControllerDelegate;
- (double)_percentExpanded;
- (void)_addStickerAnimationDidFinishWithCompletion:(id)a3;
- (void)_addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4;
- (void)_addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4;
- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5;
- (void)_balloonMaskEdgeInsets;
- (void)_conversation:(id)a3 didSelectMessage:(id)a4;
- (void)_conversation:(id)a3 willSelectMessage:(id)a4;
- (void)_dismissAndPresentPhotosApp;
- (void)_emojiStickerDragEnded;
- (void)_emojiStickerDragStarted;
- (void)_prepareForPresentationWithCompletionHandler:(id)a3;
- (void)_presentAlertSheetWith:(id)a3 styles:(id)a4 completion:(id)a5;
- (void)_presentAlertSheetWithTitle:(id)a3 message:(id)a4 buttonTitles:(id)a5 styles:(id)a6 completion:(id)a7;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 destructiveButtonTitle:(id)a6 completion:(id)a7;
- (void)_presentContextMenuWithButtonTitles:(id)a3 imageNames:(id)a4 buttonFrame:(CGRect)a5 completion:(id)a6;
- (void)_requestFullScreenModalPresentationWithSize:(CGSize)a3;
- (void)_requestHostSceneIdentifierWithCompletion:(id)a3;
- (void)_setAppPresentationStyle:(unint64_t)a3;
- (void)_setContentOverlayInsets:(UIEdgeInsets)a3;
- (void)_setPluginIdentifierToShow:(id)a3 completion:(id)a4;
- (void)_setUpEmojiDragNotificationObservers;
- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 associatedText:(id)a5 completionHandler:(id)a6;
- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 completionHandler:(id)a5;
- (void)addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5;
- (void)contentDidLoad;
- (void)dealloc;
- (void)dismiss;
- (void)generateSnapshotWithContentSize:(CGSize)a3 completion:(id)a4;
- (void)requestPresentationStyle:(MSMessagesAppPresentationStyle)presentationStyle;
- (void)requestPresentationWithStickerType:(id)a3 identifier:(id)a4;
- (void)requestResize;
- (void)requestStickerExtensionMetadataDictionary:(id)a3;
- (void)setActiveConversation:(id)a3;
- (void)setAppContext:(id)a3;
- (void)setInitialFrameBeforeAppearance:(CGRect)a3;
- (void)setIsReadyForDisplay:(BOOL)a3;
- (void)setNeedsSizeMatchBeforeSnapshotSwap;
- (void)setNeedsSizeMatchBeforeSnapshotSwap:(BOOL)a3;
- (void)setProvidesExplicitSizeSnapshot;
- (void)setProvidesExplicitSizeSnapshot:(BOOL)a3;
- (void)setReadyForDisplay;
- (void)setSheetPresentationControllerDelegate:(id)a3;
- (void)setViewHasAppeared:(BOOL)a3;
- (void)updateSnapshotWithCompletionBlock:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)willTransitionToPresentationStyle:(MSMessagesAppPresentationStyle)presentationStyle;
@end

@implementation MSMessagesAppViewController

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[MSMessagesAppViewController dealloc]";
  _os_log_debug_impl(&dword_1E4A76000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v8 = _MSMainBundleIdentifier();
  if ([v8 isEqualToString:@"com.gamerdelights.gamepigeon.ext"])
  {
    char v9 = dyld_program_sdk_at_least();

    if ((v9 & 1) == 0)
    {
      int v10 = IMSharedHelperDeviceIsiPad();
      BOOL v11 = bottom == 34.0 && top == 34.0;
      double v12 = 0.0;
      if (!v11) {
        double v12 = top;
      }
      if (v10) {
        double top = v12;
      }
    }
  }
  else
  {
  }
  v13.receiver = self;
  v13.super_class = (Class)MSMessagesAppViewController;
  -[MSMessagesAppViewController _setContentOverlayInsets:](&v13, sel__setContentOverlayInsets_, top, left, bottom, right);
  -[MSMessagesAppViewController _setNavigationControllerContentInsetAdjustment:](self, "_setNavigationControllerContentInsetAdjustment:", top, 0.0, bottom, 0.0);
}

- (MSMessagesAppViewController)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MSMessagesAppViewController;
  uint64_t v3 = [(MSMessagesAppViewController *)&v7 initWithCoder:a3];
  if (v3)
  {
    v4 = [[_MSMessagesAppPresentationControllerDelegate alloc] initWithMessagesAppViewController:v3];
    sheetPresentationControllerDelegate = v3->_sheetPresentationControllerDelegate;
    v3->_sheetPresentationControllerDelegate = v4;

    [(MSMessagesAppViewController *)v3 _setUpEmojiDragNotificationObservers];
  }
  return v3;
}

- (MSMessagesAppViewController)init
{
  return [(MSMessagesAppViewController *)self initWithShouldBeSheetPresentationControllerDelegate:1];
}

- (MSMessagesAppViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSMessagesAppViewController;
  v4 = [(MSMessagesAppViewController *)&v8 init];
  if (v4)
  {
    if (v3)
    {
      v5 = [[_MSMessagesAppPresentationControllerDelegate alloc] initWithMessagesAppViewController:v4];
      sheetPresentationControllerDelegate = v4->_sheetPresentationControllerDelegate;
      v4->_sheetPresentationControllerDelegate = v5;
    }
    [(MSMessagesAppViewController *)v4 _setUpEmojiDragNotificationObservers];
  }
  return v4;
}

- (_MSMessageComposeExtensionImplProtocol)appContext
{
  appContext = self->_appContext;
  if (appContext)
  {
    BOOL v3 = appContext;
  }
  else
  {
    BOOL v3 = [(MSMessagesAppViewController *)self extensionContext];
  }

  return v3;
}

- (void)_setUpEmojiDragNotificationObservers
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__emojiStickerDragStarted name:*MEMORY[0x1E4F43B60] object:0];
  [v3 addObserver:self selector:sel__emojiStickerDragEnded name:*MEMORY[0x1E4F43B78] object:0];
  [v3 addObserver:self selector:sel__emojiStickerDragEnded name:*MEMORY[0x1E4F43B68] object:0];
}

- (void)_emojiStickerDragStarted
{
  id v3 = [(MSMessagesAppViewController *)self activeConversation];
  v2 = [v3 context];
  [v2 stickerDruidDragStarted];
}

- (void)_emojiStickerDragEnded
{
  id v3 = [(MSMessagesAppViewController *)self activeConversation];
  v2 = [v3 context];
  [v2 stickerDruidDragEndedWithPayload:0];
}

- (void)_conversation:(id)a3 willSelectMessage:(id)a4
{
  if (a3)
  {
    if (a4) {
      [(MSMessagesAppViewController *)self willSelectMessage:a4 conversation:a3];
    }
  }
}

- (void)_conversation:(id)a3 didSelectMessage:(id)a4
{
  if (a3)
  {
    if (a4) {
      [(MSMessagesAppViewController *)self didSelectMessage:a4 conversation:a3];
    }
  }
}

- (void)requestPresentationStyle:(MSMessagesAppPresentationStyle)presentationStyle
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = ms_defaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (presentationStyle > MSMessagesAppPresentationStyleTranscript) {
      v6 = @"Other";
    }
    else {
      v6 = off_1E6E987D0[presentationStyle];
    }
    int v8 = 138412290;
    char v9 = v6;
    _os_log_impl(&dword_1E4A76000, v5, OS_LOG_TYPE_DEFAULT, "Requesting presentation style %@", (uint8_t *)&v8, 0xCu);
  }

  objc_super v7 = [(MSMessagesAppViewController *)self appContext];
  [v7 requestPresentationStyle:presentationStyle];
}

- (MSMessagesAppPresentationStyle)presentationStyle
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [(MSMessagesAppViewController *)self appContext];
  MSMessagesAppPresentationStyle v3 = [v2 presentationStyle];

  v4 = ms_defaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3 > MSMessagesAppPresentationStyleTranscript) {
      v5 = @"Other";
    }
    else {
      v5 = off_1E6E987D0[v3];
    }
    int v7 = 138412290;
    int v8 = v5;
    _os_log_impl(&dword_1E4A76000, v4, OS_LOG_TYPE_DEFAULT, "Getting presentation style %@", (uint8_t *)&v7, 0xCu);
  }

  return v3;
}

- (MSMessagesAppPresentationContext)presentationContext
{
  v2 = [(MSMessagesAppViewController *)self appContext];
  MSMessagesAppPresentationContext v3 = [v2 presentationContext];

  return v3;
}

- (void)requestStickerExtensionMetadataDictionary:(id)a3
{
  id v4 = a3;
  v5 = ms_defaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_1E4A76000, v5, OS_LOG_TYPE_DEFAULT, "Requesting Sticker Extension Metadata", v7, 2u);
  }

  v6 = [(MSMessagesAppViewController *)self appContext];
  [v6 _requestStickerExtensionMetadataDictionary:v4];
}

- (void)requestPresentationWithStickerType:(id)a3 identifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = ms_defaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218242;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1E4A76000, v8, OS_LOG_TYPE_DEFAULT, "Requesting presentation of string app with type: %ld and identifier %@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v9 = [(MSMessagesAppViewController *)self appContext];
  [v9 _requestPresentationWithStickerType:v6 identifier:v7];
}

- (void)generateSnapshotWithContentSize:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void))a4;
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v32.size.double width = width;
  v32.size.double height = height;
  if (CGRectIsEmpty(v32))
  {
    int v8 = ms_defaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[MSMessagesAppViewController generateSnapshotWithContentSize:completion:]";
      _os_log_impl(&dword_1E4A76000, v8, OS_LOG_TYPE_DEFAULT, "%s Not taking a new snapshot because bounds were empty", buf, 0xCu);
    }

    v7[2](v7, 0);
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F42D90] mainScreen];
    [v9 scale];
    CGFloat v11 = v10;
    v30.double width = width;
    v30.double height = height;
    UIGraphicsBeginImageContextWithOptions(v30, 1, v11);

    __int16 v12 = [(MSMessagesAppViewController *)self view];
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    id v13 = (unsigned int (*)(uint64_t))getCKIsRunningInMacCatalystSymbolLoc_ptr;
    v25 = getCKIsRunningInMacCatalystSymbolLoc_ptr;
    if (!getCKIsRunningInMacCatalystSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getCKIsRunningInMacCatalystSymbolLoc_block_invoke;
      v27 = &unk_1E6E98778;
      v28 = &v22;
      uint64_t v14 = (void *)ChatKitLibrary();
      v15 = dlsym(v14, "CKIsRunningInMacCatalyst");
      *(void *)(v28[1] + 24) = v15;
      getCKIsRunningInMacCatalystSymbolLoc_ptr = *(_UNKNOWN **)(v28[1] + 24);
      id v13 = (unsigned int (*)(uint64_t))v23[3];
    }
    _Block_object_dispose(&v22, 8);
    if (!v13)
    {
      -[MSMessagesAppViewController generateSnapshotWithContentSize:completion:]();
      __break(1u);
    }
    BOOL v17 = v13(v16) != 0;
    int v18 = objc_msgSend(v12, "drawViewHierarchyInRect:afterScreenUpdates:", v17, 0.0, 0.0, width, height, v22);

    if (v18)
    {
      v19 = UIGraphicsGetImageFromCurrentImageContext();
    }
    else
    {
      v19 = 0;
    }
    UIGraphicsEndImageContext();
    v20 = ms_defaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v31.double width = width;
      v31.double height = height;
      v21 = NSStringFromCGSize(v31);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[MSMessagesAppViewController generateSnapshotWithContentSize:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2112;
      v27 = v19;
      _os_log_impl(&dword_1E4A76000, v20, OS_LOG_TYPE_DEFAULT, "%s Took new snapshot with size %@. snapshotImage: %@", buf, 0x20u);
    }
    ((void (**)(id, void *))v7)[2](v7, v19);
  }
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  id v9 = a3;
  id v4 = [(MSMessagesAppViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  -[MSMessagesAppViewController generateSnapshotWithContentSize:completion:](self, "generateSnapshotWithContentSize:completion:", v9, v6, v8);
}

- (BOOL)_isAppleInternalAppAndWantsSafeAreaInsets
{
  v2 = _MSMainBundleIdentifier();
  if ([v2 hasPrefix:@"com.apple."])
  {
    MSMessagesAppPresentationContext v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v4 = [v3 infoDictionary];
    double v5 = [v4 objectForKeyedSubscript:@"MSMessagesOverlayAppearanceDisableInsetsForGrabber"];
    char v6 = [v5 BOOLValue];
  }
  else
  {
    char v6 = dyld_program_sdk_at_least();
  }

  return v6;
}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  if ([(MSMessagesAppViewController *)self _isAppleInternalAppAndWantsSafeAreaInsets]&& [(MSMessagesAppViewController *)self _ms_isInSheet])
  {
    double v3 = 0.0;
    double v4 = 20.0;
    double v5 = 0.0;
    double v6 = 0.0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MSMessagesAppViewController;
    [(MSMessagesAppViewController *)&v7 additionalSafeAreaInsets];
  }
  result.double right = v6;
  result.double bottom = v5;
  result.double left = v3;
  result.double top = v4;
  return result;
}

- (BOOL)_ms_isInSheet
{
  if ([(MSMessagesAppViewController *)self presentationStyle] == MSMessagesAppPresentationStyleTranscript) {
    return 0;
  }
  double v4 = [(MSMessagesAppViewController *)self traitCollection];
  BOOL v3 = [v4 _presentationSemanticContext] == 2;

  return v3;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)MSMessagesAppViewController;
  [(MSMessagesAppViewController *)&v10 viewDidLoad];
  BOOL v3 = [(MSMessagesAppViewController *)self view];
  double v4 = [v3 layer];
  [v4 setHitTestsAsOpaque:1];

  double v5 = [(MSMessagesAppViewController *)self view];
  id v6 = [v5 backgroundColor];
  double Alpha = CGColorGetAlpha((CGColorRef)[v6 CGColor]);

  if (Alpha <= 0.1)
  {
    double v8 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
    id v9 = [(MSMessagesAppViewController *)self view];
    [v9 setBackgroundColor:v8];
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSMessagesAppViewController;
  [(MSMessagesAppViewController *)&v9 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  sheetPresentationControllerDelegate = self->_sheetPresentationControllerDelegate;
  if (sheetPresentationControllerDelegate)
  {
    double v8 = [v6 _rootSheetPresentationController];
    [v8 setDelegate:sheetPresentationControllerDelegate];
  }
}

- (void)setInitialFrameBeforeAppearance:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_initialFrameBeforeAppearance = a3;
  if (!CGRectEqualToRect(a3, *MEMORY[0x1E4F1DB28]))
  {
    id v8 = [(MSMessagesAppViewController *)self view];
    objc_msgSend(v8, "setFrame:", x, y, width, height);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MSMessagesAppViewController;
  [(MSMessagesAppViewController *)&v4 viewWillAppear:a3];
  -[MSMessagesAppViewController setInitialFrameBeforeAppearance:](self, "setInitialFrameBeforeAppearance:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MSMessagesAppViewController;
  [(MSMessagesAppViewController *)&v4 viewDidAppear:a3];
  if ([(MSMessagesAppViewController *)self displaysAfterAppearance]) {
    [(MSMessagesAppViewController *)self setReadyForDisplay];
  }
  if (![(MSMessagesAppViewController *)self viewHasAppeared]) {
    [(MSMessagesAppViewController *)self setViewHasAppeared:1];
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v2.receiver = self;
  v2.super_class = (Class)MSMessagesAppViewController;
  [(MSMessagesAppViewController *)&v2 viewSafeAreaInsetsDidChange];
}

- (BOOL)displaysAfterAppearance
{
  return 1;
}

- (void)setProvidesExplicitSizeSnapshot
{
  if (![(MSMessagesAppViewController *)self providesExplicitSizeSnapshot])
  {
    BOOL v3 = [(MSMessagesAppViewController *)self appContext];
    [v3 _remoteViewProvidesExplicitSizeSnapshot];

    [(MSMessagesAppViewController *)self setProvidesExplicitSizeSnapshot:1];
  }
}

- (void)setNeedsSizeMatchBeforeSnapshotSwap
{
  if (![(MSMessagesAppViewController *)self needsSizeMatchBeforeSnapshotSwap])
  {
    BOOL v3 = [(MSMessagesAppViewController *)self appContext];
    [v3 _remoteViewNeedsSizeMatchBeforeSnapshotSwap];

    [(MSMessagesAppViewController *)self setNeedsSizeMatchBeforeSnapshotSwap:1];
  }
}

- (void)setReadyForDisplay
{
  if (![(MSMessagesAppViewController *)self isReadyForDisplay])
  {
    BOOL v3 = [(MSMessagesAppViewController *)self appContext];
    [v3 _remoteViewDidBecomeReadyForDisplay];

    [(MSMessagesAppViewController *)self setIsReadyForDisplay:1];
  }
}

- (void)requestResize
{
  id v2 = [(MSMessagesAppViewController *)self appContext];
  [v2 requestResize];
}

- (void)contentDidLoad
{
  id v2 = [(MSMessagesAppViewController *)self appContext];
  [v2 contentDidLoad];
}

- (UIEdgeInsets)_balloonMaskEdgeInsets
{
  id v2 = [(MSMessagesAppViewController *)self activeConversation];
  BOOL v3 = [v2 selectedMessage];
  uint64_t v4 = [v3 isFromMe];

  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2050000000;
  double v5 = (void *)getCKUIBehaviorClass_softClass;
  uint64_t v26 = getCKUIBehaviorClass_softClass;
  if (!getCKUIBehaviorClass_softClass)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __getCKUIBehaviorClass_block_invoke;
    v22[3] = &unk_1E6E98778;
    v22[4] = &v23;
    __getCKUIBehaviorClass_block_invoke((uint64_t)v22);
    double v5 = (void *)v24[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v23, 8);
  objc_super v7 = IMLogHandleForCategory();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(MSMessagesAppViewController *)v6 _balloonMaskEdgeInsets];
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[MSMessagesAppViewController _balloonMaskEdgeInsets]();
  }

  objc_super v9 = [(objc_class *)v6 sharedBehaviors];
  [v9 pluginBalloonInsetsForMessageFromMe:v4];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.double right = v21;
  result.double bottom = v20;
  result.double left = v19;
  result.double top = v18;
  return result;
}

- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 completionHandler:(id)a5
{
}

- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 associatedText:(id)a5 completionHandler:(id)a6
{
}

- (BOOL)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4
{
  return 0;
}

- (void)_prepareForPresentationWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(MSMessagesAppViewController *)self appContext];
  [v14 presentAlertWithTitle:v13 message:v12 buttonTitle:v11 completion:v10];
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 destructiveButtonTitle:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(MSMessagesAppViewController *)self appContext];
  [v17 presentAlertWithTitle:v16 message:v15 buttonTitle:v14 destructiveButtonTitle:v13 completion:v12];
}

- (void)_presentAlertSheetWith:(id)a3 styles:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MSMessagesAppViewController *)self appContext];
  [v11 presentAlertSheetWith:v10 styles:v9 completion:v8];
}

- (void)_presentContextMenuWithButtonTitles:(id)a3 imageNames:(id)a4 buttonFrame:(CGRect)a5 completion:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(MSMessagesAppViewController *)self appContext];
  objc_msgSend(v16, "presentContextMenuWithButtonTitles:imageNames:buttonFrame:completion:", v15, v14, v13, x, y, width, height);
}

- (void)_presentAlertSheetWithTitle:(id)a3 message:(id)a4 buttonTitles:(id)a5 styles:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(MSMessagesAppViewController *)self appContext];
  [v17 presentAlertSheetWithTitle:v16 message:v15 buttonTitles:v14 styles:v13 completion:v12];
}

- (void)_requestHostSceneIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MSMessagesAppViewController *)self appContext];
  [v5 requestHostSceneIdentifierWithCompletion:v4];
}

- (BOOL)_presentationStyleIsFullScreenModal:(unint64_t)a3
{
  return a3 == 3;
}

- (void)_setAppPresentationStyle:(unint64_t)a3
{
  id v4 = [(MSMessagesAppViewController *)self appContext];
  [v4 setPresentationStyle:a3];
}

- (void)_requestFullScreenModalPresentationWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(MSMessagesAppViewController *)self appContext];
  objc_msgSend(v5, "requestFullScreenModalPresentationWithSize:", width, height);
}

- (double)_percentExpanded
{
  BOOL v3 = [(MSMessagesAppViewController *)self view];
  id v4 = [v3 window];

  id v5 = [v4 _rootSheetPresentationController];
  id v6 = [v5 _detentValues];
  if ((unint64_t)[v6 count] > 1)
  {
    id v8 = [(MSMessagesAppViewController *)self view];
    [v8 bounds];
    double v10 = v9;
    id v11 = [(MSMessagesAppViewController *)self view];
    [v11 safeAreaInsets];
    double v13 = v10 - v12;
    id v14 = [v6 objectAtIndexedSubscript:1];
    [v14 doubleValue];
    double v16 = v15;
    id v17 = [v6 objectAtIndexedSubscript:0];
    [v17 doubleValue];
    double v7 = (v13 - v16) / (v18 - v16);
  }
  else if ([(MSMessagesAppViewController *)self presentationStyle] == MSMessagesAppPresentationStyleExpanded)
  {
    double v7 = 1.0;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (CGRect)initialFrameBeforeAppearance
{
  double x = self->_initialFrameBeforeAppearance.origin.x;
  double y = self->_initialFrameBeforeAppearance.origin.y;
  double width = self->_initialFrameBeforeAppearance.size.width;
  double height = self->_initialFrameBeforeAppearance.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (MSConversation)activeConversation
{
  return self->_activeConversation;
}

- (void)setActiveConversation:(id)a3
{
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
}

- (_MSMessagesAppPresentationControllerDelegate)sheetPresentationControllerDelegate
{
  return self->_sheetPresentationControllerDelegate;
}

- (void)setSheetPresentationControllerDelegate:(id)a3
{
}

- (void)setAppContext:(id)a3
{
}

- (BOOL)isReadyForDisplay
{
  return self->_isReadyForDisplay;
}

- (void)setIsReadyForDisplay:(BOOL)a3
{
  self->_isReadyForDispladouble y = a3;
}

- (BOOL)providesExplicitSizeSnapshot
{
  return self->_providesExplicitSizeSnapshot;
}

- (void)setProvidesExplicitSizeSnapshot:(BOOL)a3
{
  self->_providesExplicitSizeSnapshot = a3;
}

- (BOOL)needsSizeMatchBeforeSnapshotSwap
{
  return self->_needsSizeMatchBeforeSnapshotSwap;
}

- (void)setNeedsSizeMatchBeforeSnapshotSwap:(BOOL)a3
{
  self->_needsSizeMatchBeforeSnapshotSwap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_sheetPresentationControllerDelegate, 0);

  objc_storeStrong((id *)&self->_activeConversation, 0);
}

- (void)dismiss
{
  id v2 = [(MSMessagesAppViewController *)self appContext];
  [v2 dismiss];
}

- (void)willTransitionToPresentationStyle:(MSMessagesAppPresentationStyle)presentationStyle
{
  BOOL v4 = [(MSMessagesAppViewController *)self _isInsideUserGeneratedStickerExtension];
  if (presentationStyle == MSMessagesAppPresentationStyleCompact && v4)
  {
    objc_msgSend(MEMORY[0x1E4F42D40], "_ms_currentFirstResponder");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v5 resignFirstResponder];
  }
}

- (BOOL)_isInsideUserGeneratedStickerExtension
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = +[_MSMessageAppContext activeExtensionContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    BOOL v3 = objc_msgSend(v2, "inputItems", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = [*(id *)(*((void *)&v13 + 1) + 8 * i) userInfo];
          double v9 = [v8 objectForKeyedSubscript:@"context-is-sue"];
          char v10 = [v9 isEqual:&unk_1F406F0C0];

          if (v10)
          {
            BOOL v11 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 0;
LABEL_13:
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_dismissAndPresentPhotosApp
{
  id v2 = [(MSMessagesAppViewController *)self appContext];
  [v2 dismissAndPresentPhotosApp];
}

- (void)_setPluginIdentifierToShow:(id)a3 completion:(id)a4
{
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F281F8];
  id v7 = a4;
  id v8 = [v5 errorWithDomain:v6 code:3328 userInfo:0];
  (*((void (**)(id, id, double, double, double, double))a4 + 2))(v7, v8, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F281F8];
  id v7 = a4;
  id v8 = [v5 errorWithDomain:v6 code:3328 userInfo:0];
  (*((void (**)(id, void, id, double, double, double, double))a4 + 2))(v7, 0, v8, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
}

- (void)addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F281F8];
  id v8 = a5;
  id v9 = [v6 errorWithDomain:v7 code:3328 userInfo:0];
  (*((void (**)(id, void, id))a5 + 2))(v8, 0, v9);
}

- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  BOOL v11 = (void (**)(id, void, void *))a5;
  if (objc_opt_respondsToSelector())
  {
    double v12 = [v13 representations];
    -[MSMessagesAppViewController _addStickerToStoreWithRepresentations:sourceRect:effect:completion:](self, "_addStickerToStoreWithRepresentations:sourceRect:effect:completion:", v12, [v13 effectType], v11, x, y, width, height);
  }
  else
  {
    double v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
    v11[2](v11, 0, v12);
  }
}

- (void)_addStickerAnimationDidFinishWithCompletion:(id)a3
{
}

- (uint64_t)generateSnapshotWithContentSize:completion:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[MSMessagesAppViewController _balloonMaskEdgeInsets](v0);
}

- (void)_balloonMaskEdgeInsets
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = NSStringFromClass(a1);
  int v4 = 138413058;
  uint64_t v5 = v3;
  __int16 v6 = 2080;
  OUTLINED_FUNCTION_0();
  uint64_t v7 = "/Library/Caches/com.apple.xbs/Sources/Messages/ChatKit/Messages/Messages/Source/Extension/MSMessagesAppViewController.m";
  _os_log_debug_impl(&dword_1E4A76000, a2, OS_LOG_TYPE_DEBUG, "Loaded weak linked class: '%@': %s:%i (%s)", (uint8_t *)&v4, 0x26u);
}

@end