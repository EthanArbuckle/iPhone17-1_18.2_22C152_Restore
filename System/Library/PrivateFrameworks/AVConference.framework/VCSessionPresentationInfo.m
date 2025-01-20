@interface VCSessionPresentationInfo
+ (BOOL)supportsSecureCoding;
+ (unsigned)avcLayoutWithLayout:(unsigned int)a3;
+ (unsigned)avcUIStateWithUIState:(unsigned __int8)a3;
+ (unsigned)layoutWithAVCLayout:(unsigned int)a3;
+ (unsigned)metadataSateWithUIState:(unsigned __int8)a3;
+ (unsigned)uiStateWithAVCUIState:(unsigned __int8)a3;
- (BOOL)hasPendingChanges;
- (VCSessionPresentationInfo)init;
- (VCSessionPresentationInfo)initWithCoder:(id)a3;
- (const)metadataGlobalInfo;
- (id)description;
- (id)serialize;
- (tagAVCSessionPresentationInfo)avcSessionPresentationInfo;
- (unsigned)uiState;
- (void)encodeWithCoder:(id)a3;
- (void)serialize;
- (void)setAvcSessionPresentationInfo:(tagAVCSessionPresentationInfo *)a3;
- (void)setDisplayID:(unsigned int)a3;
- (void)unserialize:(id)a3;
@end

@implementation VCSessionPresentationInfo

- (VCSessionPresentationInfo)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCSessionPresentationInfo;
  v2 = [(VCSessionPresentationInfo *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_hasPendingChanges = 0;
    v2->_displayID = 0;
    [(VCSessionPresentationInfo *)v2 setDisplayID:0];
  }
  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"displayRect=[%.0f, %.0f, %.0f, %.0f] layout=%u state=%u", *(void *)&self->_appWindowRect.origin.x, *(void *)&self->_appWindowRect.origin.y, *(void *)&self->_appWindowRect.size.width, *(void *)&self->_appWindowRect.size.height, self->_uiLayout, self->_uiState];
}

- (void)setDisplayID:(unsigned int)a3
{
  self->_displaySize.width = (double)[+[VCHardwareSettingsEmbedded sharedInstance] screenWidth];
  self->_displaySize.height = (double)[+[VCHardwareSettingsEmbedded sharedInstance] screenHeight];
  self->_displayID = a3;
}

+ (unsigned)layoutWithAVCLayout:(unsigned int)a3
{
  return 0;
}

+ (unsigned)avcLayoutWithLayout:(unsigned int)a3
{
  return 0;
}

+ (unsigned)uiStateWithAVCUIState:(unsigned __int8)a3
{
  if (a3 >= 4u) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (unsigned)avcUIStateWithUIState:(unsigned __int8)a3
{
  if (a3 >= 4u) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (unsigned)metadataSateWithUIState:(unsigned __int8)a3
{
  return a3 != 2;
}

- (id)serialize
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  v3 = (void *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:v5];
  if (v5[0])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionPresentationInfo serialize]();
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
        -[VCSessionPresentationInfo unserialize:]();
      }
    }
  }
  else
  {
    uint64_t v5 = v4;
    if (*(_DWORD *)(v4 + 8) != self->_displayID)
    {
      -[VCSessionPresentationInfo setDisplayID:](self, "setDisplayID:");
      self->_hasPendingChanges = 1;
    }
    unsigned int v6 = *(_DWORD *)(v5 + 64);
    if (v6 != self->_uiLayout)
    {
      self->_uiLayout = v6;
      self->_hasPendingChanges = 1;
    }
    int v7 = *(unsigned __int8 *)(v5 + 68);
    if (v7 != self->_uiState)
    {
      self->_uiState = v7;
      self->_hasPendingChanges = 1;
    }
    double v8 = *(double *)(v5 + 32);
    if (v8 != self->_appWindowRect.origin.x)
    {
      self->_appWindowRect.origin.x = v8;
      self->_hasPendingChanges = 1;
    }
    double v9 = *(double *)(v5 + 40);
    if (v9 != self->_appWindowRect.origin.y)
    {
      self->_appWindowRect.origin.y = v9;
      self->_hasPendingChanges = 1;
    }
    double v10 = *(double *)(v5 + 48);
    if (v10 != self->_appWindowRect.size.width)
    {
      self->_appWindowRect.size.width = v10;
      self->_hasPendingChanges = 1;
    }
    double v11 = *(double *)(v5 + 56);
    if (v11 != self->_appWindowRect.size.height)
    {
      self->_appWindowRect.size.height = v11;
      self->_hasPendingChanges = 1;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(VCSessionPresentationInfo *)self description];
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v12;
        __int16 v18 = 2080;
        v19 = "-[VCSessionPresentationInfo unserialize:]";
        __int16 v20 = 1024;
        int v21 = 157;
        __int16 v22 = 2112;
        id v23 = v14;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [AVC SPATIAL AUDIO] Updated presentation info: %@", buf, 0x26u);
      }
    }
  }
}

