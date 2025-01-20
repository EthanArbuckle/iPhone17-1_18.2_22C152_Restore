@interface CAFUIStatusTableView
- (CAFUIStatusTableView)initWithFrame:(CGRect)a3;
- (void)update;
@end

@implementation CAFUIStatusTableView

- (CAFUIStatusTableView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CAFUIStatusTableView;
  return -[CAFUIStatusTableView initWithFrame:style:](&v4, sel_initWithFrame_style_, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)update
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__CAFUIStatusTableView_update__block_invoke;
  block[3] = &unk_26525C5C8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __30__CAFUIStatusTableView_update__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

@end