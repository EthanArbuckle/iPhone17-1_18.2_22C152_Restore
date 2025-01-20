@interface PHASESessionVolume
- (BOOL)muted;
- (PHASESessionVolume)initWithValue:(float)a3 unit:(int64_t)a4;
- (PHASESessionVolume)initWithValue:(float)a3 unit:(int64_t)a4 muted:(BOOL)a5;
- (float)value;
- (id)description;
- (int64_t)unit;
@end

@implementation PHASESessionVolume

- (PHASESessionVolume)initWithValue:(float)a3 unit:(int64_t)a4
{
  return -[PHASESessionVolume initWithValue:unit:muted:](self, "initWithValue:unit:muted:", a4, 0);
}

- (PHASESessionVolume)initWithValue:(float)a3 unit:(int64_t)a4 muted:(BOOL)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)PHASESessionVolume;
  v8 = [(PHASESessionVolume *)&v18 init];
  v9 = v8;
  if (v8)
  {
    v8->_value = a3;
    v8->_unit = a4;
    v8->_muted = a5;
    if (a4)
    {
      v10 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)v8) + 432);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v20 = "PHASESessionVolume.mm";
        __int16 v21 = 1024;
        int v22 = 48;
        __int16 v23 = 2048;
        double v24 = *(double *)&a4;
        __int16 v25 = 2048;
        double v26 = a3;
        v11 = "%25s:%-5d Error: unimplemented volume unit %ld, value %f";
        v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_13:
        _os_log_impl(&dword_221E5E000, v12, v13, v11, buf, 0x26u);
      }
    }
    else
    {
      float v14 = 1.0;
      if (a3 <= 1.0) {
        float v14 = a3;
      }
      if (a3 >= 0.0) {
        float v15 = v14;
      }
      else {
        float v15 = 0.0;
      }
      if (v15 != a3)
      {
        v16 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)v8) + 432);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v20 = "PHASESessionVolume.mm";
          __int16 v21 = 1024;
          int v22 = 41;
          __int16 v23 = 2048;
          double v24 = a3;
          __int16 v25 = 2048;
          double v26 = v15;
          v11 = "%25s:%-5d Warning: clamping scalar volume %f to %f";
          v12 = v16;
          os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_13;
        }
      }
    }
  }
  return v9;
}

- (id)description
{
  if (self->_unit) {
    v2 = "unknown";
  }
  else {
    v2 = "scalar";
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%.3f %s", self->_value, v2);
}

- (float)value
{
  return self->_value;
}

- (int64_t)unit
{
  return self->_unit;
}

- (BOOL)muted
{
  return self->_muted;
}

@end