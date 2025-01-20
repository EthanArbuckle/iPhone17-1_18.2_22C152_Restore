@interface SLComposeServiceViewController
+ (BOOL)_preventsAppearanceProxyCustomization;
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (id)_imageAttachmentLoadDownsamplePreviewQueue;
- (BOOL)_areAttachmentsReady;
- (BOOL)isContentValid;
- (BOOL)preventSheetPositionChanges;
- (BOOL)shouldAutorotate;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)suppressKeyboard;
- (BOOL)wasPresented;
- (CGRect)sheetFrameForViewController:(id)a3;
- (CGRect)sheetFrameForViewController:(id)a3 topSpaceProportion:(double)a4 topSpaceOffset:(double)a5;
- (CGSize)_intrinsicSheetSize;
- (NSArray)configurationItems;
- (NSMutableArray)constraints;
- (NSNumber)charactersRemaining;
- (NSString)contentText;
- (NSString)placeholder;
- (SLComposeServiceViewController)initWithCoder:(id)a3;
- (SLComposeServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SLComposeServiceViewController)initWithServiceIconImage:(id)a3;
- (SLSheetContentView)contentView;
- (SLSheetNavigationController)navigationController;
- (SLSheetRootViewController)sheetRootViewController;
- (UITextView)textView;
- (UIView)loadPreviewView;
- (UIView)sheetView;
- (UIViewController)autoCompletionViewController;
- (double)_sheetMinBottomMarginForVerticalSizeClass;
- (id)URLAttachments;
- (id)attachments;
- (id)previewImageSource;
- (id)sheetActions;
- (int64_t)_previewDisplayFormat;
- (unint64_t)maxImageAttachmentSize;
- (void)_addAttachment:(id)a3;
- (void)_adjustContentViewIntrinsicHeightForPreviewView;
- (void)_animateCardSendFinished;
- (void)_animateSheetCancelFinished;
- (void)_animateSheetPresentationFinished;
- (void)_animateVignetteMaskFromSheetFrame:(CGRect)a3 toSheetFrame:(CGRect)a4 duration:(double)a5;
- (void)_convertExtensionItemProvidersToAttachments:(id)a3;
- (void)_downsampleImageAttachment:(id)a3;
- (void)_imageAttachmentDataDidLoad:(id)a3;
- (void)_loadImageAttachmentData:(id)a3;
- (void)_loadPreviewView;
- (void)_performCommonInitialization:(id)a3;
- (void)_positionSheetViewAnimatedForViewController:(id)a3;
- (void)_positionSheetViewForViewController:(id)a3;
- (void)_positionVignetteForSheetFrame:(CGRect)a3;
- (void)_presentSheet;
- (void)_presentedViewControllerContentSizeDidChange;
- (void)_setViewControllerForTrackingSheetSize:(id)a3;
- (void)_updateContentViewWithCharactersRemaining;
- (void)_willAppearInRemoteViewController;
- (void)animateCardSendOrientation:(int64_t)a3;
- (void)animateSheetCancelWithDuration:(double)a3;
- (void)animateSheetPresentationWithDuration:(double)a3;
- (void)cancel;
- (void)cancelButtonTapped:(id)a3;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)didSelectCancel;
- (void)didSelectPost;
- (void)hideKeyboardAnimated:(BOOL)a3;
- (void)hideKeyboardWithAnimationTime:(double)a3;
- (void)keyboardDidChange:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)loadView;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)networkActivityIndicatorNotification:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)popConfigurationViewController;
- (void)positionSheetView;
- (void)postButtonTapped:(id)a3;
- (void)pushConfigurationViewController:(UIViewController *)viewController;
- (void)reloadConfigurationItems;
- (void)send;
- (void)setAutoCompletionViewController:(UIViewController *)autoCompletionViewController;
- (void)setCharactersRemaining:(NSNumber *)charactersRemaining;
- (void)setConstraints:(id)a3;
- (void)setContentView:(id)a3;
- (void)setHostProxy:(id)a3;
- (void)setMaxImageAttachmentSize:(unint64_t)a3;
- (void)setNavigationController:(id)a3;
- (void)setPlaceholder:(NSString *)placeholder;
- (void)setPostButtonTitle:(id)a3;
- (void)setPreventSheetPositionChanges:(BOOL)a3;
- (void)setServiceIconImage:(id)a3;
- (void)setSheetFrame:(CGRect)a3;
- (void)setSheetRootViewController:(id)a3;
- (void)setSuppressKeyboard:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)shouldShowNetworkActivityIndicator:(BOOL)a3;
- (void)showKeyboardAnimated:(BOOL)a3;
- (void)showKeyboardWithAnimationTime:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateKeyboardSize;
- (void)updateSheetForVerticalSizeClass;
- (void)validateContent;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SLComposeServiceViewController

- (void)_performCommonInitialization:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIconImage, a3);
  id v5 = a3;
  self->_unfulfilledItemProviderRepresentations = 0;
  v6 = (NSMutableArray *)objc_opt_new();
  attachments = self->_attachments;
  self->_attachments = v6;

  v8 = (NSMutableArray *)objc_opt_new();
  constraints = self->_constraints;
  self->_constraints = v8;

  self->_triggerPresentationAnimationOnKeyboard = 1;
  self->_maxImageAttachmentSize = 2048000;
  v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:self selector:sel_keyboardDidChange_ name:*MEMORY[0x1E4F43AB8] object:0];

  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4F43B88] object:0];

  v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 addObserver:self selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4F43B80] object:0];

  v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 addObserver:self selector:sel_networkActivityIndicatorNotification_ name:SLShowNetworkActivityIndicatorNotification object:0];

  v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 addObserver:self selector:sel_networkActivityIndicatorNotification_ name:SLHideNetworkActivityIndicatorNotification object:0];

  [(SLComposeServiceViewController *)self setShouldForceNonAnimatedTransition:1];
}

- (SLComposeServiceViewController)initWithServiceIconImage:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 6, @"SLComposeServiceViewController initWithServiceIconImage:");
  v9.receiver = self;
  v9.super_class = (Class)SLComposeServiceViewController;
  v6 = [(SLComposeServiceViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    [(SLComposeServiceViewController *)v6 _performCommonInitialization:v5];
  }

  return v7;
}

- (SLComposeServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  _SLLog(v4, 7, @"SLComposeServiceViewController initWithNibName:bundle:");
  v11.receiver = self;
  v11.super_class = (Class)SLComposeServiceViewController;
  objc_super v9 = [(SLComposeServiceViewController *)&v11 initWithNibName:v8 bundle:v7];

  if (v9) {
    [(SLComposeServiceViewController *)v9 _performCommonInitialization:0];
  }
  return v9;
}

- (SLComposeServiceViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 7, @"SLComposeServiceViewController initWithCoder:");
  v8.receiver = self;
  v8.super_class = (Class)SLComposeServiceViewController;
  v6 = [(SLComposeServiceViewController *)&v8 initWithCoder:v5];

  if (v6) {
    [(SLComposeServiceViewController *)v6 _performCommonInitialization:0];
  }
  return v6;
}

- (void)dealloc
{
  _SLLog(v2, 7, @"SLComposeServiceViewController dealloc %@");
  -[SLComposeServiceViewController _setViewControllerForTrackingSheetSize:](self, "_setViewControllerForTrackingSheetSize:", 0, self);
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)SLComposeServiceViewController;
  [(SLComposeServiceViewController *)&v6 dealloc];
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (id)previewImageSource
{
  previewImageSource = self->_previewImageSource;
  if (!previewImageSource)
  {
    uint64_t v4 = objc_alloc_init(SLSheetPreviewImageSource);
    id v5 = self->_previewImageSource;
    self->_previewImageSource = v4;

    previewImageSource = self->_previewImageSource;
  }

  return previewImageSource;
}

- (void)_positionSheetViewForViewController:(id)a3
{
  id v13 = a3;
  BOOL v5 = [(SLComposeServiceViewController *)self preventSheetPositionChanges];
  objc_super v6 = @"NO";
  if (v5) {
    objc_super v6 = @"YES";
  }
  v12 = v6;
  _SLLog(v3, 7, @"SLComposeServiceViewController _positionSheetViewForViewController: %@ preventSheetPositionChanges %@");
  if (![(SLComposeServiceViewController *)self preventSheetPositionChanges])
  {
    [(SLComposeServiceViewController *)self sheetFrameForViewController:v13];
    double x = v15.origin.x;
    double y = v15.origin.y;
    double width = v15.size.width;
    double height = v15.size.height;
    objc_super v11 = NSStringFromCGRect(v15);
    _SLLog(v3, 7, @"SLComposeServiceViewController _positionSheetViewForViewController new sheet frame is %@");

    -[SLComposeServiceViewController setSheetFrame:](self, "setSheetFrame:", x, y, width, height, v11);
    -[SLComposeServiceViewController _positionVignetteForSheetFrame:](self, "_positionVignetteForSheetFrame:", x, y, width, height);
  }
}

- (void)positionSheetView
{
  _SLLog(v2, 7, @"SLComposeServiceViewController positionSheetView");
  id v5 = [(SLComposeServiceViewController *)self navigationController];
  uint64_t v4 = [v5 topViewController];
  [(SLComposeServiceViewController *)self _positionSheetViewForViewController:v4];
}

- (void)updateSheetForVerticalSizeClass
{
  uint64_t v4 = (void *)MEMORY[0x1E4F29238];
  id v5 = [(SLComposeServiceViewController *)self contentView];
  [v5 intrinsicContentSize];
  id v7 = objc_msgSend(v4, "valueWithCGSize:");
  _SLLog(v2, 7, @"SLComposeServiceViewController updateSheetForVerticalSizeClass self.contentView.intrinsicContentSize %@");

  id v8 = [(SLComposeServiceViewController *)self sheetRootViewController];
  objc_super v6 = [(SLComposeServiceViewController *)self contentView];
  [v6 intrinsicContentSize];
  objc_msgSend(v8, "updateContentViewSize:");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SLComposeServiceViewController;
  [(SLComposeServiceViewController *)&v21 traitCollectionDidChange:v5];
  objc_super v6 = [(SLComposeServiceViewController *)self traitCollection];
  uint64_t v7 = [v6 verticalSizeClass];
  uint64_t v8 = [v5 verticalSizeClass];

  if (v7 != v8)
  {
    objc_super v9 = NSNumber;
    v10 = [(SLComposeServiceViewController *)self traitCollection];
    objc_super v11 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "verticalSizeClass"));
    v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "verticalSizeClass"));
    _SLLog(v3, 7, @"SLComposeServiceViewController traitCollectionDidChange verticalSizeClass changed to %@ from %@");

    if (self->_waitingForAnimateAlongsideTransitionBlock)
    {
      v19 = objc_msgSend(NSNumber, "numberWithBool:", 1, v11, v20);
      _SLLog(v3, 7, @"SLComposeServiceViewController traitCollectionDidChange skipping work because _waitingForAnimateAlongsideTransitionBlock is %@");
    }
    else
    {
      _SLLog(v3, 7, @"SLComposeServiceViewController traitCollectionDidChange calling updateSheetForVerticalSizeClass");
      [(SLComposeServiceViewController *)self updateSheetForVerticalSizeClass];
    }
  }
  v12 = [(SLComposeServiceViewController *)self traitCollection];
  id v13 = [v12 preferredContentSizeCategory];
  v14 = [v5 preferredContentSizeCategory];
  char v15 = [v13 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
    v16 = [(SLComposeServiceViewController *)self contentView];
    v17 = [v16 accessoryView];

    if (v17)
    {
      v18 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43888]];
      [v17 setFont:v18];
    }
  }
}

- (void)keyboardWillShow:(id)a3
{
  _SLLog(v3, 7, @"keyboardWillShow");
  if (self->_triggerPresentationAnimationOnKeyboard)
  {
    [(SLComposeServiceViewController *)self _presentSheet];
  }
}

- (void)showKeyboardAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(SLComposeServiceViewController *)self suppressKeyboard])
  {
    id v5 = [(SLComposeServiceViewController *)self contentView];
    objc_super v6 = [v5 textView];
    [v6 becomeFirstResponder];

    if ((UIKeyboardIsAutomaticAppearanceEnabled() & 1) == 0)
    {
      MEMORY[0x1F4102CD0](v3);
    }
  }
}

- (void)hideKeyboardAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(SLComposeServiceViewController *)self contentView];
  id v5 = [v4 textView];
  [v5 resignFirstResponder];

  if ((UIKeyboardIsAutomaticAppearanceEnabled() & 1) == 0)
  {
    MEMORY[0x1F4102CE0](v3);
  }
}

