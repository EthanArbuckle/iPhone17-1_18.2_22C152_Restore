@interface PHASEChannelMixerDefinition
+ (PHASEChannelMixerDefinition)new;
- (AVAudioChannelLayout)inputChannelLayout;
- (PHASEChannelMixerDefinition)init;
- (PHASEChannelMixerDefinition)initWithChannelLayout:(AVAudioChannelLayout *)layout;
- (PHASEChannelMixerDefinition)initWithChannelLayout:(AVAudioChannelLayout *)layout identifier:(NSString *)identifier;
- (PHASEChannelMixerDefinition)initWithChannelLayout:(id)a3 mode:(int64_t)a4;
- (PHASEChannelMixerDefinition)initWithChannelLayout:(id)a3 mode:(int64_t)a4 uid:(id)a5;
@end

@implementation PHASEChannelMixerDefinition

- (PHASEChannelMixerDefinition)init
{
  return 0;
}

+ (PHASEChannelMixerDefinition)new
{
  return 0;
}

- (PHASEChannelMixerDefinition)initWithChannelLayout:(id)a3 mode:(int64_t)a4 uid:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(PHASEChannelMixerDefinition *)self initWithChannelLayout:v8 mode:a4];
  v11 = v10;
  if (v10)
  {
    [(PHASEDefinition *)v10 setIdentifier:v9];
    v12 = v11;
  }

  return v11;
}

- (PHASEChannelMixerDefinition)initWithChannelLayout:(id)a3 mode:(int64_t)a4
{
  v4 = -[PHASEChannelMixerDefinition initWithChannelLayout:](self, "initWithChannelLayout:", a3, a4);
  v5 = v4;
  if (v4) {
    v6 = v4;
  }

  return v5;
}

- (PHASEChannelMixerDefinition)initWithChannelLayout:(AVAudioChannelLayout *)layout identifier:(NSString *)identifier
{
  v6 = layout;
  v7 = identifier;
  id v8 = [(PHASEChannelMixerDefinition *)self initWithChannelLayout:v6];
  id v9 = v8;
  if (v8)
  {
    [(PHASEDefinition *)v8 setIdentifier:v7];
    v10 = v9;
  }

  return v9;
}

- (PHASEChannelMixerDefinition)initWithChannelLayout:(AVAudioChannelLayout *)layout
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = layout;
  v13.receiver = self;
  v13.super_class = (Class)PHASEChannelMixerDefinition;
  v6 = [(PHASEMixerDefinition *)&v13 initInternal];
  if (!v6)
  {
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v7 = [(AVAudioChannelLayout *)v5 layout];
  id v9 = Phase::ChannelLayout::IsLayoutSupported(v7, v8);
  if ((v9 & 1) == 0)
  {
    v11 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)v9) + 432);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "PHASEMixer.mm";
      __int16 v16 = 1024;
      int v17 = 348;
      _os_log_impl(&dword_221E5E000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to initialize Channel Mixer Definition: unsupported channel layout", buf, 0x12u);
    }
    goto LABEL_6;
  }
  objc_storeStrong(v6 + 4, layout);
  v10 = v6;
LABEL_7:

  return v10;
}

- (AVAudioChannelLayout)inputChannelLayout
{
  return self->_inputChannelLayout;
}

- (void).cxx_destruct
{
}

@end