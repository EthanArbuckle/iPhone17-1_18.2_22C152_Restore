@interface FBAPowerLogTextViewController
- (NSString)contents;
- (UITextView)textView;
- (void)displayText:(id)a3;
- (void)setContents:(id)a3;
- (void)setTextView:(id)a3;
- (void)viewDidLoad;
@end

@implementation FBAPowerLogTextViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)FBAPowerLogTextViewController;
  [(FBAPowerLogTextViewController *)&v5 viewDidLoad];
  v3 = [(FBAPowerLogTextViewController *)self contents];
  v4 = [(FBAPowerLogTextViewController *)self textView];
  [v4 setText:v3];
}

- (void)displayText:(id)a3
{
  [(FBAPowerLogTextViewController *)self setContents:a3];
  v4 = [(FBAPowerLogTextViewController *)self textView];

  if (v4)
  {
    id v6 = [(FBAPowerLogTextViewController *)self contents];
    objc_super v5 = [(FBAPowerLogTextViewController *)self textView];
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
  return (NSString *)objc_getProperty(self, a2, 16, 1);
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