- (void)showKeyboardWithAnimationTime:(double)a3
{
  if (![(SLComposeServiceViewController *)self suppressKeyboard])
  {
    id v5 = [(SLComposeServiceViewController *)self contentView];
    [v5 becomeFirstResponder];

    if (UIKeyboardIsAutomaticAppearanceEnabled())
    {
      v6.n128_f64[0] = a3;
      MEMORY[0x1F4102D10](0, v6);
    }
    else
    {
      v6.n128_f64[0] = a3;
      MEMORY[0x1F4102CD8](0, v6);
    }
  }
}

- (void)hideKeyboardWithAnimationTime:(double)a3
{
  uint64_t v4 = [(SLComposeServiceViewController *)self contentView];
  [v4 resignFirstResponder];

  if (UIKeyboardIsAutomaticAppearanceEnabled())
  {
    v5.n128_f64[0] = a3;
    MEMORY[0x1F4102D30](0, v5);
  }
  else
  {
    v5.n128_f64[0] = a3;
    MEMORY[0x1F4102CE8](0, v5);
  }
}

- (NSNumber)charactersRemaining
{
  return self->_charactersRemaining;
}

- (void)setCharactersRemaining:(NSNumber *)charactersRemaining
{
  objc_storeStrong((id *)&self->_charactersRemaining, charactersRemaining);
  uint64_t v4 = [(SLComposeServiceViewController *)self contentView];

  if (v4)
  {
    [(SLComposeServiceViewController *)self _updateContentViewWithCharactersRemaining];
  }
}

- (void)_updateContentViewWithCharactersRemaining
{
  charactersRemaining = self->_charactersRemaining;
  uint64_t v4 = [(SLComposeServiceViewController *)self contentView];
  id v15 = v4;
  if (charactersRemaining)
  {
    uint64_t v5 = [v4 accessoryView];

    id v15 = (id)v5;
    if (!v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F42B38]);
      id v15 = (id)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      uint64_t v7 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43888]];
      [v15 setFont:v7];

      uint64_t v8 = [MEMORY[0x1E4F428B8] clearColor];
      [v15 setBackgroundColor:v8];

      [v15 setAlpha:0.699999988];
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v10 = [v9 stringFromNumber:self->_charactersRemaining];
    [v15 setText:v10];

    objc_super v11 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [v15 setTextColor:v11];

    v12 = [(SLComposeServiceViewController *)self contentView];
    id v13 = [v12 accessoryView];

    if (!v13)
    {
      v14 = [(SLComposeServiceViewController *)self contentView];
      [v14 setAccessoryView:v15];
    }
  }
  else
  {
    [v4 setAccessoryView:0];
  }
}

- (UITextView)textView
{
  uint64_t v2 = [(SLComposeServiceViewController *)self contentView];
  BOOL v3 = [v2 textView];

  return (UITextView *)v3;
}

- (NSString)contentText
{
  uint64_t v2 = [(SLComposeServiceViewController *)self textView];
  BOOL v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setPlaceholder:(NSString *)placeholder
{
  objc_storeStrong((id *)&self->_placeholder, placeholder);
  uint64_t v5 = placeholder;
  id v6 = [(SLComposeServiceViewController *)self contentView];
  uint64_t v7 = [v6 placeholderLabel];
  [v7 setText:v5];

  uint64_t v8 = [(SLComposeServiceViewController *)self contentView];
  id v9 = [v8 placeholderLabel];
  [v9 sizeToFit];

  id v10 = [(SLComposeServiceViewController *)self contentView];
  [v10 setNeedsLayout];
}

- (id)attachments
{
  return self->_attachments;
}

- (BOOL)isContentValid
{
  return 1;
}

- (void)_addAttachment:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 6, @"SLComposeServiceViewController _addAttachment: %@");
  -[NSMutableArray addObject:](self->_attachments, "addObject:", v5, v5);
  if (self->_maxImageAttachmentSize && ![v5 type])
  {
    [v5 setDownsampleStatus:1];
    [(SLComposeServiceViewController *)self _loadImageAttachmentData:v5];
  }
  [(SLComposeServiceViewController *)self validateContent];
}

- (BOOL)_areAttachmentsReady
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_unfulfilledItemProviderRepresentations) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(SLComposeServiceViewController *)self attachments];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 downsampleStatus] == 2 || objc_msgSend(v8, "downsampleStatus") == 1)
        {
          BOOL v2 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      BOOL v2 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v2 = 1;
  }
LABEL_15:

  return v2;
}

- (void)validateContent
{
  uint64_t v3 = [(SLComposeServiceViewController *)self contentView];
  uint64_t v4 = [v3 textView];
  uint64_t v5 = [v4 text];
  BOOL v6 = [v5 length] != 0;
  uint64_t v7 = [(SLComposeServiceViewController *)self contentView];
  uint64_t v8 = [v7 placeholderLabel];
  [v8 setHidden:v6];

  if ([(SLComposeServiceViewController *)self isContentValid]) {
    BOOL v9 = [(SLComposeServiceViewController *)self _areAttachmentsReady];
  }
  else {
    BOOL v9 = 0;
  }
  id v10 = [(SLComposeServiceViewController *)self sheetRootViewController];
  [v10 setPostButtonEnabled:v9];
}

- (id)URLAttachments
{
  BOOL v2 = [(SLComposeServiceViewController *)self attachments];
  uint64_t v3 = [v2 objectsPassingTest:&__block_literal_global_6];

  return v3;
}

BOOL __48__SLComposeServiceViewController_URLAttachments__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 type] == 4
    || [v2 type] == 5
    || [v2 type] == 6
    || [v2 type] == 7;

  return v3;
}

+ (id)_imageAttachmentLoadDownsamplePreviewQueue
{
  if (_imageAttachmentLoadDownsamplePreviewQueue_onceToken != -1) {
    dispatch_once(&_imageAttachmentLoadDownsamplePreviewQueue_onceToken, &__block_literal_global_72);
  }
  id v2 = (void *)_imageAttachmentLoadDownsamplePreviewQueue__queue;

  return v2;
}

void __76__SLComposeServiceViewController__imageAttachmentLoadDownsamplePreviewQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.social.imageAttachmentLoadDownsamplePreview", v2);
  v1 = (void *)_imageAttachmentLoadDownsamplePreviewQueue__queue;
  _imageAttachmentLoadDownsamplePreviewQueue__queue = (uint64_t)v0;
}

- (void)_loadImageAttachmentData:(id)a3
{
  id v5 = a3;
  if (([v5 startedPayloadLoad] & 1) == 0)
  {
    [v5 setStartedPayloadLoad:1];
    _SLLog(v3, 7, @"SLComposeServiceViewController _loadImageAttachmentData: %@");
    objc_initWeak(&location, self);
    objc_initWeak(&from, v5);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke;
    v27[3] = &unk_1E6467EC8;
    objc_copyWeak(&v28, &location);
    objc_copyWeak(&v29, &from);
    BOOL v6 = (void (**)(void, void, void))MEMORY[0x1C876A6A0](v27);
    uint64_t v7 = objc_msgSend(v5, "identifier", v5);
    uint64_t v8 = [v5 itemProvider];
    BOOL v9 = [v5 typeIdentifier];
    id v10 = [v5 payload];

    if (v10)
    {
      v6[2](v6, 0, 0);
    }
    else
    {
      long long v11 = [v5 payloadSourceFileURL];

      if (v11)
      {
        v16 = [v5 payloadSourceFileURL];
        _SLLog(v3, 7, @"SLComposeServiceViewController _loadImageAttachmentData: %@ loading from %@");

        long long v12 = objc_msgSend(v5, "payloadSourceFileURL", v7, v16);
        long long v13 = +[SLComposeServiceViewController _imageAttachmentLoadDownsamplePreviewQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_3;
        block[3] = &unk_1E64673E8;
        id v23 = v12;
        id v24 = v7;
        id v25 = v9;
        v26 = v6;
        id v14 = v12;
        dispatch_async(v13, block);
      }
      else
      {
        _SLLog(v3, 7, @"SLComposeServiceViewController _loadImageAttachmentData: %@ loading from itemProvider for typeIdentifier %@");
        uint64_t v15 = +[SLComposeServiceViewController _imageAttachmentLoadDownsamplePreviewQueue];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_4;
        v17[3] = &unk_1E64673E8;
        id v18 = v8;
        id v19 = v9;
        id v20 = v7;
        objc_super v21 = v6;
        dispatch_async(v15, v17);

        id v14 = v18;
      }
    }
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_2;
  v9[3] = &unk_1E6467EA0;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
}

void __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && v2)
  {
    if (*(void *)(a1 + 32)) {
      objc_msgSend(v2, "setPayload:");
    }
    [WeakRetained _imageAttachmentDataDidLoad:v2];
  }
  uint64_t v3 = *(NSObject **)(a1 + 40);
  if (v3) {
    dispatch_semaphore_signal(v3);
  }
}

