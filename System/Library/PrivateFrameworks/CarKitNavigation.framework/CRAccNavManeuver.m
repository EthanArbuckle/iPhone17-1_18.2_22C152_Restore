@interface CRAccNavManeuver
+ (Class)ACCNavigationInfoClass;
- (ACCNavigationManeuverUpdateInfo)maneuver;
- (unsigned)index;
- (unsigned)linkedLaneGuidanceIndex;
@end

@implementation CRAccNavManeuver

+ (Class)ACCNavigationInfoClass
{
  return (Class)objc_opt_class();
}

- (ACCNavigationManeuverUpdateInfo)maneuver
{
  [(id)objc_opt_class() ACCNavigationInfoClass];
  id v3 = [(CRAccNavInfo *)self accNavInfo];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (ACCNavigationManeuverUpdateInfo *)v4;
}

- (unsigned)index
{
  return [(CRAccNavInfo *)self uint16ForInfoType:1];
}

- (unsigned)linkedLaneGuidanceIndex
{
  return [(CRAccNavInfo *)self uint16ForInfoType:12];
}

@end