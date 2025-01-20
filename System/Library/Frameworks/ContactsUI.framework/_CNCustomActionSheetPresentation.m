@interface _CNCustomActionSheetPresentation
- (CGRect)sourceRect;
- (UIView)sourceView;
- (UIViewController)viewController;
- (id)dismissHandler;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (unint64_t)permittedArrowDirections;
- (void)actionSheetPresentationControllerDidDismissActionSheet:(id)a3;
- (void)prepareForPresentationOfController:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setPermittedArrowDirections:(unint64_t)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setSourceView:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation _CNCustomActionSheetPresentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_dismissHandler, 0);

  objc_storeStrong((id *)&self->_sourceView, 0);
}

- (void)setPermittedArrowDirections:(unint64_t)a3
{
  self->_permittedArrowDirections = a3;
}

- (unint64_t)permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (void)setViewController:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setDismissHandler:(id)a3
{
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceView:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)actionSheetPresentationControllerDidDismissActionSheet:(id)a3
{
  v3 = [(_CNCustomActionSheetPresentation *)self dismissHandler];
  v3[2]();
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  v7 = (objc_class *)MEMORY[0x1E4FB1FA0];
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[[v7 alloc] initWithPresentedViewController:v9 presentingViewController:v8];

  [v10 setActionSheetDelegate:self];
  [v10 _setShouldUseCompactPresentationControllerWhenPresentedInSheet:1];
  v11 = CNContactsUIBundle();
  v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  [v10 setDismissActionTitle:v12];

  [(_CNCustomActionSheetPresentation *)self sourceRect];
  objc_msgSend(v10, "setSourceRect:");
  v13 = [(_CNCustomActionSheetPresentation *)self sourceView];
  [v10 setSourceView:v13];

  objc_msgSend(v10, "setPermittedArrowDirections:", -[_CNCustomActionSheetPresentation permittedArrowDirections](self, "permittedArrowDirections"));

  return v10;
}

- (void)prepareForPresentationOfController:(id)a3
{
  id v4 = a3;
  [v4 setModalPresentationStyle:4];
  [v4 setTransitioningDelegate:self];
  [(_CNCustomActionSheetPresentation *)self setViewController:v4];
}

@end