void __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_3(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = 0;
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3 options:1 error:&v8];
  id v5 = v8;
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
  _SLLog(v1, 7, @"SLComposeServiceViewController _loadImageAttachmentData: %@ typeIdentifier %@ got data length %@ error%@");

  (*(void (**)(void, void *, void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v4, 0, v6);
}

void __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_4(id *a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = a1[4];
  id v4 = a1[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_5;
  v6[3] = &unk_1E6467F40;
  id v7 = a1[6];
  id v8 = a1[5];
  id v11 = a1[7];
  dispatch_semaphore_t v9 = v2;
  id v10 = a1[4];
  id v5 = v2;
  [v3 loadItemForTypeIdentifier:v4 options:0 completionHandler:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

void __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  dispatch_semaphore_t v9 = NSNumber;
  id v10 = a3;
  v16 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
  id v17 = v10;
  _SLLog(v3, 7, @"SLComposeServiceViewController _loadImageAttachmentData: %@ typeIdentifier %@ got data length %@ error%@");

  if (v6)
  {
    (*(void (**)(void, id, void, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v6, *(void *)(a1 + 48), v11);
  }
  else
  {
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    id v13 = +[SLComposeServiceViewController _imageAttachmentLoadDownsamplePreviewQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_6;
    block[3] = &unk_1E6467F18;
    id v19 = *(id *)(a1 + 56);
    id v20 = *(id *)(a1 + 40);
    id v21 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 64);
    dispatch_semaphore_t v22 = v12;
    id v23 = v14;
    uint64_t v15 = v12;
    dispatch_async(v13, block);

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

void __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_6(uint64_t a1)
{
  dispatch_semaphore_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_7;
  v4[3] = &unk_1E6467EF0;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 56);
  [v2 loadItemForTypeIdentifier:v3 options:0 completionHandler:v4];
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);
}

void __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_7(uint64_t a1, void *a2)
{
  image = a2;
  _SLLog(v2, 7, @"SLComposeServiceViewController _loadImageAttachmentData: %@ typeIdentifier %@ got image %@ error%@");
  if (image)
  {
    id v5 = UIImageJPEGRepresentation(image, 0.8);
  }
  else
  {
    id v5 = 0;
  }
  (*(void (**)(void, void *, void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v5, *(void *)(a1 + 48), v4);
}

- (void)_imageAttachmentDataDidLoad:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 7, @"SLComposeServiceViewController _imageAttachmentDataDidLoad: %@");
  if (objc_msgSend(v5, "downsampleStatus", v5) == 1) {
    [(SLComposeServiceViewController *)self _downsampleImageAttachment:v5];
  }
  if ([v5 needsAnotherPreviewGeneration])
  {
    id v6 = [(SLComposeServiceViewController *)self contentView];
    id v7 = [v6 previewView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      dispatch_semaphore_t v9 = [(SLComposeServiceViewController *)self contentView];
      id v10 = [v9 previewView];
      objc_initWeak(&location, v10);

      uint64_t v11 = [(SLComposeServiceViewController *)self previewImageSource];
      dispatch_semaphore_t v12 = +[SLComposeServiceViewController _imageAttachmentLoadDownsamplePreviewQueue];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __62__SLComposeServiceViewController__imageAttachmentDataDidLoad___block_invoke;
      v13[3] = &unk_1E6467F90;
      objc_copyWeak(&v15, &location);
      id v14 = v5;
      [v11 previewImageForAttachment:v14 queueToBlockWhileDownsampling:v12 resultBlock:v13];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
  [(SLComposeServiceViewController *)self validateContent];
}

void __62__SLComposeServiceViewController__imageAttachmentDataDidLoad___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SLComposeServiceViewController__imageAttachmentDataDidLoad___block_invoke_2;
  v7[3] = &unk_1E6467F68;
  objc_copyWeak(v10, (id *)(a1 + 40));
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  v10[1] = *(id *)&a3;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(v10);
}

uint64_t __62__SLComposeServiceViewController__imageAttachmentDataDidLoad___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v6 = WeakRetained;
    if (v3)
    {
      [WeakRetained setPreviewImage:v3 forAttachment:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v4 = +[SLSheetImagePreviewView fallbackPreviewImage];
      [v6 setPreviewImage:v4 forAttachment:*(void *)(a1 + 40)];
    }
    if (*(double *)(a1 + 56) > 0.0 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v6 setVideoDuration:*(double *)(a1 + 56)];
    }
  }

  return MEMORY[0x1F4181878]();
}

- (void)_downsampleImageAttachment:(id)a3
{
  id v5 = a3;
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[SLComposeServiceViewController maxImageAttachmentSize](self, "maxImageAttachmentSize"));
  _SLLog(v3, 6, @"SLComposeServiceViewController _downsampleImageAttachment: %@ starting downsampling of attached image to max size %@");

  objc_msgSend(v5, "setDownsampleStatus:", 2, v5, v11);
  objc_initWeak(&location, self);
  id v6 = [v5 payload];
  id v7 = [(SLComposeServiceViewController *)self maxImageAttachmentSize];
  id v8 = +[SLComposeServiceViewController _imageAttachmentLoadDownsamplePreviewQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__SLComposeServiceViewController__downsampleImageAttachment___block_invoke;
  block[3] = &unk_1E6468008;
  v15[1] = v7;
  id v13 = v6;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  objc_copyWeak(v15, &location);
  dispatch_async(v8, block);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void __61__SLComposeServiceViewController__downsampleImageAttachment___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SLComposeServiceViewController__downsampleImageAttachment___block_invoke_2;
  v6[3] = &unk_1E6467FE0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v5 = v2;
  id v8 = v5;
  +[SLImageDownsampling downsampleImageData:v4 toMaxByteSize:v3 resultsHandler:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  objc_destroyWeak(&v9);
}

void __61__SLComposeServiceViewController__downsampleImageAttachment___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__SLComposeServiceViewController__downsampleImageAttachment___block_invoke_3;
  v5[3] = &unk_1E6467FB8;
  id v6 = a1[4];
  id v7 = v3;
  id v4 = v3;
  objc_copyWeak(&v9, a1 + 6);
  id v8 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v9);
}

void __61__SLComposeServiceViewController__downsampleImageAttachment___block_invoke_3(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "length"));
  _SLLog(v1, 6, @"SLComposeServiceViewController _downsampleImageAttachment: %@ downsampling complete, data size is %@");

  objc_msgSend(*(id *)(a1 + 32), "setPayload:", *(void *)(a1 + 40), v3, v4);
  [*(id *)(a1 + 32) setDownsampleStatus:3];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained) {
    [WeakRetained validateContent];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_loadPreviewView
{
  _SLLog(v2, 6, @"SLComposeServiceViewController:_loadPreviewView");
  uint64_t v4 = [(SLComposeServiceViewController *)self loadPreviewView];
  id v8 = (id)v4;
  if (v4)
  {
    uint64_t v7 = v4;
    _SLLog(v2, 6, @"SLComposeServiceViewController:_loadPreviewView preview created: %@");
    id v5 = [(SLComposeServiceViewController *)self contentView];
    [v5 setPreviewView:v8];

    id v6 = [(SLComposeServiceViewController *)self view];
    [v6 setNeedsUpdateConstraints];

    [(SLComposeServiceViewController *)self _adjustContentViewIntrinsicHeightForPreviewView];
  }
  else
  {
    _SLLog(v2, 6, @"Preview view creation failed or not needed");
  }
}

- (void)_adjustContentViewIntrinsicHeightForPreviewView
{
  id v18 = [MEMORY[0x1E4F42948] currentDevice];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 != 1) {
      return;
    }
    id v5 = [(SLComposeServiceViewController *)self contentView];
    id v6 = [v5 previewView];
    [v6 intrinsicContentSize];
    double v8 = v7;

    double v9 = v8 + -90.0 + 120.0;
    if (v9 == 120.0) {
      return;
    }
    id v10 = [MEMORY[0x1E4F42D90] mainScreen];
    [v10 scale];
    double v12 = v11;

    double v13 = round(v9 + v9) * 0.5;
    double v14 = round(v9);
    if (v12 <= 1.0) {
      double v15 = v14;
    }
    else {
      double v15 = v13;
    }
    v16 = [(SLComposeServiceViewController *)self contentView];
    objc_msgSend(v16, "setIntrinsicSize:forVerticalSizeClass:", 2, *MEMORY[0x1E4F43ED8], v15);

    id v18 = [(SLComposeServiceViewController *)self sheetRootViewController];
    id v17 = [(SLComposeServiceViewController *)self contentView];
    [v17 intrinsicContentSize];
    objc_msgSend(v18, "updateContentViewSize:");
  }
}

- (int64_t)_previewDisplayFormat
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = [(SLComposeServiceViewController *)self attachments];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        unint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) type];
        if (v8 > 9) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = qword_1C2CFA9A8[v8];
        }
        if (v5 <= v9) {
          int64_t v5 = v9;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (UIView)loadPreviewView
{
  uint64_t v3 = self;
  v60[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(SLComposeServiceViewController *)self attachments];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    switch([(SLComposeServiceViewController *)v3 _previewDisplayFormat])
    {
      case 1:
        uint64_t v6 = [(SLComposeServiceViewController *)v3 attachments];
        double v7 = [v6 firstObjectPassingTest:&__block_literal_global_128];

        if (!v7) {
          goto LABEL_30;
        }
        unint64_t v8 = SLSheetURLPreviewView;
        goto LABEL_28;
      case 2:
        long long v11 = [(SLComposeServiceViewController *)v3 attachments];
        double v7 = [v11 firstObjectPassingTest:&__block_literal_global_125];

        if (!v7) {
          goto LABEL_30;
        }
        unint64_t v8 = SLSheetVideoPreviewView;
        goto LABEL_28;
      case 3:
        long long v12 = [(SLComposeServiceViewController *)v3 attachments];
        long long v13 = [v12 objectsPassingTest:&__block_literal_global_122];

        v44 = v13;
        if ([v13 count])
        {
          long long v14 = [[SLSheetPhotoAlbumImageView alloc] initWithPrincipalAttachments:v13];
          double v7 = 0;
          goto LABEL_32;
        }
        double v7 = 0;
        goto LABEL_31;
      case 4:
        double v15 = [(SLComposeServiceViewController *)v3 attachments];
        double v7 = [v15 firstObjectPassingTest:&__block_literal_global_131];

        if (!v7) {
          goto LABEL_30;
        }
        uint64_t v16 = [v7 previewImage];
        if (v16)
        {
          id v17 = (void *)v16;
          BOOL v18 = 0;
LABEL_15:

          goto LABEL_16;
        }
        if ([v7 itemProviderPreviewType] != 1)
        {
          _SLLog(v2, 7, @"SLComposeServiceViewController looking for image attachment to act as preview for SLAttachmentDisplayMusicAlbum");
          v41 = [(SLComposeServiceViewController *)v3 attachments];
          id v17 = [v41 firstObjectPassingTest:&__block_literal_global_136];

          BOOL v18 = v17 == 0;
          if (v17)
          {
            _SLLog(v2, 7, @"SLComposeServiceViewController did find image attachment %@");
            id v42 = v17;

            double v7 = v42;
          }
          goto LABEL_15;
        }
        BOOL v18 = 0;
LABEL_16:
        long long v14 = objc_alloc_init(SLSheetBevelledImageView);
        [(SLSheetPhotoAlbumImageView *)v14 setNeedsURLPlaceholderImage:v18];
LABEL_29:
        v44 = 0;
        goto LABEL_32;
      case 5:
        id v19 = [(SLComposeServiceViewController *)v3 attachments];
        double v7 = [v19 firstObjectPassingTest:&__block_literal_global_142];

        if (!v7) {
          goto LABEL_30;
        }
        id v20 = [v7 previewImage];
        if (v20)
        {

          goto LABEL_27;
        }
        if ([v7 itemProviderPreviewType] == 1
          || ([(SLComposeServiceViewController *)v3 attachments],
              dispatch_semaphore_t v22 = objc_claimAutoreleasedReturnValue(),
              [v22 firstObjectPassingTest:&__block_literal_global_144],
              uint64_t v23 = objc_claimAutoreleasedReturnValue(),
              v7,
              v22,
              (double v7 = (void *)v23) != 0))
        {
LABEL_27:
          unint64_t v8 = SLSheetBevelledImageView;
LABEL_28:
          long long v14 = (SLSheetPhotoAlbumImageView *)objc_alloc_init(v8);
          goto LABEL_29;
        }
LABEL_30:
        v44 = 0;
LABEL_31:
        long long v14 = 0;
LABEL_32:
        _SLLog(v2, 6, @"SLComposeServiceViewController - preview attachment is %@");
        v43 = v14;
        _SLLog(v2, 7, @"SLComposeServiceViewController - previewView %@");
        if (v7)
        {
          v60[0] = v7;
          id v24 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v60, 1, v14);
          [(SLSheetImagePreviewView *)v14 setPrincipalAttachments:v24];
        }
        v45 = v7;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id obj = [(SLSheetImagePreviewView *)v14 principalAttachments];
        uint64_t v25 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v56;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v56 != v27) {
                objc_enumerationMutation(obj);
              }
              id v29 = *(void **)(*((void *)&v55 + 1) + 8 * i);
              v30 = [v29 previewImage];

              if (v30)
              {
                v31 = [v29 previewImage];
                [(SLSheetPhotoAlbumImageView *)v14 setPreviewImage:v31 forAttachment:v29];
              }
              else
              {
                _SLLog(v2, 6, @"SLComposeServiceViewController - attachment does not have a preview");
                v51[0] = MEMORY[0x1E4F143A8];
                v51[1] = 3221225472;
                v51[2] = __49__SLComposeServiceViewController_loadPreviewView__block_invoke_9;
                v51[3] = &unk_1E6468080;
                v32 = v14;
                v52 = v32;
                v53 = v29;
                v54 = v3;
                v33 = (void (**)(void))MEMORY[0x1C876A6A0](v51);
                [(SLSheetImagePreviewView *)v32 ensurePlaceholderPreviewImage];
                uint64_t v34 = [v29 itemProvider];
                if (!v34
                  || (v35 = (void *)v34,
                      v36 = v3,
                      uint64_t v37 = [v29 itemProviderPreviewType],
                      v35,
                      BOOL v38 = v37 == 2,
                      uint64_t v3 = v36,
                      v38))
                {
                  v33[2](v33);
                }
                else
                {
                  _SLLog(v2, 7, @"SLComposeServiceViewController trying to load itemProvider previewImage");
                  v39 = [v29 itemProvider];
                  v47[0] = MEMORY[0x1E4F143A8];
                  v47[1] = 3221225472;
                  v47[2] = __49__SLComposeServiceViewController_loadPreviewView__block_invoke_13;
                  v47[3] = &unk_1E64680A8;
                  v48 = v32;
                  v49 = v29;
                  v50 = v33;
                  [v39 loadPreviewImageWithOptions:0 completionHandler:v47];

                  uint64_t v3 = v36;
                }

                v31 = v52;
              }
            }
            uint64_t v26 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
          }
          while (v26);
        }

        uint64_t v9 = v14;
        break;
      case 6:
        id v21 = [(SLComposeServiceViewController *)v3 attachments];
        double v7 = [v21 firstObjectPassingTest:&__block_literal_global_146];

        if (!v7) {
          goto LABEL_30;
        }
        unint64_t v8 = SLSheetPreComposedAppIconImageView;
        goto LABEL_28;
      default:
        id v10 = [(SLComposeServiceViewController *)v3 attachments];
        double v7 = [v10 objectAtIndex:0];

        if (!v7) {
          goto LABEL_30;
        }
        goto LABEL_27;
    }
  }
  else
  {
    _SLLog(v2, 6, @"SLComposeServiceViewController - Cannot create preview view with no attachments");
    uint64_t v9 = 0;
  }

  return (UIView *)v9;
}

BOOL __49__SLComposeServiceViewController_loadPreviewView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = ![v2 type]
    || [v2 type] == 2
    || [v2 type] == 8
    || [v2 type] == 9;

  return v3;
}

BOOL __49__SLComposeServiceViewController_loadPreviewView__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 type] == 8 || objc_msgSend(v2, "type") == 9;

  return v3;
}

BOOL __49__SLComposeServiceViewController_loadPreviewView__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 type] == 4;
}

BOOL __49__SLComposeServiceViewController_loadPreviewView__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 type] == 5;
}

