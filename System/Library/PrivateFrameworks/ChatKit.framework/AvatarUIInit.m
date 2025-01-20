@interface AvatarUIInit
@end

@implementation AvatarUIInit

void *___AvatarUIInit_block_invoke()
{
  _CKAVTAvatarStore = MEMORY[0x192FBA860](@"AVTAvatarStore", @"AvatarUI");
  _CKAVTAvatarFetchRequest = MEMORY[0x192FBA860](@"AVTAvatarFetchRequest", @"AvatarUI");
  _CKAVTAvatarEditorViewController = MEMORY[0x192FBA860](@"AVTAvatarEditorViewController", @"AvatarUI");
  _CKAVPlayerViewController = MEMORY[0x192FBA860](@"AVPlayerViewController", @"AVKit");
  _CKAVTUISetHasDisplayedSplashScreen = (_UNKNOWN *)MEMORY[0x192FBA870]("AVTUISetHasDisplayedSplashScreen", @"AvatarUI");
  result = (void *)MEMORY[0x192FBA870]("AVTAvatarEditorSplashVideo", @"AvatarUI");
  _CKAVTAvatarEditorSplashVideo = result;
  return result;
}

@end