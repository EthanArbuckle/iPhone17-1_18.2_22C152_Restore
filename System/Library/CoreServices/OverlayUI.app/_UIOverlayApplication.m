@interface _UIOverlayApplication
+ (BOOL)_isUIKitSystemProcess;
@end

@implementation _UIOverlayApplication

+ (BOOL)_isUIKitSystemProcess
{
  return 1;
}

@end