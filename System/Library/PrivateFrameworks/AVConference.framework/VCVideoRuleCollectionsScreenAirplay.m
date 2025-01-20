@interface VCVideoRuleCollectionsScreenAirplay
+ (id)sharedInstance;
+ (unsigned)tilesPerFrameForHDRMode:(unint64_t)a3;
@end

@implementation VCVideoRuleCollectionsScreenAirplay

+ (id)sharedInstance
{
  return +[VCVideoRuleCollectionsScreenAirplayEmbedded sharedInstance];
}

+ (unsigned)tilesPerFrameForHDRMode:(unint64_t)a3
{
  return +[VCHardwareSettings tilesPerVideoFrameForHardwareSettingsMode:4 hdrMode:a3];
}

@end