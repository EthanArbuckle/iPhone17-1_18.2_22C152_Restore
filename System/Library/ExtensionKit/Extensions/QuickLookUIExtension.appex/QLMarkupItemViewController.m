@interface QLMarkupItemViewController
- (BOOL)_allowEditingContent:(id)a3;
- (BOOL)_isPreviewingUnconvertedDocument;
- (BOOL)_presentationModeSupportsMarkup:(unint64_t)a3;
- (BOOL)autofillDetected;
- (BOOL)canEnterFullScreen;
- (BOOL)canOfferFormFillingForOriginalDocument;
- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3;
- (BOOL)canPinchToDismiss;
- (BOOL)canShowFormFillingBanner;
- (BOOL)canShowMarkupButton;
- (BOOL)canShowToolBar;
- (BOOL)controller:(id)a3 shouldOpenLinkAtURL:(id)a4;
- (BOOL)didDismissFormFillingBanner;
- (BOOL)didReceiveFormFillingCallback;
- (BOOL)editorCanShowWhileLocked:(id)a3;
- (BOOL)editorShouldAllowEditingContents:(id)a3;
- (BOOL)formDetectedInDocument;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasChangesToRedo;
- (BOOL)hasChangesToUndo;
- (BOOL)needsToSaveChanges;
- (BOOL)saveChangesIfNeededNotifyHost:(BOOL)a3 forceNotifyHost:(BOOL)a4 saveHandler:(id)a5;
- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4;
- (BOOL)shouldAllowEditingContents;
- (BOOL)shouldDisplayAlternateEditButton;
- (BOOL)supportsChromeless;
- (CGRect)markupContentFrame;
- (NSDictionary)writeOptionsForSaving;
- (NSNumber)contentsAllowsEditingContents;
- (NSTimer)saveEditsPeriodicallyTimer;
- (NSURL)urlForDocumentWorkflows;
- (QLDelegateProxy)pdfDocumentDelegateProxy;
- (QLOriginalDateFormatProvider)originalDateFormatProvider;
- (QuickLookContentEditor)markupViewController;
- (SYDocumentAttributes)originalDocumentAttributes;
- (SYDocumentWorkflowsClient)documentWorkflowsClient;
- (SYLastModifiedDocumentAttributes)latestDocumentAttributes;
- (double)topInset;
- (id)_formFillingBannerConfiguration;
- (id)_showLatestBannerConfiguration;
- (id)_showOriginalBannerConfiguration;
- (id)configurationForBanner;
- (id)toolbarButtonsForTraitCollection:(id)a3;
- (id)transitioningView;
- (int64_t)currentEditNumber;
- (void)_fetchDocumentAttributes;
- (void)_notifyHostWithEditedCopy:(id)a3 hostCompletionHandler:(id)a4;
- (void)_saveChangesNotifyingHost:(BOOL)a3;
- (void)_saveChangesNotifyingHost:(BOOL)a3 forceNotifyHost:(BOOL)a4;
- (void)_saveChangesNotifyingHost:(BOOL)a3 forceNotifyHost:(BOOL)a4 completionHandler:(id)a5;
- (void)_saveChangesNotifyingHostOnEditsQueue:(BOOL)a3 forceNotifyHost:(BOOL)a4 completionHandler:(id)a5;
- (void)_saveChangesWithEditedCopy:(id)a3 notifyHost:(BOOL)a4 completionHandler:(id)a5;
- (void)_setupPresentationMode:(unint64_t)a3;
- (void)_stopFormFilling;
- (void)_updateBannerVisibility;
- (void)_updatePencilSupportForPresentationModeIfNeeded:(unint64_t)a3;
- (void)_updatePreferredContentSizeWithData:(id)a3;
- (void)_updatePreferredContentSizeWithURL:(id)a3;
- (void)_updateToolbarVisibilityAnimated:(BOOL)a3;
- (void)actionSheetDidDismiss;
- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)controllerWantsToShowShareSheet:(id)a3;
- (void)documentMenuActionWillBegin;
- (void)editDetectedForMarkupViewController:(id)a3 shouldEnableMarkup:(BOOL)a4;
- (void)editor:(id)a3 contentFrameDidChange:(CGRect)a4;
- (void)editor:(id)a3 detectedFormInContent:(BOOL)a4;
- (void)editor:(id)a3 detectedFormInContent:(BOOL)a4 withAutofill:(BOOL)a5;
- (void)editor:(id)a3 didDismissViewControllerWithAnimation:(BOOL)a4;
- (void)editor:(id)a3 needsToUpdateChromeWithAnimation:(BOOL)a4;
- (void)editor:(id)a3 willPresentViewControllerWithAnimation:(BOOL)a4;
- (void)editorDidChangeContent:(id)a3 enablingFormFilling:(BOOL)a4;
- (void)editorDidChangeContent:(id)a3 enablingMarkup:(BOOL)a4;
- (void)editorDidUnlockDocument:(id)a3;
- (void)enableMarkupMode:(BOOL)a3;
- (void)formDetectedInContent:(BOOL)a3 withAutofill:(BOOL)a4;
- (void)hostSceneWillDeactivate;
- (void)hostViewControllerBackgroundColorChanged:(id)a3;
- (void)loadEditorWithData:(id)a3 placeholderImage:(id)a4 completionHandler:(id)a5;
- (void)loadEditorWithURL:(id)a3 placeholderImage:(id)a4 completionHandler:(id)a5;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)markupViewController:(id)a3 didChangeShowingSignaturesUI:(BOOL)a4;
- (void)performFirstTimeAppearanceActions:(unint64_t)a3;
- (void)prepareForActionSheetPresentation;
- (void)prepareForInvalidationWithCompletionHandler:(id)a3;
- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewDidDisappear:(BOOL)a3;
- (void)previewWillAppear:(BOOL)a3;
- (void)previewWillDisappear:(BOOL)a3;
- (void)restoreFullscreenState;
- (void)saveFullscreenStateAndHideChrome;
- (void)savePreviewEditedCopyWithCompletionHandler:(id)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setAutofillDetected:(BOOL)a3;
- (void)setCanShowFormFillingBanner:(BOOL)a3;
- (void)setContentsAllowsEditingContents:(id)a3;
- (void)setCurrentEditNumber:(int64_t)a3;
- (void)setDidDismissFormFillingBanner:(BOOL)a3;
- (void)setDidReceiveFormFillingCallback:(BOOL)a3;
- (void)setDocumentWorkflowsClient:(id)a3;
- (void)setFormDetectedInDocument:(BOOL)a3;
- (void)setHasChangesToRedo:(BOOL)a3;
- (void)setHasChangesToUndo:(BOOL)a3;
- (void)setLatestDocumentAttributes:(id)a3;
- (void)setMarkupContentFrame:(CGRect)a3;
- (void)setMarkupViewController:(id)a3;
- (void)setOriginalDateFormatProvider:(id)a3;
- (void)setOriginalDocumentAttributes:(id)a3;
- (void)setPdfDocumentDelegateProxy:(id)a3;
- (void)setSaveEditsPeriodicallyTimer:(id)a3;
- (void)setTopInset:(double)a3;
- (void)setWriteOptionsForSaving:(id)a3;
- (void)shouldLockPreviewForUnsavedEdits:(BOOL)a3;
- (void)showingSignatureView:(BOOL)a3;
- (void)startFormFilling;
- (void)startFormFillingDidUseBanner:(BOOL)a3;
- (void)togglePeriodicallySaveEdits:(BOOL)a3;
- (void)updateBannerVisibility;
- (void)updateContentFrame;
- (void)updateContentsAllowEditingContent;
- (void)updateInterfaceAfterSavingEdits;
- (void)updateMarkupBackgroundColor;
- (void)updateMarkupEdgeInsets:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation QLMarkupItemViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  _os_feature_enabled_impl();
  v9 = (QuickLookContentEditor *)objc_opt_new();
  markupViewController = self->_markupViewController;
  self->_markupViewController = v9;

  v11 = [(QuickLookContentEditor *)self->_markupViewController view];
  [v11 setOpaque:0];

  [(QuickLookContentEditor *)self->_markupViewController setDelegate:self];
  contentsAllowsEditingContents = self->_contentsAllowsEditingContents;
  self->_contentsAllowsEditingContents = 0;

  [(QuickLookContentEditor *)self->_markupViewController setShapeDetectionEnabled:1];
  [(QuickLookContentEditor *)self->_markupViewController setToolbarHidden:1];
  [(QuickLookContentEditor *)self->_markupViewController setPencilAlwaysDraws:[(QLMarkupItemViewController *)self shouldAllowEditingContents]];
  [(QLMarkupItemViewController *)self setFormDetectedInDocument:0];
  [(QLMarkupItemViewController *)self setAutofillDetected:0];
  v13 = [(QLMarkupItemViewController *)self scrollView];
  objc_msgSend(v13, "setContentOffset:", 0.0, 0.0);

  self->_lastSavedEditNumber = 0;
  [(QLMarkupItemViewController *)self addChildViewController:self->_markupViewController];
  v14 = [(QLMarkupItemViewController *)self view];
  v15 = [(QuickLookContentEditor *)self->_markupViewController view];
  [v14 addSubview:v15];

  [(QuickLookContentEditor *)self->_markupViewController didMoveToParentViewController:self];
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_10000C34C;
  v27 = &unk_100024C60;
  v28 = self;
  id v16 = v8;
  id v29 = v16;
  v17 = objc_retainBlock(&v24);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[QLMarkupItemViewController _updatePreferredContentSizeWithData:](self, "_updatePreferredContentSizeWithData:", v7, v24, v25, v26, v27, v28);
    [(QLMarkupItemViewController *)self loadEditorWithData:v7 placeholderImage:0 completionHandler:v17];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v7;
        v19 = objc_msgSend(v18, "imageURL", v24, v25, v26, v27, v28);
        [(QLMarkupItemViewController *)self _updatePreferredContentSizeWithURL:v19];

        v20 = [v18 imageURL];

        [(QLMarkupItemViewController *)self loadEditorWithURL:v20 placeholderImage:0 completionHandler:v17];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_10;
        }
        id v21 = v7;
        v22 = objc_msgSend(v21, "imageData", v24, v25, v26, v27, v28);
        [(QLMarkupItemViewController *)self _updatePreferredContentSizeWithData:v22];

        v20 = [v21 imageData];
        v23 = [v21 image];

        [(QLMarkupItemViewController *)self loadEditorWithData:v20 placeholderImage:v23 completionHandler:v17];
      }

      goto LABEL_10;
    }
    -[QLMarkupItemViewController _updatePreferredContentSizeWithURL:](self, "_updatePreferredContentSizeWithURL:", v7, v24, v25, v26, v27, v28);
    [(QLMarkupItemViewController *)self loadEditorWithURL:v7 placeholderImage:0 completionHandler:v17];
  }
