@interface VCAudioSessionMediaProperties
- (AudioStreamBasicDescription)inputFormat;
- (AudioStreamBasicDescription)outputFormat;
- (BOOL)audioClockDeviceEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSessionActive;
- (BOOL)networkUplinkClockUsesBaseband;
- (double)preferredBlockSize;
- (double)preferredSampleRate;
- (id)description;
- (int)operatingMode;
- (int)processId;
- (unsigned)vpOperatingMode;
- (void)setAudioClockDeviceEnabled:(BOOL)a3;
- (void)setInputFormat:(AudioStreamBasicDescription *)a3;
- (void)setNetworkUplinkClockUsesBaseband:(BOOL)a3;
- (void)setOperatingMode:(int)a3;
- (void)setOutputFormat:(AudioStreamBasicDescription *)a3;
- (void)setPreferredBlockSize:(double)a3;
- (void)setPreferredSampleRate:(double)a3;
- (void)setProcessId:(int)a3;
- (void)setSessionActive:(BOOL)a3;
- (void)setVpOperatingMode:(unsigned int)a3;
@end

@implementation VCAudioSessionMediaProperties

- (BOOL)isEqual:(id)a3
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)objc_opt_class();
  if (!a3 || ([a3 isMemberOfClass:v5] & 1) == 0)
  {
    if ((VCAudioSessionMediaProperties *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return 0;
      }
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E4F47A50];
      BOOL v30 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v30) {
        return result;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 21;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = a3;
      *(_WORD *)&buf[38] = 2112;
      v99 = (VCAudioSessionMediaProperties *)NSStringFromClass(v5);
      v31 = " [%s] %s:%d VCAudioSessionMediaProperties property changed: object=%@ is nil or not of class=%@";
LABEL_66:
      v35 = v29;
      goto LABEL_67;
    }
    if (objc_opt_respondsToSelector()) {
      v17 = (__CFString *)[(VCAudioSessionMediaProperties *)self performSelector:sel_logPrefix];
    }
    else {
      v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v32 = VRTraceErrorLogLevelToCSTR();
    v33 = *MEMORY[0x1E4F47A50];
    BOOL v34 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v34) {
      return result;
    }
    *(_DWORD *)buf = 136316674;
    *(void *)&buf[4] = v32;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 21;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v17;
    *(_WORD *)&buf[38] = 2048;
    v99 = self;
    __int16 v100 = 2112;
    *(void *)v101 = a3;
    *(_WORD *)&v101[8] = 2112;
    v102 = NSStringFromClass(v5);
    v31 = " [%s] %s:%d %@(%p) VCAudioSessionMediaProperties property changed: object=%@ is nil or not of class=%@";
    v35 = v33;
LABEL_99:
    uint32_t v53 = 68;
    goto LABEL_100;
  }
  [a3 preferredSampleRate];
  double v7 = v6;
  if (v6 != self->_preferredSampleRate)
  {
    if ((VCAudioSessionMediaProperties *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        v18 = (__CFString *)[(VCAudioSessionMediaProperties *)self performSelector:sel_logPrefix];
      }
      else {
        v18 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return 0;
      }
      uint64_t v62 = VRTraceErrorLogLevelToCSTR();
      v63 = *MEMORY[0x1E4F47A50];
      BOOL v64 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v64) {
        return result;
      }
      double preferredSampleRate = self->_preferredSampleRate;
      *(_DWORD *)buf = 136316674;
      *(void *)&buf[4] = v62;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 26;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v18;
      *(_WORD *)&buf[38] = 2048;
      v99 = self;
      __int16 v100 = 2048;
      *(double *)v101 = preferredSampleRate;
      *(_WORD *)&v101[8] = 2048;
      v102 = *(NSString **)&v7;
      v31 = " [%s] %s:%d %@(%p) VCAudioSessionMediaProperties property changed: preferredSampleRate=%f became preferredSampleRate=%f";
LABEL_76:
      v35 = v63;
      goto LABEL_99;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v36 = VRTraceErrorLogLevelToCSTR();
    v37 = *MEMORY[0x1E4F47A50];
    BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v38) {
      return result;
    }
    double v39 = self->_preferredSampleRate;
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = v36;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 26;
    *(_WORD *)&buf[28] = 2048;
    *(double *)&buf[30] = v39;
    *(_WORD *)&buf[38] = 2048;
    v99 = *(VCAudioSessionMediaProperties **)&v7;
    v31 = " [%s] %s:%d VCAudioSessionMediaProperties property changed: preferredSampleRate=%f became preferredSampleRate=%f";
