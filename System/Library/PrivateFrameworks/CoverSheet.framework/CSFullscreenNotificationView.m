@interface CSFullscreenNotificationView
- (CSFullscreenNotificationView)initWithFrame:(CGRect)a3;
@end

@implementation CSFullscreenNotificationView

- (CSFullscreenNotificationView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSFullscreenNotificationView;
  return -[CSModalView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end