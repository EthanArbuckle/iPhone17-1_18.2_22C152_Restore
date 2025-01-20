@interface _UIOSubterraneanViewController
- (BOOL)_canShowWhileLocked;
- (void)loadView;
@end

@implementation _UIOSubterraneanViewController

- (void)loadView
{
  v3 = -[_UIOSubterraneanSingletonTouchView initWithFrame:]([_UIOSubterraneanSingletonTouchView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(_UIOSubterraneanViewController *)self setView:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end