- (tagAVCSessionPresentationInfo)avcSessionPresentationInfo
{
  CGSize size = self->_appWindowRect.size;
  retstr->var0.origin = self->_appWindowRect.origin;
  retstr->var0.CGSize size = size;
  retstr->var1 = self->_displayID;
  retstr->var2 = +[VCSessionPresentationInfo avcLayoutWithLayout:self->_uiLayout];
  result = (tagAVCSessionPresentationInfo *)+[VCSessionPresentationInfo avcUIStateWithUIState:self->_uiState];
  retstr->var3 = result;
  return result;
}

- (void)setAvcSessionPresentationInfo:(tagAVCSessionPresentationInfo *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = +[VCSessionPresentationInfo uiStateWithAVCUIState:a3->var3];
  unsigned int v6 = +[VCSessionPresentationInfo layoutWithAVCLayout:a3->var2];
  if (a3->var1 != self->_displayID)
  {
    -[VCSessionPresentationInfo setDisplayID:](self, "setDisplayID:");
    self->_hasPendingChanges = 1;
  }
  if (a3->var0.origin.x != self->_appWindowRect.origin.x)
  {
    self->_appWindowRect.origin.x = a3->var0.origin.x;
    self->_hasPendingChanges = 1;
  }
  double y = a3->var0.origin.y;
  if (y != self->_appWindowRect.origin.y)
  {
    self->_appWindowRect.origin.double y = y;
    self->_hasPendingChanges = 1;
  }
  double width = a3->var0.size.width;
  if (width != self->_appWindowRect.size.width)
  {
    self->_appWindowRect.size.double width = width;
    self->_hasPendingChanges = 1;
  }
  double height = a3->var0.size.height;
  if (height != self->_appWindowRect.size.height)
  {
    self->_appWindowRect.size.double height = height;
    self->_hasPendingChanges = 1;
  }
  if (v6 != self->_uiLayout)
  {
    self->_uiLayout = v6;
    self->_hasPendingChanges = 1;
  }
  if (v5 != self->_uiState)
  {
    self->_uiState = v5;
    self->_hasPendingChanges = 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    double v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315906;
      uint64_t v13 = v10;
      __int16 v14 = 2080;
      uint64_t v15 = "-[VCSessionPresentationInfo setAvcSessionPresentationInfo:]";
      __int16 v16 = 1024;
      int v17 = 188;
      __int16 v18 = 2112;
      v19 = self;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [AVC SPATIAL AUDIO] %@", (uint8_t *)&v12, 0x26u);
    }
  }
}

