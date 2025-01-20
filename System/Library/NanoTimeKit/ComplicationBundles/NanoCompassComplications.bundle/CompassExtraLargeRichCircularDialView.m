@interface CompassExtraLargeRichCircularDialView
- (id)_needleNorthImageName;
- (id)_needleShadowImageName;
- (id)_needleSouthImageName;
- (id)_ticksImageName;
- (int64_t)_supportedFamily;
@end

@implementation CompassExtraLargeRichCircularDialView

- (int64_t)_supportedFamily
{
  return 12;
}

- (id)_ticksImageName
{
  if (objc_msgSend_supportsGossamer(self, a2, v2, v3)) {
    return @"Compass/XL/Ticks";
  }
  else {
    return @"Compass/Legacy/XL/Ticks";
  }
}

- (id)_needleNorthImageName
{
  if (objc_msgSend_supportsGossamer(self, a2, v2, v3)) {
    return @"Compass/XL/Needle North";
  }
  else {
    return @"Compass/Legacy/XL/Needle North";
  }
}

- (id)_needleSouthImageName
{
  if (objc_msgSend_supportsGossamer(self, a2, v2, v3)) {
    return 0;
  }
  else {
    return @"Compass/Legacy/XL/Needle South";
  }
}

- (id)_needleShadowImageName
{
  return @"Compass/Legacy/XL/Needle Shadow";
}

@end