LABEL_10:
  [(QLMarkupItemViewController *)self _fetchDocumentAttributes];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)QLMarkupItemViewController;
  [(QLMarkupItemViewController *)&v8 viewDidLoad];
  objc_initWeak(&location, self);
  uint64_t v9 = objc_opt_class();
  v3 = +[NSArray arrayWithObjects:&v9 count:1];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000C51C;
  v5[3] = &unk_100024CE8;
  objc_copyWeak(&v6, &location);
  id v4 = [(QLMarkupItemViewController *)self registerForTraitChanges:v3 withHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_updatePreferredContentSizeWithData:(id)a3
{
  id v7 = a3;
  if (self->_markupViewController)
  {
    objc_opt_class();
    if (objc_opt_respondsToSelector())
    {
      [(id)objc_opt_class() suggestedContentSizeForData:v7];
      if (v5 != CGSizeZero.width || v4 != CGSizeZero.height) {
        -[QLMarkupItemViewController setPreferredContentSize:](self, "setPreferredContentSize:");
      }
    }
  }
}

- (void)_updatePreferredContentSizeWithURL:(id)a3
{
  id v7 = a3;
  if (self->_markupViewController)
  {
    objc_opt_class();
    if (objc_opt_respondsToSelector())
    {
      [(id)objc_opt_class() suggestedContentSizeForURL:v7];
      if (v5 != CGSizeZero.width || v4 != CGSizeZero.height) {
        -[QLMarkupItemViewController setPreferredContentSize:](self, "setPreferredContentSize:");
      }
    }
  }
}

- (void)loadEditorWithData:(id)a3 placeholderImage:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(QLMarkupItemViewController *)self markupViewController];
  char v12 = objc_opt_respondsToSelector();

  v13 = [(QLMarkupItemViewController *)self markupViewController];
  id v15 = v13;
  if (v12)
  {
    [v13 loadWithData:v10 archivedModelData:0 placeholderImage:v9 completionHandler:v8];

    v14 = v15;
  }
  else
  {
    [v13 setData:v10 withArchivedModelData:0 placeholderImage:v9];

    (*((void (**)(id, void))v8 + 2))(v8, 0);
    v14 = v8;
  }
}

- (void)loadEditorWithURL:(id)a3 placeholderImage:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(QLMarkupItemViewController *)self markupViewController];
  char v12 = objc_opt_respondsToSelector();

  v13 = [(QLMarkupItemViewController *)self markupViewController];
  id v15 = v13;
  if (v12)
  {
    [v13 loadWithURL:v10 archivedModelData:0 placeholderImage:v9 completionHandler:v8];

    v14 = v15;
  }
  else
  {
    [v13 setFileURL:v10 withArchivedModelData:0 placeholderImage:v9];

    (*((void (**)(id, void))v8 + 2))(v8, 0);
    v14 = v8;
  }
}

- (void)hostViewControllerBackgroundColorChanged:(id)a3
{
  objc_storeStrong((id *)&self->_hostViewControllerBackgroundColor, a3);

  [(QLMarkupItemViewController *)self updateMarkupBackgroundColor];
}

- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3
{
  return [(QLMarkupItemViewController *)self shouldAllowEditingContents] & (a3 >> 2);
}

- (void)performFirstTimeAppearanceActions:(unint64_t)a3
{
  if ((a3 & 4) != 0) {
    [(QLMarkupItemViewController *)self enableMarkupMode:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)QLMarkupItemViewController;
  [(QLMarkupItemViewController *)&v5 viewWillAppear:a3];
  double v4 = [(QLMarkupItemViewController *)self markupViewController];
  [v4 becomeFirstResponder];
}

- (void)previewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)QLMarkupItemViewController;
  [(QLMarkupItemViewController *)&v7 previewDidAppear:a3];
  double v4 = [(QLMarkupItemViewController *)self markupViewController];
  [v4 becomeFirstResponder];

  objc_super v5 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    objc_super v5 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    markupViewController = self->_markupViewController;
    *(_DWORD *)buf = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    v11 = markupViewController;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ made markupViewController (%@) first responder. #Generic", buf, 0x16u);
  }
}

- (void)previewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)QLMarkupItemViewController;
  [(QLMarkupItemViewController *)&v5 previewWillAppear:a3];
  double v4 = [(QLMarkupItemViewController *)self view];
  [v4 setClipsToBounds:0];
}

- (void)previewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(QLMarkupItemViewController *)self needsToSaveChanges]) {
    [(QLMarkupItemViewController *)self _saveChangesNotifyingHost:1];
  }
  [(QLMarkupItemViewController *)self enableMarkupMode:0];
  v5.receiver = self;
  v5.super_class = (Class)QLMarkupItemViewController;
  [(QLMarkupItemViewController *)&v5 previewWillDisappear:v3];
}

- (void)previewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)QLMarkupItemViewController;
  [(QLMarkupItemViewController *)&v8 previewDidDisappear:a3];
  double v4 = [(QLMarkupItemViewController *)self markupViewController];
  [v4 resignFirstResponder];

  objc_super v5 = [(QLMarkupItemViewController *)self view];
  [v5 setClipsToBounds:1];

  id v6 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    id v6 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    markupViewController = self->_markupViewController;
    *(_DWORD *)buf = 138412546;
    __int16 v10 = self;
    __int16 v11 = 2112;
    char v12 = markupViewController;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ resigned markupViewController first responder (%@). #Generic", buf, 0x16u);
  }
}

- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)QLMarkupItemViewController;
  -[QLMarkupItemViewController previewBecameFullScreen:animated:](&v8, "previewBecameFullScreen:animated:");
  self->_isFullScreen = v5;
  objc_super v7 = [(QLMarkupItemViewController *)self markupViewController];
  [v7 updateForFullScreen:v5 animated:v4];
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = [(QLMarkupItemViewController *)self appearance];
  id v8 = [v7 presentationMode];

  v9.receiver = self;
  v9.super_class = (Class)QLMarkupItemViewController;
  [(QLMarkupItemViewController *)&v9 setAppearance:v6 animated:v4];
  if (v8 != [v6 presentationMode]) {
    -[QLMarkupItemViewController _setupPresentationMode:](self, "_setupPresentationMode:", [v6 presentationMode]);
  }
  -[QLMarkupItemViewController _updatePencilSupportForPresentationModeIfNeeded:](self, "_updatePencilSupportForPresentationModeIfNeeded:", [v6 presentationMode]);
  [(QLMarkupItemViewController *)self updateMarkupEdgeInsets:v4];
  [(QLMarkupItemViewController *)self updateBannerVisibility];
}