LABEL_49:
    v35 = v37;
LABEL_67:
    uint32_t v53 = 48;
    goto LABEL_100;
  }
  [a3 preferredBlockSize];
  double v9 = v8;
  if (v8 != self->_preferredBlockSize)
  {
    if ((VCAudioSessionMediaProperties *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        v19 = (__CFString *)[(VCAudioSessionMediaProperties *)self performSelector:sel_logPrefix];
      }
      else {
        v19 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return 0;
      }
      uint64_t v66 = VRTraceErrorLogLevelToCSTR();
      v63 = *MEMORY[0x1E4F47A50];
      BOOL v67 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v67) {
        return result;
      }
      double preferredBlockSize = self->_preferredBlockSize;
      *(_DWORD *)buf = 136316674;
      *(void *)&buf[4] = v66;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 29;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v19;
      *(_WORD *)&buf[38] = 2048;
      v99 = self;
      __int16 v100 = 2048;
      *(double *)v101 = preferredBlockSize;
      *(_WORD *)&v101[8] = 2048;
      v102 = *(NSString **)&v9;
      v31 = " [%s] %s:%d %@(%p) VCAudioSessionMediaProperties property changed: preferredBlockSize=%f became preferredBlockSize=%f";
      goto LABEL_76;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v40 = VRTraceErrorLogLevelToCSTR();
    v37 = *MEMORY[0x1E4F47A50];
    BOOL v41 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v41) {
      return result;
    }
    double v42 = self->_preferredBlockSize;
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = v40;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 29;
    *(_WORD *)&buf[28] = 2048;
    *(double *)&buf[30] = v42;
    *(_WORD *)&buf[38] = 2048;
    v99 = *(VCAudioSessionMediaProperties **)&v9;
    v31 = " [%s] %s:%d VCAudioSessionMediaProperties property changed: preferredBlockSize=%f became preferredBlockSize=%f";
    goto LABEL_49;
  }
  int v10 = [a3 vpOperatingMode];
  if (v10 != self->_vpOperatingMode)
  {
    int v20 = v10;
    if ((VCAudioSessionMediaProperties *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return 0;
      }
      uint64_t v43 = VRTraceErrorLogLevelToCSTR();
      v44 = *MEMORY[0x1E4F47A50];
      BOOL v45 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v45) {
        return result;
      }
      unsigned int vpOperatingMode = self->_vpOperatingMode;
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 32;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = vpOperatingMode;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v20;
      v31 = " [%s] %s:%d VCAudioSessionMediaProperties property changed: vpOperatingMode=%u became vpOperatingMode=%u";
      goto LABEL_59;
    }
    if (objc_opt_respondsToSelector()) {
      v21 = (__CFString *)[(VCAudioSessionMediaProperties *)self performSelector:sel_logPrefix];
    }
    else {
      v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v69 = VRTraceErrorLogLevelToCSTR();
    v70 = *MEMORY[0x1E4F47A50];
    BOOL v71 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v71) {
      return result;
    }
    unsigned int v72 = self->_vpOperatingMode;
    *(_DWORD *)buf = 136316674;
    *(void *)&buf[4] = v69;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 32;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v21;
    *(_WORD *)&buf[38] = 2048;
    v99 = self;
    __int16 v100 = 1024;
    *(_DWORD *)v101 = v72;
    *(_WORD *)&v101[4] = 1024;
    *(_DWORD *)&v101[6] = v20;
    v31 = " [%s] %s:%d %@(%p) VCAudioSessionMediaProperties property changed: vpOperatingMode=%u became vpOperatingMode=%u";
