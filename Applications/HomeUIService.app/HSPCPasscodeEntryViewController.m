@interface HSPCPasscodeEntryViewController
- (BOOL)useMonospacedFont;
- (HSPCPasscodeEntryView)passcodeEntryView;
- (HSPCPasscodeEntryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSAttributedString)footnote;
- (PRXImageView)imageView;
- (PRXLabel)footnoteLabel;
- (UIImage)image;
- (id)textChangeHandler;
- (id)textEntryCompletionHandler;
- (int64_t)numberOfDigits;
- (void)_scrollToWells;
- (void)_textDidChange:(id)a3;
- (void)_updatePasscodeEntryView;
- (void)passcodeEntryViewDidBecomeFirstResponder:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setImage:(id)a3;
- (void)setNumberOfDigits:(int64_t)a3;
- (void)setTextChangeHandler:(id)a3;
- (void)setTextEntryCompletionHandler:(id)a3;
- (void)setUseMonospacedFont:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation HSPCPasscodeEntryViewController

- (HSPCPasscodeEntryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = [objc_alloc((Class)PRXCardContentView) initWithCardStyle:1];
  v6 = [(HSPCPasscodeEntryViewController *)self initWithContentView:v5];

  return v6;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HSPCPasscodeEntryViewController;
  [(HSPCPasscodeEntryViewController *)&v3 viewDidLoad];
  [(HSPCPasscodeEntryViewController *)self _updatePasscodeEntryView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HSPCPasscodeEntryViewController;
  [(HSPCPasscodeEntryViewController *)&v4 viewWillAppear:a3];
  [(HSPCPasscodeEntryView *)self->_passcodeEntryView becomeFirstResponder];
}

- (void)setNumberOfDigits:(int64_t)a3
{
  if (self->_numberOfDigits != a3)
  {
    self->_numberOfDigits = a3;
    [(HSPCPasscodeEntryViewController *)self _updatePasscodeEntryView];
  }
}

- (void)setUseMonospacedFont:(BOOL)a3
{
  if (self->_useMonospacedFont != a3)
  {
    self->_useMonospacedFont = a3;
    [(HSPCPasscodeEntryViewController *)self _updatePasscodeEntryView];
  }
}

- (void)setImage:(id)a3
{
  id v5 = a3;
  if ((-[UIImage isEqual:](self->_image, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_image, a3);
    [(HSPCPasscodeEntryViewController *)self _updatePasscodeEntryView];
  }
}

- (void)setFootnote:(id)a3
{
  id v6 = a3;
  if (!-[NSAttributedString isEqualToAttributedString:](self->_footnote, "isEqualToAttributedString:"))
  {
    objc_super v4 = (NSAttributedString *)[v6 copy];
    footnote = self->_footnote;
    self->_footnote = v4;

    [(HSPCPasscodeEntryViewController *)self _updatePasscodeEntryView];
  }
}

- (void)_updatePasscodeEntryView
{
  if ([(HSPCPasscodeEntryViewController *)self isViewLoaded])
  {
    objc_super v3 = [(HSPCPasscodeEntryViewController *)self contentView];
    objc_super v4 = [v3 mainContentGuide];

    [(PRXImageView *)self->_imageView removeFromSuperview];
    id v5 = &AnalyticsSendEvent_ptr;
    v56 = v4;
    if (self->_image)
    {
      id v6 = +[PRXImageView imageViewWithStyle:0];
      imageView = self->_imageView;
      self->_imageView = v6;

      [(PRXImageView *)self->_imageView setImage:self->_image];
      [(PRXImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
      v8 = [(HSPCPasscodeEntryViewController *)self contentView];
      [v8 addSubview:self->_imageView];

      v9 = [(PRXImageView *)self->_imageView centerXAnchor];
      v10 = [v4 centerXAnchor];
      v11 = [v9 constraintEqualToAnchor:v10];
      v64[0] = v11;
      v12 = [(PRXImageView *)self->_imageView topAnchor];
      v13 = [v4 topAnchor];
      v14 = [v12 constraintGreaterThanOrEqualToAnchor:v13];
      v64[1] = v14;
      v15 = [(PRXImageView *)self->_imageView heightAnchor];
      v16 = [v15 constraintEqualToConstant:50.0];
      v64[2] = v16;
      v17 = +[NSArray arrayWithObjects:v64 count:3];
      +[NSLayoutConstraint activateConstraints:v17];

      objc_super v4 = v56;
      id v5 = &AnalyticsSendEvent_ptr;
    }
    [(HSPCPasscodeEntryView *)self->_passcodeEntryView removeFromSuperview];
    v18 = [HSPCPasscodeEntryView alloc];
    if (self->_numberOfDigits) {
      int64_t numberOfDigits = self->_numberOfDigits;
    }
    else {
      int64_t numberOfDigits = 4;
    }
    v20 = [(HSPCPasscodeEntryView *)v18 initWithNumberOfDigits:numberOfDigits useMonospacedFont:self->_useMonospacedFont delegate:self];
    passcodeEntryView = self->_passcodeEntryView;
    self->_passcodeEntryView = v20;

    [(HSPCPasscodeEntryView *)self->_passcodeEntryView setSemanticContentAttribute:3];
    [(HSPCPasscodeEntryView *)self->_passcodeEntryView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HSPCPasscodeEntryView *)self->_passcodeEntryView addTarget:self action:"_textDidChange:" forControlEvents:4096];
    v22 = [(HSPCPasscodeEntryViewController *)self contentView];
    [v22 addSubview:self->_passcodeEntryView];

    v23 = [(HSPCPasscodeEntryView *)self->_passcodeEntryView leadingAnchor];
    v24 = [v4 leadingAnchor];
    v25 = [v23 constraintGreaterThanOrEqualToAnchor:v24];
    v63[0] = v25;
    v26 = [(HSPCPasscodeEntryView *)self->_passcodeEntryView centerXAnchor];
    v27 = [v4 centerXAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v63[1] = v28;
    v29 = [v5[340] arrayWithObjects:v63 count:2];
    +[NSLayoutConstraint activateConstraints:v29];

    v30 = self->_imageView;
    v31 = [(HSPCPasscodeEntryView *)self->_passcodeEntryView topAnchor];
    if (v30)
    {
      v32 = [(PRXImageView *)self->_imageView bottomAnchor];
      v33 = [v31 constraintEqualToAnchor:v32 constant:20.0];
      v62 = v33;
      v34 = +[NSArray arrayWithObjects:&v62 count:1];
      +[NSLayoutConstraint activateConstraints:v34];
    }
    else
    {
      v32 = [v56 topAnchor];
      v33 = [v31 constraintGreaterThanOrEqualToAnchor:v32];
      v61[0] = v33;
      v34 = [(HSPCPasscodeEntryView *)self->_passcodeEntryView centerYAnchor];
      v57 = [v56 centerYAnchor];
      v35 = [v34 constraintEqualToAnchor:v57];
      v61[1] = v35;
      v36 = +[NSArray arrayWithObjects:v61 count:2];
      +[NSLayoutConstraint activateConstraints:v36];
    }
    [(PRXLabel *)self->_footnoteLabel removeFromSuperview];
    if (self->_footnote)
    {
      v37 = +[PRXLabel labelWithStyle:3];
      footnoteLabel = self->_footnoteLabel;
      self->_footnoteLabel = v37;

      [(PRXLabel *)self->_footnoteLabel setAttributedText:self->_footnote];
      [(PRXLabel *)self->_footnoteLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v39 = [(HSPCPasscodeEntryViewController *)self contentView];
      [v39 addSubview:self->_footnoteLabel];

      v58 = [(PRXLabel *)self->_footnoteLabel leadingAnchor];
      v40 = v56;
      uint64_t v54 = [v56 leadingAnchor];
      uint64_t v52 = [v58 constraintEqualToAnchor:v54];
      v60[0] = v52;
      v41 = [(PRXLabel *)self->_footnoteLabel trailingAnchor];
      v55 = [v56 trailingAnchor];
      v53 = [v41 constraintEqualToAnchor:v55];
      v60[1] = v53;
      v42 = [(PRXLabel *)self->_footnoteLabel topAnchor];
      v43 = [(HSPCPasscodeEntryView *)self->_passcodeEntryView bottomAnchor];
      v44 = [v42 constraintEqualToAnchor:v43 constant:10.0];
      v60[2] = v44;
      v45 = [v56 bottomAnchor];
      v46 = [(PRXLabel *)self->_footnoteLabel bottomAnchor];
      v47 = [v45 constraintGreaterThanOrEqualToAnchor:v46 constant:10.0];
      v60[3] = v47;
      v48 = +[NSArray arrayWithObjects:v60 count:4];
      +[NSLayoutConstraint activateConstraints:v48];

      v49 = (void *)v52;
      v50 = (void *)v54;

      v51 = v58;
    }
    else
    {
      v40 = v56;
      v51 = [v56 bottomAnchor];
      v50 = [(HSPCPasscodeEntryView *)self->_passcodeEntryView bottomAnchor];
      v49 = [v51 constraintGreaterThanOrEqualToAnchor:v50 constant:10.0];
      v59 = v49;
      v41 = +[NSArray arrayWithObjects:&v59 count:1];
      +[NSLayoutConstraint activateConstraints:v41];
    }
  }
}

- (void)_textDidChange:(id)a3
{
  id v11 = a3;
  -[HSPCPasscodeEntryViewController textDidChange:](self, "textDidChange:");
  textChangeHandler = (void (**)(id, void *))self->_textChangeHandler;
  if (textChangeHandler)
  {
    id v5 = [v11 text];
    textChangeHandler[2](textChangeHandler, v5);
  }
  id v6 = [v11 text];
  id v7 = [v6 length];
  id v8 = [v11 numberOfDigits];

  if (v7 == v8)
  {
    [(HSPCPasscodeEntryViewController *)self didCompleteTextEntry:v11];
    textEntryCompletionHandler = (void (**)(id, void *))self->_textEntryCompletionHandler;
    if (textEntryCompletionHandler)
    {
      v10 = [v11 text];
      textEntryCompletionHandler[2](textEntryCompletionHandler, v10);
    }
  }
}

- (void)_scrollToWells
{
  if ([(HSPCPasscodeEntryView *)self->_passcodeEntryView isFirstResponder])
  {
    objc_super v3 = [(HSPCPasscodeEntryViewController *)self contentView];
    objc_super v4 = [v3 superview];
    [v4 frame];
    double v6 = v5;
    id v7 = [(HSPCPasscodeEntryViewController *)self contentView];
    [v7 frame];
    double v9 = v6 - v8;
    [(HSPCPasscodeEntryView *)self->_passcodeEntryView frame];
    double v11 = v10;

    [(HSPCPasscodeEntryView *)self->_passcodeEntryView frame];
    if (v11 - v9 + v12 + 4.0 > 0.0)
    {
      [(HSPCPasscodeEntryViewController *)self setContentOffset:1 animated:0.0];
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)HSPCPasscodeEntryViewController;
  id v7 = a4;
  -[HSPCPasscodeEntryViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100038C8C;
  v8[3] = &unk_1000AA608;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

- (void)passcodeEntryViewDidBecomeFirstResponder:(id)a3
{
  if (self->_passcodeEntryView == a3) {
    [(HSPCPasscodeEntryViewController *)self _scrollToWells];
  }
}

- (HSPCPasscodeEntryView)passcodeEntryView
{
  return self->_passcodeEntryView;
}

- (int64_t)numberOfDigits
{
  return self->_numberOfDigits;
}

- (BOOL)useMonospacedFont
{
  return self->_useMonospacedFont;
}

- (PRXImageView)imageView
{
  return self->_imageView;
}

- (PRXLabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (id)textChangeHandler
{
  return self->_textChangeHandler;
}

- (void)setTextChangeHandler:(id)a3
{
}

- (id)textEntryCompletionHandler
{
  return self->_textEntryCompletionHandler;
}

- (void)setTextEntryCompletionHandler:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (NSAttributedString)footnote
{
  return self->_footnote;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_textEntryCompletionHandler, 0);
  objc_storeStrong(&self->_textChangeHandler, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_passcodeEntryView, 0);
}

@end