- (void)_setupPresentationMode:(unint64_t)a3
{
  BOOL v5 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    BOOL v5 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = v5;
    objc_super v7 = [(QLMarkupItemViewController *)self markupViewController];
    int v14 = 134217984;
    id v15 = [v7 presentationMode];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "_setupPresentationMode: %lu #AnyItemViewController", (uint8_t *)&v14, 0xCu);
  }
  if (a3 - 1 <= 1)
  {
    id v8 = [(QLMarkupItemViewController *)self markupViewController];
    objc_super v9 = v8;
    uint64_t v10 = 0;
LABEL_9:
    [v8 setPresentationMode:v10];
LABEL_10:

    return;
  }
  if (a3 - 3 <= 2)
  {
    id v8 = [(QLMarkupItemViewController *)self markupViewController];
    objc_super v9 = v8;
    uint64_t v10 = 1;
    goto LABEL_9;
  }
  __int16 v11 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    __int16 v11 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    char v12 = v11;
    objc_super v9 = [(QLMarkupItemViewController *)self markupViewController];
    id v13 = [v9 presentationMode];
    int v14 = 134217984;
    id v15 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Setting unsupported presentation mode: %lu #AnyItemViewController", (uint8_t *)&v14, 0xCu);

    goto LABEL_10;
  }
}

- (BOOL)needsToSaveChanges
{
  int64_t lastSavedEditNumber = self->_lastSavedEditNumber;
  return lastSavedEditNumber < [(QLMarkupItemViewController *)self currentEditNumber];
}

- (BOOL)saveChangesIfNeededNotifyHost:(BOOL)a3 forceNotifyHost:(BOOL)a4 saveHandler:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  BOOL v8 = [(QLMarkupItemViewController *)self needsToSaveChanges];
  if (v8) {
    [(QLMarkupItemViewController *)self _saveChangesNotifyingHost:v5 forceNotifyHost:0 completionHandler:v7];
  }

  return v8;
}

- (void)_saveChangesNotifyingHost:(BOOL)a3
{
}

- (void)_saveChangesNotifyingHost:(BOOL)a3 forceNotifyHost:(BOOL)a4
{
}

- (void)_saveChangesNotifyingHost:(BOOL)a3 forceNotifyHost:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a5;
  objc_super v9 = [(QLMarkupItemViewController *)self saveEditsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D0E0;
  block[3] = &unk_100024D10;
  BOOL v13 = a3;
  BOOL v14 = a4;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, block);
}

- (void)_saveChangesNotifyingHostOnEditsQueue:(BOOL)a3 forceNotifyHost:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = (void (**)(void))a5;
  objc_super v9 = [(QLMarkupItemViewController *)self saveEditsQueue];
  dispatch_assert_queue_V2(v9);

  if ([(QLMarkupItemViewController *)self needsToSaveChanges])
  {
    if ([(QLMarkupItemViewController *)self shouldAllowEditingContents]
      && self->_markupViewController)
    {
      objc_initWeak(location, self);
      id v10 = [(QLMarkupItemViewController *)self markupViewController];
      __int16 v11 = [v10 outputContentType];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000D354;
      v16[3] = &unk_100024D60;
      objc_copyWeak(&v18, location);
      v17 = v8;
      BOOL v19 = a3;
      [(QLMarkupItemViewController *)self editedCopyToSaveChangesWithOutputType:v11 completionHandler:v16];

      objc_destroyWeak(&v18);
      objc_destroyWeak(location);
      goto LABEL_13;
    }
  }
  else if (v5)
  {
    id v12 = [(QLMarkupItemViewController *)self context];
    BOOL v13 = [v12 item];
    BOOL v14 = [v13 editedCopy];
    [(QLMarkupItemViewController *)self _notifyHostWithEditedCopy:v14 hostCompletionHandler:v8];

    goto LABEL_13;
  }
  if (v8)
  {
    id v15 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      id v15 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Item view controller: %@ is notifying host after trying to save Markup changes. #ItemViewController", (uint8_t *)location, 0xCu);
    }
    v8[2](v8);
  }
LABEL_13:
}

- (void)_saveChangesWithEditedCopy:(id)a3 notifyHost:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  objc_super v9 = (void (**)(void))a5;
  id v10 = [v8 url];
  __int16 v11 = [(QLMarkupItemViewController *)self writeOptionsForSaving];
  if (v11) {
    +[NSMutableDictionary dictionaryWithDictionary:v11];
  }
  else {
  id v12 = +[NSMutableDictionary dictionaryWithCapacity:1];
  }
  [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:@"MUUseOriginalFileMetadata"];
  markupViewController = self->_markupViewController;
  id v18 = 0;
  unsigned int v14 = [(QuickLookContentEditor *)markupViewController writeToURL:v10 options:v12 error:&v18];
  id v15 = v18;
  if (v14)
  {
    [v8 bumpVersion];
    [v8 markAsPurgeable];
    if (v6) {
      [(QLMarkupItemViewController *)self _notifyHostWithEditedCopy:v8 hostCompletionHandler:v9];
    }
    id v16 = [(QLMarkupItemViewController *)self delegate];
    [v16 previewItemViewController:self hasUnsavedEdits:0];

    self->_int64_t lastSavedEditNumber = [(QLMarkupItemViewController *)self currentEditNumber];
    if (!v9) {
      goto LABEL_16;
    }
LABEL_14:
    if (!v6) {
      v9[2](v9);
    }
    goto LABEL_16;
  }
  v17 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    v17 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to save markup changes in file with error: %@ #AnyItemViewController", buf, 0xCu);
  }
  LOBYTE(v6) = 0;
  if (v9) {
    goto LABEL_14;
  }
LABEL_16:
}

- (void)_notifyHostWithEditedCopy:(id)a3 hostCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    id v8 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412546;
    __int16 v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Item view controller: %@ is notifying host with latest Markup changes: %@. #ItemViewController", (uint8_t *)&v10, 0x16u);
  }
  objc_super v9 = [(QLMarkupItemViewController *)self delegate];
  [v9 previewItemViewControllerDidEditCopyOfPreviewItem:self editedCopy:v6 completionHandler:v7];
}

- (BOOL)canOfferFormFillingForOriginalDocument
{
  return 1;
}

- (BOOL)_isPreviewingUnconvertedDocument
{
  BOOL v3 = [(QLMarkupItemViewController *)self markupViewController];
  BOOL v4 = [v3 outputContentType];
  BOOL v5 = [v4 preferredFilenameExtension];

  id v6 = [(QLMarkupItemViewController *)self context];
  id v7 = [v6 contentType];

  if (v7)
  {
    id v8 = [(QLMarkupItemViewController *)self context];
    objc_super v9 = [v8 contentType];
    int v10 = +[UTType typeWithIdentifier:v9];

    __int16 v11 = [v10 preferredFilenameExtension];
    BOOL v12 = [v5 caseInsensitiveCompare:v11] == 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)updateContentsAllowEditingContent
{
  BOOL v3 = [(QLMarkupItemViewController *)self context];
  unsigned int v4 = [v3 canBeEdited];

  BOOL v5 = [(QLMarkupItemViewController *)self context];
  [v5 editedFileBehavior];

  id v6 = [(QLMarkupItemViewController *)self context];
  id v7 = [v6 item];
  id v8 = [v7 editingMode];

  if (v8) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v4;
  }
  if (![(QLMarkupItemViewController *)self _isPreviewingUnconvertedDocument])
  {
    int v10 = [(QLMarkupItemViewController *)self context];
    if (([v10 editedFileBehavior] & 2) != 0)
    {
      unsigned int v13 = 1;
    }
    else
    {
      __int16 v11 = [(QLMarkupItemViewController *)self context];
      BOOL v12 = [v11 item];
      if ([v12 editingMode] == (id)2)
      {
        unsigned int v13 = 1;
      }
      else
      {
        unsigned int v14 = [(QLMarkupItemViewController *)self context];
        id v15 = [v14 item];
        id v16 = [v15 editingMode];
        if (v16 == (id)QLPreviewItemEditingModeCreateCopyAndDisplayDismissActions)
        {
          unsigned int v13 = 1;
        }
        else
        {
          v17 = [(QLMarkupItemViewController *)self context];
          id v18 = [v17 item];
          unsigned int v13 = [v18 canHandleEditedCopy];
        }
      }
    }
    uint64_t v9 = v9 & v13;
  }
  self->_contentsAllowsEditingContents = +[NSNumber numberWithBool:v9];

  _objc_release_x1();
}

- (BOOL)shouldAllowEditingContents
{
  v2 = self;
  BOOL v3 = [(QLMarkupItemViewController *)self markupViewController];
  LOBYTE(v2) = [(QLMarkupItemViewController *)v2 _allowEditingContent:v3];

  return (char)v2;
}