LABEL_89:
    v35 = v70;
    uint32_t v53 = 60;
    goto LABEL_100;
  }
  int v11 = [a3 networkUplinkClockUsesBaseband];
  if (self->_networkUplinkClockUsesBaseband != v11)
  {
    int v22 = v11;
    if ((VCAudioSessionMediaProperties *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return 0;
      }
      uint64_t v47 = VRTraceErrorLogLevelToCSTR();
      v44 = *MEMORY[0x1E4F47A50];
      BOOL v48 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v48) {
        return result;
      }
      BOOL networkUplinkClockUsesBaseband = self->_networkUplinkClockUsesBaseband;
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = v47;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 35;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = networkUplinkClockUsesBaseband;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v22;
      v31 = " [%s] %s:%d VCAudioSessionMediaProperties property changed: networkUplinkClockUsesBaseband=%u became network"
            "UplinkClockUsesBaseband=%u";
      goto LABEL_59;
    }
    if (objc_opt_respondsToSelector()) {
      v23 = (__CFString *)[(VCAudioSessionMediaProperties *)self performSelector:sel_logPrefix];
    }
    else {
      v23 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v73 = VRTraceErrorLogLevelToCSTR();
    v70 = *MEMORY[0x1E4F47A50];
    BOOL v74 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v74) {
      return result;
    }
    BOOL v75 = self->_networkUplinkClockUsesBaseband;
    *(_DWORD *)buf = 136316674;
    *(void *)&buf[4] = v73;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 35;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v23;
    *(_WORD *)&buf[38] = 2048;
    v99 = self;
    __int16 v100 = 1024;
    *(_DWORD *)v101 = v75;
    *(_WORD *)&v101[4] = 1024;
    *(_DWORD *)&v101[6] = v22;
    v31 = " [%s] %s:%d %@(%p) VCAudioSessionMediaProperties property changed: networkUplinkClockUsesBaseband=%u became ne"
          "tworkUplinkClockUsesBaseband=%u";
    goto LABEL_89;
  }
  int v12 = [a3 audioClockDeviceEnabled];
  if (self->_audioClockDeviceEnabled != v12)
  {
    int v24 = v12;
    if ((VCAudioSessionMediaProperties *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        v25 = (__CFString *)[(VCAudioSessionMediaProperties *)self performSelector:sel_logPrefix];
      }
      else {
        v25 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return 0;
      }
      uint64_t v76 = VRTraceErrorLogLevelToCSTR();
      v70 = *MEMORY[0x1E4F47A50];
      BOOL v77 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v77) {
        return result;
      }
      BOOL audioClockDeviceEnabled = self->_audioClockDeviceEnabled;
      *(_DWORD *)buf = 136316674;
      *(void *)&buf[4] = v76;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 38;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v25;
      *(_WORD *)&buf[38] = 2048;
      v99 = self;
      __int16 v100 = 1024;
      *(_DWORD *)v101 = audioClockDeviceEnabled;
      *(_WORD *)&v101[4] = 1024;
      *(_DWORD *)&v101[6] = v24;
      v31 = " [%s] %s:%d %@(%p) VCAudioSessionMediaProperties property changed: audioClockDeviceEnabled=%u became audioCl"
            "ockDeviceEnabled=%u";
      goto LABEL_89;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v50 = VRTraceErrorLogLevelToCSTR();
    v44 = *MEMORY[0x1E4F47A50];
    BOOL v51 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v51) {
      return result;
    }
    BOOL v52 = self->_audioClockDeviceEnabled;
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = v50;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 38;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v52;
    *(_WORD *)&buf[34] = 1024;
    *(_DWORD *)&buf[36] = v24;
    v31 = " [%s] %s:%d VCAudioSessionMediaProperties property changed: audioClockDeviceEnabled=%u became audioClockDeviceEnabled=%u";
LABEL_59:
    v35 = v44;
    uint32_t v53 = 40;
