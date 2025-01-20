@interface VCSwitchManager
- (BOOL)isLocalSwitchEnabled:(unsigned int)a3;
- (BOOL)isSwitchEnabled:(unsigned int)a3;
- (id)description;
- (unsigned)applyNegotiationRulesUsingLocalSwitches:(unsigned int)a3 negotiatedSwitches:(unsigned int)a4;
- (unsigned)localSwitches;
- (unsigned)negotiatedSwitches;
- (unsigned)remoteSwitches;
- (void)initializeLocalSwitches;
- (void)negotiateSwitches;
- (void)negotiateSwitchesForIsCaller:(BOOL)a3;
- (void)setLocalSwitches:(unsigned int)a3;
- (void)setNegotiatedSwitches:(unsigned int)a3;
- (void)setRemoteSwitches:(unsigned int)a3;
- (void)setRemoteSwitches:(unsigned int)a3 isCaller:(BOOL)a4;
- (void)setupLocalABTestSwitches;
- (void)setupLocalAudioTestGroupSwitches;
- (void)setupLocalDuplicationTestGroupSwitches;
- (void)setupLocalNetworkTestGroupSwitches;
- (void)setupLocalOnOffSwitches;
- (void)setupLocalOnOffSwitchesFromMasterSwitch;
- (void)setupLocalRateControlTestGroupSwitches;
- (void)setupLocalSwitchesIndividually;
- (void)setupLocalVideoTestGroupSwitches;
- (void)updateDuplicationEnhancementSwitches;
@end

@implementation VCSwitchManager

- (void)initializeLocalSwitches
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (VCDefaults_GetBoolValueForKey(@"enableDiscreteSwitchSettingsForTesting", 0)
    || +[GKSConnectivitySettings getAbTestingState] == 1)
  {
    [(VCSwitchManager *)self setupLocalSwitchesIndividually];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315650;
        uint64_t v9 = v3;
        __int16 v10 = 2080;
        v11 = "-[VCSwitchManager initializeLocalSwitches]";
        __int16 v12 = 1024;
        int v13 = 51;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SwitchManager: Setting individual local switches for the purpose of QA testing", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
  else
  {
    self->_unsigned int localSwitches = +[GKSConnectivitySettings getAbTestMasterLocalSwitches];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int localSwitches = self->_localSwitches;
        int v8 = 136315906;
        uint64_t v9 = v5;
        __int16 v10 = 2080;
        v11 = "-[VCSwitchManager initializeLocalSwitches]";
        __int16 v12 = 1024;
        int v13 = 65;
        __int16 v14 = 1024;
        unsigned int v15 = localSwitches;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SwitchManager: Non-seed build - using master local switch: %08X", (uint8_t *)&v8, 0x22u);
      }
    }
    [(VCSwitchManager *)self updateDuplicationEnhancementSwitches];
  }
}

- (void)setupLocalOnOffSwitches
{
  [(VCSwitchManager *)self setupLocalOnOffSwitchesFromMasterSwitch];
  double v3 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:32];
  self->_localSwitches |= 32 * (v3 <= v4);
  double v5 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x20000];
  self->_localSwitches |= (v5 <= v6) << 17;
  double v7 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x40000];
  self->_localSwitches |= (v7 <= v8) << 18;
  double v9 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x80000];
  self->_localSwitches |= (v9 <= v10) << 19;
  double v11 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x100000];
  self->_localSwitches |= (v11 <= v12) << 20;
  double v13 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x200000];
  self->_localSwitches |= (v13 <= v14) << 21;
  double v15 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x800000];
  self->_localSwitches |= (v15 <= v16) << 23;
  double v17 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x1000000];
  self->_localSwitches |= (v17 <= v18) << 24;
  double v19 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x2000000];
  self->_localSwitches |= (v19 <= v20) << 25;
  double v21 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x4000000];
  self->_localSwitches |= (v21 <= v22) << 26;
  double v23 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x8000000];
  self->_localSwitches |= (v23 <= v24) << 27;
  double v25 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x10000000];
  self->_localSwitches |= (v25 <= v26) << 28;
  double v27 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x20000000];
  self->_localSwitches |= (v27 <= v28) << 29;
  double v29 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x40000000];
  self->_localSwitches |= (v29 <= v30) << 30;
}

