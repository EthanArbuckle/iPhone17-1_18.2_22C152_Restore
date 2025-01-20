@interface CPSInformationScrollView
- (CPSInformationScrollViewDelegate)scrollviewDelegate;
- (NSMutableArray)focusWaypoints;
- (void)setContentSize:(CGSize)a3;
- (void)setFocusWaypoints:(id)a3;
- (void)setScrollviewDelegate:(id)a3;
@end

@implementation CPSInformationScrollView

- (void)setContentSize:(CGSize)a3
{
  CGSize v15 = a3;
  v14 = self;
  v13[3] = (id)a2;
  [(CPSInformationScrollView *)self contentSize];
  v13[1] = v3;
  v13[2] = v4;
  if (!__CGSizeEqualToSize_0(v15.width, v15.height, *(double *)&v3, *(double *)&v4))
  {
    queue = MEMORY[0x263EF83A0];
    block = &v8;
    uint64_t v8 = MEMORY[0x263EF8330];
    int v9 = -1073741824;
    int v10 = 0;
    v11 = __43__CPSInformationScrollView_setContentSize___block_invoke;
    v12 = &unk_2648A3BE0;
    v13[0] = v14;
    dispatch_async(queue, &v8);

    objc_storeStrong(v13, 0);
  }
  v7.receiver = v14;
  v7.super_class = (Class)CPSInformationScrollView;
  -[CPSInformationScrollView setContentSize:](&v7, sel_setContentSize_, v15.width, v15.height, block);
}

void __43__CPSInformationScrollView_setContentSize___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) scrollviewDelegate];
  [v2 scrollViewContentSizeChanged:*(void *)(a1 + 32)];
}

- (CPSInformationScrollViewDelegate)scrollviewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollviewDelegate);

  return (CPSInformationScrollViewDelegate *)WeakRetained;
}

- (void)setScrollviewDelegate:(id)a3
{
}

- (NSMutableArray)focusWaypoints
{
  return self->_focusWaypoints;
}

- (void)setFocusWaypoints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end