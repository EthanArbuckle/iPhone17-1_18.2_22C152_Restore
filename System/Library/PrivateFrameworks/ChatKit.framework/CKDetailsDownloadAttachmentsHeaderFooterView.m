@interface CKDetailsDownloadAttachmentsHeaderFooterView
+ (id)reuseIdentifier;
- (BOOL)logoHidden;
- (CKDetailsDownloadAttachmentsHeaderFooterView)initWithReuseIdentifier:(id)a3;
- (CKDetailsDownloadAttachmentsHeaderFooterViewDelegate)delegate;
- (NSLayoutConstraint)titleTextTopToLogoConstraint;
- (NSLayoutConstraint)titleTextTopToViewConstraint;
- (NSString)buttonText;
- (NSString)titleText;
- (UIColor)downloadButtonTextColor;
- (UIColor)titleTextColor;
- (UIImageView)iCloudImageView;
- (UITextView)buttonTextView;
- (UITextView)titleTextView;
- (void)_updateiCloudImageViewAppearance;
- (void)handleUserTap:(id)a3;
- (void)layoutSubviews;
- (void)setButtonText:(id)a3;
- (void)setButtonTextView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloadButtonTextColor:(id)a3;
- (void)setICloudImageView:(id)a3;
- (void)setLogoHidden:(BOOL)a3;
- (void)setTitleText:(id)a3;
- (void)setTitleTextColor:(id)a3;
- (void)setTitleTextTopToLogoConstraint:(id)a3;
- (void)setTitleTextTopToViewConstraint:(id)a3;
- (void)setTitleTextView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKDetailsDownloadAttachmentsHeaderFooterView

+ (id)reuseIdentifier
{
  return @"CKDetailsDownloadAttachmentsHeaderFooterView_reuseIdentifier";
}

- (CKDetailsDownloadAttachmentsHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  v89[4] = *MEMORY[0x1E4F143B8];
  v86.receiver = self;
  v86.super_class = (Class)CKDetailsDownloadAttachmentsHeaderFooterView;
  v3 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)&v86 initWithReuseIdentifier:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F42A80] systemImageNamed:@"icloud.fill"];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v4 highlightedImage:0];
    iCloudImageView = v3->_iCloudImageView;
    v3->_iCloudImageView = (UIImageView *)v5;

    [(UIImageView *)v3->_iCloudImageView setContentMode:1];
    [(CKDetailsDownloadAttachmentsHeaderFooterView *)v3 addSubview:v3->_iCloudImageView];
    [(UIImageView *)v3->_iCloudImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CKDetailsDownloadAttachmentsHeaderFooterView *)v3 _updateiCloudImageViewAppearance];
    v75 = (void *)MEMORY[0x1E4F28DC8];
    v81 = [(UIImageView *)v3->_iCloudImageView topAnchor];
    v78 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)v3 topAnchor];
    v7 = [v81 constraintEqualToAnchor:v78 constant:14.0];
    v89[0] = v7;
    v8 = [(UIImageView *)v3->_iCloudImageView centerXAnchor];
    v9 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)v3 centerXAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v89[1] = v10;
    v11 = [(UIImageView *)v3->_iCloudImageView widthAnchor];
    v12 = v4;
    v85 = v4;
    [v4 size];
    v13 = objc_msgSend(v11, "constraintEqualToConstant:");
    v89[2] = v13;
    v14 = [(UIImageView *)v3->_iCloudImageView heightAnchor];
    [v12 size];
    v16 = [v14 constraintEqualToConstant:v15];
    v89[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:4];
    [v75 activateConstraints:v17];

    id v18 = objc_alloc(MEMORY[0x1E4F42F58]);
    double v19 = *MEMORY[0x1E4F1DB28];
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v23 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], v20, v21, v22);
    titleTextView = v3->_titleTextView;
    v3->_titleTextView = (UITextView *)v23;

    [(UITextView *)v3->_titleTextView setEditable:0];
    v25 = [(UITextView *)v3->_titleTextView textContainer];
    [v25 setLineFragmentPadding:0.0];

    double v26 = *MEMORY[0x1E4F437F8];
    double v27 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v28 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v29 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    -[UITextView setTextContainerInset:](v3->_titleTextView, "setTextContainerInset:", *MEMORY[0x1E4F437F8], v27, v28, v29);
    v30 = v3->_titleTextView;
    v31 = [MEMORY[0x1E4F428B8] clearColor];
    [(UITextView *)v30 setBackgroundColor:v31];

    v32 = v3->_titleTextView;
    v33 = [MEMORY[0x1E4F428B8] darkGrayColor];
    [(UITextView *)v32 setTextColor:v33];

    [(UITextView *)v3->_titleTextView setTextAlignment:1];
    [(UITextView *)v3->_titleTextView setScrollEnabled:0];
    v34 = v3->_titleTextView;
    v35 = +[CKUIBehavior sharedBehaviors];
    v36 = [v35 iCloudTextFont];
    [(UITextView *)v34 setFont:v36];

    [(UITextView *)v3->_titleTextView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CKDetailsDownloadAttachmentsHeaderFooterView *)v3 addSubview:v3->_titleTextView];
    v76 = (void *)MEMORY[0x1E4F28DC8];
    v82 = [(UITextView *)v3->_titleTextView centerXAnchor];
    v79 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)v3 centerXAnchor];
    v37 = [v82 constraintEqualToAnchor:v79];
    v88[0] = v37;
    v38 = [(UITextView *)v3->_titleTextView leadingAnchor];
    v39 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)v3 leadingAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    v88[1] = v40;
    v41 = [(UITextView *)v3->_titleTextView trailingAnchor];
    v42 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)v3 trailingAnchor];
    v43 = [v41 constraintEqualToAnchor:v42];
    v88[2] = v43;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:3];
    [v76 activateConstraints:v44];

    v45 = [(UITextView *)v3->_titleTextView topAnchor];
    v46 = [(UIImageView *)v3->_iCloudImageView bottomAnchor];
    v47 = [v45 constraintEqualToAnchor:v46 constant:5.0];
    [(CKDetailsDownloadAttachmentsHeaderFooterView *)v3 setTitleTextTopToLogoConstraint:v47];

    v48 = [(UITextView *)v3->_titleTextView topAnchor];
    v49 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)v3 topAnchor];
    v50 = [v48 constraintEqualToAnchor:v49 constant:10.0];
    [(CKDetailsDownloadAttachmentsHeaderFooterView *)v3 setTitleTextTopToViewConstraint:v50];

    v51 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)v3 titleTextTopToLogoConstraint];
    [v51 setActive:1];

    v52 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)v3 titleTextTopToViewConstraint];
    [v52 setActive:0];

    uint64_t v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42F58]), "initWithFrame:", v19, v20, v21, v22);
    buttonTextView = v3->_buttonTextView;
    v3->_buttonTextView = (UITextView *)v53;

    [(UITextView *)v3->_buttonTextView setEditable:0];
    v55 = [(UITextView *)v3->_buttonTextView textContainer];
    [v55 setLineFragmentPadding:0.0];

    -[UITextView setTextContainerInset:](v3->_buttonTextView, "setTextContainerInset:", v26, v27, v28, v29);
    v56 = v3->_buttonTextView;
    v57 = [MEMORY[0x1E4F428B8] clearColor];
    [(UITextView *)v56 setBackgroundColor:v57];

    v58 = v3->_buttonTextView;
    v59 = [MEMORY[0x1E4F428B8] ckColorNamed:@"CKSystemBlueColor"];
    [(UITextView *)v58 setTextColor:v59];

    [(UITextView *)v3->_buttonTextView setTextAlignment:1];
    [(UITextView *)v3->_buttonTextView setScrollEnabled:0];
    v60 = v3->_buttonTextView;
    v61 = +[CKUIBehavior sharedBehaviors];
    v62 = [v61 downloadButtonFont];
    [(UITextView *)v60 setFont:v62];

    [(UITextView *)v3->_buttonTextView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CKDetailsDownloadAttachmentsHeaderFooterView *)v3 addSubview:v3->_buttonTextView];
    v73 = (void *)MEMORY[0x1E4F28DC8];
    v84 = [(UITextView *)v3->_buttonTextView topAnchor];
    v83 = [(UITextView *)v3->_titleTextView bottomAnchor];
    v80 = [v84 constraintEqualToAnchor:v83 constant:16.0];
    v87[0] = v80;
    v77 = [(UITextView *)v3->_buttonTextView centerXAnchor];
    v74 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)v3 centerXAnchor];
    v63 = [v77 constraintEqualToAnchor:v74];
    v87[1] = v63;
    v64 = [(UITextView *)v3->_buttonTextView leadingAnchor];
    v65 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)v3 leadingAnchor];
    v66 = [v64 constraintEqualToAnchor:v65];
    v87[2] = v66;
    v67 = [(UITextView *)v3->_buttonTextView trailingAnchor];
    v68 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)v3 trailingAnchor];
    v69 = [v67 constraintEqualToAnchor:v68];
    v87[3] = v69;
    v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:4];
    [v73 activateConstraints:v70];

    [(CKDetailsDownloadAttachmentsHeaderFooterView *)v3 setUserInteractionEnabled:1];
    v71 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v3 action:sel_handleUserTap_];
    [(UITextView *)v3->_buttonTextView addGestureRecognizer:v71];
  }
  return v3;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)CKDetailsDownloadAttachmentsHeaderFooterView;
  [(CKDetailsDownloadAttachmentsHeaderFooterView *)&v11 layoutSubviews];
  v3 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)self contentView];
  v4 = +[CKUIBehavior sharedBehaviors];
  uint64_t v5 = [v4 theme];
  v6 = [v5 detailsHeaderFooterContentViewBackgroundColor];
  [v3 setBackgroundColor:v6];

  v7 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)self backgroundView];
  v8 = +[CKUIBehavior sharedBehaviors];
  v9 = [v8 theme];
  v10 = [v9 detailsHeaderFooterContentViewBackgroundColor];
  [v7 setBackgroundColor:v10];
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
  id v5 = a3;
  id v6 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)self titleTextView];
  [v6 setText:v5];
}