BOOL __49__SLComposeServiceViewController_loadPreviewView__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type]) {
    BOOL v3 = [v2 type] == 2;
  }
  else {
    BOOL v3 = 1;
  }

  return v3;
}

BOOL __49__SLComposeServiceViewController_loadPreviewView__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 type] == 6;
}

BOOL __49__SLComposeServiceViewController_loadPreviewView__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type]) {
    BOOL v3 = [v2 type] == 2;
  }
  else {
    BOOL v3 = 1;
  }

  return v3;
}

BOOL __49__SLComposeServiceViewController_loadPreviewView__block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 type] == 7;
}

void __49__SLComposeServiceViewController_loadPreviewView__block_invoke_9(uint64_t a1)
{
  if (([*(id *)(a1 + 32) generatePreviewImageFromAttachments] & 1) == 0)
  {
    if (![*(id *)(a1 + 40) type]
      || [*(id *)(a1 + 40) type] == 2
      || [*(id *)(a1 + 40) type] == 8
      || [*(id *)(a1 + 40) type] == 9)
    {
      _SLLog(v1, 6, @"SLComposeServiceViewController - creating preview image for image or video attachment");
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__SLComposeServiceViewController_loadPreviewView__block_invoke_10;
      block[3] = &unk_1E6468080;
      int8x16_t v6 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
      id v7 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      BOOL v3 = *(void **)(a1 + 32);
      id v4 = +[SLSheetImagePreviewView fallbackPreviewImage];
      [v3 setPreviewImage:v4 forAttachment:*(void *)(a1 + 40)];
    }
  }
}

void __49__SLComposeServiceViewController_loadPreviewView__block_invoke_10(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) previewImageSource];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = +[SLComposeServiceViewController _imageAttachmentLoadDownsamplePreviewQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__SLComposeServiceViewController_loadPreviewView__block_invoke_11;
  v5[3] = &unk_1E6468058;
  int8x16_t v6 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  id v7 = *(id *)(a1 + 48);
  [v2 previewImageForAttachment:v3 queueToBlockWhileDownsampling:v4 resultBlock:v5];
}

void __49__SLComposeServiceViewController_loadPreviewView__block_invoke_11(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SLComposeServiceViewController_loadPreviewView__block_invoke_12;
  block[3] = &unk_1E6468030;
  id v8 = v5;
  long long v9 = *(_OWORD *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  double v11 = a3;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __49__SLComposeServiceViewController_loadPreviewView__block_invoke_12(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    [*(id *)(a1 + 56) setPreviewImage:v2 forAttachment:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 40) payload];
    if (v3)
    {
    }
    else if (![*(id *)(a1 + 40) type])
    {
      [*(id *)(a1 + 40) setNeedsAnotherPreviewGeneration:1];
      [*(id *)(a1 + 48) _loadImageAttachmentData:*(void *)(a1 + 40)];
      goto LABEL_7;
    }
    id v4 = *(void **)(a1 + 56);
    id v5 = +[SLSheetImagePreviewView fallbackPreviewImage];
    [v4 setPreviewImage:v5 forAttachment:*(void *)(a1 + 40)];
  }
LABEL_7:
  if (*(double *)(a1 + 64) > 0.0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v6 = *(void **)(a1 + 56);
    double v7 = *(double *)(a1 + 64);
    [v6 setVideoDuration:v7];
  }
}

void __49__SLComposeServiceViewController_loadPreviewView__block_invoke_13(uint64_t a1, void *a2)
{
  id v8 = a2;
  _SLLog(v2, 7, @"SLComposeServiceViewController did load itemProvider previewImage %@ error %{public}@");
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SLComposeServiceViewController_loadPreviewView__block_invoke_14;
  block[3] = &unk_1E64673E8;
  id v10 = v8;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v11 = v4;
  uint64_t v12 = v5;
  id v13 = v6;
  id v7 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __49__SLComposeServiceViewController_loadPreviewView__block_invoke_14(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return [*(id *)(a1 + 40) setPreviewImage:v1 forAttachment:*(void *)(a1 + 48)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)didSelectPost
{
  if (self->_hostProxy)
  {
    hostProxdouble y = self->_hostProxy;
    [(SLSheetViewHostProtocol *)hostProxy userDidPost];
  }
  else
  {
    id v3 = [(SLComposeServiceViewController *)self extensionContext];
    [v3 completeRequestReturningItems:0 completionHandler:0];
  }
}

- (void)didSelectCancel
{
  if (self->_hostProxy)
  {
    hostProxdouble y = self->_hostProxy;
    [(SLSheetViewHostProtocol *)hostProxy userDidCancel];
  }
  else
  {
    id v4 = [(SLComposeServiceViewController *)self extensionContext];
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    [v4 cancelRequestWithError:v3];
  }
}

- (void)send
{
  if (!self->_inPostButtonTapped) {
    [(SLComposeServiceViewController *)self postButtonTapped:0];
  }
}

- (void)cancel
{
}

- (NSArray)configurationItems
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)sheetActions
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)reloadConfigurationItems
{
  if (self->_didFirstSheetActionLoad)
  {
    id v5 = [(SLComposeServiceViewController *)self configurationItems];
    if (![v5 count])
    {
      uint64_t v3 = [(SLComposeServiceViewController *)self sheetActions];

      id v5 = (id)v3;
    }
    id v4 = [(SLComposeServiceViewController *)self sheetRootViewController];
    [v4 setConfigurationItems:v5];

    [(SLComposeServiceViewController *)self positionSheetView];
  }
}

- (void)pushConfigurationViewController:(UIViewController *)viewController
{
  id v4 = viewController;
  [(UIViewController *)v4 setExtendedLayoutIncludesOpaqueBars:1];
  [(UIViewController *)v4 setEdgesForExtendedLayout:0];
  id v5 = [(SLComposeServiceViewController *)self navigationController];
  [v5 pushViewController:v4 animated:1];

  [(SLComposeServiceViewController *)self hideKeyboardAnimated:1];
}

- (void)_setViewControllerForTrackingSheetSize:(id)a3
{
  id v4 = (UIViewController *)a3;
  [(UIViewController *)self->_viewControllerForTrackingSheetSize removeObserver:self forKeyPath:@"preferredContentSize"];
  [(UIViewController *)v4 addObserver:self forKeyPath:@"preferredContentSize" options:1 context:0];
  viewControllerForTrackingSheetSize = self->_viewControllerForTrackingSheetSize;
  self->_viewControllerForTrackingSheetSize = v4;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a4;
  _SLLog(v5, 7, @"navigationController:willShowViewController:animated:");
  id v8 = [(SLComposeServiceViewController *)self sheetRootViewController];
  BOOL v9 = v8 != v7;

  self->_isPresentingActionViewController = v9;
  [(SLComposeServiceViewController *)self _positionSheetViewAnimatedForViewController:v7];

  [(SLComposeServiceViewController *)self setPreventSheetPositionChanges:1];
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v8 = a4;
  _SLLog(v5, 7, @"navigationController:didShowViewController:");
  id v7 = [(SLComposeServiceViewController *)self sheetRootViewController];

  if (v7 == v8)
  {
    [(SLComposeServiceViewController *)self _setViewControllerForTrackingSheetSize:0];
    [(SLComposeServiceViewController *)self showKeyboardAnimated:1];
  }
  else
  {
    [(SLComposeServiceViewController *)self _setViewControllerForTrackingSheetSize:v8];
  }
  [(SLComposeServiceViewController *)self setPreventSheetPositionChanges:0];
  [(SLComposeServiceViewController *)self _positionSheetViewAnimatedForViewController:v8];
}

- (void)_presentedViewControllerContentSizeDidChange
{
  if (self->_isPresentingActionViewController) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  id v6 = v4;
  _SLLog(v2, 7, @"_presentedViewControllerContentSizeDidChange, isPresentingActionViewController=%@");
  if (self->_isPresentingActionViewController
    || self->_autoCompletionViewController && self->_autoCompletionViewControllerAffectsSheetSize)
  {
    id v7 = [(SLComposeServiceViewController *)self navigationController];
    uint64_t v5 = [v7 topViewController];
    [(SLComposeServiceViewController *)self _positionSheetViewAnimatedForViewController:v5];
  }
}

- (void)_positionSheetViewAnimatedForViewController:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 7, @"_positionSheetViewAnimated");
  if (self->_hasPresentedSheet)
  {
    if (![(SLComposeServiceViewController *)self preventSheetPositionChanges])
    {
      id v7 = (void *)MEMORY[0x1E4F42FF0];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __78__SLComposeServiceViewController__positionSheetViewAnimatedForViewController___block_invoke;
      v8[3] = &unk_1E64680D0;
      v8[4] = self;
      id v9 = v5;
      uint64_t v10 = 0x3FD999999999999ALL;
      [v7 animateWithDuration:2 delay:v8 options:0 animations:0.4 completion:0.0];

      goto LABEL_7;
    }
    id v6 = @"Not doing _positionSheetViewAnimated, preventSheetPositionChanges == YES";
  }
  else
  {
    id v6 = @"Not doing _positionSheetViewAnimated, _hasPresentedSheet == NO");
  }
  _SLLog(v3, 7, v6);
LABEL_7:
}

void __78__SLComposeServiceViewController__positionSheetViewAnimatedForViewController___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sheetView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  [*(id *)(a1 + 32) _positionSheetViewForViewController:*(void *)(a1 + 40)];
  id v11 = *(void **)(a1 + 32);
  id v16 = [v11 sheetView];
  [v16 frame];
  objc_msgSend(v11, "_animateVignetteMaskFromSheetFrame:toSheetFrame:duration:", v4, v6, v8, v10, v12, v13, v14, v15, *(void *)(a1 + 48));
}

- (void)_animateVignetteMaskFromSheetFrame:(CGRect)a3 toSheetFrame:(CGRect)a4 duration:(double)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v10 = a3.size.height;
  CGFloat v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  if (!CGRectEqualToRect(a3, a4))
  {
    v23.origin.CGFloat x = v13;
    v23.origin.CGFloat y = v12;
    v23.size.CGFloat width = v11;
    v23.size.CGFloat height = v10;
    double v15 = NSStringFromCGRect(v23);
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    id v21 = NSStringFromCGRect(v24);
    _SLLog(v5, 7, @"_animateVignetteMaskFromSheetFrame from %@ to %@");

    vignetteLayer = self->_vignetteLayer;
    v25.origin.CGFloat x = v13;
    v25.origin.CGFloat y = v12;
    v25.size.CGFloat width = v11;
    v25.size.CGFloat height = v10;
    CGRect v26 = CGRectOffset(v25, 0.0, 0.0);
    double v17 = v26.origin.x;
    double v18 = v26.origin.y;
    double v19 = v26.size.width;
    double v20 = v26.size.height;
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    CGRect v27 = CGRectOffset(v26, 0.0, 0.0);
    -[SLSheetMasklayer animateSheetMaskFromOldSheetFrame:toSheetFrame:duration:](vignetteLayer, "animateSheetMaskFromOldSheetFrame:toSheetFrame:duration:", v17, v18, v19, v20, v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
  }
}

- (void)popConfigurationViewController
{
  id v5 = [(SLComposeServiceViewController *)self navigationController];
  double v3 = [(SLComposeServiceViewController *)self sheetRootViewController];
  id v4 = (id)[v5 popToViewController:v3 animated:1];
}

