@interface HPSSettingHelper
+ (BOOL)shouldDisableUpdateSettingForKeyPath:(id)a3;
@end

@implementation HPSSettingHelper

+ (BOOL)shouldDisableUpdateSettingForKeyPath:(id)a3
{
  return [&unk_26F0F87B0 containsObject:a3];
}

@end