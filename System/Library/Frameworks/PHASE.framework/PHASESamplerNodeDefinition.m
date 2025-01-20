@interface PHASESamplerNodeDefinition
+ (PHASESamplerNodeDefinition)new;
- (NSString)assetIdentifier;
- (NSString)assetUID;
- (PHASECullOption)cullOption;
- (PHASEPlaybackMode)playbackMode;
- (PHASESamplerNodeDefinition)init;
- (PHASESamplerNodeDefinition)initWithSoundAssetIdentifier:(NSString *)soundAssetIdentifier mixerDefinition:(PHASEMixerDefinition *)mixerDefinition;
- (PHASESamplerNodeDefinition)initWithSoundAssetIdentifier:(NSString *)soundAssetIdentifier mixerDefinition:(PHASEMixerDefinition *)mixerDefinition identifier:(NSString *)identifier;
- (void)setCullOption:(PHASECullOption)cullOption;
- (void)setPlaybackMode:(PHASEPlaybackMode)playbackMode;
- (void)setPlaybackType:(int64_t)a3;
@end

@implementation PHASESamplerNodeDefinition

- (PHASESamplerNodeDefinition)init
{
  return 0;
}

+ (PHASESamplerNodeDefinition)new
{
  return 0;
}

- (PHASESamplerNodeDefinition)initWithSoundAssetIdentifier:(NSString *)soundAssetIdentifier mixerDefinition:(PHASEMixerDefinition *)mixerDefinition identifier:(NSString *)identifier
{
  v8 = soundAssetIdentifier;
  v9 = mixerDefinition;
  v10 = identifier;
  v11 = [(PHASESamplerNodeDefinition *)self initWithSoundAssetIdentifier:v8 mixerDefinition:v9];
  v12 = v11;
  if (v11) {
    [(PHASEDefinition *)v11 setIdentifier:v10];
  }

  return v12;
}

- (PHASESamplerNodeDefinition)initWithSoundAssetIdentifier:(NSString *)soundAssetIdentifier mixerDefinition:(PHASEMixerDefinition *)mixerDefinition
{
  v7 = soundAssetIdentifier;
  v8 = mixerDefinition;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)PHASESamplerNodeDefinition;
    v9 = [(PHASEGeneratorNodeDefinition *)&v13 initInternal:v8];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong(v9 + 10, soundAssetIdentifier);
      v10[11] = 0;
      v10[12] = 0;
    }
    self = v10;
    v11 = self;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:@"API Misuse" format:@"Cannot create a sampler with a nil soundAssetUID"];
    v11 = 0;
  }

  return v11;
}

- (void)setPlaybackType:(int64_t)a3
{
  if ((unint64_t)a3 <= 1) {
    self->_playbackMode = a3;
  }
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (PHASECullOption)cullOption
{
  return self->_cullOption;
}

- (void)setCullOption:(PHASECullOption)cullOption
{
  self->_cullOption = cullOption;
}

- (PHASEPlaybackMode)playbackMode
{
  return self->_playbackMode;
}

- (void)setPlaybackMode:(PHASEPlaybackMode)playbackMode
{
  self->_playbackMode = playbackMode;
}

- (NSString)assetUID
{
  return self->_assetUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUID, 0);

  objc_storeStrong((id *)&self->_assetIdentifier, 0);
}

@end