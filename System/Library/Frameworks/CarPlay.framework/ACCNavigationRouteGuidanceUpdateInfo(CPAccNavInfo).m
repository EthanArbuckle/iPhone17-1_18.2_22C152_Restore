@interface ACCNavigationRouteGuidanceUpdateInfo(CPAccNavInfo)
- (uint64_t)initWithRouteGuidance:()CPAccNavInfo component:;
@end

@implementation ACCNavigationRouteGuidanceUpdateInfo(CPAccNavInfo)

- (uint64_t)initWithRouteGuidance:()CPAccNavInfo component:
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __86__ACCNavigationRouteGuidanceUpdateInfo_CPAccNavInfo__initWithRouteGuidance_component___block_invoke;
  v12[3] = &unk_26430B040;
  id v13 = v7;
  id v14 = v6;
  id v8 = v6;
  id v9 = v7;
  uint64_t v10 = +[CPAccNavUpdate accNavInfoWithUpdate:v8 component:v9 customValueBlock:v12];

  return v10;
}

@end