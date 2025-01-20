@interface BYDeviceForTest
- (BOOL)hasSolidStateHomeButton;
- (BOOL)supportsTrueTone;
- (BYDeviceForTest)init;
@end

@implementation BYDeviceForTest

- (BYDeviceForTest)init
{
  SEL v7 = a2;
  id location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BYDeviceForTest;
  id location = [(BYDevice *)&v6 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    BOOL v2 = MGGetSInt32Answer() == 1;
    *((unsigned char *)location + 64) = v2;
    uint64_t v5 = MGGetProductType();
    *((unsigned char *)location + 65) = v5 == 3242623367
                             || v5 == 2311900306
                             || v5 == 502329937
                             || v5 == 2270970153
                             || v5 == 3402870384
                             || v5 == 896202454
                             || [location size] == (id)3
                             || [location size] == (id)6
                             || [location size] == (id)5
                             || [location size] == (id)4;
  }
  v3 = (BYDeviceForTest *)location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (BOOL)hasSolidStateHomeButton
{
  return self->_hasSolidStateHomeButton;
}

- (BOOL)supportsTrueTone
{
  return self->_supportsTrueTone;
}

@end