@interface VCSessionBitrateArbiter
- (BOOL)rangeCheck:(unsigned int)a3;
- (VCSessionBitrateArbiter)init;
- (unsigned)bitrateForStoreBagKey:(id)a3 connectionType:(int)a4 currentBitrate:(unsigned int)a5 isExpensive:(BOOL)a6;
- (unsigned)maxBitrate2GDownlink;
- (unsigned)maxBitrate2GUplink;
- (unsigned)maxBitrate3GDownlink;
- (unsigned)maxBitrate3GUplink;
- (unsigned)maxBitrateExpensiveDownlink;
- (unsigned)maxBitrateExpensiveUplink;
- (unsigned)maxBitrateNonExpensiveDownlink;
- (unsigned)maxBitrateNonExpensiveUplink;
- (unsigned)maxBitrateWiFiDownlink;
- (unsigned)maxBitrateWiFiUplink;
- (void)dealloc;
- (void)readHardwareValues;
- (void)readStoreBagValues;
@end

@implementation VCSessionBitrateArbiter

- (VCSessionBitrateArbiter)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCSessionBitrateArbiter;
  v2 = [(VCSessionBitrateArbiter *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(VCSessionBitrateArbiter *)v2 readHardwareValues];
    [(VCSessionBitrateArbiter *)v3 readStoreBagValues];
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionBitrateArbiter;
  [(VCSessionBitrateArbiter *)&v3 dealloc];
}

- (BOOL)rangeCheck:(unsigned int)a3
{
  unsigned int v3 = a3 - 100000;
  if (a3 - 100000 >= 0x5F98A9 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      [(VCSessionBitrateArbiter *)v5 rangeCheck:v6];
    }
  }
  return v3 < 0x5F98A9;
}

- (void)readHardwareValues
{
  *(_OWORD *)&self->_maxBitrate2GUplink = xmmword_1E25A0200;
  *(_OWORD *)&self->_maxBitrateExpensiveUplink = xmmword_1E25A0210;
  *(int32x2_t *)&self->_maxBitrateWiFiUplink = vdup_n_s32(0x611F48u);
}

- (unsigned)bitrateForStoreBagKey:(id)a3 connectionType:(int)a4 currentBitrate:(unsigned int)a5 isExpensive:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 1000
      * objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_currentSettings, "objectForKeyedSubscript:"), "intValue");
  if ([(VCSessionBitrateArbiter *)self rangeCheck:v11])
  {
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (!a5)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E4F47A50];
        a5 = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return a5;
        }
        int v18 = 136316674;
        uint64_t v19 = v15;
        __int16 v20 = 2080;
        v21 = "-[VCSessionBitrateArbiter bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:]";
        __int16 v22 = 1024;
        int v23 = 96;
        __int16 v24 = 1024;
        *(_DWORD *)v25 = a4;
        *(_WORD *)&v25[4] = 1024;
        *(_DWORD *)&v25[6] = v6;
        *(_WORD *)v26 = 2112;
        *(void *)&v26[2] = a3;
        __int16 v27 = 1024;
        int v28 = v11;
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Hardware does not support connection type %d isExpensive %d, ignored %@ storebag value of %d", (uint8_t *)&v18, 0x38u);
      }
      return 0;
    }
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136316674;
        uint64_t v19 = v13;
        __int16 v20 = 2080;
        v21 = "-[VCSessionBitrateArbiter bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:]";
        __int16 v22 = 1024;
        int v23 = 93;
        __int16 v24 = 2112;
        *(void *)v25 = a3;
        *(_WORD *)&v25[8] = 1024;
        *(_DWORD *)v26 = a4;
        *(_WORD *)&v26[4] = 1024;
        *(_DWORD *)&v26[6] = v6;
        __int16 v27 = 1024;
        int v28 = v11;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Overriding %@ for connection type %d isExpensive %d with storebag value of %d", (uint8_t *)&v18, 0x38u);
      }
    }
    return v11;
  }
  return a5;
}

