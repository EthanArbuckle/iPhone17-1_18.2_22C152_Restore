@interface _CDPUIUIAlertController
- (id)image;
@end

@implementation _CDPUIUIAlertController

- (id)image
{
  v2 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/CoreCDPUI.framework"];
  v3 = [MEMORY[0x263F827E8] imageNamed:@"appleAccountServiceIcon" inBundle:v2];

  return v3;
}

@end