@interface PHASESubband
+ (id)new;
- (PHASESubband)init;
- (PHASESubband)initWithFrequency:(float)a3 value:(float)a4;
- (float)frequency;
- (float)value;
@end

@implementation PHASESubband

- (PHASESubband)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (PHASESubband)initWithFrequency:(float)a3 value:(float)a4
{
  v5 = self;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a3 <= 0.0)
  {
    v9 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "PHASEMaterial.mm";
      __int16 v14 = 1024;
      int v15 = 102;
      __int16 v16 = 2048;
      double v17 = a3;
      _os_log_impl(&dword_221E5E000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASESubband:initWithFrequency:value]: Invalid frequency: %2.2f. Values must be positive.", buf, 0x1Cu);
    }
    v8 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PHASESubband;
    v7 = [(PHASESubband *)&v11 init];
    if (v7)
    {
      v7->_frequency = a3;
      v7->_value = a4;
    }
    v5 = v7;
    v8 = v5;
  }

  return v8;
}

- (float)frequency
{
  return self->_frequency;
}

- (float)value
{
  return self->_value;
}

@end