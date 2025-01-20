@interface AXLocalizationCaptionViewController
- (AXLocalizationCaptionViewControllerDelegate)delegate;
- (BOOL)_canShowWhileLocked;
- (UILabel)captionPanelText;
- (UIView)backgroundView;
- (UIView)lineView;
- (void)_processNextTextDisplayTimer;
- (void)_updateNumeratorDenominator;
- (void)_updateTextDisplay;
- (void)loadView;
- (void)setBackgroundView:(id)a3;
- (void)setCaptionPanelText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLineView:(id)a3;
- (void)showString:(id)a3;
- (void)uiLockPressed:(id)a3;
- (void)updateText:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation AXLocalizationCaptionViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  id v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(AXLocalizationCaptionViewController *)self setView:v3];
  v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];

  v5 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  changeDisplayTimer = self->_changeDisplayTimer;
  self->_changeDisplayTimer = v5;

  objc_initWeak(&location, self);
  v7 = +[AXSettings sharedInstance];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_345C;
  v14[3] = &unk_8438;
  objc_copyWeak(&v15, &location);
  [v7 registerUpdateBlock:v14 forRetrieveSelector:"localizationQACaptionShowFilePath" withListener:self];

  objc_destroyWeak(&v15);
  v8 = +[AXSettings sharedInstance];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_34B4;
  v12[3] = &unk_8438;
  objc_copyWeak(&v13, &location);
  [v8 registerUpdateBlock:v12 forRetrieveSelector:"localizationQACaptionShowUSString" withListener:self];

  objc_destroyWeak(&v13);
  v9 = +[AXSettings sharedInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_350C;
  v10[3] = &unk_8438;
  objc_copyWeak(&v11, &location);
  [v9 registerUpdateBlock:v10 forRetrieveSelector:"localizationQACaptionShowLocalizedString" withListener:self];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)viewDidLoad
{
  v54.receiver = self;
  v54.super_class = (Class)AXLocalizationCaptionViewController;
  [(AXLocalizationCaptionViewController *)&v54 viewDidLoad];
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(AXLocalizationCaptionViewController *)self setBackgroundView:v7];

  v8 = +[UIColor blackColor];
  v9 = [v8 colorWithAlphaComponent:0.649999976];
  v10 = [(AXLocalizationCaptionViewController *)self backgroundView];
  [v10 setBackgroundColor:v9];

  id v11 = [(AXLocalizationCaptionViewController *)self view];
  [v11 setAccessibilityElementsHidden:1];

  v12 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  stringCountLabelNumerator = self->_stringCountLabelNumerator;
  self->_stringCountLabelNumerator = v12;

  v14 = +[UIColor clearColor];
  [(UILabel *)self->_stringCountLabelNumerator setBackgroundColor:v14];

  id v15 = self->_stringCountLabelNumerator;
  v16 = +[UIColor yellowColor];
  [(UILabel *)v15 setTextColor:v16];

  [(UILabel *)self->_stringCountLabelNumerator setTextAlignment:0];
  v17 = self->_stringCountLabelNumerator;
  v18 = +[UIFont systemFontOfSize:6.0];
  [(UILabel *)v17 setFont:v18];

  [(UILabel *)self->_stringCountLabelNumerator setNumberOfLines:1];
  v19 = [(AXLocalizationCaptionViewController *)self backgroundView];
  [v19 addSubview:self->_stringCountLabelNumerator];

  v20 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  stringCountLabelDenominator = self->_stringCountLabelDenominator;
  self->_stringCountLabelDenominator = v20;

  v22 = +[UIColor clearColor];
  [(UILabel *)self->_stringCountLabelDenominator setBackgroundColor:v22];

  v23 = self->_stringCountLabelDenominator;
  v24 = +[UIColor whiteColor];
  [(UILabel *)v23 setTextColor:v24];

  [(UILabel *)self->_stringCountLabelDenominator setTextAlignment:0];
  v25 = self->_stringCountLabelDenominator;
  v26 = +[UIFont systemFontOfSize:6.0];
  [(UILabel *)v25 setFont:v26];

  [(UILabel *)self->_stringCountLabelDenominator setNumberOfLines:1];
  v27 = [(AXLocalizationCaptionViewController *)self backgroundView];
  [v27 addSubview:self->_stringCountLabelDenominator];

  v28 = +[UIColor clearColor];
  v29 = [(AXLocalizationCaptionViewController *)self view];
  [v29 setBackgroundColor:v28];

  id v30 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(AXLocalizationCaptionViewController *)self setCaptionPanelText:v30];

  v31 = +[UIColor clearColor];
  v32 = [(AXLocalizationCaptionViewController *)self captionPanelText];
  [v32 setBackgroundColor:v31];

  v33 = [(AXLocalizationCaptionViewController *)self captionPanelText];
  v34 = +[UIColor whiteColor];
  [v33 setTextColor:v34];

  v35 = [(AXLocalizationCaptionViewController *)self captionPanelText];
  [v35 setTextAlignment:0];

  v36 = [(AXLocalizationCaptionViewController *)self captionPanelText];
  v37 = +[UIFont systemFontOfSize:9.0];
  [v36 setFont:v37];

  v38 = [(AXLocalizationCaptionViewController *)self captionPanelText];
  [v38 setLineBreakMode:2];

  v39 = [(AXLocalizationCaptionViewController *)self captionPanelText];
  [v39 setNumberOfLines:2];

  v40 = [(AXLocalizationCaptionViewController *)self backgroundView];
  v41 = [(AXLocalizationCaptionViewController *)self captionPanelText];
  [v40 addSubview:v41];

  v42 = -[AXLocCaptionPanelUILockButton initWithFrame:]([AXLocCaptionPanelUILockButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  uiLockButton = self->_uiLockButton;
  self->_uiLockButton = v42;

  v44 = +[UIColor clearColor];
  [(AXLocCaptionPanelUILockButton *)self->_uiLockButton setBackgroundColor:v44];

  v45 = [(AXLocalizationCaptionViewController *)self backgroundView];
  [v45 addSubview:self->_uiLockButton];

  [(AXLocCaptionPanelUILockButton *)self->_uiLockButton addTarget:self action:"uiLockPressed:" forControlEvents:64];
  id v46 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(AXLocalizationCaptionViewController *)self setLineView:v46];

  v47 = [(AXLocalizationCaptionViewController *)self lineView];
  v48 = +[UIColor whiteColor];
  [v47 setBackgroundColor:v48];

  v49 = [(AXLocalizationCaptionViewController *)self view];
  v50 = [(AXLocalizationCaptionViewController *)self backgroundView];
  [v49 addSubview:v50];

  v51 = [(AXLocalizationCaptionViewController *)self view];
  v52 = [(AXLocalizationCaptionViewController *)self lineView];
  [v51 addSubview:v52];

  v53 = [(AXLocalizationCaptionViewController *)self view];
  [v53 setNeedsLayout];
}