- (void)readStoreBagValues
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_currentSettings = (NSDictionary *)+[GKSConnectivitySettings getAllSettings];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      currentSettings = self->_currentSettings;
      if (currentSettings) {
        BOOL v6 = [(NSString *)[(NSDictionary *)currentSettings description] UTF8String];
      }
      else {
        BOOL v6 = "<nil>";
      }
      int v7 = 136315906;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      v10 = "-[VCSessionBitrateArbiter readStoreBagValues]";
      __int16 v11 = 1024;
      int v12 = 106;
      __int16 v13 = 2080;
      v14 = v6;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Current bag settings: %s\n", (uint8_t *)&v7, 0x26u);
    }
  }
  self->_maxBitrate2GUplink = [(VCSessionBitrateArbiter *)self bitrateForStoreBagKey:@"vc-max-bitrate-2g-uplink" connectionType:0 currentBitrate:self->_maxBitrate2GUplink isExpensive:1];
  self->_maxBitrate2GDownlink = [(VCSessionBitrateArbiter *)self bitrateForStoreBagKey:@"vc-max-bitrate-2g-downlink" connectionType:0 currentBitrate:self->_maxBitrate2GDownlink isExpensive:1];
  self->_maxBitrate3GUplink = [(VCSessionBitrateArbiter *)self bitrateForStoreBagKey:@"vc-max-bitrate-3g-uplink" connectionType:1 currentBitrate:self->_maxBitrate3GUplink isExpensive:1];
  self->_maxBitrate3GDownlink = [(VCSessionBitrateArbiter *)self bitrateForStoreBagKey:@"vc-max-bitrate-3g-downlink" connectionType:1 currentBitrate:self->_maxBitrate3GDownlink isExpensive:1];
  self->_maxBitrateExpensiveUplink = [(VCSessionBitrateArbiter *)self bitrateForStoreBagKey:@"vc-max-bitrate-lte-uplink" connectionType:2 currentBitrate:self->_maxBitrateExpensiveUplink isExpensive:1];
  self->_maxBitrateNonExpensiveUplink = [(VCSessionBitrateArbiter *)self bitrateForStoreBagKey:@"vc-max-bitrate-nonexpensive-uplink" connectionType:6 currentBitrate:self->_maxBitrateNonExpensiveUplink isExpensive:0];
  self->_maxBitrateExpensiveDownlink = [(VCSessionBitrateArbiter *)self bitrateForStoreBagKey:@"vc-max-bitrate-lte-downlink" connectionType:2 currentBitrate:self->_maxBitrateExpensiveDownlink isExpensive:1];
  self->_maxBitrateNonExpensiveDownlink = [(VCSessionBitrateArbiter *)self bitrateForStoreBagKey:@"vc-max-bitrate-nonexpensive-downlink" connectionType:6 currentBitrate:self->_maxBitrateNonExpensiveDownlink isExpensive:0];
  if ((VRTraceIsInternalOSInstalled() & 1) == 0) {
    self->_maxBitrateWiFiUplink = [(VCSessionBitrateArbiter *)self bitrateForStoreBagKey:@"vc-max-bitrate-wifi-uplink" connectionType:3 currentBitrate:self->_maxBitrateWiFiUplink isExpensive:0];
  }
  self->_maxBitrateWiFiDownlink = [(VCSessionBitrateArbiter *)self bitrateForStoreBagKey:@"vc-max-bitrate-wifi-downlink" connectionType:3 currentBitrate:self->_maxBitrateWiFiDownlink isExpensive:0];
}

- (unsigned)maxBitrate2GUplink
{
  return self->_maxBitrate2GUplink;
}

- (unsigned)maxBitrate3GUplink
{
  return self->_maxBitrate3GUplink;
}

- (unsigned)maxBitrateWiFiUplink
{
  return self->_maxBitrateWiFiUplink;
}

- (unsigned)maxBitrate2GDownlink
{
  return self->_maxBitrate2GDownlink;
}

- (unsigned)maxBitrate3GDownlink
{
  return self->_maxBitrate3GDownlink;
}

- (unsigned)maxBitrateWiFiDownlink
{
  return self->_maxBitrateWiFiDownlink;
}

- (unsigned)maxBitrateExpensiveUplink
{
  return self->_maxBitrateExpensiveUplink;
}

- (unsigned)maxBitrateNonExpensiveUplink
{
  return self->_maxBitrateNonExpensiveUplink;
}

- (unsigned)maxBitrateExpensiveDownlink
{
  return self->_maxBitrateExpensiveDownlink;
}

- (unsigned)maxBitrateNonExpensiveDownlink
{
  return self->_maxBitrateNonExpensiveDownlink;
}

- (void)rangeCheck:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  BOOL v6 = "-[VCSessionBitrateArbiter rangeCheck:]";
  __int16 v7 = 1024;
  int v8 = 66;
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCSessionBitrateArbiter: value %d failed bitrate range check, ignored", (uint8_t *)&v3, 0x22u);
}

@end