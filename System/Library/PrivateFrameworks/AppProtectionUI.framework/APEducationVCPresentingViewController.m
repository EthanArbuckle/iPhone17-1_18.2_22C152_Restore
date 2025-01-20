@interface APEducationVCPresentingViewController
- (APEducationVCPresentingViewController)initWithCoder:(id)a3;
- (APEducationVCPresentingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)presentEducationViewController:(id)a3;
@end

@implementation APEducationVCPresentingViewController

- (void)presentEducationViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_setModalInPresentation_, 1);
  -[APEducationVCPresentingViewController presentViewController:animated:completion:](v5, sel_presentViewController_animated_completion_, v4, objc_msgSend(v4, sel_wantsAnimatedPresentation), 0);
}

- (void)loadView
{
  id v3 = objc_allocWithZone(MEMORY[0x263F82E00]);
  id v4 = self;
  id v5 = objc_msgSend(v3, sel_init);
  [(APEducationVCPresentingViewController *)v4 setView:v5];
}

- (APEducationVCPresentingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_247E1A258();
    id v6 = a4;
    v7 = (void *)sub_247E1A248();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)APEducationVCPresentingViewController;
  v9 = [(APEducationVCPresentingViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (APEducationVCPresentingViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)APEducationVCPresentingViewController;
  return [(APEducationVCPresentingViewController *)&v4 initWithCoder:a3];
}

@end