- (void)uiLockPressed:(id)a3
{
  [(AXLocCaptionPanelUILockButton *)self->_uiLockButton setLocked:[(AXLocCaptionPanelUILockButton *)self->_uiLockButton locked] ^ 1];
  id v4 = [(AXLocalizationCaptionViewController *)self delegate];
  objc_msgSend(v4, "uiLockStateChanged:", -[AXLocCaptionPanelUILockButton locked](self->_uiLockButton, "locked"));
}

- (void)_updateTextDisplay
{
  unint64_t displayedPackage = self->_displayedPackage;
  if (displayedPackage >= [(NSArray *)self->_packages count])
  {
    int64_t v4 = 0;
    self->_unint64_t displayedPackage = 0;
  }
  else
  {
    int64_t v4 = self->_displayedPackage;
  }
  id v49 = [(NSArray *)self->_packages objectAtIndexedSubscript:v4];
  v48 = [v49 englishText];
  v5 = [v49 text];
  v47 = [v49 key];
  v6 = [v49 file];
  id v46 = [v49 bundle];
  if (v5)
  {
    if (v48) {
      unsigned int v7 = [v48 isEqualToString:v5] ^ 1;
    }
    else {
      unsigned int v7 = 0;
    }
    if ((unint64_t)[v5 length] >= 0x29)
    {
      v8 = objc_msgSend(v5, "substringWithRange:", 0, 40);

      v5 = [v8 stringByAppendingString:@"…"];
    }
    v45 = +[NSString stringWithFormat:@" %@", v5];

    id v9 = [objc_alloc((Class)NSMutableAttributedString) initWithString:&stru_85F8];
    id v10 = objc_alloc_init((Class)NSMutableParagraphStyle);
    [v10 setLineSpacing:3.0];
    [v10 setLineHeightMultiple:1.0];
    [v10 setParagraphSpacingBefore:0.0];
    [v10 setMaximumLineHeight:8.0];
    unsigned int v44 = [v46 hasSuffix:@"axbundle"];
    if ([v47 length])
    {
      id v11 = v6;
      v12 = [v9 length];
      id v13 = objc_alloc((Class)NSAttributedString);
      v14 = +[NSString stringWithFormat:@"[%@]", v47];
      id v15 = [v13 initWithString:v14];
      [v9 appendAttributedString:v15];

      v16 = +[UIColor whiteColor];
      v17 = (char *)((unsigned char *)[v9 length] - v12);
      v18 = v12;
      v6 = v11;
      objc_msgSend(v9, "addAttribute:value:range:", NSForegroundColorAttributeName, v16, v18, v17);
    }
    if ([v45 length])
    {
      v19 = +[AXSettings sharedInstance];
      unsigned int v20 = [v19 localizationQACaptionShowLocalizedString];

      if (v20)
      {
        v43 = v6;
        if (v44) {
          +[UIColor greenColor];
        }
        else {
        v21 = +[UIColor yellowColor];
        }
        v22 = [v9 length];
        id v23 = [objc_alloc((Class)NSAttributedString) initWithString:v45];
        [v9 appendAttributedString:v23];

        objc_msgSend(v9, "addAttribute:value:range:", NSForegroundColorAttributeName, v21, v22, (unsigned char *)objc_msgSend(v9, "length") - v22);
        v6 = v43;
      }
    }
    if (v7)
    {
      v24 = +[AXSettings sharedInstance];
      unsigned int v25 = [v24 localizationQACaptionShowUSString];

      if (v25)
      {
        v26 = [v9 length];
        id v27 = objc_alloc((Class)NSAttributedString);
        +[NSString stringWithFormat:@" ¦ %@", v48];
        v29 = v28 = v6;
        id v30 = [v27 initWithString:v29];
        [v9 appendAttributedString:v30];

        v31 = +[UIColor cyanColor];
        objc_msgSend(v9, "addAttribute:value:range:", NSForegroundColorAttributeName, v31, v26, (unsigned char *)objc_msgSend(v9, "length") - v26);

        v6 = v28;
      }
    }
    if (v44)
    {
      v32 = [v9 length];
      id v33 = [objc_alloc((Class)NSAttributedString) initWithString:@" {Accessibility}"];
      [v9 appendAttributedString:v33];

      v34 = +[UIColor greenColor];
      objc_msgSend(v9, "addAttribute:value:range:", NSForegroundColorAttributeName, v34, v32, (unsigned char *)objc_msgSend(v9, "length") - v32);
    }
    if ([v6 length])
    {
      v35 = +[AXSettings sharedInstance];
      unsigned int v36 = [v35 localizationQACaptionShowFilePath];

      if (v36)
      {
        v37 = [v9 length];
        id v38 = objc_alloc((Class)NSAttributedString);
        v39 = +[NSString stringWithFormat:@"\n%@.strings:%@", v6, v46];
        id v40 = [v38 initWithString:v39];
        [v9 appendAttributedString:v40];

        v41 = +[UIColor whiteColor];
        objc_msgSend(v9, "addAttribute:value:range:", NSForegroundColorAttributeName, v41, v37, (unsigned char *)objc_msgSend(v9, "length") - v37);
      }
    }
    objc_msgSend(v9, "addAttribute:value:range:", NSParagraphStyleAttributeName, v10, 0, objc_msgSend(v9, "length"));
    v42 = [(AXLocalizationCaptionViewController *)self captionPanelText];
    [v42 setAttributedText:v9];

    [(AXLocalizationCaptionViewController *)self _updateNumeratorDenominator];
    [(AXLocalizationCaptionViewController *)self _processNextTextDisplayTimer];
  }
}

