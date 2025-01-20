@interface NSBundle
@end

@implementation NSBundle

void __46__NSBundle_MediaRemoteUI__mediaRemoteUIBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaControls"];
  v1 = (void *)mediaRemoteUIBundle___mediaRemoteUIBundle;
  mediaRemoteUIBundle___mediaRemoteUIBundle = v0;
}

void __46__NSBundle_MediaControls__mediaControlsBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaControls"];
  v1 = (void *)mediaControlsBundle___mediaControlsBundle;
  mediaControlsBundle___mediaControlsBundle = v0;
}

@end