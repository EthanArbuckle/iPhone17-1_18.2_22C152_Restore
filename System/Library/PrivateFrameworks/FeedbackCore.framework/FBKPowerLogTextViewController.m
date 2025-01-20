@interface FBKPowerLogTextViewController
- (NSString)contents;
- (UITextView)textView;
- (void)displayText:(id)a3;
- (void)setContents:(id)a3;
- (void)setTextView:(id)a3;
- (void)viewDidLoad;
@end

@implementation FBKPowerLogTextViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)FBKPowerLogTextViewController;
  [(FBKPowerLogTextViewController *)&v5 viewDidLoad];
  v3 = [(FBKPowerLogTextViewController *)self contents];
  v4 = [(FBKPowerLogTextViewController *)self textView];
  [v4 setText:v3];
}

- (void)displayText:(id)a3
{
  [(FBKPowerLogTextViewController *)self setContents:a3];
  v4 = [(FBKPowerLogTextViewController *)self textView];

  if (v4)
  {
    id v6 = [(FBKPowerLogTextViewController *)self contents];
    objc_super v5 = [(FBKPowerLogTextViewController *)self textView];
    [v5 setText:v6];
  }
}

- (UITextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);

  return (UITextView *)WeakRetained;
}

- (void)setTextView:(id)a3
{
}

- (NSString)contents
{
  return (NSString *)objc_getProperty(self, a2, 984, 1);
}

- (void)setContents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);

  objc_destroyWeak((id *)&self->_textView);
}

@end