@interface MSMobileKeyBag
+ (BOOL)isAfterFirstUnlock;
@end

@implementation MSMobileKeyBag

+ (BOOL)isAfterFirstUnlock
{
  if (byte_100077BB0)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    int v2 = MKBDeviceUnlockedSinceBoot();
    if (v2 == 1) {
      byte_100077BB0 = 1;
    }
    else {
      LOBYTE(v2) = byte_100077BB0;
    }
  }
  return v2;
}

@end