- (void)_updateNumeratorDenominator
{
  id v3 = +[NSString stringWithFormat:@"%d", (LODWORD(self->_displayedPackage) + 1)];
  [(UILabel *)self->_stringCountLabelNumerator setText:v3];

  int64_t v4 = +[NSString stringWithFormat:@"%d", [(NSArray *)self->_packages count]];
  [(UILabel *)self->_stringCountLabelDenominator setText:v4];

  [(UILabel *)self->_stringCountLabelNumerator sizeToFit];
  [(UILabel *)self->_stringCountLabelDenominator sizeToFit];
  [(UILabel *)self->_stringCountLabelNumerator frame];
  -[UILabel setFrame:](self->_stringCountLabelNumerator, "setFrame:", 5.0, 0.0);
  [(UILabel *)self->_stringCountLabelDenominator frame];
  stringCountLabelDenominator = self->_stringCountLabelDenominator;

  -[UILabel setFrame:](stringCountLabelDenominator, "setFrame:", 5.0, 14.0);
}

- (void)showString:(id)a3
{
  id v4 = a3;
  id v6 = +[NSMutableArray array];
  v5 = objc_opt_new();
  [v5 setText:v4];

  [v6 addObject:v5];
  [(AXLocalizationCaptionViewController *)self updateText:v6];
}

