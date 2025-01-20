@interface AMSUICommonCollectionViewHandler
- (AMSUICommonCollectionView)collectionView;
- (AMSUICommonCollectionViewDelegate)delegate;
- (AMSUICommonCollectionViewHandler)initWithCollectionView:(id)a3;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AMSUICommonCollectionViewHandler

- (AMSUICommonCollectionViewHandler)initWithCollectionView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AMSUICommonCollectionViewHandler;
  v5 = [(AMSUICommonCollectionViewHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_collectionView, v4);
  }

  return v6;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v10 = a5;
  v6 = [(AMSUICommonCollectionViewHandler *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    objc_super v8 = [(AMSUICommonCollectionViewHandler *)self delegate];
    v9 = [(AMSUICommonCollectionViewHandler *)self collectionView];
    [v8 collectionView:v9 didEndDisplayingItemAtIndexPath:v10];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v9 = a4;
  v5 = [(AMSUICommonCollectionViewHandler *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(AMSUICommonCollectionViewHandler *)self delegate];
    objc_super v8 = [(AMSUICommonCollectionViewHandler *)self collectionView];
    [v7 collectionView:v8 didSelectItemAtIndexPath:v9];
  }
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  char v6 = [(AMSUICommonCollectionViewHandler *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    objc_super v8 = [(AMSUICommonCollectionViewHandler *)self delegate];
    id v9 = [(AMSUICommonCollectionViewHandler *)self collectionView];
    char v10 = [v8 collectionView:v9 shouldHighlightItemAtIndexPath:v5];
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v8 = a3;
  if (([v8 isDecelerating] & 1) != 0
    || ([v8 isDragging] & 1) != 0
    || [v8 isTracking])
  {
    id v4 = [(AMSUICommonCollectionViewHandler *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      char v6 = [(AMSUICommonCollectionViewHandler *)self delegate];
      char v7 = [(AMSUICommonCollectionViewHandler *)self collectionView];
      [v6 collectionViewDidScroll:v7];
    }
  }
}

- (AMSUICommonCollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (AMSUICommonCollectionView *)WeakRetained;
}

- (AMSUICommonCollectionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUICommonCollectionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_collectionView);
}

@end