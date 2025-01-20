@interface TVRemoteApplication
- (BOOL)_supportsAlwaysOnDisplay;
@end

@implementation TVRemoteApplication

- (BOOL)_supportsAlwaysOnDisplay
{
  return 1;
}

@end