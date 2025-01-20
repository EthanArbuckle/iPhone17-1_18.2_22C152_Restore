@interface FBATextViewController
- (NSString)text;
- (UITextView)textView;
- (void)didReceiveMemoryWarning;
- (void)setText:(id)a3;
- (void)setTextView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FBATextViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)FBATextViewController;
  [(FBATextViewController *)&v2 viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)FBATextViewController;
  [(FBATextViewController *)&v2 didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FBATextViewController;
  [(FBATextViewController *)&v6 viewWillAppear:a3];
  v4 = [(FBATextViewController *)self text];
  v5 = [(FBATextViewController *)self textView];
  [v5 setText:v4];
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (UITextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);

  return (UITextView *)WeakRetained;
}

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textView);

  objc_storeStrong((id *)&self->_text, 0);
}

@end