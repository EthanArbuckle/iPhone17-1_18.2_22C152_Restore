@interface SAGuidanceCheckForGuideUpdates(AssistantUIAdditions)
+ (id)afui_guideCheckSupportedFeatures;
@end

@implementation SAGuidanceCheckForGuideUpdates(AssistantUIAdditions)

+ (id)afui_guideCheckSupportedFeatures
{
  v0 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
  if (MGGetBoolAnswer()) {
    [v0 addObject:*MEMORY[0x263F651F8]];
  }
  if (MGGetBoolAnswer()) {
    [v0 addObject:*MEMORY[0x263F65200]];
  }
  if (MGGetBoolAnswer()) {
    [v0 addObject:*MEMORY[0x263F65208]];
  }
  if (MGGetBoolAnswer()) {
    [v0 addObject:*MEMORY[0x263F65210]];
  }
  if (ShouldShowWeibo()) {
    [v0 addObject:*MEMORY[0x263F65218]];
  }

  return v0;
}

@end