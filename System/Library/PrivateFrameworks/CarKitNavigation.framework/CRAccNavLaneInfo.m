@interface CRAccNavLaneInfo
+ (Class)ACCNavigationInfoClass;
- (ACCNavigationLaneGuidanceLaneInfo)laneInfo;
@end

@implementation CRAccNavLaneInfo

+ (Class)ACCNavigationInfoClass
{
  return (Class)objc_opt_class();
}

- (ACCNavigationLaneGuidanceLaneInfo)laneInfo
{
  [(id)objc_opt_class() ACCNavigationInfoClass];
  id v3 = [(CRAccNavInfo *)self accNavInfo];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (ACCNavigationLaneGuidanceLaneInfo *)v4;
}

@end