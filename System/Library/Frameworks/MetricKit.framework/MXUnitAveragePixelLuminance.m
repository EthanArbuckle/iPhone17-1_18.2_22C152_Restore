@interface MXUnitAveragePixelLuminance
+ (MXUnitAveragePixelLuminance)apl;
@end

@implementation MXUnitAveragePixelLuminance

+ (MXUnitAveragePixelLuminance)apl
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08C88]) initWithCoefficient:1.0];
  v3 = [(NSDimension *)[MXUnitAveragePixelLuminance alloc] initWithSymbol:@"apl" converter:v2];

  return v3;
}

@end