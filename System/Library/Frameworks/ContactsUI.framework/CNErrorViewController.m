@interface CNErrorViewController
- (CNErrorViewController)initWithMessage:(id)a3;
- (NSString)errorMessage;
- (UILabel)label;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)viewDidLoad;
@end

@implementation CNErrorViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_errorMessage, 0);
}

- (UILabel)label
{
  return self->_label;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)viewDidLoad
{
  v36.receiver = self;
  v36.super_class = (Class)CNErrorViewController;
  [(CNErrorViewController *)&v36 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  v4 = [(CNErrorViewController *)self view];
  [v4 setBackgroundColor:v3];

  label = self->_label;
  v6 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [(UILabel *)label setTextColor:v6];

  v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(CNErrorViewController *)self view];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  v17 = [(CNErrorViewController *)self view];
  [v17 bounds];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v37.origin.x = v19;
  v37.origin.y = v21;
  v37.size.width = v23;
  v37.size.height = v25;
  v26 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), CGRectGetWidth(v37) + -30.0, 100.0);
  v27 = self->_label;
  self->_label = v26;

  v28 = self->_label;
  v38.origin.x = v19;
  v38.origin.y = v21;
  v38.size.width = v23;
  v38.size.height = v25;
  double MidX = CGRectGetMidX(v38);
  v39.origin.x = v19;
  v39.origin.y = v21;
  v39.size.width = v23;
  v39.size.height = v25;
  -[UILabel setCenter:](v28, "setCenter:", MidX, CGRectGetMidY(v39));
  v30 = self->_label;
  v31 = [(CNErrorViewController *)self errorMessage];
  [(UILabel *)v30 setText:v31];

  v32 = self->_label;
  v33 = (void *)MEMORY[0x1E4FB08E0];
  [MEMORY[0x1E4FB08E0] smallSystemFontSize];
  v34 = objc_msgSend(v33, "systemFontOfSize:");
  [(UILabel *)v32 setFont:v34];

  [(UILabel *)self->_label setTextAlignment:1];
  [(UILabel *)self->_label setAutoresizingMask:45];
  v35 = [(CNErrorViewController *)self view];
  [v35 addSubview:self->_label];
}

- (CNErrorViewController)initWithMessage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNErrorViewController;
  v6 = [(CNErrorViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_errorMessage, a3);
  }

  return v7;
}

@end