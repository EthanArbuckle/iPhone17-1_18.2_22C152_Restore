@interface UITraitCollection(CRSUITraits)
+ (id)crsui_traitCollectionWithMapStyle:()CRSUITraits;
- (uint64_t)crsui_mapStyle;
@end

@implementation UITraitCollection(CRSUITraits)

+ (id)crsui_traitCollectionWithMapStyle:()CRSUITraits
{
  v2 = objc_msgSend(NSNumber, "numberWithInteger:");
  v3 = [a1 _traitCollectionWithValue:v2 forTraitNamed:@"CRSUIMapStyleTraitName"];

  return v3;
}

- (uint64_t)crsui_mapStyle
{
  v1 = [a1 _valueForTraitNamed:@"CRSUIMapStyleTraitName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 integerValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

@end