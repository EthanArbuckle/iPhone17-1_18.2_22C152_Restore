@interface CKMessageEntryViewContainerView
- (CKMessageEntryViewContainerViewDelegate)entryViewContainerViewDelegate;
- (NSLayoutConstraint)entryViewStuckToChatControllerBottomLayoutConstraint;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setEntryViewContainerViewDelegate:(id)a3;
- (void)setEntryViewStuckToChatControllerBottomLayoutConstraint:(id)a3;
@end

@implementation CKMessageEntryViewContainerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CKMessageEntryViewContainerView;
  -[CKMessageEntryViewContainerView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CKMessageEntryViewContainerView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }

  return v5;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryViewContainerView;
  [(CKMessageEntryViewContainerView *)&v4 layoutSubviews];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_entryViewContainerViewDelegate);
  [WeakRetained entryViewContainerViewDidLayoutSubviews:self];
}

- (CKMessageEntryViewContainerViewDelegate)entryViewContainerViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_entryViewContainerViewDelegate);

  return (CKMessageEntryViewContainerViewDelegate *)WeakRetained;
}

- (void)setEntryViewContainerViewDelegate:(id)a3
{
}

- (NSLayoutConstraint)entryViewStuckToChatControllerBottomLayoutConstraint
{
  return self->_entryViewStuckToChatControllerBottomLayoutConstraint;
}

- (void)setEntryViewStuckToChatControllerBottomLayoutConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryViewStuckToChatControllerBottomLayoutConstraint, 0);

  objc_destroyWeak((id *)&self->_entryViewContainerViewDelegate);
}

@end