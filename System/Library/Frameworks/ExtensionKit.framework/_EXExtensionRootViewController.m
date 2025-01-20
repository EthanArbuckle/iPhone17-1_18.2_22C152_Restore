@interface _EXExtensionRootViewController
- (UIViewController)contentViewController;
- (UIViewController)embededViewController;
- (void)embedViewController:(id)a3;
- (void)setEmbededViewController:(id)a3;
@end

@implementation _EXExtensionRootViewController

- (UIViewController)contentViewController
{
  return self->_embededViewController;
}

- (void)embedViewController:(id)a3
{
  v25[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(_EXExtensionRootViewController *)self embededViewController];
  if (v4)
  {
    v6 = [v4 view];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(_EXExtensionRootViewController *)self view];
    [v7 addSubview:v6];

    v8 = [(_EXExtensionRootViewController *)self view];
    v18 = (void *)MEMORY[0x263F08938];
    v23 = [v6 leftAnchor];
    v22 = [v8 leftAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v25[0] = v21;
    v20 = [v6 topAnchor];
    v19 = [v8 topAnchor];
    v17 = [v20 constraintEqualToAnchor:v19];
    v25[1] = v17;
    v16 = [v6 rightAnchor];
    v9 = [v8 rightAnchor];
    v10 = [v16 constraintEqualToAnchor:v9];
    v25[2] = v10;
    v11 = [v6 bottomAnchor];
    [v8 bottomAnchor];
    id v24 = v4;
    v13 = v12 = v5;
    v14 = [v11 constraintEqualToAnchor:v13];
    v25[3] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
    [v18 activateConstraints:v15];

    v5 = v12;
    id v4 = v24;

    [(_EXExtensionRootViewController *)self setEmbededViewController:v24];
    [(_EXExtensionRootViewController *)self addChildViewController:v24];
  }
  if (v5) {
    [v5 removeFromParentViewController];
  }
}

- (UIViewController)embededViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 976, 1);
}

- (void)setEmbededViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end