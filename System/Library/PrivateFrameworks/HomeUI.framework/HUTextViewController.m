@interface HUTextViewController
- (BOOL)showProgressIndicatorView;
- (BOOL)showsShareButton;
- (HUActivityLoadingView)loadingView;
- (HUTextViewController)initWithTextTitle:(id)a3;
- (NAFuture)loadingFuture;
- (NSAttributedString)textContent;
- (NSString)titleText;
- (UIBarButtonItem)shareButton;
- (UITextView)textView;
- (UIView)curtainView;
- (id)_textContentWithDefaultAttributes;
- (id)hu_preloadContent;
- (void)_fulfillProgressIndicatorState:(BOOL)a3;
- (void)_shareLog:(id)a3;
- (void)loadTextFromFuture:(id)a3 textTitle:(id)a4;
- (void)setLoadingFuture:(id)a3;
- (void)setShowProgressIndicatorView:(BOOL)a3;
- (void)setShowProgressIndicatorView:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowsShareButton:(BOOL)a3;
- (void)setTextContent:(id)a3;
- (void)setTitleText:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUTextViewController

- (HUTextViewController)initWithTextTitle:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUTextViewController;
  v6 = [(HUTextViewController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_titleText, a3);
    v8 = [(HUActivityLoadingView *)v7->_loadingView textLabel];
    [v8 setText:v5];

    v7->_showProgressIndicatorView = 1;
  }

  return v7;
}

- (void)viewDidLoad
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  v100.receiver = self;
  v100.super_class = (Class)HUTextViewController;
  [(HUTextViewController *)&v100 viewDidLoad];
  v3 = (UITextView *)objc_opt_new();
  textView = self->_textView;
  self->_textView = v3;

  [(UITextView *)self->_textView setEditable:0];
  id v5 = [HUActivityLoadingView alloc];
  v6 = -[HUActivityLoadingView initWithFrame:activityIndicatorStyle:](v5, "initWithFrame:activityIndicatorStyle:", 100, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  loadingView = self->_loadingView;
  self->_loadingView = v6;

  v8 = [(HUActivityLoadingView *)self->_loadingView textLabel];
  [v8 setLineBreakMode:4];

  v9 = (UIView *)objc_opt_new();
  curtainView = self->_curtainView;
  self->_curtainView = v9;

  v11 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  [(UIView *)self->_curtainView setBackgroundColor:v11];

  [(UIView *)self->_curtainView setAlpha:0.0];
  [(UIView *)self->_curtainView setUserInteractionEnabled:0];
  [(UIView *)self->_curtainView addSubview:self->_loadingView];
  v12 = [(HUTextViewController *)self textContent];

  if (v12)
  {
    v13 = [(HUTextViewController *)self _textContentWithDefaultAttributes];
    v14 = [(HUTextViewController *)self textView];
    [v14 setAttributedText:v13];
  }
  v15 = [(HUTextViewController *)self titleText];

  if (v15)
  {
    v16 = [(HUTextViewController *)self titleText];
    v17 = [(HUTextViewController *)self loadingView];
    v18 = [v17 textLabel];
    [v18 setText:v16];
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v19 = [(HUTextViewController *)self textView];
  v102[0] = v19;
  v20 = [(HUTextViewController *)self curtainView];
  v102[1] = v20;
  v21 = [(HUTextViewController *)self loadingView];
  v102[2] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:3];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v96 objects:v103 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v97 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v96 + 1) + 8 * i);
        [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
        v28 = [(HUTextViewController *)self view];
        [v28 addSubview:v27];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v96 objects:v103 count:16];
    }
    while (v24);
  }

  v29 = objc_opt_new();
  v30 = [(HUTextViewController *)self view];
  [v30 addLayoutGuide:v29];

  v31 = [v29 heightAnchor];
  v32 = [(HUTextViewController *)self view];
  v33 = [v32 heightAnchor];
  v34 = [v31 constraintEqualToAnchor:v33 multiplier:0.3];
  [v34 setActive:1];

  v74 = v29;
  v35 = [v29 topAnchor];
  v36 = [(HUTextViewController *)self view];
  v37 = [v36 topAnchor];
  v38 = [v35 constraintEqualToAnchor:v37];
  [v38 setActive:1];

  v95 = [(HUTextViewController *)self textView];
  v93 = [v95 topAnchor];
  v94 = [(HUTextViewController *)self view];
  v92 = [v94 topAnchor];
  v91 = [v93 constraintEqualToAnchor:v92];
  v101[0] = v91;
  v90 = [(HUTextViewController *)self textView];
  v88 = [v90 bottomAnchor];
  v89 = [(HUTextViewController *)self view];
  v87 = [v89 bottomAnchor];
  v86 = [v88 constraintEqualToAnchor:v87];
  v101[1] = v86;
  v85 = [(HUTextViewController *)self textView];
  v83 = [v85 leadingAnchor];
  v84 = [(HUTextViewController *)self view];
  v82 = [v84 leadingAnchor];
  v81 = [v83 constraintEqualToAnchor:v82];
  v101[2] = v81;
  v80 = [(HUTextViewController *)self textView];
  v78 = [v80 trailingAnchor];
  v79 = [(HUTextViewController *)self view];
  v77 = [v79 trailingAnchor];
  v76 = [v78 constraintEqualToAnchor:v77];
  v101[3] = v76;
  v75 = [(HUTextViewController *)self curtainView];
  v72 = [v75 topAnchor];
  v73 = [(HUTextViewController *)self view];
  v71 = [v73 topAnchor];
  v70 = [v72 constraintEqualToAnchor:v71];
  v101[4] = v70;
  v69 = [(HUTextViewController *)self curtainView];
  v67 = [v69 bottomAnchor];
  v68 = [(HUTextViewController *)self view];
  v66 = [v68 bottomAnchor];
  v65 = [v67 constraintEqualToAnchor:v66];
  v101[5] = v65;
  v64 = [(HUTextViewController *)self curtainView];
  v61 = [v64 leadingAnchor];
  v62 = [(HUTextViewController *)self view];
  v60 = [v62 leadingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v101[6] = v59;
  v58 = [(HUTextViewController *)self curtainView];
  v56 = [v58 trailingAnchor];
  v57 = [(HUTextViewController *)self view];
  v55 = [v57 trailingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55];
  v101[7] = v54;
  v53 = [(HUTextViewController *)self loadingView];
  v52 = [v53 centerYAnchor];
  v51 = [v29 bottomAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v101[8] = v50;
  v49 = [(HUTextViewController *)self loadingView];
  v39 = [v49 centerXAnchor];
  v40 = [(HUTextViewController *)self curtainView];
  v41 = [v40 centerXAnchor];
  v42 = [v39 constraintEqualToAnchor:v41];
  v101[9] = v42;
  v43 = [(HUTextViewController *)self loadingView];
  v44 = [v43 widthAnchor];
  v45 = [(HUTextViewController *)self view];
  v46 = [v45 layoutMarginsGuide];
  v47 = [v46 widthAnchor];
  v48 = [v44 constraintLessThanOrEqualToAnchor:v47];
  v101[10] = v48;
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:11];

  [MEMORY[0x1E4F28DC8] activateConstraints:v63];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUTextViewController;
  -[HUTextViewController viewWillAppear:](&v12, sel_viewWillAppear_);
  if ([(HUTextViewController *)self showsShareButton])
  {
    id v5 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:9 target:self action:sel__shareLog_];
    shareButton = self->_shareButton;
    self->_shareButton = v5;

    v7 = [(HUTextViewController *)self shareButton];
    v8 = [(HUTextViewController *)self navigationItem];
    [v8 setRightBarButtonItem:v7];
  }
  [(HUTextViewController *)self _fulfillProgressIndicatorState:v3];
  double v9 = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v11 = [(HUTextViewController *)self textView];
  objc_msgSend(v11, "setContentOffset:", v9, v10);
}

