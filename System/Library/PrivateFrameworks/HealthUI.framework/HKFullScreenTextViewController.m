@interface HKFullScreenTextViewController
- (NSString)detailText;
- (UITextView)textView;
- (id)description;
- (void)createTextView;
- (void)setDetailText:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HKFullScreenTextViewController

- (UITextView)textView
{
  v4 = [(HKFullScreenTextViewController *)self view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKFullScreenTextViewController.m", 20, @"Yea, that's not going to work :(");
  }
  return (UITextView *)[(HKFullScreenTextViewController *)self view];
}

- (void)setDetailText:(id)a3
{
  objc_storeStrong((id *)&self->_detailText, a3);
  id v5 = a3;
  id v6 = [(HKFullScreenTextViewController *)self textView];
  [v6 setText:v5];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HKFullScreenTextViewController;
  [(HKFullScreenTextViewController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v4 = [(HKFullScreenTextViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(HKFullScreenTextViewController *)self createTextView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKFullScreenTextViewController;
  [(HKFullScreenTextViewController *)&v8 viewWillAppear:a3];
  v4 = [(HKFullScreenTextViewController *)self textView];
  [v4 contentInset];
  double v6 = -v5;
  v7 = [(HKFullScreenTextViewController *)self textView];
  objc_msgSend(v7, "setContentOffset:", 0.0, v6);
}

- (void)createTextView
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1DD8]);
  [(HKFullScreenTextViewController *)self setView:v4];
  v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v4 setFont:v3];

  [v4 setEditable:0];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = [(HKFullScreenTextViewController *)self detailText];
  v7 = [v3 stringWithFormat:@"<%@:%p %@>", v5, self, v6];

  return v7;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void).cxx_destruct
{
}

@end