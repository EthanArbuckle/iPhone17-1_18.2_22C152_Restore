@interface CNAvatarCaptureViewController
- (AVTAvatarRecord)avatarRecord;
- (AVTView)avtView;
- (BOOL)shouldUseLandscapeLayout;
- (CNAvatarCaptureViewController)initWithAvatarRecord:(id)a3;
- (CNAvatarCaptureViewControllerDelegate)delegate;
- (CNCaptureButtonView)captureButtonView;
- (NSLayoutConstraint)avtViewHeightConstraint;
- (UIButton)cancelButton;
- (UIImage)capturedImage;
- (UILabel)promptLabel;
- (UIView)captureFooter;
- (void)addPromptLabel;
- (void)didTapCaptureButton:(id)a3;
- (void)dismissCaptureController;
- (void)layoutFooterView;
- (void)loadAvatarView;
- (void)setAvatarRecord:(id)a3;
- (void)setAvtView:(id)a3;
- (void)setAvtViewHeightConstraint:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCaptureButtonView:(id)a3;
- (void)setCaptureFooter:(id)a3;
- (void)setCapturedImage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPromptLabel:(id)a3;
- (void)setupFooterView;
- (void)updateAvtViewAspectRatioConstraint;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CNAvatarCaptureViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capturedImage, 0);
  objc_storeStrong((id *)&self->_captureFooter, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_captureButtonView, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_promptLabel, 0);
  objc_storeStrong((id *)&self->_avtView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setCapturedImage:(id)a3
{
}

- (UIImage)capturedImage
{
  return self->_capturedImage;
}

- (void)setCaptureFooter:(id)a3
{
}

- (UIView)captureFooter
{
  return self->_captureFooter;
}

- (void)setCancelButton:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCaptureButtonView:(id)a3
{
}

- (CNCaptureButtonView)captureButtonView
{
  return self->_captureButtonView;
}

- (void)setAvatarRecord:(id)a3
{
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setPromptLabel:(id)a3
{
}

- (UILabel)promptLabel
{
  return self->_promptLabel;
}

- (void)setAvtViewHeightConstraint:(id)a3
{
  self->_avtViewHeightConstraint = (NSLayoutConstraint *)a3;
}

- (NSLayoutConstraint)avtViewHeightConstraint
{
  return self->_avtViewHeightConstraint;
}

- (void)setAvtView:(id)a3
{
}

- (AVTView)avtView
{
  return self->_avtView;
}

- (void)setDelegate:(id)a3
{
}

- (CNAvatarCaptureViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNAvatarCaptureViewControllerDelegate *)WeakRetained;
}

- (void)didTapCaptureButton:(id)a3
{
  v4 = [(CNAvatarCaptureViewController *)self delegate];

  if (v4)
  {
    v5 = [(CNAvatarCaptureViewController *)self avtView];
    v6 = [(CNAvatarCaptureViewController *)self view];
    [v6 bounds];
    objc_msgSend(v5, "snapshotWithSize:", v7, v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    v9 = [(CNAvatarCaptureViewController *)self delegate];
    [v9 avatarCaptureController:self didCaptureImage:v10];
  }
}

- (void)dismissCaptureController
{
  id v2 = [(CNAvatarCaptureViewController *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CNAvatarCaptureViewController;
  id v7 = a4;
  -[CNAvatarCaptureViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__CNAvatarCaptureViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5498AF8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __84__CNAvatarCaptureViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __84__CNAvatarCaptureViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v2[3] = &unk_1E549B488;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

uint64_t __84__CNAvatarCaptureViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) updateAvtViewAspectRatioConstraint];
  id v2 = [*(id *)(a1 + 32) avtView];
  [v2 updateInterfaceOrientation];

  v3 = *(void **)(a1 + 32);

  return [v3 layoutFooterView];
}

- (void)setupFooterView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v8 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  captureFooter = self->_captureFooter;
  self->_captureFooter = v8;

  id v10 = -[CNCaptureButtonView initWithFrame:]([CNCaptureButtonView alloc], "initWithFrame:", v4, v5, v6, v7);
  captureButtonView = self->_captureButtonView;
  self->_captureButtonView = v10;

  v12 = +[CNUIColorRepository photoPickerCropOverlayColor];
  [(UIView *)self->_captureFooter setBackgroundColor:v12];

  [(UIView *)self->_captureFooter setAutoresizingMask:10];
  v13 = [(CNAvatarCaptureViewController *)self view];
  [v13 addSubview:self->_captureFooter];

  [(CNCaptureButtonView *)self->_captureButtonView setAutoresizingMask:10];
  v14 = [MEMORY[0x1E4FB1618] clearColor];
  [(CNCaptureButtonView *)self->_captureButtonView setBackgroundColor:v14];

  v15 = [(CNCaptureButtonView *)self->_captureButtonView button];
  [v15 addTarget:self action:sel_didTapCaptureButton_ forEvents:64];

  [(UIView *)self->_captureFooter addSubview:self->_captureButtonView];
  v16 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  cancelButton = self->_cancelButton;
  self->_cancelButton = v16;

  v18 = self->_cancelButton;
  v19 = CNContactsUIBundle();
  v20 = [v19 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  [(UIButton *)v18 setTitle:v20 forState:0];

  v21 = self->_cancelButton;
  v22 = +[CNUIColorRepository photoPickerCaptureCancelButtonTextColor];
  [(UIButton *)v21 setTitleColor:v22 forState:0];

  v23 = (void *)MEMORY[0x1E4FB08E0];
  v24 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
  v25 = [v23 fontWithDescriptor:v24 size:18.0];
  v26 = [(UIButton *)self->_cancelButton titleLabel];
  [v26 setFont:v25];

  [(UIButton *)self->_cancelButton sizeToFit];
  [(UIButton *)self->_cancelButton addTarget:self action:sel_didTapCancelButton_ forEvents:64];
  v27 = self->_captureFooter;
  v28 = self->_cancelButton;

  [(UIView *)v27 addSubview:v28];
}

- (void)layoutFooterView
{
  if ([(CNAvatarCaptureViewController *)self shouldUseLandscapeLayout])
  {
    uint64_t v3 = [(CNAvatarCaptureViewController *)self interfaceOrientation];
    double v4 = [(CNAvatarCaptureViewController *)self view];
    [v4 bounds];
    if (v3 == 4)
    {
      double v7 = v6;
      double v8 = [(CNAvatarCaptureViewController *)self captureFooter];
      objc_msgSend(v8, "setFrame:", 0.0, 0.0, 190.0, v7);

      objc_super v9 = [(CNAvatarCaptureViewController *)self view];
      [v9 bounds];
      double v11 = v10;
      v12 = [(CNAvatarCaptureViewController *)self captureButtonView];
      objc_msgSend(v12, "setFrame:", 0.0, 0.0, 190.0, v11);

      v13 = [(CNAvatarCaptureViewController *)self view];
      [v13 bounds];
      double v15 = v14 + -190.0;
      v16 = [(CNAvatarCaptureViewController *)self view];
      [v16 bounds];
      double v18 = v17 * 0.5;
      v19 = [(CNAvatarCaptureViewController *)self promptLabel];
      objc_msgSend(v19, "setCenter:", v15, v18);

      CGAffineTransformMakeRotation(&v59, 1.57079633);
      v20 = [(CNAvatarCaptureViewController *)self promptLabel];
      v21 = v20;
      CGAffineTransform v58 = v59;
      v22 = &v58;
    }
    else
    {
      double v42 = v5 + -190.0;
      v43 = [(CNAvatarCaptureViewController *)self view];
      [v43 bounds];
      double v45 = v44;
      v46 = [(CNAvatarCaptureViewController *)self captureFooter];
      objc_msgSend(v46, "setFrame:", v42, 0.0, 190.0, v45);

      v47 = [(CNAvatarCaptureViewController *)self view];
      [v47 bounds];
      double v49 = v48;
      v50 = [(CNAvatarCaptureViewController *)self captureButtonView];
      objc_msgSend(v50, "setFrame:", 0.0, 0.0, 190.0, v49);

      v51 = [(CNAvatarCaptureViewController *)self view];
      [v51 bounds];
      double v53 = v52 * 0.5;
      v54 = [(CNAvatarCaptureViewController *)self promptLabel];
      objc_msgSend(v54, "setCenter:", 190.0, v53);

      CGAffineTransformMakeRotation(&v57, -1.57079633);
      v20 = [(CNAvatarCaptureViewController *)self promptLabel];
      v21 = v20;
      CGAffineTransform v56 = v57;
      v22 = &v56;
    }
    [v20 setTransform:v22];
  }
  else
  {
    v23 = [(CNAvatarCaptureViewController *)self view];
    [v23 bounds];
    double v25 = v24 + -190.0;
    v26 = [(CNAvatarCaptureViewController *)self view];
    [v26 bounds];
    double v28 = v27;
    v29 = [(CNAvatarCaptureViewController *)self captureFooter];
    objc_msgSend(v29, "setFrame:", 0.0, v25, v28, 190.0);

    v30 = [(CNAvatarCaptureViewController *)self view];
    [v30 bounds];
    double v32 = v31;
    v33 = [(CNAvatarCaptureViewController *)self captureButtonView];
    objc_msgSend(v33, "setFrame:", 0.0, 0.0, v32, 190.0);

    v34 = [(CNAvatarCaptureViewController *)self promptLabel];
    long long v35 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v55[0] = *MEMORY[0x1E4F1DAB8];
    v55[1] = v35;
    v55[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v34 setTransform:v55];

    v36 = [(CNAvatarCaptureViewController *)self promptLabel];
    [v36 sizeToFit];

    v21 = [(CNAvatarCaptureViewController *)self view];
    [v21 bounds];
    CGFloat v37 = CGRectGetWidth(v60) + -40.0;
    v38 = [(CNAvatarCaptureViewController *)self promptLabel];
    [v38 frame];
    double v40 = v39;
    v41 = [(CNAvatarCaptureViewController *)self promptLabel];
    objc_msgSend(v41, "setFrame:", 20.0, 64.0, v37, v40);
  }
}

- (BOOL)shouldUseLandscapeLayout
{
  uint64_t v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  return (v4 & 0xFFFFFFFFFFFFFFFBLL) != 1
      && (unint64_t)([(CNAvatarCaptureViewController *)self interfaceOrientation] - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (void)updateAvtViewAspectRatioConstraint
{
  uint64_t v3 = [(CNAvatarCaptureViewController *)self avtViewHeightConstraint];

  if (v3)
  {
    uint64_t v4 = [(CNAvatarCaptureViewController *)self view];
    double v5 = [(CNAvatarCaptureViewController *)self avtViewHeightConstraint];
    [v4 removeConstraint:v5];
  }
  double v6 = [(CNAvatarCaptureViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  objc_super v9 = [(CNAvatarCaptureViewController *)self view];
  [v9 bounds];
  double v11 = v8 / v10;

  v12 = [(CNAvatarCaptureViewController *)self avtView];
  v13 = [v12 heightAnchor];
  double v14 = [(CNAvatarCaptureViewController *)self avtView];
  double v15 = [v14 widthAnchor];
  v16 = [v13 constraintEqualToAnchor:v15 multiplier:v11];
  [(CNAvatarCaptureViewController *)self setAvtViewHeightConstraint:v16];

  id v18 = [(CNAvatarCaptureViewController *)self view];
  double v17 = [(CNAvatarCaptureViewController *)self avtViewHeightConstraint];
  [v18 addConstraint:v17];
}

- (void)viewDidLayoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)CNAvatarCaptureViewController;
  [(CNAvatarCaptureViewController *)&v23 viewDidLayoutSubviews];
  uint64_t v3 = [(CNAvatarCaptureViewController *)self cancelButton];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(CNAvatarCaptureViewController *)self cancelButton];
  objc_super v9 = [v8 titleLabel];
  double v10 = [(CNAvatarCaptureViewController *)self cancelButton];
  [v10 bounds];
  objc_msgSend(v9, "textRectForBounds:limitedToNumberOfLines:", 1);
  double v12 = v11;

  double v13 = 13.0;
  if ([(CNAvatarCaptureViewController *)self shouldUseLandscapeLayout])
  {
    double v14 = [(CNAvatarCaptureViewController *)self view];
    [v14 safeAreaInsets];
    double v13 = v15 + 13.0;
  }
  v16 = [(CNAvatarCaptureViewController *)self captureFooter];
  [v16 bounds];
  double v18 = v17 - v12;
  v19 = [(CNAvatarCaptureViewController *)self view];
  [v19 safeAreaInsets];
  double v21 = v18 - v20 + -32.0;

  v22 = [(CNAvatarCaptureViewController *)self cancelButton];
  objc_msgSend(v22, "setFrame:", v13, v21, v5, v7);
}

- (void)addPromptLabel
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CNAvatarCaptureViewController *)self setPromptLabel:v4];

  double v5 = [(CNAvatarCaptureViewController *)self promptLabel];
  [v5 setTextAlignment:1];

  double v6 = +[CNUIColorRepository photoPickerCapturePromptLabelTextColor];
  double v7 = [(CNAvatarCaptureViewController *)self promptLabel];
  [v7 setTextColor:v6];

  double v8 = (void *)MEMORY[0x1E4FB08E0];
  objc_super v9 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
  double v10 = [v8 fontWithDescriptor:v9 size:18.0];
  double v11 = [(CNAvatarCaptureViewController *)self promptLabel];
  [v11 setFont:v10];

  double v12 = CNContactsUIBundle();
  double v13 = [v12 localizedStringForKey:@"AVATAR_POSE_PROMPT" value:&stru_1ED8AC728 table:@"Localized"];
  double v14 = [(CNAvatarCaptureViewController *)self promptLabel];
  [v14 setText:v13];

  double v15 = [(CNAvatarCaptureViewController *)self promptLabel];
  [v15 sizeToFit];

  v16 = [(CNAvatarCaptureViewController *)self view];
  [v16 bounds];
  CGFloat v17 = CGRectGetWidth(v26) + -40.0;
  double v18 = [(CNAvatarCaptureViewController *)self promptLabel];
  [v18 frame];
  double v20 = v19;
  double v21 = [(CNAvatarCaptureViewController *)self promptLabel];
  objc_msgSend(v21, "setFrame:", 20.0, 64.0, v17, v20);

  v22 = [(CNAvatarCaptureViewController *)self promptLabel];
  [v22 setAutoresizingMask:34];

  id v24 = [(CNAvatarCaptureViewController *)self view];
  objc_super v23 = [(CNAvatarCaptureViewController *)self promptLabel];
  [v24 addSubview:v23];
}

- (void)loadAvatarView
{
  v48[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNAvatarCaptureViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v6 = [(CNAvatarCaptureViewController *)self view];
  [v6 frame];
  double v8 = v7;

  uint64_t v44 = 0;
  double v45 = &v44;
  uint64_t v46 = 0x2050000000;
  objc_super v9 = (void *)getAVTViewClass_softClass;
  uint64_t v47 = getAVTViewClass_softClass;
  if (!getAVTViewClass_softClass)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __getAVTViewClass_block_invoke;
    double v42 = &unk_1E549AD00;
    v43 = &v44;
    __getAVTViewClass_block_invoke((uint64_t)&v39);
    objc_super v9 = (void *)v45[3];
  }
  double v10 = v9;
  _Block_object_dispose(&v44, 8);
  double v11 = objc_msgSend([v10 alloc], "initWithFrame:", 0.0, 0.0, v5, v8);
  [(CNAvatarCaptureViewController *)self setAvtView:v11];

  double v12 = [(CNAvatarCaptureViewController *)self avtView];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v13 = [(CNAvatarCaptureViewController *)self view];
  double v14 = [v13 backgroundColor];
  double v15 = [(CNAvatarCaptureViewController *)self avtView];
  [v15 setBackgroundColor:v14];

  v16 = [(CNAvatarCaptureViewController *)self view];
  [v16 addSubview:self->_avtView];

  double v31 = [(CNAvatarCaptureViewController *)self view];
  v38 = [(CNAvatarCaptureViewController *)self avtView];
  v36 = [v38 leftAnchor];
  CGFloat v37 = [(CNAvatarCaptureViewController *)self view];
  long long v35 = [v37 leftAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v48[0] = v34;
  v33 = [(CNAvatarCaptureViewController *)self avtView];
  double v32 = [v33 rightAnchor];
  CGFloat v17 = [(CNAvatarCaptureViewController *)self view];
  double v18 = [v17 rightAnchor];
  double v19 = [v32 constraintEqualToAnchor:v18];
  v48[1] = v19;
  double v20 = [(CNAvatarCaptureViewController *)self avtView];
  double v21 = [v20 centerYAnchor];
  v22 = [(CNAvatarCaptureViewController *)self view];
  objc_super v23 = [v22 centerYAnchor];
  id v24 = [v21 constraintEqualToAnchor:v23];
  v48[2] = v24;
  double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];
  [v31 addConstraints:v25];

  [(CNAvatarCaptureViewController *)self updateAvtViewAspectRatioConstraint];
  uint64_t v44 = 0;
  double v45 = &v44;
  uint64_t v46 = 0x2050000000;
  CGRect v26 = (void *)getAVTAvatarRecordRenderingClass_softClass;
  uint64_t v47 = getAVTAvatarRecordRenderingClass_softClass;
  if (!getAVTAvatarRecordRenderingClass_softClass)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __getAVTAvatarRecordRenderingClass_block_invoke;
    double v42 = &unk_1E549AD00;
    v43 = &v44;
    __getAVTAvatarRecordRenderingClass_block_invoke((uint64_t)&v39);
    CGRect v26 = (void *)v45[3];
  }
  id v27 = v26;
  _Block_object_dispose(&v44, 8);
  double v28 = [(CNAvatarCaptureViewController *)self avatarRecord];
  v29 = [v27 avatarForRecord:v28];
  v30 = [(CNAvatarCaptureViewController *)self avtView];
  [v30 setAvatar:v29];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNAvatarCaptureViewController;
  [(CNAvatarCaptureViewController *)&v5 viewWillDisappear:a3];
  double v4 = [(CNAvatarCaptureViewController *)self avtView];
  [v4 setEnableFaceTracking:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNAvatarCaptureViewController;
  [(CNAvatarCaptureViewController *)&v5 viewDidAppear:a3];
  double v4 = [(CNAvatarCaptureViewController *)self avtView];
  [v4 updateInterfaceOrientation];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNAvatarCaptureViewController;
  [(CNAvatarCaptureViewController *)&v7 viewWillAppear:a3];
  double v4 = [(CNAvatarCaptureViewController *)self avtView];
  char v5 = [v4 enableFaceTracking];

  if ((v5 & 1) == 0)
  {
    double v6 = [(CNAvatarCaptureViewController *)self avtView];
    [v6 setEnableFaceTracking:1];
  }
  [(CNAvatarCaptureViewController *)self updateAvtViewAspectRatioConstraint];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)CNAvatarCaptureViewController;
  [(CNAvatarCaptureViewController *)&v11 viewDidLoad];
  id v3 = +[CNUIColorRepository photoPickerCaptureBackgroundColor];
  double v4 = [(CNAvatarCaptureViewController *)self view];
  [v4 setTintColor:v3];

  char v5 = +[CNUIColorRepository photoPickerCaptureBackgroundColor];
  double v6 = [(CNAvatarCaptureViewController *)self view];
  [v6 setBackgroundColor:v5];

  objc_super v7 = [(CNAvatarCaptureViewController *)self navigationItem];
  [v7 _setBackgroundHidden:1];

  double v8 = [(CNAvatarCaptureViewController *)self navigationController];
  objc_super v9 = [v8 navigationBar];
  char v10 = [v9 isTranslucent];

  if ((v10 & 1) == 0) {
    [(CNAvatarCaptureViewController *)self setExtendedLayoutIncludesOpaqueBars:1];
  }
  [(CNAvatarCaptureViewController *)self loadAvatarView];
  [(CNAvatarCaptureViewController *)self addPromptLabel];
  [(CNAvatarCaptureViewController *)self setupFooterView];
  [(CNAvatarCaptureViewController *)self layoutFooterView];
}

- (CNAvatarCaptureViewController)initWithAvatarRecord:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAvatarCaptureViewController;
  double v6 = [(CNAvatarCaptureViewController *)&v10 initWithNibName:0 bundle:0];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_avatarRecord, a3);
    double v8 = v7;
  }

  return v7;
}

@end