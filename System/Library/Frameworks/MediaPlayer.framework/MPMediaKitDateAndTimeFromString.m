@interface MPMediaKitDateAndTimeFromString
@end

@implementation MPMediaKitDateAndTimeFromString

uint64_t ___MPMediaKitDateAndTimeFromString_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_MPMediaKitDateAndTimeFromString_mediaKitDateAndTimeFormatter;
  _MPMediaKitDateAndTimeFromString_mediaKitDateAndTimeFormatter = v0;

  v2 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [(id)_MPMediaKitDateAndTimeFromString_mediaKitDateAndTimeFormatter setTimeZone:v2];

  v3 = (void *)_MPMediaKitDateAndTimeFromString_mediaKitDateAndTimeFormatter;

  return [v3 setFormatOptions:1907];
}

@end