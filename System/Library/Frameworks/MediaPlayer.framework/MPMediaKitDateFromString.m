@interface MPMediaKitDateFromString
@end

@implementation MPMediaKitDateFromString

uint64_t ___MPMediaKitDateFromString_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_MPMediaKitDateFromString_mediaKitDateFormatter;
  _MPMediaKitDateFromString_mediaKitDateFormatter = v0;

  v2 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [(id)_MPMediaKitDateFromString_mediaKitDateFormatter setTimeZone:v2];

  v3 = (void *)_MPMediaKitDateFromString_mediaKitDateFormatter;

  return [v3 setFormatOptions:275];
}

@end