- (void)savePreviewEditedCopyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(QLMarkupItemViewController *)self shouldAllowEditingContents])
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000DDE0;
    v5[3] = &unk_100024D88;
    id v6 = v4;
    objc_copyWeak(&v7, &location);
    [(QLMarkupItemViewController *)self _saveChangesNotifyingHost:1 forceNotifyHost:0 completionHandler:v5];
    objc_destroyWeak(&v7);

    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (BOOL)_presentationModeSupportsMarkup:(unint64_t)a3
{
  return a3 - 1 < 2;
}

- (void)updateMarkupEdgeInsets:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(QLMarkupItemViewController *)self scrollView];
  [v5 minimumZoomScale];
  double v7 = v6;

  id v8 = [(QLMarkupItemViewController *)self scrollView];
  [v8 zoomScale];
  double v10 = v9;
  __int16 v11 = [(QLMarkupItemViewController *)self scrollView];
  [v11 minimumZoomScale];
  double v13 = v12;

  unsigned int v14 = [(QLMarkupItemViewController *)self markupViewController];
  [v14 adjustContentInsetsForBars];

  id v15 = [(QLMarkupItemViewController *)self scrollView];
  [v15 zoomScale];
  double v17 = v16;

  if (v17 < v7
    || ([(QLMarkupItemViewController *)self markupViewController],
        id v18 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v19 = [v18 annotationEditingEnabled],
        v18,
        (v19 & 1) == 0)
    && v10 == v13)
  {
    id v21 = [(QLMarkupItemViewController *)self scrollView];
    id v20 = [(QLMarkupItemViewController *)self scrollView];
    [v20 minimumZoomScale];
    objc_msgSend(v21, "setZoomScale:animated:", v3);
  }
}

- (void)enableMarkupMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(QLMarkupItemViewController *)self shouldAllowEditingContents] || !v3)
    && [(QuickLookContentEditor *)self->_markupViewController annotationEditingEnabled] != v3)
  {
    BOOL v5 = [(QLMarkupItemViewController *)self delegate];
    [v5 previewItemViewController:self didEnableEditMode:v3];

    double v6 = [(QLMarkupItemViewController *)self delegate];
    [v6 previewItemViewController:self wantsFullScreen:0];

    [(QuickLookContentEditor *)self->_markupViewController setAnnotationEditingEnabled:v3];
    [(QLMarkupItemViewController *)self _updateToolbarVisibilityAnimated:1];
    double v7 = [(QLMarkupItemViewController *)self delegate];
    [v7 previewItemViewControllerWantsUpdateOverlay:self animated:0];

    [(QLMarkupItemViewController *)self updateMarkupEdgeInsets:1];
    id v8 = [(QLMarkupItemViewController *)self delegate];
    [v8 previewItemViewControllerWantsUpdateKeyCommands:self];

    [(QLMarkupItemViewController *)self togglePeriodicallySaveEdits:v3];
    [(QLMarkupItemViewController *)self updateMarkupBackgroundColor];
  }
}

- (void)updateMarkupBackgroundColor
{
  if ([(QuickLookContentEditor *)self->_markupViewController annotationEditingEnabled])
  {
    hostViewControllerBackgroundColor = self->_hostViewControllerBackgroundColor;
    if (hostViewControllerBackgroundColor)
    {
      id v4 = hostViewControllerBackgroundColor;
    }
    else
    {
      id v4 = +[UIColor systemBackgroundColor];
    }
  }
  else
  {
    id v4 = +[UIColor clearColor];
  }
  BOOL v5 = v4;
  double v6 = [(QLMarkupItemViewController *)self traitCollection];
  id v7 = [(UIColor *)v5 resolvedColorWithTraitCollection:v6];

  if (objc_opt_respondsToSelector())
  {
    [(QuickLookContentEditor *)self->_markupViewController setCanvaBackgroundColor:v7];
  }
  else if (objc_opt_respondsToSelector())
  {
    [(QuickLookContentEditor *)self->_markupViewController setBackgroundColor:v7];
  }
}

- (void)togglePeriodicallySaveEdits:(BOOL)a3
{
  saveEditsPeriodicallyTimer = self->_saveEditsPeriodicallyTimer;
  if (a3)
  {
    if (!saveEditsPeriodicallyTimer)
    {
      objc_initWeak(&location, self);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10000E338;
      v8[3] = &unk_100024DB0;
      objc_copyWeak(&v9, &location);
      BOOL v5 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v8 block:300.0];
      double v6 = self->_saveEditsPeriodicallyTimer;
      self->_saveEditsPeriodicallyTimer = v5;

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(NSTimer *)saveEditsPeriodicallyTimer invalidate];
    id v7 = self->_saveEditsPeriodicallyTimer;
    self->_saveEditsPeriodicallyTimer = 0;
  }
}

- (void)_updatePencilSupportForPresentationModeIfNeeded:(unint64_t)a3
{
  BOOL v4 = [(QLMarkupItemViewController *)self shouldAllowEditingContents];
  id v5 = [(QLMarkupItemViewController *)self markupViewController];
  [v5 setPencilAlwaysDraws:v4];
}

- (void)_updateToolbarVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  markupViewController = self->_markupViewController;
  uint64_t v5 = [(QuickLookContentEditor *)markupViewController annotationEditingEnabled] ^ 1;

  [(QuickLookContentEditor *)markupViewController setToolbarHidden:v5 animated:v3];
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  double v6 = (QLMarkupItemViewController *)a3;
  id v7 = (void (**)(void))a4;
  if (![(QLMarkupItemViewController *)self isSavingEdits])
  {
    if ([(QLMarkupItemViewController *)v6 isEqualToString:QLDoneButtonIdentifier])
    {
      id v9 = self;
      uint64_t v10 = 0;
LABEL_14:
      [(QLMarkupItemViewController *)v9 enableMarkupMode:v10];
      goto LABEL_15;
    }
    if ([(QLMarkupItemViewController *)v6 isEqualToString:@"QLInlineMarkup"])
    {
      __int16 v11 = [(QLMarkupItemViewController *)self markupViewController];
      unsigned int v12 = [v11 formFillingEnabled];

      if (v12) {
        [(QLMarkupItemViewController *)self _stopFormFilling];
      }
      if ([(QuickLookContentEditor *)self->_markupViewController annotationEditingEnabled])[(QLMarkupItemViewController *)self _saveChangesNotifyingHost:1 forceNotifyHost:1]; {
      uint64_t v10 = [(QuickLookContentEditor *)self->_markupViewController annotationEditingEnabled] ^ 1;
      }
      id v9 = self;
      goto LABEL_14;
    }
    if ([(QLMarkupItemViewController *)v6 isEqualToString:QLFormFillingButtonIdentifier])
    {
      unsigned int v14 = [(QLMarkupItemViewController *)self markupViewController];
      unsigned __int8 v15 = [v14 formFillingEnabled];

      if (v15) {
        [(QLMarkupItemViewController *)self _stopFormFilling];
      }
      else {
        [(QLMarkupItemViewController *)self startFormFilling];
      }
      goto LABEL_15;
    }
    if ([(QLMarkupItemViewController *)v6 isEqualToString:@"QLMarkupUndo"])
    {
      double v16 = [(QuickLookContentEditor *)self->_markupViewController undoManager];
      [v16 undo];
    }
    else
    {
      if (![(QLMarkupItemViewController *)v6 isEqualToString:@"QLMarkupRedo"])
      {
        if ([(QLMarkupItemViewController *)v6 isEqualToString:@"QLMarkupUndoAll"])
        {
          [(QuickLookContentEditor *)self->_markupViewController revert];
        }
        else if (![(QLMarkupItemViewController *)v6 isEqualToString:QLToolbarButtonOptionCancelIdentifier])
        {
          goto LABEL_15;
        }
LABEL_31:
        double v17 = [(QLMarkupItemViewController *)self markupViewController];
        [v17 becomeFirstResponder];

        goto LABEL_15;
      }
      double v16 = [(QuickLookContentEditor *)self->_markupViewController undoManager];
      [v16 redo];
    }

    goto LABEL_31;
  }
  id v8 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    id v8 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412546;
    unsigned __int8 v19 = v6;
    __int16 v20 = 2112;
    id v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Ignored button pressed with identifier: %@ because changes are being saved. %@ #ItemViewController", (uint8_t *)&v18, 0x16u);
  }
LABEL_15:
  if (v7)
  {
    double v13 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      double v13 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412546;
      unsigned __int8 v19 = self;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Item view controller: %@ is executing completion handler for button pressed with identifier: %@. #ItemViewController", (uint8_t *)&v18, 0x16u);
    }
    v7[2](v7);
  }
}

