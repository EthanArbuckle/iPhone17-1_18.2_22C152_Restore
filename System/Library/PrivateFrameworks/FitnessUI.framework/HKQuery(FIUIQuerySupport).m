@interface HKQuery(FIUIQuerySupport)
+ (id)fiui_predicateForWorkoutsWithMetadataSwimmingLocationType:()FIUIQuerySupport;
+ (uint64_t)fiui_predicateForWorkoutsWithMetadataIndoor:()FIUIQuerySupport;
@end

@implementation HKQuery(FIUIQuerySupport)

+ (uint64_t)fiui_predicateForWorkoutsWithMetadataIndoor:()FIUIQuerySupport
{
  if (a3) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 5;
  }
  return [MEMORY[0x263F0A668] predicateForObjectsWithMetadataKey:*MEMORY[0x263F09AA0] operatorType:v3 value:MEMORY[0x263EFFA88]];
}

+ (id)fiui_predicateForWorkoutsWithMetadataSwimmingLocationType:()FIUIQuerySupport
{
  v0 = (void *)MEMORY[0x263F0A668];
  uint64_t v1 = *MEMORY[0x263F09AE0];
  v2 = objc_msgSend(NSNumber, "numberWithInteger:");
  uint64_t v3 = [v0 predicateForObjectsWithMetadataKey:v1 operatorType:4 value:v2];

  return v3;
}

@end