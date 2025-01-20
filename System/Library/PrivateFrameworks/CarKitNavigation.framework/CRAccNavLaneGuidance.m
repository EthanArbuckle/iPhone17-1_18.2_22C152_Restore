@interface CRAccNavLaneGuidance
+ (Class)ACCNavigationInfoClass;
- (ACCNavigationLaneGuidanceInfo)laneGuidance;
- (unsigned)index;
@end

@implementation CRAccNavLaneGuidance

+ (Class)ACCNavigationInfoClass
{
  return (Class)objc_opt_class();
}

- (ACCNavigationLaneGuidanceInfo)laneGuidance
{
  [(id)objc_opt_class() ACCNavigationInfoClass];
  id v3 = [(CRAccNavInfo *)self accNavInfo];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (ACCNavigationLaneGuidanceInfo *)v4;
}

- (unsigned)index
{
  return [(CRAccNavInfo *)self uint16ForInfoType:1];
}

@end