- (BOOL)canShowMarkupButton
{
  if (objc_opt_respondsToSelector()) {
    unsigned int v3 = [(QuickLookContentEditor *)self->_markupViewController documentIsLocked] ^ 1;
  }
  else {
    LOBYTE(v3) = 1;
  }
  return [(QLMarkupItemViewController *)self shouldAllowEditingContents] & v3;
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableArray array];
  if ([(QLMarkupItemViewController *)self canShowMarkupButton])
  {
    id v6 = [objc_alloc((Class)QLToolbarButton) initWithIdentifier:@"QLInlineMarkup"];
    if ([(QuickLookContentEditor *)self->_markupViewController annotationEditingEnabled]&& ![(QLMarkupItemViewController *)self shouldDisplayAlternateEditButton])
    {
      [v6 setSymbolImageName:@"pencil.tip.crop.circle.on"];
      [v6 setUseBundleImage:1];
    }
    else
    {
      [v6 setSymbolImageName:@"pencil.tip.crop.circle"];
    }
    if (_UIBarsDesktopNavigationBarEnabled())
    {
      objc_msgSend(v6, "setForceToNavBar:", -[QuickLookContentEditor annotationEditingEnabled](self->_markupViewController, "annotationEditingEnabled"));
      [v6 setPlacement:2];
    }
    else
    {
      [v6 setForceToNavBar:1];
    }
    [v6 setAccessibilityIdentifier:QLOverlayMarkupButtonAccessibilityIdentifier];
    BOOL v7 = [v4 horizontalSizeClass] != (id)1 && objc_msgSend(v4, "userInterfaceIdiom") != 0;
    if (![(QuickLookContentEditor *)self->_markupViewController annotationEditingEnabled]|| v7)
    {
      [v5 addObject:v6];
    }
    else
    {
      id v8 = [objc_alloc((Class)QLToolbarButtonOption) initWithIdentifier:@"QLMarkupUndoAll"];
      id v9 = QLLocalizedString();
      id v10 = v8;
      v31 = v8;
      [v8 setTitle:v9];

      id v11 = [objc_alloc((Class)QLToolbarButtonOption) initWithIdentifier:@"QLMarkupUndo"];
      unsigned int v12 = QLLocalizedString();
      [v11 setTitle:v12];

      id v13 = [objc_alloc((Class)QLToolbarButton) initWithIdentifier:@"QLMarkupUndo"];
      [v13 setSymbolImageName:@"arrow.uturn.backward.circle"];
      [v13 setPlacement:0];
      v34[0] = v11;
      v34[1] = v10;
      unsigned int v14 = +[QLToolbarButtonOption cancelOption];
      v34[2] = v14;
      unsigned __int8 v15 = +[NSArray arrayWithObjects:v34 count:3];
      [v13 setOptions:v15];

      [v13 setForceToNavBar:1];
      [v13 setEnabled:self->_hasChangesToUndo];
      id v16 = [objc_alloc((Class)QLToolbarButtonOption) initWithIdentifier:@"QLMarkupRedo"];
      double v17 = QLLocalizedString();
      [v16 setTitle:v17];

      id v18 = [objc_alloc((Class)QLToolbarButton) initWithIdentifier:@"QLMarkupRedo"];
      [v18 setSymbolImageName:@"arrow.uturn.forward.circle"];
      [v18 setPlacement:0];
      v33[0] = v16;
      unsigned __int8 v19 = +[QLToolbarButtonOption cancelOption];
      v33[1] = v19;
      __int16 v20 = +[NSArray arrayWithObjects:v33 count:2];
      [v18 setOptions:v20];

      [v18 setForceToNavBar:1];
      [v18 setEnabled:self->_hasChangesToRedo];
      v32[0] = v6;
      v32[1] = v18;
      v32[2] = v13;
      id v21 = +[NSArray arrayWithObjects:v32 count:3];
      [v5 addObjectsFromArray:v21];
    }
  }
  v22 = [(QLMarkupItemViewController *)self markupViewController];
  id v23 = [v22 formFillingEnabled];

  v24 = [(QLMarkupItemViewController *)self markupViewController];
  unsigned int v25 = [v24 annotationEditingEnabled];

  unsigned int v26 = [(QLMarkupItemViewController *)self canOfferFormFillingForOriginalDocument];
  if (v26) {
    unsigned int v26 = [(QLMarkupItemViewController *)self formDetectedInDocument];
  }
  if ((((v25 | v23) & 1) != 0 || v26)
    && [(QLMarkupItemViewController *)self shouldAllowEditingContents])
  {
    id v27 = objc_alloc((Class)QLToolbarButton);
    id v28 = [v27 initWithIdentifier:QLFormFillingButtonIdentifier];
    [v28 setSymbolImageName:@"rectangle.and.pencil.and.ellipsis"];
    [v28 setSelected:v23];
    objc_msgSend(v28, "set_additionalSelectionInsets:", 3.0, 2.0, 1.0, 5.0);
    [v28 setPlacement:2];
    [v28 setAccessibilityIdentifier:QLPDFItemViewControllerBarFormFillingRightButtonAccessibilityIdentifier];
    id v29 = [(QLMarkupItemViewController *)self markupViewController];
    objc_msgSend(v28, "setForceToNavBar:", objc_msgSend(v29, "annotationEditingEnabled"));

    [v5 addObject:v28];
  }

  return v5;
}

- (BOOL)shouldDisplayAlternateEditButton
{
  return 0;
}

- (void)startFormFilling
{
}

- (void)startFormFillingDidUseBanner:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(QLMarkupItemViewController *)self delegate];
  [v5 previewItemViewController:self wantsFullScreen:0];

  id v6 = [(QLMarkupItemViewController *)self markupViewController];
  unsigned int v7 = [v6 annotationEditingEnabled];

  if (v7) {
    [(QLMarkupItemViewController *)self enableMarkupMode:0];
  }
  char v8 = objc_opt_respondsToSelector();
  markupViewController = self->_markupViewController;
  if (v8) {
    [(QuickLookContentEditor *)markupViewController setFormFillingEnabled:1 didUseBanner:v3];
  }
  else {
    [(QuickLookContentEditor *)markupViewController setFormFillingEnabled:1];
  }
  id v10 = [(QLMarkupItemViewController *)self delegate];
  [v10 previewItemViewControllerWantsUpdateOverlay:self animated:0];

  [(QLMarkupItemViewController *)self setDidDismissFormFillingBanner:1];

  [(QLMarkupItemViewController *)self updateBannerVisibility];
}

- (void)_stopFormFilling
{
  BOOL v3 = [(QLMarkupItemViewController *)self markupViewController];
  [v3 setFormFillingEnabled:0];

  id v4 = [(QLMarkupItemViewController *)self delegate];
  [v4 previewItemViewControllerWantsUpdateOverlay:self animated:0];
}

- (id)transitioningView
{
  v2 = [(QLMarkupItemViewController *)self markupViewController];
  BOOL v3 = [v2 transitioningView];

  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4
{
  id v5 = a3;
  BOOL v6 = (-[QuickLookContentEditor annotationEditingEnabled](self->_markupViewController, "annotationEditingEnabled") & 1) == 0&& (-[QuickLookContentEditor formFillingEnabled](self->_markupViewController, "formFillingEnabled") & 1) == 0&& (!-[QuickLookContentEditor pencilAlwaysDraws](self->_markupViewController, "pencilAlwaysDraws")|| [v5 type] != (id)2);

  return v6;
}

- (BOOL)canPinchToDismiss
{
  v2 = [(QLMarkupItemViewController *)self scrollView];
  BOOL v3 = v2;
  if (v2)
  {
    [v2 zoomScale];
    double v5 = v4;
    [v3 minimumZoomScale];
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)showingSignatureView:(BOOL)a3
{
  self->_showingSignatureView = a3;
  id v4 = [(QLMarkupItemViewController *)self delegate];
  [v4 previewItemViewController:self wantsFullScreen:1];
}

- (BOOL)canEnterFullScreen
{
  if (objc_opt_respondsToSelector()) {
    unsigned int v3 = [(QuickLookContentEditor *)self->_markupViewController documentIsLocked];
  }
  else {
    unsigned int v3 = 0;
  }
  return ([(QuickLookContentEditor *)self->_markupViewController annotationEditingEnabled] & 1) == 0&& !v3|| self->_showingSignatureView;
}

- (BOOL)canShowToolBar
{
  return [(QuickLookContentEditor *)self->_markupViewController annotationEditingEnabled] ^ 1;
}

- (void)setHasChangesToUndo:(BOOL)a3
{
  if (self->_hasChangesToUndo != a3)
  {
    BOOL v3 = a3;
    self->_hasChangesToUndo = a3;
    double v5 = [(QLMarkupItemViewController *)self delegate];
    [v5 previewItemViewController:self hasUnsavedEdits:v3];

    id v6 = [(QLMarkupItemViewController *)self delegate];
    [v6 previewItemViewControllerWantsUpdateOverlay:self animated:0];
  }
}

- (void)setHasChangesToRedo:(BOOL)a3
{
  if (self->_hasChangesToRedo != a3)
  {
    self->_hasChangesToRedo = a3;
    id v4 = [(QLMarkupItemViewController *)self delegate];
    [v4 previewItemViewControllerWantsUpdateOverlay:self animated:0];
  }
}

- (void)editDetectedForMarkupViewController:(id)a3 shouldEnableMarkup:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (v4)
  {
    [(QLMarkupItemViewController *)self shouldLockPreviewForUnsavedEdits:0];
    [(QLMarkupItemViewController *)self enableMarkupMode:1];
  }
  else
  {
    id v6 = [(QLMarkupItemViewController *)self markupViewController];
    if ([v6 annotationEditingEnabled])
    {
    }
    else
    {
      unsigned int v7 = [(QLMarkupItemViewController *)self needsToSaveChanges];

      if (v7) {
        [(QLMarkupItemViewController *)self shouldLockPreviewForUnsavedEdits:1];
      }
    }
  }
}

- (void)shouldLockPreviewForUnsavedEdits:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(QLMarkupItemViewController *)self markupViewController];
  -[QLMarkupItemViewController togglePeriodicallySaveEdits:](self, "togglePeriodicallySaveEdits:", [v5 annotationEditingEnabled] | v3);
}

