@interface PHASEPushStreamNodeDefinition
+ (PHASEPushStreamNodeDefinition)new;
- (AVAudioFormat)format;
- (BOOL)normalize;
- (NSNumber)targetLKFS;
- (PHASEPushStreamNodeDefinition)init;
- (PHASEPushStreamNodeDefinition)initWithMixerDefinition:(PHASEMixerDefinition *)mixerDefinition format:(AVAudioFormat *)format;
- (PHASEPushStreamNodeDefinition)initWithMixerDefinition:(PHASEMixerDefinition *)mixerDefinition format:(AVAudioFormat *)format identifier:(NSString *)identifier;
- (double)referenceGainDbSpl;
- (void)setNormalize:(BOOL)normalize;
- (void)setReferenceGainDbSpl:(double)a3;
- (void)setTargetLKFS:(id)a3;
@end

@implementation PHASEPushStreamNodeDefinition

- (PHASEPushStreamNodeDefinition)init
{
  return 0;
}

+ (PHASEPushStreamNodeDefinition)new
{
  return 0;
}

- (PHASEPushStreamNodeDefinition)initWithMixerDefinition:(PHASEMixerDefinition *)mixerDefinition format:(AVAudioFormat *)format identifier:(NSString *)identifier
{
  v8 = mixerDefinition;
  v9 = format;
  v10 = identifier;
  v11 = [(PHASEPushStreamNodeDefinition *)self initWithMixerDefinition:v8 format:v9];
  v12 = v11;
  if (v11) {
    [(PHASEDefinition *)v11 setIdentifier:v10];
  }

  return v12;
}

- (PHASEPushStreamNodeDefinition)initWithMixerDefinition:(PHASEMixerDefinition *)mixerDefinition format:(AVAudioFormat *)format
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v6 = mixerDefinition;
  v7 = format;
  v32.receiver = self;
  v32.super_class = (Class)PHASEPushStreamNodeDefinition;
  v8 = [(PHASEGeneratorNodeDefinition *)&v32 initInternal:v6];
  if (!v8) {
    goto LABEL_23;
  }
  v9 = [(AVAudioFormat *)v7 commonFormat];
  if (v9 == (Phase::Logger *)1)
  {
    if ([(AVAudioFormat *)v7 channelCount] < 2
      || (v9 = (Phase::Logger *)[(AVAudioFormat *)v7 isInterleaved], !v9))
    {
      v15 = [(AVAudioFormat *)v7 channelLayout];
      BOOL v16 = v15 == 0;

      if (!v16)
      {
        v17 = v7;
        v18 = (void *)v8[11];
        v8[11] = v17;
LABEL_22:

        *((unsigned char *)v8 + 80) = 0;
        uint64_t v27 = [NSNumber numberWithDouble:-12.0];
        v28 = (void *)v8[13];
        v8[13] = v27;

LABEL_23:
        v14 = v8;
        goto LABEL_24;
      }
      v19 = (Phase::Logger *)[(AVAudioFormat *)v7 channelCount];
      switch(v19)
      {
        case 0:
          v23 = **(id **)(Phase::Logger::GetInstance(v19) + 432);
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_8;
          }
          *(_DWORD *)buf = 136315394;
          v34 = "PHASESoundEventNodes.mm";
          __int16 v35 = 1024;
          int v36 = 769;
          v11 = "%25s:%-5d Failed to initialize new instance of PHASEPushStreamNodeDefinition. An AVAudioFormat object wi"
                "th a nil channelLayout and channelCount of 0 was provided which is invalid.";
          v12 = v23;
          os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_7;
        case 1:
          uint64_t v20 = 6553601;
          v21 = **(id **)(Phase::Logger::GetInstance(v19) + 432);
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
LABEL_21:
            v18 = (void *)[objc_alloc(MEMORY[0x263EF9328]) initWithLayoutTag:v20];
            id v24 = objc_alloc(MEMORY[0x263EF9388]);
            [(AVAudioFormat *)v7 sampleRate];
            uint64_t v25 = objc_msgSend(v24, "initStandardFormatWithSampleRate:channelLayout:", v18);
            v26 = (void *)v8[11];
            v8[11] = v25;

            goto LABEL_22;
          }
          *(_DWORD *)buf = 136315394;
          v34 = "PHASESoundEventNodes.mm";
          __int16 v35 = 1024;
          int v36 = 776;
          v22 = "%25s:%-5d An AVAudioFormat object with a nil channelLayout and channelCount of 1 was provided to PHASEPu"
                "shStreamNodeDefinition.initWithMixerDefinition. Note that a mono channelLayout will be automatically ass"
                "igned to the audio format property.";
          break;
        case 2:
          uint64_t v20 = 6619138;
          v21 = **(id **)(Phase::Logger::GetInstance(v19) + 432);
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          *(_DWORD *)buf = 136315394;
          v34 = "PHASESoundEventNodes.mm";
          __int16 v35 = 1024;
          int v36 = 785;
          v22 = "%25s:%-5d An AVAudioFormat object with a nil channelLayout and channelCount of 2 was provided to PHASEPu"
                "shStreamNodeDefinition.initWithMixerDefinition. Note that a stereo channelLayout will be automatically a"
                "ssigned to the audio format property";
          break;
        default:
          v30 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v19)
                                                                                              + 432)));
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            AVAudioChannelCount v31 = [(AVAudioFormat *)v7 channelCount];
            *(_DWORD *)buf = 136315650;
            v34 = "PHASESoundEventNodes.mm";
            __int16 v35 = 1024;
            int v36 = 796;
            __int16 v37 = 1024;
            AVAudioChannelCount v38 = v31;
            _os_log_impl(&dword_221E5E000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d It's unexpected to have an AVAudioFormat object with a nil channelLayout for a channel count of %d. Please verify the AVAudioFormat API has not changed for channelCounts > 2.", buf, 0x18u);
          }

          goto LABEL_8;
      }
      _os_log_impl(&dword_221E5E000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 0x12u);
      goto LABEL_21;
    }
  }
  v10 = **(id **)(Phase::Logger::GetInstance(v9) + 432);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "PHASESoundEventNodes.mm";
    __int16 v35 = 1024;
    int v36 = 753;
    v11 = "%25s:%-5d Audio Format must be deinterleaved 32-bit floating-point PCM.";
    v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_7:
    _os_log_impl(&dword_221E5E000, v12, v13, v11, buf, 0x12u);
  }
LABEL_8:
  v14 = 0;
LABEL_24:

  return v14;
}

- (void)setTargetLKFS:(id)a3
{
  id v12 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v12 doubleValue];
  double v9 = PHASEGetPropertyBounded<double>(v6, v7, v8, -100.0, 0.0);

  v10 = [NSNumber numberWithDouble:v9];
  targetLKFS = self->_targetLKFS;
  self->_targetLKFS = v10;
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (BOOL)normalize
{
  return self->_normalize;
}

- (void)setNormalize:(BOOL)normalize
{
  self->_normalize = normalize;
}

- (double)referenceGainDbSpl
{
  return self->_referenceGainDbSpl;
}

- (void)setReferenceGainDbSpl:(double)a3
{
  self->_referenceGainDbSpl = a3;
}

- (NSNumber)targetLKFS
{
  return self->_targetLKFS;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLKFS, 0);

  objc_storeStrong((id *)&self->_format, 0);
}

@end