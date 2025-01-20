@interface AMSUICommonCollectionView
- (AMSUICommonCollectionView)init;
- (AMSUICommonCollectionViewDelegate)commonDelegate;
- (AMSUICommonCollectionViewHandler)handler;
- (void)setCommonDelegate:(id)a3;
@end

@implementation AMSUICommonCollectionView

- (AMSUICommonCollectionView)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F82570]);
  v4 = -[AMSUICommonCollectionView initWithFrame:collectionViewLayout:](self, "initWithFrame:collectionViewLayout:", v3, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  if (v4)
  {
    [(AMSUICommonCollectionView *)v4 setAlwaysBounceVertical:1];
    v5 = objc_msgSend(MEMORY[0x263F825C8], "ams_clear");
    [(AMSUICommonCollectionView *)v4 setBackgroundColor:v5];

    v6 = [[AMSUICommonCollectionViewHandler alloc] initWithCollectionView:v4];
    handler = v4->_handler;
    v4->_handler = v6;

    v8 = v4->_handler;
    v10.receiver = v4;
    v10.super_class = (Class)AMSUICommonCollectionView;
    [(AMSUICommonCollectionView *)&v10 setDelegate:v8];
  }
  return v4;
}

- (AMSUICommonCollectionViewDelegate)commonDelegate
{
  v2 = [(AMSUICommonCollectionView *)self handler];
  id v3 = [v2 delegate];

  return (AMSUICommonCollectionViewDelegate *)v3;
}

- (void)setCommonDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUICommonCollectionView *)self handler];
  [v5 setDelegate:v4];
}

- (AMSUICommonCollectionViewHandler)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
}

@end