- (void)prepareForActionSheetPresentation
{
  id v2 = [(QLMarkupItemViewController *)self markupViewController];
  [v2 resignFirstResponder];
}

- (void)actionSheetDidDismiss
{
  id v2 = [(QLMarkupItemViewController *)self markupViewController];
  [v2 becomeFirstResponder];
}

- (void)documentMenuActionWillBegin
{
}

- (void)prepareForInvalidationWithCompletionHandler:(id)a3
{
}

- (void)hostSceneWillDeactivate
{
  BOOL v3 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    BOOL v3 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Saving changes and notifying host if needed before scene deactivation. (%@) #AnyItemViewController", (uint8_t *)&v4, 0xCu);
  }
  [(QLMarkupItemViewController *)self _saveChangesNotifyingHost:1 forceNotifyHost:1];
}

- (void)updateInterfaceAfterSavingEdits
{
  v4.receiver = self;
  v4.super_class = (Class)QLMarkupItemViewController;
  [(QLMarkupItemViewController *)&v4 updateInterfaceAfterSavingEdits];
  BOOL v3 = [(QLMarkupItemViewController *)self markupViewController];
  [v3 becomeFirstResponder];
}

- (void)saveFullscreenStateAndHideChrome
{
  BOOL v3 = +[NSNumber numberWithBool:self->_isFullScreen];
  savedFullScreenState = self->_savedFullScreenState;
  self->_savedFullScreenState = v3;

  id v5 = [(QLMarkupItemViewController *)self delegate];
  [v5 previewItemViewController:self wantsFullScreen:1];
}

- (void)restoreFullscreenState
{
  savedFullScreenState = self->_savedFullScreenState;
  if (savedFullScreenState)
  {
    BOOL v4 = [(NSNumber *)savedFullScreenState BOOLValue];
    id v5 = self->_savedFullScreenState;
    self->_savedFullScreenState = 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  id v6 = [(QLMarkupItemViewController *)self delegate];
  [v6 previewItemViewController:self wantsFullScreen:v4];
}

- (void)controllerWantsToShowShareSheet:(id)a3
{
  id v4 = [(QLMarkupItemViewController *)self delegate];
  [v4 previewItemViewControllerWantsToShowShareSheet:self];
}

- (void)markupViewController:(id)a3 didChangeShowingSignaturesUI:(BOOL)a4
{
}

- (BOOL)controller:(id)a3 shouldOpenLinkAtURL:(id)a4
{
  id v5 = a4;
  if ([v5 isSpringboardHandledURL])
  {
    id v6 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      id v6 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412546;
      id v10 = self;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Forwarding URL to client from %@ preview: %@ #AnyItemViewController", (uint8_t *)&v9, 0x16u);
    }
    unsigned int v7 = [(QLMarkupItemViewController *)self delegate];
    [v7 previewItemViewController:self wantsToOpenURL:v5];
  }
  return 0;
}

- (void)editorDidChangeContent:(id)a3 enablingMarkup:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(QLMarkupItemViewController *)self shouldAllowEditingContents])
  {
    -[QLMarkupItemViewController setHasChangesToUndo:](self, "setHasChangesToUndo:", [v6 validateUndo:0]);
    -[QLMarkupItemViewController setHasChangesToRedo:](self, "setHasChangesToRedo:", [v6 validateRedo:0]);
    [(QLMarkupItemViewController *)self setCurrentEditNumber:(char *)[(QLMarkupItemViewController *)self currentEditNumber] + 1];
    [(QLMarkupItemViewController *)self editDetectedForMarkupViewController:v6 shouldEnableMarkup:v4];
  }
}

- (void)editorDidChangeContent:(id)a3 enablingFormFilling:(BOOL)a4
{
  if ([(QLMarkupItemViewController *)self shouldAllowEditingContents])
  {
    [(QLMarkupItemViewController *)self startFormFilling];
  }
}

- (BOOL)editorCanShowWhileLocked:(id)a3
{
  return 0;
}

- (BOOL)supportsChromeless
{
  return 1;
}

- (void)editor:(id)a3 contentFrameDidChange:(CGRect)a4
{
}

- (void)updateContentFrame
{
  [(QLMarkupItemViewController *)self markupContentFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  __int16 v11 = [(QLMarkupItemViewController *)self markupViewController];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_7;
  }
  id v12 = [(QLMarkupItemViewController *)self markupViewController];
  if (([v12 isBannerVisible] & 1) == 0)
  {

LABEL_7:
    goto LABEL_8;
  }
  id v13 = [(QLMarkupItemViewController *)self traitCollection];
  id v14 = [v13 horizontalSizeClass];

  if (v14 == (id)1) {
    double v6 = 0.0;
  }
LABEL_8:

  -[QLMarkupItemViewController setContentFrame:](self, "setContentFrame:", v4, v6, v8, v10);
}

- (void)setMarkupContentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_markupContentFrame = &self->_markupContentFrame;
  if (!CGRectEqualToRect(a3, self->_markupContentFrame))
  {
    p_markupContentFrame->origin.CGFloat x = x;
    p_markupContentFrame->origin.CGFloat y = y;
    p_markupContentFrame->size.CGFloat width = width;
    p_markupContentFrame->size.CGFloat height = height;
    [(QLMarkupItemViewController *)self updateContentFrame];
  }
}

- (BOOL)editorShouldAllowEditingContents:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(QLMarkupItemViewController *)self _isPreviewingUnconvertedDocument];
  LOBYTE(self) = [(QLMarkupItemViewController *)self _allowEditingContent:v4];

  return self & v5;
}

- (BOOL)_allowEditingContent:(id)a3
{
  id v4 = a3;
  if (v4 && !self->_contentsAllowsEditingContents) {
    [(QLMarkupItemViewController *)self updateContentsAllowEditingContent];
  }
  unsigned __int8 v5 = [(QLMarkupItemViewController *)self appearance];
  unsigned __int8 v6 = -[QLMarkupItemViewController _presentationModeSupportsMarkup:](self, "_presentationModeSupportsMarkup:", [v5 presentationMode]);

  if (objc_opt_respondsToSelector()) {
    unsigned int v7 = [v4 documentIsLocked] ^ 1;
  }
  else {
    LOBYTE(v7) = 1;
  }
  if ([(NSNumber *)self->_contentsAllowsEditingContents BOOLValue]) {
    char v8 = v6 & v7;
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (void)editor:(id)a3 willPresentViewControllerWithAnimation:(BOOL)a4
{
}

- (void)editor:(id)a3 didDismissViewControllerWithAnimation:(BOOL)a4
{
}

- (void)editorDidUnlockDocument:(id)a3
{
  id v4 = [(QLMarkupItemViewController *)self delegate];
  [v4 previewItemViewControllerWantsUpdateOverlay:self animated:1];
}

- (void)editor:(id)a3 needsToUpdateChromeWithAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(QLMarkupItemViewController *)self delegate];
  [v6 previewItemViewControllerWantsUpdateOverlay:self animated:v4];
}

- (void)editor:(id)a3 detectedFormInContent:(BOOL)a4
{
}

- (void)editor:(id)a3 detectedFormInContent:(BOOL)a4 withAutofill:(BOOL)a5
{
}

