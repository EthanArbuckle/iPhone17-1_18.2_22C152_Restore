@interface VKMapView(MapKitAdditions)
- (uint64_t)_mapkit_configureFromDefaults;
- (void)_mapkit_configureLabelSizesForContentSizeCategory:()MapKitAdditions;
@end

@implementation VKMapView(MapKitAdditions)

- (uint64_t)_mapkit_configureFromDefaults
{
  uint64_t BOOL = GEOConfigGetBOOL();

  return [a1 setLocalizeLabels:BOOL];
}

- (void)_mapkit_configureLabelSizesForContentSizeCategory:()MapKitAdditions
{
  id v4 = a3;
  [a1 setLabelScaleFactor:labelScaleFactorForContentSizeCategory(v4)];
  id v6 = v4;
  if (([v6 isEqualToString:*MEMORY[0x1E4F437A0]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F43798]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F43790]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F43780]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F43778]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F43770]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F43768]] & 1) != 0)
  {
    uint64_t v5 = 5;
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4F43760]])
  {
    uint64_t v5 = 5;
  }
  else
  {
    uint64_t v5 = 4;
  }

  [a1 setShieldSize:v5];
}

@end