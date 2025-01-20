@interface PHASEProcedureNodeDefinition
+ (id)new;
- (PHASEProcedureNodeDefinition)init;
- (double)referenceGainDbSpl;
- (id)initInternal:(id)a3 maxPolyphony:(int)a4 voiceStealingType:(int64_t)a5;
- (int)maxPolyphony;
- (int64_t)cullOption;
- (int64_t)playbackMode;
- (int64_t)voiceStealingType;
- (void)setCullOption:(int64_t)a3;
- (void)setPlaybackMode:(int64_t)a3;
- (void)setReferenceGainDbSpl:(double)a3;
- (void)setVoiceStealingType:(int64_t)a3;
@end

@implementation PHASEProcedureNodeDefinition

- (PHASEProcedureNodeDefinition)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (id)initInternal:(id)a3 maxPolyphony:(int)a4 voiceStealingType:(int64_t)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v9 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PHASEProcedureNodeDefinition;
  v10 = [(PHASEGeneratorNodeDefinition *)&v22 initInternal:v9];
  v11 = v10;
  if (v10)
  {
    v10[14] = 0x4052C00000000000;
    v10[11] = 0;
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = NSStringFromSelector(a2);
    id v15 = v13;
    v16 = v14;
    v17 = v16;
    if (a4 <= 0)
    {
      v18 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v16)
                                                                                          + 432)));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = [v15 UTF8String];
        uint64_t v20 = [(Phase::Logger *)v17 UTF8String];
        *(_DWORD *)buf = 136316674;
        v24 = "PHASEGetProperty.h";
        __int16 v25 = 1024;
        int v26 = 34;
        __int16 v27 = 2080;
        uint64_t v28 = v19;
        __int16 v29 = 2080;
        uint64_t v30 = v20;
        __int16 v31 = 1024;
        int v32 = a4;
        __int16 v33 = 1024;
        int v34 = 1;
        __int16 v35 = 1024;
        int v36 = 0x7FFFFFFF;
        _os_log_impl(&dword_221E5E000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s:%s Value is out of bounds. Clamping %d to range [%d, %d]", buf, 0x38u);
      }

      a4 = 1;
    }

    *((_DWORD *)v11 + 20) = a4;
    v11[13] = a5;
  }

  return v11;
}

- (int64_t)cullOption
{
  return self->_cullOption;
}

- (void)setCullOption:(int64_t)a3
{
  self->_cullOption = a3;
}

- (int64_t)playbackMode
{
  return self->_playbackMode;
}

- (void)setPlaybackMode:(int64_t)a3
{
  self->_playbackMode = a3;
}

- (int)maxPolyphony
{
  return self->_maxPolyphony;
}

- (int64_t)voiceStealingType
{
  return self->_voiceStealingType;
}

- (void)setVoiceStealingType:(int64_t)a3
{
  self->_voiceStealingType = a3;
}

- (double)referenceGainDbSpl
{
  return self->_referenceGainDbSpl;
}

- (void)setReferenceGainDbSpl:(double)a3
{
  self->_referenceGainDbSpl = a3;
}

@end