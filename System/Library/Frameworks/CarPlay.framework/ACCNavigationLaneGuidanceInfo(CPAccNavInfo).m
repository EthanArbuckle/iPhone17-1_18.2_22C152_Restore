@interface ACCNavigationLaneGuidanceInfo(CPAccNavInfo)
- (uint64_t)initWithLaneGuidance:()CPAccNavInfo component:;
@end

@implementation ACCNavigationLaneGuidanceInfo(CPAccNavInfo)

- (uint64_t)initWithLaneGuidance:()CPAccNavInfo component:
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__ACCNavigationLaneGuidanceInfo_CPAccNavInfo__initWithLaneGuidance_component___block_invoke;
  v12[3] = &unk_26430B040;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  uint64_t v10 = +[CPAccNavUpdate accNavInfoWithUpdate:v9 component:v8 customValueBlock:v12];

  return v10;
}

@end