@interface FBAEmptyViewController
- (UILabel)contentUnavailableLabel;
- (void)setContentUnavailableLabel:(id)a3;
- (void)viewDidLoad;
@end

@implementation FBAEmptyViewController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)FBAEmptyViewController;
  [(FBAEmptyViewController *)&v7 viewDidLoad];
  v3 = +[UIColor systemBackgroundColor];
  v4 = [(FBAEmptyViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = +[UIColor secondaryLabelColor];
  v6 = [(FBAEmptyViewController *)self contentUnavailableLabel];
  [v6 setTextColor:v5];
}

- (UILabel)contentUnavailableLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentUnavailableLabel);

  return (UILabel *)WeakRetained;
}

- (void)setContentUnavailableLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end