- (void)formDetectedInContent:(BOOL)a3 withAutofill:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unsigned int v7 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    unsigned int v7 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = v5;
    __int16 v10 = 1024;
    BOOL v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Previewed content allows form filling: %d. Autofill detected: %d. #AnyItemViewController", (uint8_t *)v9, 0xEu);
  }
  [(QLMarkupItemViewController *)self setDidReceiveFormFillingCallback:1];
  if (v5 && ![(QLMarkupItemViewController *)self formDetectedInDocument])
  {
    if ([(QLMarkupItemViewController *)self canOfferFormFillingForOriginalDocument])
    {
      [(QLMarkupItemViewController *)self setFormDetectedInDocument:1];
      [(QLMarkupItemViewController *)self setAutofillDetected:v4];
      [(QLMarkupItemViewController *)self updateBannerVisibility];
      [(QLMarkupItemViewController *)self updateContentsAllowEditingContent];
      char v8 = [(QLMarkupItemViewController *)self delegate];
      [v8 previewItemViewControllerWantsUpdateOverlay:self animated:1];
    }
  }
}

- (SYDocumentWorkflowsClient)documentWorkflowsClient
{
  documentWorkflowsClient = self->_documentWorkflowsClient;
  if (!documentWorkflowsClient)
  {
    BOOL v4 = (SYDocumentWorkflowsClient *)objc_alloc_init((Class)SYDocumentWorkflowsClient);
    BOOL v5 = self->_documentWorkflowsClient;
    self->_documentWorkflowsClient = v4;

    documentWorkflowsClient = self->_documentWorkflowsClient;
  }

  return documentWorkflowsClient;
}

- (QLOriginalDateFormatProvider)originalDateFormatProvider
{
  originalDateFormatProvider = self->_originalDateFormatProvider;
  if (!originalDateFormatProvider)
  {
    BOOL v4 = objc_alloc_init(QLOriginalDateFormatProvider);
    BOOL v5 = self->_originalDateFormatProvider;
    self->_originalDateFormatProvider = v4;

    originalDateFormatProvider = self->_originalDateFormatProvider;
  }

  return originalDateFormatProvider;
}

- (NSURL)urlForDocumentWorkflows
{
  id v2 = [(QLMarkupItemViewController *)self context];
  double v3 = [v2 item];
  BOOL v4 = [v3 saveURL];

  return (NSURL *)v4;
}

- (void)_fetchDocumentAttributes
{
  if (_os_feature_enabled_impl())
  {
    double v3 = [(QLMarkupItemViewController *)self context];
    BOOL v4 = [v3 item];
    BOOL v5 = [v4 saveURL];

    id v6 = _qlsLogHandle;
    if (v5)
    {
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        id v6 = _qlsLogHandle;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        unsigned int v7 = v6;
        char v8 = [(QLMarkupItemViewController *)self urlForDocumentWorkflows];
        *(_DWORD *)buf = 138412290;
        v24 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Fetching document attributes for URL %@ #ItemViewController", buf, 0xCu);
      }
      objc_initWeak((id *)buf, self);
      double v9 = [(QLMarkupItemViewController *)self documentWorkflowsClient];
      __int16 v10 = [(QLMarkupItemViewController *)self urlForDocumentWorkflows];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100010208;
      v21[3] = &unk_100024DD8;
      objc_copyWeak(&v22, (id *)buf);
      [v9 hasOriginalDocumentForFileAtURL:v10 completion:v21];

      BOOL v11 = [(QLMarkupItemViewController *)self documentWorkflowsClient];
      id v12 = [(QLMarkupItemViewController *)self urlForDocumentWorkflows];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100010434;
      v19[3] = &unk_100024E00;
      objc_copyWeak(&v20, (id *)buf);
      [v11 hasLastModifiedDocumentForFileAtURL:v12 completion:v19];

      id v13 = dispatch_get_global_queue(0, 0);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100010660;
      v17[3] = &unk_100024E50;
      v17[4] = self;
      objc_copyWeak(&v18, (id *)buf);
      dispatch_async(v13, v17);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        id v6 = _qlsLogHandle;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v14 = v6;
        unsigned __int8 v15 = [(QLMarkupItemViewController *)self context];
        id v16 = [v15 item];
        *(_DWORD *)buf = 138412290;
        v24 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Can not fetch document attributes for a nil URL from item %@. Returning early #ItemViewController", buf, 0xCu);
      }
    }
  }
}

- (id)configurationForBanner
{
  if (([(QuickLookContentEditor *)self->_markupViewController annotationEditingEnabled] & 1) != 0|| [(QuickLookContentEditor *)self->_markupViewController formFillingEnabled])
  {
    double v3 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      double v3 = _qlsLogHandle;
    }
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    LOWORD(v22) = 0;
    BOOL v4 = "Markup or form filling is enabled, do not show any banner #ItemViewController";
    BOOL v5 = v3;
    uint32_t v6 = 2;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, v4, (uint8_t *)&v22, v6);
LABEL_8:
    id v7 = 0;
    goto LABEL_9;
  }
  double v9 = [(QLMarkupItemViewController *)self appearance];

  if (!v9)
  {
    BOOL v11 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      BOOL v11 = _qlsLogHandle;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    int v22 = 138412290;
    id v23 = self;
    BOOL v4 = "No appearance yet on %@, do not show a banner #ItemViewController";
    BOOL v5 = v11;
    uint32_t v6 = 12;
    goto LABEL_7;
  }
  __int16 v10 = [(QLMarkupItemViewController *)self appearance];
  if ([v10 presentationMode] == (id)2)
  {
  }
  else
  {
    id v12 = [(QLMarkupItemViewController *)self appearance];
    id v13 = [v12 presentationMode];

    if (v13 != (id)1)
    {
      unsigned __int8 v19 = _qlsLogHandle;
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        unsigned __int8 v19 = _qlsLogHandle;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = v19;
        id v21 = [(QLMarkupItemViewController *)self appearance];
        int v22 = 134217984;
        id v23 = (QLMarkupItemViewController *)[v21 presentationMode];
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Appearance is not modal or push (got %lu instead), do not show a banner #ItemViewController", (uint8_t *)&v22, 0xCu);
      }
      goto LABEL_8;
    }
  }
  id v14 = [(QLMarkupItemViewController *)self _showLatestBannerConfiguration];
  unsigned __int8 v15 = v14;
  if (v14)
  {
    id v7 = v14;
  }
  else
  {
    id v16 = [(QLMarkupItemViewController *)self _formFillingBannerConfiguration];
    double v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [(QLMarkupItemViewController *)self _showOriginalBannerConfiguration];
    }
    id v7 = v18;
  }
LABEL_9:

  return v7;
}

- (id)_showLatestBannerConfiguration
{
  double v3 = [(QLMarkupItemViewController *)self latestDocumentAttributes];
  if (v3)
  {
    id v29 = +[UIImage systemImageNamed:@"clock.arrow.circlepath"];
    id v28 = QLLocalizedString();
    uint64_t v4 = [v3 modifiedDate];
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    [v5 setDateStyle:1];
    [v5 setTimeStyle:0];
    [v5 setDoesRelativeDateFormatting:1];
    uint64_t v6 = [v5 stringFromDate:v4];
    id v7 = objc_opt_new();
    [v7 setDateStyle:0];
    [v7 setTimeStyle:1];
    [v7 setFormattingContext:5];
    uint64_t v8 = [v7 stringFromDate:v4];
    [v7 setLocalizedDateFormatFromTemplate:@"j"];
    id v27 = (void *)v4;
    double v9 = [v7 stringFromDate:v4];
    __int16 v10 = +[NSCharacterSet decimalDigitCharacterSet];
    BOOL v11 = [v10 invertedSet];
    v24 = v9;
    id v12 = [v9 componentsSeparatedByCharactersInSet:v11];
    id v13 = [v12 componentsJoinedByString:&stru_1000250F0];

    id v14 = objc_opt_new();
    unsigned __int8 v15 = [v14 numberFromString:v13];
    id v16 = [v15 integerValue];

    if (v16 == (id)1) {
      QLLocalizedStringWithDefaultValue();
    }
    else {
    id v18 = QLLocalizedString();
    }
    unsigned int v25 = (void *)v8;
    unsigned int v26 = (void *)v6;
    unsigned __int8 v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v6, v8);

    objc_initWeak(location, self);
    id v20 = QLLocalizedString();
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100011010;
    void v32[3] = &unk_100024B48;
    objc_copyWeak(&v33, location);
    id v21 = +[UIAction actionWithTitle:v20 image:0 identifier:0 handler:v32];

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10001122C;
    v30[3] = &unk_100024B48;
    objc_copyWeak(&v31, location);
    int v22 = +[UIAction actionWithTitle:&stru_1000250F0 image:0 identifier:0 handler:v30];
    double v17 = +[QuickLookContentEditorBannerConfiguration configurationWithImage:v29 title:v28 subtitle:v19 primaryAction:v21 dismissAction:v22];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(location);
  }
  else
  {
    double v17 = 0;
  }

  return v17;
}

