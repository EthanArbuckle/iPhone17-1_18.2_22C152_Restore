@interface MPCSonicAVItemAsset
- (AVAsset)avAsset;
- (BOOL)isEnhancedHLS;
- (BOOL)isHLS;
- (MPCSonicAVItemAsset)init;
- (MPCSonicAVItemAsset)initWithSonicAVItem:(id)a3;
- (void)loadEnhancedHLSAudioFormatsWithCompletion:(id)a3;
- (void)prepareForRate:(float)a3 completion:(id)a4;
@end

@implementation MPCSonicAVItemAsset

- (MPCSonicAVItemAsset)initWithSonicAVItem:(id)a3
{
  return (MPCSonicAVItemAsset *)sub_21BC97940(a3);
}

- (void).cxx_destruct
{
}

- (AVAsset)avAsset
{
  v2 = self;
  v3 = (void *)sub_21BC97C20();

  return (AVAsset *)v3;
}

- (BOOL)isHLS
{
  v2 = self;
  char v3 = sub_21BC97DB8(MEMORY[0x263F88620]);

  return v3 & 1;
}

- (BOOL)isEnhancedHLS
{
  v2 = self;
  char v3 = sub_21BC97DB8(MEMORY[0x263F88610]);

  return v3 & 1;
}

- (void)loadEnhancedHLSAudioFormatsWithCompletion:(id)a3
{
}

- (void)prepareForRate:(float)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(float *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = v6;
  *(void *)(v7 + 32) = self;
  v8 = self;

  sub_21BD2EFC8((uint64_t)&unk_267C641D0, v7);
}

- (MPCSonicAVItemAsset)init
{
}

@end