LABEL_100:
    _os_log_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_DEFAULT, v31, buf, v53);
    return 0;
  }
  *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v96 = v13;
  long long v97 = v13;
  *(_OWORD *)__str = v13;
  long long v95 = v13;
  *(_OWORD *)v90 = v13;
  long long v91 = v13;
  long long v92 = v13;
  long long v93 = v13;
  objc_msgSend(a3, "inputFormat", -1, v13, v13);
  p_inputFormat = &self->_inputFormat;
  if (!memcmp(v88, &self->_inputFormat, 0x28uLL))
  {
    [a3 outputFormat];
    v88[0] = *(_OWORD *)buf;
    v88[1] = *(_OWORD *)&buf[16];
    uint64_t v89 = *(void *)&buf[32];
    p_outputFormat = &self->_outputFormat;
    if (!memcmp(v88, &self->_outputFormat, 0x28uLL)) {
      return 1;
    }
    if ((VCAudioSessionMediaProperties *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        v27 = (__CFString *)[(VCAudioSessionMediaProperties *)self performSelector:sel_logPrefix];
      }
      else {
        v27 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return 0;
      }
      uint64_t v84 = VRTraceErrorLogLevelToCSTR();
      v80 = *MEMORY[0x1E4F47A50];
      BOOL v85 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (v85)
      {
        v86 = FormatToCStr((uint64_t)&self->_outputFormat, __str, 0x40uLL);
        v87 = FormatToCStr((uint64_t)v88, v90, 0x40uLL);
        *(_DWORD *)buf = 136316674;
        *(void *)&buf[4] = v84;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 46;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v27;
        *(_WORD *)&buf[38] = 2048;
        v99 = self;
        __int16 v100 = 2080;
        *(void *)v101 = v86;
        *(_WORD *)&v101[8] = 2080;
        v102 = (NSString *)v87;
        v31 = " [%s] %s:%d %@(%p) VCAudioSessionMediaProperties property changed: outputFormat=%s became outputFormat=%s";
        goto LABEL_98;
      }
      return result;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v58 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E4F47A50];
      BOOL v59 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v59) {
        return result;
      }
      v60 = FormatToCStr((uint64_t)p_outputFormat, __str, 0x40uLL);
      v61 = FormatToCStr((uint64_t)v88, v90, 0x40uLL);
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = v58;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 46;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = v60;
      *(_WORD *)&buf[38] = 2080;
      v99 = (VCAudioSessionMediaProperties *)v61;
      v31 = " [%s] %s:%d VCAudioSessionMediaProperties property changed: outputFormat=%s became outputFormat=%s";
      goto LABEL_66;
    }
    return 0;
  }
  if ((VCAudioSessionMediaProperties *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v54 = VRTraceErrorLogLevelToCSTR();
    v29 = *MEMORY[0x1E4F47A50];
    BOOL v55 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v55) {
      return result;
    }
    v56 = FormatToCStr((uint64_t)p_inputFormat, __str, 0x40uLL);
    v57 = FormatToCStr((uint64_t)v88, v90, 0x40uLL);
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = v54;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 43;
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = v56;
    *(_WORD *)&buf[38] = 2080;
    v99 = (VCAudioSessionMediaProperties *)v57;
    v31 = " [%s] %s:%d VCAudioSessionMediaProperties property changed: inputFormat=%s became inputFormat=%s";
    goto LABEL_66;
  }
  if (objc_opt_respondsToSelector()) {
    v26 = (__CFString *)[(VCAudioSessionMediaProperties *)self performSelector:sel_logPrefix];
  }
  else {
    v26 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
    return 0;
  }
  uint64_t v79 = VRTraceErrorLogLevelToCSTR();
  v80 = *MEMORY[0x1E4F47A50];
  BOOL v81 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v81)
  {
    v82 = FormatToCStr((uint64_t)&self->_inputFormat, __str, 0x40uLL);
    v83 = FormatToCStr((uint64_t)v88, v90, 0x40uLL);
    *(_DWORD *)buf = 136316674;
    *(void *)&buf[4] = v79;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[VCAudioSessionMediaProperties isEqual:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 43;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v26;
    *(_WORD *)&buf[38] = 2048;
    v99 = self;
    __int16 v100 = 2080;
    *(void *)v101 = v82;
    *(_WORD *)&v101[8] = 2080;
    v102 = (NSString *)v83;
    v31 = " [%s] %s:%d %@(%p) VCAudioSessionMediaProperties property changed: inputFormat=%s became inputFormat=%s";
LABEL_98:
    v35 = v80;
    goto LABEL_99;
  }
  return result;
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v20 = v3;
  long long v21 = v3;
  *(_OWORD *)__str = v3;
  long long v19 = v3;
  long long v16 = v3;
  long long v17 = v3;
  *(_OWORD *)v14 = v3;
  long long v15 = v3;
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  double preferredSampleRate = self->_preferredSampleRate;
  double preferredBlockSize = self->_preferredBlockSize;
  Float64 mSampleRate = self->_inputFormat.mSampleRate;
  uint64_t operatingMode = self->_operatingMode;
  uint64_t vpOperatingMode = self->_vpOperatingMode;
  int v12 = FormatToCStr((uint64_t)&self->_inputFormat, __str, 0x40uLL);
  return (id)[v4 stringWithFormat:@"%@: sampleRate=%f blockSize=%f, operatingMode=%d, VP=%d, sampleRateIn=%f, inputFormat=%s, sampleRateOut=%f, outputFormat=%s, processId=%d, active=%d, audioClockDeviceEnabled=%d, networkUplinkClockUsesBaseband=%d", v6, *(void *)&preferredSampleRate, *(void *)&preferredBlockSize, operatingMode, vpOperatingMode, *(void *)&mSampleRate, v12, *(void *)&self->_outputFormat.mSampleRate, FormatToCStr((uint64_t)&self->_outputFormat, v14, 0x40uLL), self->_processId, self->_sessionActive, self->_audioClockDeviceEnabled, self->_networkUplinkClockUsesBaseband];
}

