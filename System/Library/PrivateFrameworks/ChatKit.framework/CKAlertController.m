@interface CKAlertController
+ (CKAlertController)alertControllerWithTitle:(id)a3 message:(id)a4 preferredStyle:(int64_t)a5;
- (BOOL)allowsRotation;
- (BOOL)preserveModalPresentationStyle;
- (BOOL)shouldHidePresentingWindow;
- (BOOL)wantsWindowedPresentation;
- (CKAlertControllerDelegate)alertDelegate;
- (void)addAction:(id)a3;
- (void)presentFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setAlertDelegate:(id)a3;
- (void)setPreserveModalPresentationStyle:(BOOL)a3;
- (void)setShouldHidePresentingWindow:(BOOL)a3;
- (void)setWantsWindowedPresentation:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation CKAlertController

+ (CKAlertController)alertControllerWithTitle:(id)a3 message:(id)a4 preferredStyle:(int64_t)a5
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___CKAlertController;
  v5 = objc_msgSendSuper2(&v8, sel_alertControllerWithTitle_message_preferredStyle_, a3, a4, a5);
  if (objc_opt_isKindOfClass())
  {
    [v5 setWantsWindowedPresentation:1];
    [v5 setPreserveModalPresentationStyle:0];
    [v5 setShouldHidePresentingWindow:0];
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return (CKAlertController *)v6;
}

- (BOOL)allowsRotation
{
  return 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKAlertController;
  [(CKAlertController *)&v5 viewDidDisappear:a3];
  v4 = [(CKAlertController *)self alertDelegate];
  [v4 alertControllerViewDidDisappear:self];
}

- (void)addAction:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKAlertController;
  [(CKAlertController *)&v3 addAction:a3];
}

- (void)presentFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (BOOL)wantsWindowedPresentation
{
  return self->_wantsWindowedPresentation;
}

- (void)setWantsWindowedPresentation:(BOOL)a3
{
  self->_wantsWindowedPresentation = a3;
}

- (BOOL)preserveModalPresentationStyle
{
  return self->_preserveModalPresentationStyle;
}

- (void)setPreserveModalPresentationStyle:(BOOL)a3
{
  self->_preserveModalPresentationStyle = a3;
}

- (BOOL)shouldHidePresentingWindow
{
  return self->_shouldHidePresentingWindow;
}

- (void)setShouldHidePresentingWindow:(BOOL)a3
{
  self->_shouldHidePresentingWindow = a3;
}

- (CKAlertControllerDelegate)alertDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertDelegate);

  return (CKAlertControllerDelegate *)WeakRetained;
}

- (void)setAlertDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end