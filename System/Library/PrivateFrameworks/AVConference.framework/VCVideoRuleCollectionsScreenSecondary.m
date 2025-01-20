@interface VCVideoRuleCollectionsScreenSecondary
+ (id)sharedInstance;
+ (unsigned)tilesPerFrame;
@end

@implementation VCVideoRuleCollectionsScreenSecondary

+ (id)sharedInstance
{
  return +[VCVideoRuleCollectionsScreenSecondaryEmbedded sharedInstance];
}

+ (unsigned)tilesPerFrame
{
  return +[VCHardwareSettings tilesPerVideoFrameForHardwareSettingsMode:3];
}

@end