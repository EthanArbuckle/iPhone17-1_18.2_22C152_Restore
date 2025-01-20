@interface NSBundle(MPUAdditions)
+ (uint64_t)mediaPlayerUIBundle;
@end

@implementation NSBundle(MPUAdditions)

+ (uint64_t)mediaPlayerUIBundle
{
  return [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MediaPlayerUI"];
}

@end