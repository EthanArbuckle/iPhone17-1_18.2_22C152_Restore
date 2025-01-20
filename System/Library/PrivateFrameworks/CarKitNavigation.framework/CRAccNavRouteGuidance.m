@interface CRAccNavRouteGuidance
+ (Class)ACCNavigationInfoClass;
+ (id)loadingForComponent:(id)a3 sourceName:(id)a4 sourceSupported:(BOOL)a5;
+ (id)resetForComponent:(id)a3;
- (ACCNavigationRouteGuidanceUpdateInfo)routeGuidance;
- (BOOL)hasCurrentLaneGuidanceIndex;
- (NSArray)currentManeuverIndexes;
- (unsigned)currentLaneGuidanceIndex;
- (unsigned)guidanceState;
@end

@implementation CRAccNavRouteGuidance

+ (Class)ACCNavigationInfoClass
{
  return (Class)objc_opt_class();
}

+ (id)resetForComponent:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 setInfo:1 data:&unk_26FD9CC78];
  v6 = (void *)[objc_alloc((Class)a1) initWithComponent:v4 accNavInfo:v5];

  return v6;
}

+ (id)loadingForComponent:(id)a3 sourceName:(id)a4 sourceSupported:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setInfo:1 data:&unk_26FD9CC90];
  [v10 setInfo:19 data:v8];

  v11 = [NSNumber numberWithBool:v5];
  [v10 setInfo:20 data:v11];

  v12 = (void *)[objc_alloc((Class)a1) initWithComponent:v9 accNavInfo:v10];
  return v12;
}

- (ACCNavigationRouteGuidanceUpdateInfo)routeGuidance
{
  [(id)objc_opt_class() ACCNavigationInfoClass];
  id v3 = [(CRAccNavInfo *)self accNavInfo];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (ACCNavigationRouteGuidanceUpdateInfo *)v4;
}

- (unsigned)guidanceState
{
  return [(CRAccNavInfo *)self uint8ForInfoType:1];
}

- (NSArray)currentManeuverIndexes
{
  v2 = [(CRAccNavInfo *)self valueForInfoType:13];
  objc_opt_class();
  id v3 = v2;
  if (!v3 || (id v4 = v3, (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v4 = (void *)MEMORY[0x263EFFA68];
  }

  return (NSArray *)v4;
}

- (BOOL)hasCurrentLaneGuidanceIndex
{
  v2 = [(CRAccNavInfo *)self valueForInfoType:16];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unsigned)currentLaneGuidanceIndex
{
  return [(CRAccNavInfo *)self uint16ForInfoType:16];
}

@end