- (void)setupLocalABTestSwitches
{
  [(VCSwitchManager *)self setupLocalAudioTestGroupSwitches];
  [(VCSwitchManager *)self setupLocalVideoTestGroupSwitches];
  [(VCSwitchManager *)self setupLocalNetworkTestGroupSwitches];
  [(VCSwitchManager *)self setupLocalRateControlTestGroupSwitches];

  [(VCSwitchManager *)self setupLocalDuplicationTestGroupSwitches];
}

- (void)setupLocalSwitchesIndividually
{
  self->_unsigned int localSwitches = 0;
  double v3 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:1];
  self->_localSwitches |= v3 <= v4;
  double v5 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:2];
  self->_localSwitches |= 2 * (v5 <= v6);
  double v7 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:4];
  self->_localSwitches |= 4 * (v7 <= v8);
  double v9 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:8];
  self->_localSwitches |= 8 * (v9 <= v10);
  double v11 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:16];
  self->_localSwitches |= 16 * (v11 <= v12);
  double v13 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:32];
  self->_localSwitches |= 32 * (v13 <= v14);
  double v15 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:64];
  self->_localSwitches |= (v15 <= v16) << 6;
  double v17 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:128];
  self->_localSwitches |= (v17 <= v18) << 7;
  double v19 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:256];
  self->_localSwitches |= (v19 <= v20) << 8;
  double v21 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:512];
  self->_localSwitches |= (v21 <= v22) << 9;
  double v23 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:1024];
  self->_localSwitches |= (v23 <= v24) << 10;
  double v25 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:2048];
  self->_localSwitches |= (v25 <= v26) << 11;
  double v27 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:4096];
  self->_localSwitches |= (v27 <= v28) << 12;
  double v29 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x2000];
  self->_localSwitches |= (v29 <= v30) << 13;
  double v31 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x4000];
  self->_localSwitches |= (v31 <= v32) << 14;
  double v33 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x8000];
  self->_localSwitches |= (v33 <= v34) << 15;
  double v35 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x10000];
  self->_localSwitches |= (v35 <= v36) << 16;
  double v37 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x20000];
  self->_localSwitches |= (v37 <= v38) << 17;
  double v39 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x40000];
  self->_localSwitches |= (v39 <= v40) << 18;
  double v41 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x80000];
  self->_localSwitches |= (v41 <= v42) << 19;
  double v43 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x100000];
  self->_localSwitches |= (v43 <= v44) << 20;
  double v45 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x200000];
  self->_localSwitches |= (v45 <= v46) << 21;
  double v47 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x400000];
  self->_localSwitches |= (v47 <= v48) << 22;
  double v49 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x800000];
  self->_localSwitches |= (v49 <= v50) << 23;
  double v51 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x1000000];
  self->_localSwitches |= (v51 <= v52) << 24;
  double v53 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x2000000];
  self->_localSwitches |= (v53 <= v54) << 25;
  double v55 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x4000000];
  self->_localSwitches |= (v55 <= v56) << 26;
  double v57 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x8000000];
  self->_localSwitches |= (v57 <= v58) << 27;
  double v59 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x10000000];
  self->_localSwitches |= (v59 <= v60) << 28;
  double v61 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x20000000];
  self->_localSwitches |= (v61 <= v62) << 29;
  double v63 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:0x40000000];
  self->_localSwitches |= (v63 <= v64) << 30;
}

- (void)setupLocalOnOffSwitchesFromMasterSwitch
{
  self->_localSwitches |= +[GKSConnectivitySettings getAbTestMasterLocalSwitches] & 0x403800;
}

- (void)setupLocalAudioTestGroupSwitches
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v3 = objc_msgSend(+[GKSConnectivitySettings getTestGroupPermutations:](GKSConnectivitySettings, "getTestGroupPermutations:", 0), "componentsSeparatedByString:", @",");
  if ([v3 count])
  {
    int v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v3, "count"))), "unsignedIntValue");
    self->_localSwitches |= (2 * (v4 & 1)) | ((v4 & 2) << 13) | ((v4 & 2) << 14);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      double v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315906;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        double v10 = "-[VCSwitchManager setupLocalAudioTestGroupSwitches]";
        __int16 v11 = 1024;
        int v12 = 163;
        __int16 v13 = 1024;
        int v14 = v4;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SwitchManager: selectedAudioTestGroupPermutation: %08X", (uint8_t *)&v7, 0x22u);
      }
    }
  }
}

