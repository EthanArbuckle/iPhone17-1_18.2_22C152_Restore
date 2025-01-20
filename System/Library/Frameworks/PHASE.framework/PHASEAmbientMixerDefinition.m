@interface PHASEAmbientMixerDefinition
+ (PHASEAmbientMixerDefinition)new;
- (AVAudioChannelLayout)inputChannelLayout;
- (PHASEAmbientMixerDefinition)init;
- (PHASEAmbientMixerDefinition)initWithChannelLayout:(AVAudioChannelLayout *)layout orientation:(simd_quatf)orientation;
- (PHASEAmbientMixerDefinition)initWithChannelLayout:(AVAudioChannelLayout *)layout orientation:(simd_quatf)orientation identifier:(NSString *)identifier;
- (simd_quatf)orientation;
@end

@implementation PHASEAmbientMixerDefinition

- (PHASEAmbientMixerDefinition)init
{
  return 0;
}

+ (PHASEAmbientMixerDefinition)new
{
  return 0;
}

- (PHASEAmbientMixerDefinition)initWithChannelLayout:(AVAudioChannelLayout *)layout orientation:(simd_quatf)orientation identifier:(NSString *)identifier
{
  double v13 = *(double *)orientation.vector.i64;
  v7 = layout;
  v8 = identifier;
  v9 = [(PHASEAmbientMixerDefinition *)self initWithChannelLayout:v7 orientation:v13];
  v10 = v9;
  if (v9)
  {
    [(PHASEDefinition *)v9 setIdentifier:v8];
    v11 = v10;
  }

  return v10;
}

- (PHASEAmbientMixerDefinition)initWithChannelLayout:(AVAudioChannelLayout *)layout orientation:(simd_quatf)orientation
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v6 = layout;
  v20.receiver = self;
  v20.super_class = (Class)PHASEAmbientMixerDefinition;
  id v7 = [(PHASEMixerDefinition *)&v20 initInternal];
  if (!v7) {
    goto LABEL_11;
  }
  v8 = [(AVAudioChannelLayout *)v6 layout];
  v10 = Phase::ChannelLayout::IsLayoutSupported(v8, v9);
  if (v10)
  {
    float v11 = 1.0
        - sqrtf(vmuls_lane_f32(orientation.vector.f32[3], (float32x4_t)orientation, 3)+ (float)(vmuls_lane_f32(orientation.vector.f32[2], (float32x4_t)orientation, 2)+ (float)(vmulq_f32((float32x4_t)orientation, (float32x4_t)orientation).f32[0]+ vmuls_lane_f32(orientation.vector.f32[1], *(float32x2_t *)orientation.vector.f32, 1))));
    if (v11 < 0.0) {
      float v11 = -v11;
    }
    if (v11 <= 0.1)
    {
      *((simd_quatf *)v7 + 3) = orientation;
      objc_storeStrong((id *)v7 + 5, layout);
      v17 = (PHASEAmbientMixerDefinition *)v7;
      goto LABEL_12;
    }
    v12 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)v10) + 432);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v22 = "PHASEMixer.mm";
      __int16 v23 = 1024;
      int v24 = 406;
      __int16 v25 = 2048;
      double v26 = orientation.vector.f32[0];
      __int16 v27 = 2048;
      double v28 = orientation.vector.f32[1];
      __int16 v29 = 2048;
      double v30 = orientation.vector.f32[2];
      __int16 v31 = 2048;
      double v32 = orientation.vector.f32[3];
      double v13 = "%25s:%-5d Failed to initialize Ambient Mixer Definition: orientation [%f, %f, %f, %f] must be normalized";
      v14 = v12;
      uint32_t v15 = 58;
LABEL_10:
      _os_log_impl(&dword_221E5E000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    }
  }
  else
  {
    v16 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)v10) + 432);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "PHASEMixer.mm";
      __int16 v23 = 1024;
      int v24 = 398;
      double v13 = "%25s:%-5d Failed to initialize Ambient Mixer Definition: unsupported channel layout";
      v14 = v16;
      uint32_t v15 = 18;
      goto LABEL_10;
    }
  }
LABEL_11:
  v17 = 0;
LABEL_12:

  return v17;
}

- (simd_quatf)orientation
{
  return (simd_quatf)self[1].super.super;
}

- (AVAudioChannelLayout)inputChannelLayout
{
  return self->_inputChannelLayout;
}

- (void).cxx_destruct
{
}

@end