- (id)hu_preloadContent
{
  BOOL v3 = [(HUTextViewController *)self loadingFuture];

  if (v3) {
    [(HUTextViewController *)self loadingFuture];
  }
  else {
  v4 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v4;
}

- (void)setTextContent:(id)a3
{
  id v8 = a3;
  if ((-[NSAttributedString isEqual:](self->_textContent, "isEqual:") & 1) == 0)
  {
    v4 = (NSAttributedString *)[v8 copy];
    textContent = self->_textContent;
    self->_textContent = v4;

    v6 = [(HUTextViewController *)self _textContentWithDefaultAttributes];
    v7 = [(HUTextViewController *)self textView];
    [v7 setAttributedText:v6];
  }
}

- (void)setShowProgressIndicatorView:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showProgressIndicatorView != a3)
  {
    BOOL v4 = a4;
    self->_showProgressIndicatorView = a3;
    if ([(HUTextViewController *)self isViewLoaded])
    {
      [(HUTextViewController *)self _fulfillProgressIndicatorState:v4];
    }
  }
}

- (void)setShowProgressIndicatorView:(BOOL)a3
{
}

- (void)loadTextFromFuture:(id)a3 textTitle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HUTextViewController.m", 150, @"Invalid parameter not satisfying: %@", @"loadFuture" object file lineNumber description];
  }
  [(HUTextViewController *)self setTitleText:v8];
  double v9 = [(HUTextViewController *)self loadingView];
  double v10 = [v9 textLabel];
  [v10 setText:v8];

  v11 = [(HUTextViewController *)self loadingView];
  [v11 sizeToFit];

  objc_super v12 = [(HUTextViewController *)self view];
  [v12 setNeedsLayout];

  if (([v7 isFinished] & 1) == 0) {
    [(HUTextViewController *)self setShowProgressIndicatorView:1 animated:[(HUTextViewController *)self isViewLoaded] ^ 1];
  }
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__HUTextViewController_loadTextFromFuture_textTitle___block_invoke;
  v15[3] = &unk_1E6385FF0;
  objc_copyWeak(&v16, &location);
  v13 = [v7 addCompletionBlock:v15];
  [(HUTextViewController *)self setLoadingFuture:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __53__HUTextViewController_loadTextFromFuture_textTitle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__HUTextViewController_loadTextFromFuture_textTitle___block_invoke_2;
  block[3] = &unk_1E6385250;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __53__HUTextViewController_loadTextFromFuture_textTitle___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (!*(void *)(a1 + 32))
  {
    [WeakRetained setTextContent:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
  [WeakRetained setShowProgressIndicatorView:0];
}

- (id)_textContentWithDefaultAttributes
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F42508];
  id v3 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  v9[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v5 = [(HUTextViewController *)self textContent];
  id v6 = objc_msgSend(v5, "hf_attributedStringWithDefaultAttributes:", v4);

  return v6;
}

- (void)_shareLog:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(HUTextViewController *)self textContent];
  id v5 = objc_alloc(MEMORY[0x1E4F42718]);
  v15[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v7 = (void *)[v5 initWithActivityItems:v6 applicationActivities:0];

  [v7 setExcludedActivityCategories:1];
  uint64_t v8 = *MEMORY[0x1E4F435C8];
  v14[0] = *MEMORY[0x1E4F43598];
  v14[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F43608];
  v14[2] = *MEMORY[0x1E4F43588];
  v14[3] = v9;
  v14[4] = *MEMORY[0x1E4F43600];
  v14[5] = @"com.apple.mobilenotes.SharingExtension";
  v14[6] = @"com.apple.reminders.RemindersEditorExtension";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:7];
  [v7 setExcludedActivityTypes:v10];

  id v11 = [(HUTextViewController *)self navigationItem];
  id v12 = [v11 rightBarButtonItem];
  v13 = [v7 popoverPresentationController];
  [v13 setBarButtonItem:v12];

  [(HUTextViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)_fulfillProgressIndicatorState:(BOOL)a3
{
  BOOL v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__HUTextViewController__fulfillProgressIndicatorState___block_invoke;
  aBlock[3] = &unk_1E6386018;
  aBlock[4] = self;
  id v5 = (void (**)(void))_Block_copy(aBlock);
  if (v3)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F43008]);
    if ([(HUTextViewController *)self showProgressIndicatorView]) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __55__HUTextViewController__fulfillProgressIndicatorState___block_invoke_2;
    id v12 = &unk_1E6386040;
    v13 = v5;
    uint64_t v8 = (void *)[v6 initWithDuration:v7 curve:&v9 animations:0.25];
    objc_msgSend(v8, "startAnimation", v9, v10, v11, v12);
  }
  else
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    v5[2](v5);
    [MEMORY[0x1E4F39CF8] commit];
  }
}

