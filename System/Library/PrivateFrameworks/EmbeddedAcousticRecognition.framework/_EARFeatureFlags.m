@interface _EARFeatureFlags
+ (BOOL)isEmojiV2Enabled;
@end

@implementation _EARFeatureFlags

+ (BOOL)isEmojiV2Enabled
{
  return MEMORY[0x1F40C9FB0]("Siri", "dictation_emoji_v2");
}

@end