- (id)_showOriginalBannerConfiguration
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  double v3 = [(QLMarkupItemViewController *)self originalDocumentAttributes];
  if (v3)
  {
    uint64_t v4 = QLLocalizedString();
    id v5 = [v3 receivedDate];
    uint64_t v6 = [(QLMarkupItemViewController *)self originalDateFormatProvider];
    id v7 = [v3 sender];
    uint64_t v8 = [v7 preferredFormattedName];
    double v9 = +[NSDate now];
    __int16 v10 = [v6 originalStringWithSender:v8 date:v5 now:v9];

    objc_initWeak(&location, self);
    BOOL v11 = QLLocalizedString();
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001154C;
    v18[3] = &unk_100024B48;
    objc_copyWeak(&v19, &location);
    id v12 = +[UIAction actionWithTitle:v11 image:0 identifier:0 handler:v18];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100011768;
    v16[3] = &unk_100024B48;
    objc_copyWeak(&v17, &location);
    id v13 = +[UIAction actionWithTitle:&stru_1000250F0 image:0 identifier:0 handler:v16];
    id v14 = +[QuickLookContentEditorBannerConfiguration configurationWithImage:0 title:v4 subtitle:v10 primaryAction:v12 dismissAction:v13];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)_formFillingBannerConfiguration
{
  if ([(QLMarkupItemViewController *)self didDismissFormFillingBanner])
  {
    double v3 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      double v3 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "User manually dismissed the form filling banner, do not show it #ItemViewController", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    if (((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
      && [(QLMarkupItemViewController *)self formDetectedInDocument])
    {
      unsigned int v4 = ![(QLMarkupItemViewController *)self autofillDetected];
    }
    else
    {
      unsigned int v4 = 1;
    }
    id v5 = [(QLMarkupItemViewController *)self markupViewController];
    unsigned int v6 = [v5 formFillingEnabled];

    if ([(QLMarkupItemViewController *)self shouldAllowEditingContents]
      && ((v4 | ![(QLMarkupItemViewController *)self canOfferFormFillingForOriginalDocument] | v6) & 1) == 0&& [(QLMarkupItemViewController *)self canShowFormFillingBanner])
    {
      id v7 = +[UIImage systemImageNamed:@"rectangle.and.pencil.and.ellipsis"];
      [(QLMarkupItemViewController *)self _isPreviewingUnconvertedDocument];
      double v9 = QLLocalizedString();
      objc_initWeak(buf, self);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100011BB0;
      v23[3] = &unk_100024E28;
      objc_copyWeak(&v24, buf);
      __int16 v10 = objc_retainBlock(v23);
      BOOL v11 = QLLocalizedString();
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100011DBC;
      v20[3] = &unk_100024EA0;
      objc_copyWeak(&v22, buf);
      id v12 = v10;
      id v21 = v12;
      id v13 = +[UIAction actionWithTitle:v11 image:0 identifier:0 handler:v20];

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100011E4C;
      v17[3] = &unk_100024EA0;
      objc_copyWeak(&v19, buf);
      id v14 = v12;
      id v18 = v14;
      unsigned __int8 v15 = +[UIAction actionWithTitle:&stru_1000250F0 image:0 identifier:0 handler:v17];
      id v16 = +[QuickLookContentEditorBannerConfiguration configurationWithImage:v7 title:v9 subtitle:0 primaryAction:v13 dismissAction:v15];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&v22);

      objc_destroyWeak(&v24);
      objc_destroyWeak(buf);

      goto LABEL_16;
    }
  }
  id v16 = 0;
LABEL_16:

  return v16;
}

- (void)updateBannerVisibility
{
  if ([(QLMarkupItemViewController *)self didReceiveFormFillingCallback]
    || [(QLMarkupItemViewController *)self didDismissFormFillingBanner])
  {
    [(QLMarkupItemViewController *)self _updateBannerVisibility];
  }
  else
  {
    dispatch_time_t v3 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011F80;
    block[3] = &unk_100024A30;
    block[4] = self;
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_updateBannerVisibility
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  dispatch_time_t v3 = [(QLMarkupItemViewController *)self configurationForBanner];
  unsigned int v4 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    unsigned int v4 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    __int16 v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Updating banner with configuration: %@ #ItemViewController", (uint8_t *)&v9, 0xCu);
  }
  id v5 = [(QLMarkupItemViewController *)self markupViewController];
  if (v3)
  {
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(QLMarkupItemViewController *)self markupViewController];
      [v7 showBannerWithConfiguration:v3];
LABEL_10:
    }
  }
  else
  {
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v7 = [(QLMarkupItemViewController *)self markupViewController];
      [v7 hideBanner];
      goto LABEL_10;
    }
  }
  [(QLMarkupItemViewController *)self updateContentFrame];
}

- (QuickLookContentEditor)markupViewController
{
  return self->_markupViewController;
}

- (void)setMarkupViewController:(id)a3
{
}

- (NSDictionary)writeOptionsForSaving
{
  return self->_writeOptionsForSaving;
}

- (void)setWriteOptionsForSaving:(id)a3
{
}

- (BOOL)formDetectedInDocument
{
  return self->_formDetectedInDocument;
}

- (void)setFormDetectedInDocument:(BOOL)a3
{
  self->_formDetectedInDocument = a3;
}

- (BOOL)autofillDetected
{
  return self->_autofillDetected;
}

- (void)setAutofillDetected:(BOOL)a3
{
  self->_autofillDetected = a3;
}

- (NSTimer)saveEditsPeriodicallyTimer
{
  return self->_saveEditsPeriodicallyTimer;
}

- (void)setSaveEditsPeriodicallyTimer:(id)a3
{
}

- (BOOL)hasChangesToUndo
{
  return self->_hasChangesToUndo;
}

- (BOOL)hasChangesToRedo
{
  return self->_hasChangesToRedo;
}

- (NSNumber)contentsAllowsEditingContents
{
  return self->_contentsAllowsEditingContents;
}

- (void)setContentsAllowsEditingContents:(id)a3
{
}

- (double)topInset
{
  return self->_topInset;
}

- (void)setTopInset:(double)a3
{
  self->_topInset = a3;
}

- (QLDelegateProxy)pdfDocumentDelegateProxy
{
  return self->_pdfDocumentDelegateProxy;
}

- (void)setPdfDocumentDelegateProxy:(id)a3
{
}

- (int64_t)currentEditNumber
{
  return self->_currentEditNumber;
}

- (void)setCurrentEditNumber:(int64_t)a3
{
  self->_currentEditNumber = a3;
}

- (void)setDocumentWorkflowsClient:(id)a3
{
}

- (SYDocumentAttributes)originalDocumentAttributes
{
  return self->_originalDocumentAttributes;
}

- (void)setOriginalDocumentAttributes:(id)a3
{
}

- (SYLastModifiedDocumentAttributes)latestDocumentAttributes
{
  return self->_latestDocumentAttributes;
}

- (void)setLatestDocumentAttributes:(id)a3
{
}

- (void)setOriginalDateFormatProvider:(id)a3
{
}

- (BOOL)didReceiveFormFillingCallback
{
  return self->_didReceiveFormFillingCallback;
}

- (void)setDidReceiveFormFillingCallback:(BOOL)a3
{
  self->_didReceiveFormFillingCallback = a3;
}

- (BOOL)canShowFormFillingBanner
{
  return self->_canShowFormFillingBanner;
}

- (void)setCanShowFormFillingBanner:(BOOL)a3
{
  self->_canShowFormFillingBanner = a3;
}

- (BOOL)didDismissFormFillingBanner
{
  return self->_didDismissFormFillingBanner;
}

- (void)setDidDismissFormFillingBanner:(BOOL)a3
{
  self->_didDismissFormFillingBanner = a3;
}

- (CGRect)markupContentFrame
{
  double x = self->_markupContentFrame.origin.x;
  double y = self->_markupContentFrame.origin.y;
  double width = self->_markupContentFrame.size.width;
  double height = self->_markupContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalDateFormatProvider, 0);
  objc_storeStrong((id *)&self->_latestDocumentAttributes, 0);
  objc_storeStrong((id *)&self->_originalDocumentAttributes, 0);
  objc_storeStrong((id *)&self->_documentWorkflowsClient, 0);
  objc_storeStrong((id *)&self->_pdfDocumentDelegateProxy, 0);
  objc_storeStrong((id *)&self->_contentsAllowsEditingContents, 0);
  objc_storeStrong((id *)&self->_saveEditsPeriodicallyTimer, 0);
  objc_storeStrong((id *)&self->_writeOptionsForSaving, 0);
  objc_storeStrong((id *)&self->_markupViewController, 0);
  objc_storeStrong((id *)&self->_hostViewControllerBackgroundColor, 0);

  objc_storeStrong((id *)&self->_savedFullScreenState, 0);
}

@end