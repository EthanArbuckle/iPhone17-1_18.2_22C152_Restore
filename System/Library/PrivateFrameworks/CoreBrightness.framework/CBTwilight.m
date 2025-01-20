@interface CBTwilight
- (CBTwilight)initWithParams:(id)a3;
@end

@implementation CBTwilight

- (CBTwilight)initWithParams:(id)a3
{
  v4 = objc_alloc_init(CBTwilightPolicy);
  v7 = [(CBChromaticCorrection *)self initWithBacklightParams:a3 andPolicy:v4];

  return v7;
}

@end