- (void)setupLocalVideoTestGroupSwitches
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v3 = objc_msgSend(+[GKSConnectivitySettings getTestGroupPermutations:](GKSConnectivitySettings, "getTestGroupPermutations:", 1), "componentsSeparatedByString:", @",");
  if ([v3 count])
  {
    int v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v3, "count"))), "unsignedIntValue");
    self->_localSwitches |= (4 * (v4 & 7)) | (v4 << 6) & 0x200;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      double v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315906;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        double v10 = "-[VCSwitchManager setupLocalVideoTestGroupSwitches]";
        __int16 v11 = 1024;
        int v12 = 179;
        __int16 v13 = 1024;
        int v14 = v4;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SwitchManager: selectedVideoTestGroupPermutation: %08X", (uint8_t *)&v7, 0x22u);
      }
    }
  }
}

- (void)setupLocalNetworkTestGroupSwitches
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v3 = objc_msgSend(+[GKSConnectivitySettings getTestGroupPermutations:](GKSConnectivitySettings, "getTestGroupPermutations:", 2), "componentsSeparatedByString:", @",");
  if ([v3 count])
  {
    int v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v3, "count"))), "unsignedIntValue");
    self->_localSwitches |= v4 & 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      double v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315906;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        double v10 = "-[VCSwitchManager setupLocalNetworkTestGroupSwitches]";
        __int16 v11 = 1024;
        int v12 = 192;
        __int16 v13 = 1024;
        int v14 = v4;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SwitchManager: selectedNetworkTestGroupPermutation: %08X", (uint8_t *)&v7, 0x22u);
      }
    }
  }
}

- (void)setupLocalRateControlTestGroupSwitches
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v3 = objc_msgSend(+[GKSConnectivitySettings getTestGroupPermutations:](GKSConnectivitySettings, "getTestGroupPermutations:", 3), "componentsSeparatedByString:", @",");
  if ([v3 count])
  {
    int v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v3, "count"))), "unsignedIntValue");
    self->_localSwitches |= (v4 & 1) << 10;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      double v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315906;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        double v10 = "-[VCSwitchManager setupLocalRateControlTestGroupSwitches]";
        __int16 v11 = 1024;
        int v12 = 205;
        __int16 v13 = 1024;
        int v14 = v4;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SwitchManager: selectedRateControlTestGroupPermutation: %08X", (uint8_t *)&v7, 0x22u);
      }
    }
  }
}

- (void)setupLocalDuplicationTestGroupSwitches
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v3 = objc_msgSend(+[GKSConnectivitySettings getTestGroupPermutations:](GKSConnectivitySettings, "getTestGroupPermutations:", 4), "componentsSeparatedByString:", @",");
  if ([v3 count])
  {
    int v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v3, "count"))), "unsignedIntValue");
    self->_localSwitches |= ((v4 & 7) << 6) | (v4 << 13) & 0x10000;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      double v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315906;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        double v10 = "-[VCSwitchManager setupLocalDuplicationTestGroupSwitches]";
        __int16 v11 = 1024;
        int v12 = 221;
        __int16 v13 = 1024;
        int v14 = v4;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SwitchManager: selectedDuplicationTestGroupPermutation: %08X", (uint8_t *)&v7, 0x22u);
      }
    }
  }
}

- (void)updateDuplicationEnhancementSwitches
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unsigned int localSwitches = self->_localSwitches;
  if ((localSwitches & 0x2000000) == 0) {
    self->_unsigned int localSwitches = localSwitches & 0xFFFEFF7F;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = self->_localSwitches;
      int v7 = 136315906;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      double v10 = "-[VCSwitchManager updateDuplicationEnhancementSwitches]";
      __int16 v11 = 1024;
      int v12 = 236;
      __int16 v13 = 1024;
      unsigned int v14 = v6;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SwitchManager: updateDuplicationEnhancementSwitches updates local switches to: %08X", (uint8_t *)&v7, 0x22u);
    }
  }
}

- (void)negotiateSwitches
{
  self->_negotiatedSwitches = self->_remoteSwitches & 0x6C1E0351 | self->_localSwitches & 0x13E1FCAE;
}

- (void)negotiateSwitchesForIsCaller:(BOOL)a3
{
  uint64_t localSwitches = self->_localSwitches;
  if (!a3) {
    uint64_t localSwitches = self->_remoteSwitches;
  }
  self->_negotiatedSwitches = [(VCSwitchManager *)self applyNegotiationRulesUsingLocalSwitches:self->_localSwitches negotiatedSwitches:localSwitches];
}