- (void)setAutoCompletionViewController:(UIViewController *)autoCompletionViewController
{
  id v5 = autoCompletionViewController;
  p_autoCompletionViewController = &self->_autoCompletionViewController;
  double v7 = self->_autoCompletionViewController;
  if (v7 != v5)
  {
    if (v7)
    {
      if (self->_autoCompletionViewControllerAffectsSheetSize)
      {
        [(UIViewController *)v7 removeObserver:self forKeyPath:@"preferredContentSize"];
        double v7 = *p_autoCompletionViewController;
      }
      *p_autoCompletionViewController = 0;

      self->_autoCompletionViewControllerAffectsSheetSize = 0;
      double v8 = [(SLComposeServiceViewController *)self navigationController];
      double v9 = [v8 topViewController];
      [(SLComposeServiceViewController *)self _positionSheetViewAnimatedForViewController:v9];

      CGFloat v10 = [(SLComposeServiceViewController *)self sheetRootViewController];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __66__SLComposeServiceViewController_setAutoCompletionViewController___block_invoke;
      v23[3] = &unk_1E6467288;
      v23[4] = self;
      [v10 dismissAutoCompletionViewControllerWithContentViewChangeBlock:v23];

      CGFloat v11 = [(SLComposeServiceViewController *)self contentView];
      CGFloat v12 = [v11 textView];
      [v12 becomeFirstResponder];
    }
    if (v5)
    {
      objc_storeStrong((id *)&self->_autoCompletionViewController, autoCompletionViewController);
      CGFloat v13 = [MEMORY[0x1E4F42948] currentDevice];
      if (objc_opt_respondsToSelector())
      {
        double v14 = [MEMORY[0x1E4F42948] currentDevice];
        uint64_t v15 = [v14 userInterfaceIdiom];

        if (v15 == 1)
        {
          self->_autoCompletionViewControllerAffectsSheetSize = 1;
          [(UIViewController *)v5 addObserver:self forKeyPath:@"preferredContentSize" options:1 context:0];
        }
      }
      else
      {
      }
      id v16 = [(SLComposeServiceViewController *)self contentView];
      [v16 preflightAutoCompletionModeWithApparentHeight:46.0];

      double v17 = [(SLComposeServiceViewController *)self sheetRootViewController];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __66__SLComposeServiceViewController_setAutoCompletionViewController___block_invoke_2;
      v22[3] = &unk_1E6467288;
      v22[4] = self;
      [v17 presentAutoCompletionViewController:v5 apparentContentHeight:v22 contentViewChangeBlock:46.0];

      double v18 = [(SLComposeServiceViewController *)self contentView];
      double v19 = [v18 textView];
      [v19 becomeFirstResponder];

      double v20 = [(SLComposeServiceViewController *)self navigationController];
      id v21 = [v20 topViewController];
      [(SLComposeServiceViewController *)self _positionSheetViewAnimatedForViewController:v21];
    }
  }
}

void __66__SLComposeServiceViewController_setAutoCompletionViewController___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contentView];
  [v1 endAutoCompletionMode];
}

void __66__SLComposeServiceViewController_setAutoCompletionViewController___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contentView];
  [v1 beginAutoCompletionMode];
}

- (void)setPostButtonTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(SLComposeServiceViewController *)self sheetRootViewController];
  [v5 setPostButtonTitle:v4];
}

- (void)setTitle:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SLComposeServiceViewController;
  id v4 = a3;
  [(SLComposeServiceViewController *)&v6 setTitle:v4];
  id v5 = [(SLComposeServiceViewController *)self sheetRootViewController];
  [v5 setTitle:v4];
}

- (void)setServiceIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIconImage, a3);
  id v5 = a3;
  id v6 = [(SLComposeServiceViewController *)self sheetRootViewController];
  [v6 setServiceIconImage:v5];
}

- (void)cancelButtonTapped:(id)a3
{
  _SLLog(v3, 6, @"SLComposeServiceViewController:cancelButtonTapped");

  [(SLComposeServiceViewController *)self cancel];
}

- (void)postButtonTapped:(id)a3
{
  self->_inPostButtonTapped = 1;
  _SLLog(v3, 6, @"postButtonTapped");
  id v5 = [(SLComposeServiceViewController *)self contentView];
  id v6 = [v5 textView];
  [v6 setEditable:0];

  double v7 = [MEMORY[0x1E4F42738] sharedApplication];
  -[SLComposeServiceViewController animateCardSendOrientation:](self, "animateCardSendOrientation:", [v7 statusBarOrientation]);

  [(SLComposeServiceViewController *)self hideKeyboardAnimated:1];
}

- (void)animateCardSendOrientation:(int64_t)a3
{
  _SLLog(v3, 6, @"SLComposeServiceViewController-animateSendCard");
  [(SLComposeServiceViewController *)self setPreventSheetPositionChanges:1];
  id v5 = [(SLComposeServiceViewController *)self sheetView];
  [v5 frame];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  double v11 = v10;

  [(SLSheetMasklayer *)self->_vignetteLayer position];
  uint64_t v13 = v12;
  double v15 = v14;
  double v16 = v11 + v14 - v11;
  [(SLSheetMasklayer *)self->_vignetteLayer removeSheetCutout];
  [(SLSheetMasklayer *)self->_vignetteLayer setOpacity:0.0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__SLComposeServiceViewController_animateCardSendOrientation___block_invoke;
  v18[3] = &unk_1E64680F8;
  v18[6] = v13;
  *(double *)&v18[7] = v15;
  v18[8] = v13;
  *(double *)&v18[9] = v16;
  v18[4] = self;
  v18[5] = 0x3FD6666666666666;
  v18[10] = v7;
  *(double *)&v18[11] = -v11;
  v18[12] = v9;
  *(double *)&v18[13] = v11;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__SLComposeServiceViewController_animateCardSendOrientation___block_invoke_2;
  v17[3] = &unk_1E64678C8;
  void v17[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v18 options:v17 animations:0.35 completion:0.0];
}

void __61__SLComposeServiceViewController_animateCardSendOrientation___block_invoke(uint64_t a1)
{
  id v20 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position"];
  double v2 = *(double *)(a1 + 40);
  UIAnimationDragCoefficient();
  [v20 setDuration:v2 * v3];
  id v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  [v20 setFromValue:v4];

  id v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  [v20 setToValue:v5];

  uint64_t v6 = *MEMORY[0x1E4F3A490];
  uint64_t v7 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v20 setTimingFunction:v7];

  [*(id *)(*(void *)(a1 + 32) + 1024) addAnimation:v20 forKey:@"PresentationAnimationTranslation"];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1024), "setPosition:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  uint64_t v8 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  double v9 = *(double *)(a1 + 40);
  UIAnimationDragCoefficient();
  [v8 setDuration:v9 * v10];
  LODWORD(v11) = 1.0;
  uint64_t v12 = [NSNumber numberWithFloat:v11];
  [v8 setFromValue:v12];

  uint64_t v13 = [NSNumber numberWithFloat:0.0];
  [v8 setToValue:v13];

  double v14 = [MEMORY[0x1E4F39C10] functionWithName:v6];
  [v8 setTimingFunction:v14];

  [*(id *)(*(void *)(a1 + 32) + 1024) addAnimation:v8 forKey:@"PresentationAnimationOpacity"];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1024), "setPosition:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  [*(id *)(*(void *)(a1 + 32) + 1024) setOpacity:0.0];
  double v15 = *(double *)(a1 + 80);
  double v16 = *(double *)(a1 + 88);
  double v17 = *(double *)(a1 + 96);
  double v18 = *(double *)(a1 + 104);
  double v19 = [*(id *)(a1 + 32) sheetView];
  objc_msgSend(v19, "setFrame:", v15, v16, v17, v18);
}

uint64_t __61__SLComposeServiceViewController_animateCardSendOrientation___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1024) restoreSheetCutout];
  double v2 = *(void **)(a1 + 32);

  return [v2 _animateCardSendFinished];
}

- (void)_animateCardSendFinished
{
  _SLLog(v2, 7, @"animateCardSend animation finished");
  [(SLComposeServiceViewController *)self didSelectPost];
  id v4 = [(SLComposeServiceViewController *)self sheetView];
  [v4 setHidden:1];

  [(SLComposeServiceViewController *)self setPreventSheetPositionChanges:0];
}

- (void)_presentSheet
{
  if (!self->_didCallPresentSheet)
  {
    self->_didCallPresentSheet = 1;
    self->_triggerPresentationAnimationOnKeyboard = 0;
    _SLLog(v2, 7, @"presentSheet - kicking off presentation of sheet");
    [(SLComposeServiceViewController *)self animateSheetPresentationWithDuration:0.25];
  }
}

- (void)animateSheetPresentationWithDuration:(double)a3
{
  _SLLog(v3, 7, @"animateSheetPresentationWithDuration:");
  [(SLComposeServiceViewController *)self positionSheetView];
  uint64_t v6 = [(SLComposeServiceViewController *)self sheetView];
  [v6 frame];
  -[SLComposeServiceViewController _positionVignetteForSheetFrame:](self, "_positionVignetteForSheetFrame:");

  uint64_t v7 = [(SLComposeServiceViewController *)self sheetView];
  [v7 setHidden:0];

  [(SLComposeServiceViewController *)self setPreventSheetPositionChanges:1];
  uint64_t v8 = [(SLComposeServiceViewController *)self sheetView];
  double v9 = [v8 layer];
  [v9 setAllowsGroupOpacity:0];

  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v17.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v17.c = v10;
  *(_OWORD *)&v17.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformScale(&v18, &v17, 1.26, 1.26);
  double v11 = [(SLComposeServiceViewController *)self sheetView];
  CGAffineTransform v16 = v18;
  [v11 setTransform:&v16];

  uint64_t v12 = [(SLComposeServiceViewController *)self sheetView];
  [v12 setAlpha:0.0];

  LODWORD(v13) = 1.0;
  [(SLSheetMasklayer *)self->_vignetteLayer setOpacity:v13];
  [(SLSheetMasklayer *)self->_vignetteLayer removeSheetCutout];
  [(SLSheetMasklayer *)self->_vignetteLayer removeAllAnimations];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __71__SLComposeServiceViewController_animateSheetPresentationWithDuration___block_invoke;
  v15[3] = &unk_1E6468120;
  *(double *)&v15[5] = a3;
  v15[4] = self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__SLComposeServiceViewController_animateSheetPresentationWithDuration___block_invoke_2;
  v14[3] = &unk_1E64678C8;
  v14[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:327680 delay:v15 options:v14 animations:a3 completion:0.0];
}

void __71__SLComposeServiceViewController_animateSheetPresentationWithDuration___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  double v3 = *(double *)(a1 + 40);
  UIAnimationDragCoefficient();
  [v2 setDuration:v3 * v4];
  id v5 = [NSNumber numberWithFloat:0.0];
  [v2 setFromValue:v5];

  LODWORD(v6) = 1.0;
  uint64_t v7 = [NSNumber numberWithFloat:v6];
  [v2 setToValue:v7];

  uint64_t v8 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
  [v2 setTimingFunction:v8];

  [*(id *)(*(void *)(a1 + 32) + 1024) addAnimation:v2 forKey:@"PresentationAnimationOpacity"];
  double v9 = [*(id *)(a1 + 32) sheetView];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v12[0] = *MEMORY[0x1E4F1DAB8];
  v12[1] = v10;
  v12[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v9 setTransform:v12];

  double v11 = [*(id *)(a1 + 32) sheetView];
  [v11 setAlpha:1.0];
}

uint64_t __71__SLComposeServiceViewController_animateSheetPresentationWithDuration___block_invoke_2(uint64_t a1, int a2)
{
  float v4 = @"NO";
  if (a2) {
    float v4 = @"YES";
  }
  long long v10 = v4;
  _SLLog(v2, 7, @"Presentation animation completion, finshed=%@");
  LODWORD(v5) = 1.0;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1024), "setOpacity:", v5, v10);
  double v6 = [*(id *)(a1 + 32) sheetView];
  uint64_t v7 = [v6 layer];
  [v7 setAllowsGroupOpacity:1];

  [*(id *)(*(void *)(a1 + 32) + 1024) restoreSheetCutout];
  uint64_t v8 = *(void **)(a1 + 32);

  return [v8 _animateSheetPresentationFinished];
}

- (void)_animateSheetPresentationFinished
{
  [(SLComposeServiceViewController *)self setPreventSheetPositionChanges:0];
  self->_hasPresentedSheet = 1;
  [(SLComposeServiceViewController *)self positionSheetView];

  [(SLComposeServiceViewController *)self presentationAnimationDidFinish];
}

- (void)animateSheetCancelWithDuration:(double)a3
{
  [(SLComposeServiceViewController *)self setPreventSheetPositionChanges:1];
  double v5 = [(SLComposeServiceViewController *)self sheetView];
  double v6 = [v5 layer];
  [v6 setAllowsGroupOpacity:0];

  [(SLSheetMasklayer *)self->_vignetteLayer removeSheetCutout];
  [(SLSheetMasklayer *)self->_vignetteLayer setOpacity:0.0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__SLComposeServiceViewController_animateSheetCancelWithDuration___block_invoke;
  v8[3] = &unk_1E6468120;
  *(double *)&void v8[5] = a3;
  v8[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__SLComposeServiceViewController_animateSheetCancelWithDuration___block_invoke_2;
  v7[3] = &unk_1E64678C8;
  void v7[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v8 options:v7 animations:a3 completion:0.0];
}

void __65__SLComposeServiceViewController_animateSheetCancelWithDuration___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  double v3 = *(double *)(a1 + 40);
  UIAnimationDragCoefficient();
  [v2 setDuration:v3 * v4];
  LODWORD(v5) = 1.0;
  double v6 = [NSNumber numberWithFloat:v5];
  [v2 setFromValue:v6];

  uint64_t v7 = [NSNumber numberWithFloat:0.0];
  [v2 setToValue:v7];

  uint64_t v8 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v2 setTimingFunction:v8];

  [*(id *)(*(void *)(a1 + 32) + 1024) addAnimation:v2 forKey:@"CancelAnimationOpacity"];
  [*(id *)(a1 + 32) hideKeyboardAnimated:1];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v13.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v13.c = v9;
  *(_OWORD *)&v13.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformScale(&v14, &v13, 0.84, 0.84);
  long long v10 = [*(id *)(a1 + 32) sheetView];
  CGAffineTransform v12 = v14;
  [v10 setTransform:&v12];

  double v11 = [*(id *)(a1 + 32) sheetView];
  [v11 setAlpha:0.0];
}

