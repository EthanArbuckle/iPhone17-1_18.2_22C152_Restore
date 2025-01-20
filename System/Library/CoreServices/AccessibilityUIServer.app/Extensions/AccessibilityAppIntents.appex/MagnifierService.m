@interface MagnifierService
- (void)showDetectionUI;
@end

@implementation MagnifierService

- (void)showDetectionUI
{
  swift_retain();
  sub_100003084((void (*)(void))&MAGService.presentDetectionUI());

  swift_release();
}

@end