@interface NotifyIsPlayingAmbientAudio
@end

@implementation NotifyIsPlayingAmbientAudio

uint64_t ___NotifyIsPlayingAmbientAudio_block_invoke(uint64_t a1)
{
  uint64_t result = notify_register_check("com.apple.airplay.isPlayingAmbientAudioChanged", &_NotifyIsPlayingAmbientAudio_sToken);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end