uint64_t __65__SLComposeServiceViewController_animateSheetCancelWithDuration___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _animateSheetCancelFinished];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1024);

  return [v2 setOpacity:0.0];
}

- (void)_animateSheetCancelFinished
{
  [(SLComposeServiceViewController *)self setPreventSheetPositionChanges:0];
  double v3 = [(SLComposeServiceViewController *)self sheetView];
  [v3 setHidden:1];

  [(SLComposeServiceViewController *)self didSelectCancel];
}

- (void)keyboardDidChange:(id)a3
{
  _SLLog(v3, 6, @"SLComposeServiceViewController-keyboardDidChange");
  if (self->_hasPresentedSheet
    && ![(SLComposeServiceViewController *)self preventSheetPositionChanges])
  {
    [(SLComposeServiceViewController *)self updateKeyboardSize];
  }
  else if (self->_triggerPresentationAnimationOnKeyboard)
  {
    [(SLComposeServiceViewController *)self _presentSheet];
  }
}

- (void)updateKeyboardSize
{
  _SLLog(v2, 6, @"SLComposeServiceViewController-updateKeyboardSize");

  [(SLComposeServiceViewController *)self positionSheetView];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([v11 isEqualToString:@"preferredContentSize"])
  {
    _SLLog(v6, 7, @"Received KVO for preferredContentSize on presented action VC");
    [(SLComposeServiceViewController *)self _presentedViewControllerContentSizeDidChange];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SLComposeServiceViewController;
    [(SLComposeServiceViewController *)&v14 observeValueForKeyPath:v11 ofObject:v12 change:v13 context:a6];
  }
}

- (void)setSheetFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
  _SLLog(v3, 7, @"SLComposeServiceViewControlller setSheetFrame: %@");

  long long v9 = [(SLComposeServiceViewController *)self navigationController];
  long long v10 = [v9 view];
  objc_msgSend(v10, "setFrame:", x, y, width, height);

  maskView = self->_maskView;

  -[UIView setFrame:](maskView, "setFrame:", x, y, width, height);
}

- (void)_positionVignetteForSheetFrame:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGRect v24 = NSStringFromCGRect(a3);
  _SLLog(v3, 7, @"SLComposeServiceViewControlller _positionVignetteForSheetFrame: %@");

  long long v9 = [(SLComposeServiceViewController *)self view];
  [v9 bounds];
  double v11 = v10;
  id v12 = [(SLComposeServiceViewController *)self view];
  [v12 bounds];
  -[SLSheetMasklayer setFrame:](self->_vignetteLayer, "setFrame:", 0.0, 0.0, v11, height + v13 + 0.0);

  [(SLSheetMasklayer *)self->_vignetteLayer frame];
  objc_super v14 = NSStringFromCGRect(v27);
  [(SLSheetMasklayer *)self->_vignetteLayer bounds];
  CGRect v25 = NSStringFromCGRect(v28);
  _SLLog(v3, 7, @"SLComposeServiceViewControlller _positionVignetteForSheetFrame: _vignetteLayer.frame %@ _vignetteLayer.bounds %@");

  vignetteLayer = self->_vignetteLayer;
  [(SLSheetMasklayer *)vignetteLayer bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.double height = height;
  CGRect v30 = CGRectOffset(v29, 0.0, 0.0);

  -[SLSheetMasklayer updateMaskWithBounds:maskRect:](vignetteLayer, "updateMaskWithBounds:maskRect:", v17, v19, v21, v23, v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
}

- (UIView)sheetView
{
  uint64_t v2 = [(SLComposeServiceViewController *)self navigationController];
  uint64_t v3 = [v2 view];

  return (UIView *)v3;
}

- (CGSize)_intrinsicSheetSize
{
  uint64_t v3 = [(SLComposeServiceViewController *)self contentView];
  [v3 invalidateIntrinsicContentSize];

  float v4 = [MEMORY[0x1E4F42738] sharedApplication];
  double v5 = [v4 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v5)) {
    double v6 = 70.0;
  }
  else {
    double v6 = 44.0;
  }

  uint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (v9 == 1)
    {
      double v10 = [(SLComposeServiceViewController *)self contentView];
      [v10 intrinsicContentSize];
      double v12 = v11;
      double v13 = [(SLComposeServiceViewController *)self sheetRootViewController];
      objc_super v14 = [v13 configurationItems];
      double v15 = v12 + (double)(unint64_t)[v14 count] * v6;
      double v16 = 44.0;
      goto LABEL_12;
    }
  }
  else
  {
  }
  double v17 = [(SLComposeServiceViewController *)self traitCollection];
  if ([v17 verticalSizeClass] == 2) {
    double v15 = 44.0;
  }
  else {
    double v15 = 32.0;
  }

  double v10 = [(SLComposeServiceViewController *)self contentView];
  [v10 intrinsicContentSize];
  double v19 = v18;
  double v13 = [(SLComposeServiceViewController *)self sheetRootViewController];
  objc_super v14 = [v13 configurationItems];
  double v16 = v19 + (double)(unint64_t)[v14 count] * v6;
LABEL_12:

  double v20 = [(SLComposeServiceViewController *)self view];
  [v20 bounds];
  double v22 = v21;

  double v23 = v22 + -30.0;
  CGRect v24 = [MEMORY[0x1E4F42948] currentDevice];
  if (objc_opt_respondsToSelector())
  {
    CGRect v25 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v26 = [v25 userInterfaceIdiom];

    if (v26 == 1)
    {
      double v27 = 390.0;
      goto LABEL_17;
    }
  }
  else
  {
  }
  double v27 = 552.0;
LABEL_17:
  if (v23 > v27) {
    double v23 = v27;
  }
  double v28 = v15 + v16;
  double v29 = v23;
  result.double height = v28;
  result.CGFloat width = v29;
  return result;
}

- (CGRect)sheetFrameForViewController:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F42948] currentDevice];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_6;
  }
  double v6 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 != 1
    || (unint64_t)([(SLComposeServiceViewController *)self interfaceOrientation] - 1) >= 2)
  {
LABEL_6:
    double v10 = [MEMORY[0x1E4F42948] currentDevice];
    if (objc_opt_respondsToSelector())
    {
      double v11 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v12 = [v11 userInterfaceIdiom];

      if (v12 == 1
        && (unint64_t)([(SLComposeServiceViewController *)self interfaceOrientation] - 3) < 2)
      {
        double v9 = 0.0;
        double v8 = 50.0;
        goto LABEL_12;
      }
    }
    else
    {
    }
    double v8 = 0.0;
    double v9 = 0.5;
    goto LABEL_12;
  }
  double v8 = 0.0;
  double v9 = 0.550000012;
LABEL_12:
  [(SLComposeServiceViewController *)self sheetFrameForViewController:v4 topSpaceProportion:v9 topSpaceOffset:v8];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (CGRect)sheetFrameForViewController:(id)a3 topSpaceProportion:(double)a4 topSpaceOffset:(double)a5
{
  id v9 = a3;
  objc_msgSend(MEMORY[0x1E4F42B08], "sizeForInterfaceOrientation:", -[SLComposeServiceViewController interfaceOrientation](self, "interfaceOrientation"));
  double v11 = v10;
  [(SLComposeServiceViewController *)self _intrinsicSheetSize];
  double v13 = v12;
  double v15 = v14;
  double v16 = [(SLComposeServiceViewController *)self view];
  [v16 bounds];
  double v18 = v17;

  double v19 = [(SLComposeServiceViewController *)self view];
  [v19 bounds];
  double v21 = v20 - v11 - v15;

  double v22 = v21 * a4;
  if (v21 * a4 < 20.0) {
    double v22 = 20.0;
  }
  double v23 = v22 + a5;
  double v24 = [MEMORY[0x1E4F42D90] mainScreen];
  [v24 scale];
  double v26 = v25;

  double v27 = round(v23 + v23) * 0.5;
  double v28 = round(v23);
  if (v26 <= 1.0) {
    double v29 = v28;
  }
  else {
    double v29 = v27;
  }
  CGRect v30 = [MEMORY[0x1E4F42948] currentDevice];
  if (objc_opt_respondsToSelector())
  {
    v31 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v32 = [v31 userInterfaceIdiom];

    if (v15 > v18 - (v11 + 15.0)) {
      double v33 = v18 - (v11 + 15.0);
    }
    else {
      double v33 = v15;
    }
    if (v32 == 1)
    {
      double v18 = v18 - (v11 + 15.0);
      double v15 = v33;
    }
  }
  else
  {
  }
  uint64_t v34 = [(SLComposeServiceViewController *)self view];
  [v34 bounds];
  double v36 = v35;

  if (!self->_isPresentingActionViewController)
  {
    if (!self->_autoCompletionViewController || !self->_autoCompletionViewControllerAffectsSheetSize) {
      goto LABEL_24;
    }
    goto LABEL_18;
  }
  uint64_t v37 = [(SLComposeServiceViewController *)self view];
  [v37 bounds];
  double v39 = v38 - v29;
  [(SLComposeServiceViewController *)self _sheetMinBottomMarginForVerticalSizeClass];
  double v18 = v39 - v40;

  if (!self->_isPresentingActionViewController)
  {
LABEL_18:
    [(UIViewController *)self->_autoCompletionViewController preferredContentSize];
    double v42 = v43 + 46.0;
    goto LABEL_19;
  }
  [v9 preferredContentSize];
  double v42 = v41;
LABEL_19:
  v44 = [(SLComposeServiceViewController *)self navigationController];
  v45 = [v44 navigationBar];
  [v45 bounds];
  double v47 = v42 + v46;

  if (v47 >= v18) {
    double v48 = v18;
  }
  else {
    double v48 = v47;
  }
  if (v48 >= v15) {
    double v15 = v48;
  }
LABEL_24:
  v49 = [NSNumber numberWithDouble:a4];
  v50 = [NSNumber numberWithDouble:a5];
  v51 = NSNumber;
  v52 = [(SLComposeServiceViewController *)self traitCollection];
  v53 = objc_msgSend(v51, "numberWithInteger:", objc_msgSend(v52, "horizontalSizeClass"));
  v54 = NSNumber;
  long long v55 = [(SLComposeServiceViewController *)self traitCollection];
  long long v56 = objc_msgSend(v54, "numberWithInteger:", objc_msgSend(v55, "verticalSizeClass"));
  long long v57 = objc_msgSend(NSNumber, "numberWithInteger:", -[SLComposeServiceViewController interfaceOrientation](self, "interfaceOrientation"));
  v62 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", (v36 - v13) * 0.5, v29, v13, v15);
  _SLLog(v5, 7, @"SLComposeServiceViewController sheetFrameForViewController:topSpaceProportion: %@ topSpaceOffset: %@ horizontalSizeClass %@ verticalSizeClass %@ orientation %@ => %@");

  double v58 = (v36 - v13) * 0.5;
  double v59 = v29;
  double v60 = v13;
  double v61 = v15;
  result.size.double height = v61;
  result.size.CGFloat width = v60;
  result.origin.CGFloat y = v59;
  result.origin.CGFloat x = v58;
  return result;
}

- (double)_sheetMinBottomMarginForVerticalSizeClass
{
  uint64_t v2 = [(SLComposeServiceViewController *)self traitCollection];
  if ([v2 verticalSizeClass] != 1)
  {

    return 44.0;
  }
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (!v5) {
      return 22.0;
    }
    return 44.0;
  }

  return 22.0;
}

- (void)_willAppearInRemoteViewController
{
  _SLLog(v2, 7, @"willAppearInRemoteViewController start");
  if (GSEventIsHardwareKeyboardAttached())
  {
    _SLLog(v2, 7, @"willAppearInRemoteViewController detected physical keyboard, so presenting sheet manually.");
    dispatch_time_t v4 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__SLComposeServiceViewController__willAppearInRemoteViewController__block_invoke;
    block[3] = &unk_1E6467288;
    void block[4] = self;
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
  }
  _SLLog(v2, 7, @"willAppearInRemoteViewController finish");
}

