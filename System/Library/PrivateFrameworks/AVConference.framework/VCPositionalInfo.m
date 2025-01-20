@interface VCPositionalInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPendingChanges;
- (BOOL)isInCanvas;
- (BOOL)isVisible;
- (VCPositionalInfo)init;
- (VCPositionalInfo)initWithCoder:(id)a3;
- (const)metadataPositionalInfo;
- (id)description;
- (id)serialize;
- (tagAVCPositionalInfo)avcPositionalInfo;
- (unsigned)prominenceIndex;
- (void)encodeWithCoder:(id)a3;
- (void)serialize;
- (void)setAvcPositionalInfo:(tagAVCPositionalInfo *)a3;
- (void)setIsInCanvas:(BOOL)a3;
- (void)setIsVisible:(BOOL)a3;
- (void)setProminenceIndex:(unsigned int)a3;
- (void)unserialize:(id)a3;
@end

@implementation VCPositionalInfo

- (VCPositionalInfo)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCPositionalInfo;
  result = [(VCPositionalInfo *)&v3 init];
  if (result) {
    result->_hasPendingChanges = 0;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"inCanvas=%u size=[%f;%f] center=[%.0f;%.0f;%.02f] prominanceIndex=%d",
               self->_isInCanvas,
               *(void *)&self->_size.width,
               *(void *)&self->_size.height,
               *(void *)&self->_x,
               *(void *)&self->_y,
               *(void *)&self->_z,
               self->_prominenceIndex);
}

- (id)serialize
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  objc_super v3 = (void *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:v5];
  if (v5[0])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCPositionalInfo serialize]();
      }
    }
  }
  else
  {
    self->_hasPendingChanges = 0;
  }
  return v3;
}

- (void)unserialize:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:&v15];
  if (v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCPositionalInfo unserialize:]();
      }
    }
  }
  else
  {
    double v5 = *(double *)(v4 + 32);
    if (v5 != self->_x)
    {
      self->_x = v5;
      self->_hasPendingChanges = 1;
    }
    double v6 = *(double *)(v4 + 40);
    if (v6 != self->_y)
    {
      self->_y = v6;
      self->_hasPendingChanges = 1;
    }
    double v7 = *(double *)(v4 + 48);
    if (v7 != self->_z)
    {
      self->_z = v7;
      self->_hasPendingChanges = 1;
    }
    double v8 = *(double *)(v4 + 16);
    if (v8 != self->_size.width)
    {
      self->_size.width = v8;
      self->_hasPendingChanges = 1;
    }
    double v9 = *(double *)(v4 + 24);
    if (v9 != self->_size.height)
    {
      self->_size.height = v9;
      self->_hasPendingChanges = 1;
    }
    int v10 = *(unsigned __int8 *)(v4 + 8);
    if (v10 != self->_isInCanvas)
    {
      self->_isInCanvas = v10;
      self->_hasPendingChanges = 1;
    }
    unsigned int v11 = *(_DWORD *)(v4 + 60);
    if (v11 != self->_prominenceIndex)
    {
      self->_prominenceIndex = v11;
      self->_hasPendingChanges = 1;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(VCPositionalInfo *)self description];
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v12;
        __int16 v18 = 2080;
        v19 = "-[VCPositionalInfo unserialize:]";
        __int16 v20 = 1024;
        int v21 = 81;
        __int16 v22 = 2112;
        id v23 = v14;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [AVC SPATIAL AUDIO] unserialize done. %@", buf, 0x26u);
      }
    }
  }
}

- (const)metadataPositionalInfo
{
  *(float32x2_t *)&self->_metadataPositionalInfo.positionX = vcvt_f32_f64(*(float64x2_t *)&self->_x);
  result = &self->_metadataPositionalInfo;
  float v3 = *(double *)&result[-1].positionZ;
  result->positionZ = v3;
  unsigned int v4 = BYTE1(result[-1].isVisible);
  result->prominence = result[-1].isInCanvas;
  result->isVisible = v4;
  result->isInCanvas = LOBYTE(result[-3].isVisible);
  return result;
}

- (tagAVCPositionalInfo)avcPositionalInfo
{
  retstr->var0 = LOBYTE(self->var1.width);
  long long v3 = *(_OWORD *)&self->var3;
  retstr->var1 = *(CGSize *)&self->var1.height;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = *(double *)&self[1].var0;
  return self;
}

