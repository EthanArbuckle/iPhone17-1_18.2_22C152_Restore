@interface AKDevice
- (BOOL)isBuddyFinished;
@end

@implementation AKDevice

- (BOOL)isBuddyFinished
{
  if (byte_100272350) {
    return 1;
  }
  BOOL result = sub_100022A74() ^ 1;
  byte_100272350 = result;
  return result;
}

@end