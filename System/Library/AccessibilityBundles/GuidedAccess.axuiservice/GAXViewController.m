@interface GAXViewController
- (BOOL)_canShowWhileLocked;
- (GAXViewController)initWithCoder:(id)a3;
- (GAXViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)setView:(id)a3;
- (void)viewDidUnload;
- (void)viewWillUnload;
@end

@implementation GAXViewController

- (GAXViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GAXViewController;
  v4 = [(GAXViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(GAXViewController *)v4 commonInit];
  }
  return v5;
}

- (GAXViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GAXViewController;
  v3 = [(GAXViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(GAXViewController *)v3 commonInit];
  }
  return v4;
}

- (void)dealloc
{
  [(GAXViewController *)self releaseOutlets];
  v3.receiver = self;
  v3.super_class = (Class)GAXViewController;
  [(GAXViewController *)&v3 dealloc];
}

- (void)setView:(id)a3
{
  id v4 = a3;
  if (![(GAXViewController *)self isViewLoaded])
  {
    objc_super v6 = 0;
LABEL_6:
    v7.receiver = self;
    v7.super_class = (Class)GAXViewController;
    [(GAXViewController *)&v7 setView:v4];
    goto LABEL_7;
  }
  uint64_t v5 = [(GAXViewController *)self view];
  objc_super v6 = (void *)v5;
  if (v4 || !v5) {
    goto LABEL_6;
  }
  [(GAXViewController *)self viewWillUnload];
  v7.receiver = self;
  v7.super_class = (Class)GAXViewController;
  [(GAXViewController *)&v7 setView:0];
  [(GAXViewController *)self viewDidUnload];
LABEL_7:
}

- (void)didReceiveMemoryWarning
{
  v5.receiver = self;
  v5.super_class = (Class)GAXViewController;
  [(GAXViewController *)&v5 didReceiveMemoryWarning];
  if ([(GAXViewController *)self isViewLoaded])
  {
    objc_super v3 = [(GAXViewController *)self view];
    id v4 = [v3 window];

    if (!v4) {
      [(GAXViewController *)self setView:0];
    }
  }
}

- (void)viewWillUnload
{
  v3.receiver = self;
  v3.super_class = (Class)GAXViewController;
  [(GAXViewController *)&v3 viewWillUnload];
  [(GAXViewController *)self releaseOutlets];
}

- (void)viewDidUnload
{
  v2.receiver = self;
  v2.super_class = (Class)GAXViewController;
  [(GAXViewController *)&v2 viewDidUnload];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end