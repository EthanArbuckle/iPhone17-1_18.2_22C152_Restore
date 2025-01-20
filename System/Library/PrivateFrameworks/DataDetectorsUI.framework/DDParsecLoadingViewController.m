@interface DDParsecLoadingViewController
- (void)loadView;
@end

@implementation DDParsecLoadingViewController

- (void)loadView
{
  id v12 = (id)objc_opt_new();
  v3 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  [v12 setBackgroundColor:v3];

  v4 = [v12 layer];
  [v4 setCornerRadius:14.0];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v12 insertSubview:v5 atIndex:2];
  v6 = [v5 centerXAnchor];
  v7 = [v12 centerXAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  [v8 setActive:1];

  v9 = [v5 centerYAnchor];
  v10 = [v12 centerYAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  [v5 startAnimating];
  [(DDParsecLoadingViewController *)self setView:v12];
}

@end