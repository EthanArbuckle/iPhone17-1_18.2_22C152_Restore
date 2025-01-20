@interface PKPaletteTapToRadarRegularExecution
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)_dismiss;
- (void)run;
@end

@implementation PKPaletteTapToRadarRegularExecution

- (void)run
{
  v23.receiver = self;
  v23.super_class = (Class)PKPaletteTapToRadarRegularExecution;
  [(PKPaletteTapToRadarCommandExecution *)&v23 run];
  v3 = [(PKPaletteTapToRadarCommandExecution *)self configuration];
  v4 = [v3 debugSharpenerLog];

  v5 = [[PKTextInputDebugRadarViewController alloc] initWithSharpenerLog:v4];
  [(PKTextInputDebugRadarViewController *)v5 setDelegate:self];
  id v6 = objc_alloc(MEMORY[0x1E4FB1F48]);
  v7 = [(PKPaletteTapToRadarCommandExecution *)self configuration];
  v8 = [v7 presentationViewController];
  v9 = [v8 view];
  v10 = [v9 window];
  v11 = [v10 windowScene];
  v12 = (UIWindow *)[v6 initWithWindowScene:v11];
  window = self->_window;
  self->_window = v12;

  id v14 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  [(UIWindow *)self->_window setRootViewController:v14];

  v15 = [(PKPaletteTapToRadarCommandExecution *)self configuration];
  v16 = [v15 presentationViewController];
  v17 = [v16 view];
  v18 = [v17 window];
  [v18 windowLevel];
  [(UIWindow *)self->_window setWindowLevel:v19 + -0.1];

  [(UIWindow *)self->_window makeKeyAndVisible];
  v20 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
  [v20 setModalPresentationStyle:2];
  v21 = [v20 presentationController];
  [v21 setDelegate:self];

  v22 = [(UIWindow *)self->_window rootViewController];
  [v22 presentViewController:v20 animated:1 completion:0];
}

- (void)_dismiss
{
  [(UIWindow *)self->_window setHidden:1];
  window = self->_window;
  self->_window = 0;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return 2 * (objc_msgSend(a4, "horizontalSizeClass", a3) != 1);
}

- (void).cxx_destruct
{
}

@end