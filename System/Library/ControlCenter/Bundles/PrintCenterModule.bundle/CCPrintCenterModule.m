@interface CCPrintCenterModule
- (id)_launchOptions;
- (void)handleTapWithTouchType:(int64_t)a3;
@end

@implementation CCPrintCenterModule

- (id)_launchOptions
{
  return &off_4178;
}

- (void)handleTapWithTouchType:(int64_t)a3
{
  v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3C50;
  block[3] = &unk_40A8;
  block[4] = self;
  dispatch_async(v4, block);
}

@end