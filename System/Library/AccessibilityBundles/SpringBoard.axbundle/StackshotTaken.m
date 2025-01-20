@interface StackshotTaken
@end

@implementation StackshotTaken

void ___StackshotTaken_block_invoke()
{
  id v0 = objc_allocWithZone(NSURL);
  v1 = NSString;
  v2 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/CoreServices/VoiceOverTouch.app"];
  v3 = [v2 resourcePath];
  v4 = [v1 stringWithFormat:@"%@/%@", v3, @"Sounds/StackShot.aiff"];
  CFURLRef inFileURL = (const __CFURL *)[v0 initFileURLWithPath:v4 isDirectory:0];

  AudioServicesCreateSystemSoundID(inFileURL, (SystemSoundID *)&_StackshotTaken_SoundID);
}

@end