- (void)setButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_buttonText, a3);
  id v5 = a3;
  id v6 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)self buttonTextView];
  [v6 setText:v5];
}

- (void)handleUserTap:(id)a3
{
  v4 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)self delegate];

  if (v4)
  {
    id v5 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)self delegate];
    [v5 userDidTapDownloadForAttachmentsFooterView:self];
  }
}

- (void)setTitleTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextColor, a3);
  id v5 = a3;
  id v6 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)self titleTextView];
  [v6 setTextColor:v5];
}

- (void)setDownloadButtonTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_downloadButtonTextColor, a3);
  id v5 = a3;
  id v6 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)self buttonTextView];
  [v6 setTextColor:v5];
}

- (void)setLogoHidden:(BOOL)a3
{
  BOOL v3 = a3;
  self->_logoHidden = a3;
  id v5 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)self titleTextTopToLogoConstraint];
  [v5 setActive:v3 ^ 1];

  id v6 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)self titleTextTopToViewConstraint];
  [v6 setActive:v3];

  id v7 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)self iCloudImageView];
  [v7 setHidden:v3];
}

- (void)_updateiCloudImageViewAppearance
{
  BOOL v3 = [(CKDetailsDownloadAttachmentsHeaderFooterView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];
  id v5 = +[CKUIBehavior sharedBehaviors];
  id v6 = v5;
  if (v4 == 1) {
    [v5 detailsDownloadAttachmentsHeaderiCloudImageAlphaForLightMode];
  }
  else {
    [v5 detailsDownloadAttachmentsHeaderiCloudImageAlphaForDarkMode];
  }
  double v8 = v7;

  iCloudImageView = self->_iCloudImageView;

  [(UIImageView *)iCloudImageView setAlpha:v8];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKDetailsDownloadAttachmentsHeaderFooterView;
  [(CKDetailsDownloadAttachmentsHeaderFooterView *)&v4 traitCollectionDidChange:a3];
  [(CKDetailsDownloadAttachmentsHeaderFooterView *)self _updateiCloudImageViewAppearance];
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (CKDetailsDownloadAttachmentsHeaderFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKDetailsDownloadAttachmentsHeaderFooterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)downloadButtonTextColor
{
  return self->_downloadButtonTextColor;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (BOOL)logoHidden
{
  return self->_logoHidden;
}

- (UIImageView)iCloudImageView
{
  return self->_iCloudImageView;
}

- (void)setICloudImageView:(id)a3
{
}

- (UITextView)titleTextView
{
  return self->_titleTextView;
}

- (void)setTitleTextView:(id)a3
{
}

- (UITextView)buttonTextView
{
  return self->_buttonTextView;
}

- (void)setButtonTextView:(id)a3
{
}

- (NSLayoutConstraint)titleTextTopToLogoConstraint
{
  return self->_titleTextTopToLogoConstraint;
}

- (void)setTitleTextTopToLogoConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleTextTopToViewConstraint
{
  return self->_titleTextTopToViewConstraint;
}

- (void)setTitleTextTopToViewConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTextTopToViewConstraint, 0);
  objc_storeStrong((id *)&self->_titleTextTopToLogoConstraint, 0);
  objc_storeStrong((id *)&self->_buttonTextView, 0);
  objc_storeStrong((id *)&self->_titleTextView, 0);
  objc_storeStrong((id *)&self->_iCloudImageView, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_downloadButtonTextColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonText, 0);

  objc_storeStrong((id *)&self->_titleText, 0);
}

@end