uint64_t __67__SLComposeServiceViewController__willAppearInRemoteViewController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentSheet];
}

- (void)setHostProxy:(id)a3
{
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v8 = a4;
  id v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", width, height);
  double v10 = NSNumber;
  double v11 = [(SLComposeServiceViewController *)self traitCollection];
  double v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "horizontalSizeClass"));
  double v13 = NSNumber;
  double v14 = [(SLComposeServiceViewController *)self traitCollection];
  double v21 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "verticalSizeClass"));
  _SLLog(v4, 7, @"SLComposeServiceViewController viewWillTransitionToSize: %@ withTransitionCoordinator: horizontalSizeClass %@ verticalSizeClass %@");

  v27.receiver = self;
  v27.super_class = (Class)SLComposeServiceViewController;
  -[SLComposeServiceViewController viewWillTransitionToSize:withTransitionCoordinator:](&v27, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height, v9, v12, v21);
  if (v8) {
    [v8 targetTransform];
  }
  else {
    memset(&v26, 0, sizeof(v26));
  }
  IsIdentitCGFloat y = CGAffineTransformIsIdentity(&v26);
  double v16 = [(SLComposeServiceViewController *)self sheetView];
  [v16 frame];
  self->_sheetFrameStartingRotation.origin.CGFloat x = v17;
  self->_sheetFrameStartingRotation.origin.CGFloat y = v18;
  self->_sheetFrameStartingRotation.size.double width = v19;
  self->_sheetFrameStartingRotation.size.double height = v20;

  [(SLComposeServiceViewController *)self setPreventSheetPositionChanges:1];
  self->_waitingForAnimateAlongsideTransitionBlock = 1;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __85__SLComposeServiceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v24[3] = &unk_1E6468148;
  BOOL v25 = IsIdentity;
  v24[4] = self;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __85__SLComposeServiceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v22[3] = &unk_1E6468148;
  BOOL v23 = IsIdentity;
  v22[4] = self;
  [v8 animateAlongsideTransition:v24 completion:v22];
}

void __85__SLComposeServiceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = NSNumber;
  id v5 = a2;
  [v5 transitionDuration];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isAnimated"));
  id v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  id v9 = NSNumber;
  double v10 = [*(id *)(a1 + 32) traitCollection];
  double v39 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "verticalSizeClass"));
  _SLLog(v2, 7, @"SLComposeServiceViewController animateAlongsideTransition: animation block start context.transitionDuration %@ context.isAnimated %@ rotating %@ verticalSizeClass %@");

  *(unsigned char *)(*(void *)(a1 + 32) + 1069) = 0;
  objc_msgSend(*(id *)(a1 + 32), "updateSheetForVerticalSizeClass", v6, v7, v8, v39);
  double v11 = *(void **)(a1 + 32);
  double v12 = [v11 navigationController];
  double v13 = [v12 topViewController];
  [v11 sheetFrameForViewController:v13];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = [*(id *)(a1 + 32) view];
  [v22 bounds];
  double v24 = v23;

  BOOL v25 = [*(id *)(a1 + 32) view];
  [v25 bounds];
  double v27 = v26;

  if (v24 < v27) {
    double v24 = v27;
  }
  double v28 = [*(id *)(a1 + 32) view];
  [v28 bounds];
  double v30 = v29;

  v31 = [*(id *)(a1 + 32) view];
  [v31 bounds];
  double v33 = v32;

  if (v30 >= v33) {
    double v34 = v30;
  }
  else {
    double v34 = v33;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1024), "updateMaskWithBounds:maskRect:", 0.0, 0.0, v24, v34, *(double *)(*(void *)(a1 + 32) + 1072), *(double *)(*(void *)(a1 + 32) + 1080), *(double *)(*(void *)(a1 + 32) + 1088), *(double *)(*(void *)(a1 + 32) + 1096));
  double v35 = *(double **)(a1 + 32);
  [v5 transitionDuration];
  uint64_t v37 = v36;

  objc_msgSend(v35, "_animateVignetteMaskFromSheetFrame:toSheetFrame:duration:", v35[134], v35[135], v35[136], v35[137], v15, v17, v19, v21, v37);
  double v38 = [*(id *)(a1 + 32) sheetView];
  objc_msgSend(v38, "setFrame:", v15, v17, v19, v21);

  _SLLog(v2, 7, @"SLComposeServiceViewController animateAlongsideTransition: animation block end");
}

void __85__SLComposeServiceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v4 = NSNumber;
  id v5 = [*(id *)(a1 + 32) traitCollection];
  double v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "verticalSizeClass"));
  _SLLog(v1, 7, @"SLComposeServiceViewController animateAlongsideTransition: completion block start, is rotating %@ verticalSizeClass %@");

  objc_msgSend(*(id *)(a1 + 32), "setPreventSheetPositionChanges:", 0, v3, v6);

  _SLLog(v1, 7, @"SLComposeServiceViewController animateAlongsideTransition: completion block end");
}

- (void)loadView
{
  _SLLog(v2, 6, @"SLComposeServiceViewController loadView");
  v95.receiver = self;
  v95.super_class = (Class)SLComposeServiceViewController;
  [(SLComposeServiceViewController *)&v95 loadView];
  uint64_t v4 = [SLSheetMasklayer alloc];
  id v5 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.400000006];
  double v6 = [(SLSheetMasklayer *)v4 initWithBackgroundColor:v5 cornerRadius:7.0];
  vignetteLayer = self->_vignetteLayer;
  self->_vignetteLayer = v6;

  [(SLSheetMasklayer *)self->_vignetteLayer removeAllAnimations];
  id v8 = [(SLComposeServiceViewController *)self view];
  [v8 bounds];
  -[SLSheetMasklayer setFrame:](self->_vignetteLayer, "setFrame:");

  [(SLSheetMasklayer *)self->_vignetteLayer setOpacity:0.0];
  [(SLSheetMasklayer *)self->_vignetteLayer setNeedsDisplay];
  [(SLSheetMasklayer *)self->_vignetteLayer setAllowsGroupOpacity:0];
  id v9 = [(SLComposeServiceViewController *)self view];
  double v10 = [v9 layer];
  [v10 addSublayer:self->_vignetteLayer];

  double v11 = objc_alloc_init(SLSheetRootViewController);
  [(SLComposeServiceViewController *)self setSheetRootViewController:v11];

  double v12 = [(SLComposeServiceViewController *)self title];
  double v13 = [(SLComposeServiceViewController *)self sheetRootViewController];
  [v13 setTitle:v12];

  double v14 = *MEMORY[0x1E4F43D18];
  double v15 = [(SLComposeServiceViewController *)self sheetRootViewController];
  double v16 = [v15 tableView];
  [v16 setRowHeight:v14];

  double v17 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [v17 lineHeight];
  double v19 = v18 + v18;
  double v20 = [(SLComposeServiceViewController *)self sheetRootViewController];
  double v21 = [v20 tableView];
  [v21 setEstimatedRowHeight:v19];

  double v22 = [(SLComposeServiceViewController *)self sheetRootViewController];
  double v23 = [v22 tableView];
  double v24 = [v23 backgroundView];
  [v24 setOpaque:0];

  BOOL v25 = [MEMORY[0x1E4F428B8] clearColor];
  double v26 = [(SLComposeServiceViewController *)self sheetRootViewController];
  double v27 = [v26 tableView];
  double v28 = [v27 backgroundView];
  [v28 setBackgroundColor:v25];

  double v29 = [(SLComposeServiceViewController *)self sheetRootViewController];
  double v30 = [v29 tableView];
  [v30 setOpaque:0];

  v31 = [MEMORY[0x1E4F428B8] clearColor];
  double v32 = [(SLComposeServiceViewController *)self sheetRootViewController];
  double v33 = [v32 tableView];
  [v33 setBackgroundColor:v31];

  double v34 = objc_alloc_init(SLSheetContentView);
  [(SLComposeServiceViewController *)self setContentView:v34];

  double v35 = [MEMORY[0x1E4F42948] currentDevice];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v36 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v37 = [v36 userInterfaceIdiom];

    if (v37 == 1)
    {
      double v38 = [(SLComposeServiceViewController *)self contentView];
      double v39 = v38;
      double v40 = *MEMORY[0x1E4F43ED8];
      double v41 = 120.0;
      uint64_t v42 = 2;
      goto LABEL_9;
    }
  }
  else
  {
  }
  double v43 = [(SLComposeServiceViewController *)self contentView];
  double v44 = *MEMORY[0x1E4F43ED8];
  objc_msgSend(v43, "setIntrinsicSize:forVerticalSizeClass:", 2, *MEMORY[0x1E4F43ED8], 138.0);

  v45 = [MEMORY[0x1E4F42D90] mainScreen];
  [v45 bounds];
  double v47 = v46;

  double v38 = [(SLComposeServiceViewController *)self contentView];
  double v39 = v38;
  if (v47 <= 320.0) {
    double v41 = 80.0;
  }
  else {
    double v41 = 97.0;
  }
  double v40 = v44;
  uint64_t v42 = 1;
LABEL_9:
  objc_msgSend(v38, "setIntrinsicSize:forVerticalSizeClass:", v42, v40, v41);

  double v48 = [(SLComposeServiceViewController *)self contentView];
  v49 = [(SLComposeServiceViewController *)self sheetRootViewController];
  [v49 setContentView:v48];

  v50 = [(SLComposeServiceViewController *)self sheetRootViewController];
  [v50 setDelegate:self];

  v51 = [(SLComposeServiceViewController *)self title];
  v52 = [(SLComposeServiceViewController *)self sheetRootViewController];
  [v52 setTitle:v51];

  serviceIconImage = self->_serviceIconImage;
  v54 = [(SLComposeServiceViewController *)self sheetRootViewController];
  [v54 setServiceIconImage:serviceIconImage];

  long long v55 = [SLSheetNavigationController alloc];
  long long v56 = [(SLComposeServiceViewController *)self sheetRootViewController];
  long long v57 = [(SLSheetNavigationController *)v55 initWithRootViewController:v56];
  [(SLComposeServiceViewController *)self setNavigationController:v57];

  double v58 = [(SLComposeServiceViewController *)self navigationController];
  [v58 setDelegate:self];

  double v59 = [(SLComposeServiceViewController *)self navigationController];
  [v59 _setBuiltinTransitionStyle:1];

  double v60 = [(SLComposeServiceViewController *)self navigationController];
  [v60 willMoveToParentViewController:self];

  double v61 = [(SLComposeServiceViewController *)self navigationController];
  [(SLComposeServiceViewController *)self addChildViewController:v61];

  v62 = [(SLComposeServiceViewController *)self view];
  v63 = [(SLComposeServiceViewController *)self navigationController];
  v64 = [v63 view];
  [v62 addSubview:v64];

  v65 = [(SLComposeServiceViewController *)self navigationController];
  [v65 didMoveToParentViewController:self];

  v66 = [(SLComposeServiceViewController *)self navigationController];
  v67 = [v66 view];
  [v67 setAutoresizingMask:5];

  v68 = [(SLComposeServiceViewController *)self contentView];
  v69 = [v68 textView];
  [v69 setReturnKeyType:0];

  v70 = [(SLComposeServiceViewController *)self contentView];
  v71 = [v70 textView];
  [v71 setDelegate:self];

  v72 = [(SLComposeServiceViewController *)self placeholder];
  v73 = [(SLComposeServiceViewController *)self contentView];
  v74 = [v73 placeholderLabel];
  [v74 setText:v72];

  v75 = [(SLComposeServiceViewController *)self contentView];
  v76 = [v75 placeholderLabel];
  [v76 sizeToFit];

  [(SLComposeServiceViewController *)self _updateContentViewWithCharactersRemaining];
  v77 = [(SLComposeServiceViewController *)self sheetView];
  [v77 setHidden:1];

  [(SLComposeServiceViewController *)self setSuppressKeyboard:1];
  uint64_t v78 = [(SLComposeServiceViewController *)self extensionContext];
  if (!v78) {
    return;
  }
  v79 = (void *)v78;
  v80 = [(SLComposeServiceViewController *)self extensionContext];
  uint64_t v81 = [v80 inputItems];
  if (v81)
  {
    v82 = (void *)v81;
    v83 = [(SLComposeServiceViewController *)self extensionContext];
    v84 = [v83 inputItems];
    uint64_t v85 = [v84 count];

    if (!v85) {
      return;
    }
    v86 = [(SLComposeServiceViewController *)self extensionContext];
    v87 = [v86 inputItems];
    v79 = [v87 objectAtIndexedSubscript:0];

    v88 = [v79 attributedTitle];
    v94 = [v79 attributedContentText];
    _SLLog(v2, 7, @"SLComposeServiceViewController loadView using extensionItem.attributedTitle %@ extensionItem.attributedContentText %@");

    v89 = objc_msgSend(v79, "attributedContentText", v88, v94);
    v90 = [v89 string];
    v91 = [(SLComposeServiceViewController *)self contentView];
    v92 = [v91 textView];
    [v92 setText:v90];

    v93 = [v79 attachments];
    [(SLComposeServiceViewController *)self _convertExtensionItemProvidersToAttachments:v93];

    [(SLComposeServiceViewController *)self validateContent];
  }
  else
  {
  }
}

