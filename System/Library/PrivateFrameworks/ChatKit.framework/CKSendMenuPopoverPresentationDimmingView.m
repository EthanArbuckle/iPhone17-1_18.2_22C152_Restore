@interface CKSendMenuPopoverPresentationDimmingView
- (BOOL)isActive;
- (CKSendMenuPopoverPresentationDimmingView)init;
- (CKSendMenuPopoverPresentationDimmingViewDelegate)delegate;
- (UITapGestureRecognizer)dismissGestureRecognizer;
- (void)_handleTap:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissGestureRecognizer:(id)a3;
@end

@implementation CKSendMenuPopoverPresentationDimmingView

- (CKSendMenuPopoverPresentationDimmingView)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKSendMenuPopoverPresentationDimmingView;
  v2 = -[CKSendMenuPopoverPresentationDimmingView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    v3 = [MEMORY[0x1E4F428B8] clearColor];
    [(CKSendMenuPopoverPresentationDimmingView *)v2 setBackgroundColor:v3];

    [(CKSendMenuPopoverPresentationDimmingView *)v2 setOpaque:0];
    v4 = [(CKSendMenuPopoverPresentationDimmingView *)v2 layer];
    [v4 setHitTestsAsOpaque:1];

    [(CKSendMenuPopoverPresentationDimmingView *)v2 setUserInteractionEnabled:1];
    v2->_active = 0;
  }
  return v2;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    v4 = +[CKUIBehavior sharedBehaviors];
    id v9 = v4;
    if (self->_active) {
      [v4 sendMenuPopoverDimmingViewActiveBackgroundColor];
    }
    else {
    v5 = [v4 sendMenuPopoverDimmingViewInactiveBackgroundColor];
    }
    [(CKSendMenuPopoverPresentationDimmingView *)self setBackgroundColor:v5];

    if (!self->_active
      || !self->_dismissGestureRecognizer
      && (objc_super v6 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleTap_], v7 = self->_dismissGestureRecognizer, self->_dismissGestureRecognizer = v6, v7, -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_dismissGestureRecognizer, "setNumberOfTapsRequired:", 1), -[CKSendMenuPopoverPresentationDimmingView addGestureRecognizer:](self, "addGestureRecognizer:", self->_dismissGestureRecognizer), !self->_active))
    {
      if (self->_dismissGestureRecognizer)
      {
        -[CKSendMenuPopoverPresentationDimmingView removeGestureRecognizer:](self, "removeGestureRecognizer:");
        dismissGestureRecognizer = self->_dismissGestureRecognizer;
        self->_dismissGestureRecognizer = 0;
      }
    }
  }
}

- (void)_handleTap:(id)a3
{
  if (self->_dismissGestureRecognizer == a3 && [a3 state] == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sendMenuPopoverPresentationDimmingViewDidReceiveTap:self];
  }
}

- (CKSendMenuPopoverPresentationDimmingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKSendMenuPopoverPresentationDimmingViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITapGestureRecognizer)dismissGestureRecognizer
{
  return self->_dismissGestureRecognizer;
}

- (void)setDismissGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end