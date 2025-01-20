@interface CKActionMenuController
- (BOOL)isActionMenuVisible;
- (BOOL)shouldDismissOnTap;
- (CGRect)convertActionMenuFrameToView:(id)a3;
- (CKActionMenuController)initWithActionMenuItems:(id)a3 defaultActionIndex:(unint64_t)a4 blurEffectStyle:(int64_t)a5;
- (CKActionMenuControllerDelegate)delegate;
- (CKActionMenuView)actionMenuView;
- (NSArray)actionMenuItems;
- (unint64_t)defaultActionIndex;
- (void)dealloc;
- (void)dismissActionMenuAnimated:(BOOL)a3;
- (void)presentActionMenuFromPoint:(CGPoint)a3 inView:(id)a4 animated:(BOOL)a5;
- (void)setActionMenuItems:(id)a3 defaultActionIndex:(unint64_t)a4 animated:(BOOL)a5;
- (void)setActionMenuView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShouldDismissOnTap:(BOOL)a3;
@end

@implementation CKActionMenuController

- (void)dealloc
{
  [(CKActionMenuView *)self->_actionMenuView setActionMenuController:0];
  v3.receiver = self;
  v3.super_class = (Class)CKActionMenuController;
  [(CKActionMenuController *)&v3 dealloc];
}

- (CKActionMenuController)initWithActionMenuItems:(id)a3 defaultActionIndex:(unint64_t)a4 blurEffectStyle:(int64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKActionMenuController;
  v9 = [(CKActionMenuController *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->_shouldDismissOnTap = 1;
    v11 = [[CKActionMenuView alloc] initWithActionMenuItems:v8 defaultActionIndex:a4 blurEffectStyle:a5];
    [(CKActionMenuController *)v10 setActionMenuView:v11];
    [(CKActionMenuView *)v11 setActionMenuController:v10];
  }
  return v10;
}

- (void)setActionMenuItems:(id)a3 defaultActionIndex:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [(CKActionMenuController *)self actionMenuView];
  [v9 setActionMenuItems:v8 defaultActionIndex:a4 animated:v5];
}

- (NSArray)actionMenuItems
{
  v2 = [(CKActionMenuController *)self actionMenuView];
  objc_super v3 = [v2 actionMenuItems];

  return (NSArray *)v3;
}

- (BOOL)isActionMenuVisible
{
  objc_super v3 = +[CKActionMenuWindow sharedInstance];
  v4 = [v3 actionMenuView];
  BOOL v5 = [(CKActionMenuController *)self actionMenuView];
  LOBYTE(self) = v4 == v5;

  return (char)self;
}

- (void)presentActionMenuFromPoint:(CGPoint)a3 inView:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  id v13 = a4;
  id v9 = +[CKActionMenuWindow sharedInstance];
  if (v13)
  {
    v10 = [(CKActionMenuController *)self actionMenuView];
    objc_msgSend(v9, "setShouldDismissOnTap:", -[CKActionMenuController shouldDismissOnTap](self, "shouldDismissOnTap"));
    v11 = [v13 window];
    v12 = [v11 windowScene];
    [v9 setWindowScene:v12];

    objc_msgSend(v9, "presentActionMenuView:fromPoint:inView:animated:", v10, v13, v5, x, y);
  }
}

- (void)dismissActionMenuAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKActionMenuController *)self isActionMenuVisible])
  {
    id v4 = +[CKActionMenuWindow sharedInstance];
    [v4 dismissActionMenuViewAnimated:v3];
  }
}

- (CGRect)convertActionMenuFrameToView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CKActionMenuController *)self actionMenuView];
  objc_msgSend(v5, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  objc_msgSend(v5, "convertRect:toView:", v4, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v6, v7);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (unint64_t)defaultActionIndex
{
  return self->_defaultActionIndex;
}

- (CKActionMenuControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKActionMenuControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldDismissOnTap
{
  return self->_shouldDismissOnTap;
}

- (void)setShouldDismissOnTap:(BOOL)a3
{
  self->_shouldDismissOnTap = a3;
}

- (CKActionMenuView)actionMenuView
{
  return self->_actionMenuView;
}

- (void)setActionMenuView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionMenuView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end