- (const)metadataGlobalInfo
{
  v2 = self;
  unsigned int displayID = self->_displayID;
  float32x4_t v7 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)self->_displaySize), (float64x2_t)self->_appWindowRect.size);
  float32x2_t v4 = vcvt_f32_f64((float64x2_t)self->_appWindowRect.origin);
  unsigned int v5 = +[VCSessionPresentationInfo metadataSateWithUIState:self->_uiState];
  v2->_metadataGlobalInfo.unsigned int displayID = displayID;
  v2 = (VCSessionPresentationInfo *)((char *)v2 + 72);
  *(float32x4_t *)((char *)&v2->super.isa + 4) = v7;
  *(float32x2_t *)((char *)&v2->_displaySize.width + 4) = v4;
  HIDWORD(v2->_displaySize.height) = 0;
  LODWORD(v2->_appWindowRect.origin.x) = v5;
  return (const tagVCSpatialAudioMetadataGlobalInfo *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  CGFloat x = self->_appWindowRect.origin.x;
  if (x != 0.0)
  {
    *(float *)&CGFloat x = x;
    [a3 encodeFloat:kVCSessionPresentationInfoAppWindowRectX forKey:x];
  }
  CGFloat y = self->_appWindowRect.origin.y;
  if (y != 0.0)
  {
    *(float *)&CGFloat y = y;
    [a3 encodeFloat:kVCSessionPresentationInfoAppWindowRectY forKey:y];
  }
  CGFloat width = self->_appWindowRect.size.width;
  *(float *)&CGFloat width = width;
  [a3 encodeFloat:kVCSessionPresentationInfoAppWindowRectW forKey:width];
  CGFloat height = self->_appWindowRect.size.height;
  *(float *)&CGFloat height = height;
  [a3 encodeFloat:kVCSessionPresentationInfoAppWindowRectH forKey:height];
  uint64_t displayID = self->_displayID;
  if (displayID) {
    [a3 encodeInt32:displayID forKey:kVCSessionPresentationInfoDisplayID];
  }
  uint64_t uiLayout = self->_uiLayout;
  if (uiLayout) {
    [a3 encodeInt32:uiLayout forKey:kVCSessionPresentationInfoUILayout];
  }
  if (self->_uiState)
  {
    objc_msgSend(a3, "encodeInt32:forKey:");
  }
}

- (VCSessionPresentationInfo)initWithCoder:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VCSessionPresentationInfo;
  float32x2_t v4 = [(VCSessionPresentationInfo *)&v10 init];
  if (v4)
  {
    if ([a3 containsValueForKey:kVCSessionPresentationInfoAppWindowRectX])
    {
      [a3 decodeFloatForKey:kVCSessionPresentationInfoAppWindowRectX];
      v4->_appWindowRect.origin.CGFloat x = v5;
    }
    if ([a3 containsValueForKey:kVCSessionPresentationInfoAppWindowRectY])
    {
      [a3 decodeFloatForKey:kVCSessionPresentationInfoAppWindowRectY];
      v4->_appWindowRect.origin.CGFloat y = v6;
    }
    if ([a3 containsValueForKey:kVCSessionPresentationInfoAppWindowRectW])
    {
      [a3 decodeFloatForKey:kVCSessionPresentationInfoAppWindowRectW];
      v4->_appWindowRect.size.CGFloat width = v7;
    }
    if ([a3 containsValueForKey:kVCSessionPresentationInfoAppWindowRectH])
    {
      [a3 decodeFloatForKey:kVCSessionPresentationInfoAppWindowRectH];
      v4->_appWindowRect.size.CGFloat height = v8;
    }
    if ([a3 containsValueForKey:kVCSessionPresentationInfoDisplayID]) {
      v4->_uint64_t displayID = [a3 decodeInt32ForKey:kVCSessionPresentationInfoDisplayID];
    }
    if ([a3 containsValueForKey:kVCSessionPresentationInfoUILayout]) {
      v4->_uint64_t uiLayout = [a3 decodeInt32ForKey:kVCSessionPresentationInfoUILayout];
    }
    if ([a3 containsValueForKey:kVCSessionPresentationInfoUIState]) {
      v4->_uiState = [a3 decodeInt32ForKey:kVCSessionPresentationInfoUIState];
    }
  }
  return v4;
}

- (BOOL)hasPendingChanges
{
  return self->_hasPendingChanges;
}

- (unsigned)uiState
{
  return self->_uiState;
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