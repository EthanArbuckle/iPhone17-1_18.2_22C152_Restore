@interface NSObject(MusicKit_SoftLinking_MPNowPlayingInfoAudioFormat)
- (id)_musicKit_self_nowPlayingInfoAudioFormat;
- (unint64_t)musicKit_nowPlayingInfoAudioFormat_badging;
@end

@implementation NSObject(MusicKit_SoftLinking_MPNowPlayingInfoAudioFormat)

- (id)_musicKit_self_nowPlayingInfoAudioFormat
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getMPNowPlayingInfoAudioFormatClass_softClass;
  uint64_t v10 = getMPNowPlayingInfoAudioFormatClass_softClass;
  if (!getMPNowPlayingInfoAudioFormatClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getMPNowPlayingInfoAudioFormatClass_block_invoke;
    v6[3] = &unk_26443F950;
    v6[4] = &v7;
    __getMPNowPlayingInfoAudioFormatClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  if (objc_opt_isKindOfClass()) {
    id v4 = a1;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (unint64_t)musicKit_nowPlayingInfoAudioFormat_badging
{
  v1 = objc_msgSend(a1, "_musicKit_self_nowPlayingInfoAudioFormat");
  unint64_t v2 = [v1 badging];

  if (v2 < 6) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

@end