- (void)_convertExtensionItemProvidersToAttachments:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v30;
    uint64_t v20 = *MEMORY[0x1E4F226F8];
    uint64_t v21 = *MEMORY[0x1E4F225B8];
    uint64_t v18 = *MEMORY[0x1E4F225F8];
    uint64_t v19 = *MEMORY[0x1E4F22610];
    uint64_t v17 = *MEMORY[0x1E4F22660];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v34[0] = v21;
          v34[1] = v20;
          v34[2] = v19;
          v34[3] = v18;
          v34[4] = v17;
          id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:5];
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v9 = v8;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v26;
            while (2)
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v26 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * j);
                if (objc_msgSend(v7, "hasItemConformingToTypeIdentifier:", v14, v15))
                {
                  uint64_t v15 = v14;
                  _SLLog(v23, 7, @"SLComposeServiceViewController got itemProvider conforming to %@");
                  ++self->_unfulfilledItemProviderRepresentations;
                  v24[0] = MEMORY[0x1E4F143A8];
                  v24[1] = 3221225472;
                  v24[2] = __78__SLComposeServiceViewController__convertExtensionItemProvidersToAttachments___block_invoke;
                  v24[3] = &unk_1E6468170;
                  v24[4] = v14;
                  void v24[5] = v7;
                  v24[6] = self;
                  [v7 loadItemForTypeIdentifier:v14 options:0 completionHandler:v24];
                  goto LABEL_18;
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }
LABEL_18:
        }
        else
        {
          uint64_t v15 = objc_opt_class();
          _SLLog(v23, 3, @"SLComposeServiceViewController ignoring unrecognized attachment class %@");
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v4);
  }
}

void __78__SLComposeServiceViewController__convertExtensionItemProvidersToAttachments___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  _SLLog(v2, 3, @"SLComposeServiceViewController got NSURL %@ for %@ error: %@");
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__SLComposeServiceViewController__convertExtensionItemProvidersToAttachments___block_invoke_2;
  block[3] = &unk_1E6467B38;
  void block[4] = *(void *)(a1 + 32);
  id v7 = v4;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __78__SLComposeServiceViewController__convertExtensionItemProvidersToAttachments___block_invoke_2(id *a1)
{
  if ([a1[4] isEqualToString:*MEMORY[0x1E4F22610]]) {
    goto LABEL_3;
  }
  uint64_t v3 = *MEMORY[0x1E4F225F8];
  if ([a1[4] isEqualToString:*MEMORY[0x1E4F225F8]]) {
    goto LABEL_3;
  }
  uint64_t v17 = *MEMORY[0x1E4F22660];
  if ([a1[4] isEqualToString:*MEMORY[0x1E4F22660]]) {
    goto LABEL_18;
  }
  if (!a1[5])
  {
    int v6 = 0;
    int v4 = 0;
    LOBYTE(v5) = 0;
    goto LABEL_34;
  }
  if ([a1[6] hasItemConformingToTypeIdentifier:v17])
  {
    uint64_t v36 = v17;
    _SLLog(v1, 7, @"SLComposeServiceViewController itemProvider also conforms to %@");
LABEL_18:
    int v6 = 0;
    LOBYTE(v5) = 0;
    uint64_t v7 = 2;
    int v4 = 1;
    goto LABEL_4;
  }
  if ([a1[6] hasItemConformingToTypeIdentifier:v3])
  {
    uint64_t v36 = v3;
    _SLLog(v1, 7, @"SLComposeServiceViewController itemProvider also conforms to %@");
LABEL_3:
    int v4 = 0;
    LOBYTE(v5) = 0;
    int v6 = 1;
    uint64_t v7 = 1;
    goto LABEL_4;
  }
  uint64_t v23 = [a1[5] scheme];
  int v24 = [v23 isEqualToString:@"assets-library"];

  id v25 = a1[5];
  if (!v24)
  {
    long long v30 = [v25 scheme];
    int v6 = [v30 isEqualToString:@"file"];

    if (!v6)
    {
      int v4 = 0;
      uint64_t v7 = 3;
      LOBYTE(v5) = 1;
      goto LABEL_4;
    }
    long long v31 = [a1[5] resourceSpecifier];
    if ([v31 hasCaseInsensitiveSuffix:@".MOV"])
    {

      goto LABEL_18;
    }
    long long v32 = [a1[5] resourceSpecifier];
    char v33 = [v32 hasCaseInsensitiveSuffix:@".MOV?"];

    if (v33) {
      goto LABEL_18;
    }
    double v34 = [a1[5] resourceSpecifier];
    if ([v34 hasCaseInsensitiveSuffix:@".JPG"])
    {

      goto LABEL_3;
    }
    double v35 = [a1[5] resourceSpecifier];
    int v5 = [v35 hasCaseInsensitiveSuffix:@".JPEG"];

    if (v5) {
      goto LABEL_3;
    }
    int v6 = 0;
    int v4 = 0;
LABEL_34:
    uint64_t v7 = 0;
    goto LABEL_4;
  }
  long long v26 = [v25 resourceSpecifier];
  [v26 rangeOfString:@".MOV?"];
  uint64_t v28 = v27;

  LOBYTE(v5) = 0;
  BOOL v29 = v28 == 0;
  int v6 = v28 == 0;
  int v4 = !v29;
  if (v29) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
LABEL_4:
  uint64_t v37 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v7, v36);
  _SLLog(v1, 3, @"SLComposeServiceViewController got attachment coarseType %@");

  if (v6)
  {
    id v8 = a1[5];
    if (v8)
    {
      id v9 = objc_msgSend(v8, "scheme", v37);
      int v10 = [v9 isEqualToString:@"assets-library"];

      if (v10)
      {
        uint64_t v11 = SLImageAttachment;
LABEL_12:
        uint64_t v15 = (void *)[[v11 alloc] initWithAsset:a1[5] preview:0];
        goto LABEL_25;
      }
    }
    double v16 = [[SLImageAttachment alloc] initWithJPEGData:0 preview:0];
  }
  else
  {
    if (!v4)
    {
      if ((v5 & 1) == 0)
      {
        --*((void *)a1[7] + 123);
        goto LABEL_30;
      }
      uint64_t v18 = objc_msgSend(a1[6], "userInfo", v37);
      uint64_t v19 = [v18 objectForKeyedSubscript:@"SLAttachmentURLType"];

      uint64_t v20 = [SLURLAttachment alloc];
      if (v19) {
        uint64_t v21 = -[SLURLAttachment initWithURL:ofType:preview:](v20, "initWithURL:ofType:preview:", a1[5], [v19 integerValue], 0);
      }
      else {
        uint64_t v21 = [(SLURLAttachment *)v20 initWithURL:a1[5] previewImage:0];
      }
      id v38 = (id)v21;

      goto LABEL_24;
    }
    id v12 = a1[5];
    if (v12)
    {
      double v13 = objc_msgSend(v12, "scheme", v37);
      int v14 = [v13 isEqualToString:@"assets-library"];

      if (v14)
      {
        uint64_t v11 = SLVideoAttachment;
        goto LABEL_12;
      }
    }
    double v16 = [[SLVideoAttachment alloc] initWithVideoData:0 preview:0];
  }
  id v38 = v16;
  -[SLAttachment setPayloadSourceFileURL:](v16, "setPayloadSourceFileURL:", a1[5], v37);
LABEL_24:
  uint64_t v15 = v38;
LABEL_25:
  --*((void *)a1[7] + 123);
  if (v15)
  {
    id v39 = v15;
    [v15 setItemProvider:a1[6]];
    [v39 setTypeIdentifier:a1[4]];
    [a1[7] _addAttachment:v39];

    return;
  }
LABEL_30:
  _SLLog(v1, 3, @"SLComposeServiceViewController made no attachment for itemProvider conforming to %@");
  id v22 = a1[7];

  [v22 validateContent];
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (void)viewDidLoad
{
  _SLLog(v2, 6, @"SLComposeServiceViewController viewDidLoad");
  v5.receiver = self;
  v5.super_class = (Class)SLComposeServiceViewController;
  [(SLComposeServiceViewController *)&v5 viewDidLoad];
  int v4 = [(SLComposeServiceViewController *)self view];
  [v4 setNeedsUpdateConstraints];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v4 = a3;
  id v9 = objc_msgSend(NSNumber, "numberWithBool:");
  _SLLog(v3, 7, @"SLComposeServiceViewController viewWillAppear: %@ begin");

  v11.receiver = self;
  v11.super_class = (Class)SLComposeServiceViewController;
  -[SLComposeServiceViewController viewWillAppear:](&v11, sel_viewWillAppear_, v4, v9);
  [(SLComposeServiceViewController *)self updateSheetForVerticalSizeClass];
  [(SLComposeServiceViewController *)self _loadPreviewView];
  int v6 = [(SLComposeServiceViewController *)self configurationItems];
  if (![v6 count])
  {
    uint64_t v7 = [(SLComposeServiceViewController *)self sheetActions];

    int v6 = (void *)v7;
  }
  id v8 = [(SLComposeServiceViewController *)self sheetRootViewController];
  [v8 setConfigurationItems:v6];

  self->_didFirstSheetActionLoad = 1;
  [(SLComposeServiceViewController *)self positionSheetView];
  int v10 = [NSNumber numberWithBool:v4];
  _SLLog(v3, 7, @"SLComposeServiceViewController viewWillAppear: %@ end");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v5 = [NSNumber numberWithBool:a3];
  _SLLog(v3, 7, @"SLComposeServiceViewController viewDidAppear: %@");

  self->_wasPresented = 1;
  -[SLComposeServiceViewController setSuppressKeyboard:](self, "setSuppressKeyboard:", 0, v5);

  [(SLComposeServiceViewController *)self showKeyboardAnimated:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SLComposeServiceViewController;
  [(SLComposeServiceViewController *)&v3 viewDidDisappear:a3];
}

- (void)didReceiveMemoryWarning
{
  _SLLog(v2, 6, @"SheetViewController didReceiveMemoryWarning");
  v4.receiver = self;
  v4.super_class = (Class)SLComposeServiceViewController;
  [(SLComposeServiceViewController *)&v4 didReceiveMemoryWarning];
}

- (void)shouldShowNetworkActivityIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SLComposeServiceViewController *)self extensionContext];
  objc_super v4 = [NSNumber numberWithBool:v3];
  [v5 shouldShowNetworkActivityIndicator:v4];
}

- (void)networkActivityIndicatorNotification:(id)a3
{
  id v4 = [a3 name];
  -[SLComposeServiceViewController shouldShowNetworkActivityIndicator:](self, "shouldShowNetworkActivityIndicator:", [v4 isEqualToString:SLShowNetworkActivityIndicatorNotification]);
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (UIViewController)autoCompletionViewController
{
  return self->_autoCompletionViewController;
}

- (SLSheetContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (NSMutableArray)constraints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setConstraints:(id)a3
{
}

- (SLSheetRootViewController)sheetRootViewController
{
  return self->_sheetRootViewController;
}

- (void)setSheetRootViewController:(id)a3
{
}

- (SLSheetNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (BOOL)preventSheetPositionChanges
{
  return self->_preventSheetPositionChanges;
}

- (void)setPreventSheetPositionChanges:(BOOL)a3
{
  self->_preventSheetPositionChanges = a3;
}

- (BOOL)wasPresented
{
  return self->_wasPresented;
}

- (BOOL)suppressKeyboard
{
  return self->_suppressKeyboard;
}

- (void)setSuppressKeyboard:(BOOL)a3
{
  self->_suppressKeyboard = a3;
}

- (unint64_t)maxImageAttachmentSize
{
  return self->_maxImageAttachmentSize;
}

- (void)setMaxImageAttachmentSize:(unint64_t)a3
{
  self->_maxImageAttachmentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_sheetRootViewController, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_autoCompletionViewController, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_viewControllerForTrackingSheetSize, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_previewImageSource, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_vignetteLayer, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_charactersRemaining, 0);
  objc_storeStrong((id *)&self->_serviceIconImage, 0);
  objc_storeStrong((id *)&self->_attachments, 0);

  objc_storeStrong((id *)&self->_hostProxy, 0);
}

@end