- (void)setRemoteSwitches:(unsigned int)a3 isCaller:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t localSwitches = *(void *)&a3;
  if (v4) {
    uint64_t localSwitches = self->_localSwitches;
  }
  self->_remoteSwitches = [(VCSwitchManager *)self applyNegotiationRulesUsingLocalSwitches:*(void *)&a3 negotiatedSwitches:localSwitches];
}

- (BOOL)isSwitchEnabled:(unsigned int)a3
{
  return (self->_negotiatedSwitches & a3) != 0;
}

- (BOOL)isLocalSwitchEnabled:(unsigned int)a3
{
  return (self->_localSwitches & a3) != 0;
}

- (unsigned)applyNegotiationRulesUsingLocalSwitches:(unsigned int)a3 negotiatedSwitches:(unsigned int)a4
{
  return a4 & 0x6C1E0351 | a3 & 0x13E1FCAE;
}

- (id)description
{
  int v7 = NSString;
  double v3 = (objc_class *)objc_opt_class();
  BOOL v4 = NSStringFromClass(v3);
  unsigned int negotiatedSwitches = self->_negotiatedSwitches;
  return (id)objc_msgSend(v7, "stringWithFormat:", @"%@[%p] LocalSwitches[%08X] RemoteSwitches[%08X] NegotiatedSwitches[%08X] preferRelayOverP2P[%d] alwaysOnAudioRedundancy[%d] highFec[%d] lowFpsVideo[%d] vplrFec[%d] fastMediaDuplication[%d] iRATRtp[%d] preWarmCell[%d] duplicateImportantPkts[%d] allowBurstyLossRampDown[%d] hevcWifiTiers[%d] viewpointCorrection[%d] heifHevcLivePhotos[%d] wifiLowTierRedundancy[%d] cellularLowTierRedundancy[%d] iRATMetrics[%d] fecHeaderV1[%d] updatedAFRCHeader[%d] secureMessaging[%d] disableSIP[%d] wifiAssistDuplication[%d] wifiAssistBudgetStatus[%d] wifiAssistStatusBar[%d] lowNetworkMode[%d] duplicationEnhancement[%d] videoJB[%d] iRATDuplication[%d], wrmRSSIThreshold[%d] mediaDrivenDuplication[%d] UseVideoJitterForVideoPlayoutEnabled[%d] UseRTTForFIRThrottlingEnabled[%d]", v4, self, self->_localSwitches, self->_remoteSwitches, negotiatedSwitches, negotiatedSwitches & 1, (negotiatedSwitches >> 1) & 1, (negotiatedSwitches >> 2) & 1, (negotiatedSwitches >> 3) & 1, (negotiatedSwitches >> 4) & 1, (negotiatedSwitches >> 6) & 1, (negotiatedSwitches >> 7) & 1, (negotiatedSwitches >> 8) & 1, (negotiatedSwitches >> 9) & 1, (negotiatedSwitches >> 10) & 1, (negotiatedSwitches >> 11) & 1,
               (negotiatedSwitches >> 12) & 1,
               (negotiatedSwitches >> 13) & 1,
               (negotiatedSwitches >> 14) & 1,
               (negotiatedSwitches >> 15) & 1,
               HIWORD(negotiatedSwitches) & 1,
               (negotiatedSwitches >> 17) & 1,
               (negotiatedSwitches >> 18) & 1,
               (negotiatedSwitches >> 19) & 1,
               (negotiatedSwitches >> 20) & 1,
               (negotiatedSwitches >> 21) & 1,
               (negotiatedSwitches >> 22) & 1,
               (negotiatedSwitches >> 23) & 1,
               HIBYTE(negotiatedSwitches) & 1,
               (negotiatedSwitches >> 25) & 1,
               (negotiatedSwitches >> 26) & 1,
               (negotiatedSwitches >> 27) & 1,
               (negotiatedSwitches >> 28) & 1,
               (negotiatedSwitches >> 29) & 1,
               (negotiatedSwitches >> 5) & 1,
               (negotiatedSwitches >> 30) & 1);
}

- (unsigned)localSwitches
{
  return self->_localSwitches;
}

- (void)setLocalSwitches:(unsigned int)a3
{
  self->_uint64_t localSwitches = a3;
}

- (unsigned)remoteSwitches
{
  return self->_remoteSwitches;
}

- (void)setRemoteSwitches:(unsigned int)a3
{
  self->_remoteSwitches = a3;
}

- (unsigned)negotiatedSwitches
{
  return self->_negotiatedSwitches;
}

- (void)setNegotiatedSwitches:(unsigned int)a3
{
  self->_unsigned int negotiatedSwitches = a3;
}

@end