void __55__HUTextViewController__fulfillProgressIndicatorState___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) showProgressIndicatorView];
  BOOL v3 = [*(id *)(a1 + 32) loadingView];
  BOOL v4 = [v3 activityIndicatorView];
  id v5 = v4;
  if (v2)
  {
    [v4 startAnimating];

    id v6 = [*(id *)(a1 + 32) curtainView];
    [v6 setAlpha:0.800000012];

    uint64_t v7 = [*(id *)(a1 + 32) loadingView];
    [v7 setAlpha:1.0];

    uint64_t v8 = [*(id *)(a1 + 32) shareButton];
    id v12 = v8;
    uint64_t v9 = 0;
  }
  else
  {
    [v4 stopAnimating];

    uint64_t v10 = [*(id *)(a1 + 32) curtainView];
    [v10 setAlpha:0.0];

    id v11 = [*(id *)(a1 + 32) loadingView];
    [v11 setAlpha:0.0];

    uint64_t v8 = [*(id *)(a1 + 32) shareButton];
    id v12 = v8;
    uint64_t v9 = 1;
  }
  [v8 setEnabled:v9];
}

uint64_t __55__HUTextViewController__fulfillProgressIndicatorState___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSAttributedString)textContent
{
  return self->_textContent;
}

- (BOOL)showsShareButton
{
  return self->_showsShareButton;
}

- (void)setShowsShareButton:(BOOL)a3
{
  self->_showsShareButton = a3;
}

- (UITextView)textView
{
  return self->_textView;
}

- (UIView)curtainView
{
  return self->_curtainView;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (HUActivityLoadingView)loadingView
{
  return self->_loadingView;
}

- (BOOL)showProgressIndicatorView
{
  return self->_showProgressIndicatorView;
}

- (UIBarButtonItem)shareButton
{
  return self->_shareButton;
}

- (NAFuture)loadingFuture
{
  return self->_loadingFuture;
}

- (void)setLoadingFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingFuture, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_curtainView, 0);
  objc_storeStrong((id *)&self->_textView, 0);

  objc_storeStrong((id *)&self->_textContent, 0);
}

@end