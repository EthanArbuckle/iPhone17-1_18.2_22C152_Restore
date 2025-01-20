@interface NSBundle
@end

@implementation NSBundle

void __52__NSBundle_MediaPlayerCore__mediaPlaybackCoreBundle__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MediaPlaybackCore"];
  v3 = (void *)mediaPlaybackCoreBundle___mediaPlayerCoreBundle;
  mediaPlaybackCoreBundle___mediaPlayerCoreBundle = v2;

  if (!mediaPlaybackCoreBundle___mediaPlayerCoreBundle)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"NSBundle+MediaPlaybackCore.m" lineNumber:18 description:@"unable to find MediaPlaybackCore framework"];
  }
}

@end