- (double)preferredBlockSize
{
  return self->_preferredBlockSize;
}

- (void)setPreferredBlockSize:(double)a3
{
  self->_double preferredBlockSize = a3;
}

- (double)preferredSampleRate
{
  return self->_preferredSampleRate;
}

- (void)setPreferredSampleRate:(double)a3
{
  self->_double preferredSampleRate = a3;
}

- (int)operatingMode
{
  return self->_operatingMode;
}

- (void)setOperatingMode:(int)a3
{
  self->_uint64_t operatingMode = a3;
}

- (unsigned)vpOperatingMode
{
  return self->_vpOperatingMode;
}

- (void)setVpOperatingMode:(unsigned int)a3
{
  self->_uint64_t vpOperatingMode = a3;
}

- (AudioStreamBasicDescription)inputFormat
{
  long long v3 = *(_OWORD *)&self[1].mFormatID;
  *(_OWORD *)&retstr->Float64 mSampleRate = *(_OWORD *)&self->mBitsPerChannel;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[1].mBytesPerFrame;
  return self;
}

- (void)setInputFormat:(AudioStreamBasicDescription *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleRate;
  long long v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_inputFormat.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_inputFormat.Float64 mSampleRate = v3;
  *(_OWORD *)&self->_inputFormat.mBytesPerPacket = v4;
}

- (AudioStreamBasicDescription)outputFormat
{
  long long v3 = *(_OWORD *)&self[2].mFormatID;
  *(_OWORD *)&retstr->Float64 mSampleRate = *(_OWORD *)&self[1].mBitsPerChannel;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[2].mBytesPerFrame;
  return self;
}

- (void)setOutputFormat:(AudioStreamBasicDescription *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleRate;
  long long v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_outputFormat.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_outputFormat.mBytesPerPacket = v4;
  *(_OWORD *)&self->_outputFormat.Float64 mSampleRate = v3;
}

- (int)processId
{
  return self->_processId;
}

- (void)setProcessId:(int)a3
{
  self->_processId = a3;
}

- (BOOL)isSessionActive
{
  return self->_sessionActive;
}

- (void)setSessionActive:(BOOL)a3
{
  self->_sessionActive = a3;
}

- (BOOL)audioClockDeviceEnabled
{
  return self->_audioClockDeviceEnabled;
}

- (void)setAudioClockDeviceEnabled:(BOOL)a3
{
  self->_BOOL audioClockDeviceEnabled = a3;
}

- (BOOL)networkUplinkClockUsesBaseband
{
  return self->_networkUplinkClockUsesBaseband;
}

- (void)setNetworkUplinkClockUsesBaseband:(BOOL)a3
{
  self->_BOOL networkUplinkClockUsesBaseband = a3;
}

@end