- (void)_processNextTextDisplayTimer
{
  if ([(NSArray *)self->_packages count] >= 2)
  {
    changeDisplayTimer = self->_changeDisplayTimer;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_4434;
    v4[3] = &unk_8348;
    v4[4] = self;
    [(AXDispatchTimer *)changeDisplayTimer afterDelay:v4 processBlock:2.0];
  }
}

- (void)updateText:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    objc_storeStrong((id *)&self->_packages, a3);
    [(AXDispatchTimer *)self->_changeDisplayTimer cancel];
    self->_unint64_t displayedPackage = 0;
    v5 = [(AXLocalizationCaptionViewController *)self view];
    [v5 setNeedsLayout];

    [(AXLocalizationCaptionViewController *)self _processNextTextDisplayTimer];
    [(AXLocalizationCaptionViewController *)self _updateTextDisplay];
  }
}

- (void)viewDidLayoutSubviews
{
  id v3 = [(AXLocalizationCaptionViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  v8 = [(AXLocalizationCaptionViewController *)self backgroundView];
  objc_msgSend(v8, "setFrame:", 0.0, v7 + -28.0, v5, 28.0);

  NSUInteger v9 = [(NSArray *)self->_packages count];
  BOOL v10 = v9 < 2;
  if (v9 >= 2) {
    double v11 = 10.0;
  }
  else {
    double v11 = 5.0;
  }
  [(UILabel *)self->_stringCountLabelNumerator setHidden:v10];
  [(UILabel *)self->_stringCountLabelDenominator setHidden:v10];
  v12 = [(AXLocalizationCaptionViewController *)self captionPanelText];
  [v12 frame];

  id v13 = [(AXLocalizationCaptionViewController *)self captionPanelText];
  objc_msgSend(v13, "setFrame:", v11, 0.0, v5 + -25.0, 28.0);

  -[AXLocCaptionPanelUILockButton setFrame:](self->_uiLockButton, "setFrame:", v5 + -25.0, 4.0, 20.0, 20.0);
  id v14 = [(AXLocalizationCaptionViewController *)self lineView];
  objc_msgSend(v14, "setFrame:", 0.0, v7 + -28.25, v5, 0.25);
}

- (AXLocalizationCaptionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXLocalizationCaptionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)captionPanelText
{
  return self->_captionPanelText;
}

- (void)setCaptionPanelText:(id)a3
{
}

- (UIView)lineView
{
  return self->_lineView;
}

- (void)setLineView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_lineView, 0);
  objc_storeStrong((id *)&self->_captionPanelText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stringCountLabelDenominator, 0);
  objc_storeStrong((id *)&self->_stringCountLabelNumerator, 0);
  objc_storeStrong((id *)&self->_changeDisplayTimer, 0);
  objc_storeStrong((id *)&self->_packages, 0);

  objc_storeStrong((id *)&self->_uiLockButton, 0);
}

@end