- (void)setAvcPositionalInfo:(tagAVCPositionalInfo *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double var2 = a3->var2;
  if (var2 != self->_x)
  {
    self->_x = var2;
    self->_hasPendingChanges = 1;
  }
  double var3 = a3->var3;
  if (var3 != self->_y)
  {
    self->_y = var3;
    self->_hasPendingChanges = 1;
  }
  double var4 = a3->var4;
  if (var4 != self->_z)
  {
    self->_z = var4;
    self->_hasPendingChanges = 1;
  }
  double width = a3->var1.width;
  if (width != self->_size.width)
  {
    self->_size.double width = width;
    self->_hasPendingChanges = 1;
  }
  double height = a3->var1.height;
  if (height != self->_size.height)
  {
    self->_size.double height = height;
    self->_hasPendingChanges = 1;
  }
  if ((a3->var0 & 1) != self->_isInCanvas)
  {
    self->_isInCanvas = a3->var0 & 1;
    self->_hasPendingChanges = 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    int v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315906;
      uint64_t v12 = v9;
      __int16 v13 = 2080;
      id v14 = "-[VCPositionalInfo setAvcPositionalInfo:]";
      __int16 v15 = 1024;
      int v16 = 114;
      __int16 v17 = 2112;
      __int16 v18 = self;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [AVC SPATIAL AUDIO] %@", (uint8_t *)&v11, 0x26u);
    }
  }
}

- (void)setProminenceIndex:(unsigned int)a3
{
  if (self->_prominenceIndex != a3)
  {
    self->_prominenceIndex = a3;
    self->_hasPendingChanges = 1;
  }
}

- (void)setIsVisible:(BOOL)a3
{
  if (self->_isVisible != a3)
  {
    self->_isVisible = a3;
    self->_hasPendingChanges = 1;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double x = self->_x;
  *(float *)&double x = x;
  [a3 encodeFloat:kVCPositionalInfoTilePositionX forKey:x];
  double y = self->_y;
  *(float *)&double y = y;
  [a3 encodeFloat:kVCPositionalInfoTilePositionY forKey:y];
  double z = self->_z;
  if (z != 0.0)
  {
    *(float *)&double z = z;
    [a3 encodeFloat:kVCPositionalInfoTilePositionZ forKey:z];
  }
  CGFloat width = self->_size.width;
  *(float *)&CGFloat width = width;
  [a3 encodeFloat:kVCPositionalInfoTileWidth forKey:width];
  CGFloat height = self->_size.height;
  *(float *)&CGFloat height = height;
  [a3 encodeFloat:kVCPositionalInfoTileHeight forKey:height];
  if (self->_isInCanvas) {
    [a3 encodeBool:1 forKey:kVCPositionalInfoInCanvas];
  }
  if (self->_isVisible) {
    [a3 encodeBool:1 forKey:kVCPositionalInfoIsVisible];
  }
  if (self->_prominenceIndex)
  {
    objc_msgSend(a3, "encodeInt32:forKey:");
  }
}

- (VCPositionalInfo)initWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCPositionalInfo;
  unsigned int v4 = [(VCPositionalInfo *)&v11 init];
  if (v4)
  {
    if ([a3 containsValueForKey:kVCPositionalInfoTilePositionX])
    {
      [a3 decodeFloatForKey:kVCPositionalInfoTilePositionX];
      v4->_double x = v5;
    }
    if ([a3 containsValueForKey:kVCPositionalInfoTilePositionY])
    {
      [a3 decodeFloatForKey:kVCPositionalInfoTilePositionY];
      v4->_double y = v6;
    }
    if ([a3 containsValueForKey:kVCPositionalInfoTilePositionZ])
    {
      [a3 decodeFloatForKey:kVCPositionalInfoTilePositionZ];
      v4->_double z = v7;
    }
    if ([a3 containsValueForKey:kVCPositionalInfoTileWidth])
    {
      [a3 decodeFloatForKey:kVCPositionalInfoTileWidth];
      v4->_size.CGFloat width = v8;
    }
    if ([a3 containsValueForKey:kVCPositionalInfoTileHeight])
    {
      [a3 decodeFloatForKey:kVCPositionalInfoTileHeight];
      v4->_size.CGFloat height = v9;
    }
    if ([a3 containsValueForKey:kVCPositionalInfoInCanvas]) {
      v4->_isInCanvas = [a3 decodeBoolForKey:kVCPositionalInfoInCanvas];
    }
    if ([a3 containsValueForKey:kVCPositionalInfoProminence]) {
      v4->_prominenceIndedouble x = [a3 decodeInt32ForKey:kVCPositionalInfoProminence];
    }
    if ([a3 containsValueForKey:kVCPositionalInfoIsVisible]) {
      v4->_isVisible = [a3 decodeBoolForKey:kVCPositionalInfoIsVisible];
    }
  }
  return v4;
}

- (BOOL)hasPendingChanges
{
  return self->_hasPendingChanges;
}

- (unsigned)prominenceIndex
{
  return self->_prominenceIndex;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (BOOL)isInCanvas
{
  return self->_isInCanvas;
}

- (void)setIsInCanvas:(BOOL)a3
{
  self->_isInCanvas = a3;
}

- (void)serialize
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to serialize. error=%@");
}

- (void)unserialize:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d [AVC SPATIAL AUDIO] Failed to serialize. error=%@");
}

@end