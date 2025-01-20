@interface VCEffects
- (BOOL)addFrame:(__CVBuffer *)a3 time:(int64_t)a4;
- (BOOL)effectsApplied;
- (BOOL)faceMeshTrackingEnabled;
- (BOOL)releaseFrameWithTime:(int64_t)a3;
- (VCEffects)init;
- (int)effectsMode;
- (int)effectsType;
- (void)dealloc;
- (void)setEffectsApplied:(BOOL)a3;
- (void)setEffectsMode:(int)a3;
- (void)setEffectsType:(int)a3;
- (void)setFaceMeshTrackingEnabled:(BOOL)a3;
@end

@implementation VCEffects

- (VCEffects)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCEffects;
  v2 = [(VCEffects *)&v4 init];
  if (v2)
  {
    v2->_bufferPool = [[VCVideoFrameBufferPool alloc] initWithCapacity:5];
    *(_WORD *)&v2->_effectsApplied = 0;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCEffects;
  [(VCEffects *)&v3 dealloc];
}

- (BOOL)addFrame:(__CVBuffer *)a3 time:(int64_t)a4
{
  return [(VCVideoFrameBufferPool *)self->_bufferPool addFrame:a3 time:a4];
}

- (BOOL)releaseFrameWithTime:(int64_t)a3
{
  return [(VCVideoFrameBufferPool *)self->_bufferPool releaseFrameWithTime:a3];
}

- (void)setEffectsMode:(int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  self->_effectsMode = a3;
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315650;
        uint64_t v7 = v4;
        __int16 v8 = 2080;
        v9 = "-[VCEffects setEffectsMode:]";
        __int16 v10 = 1024;
        int v11 = 49;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting effects to disabled, re-initialize the buffer", (uint8_t *)&v6, 0x1Cu);
      }
    }

    self->_bufferPool = [[VCVideoFrameBufferPool alloc] initWithCapacity:5];
  }
}

- (void)setEffectsType:(int)a3
{
  self->_effectsType = a3;
  self->_faceMeshTrackingEnabled = a3 == 2;
  self->_effectsApplied = (a3 - 1) < 2;
}

- (int)effectsMode
{
  return self->_effectsMode;
}

- (int)effectsType
{
  return self->_effectsType;
}

- (BOOL)effectsApplied
{
  return self->_effectsApplied;
}

- (void)setEffectsApplied:(BOOL)a3
{
  self->_effectsApplied = a3;
}

- (BOOL)faceMeshTrackingEnabled
{
  return self->_faceMeshTrackingEnabled;
}

- (void)setFaceMeshTrackingEnabled:(BOOL)a3
{
  self->_faceMeshTrackingEnabled = a3;
}

@end