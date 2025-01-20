@interface VCBitrateArbiter
+ (void)updateMaxAllowedBitratePerConnection:(unsigned int *)a3 connectionType:(int)a4 negotiatedSettings:(id)a5;
- (VCBitrateArbiter)initWithDeviceRole:(int)a3 callLogFile:(void *)a4;
- (id)maxAllowedBitrateRuleForConnection:(int)a3;
- (int)storeBagBitrateForKey:(id)a3;
- (unsigned)maxAllowedAudioOnlyBitrateForConnection:(int)a3;
- (unsigned)maxAllowedBitrate;
- (unsigned)maxAllowedBitrate2G;
- (unsigned)maxAllowedBitrate3G;
- (unsigned)maxAllowedBitrateForConnectionType:(int)a3;
- (unsigned)maxAllowedBitrateForConnectionType:(int)a3 arbiterMode:(unsigned __int8)a4;
- (unsigned)maxAllowedBitrateForVCConnection:(id)a3 forLocalInterface:(BOOL)a4;
- (unsigned)maxAllowedBitrateForVCConnection:(id)a3 forLocalInterface:(BOOL)a4 arbiterMode:(unsigned __int8)a5 encodeRule:(id)a6;
- (unsigned)maxAllowedBitrateForVCConnection:(id)a3 forLocalInterface:(BOOL)a4 encodeRule:(id)a5;
- (unsigned)maxAllowedBitrateHighRat;
- (unsigned)maxAllowedBitrateLTE;
- (unsigned)maxAllowedBitrateP2P;
- (unsigned)maxAllowedBitrateTCPRelay;
- (unsigned)maxAllowedBitrateUSB;
- (unsigned)maxAllowedBitrateWifi;
- (unsigned)maxAllowedCellularBitrate;
- (unsigned)maxAllowedScreenShareBitrateForConnection:(int)a3;
- (unsigned)maxAllowedScreenShareCellularBitrate;
- (void)addRuleForBitrate:(unsigned int)a3 connectionType:(int)a4 limitingRule:(id)a5;
- (void)createSupportedBitrateRuleSets;
- (void)dealloc;
- (void)readCarrierBundleValues;
- (void)readHardwareValues;
- (void)readStoreBagValues:(void *)a3;
- (void)updateMaxAllowedBitrate:(unsigned int *)a3 key:(__CFString *)a4 type:(id)a5 isAudio:(BOOL)a6 carrierBundleBitrates:(__CFDictionary *)a7;
- (void)updateNegotiatedSettings:(id)a3;
@end

@implementation VCBitrateArbiter

- (VCBitrateArbiter)initWithDeviceRole:(int)a3 callLogFile:(void *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)VCBitrateArbiter;
  v5 = [(VCBitrateArbiter *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(VCBitrateArbiter *)v5 readHardwareValues];
    [(VCBitrateArbiter *)v6 readStoreBagValues:a4];
    [(VCBitrateArbiter *)v6 readCarrierBundleValues];
    [(VCBitrateArbiter *)v6 createSupportedBitrateRuleSets];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = objc_msgSend((id)-[NSMutableArray description](v6->supportedBitrateRules, "description"), "UTF8String");
        *(_DWORD *)buf = 136315906;
        uint64_t v15 = v7;
        __int16 v16 = 2080;
        v17 = "-[VCBitrateArbiter initWithDeviceRole:callLogFile:]";
        __int16 v18 = 1024;
        int v19 = 190;
        __int16 v20 = 2080;
        uint64_t v21 = v9;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCBitrateArbiter: Bitrate rules %s", buf, 0x26u);
      }
    }
    unsigned int v10 = [(VCBitrateArbiter *)v6 maxAllowedCellularBitrate];
    unsigned int maxAllowedBitrateWifi = v6->_maxAllowedBitrateWifi;
    if (v10 > maxAllowedBitrateWifi) {
      unsigned int maxAllowedBitrateWifi = [(VCBitrateArbiter *)v6 maxAllowedCellularBitrate];
    }
    v6->_maxAllowedBitrate = maxAllowedBitrateWifi;
    v6->_maxAllowedAudioOnlyBitrateWifi = 299;
    v6->_maxAllowedScreenShareBitrateWifi = 4100;
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCBitrateArbiter;
  [(VCBitrateArbiter *)&v3 dealloc];
}

- (void)createSupportedBitrateRuleSets
{
  self->supportedBitrateRules = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v3 = [VCVideoRule alloc];
  LODWORD(v4) = 15.0;
  v5 = [(VCVideoRule *)v3 initWithFrameWidth:480 frameHeight:368 frameRate:123 payload:v4];
  [(VCBitrateArbiter *)self addRuleForBitrate:self->_maxAllowedBitrate2G connectionType:0 limitingRule:v5];

  v6 = [VCVideoRule alloc];
  LODWORD(v7) = 30.0;
  v8 = [(VCVideoRule *)v6 initWithFrameWidth:640 frameHeight:480 frameRate:123 payload:v7];
  [(VCBitrateArbiter *)self addRuleForBitrate:self->_maxAllowedBitrate3G connectionType:1 limitingRule:v8];

  LODWORD(v8) = self->_maxAllowedBitrateLTE;
  uint64_t v9 = [VCVideoRule alloc];
  LODWORD(v10) = 30.0;
  if (v8 < 0x258)
  {
    uint64_t v11 = 640;
    uint64_t v12 = 480;
  }
  else
  {
    uint64_t v11 = 1024;
    uint64_t v12 = 768;
  }
  objc_super v13 = [(VCVideoRule *)v9 initWithFrameWidth:v11 frameHeight:v12 frameRate:123 payload:v10];
  [(VCBitrateArbiter *)self addRuleForBitrate:self->_maxAllowedBitrateLTE connectionType:2 limitingRule:v13];

  v14 = [VCVideoRule alloc];
  LODWORD(v15) = 1114636288;
  __int16 v16 = [(VCVideoRule *)v14 initWithFrameWidth:1664 frameHeight:1248 frameRate:123 payload:v15];
  [(VCBitrateArbiter *)self addRuleForBitrate:self->_maxAllowedBitrateHighRat connectionType:6 limitingRule:v16];

  v17 = [VCVideoRule alloc];
  LODWORD(v18) = 1114636288;
  int v19 = [(VCVideoRule *)v17 initWithFrameWidth:1664 frameHeight:1248 frameRate:123 payload:v18];
  [(VCBitrateArbiter *)self addRuleForBitrate:self->_maxAllowedBitrateWifi connectionType:3 limitingRule:v19];

  supportedBitrateRules = self->supportedBitrateRules;

  [(NSMutableArray *)supportedBitrateRules sortUsingSelector:sel_compare_];
}

- (void)addRuleForBitrate:(unsigned int)a3 connectionType:(int)a4 limitingRule:(id)a5
{
  v6 = [[VCBitrateRule alloc] initWithBitrate:*(void *)&a3 connectionType:*(void *)&a4 limitingRule:a5];
  [(NSMutableArray *)self->supportedBitrateRules addObject:v6];
}

- (void)readHardwareValues
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  v5 = "-[VCBitrateArbiter readHardwareValues]";
  __int16 v6 = 1024;
  int v7 = 295;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCVideoRuleCollectionsCamera bitrateConfiguration returned NULL", (uint8_t *)&v2, 0x1Cu);
}

- (int)storeBagBitrateForKey:(id)a3
{
  id v4 = (id)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", a3);
  if (!v4) {
    id v4 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6AB80], "sharedInstance"), "objectForKey:", a3);
  }
  int v5 = [v4 intValue];

  return v5;
}

- (void)readStoreBagValues:(void *)a3
{
  uint64_t v353 = *MEMORY[0x1E4F143B8];
  id v5 = +[GKSConnectivitySettings getAllSettings];
  if (v5) {
    LOBYTE(v12) = objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
  }
  else {
    uint64_t v12 = "<nil>";
  }
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Current bag settings: %s\n", v6, v7, v8, v9, v10, v11, (char)v12);
  int v13 = [(VCBitrateArbiter *)self storeBagBitrateForKey:@"gk-p2p-bitrate-max-2g"];
  if (rangeCheck(v13))
  {
    unsigned int maxAllowedBitrate2G = self->_maxAllowedBitrate2G;
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (maxAllowedBitrate2G)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          double v18 = (objc_class *)objc_opt_class();
          *(_DWORD *)buf = 136316162;
          uint64_t v342 = v16;
          __int16 v343 = 2080;
          v344 = "-[VCBitrateArbiter readStoreBagValues:]";
          __int16 v345 = 1024;
          int v346 = 331;
          __int16 v347 = 2080;
          Name = class_getName(v18);
          __int16 v349 = 1024;
          unsigned int v350 = v13;
          _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding 2G bitrate with storebag value of %d", buf, 0x2Cu);
        }
      }
      int v19 = (objc_class *)objc_opt_class();
      char v20 = class_getName(v19);
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding 2G bitrate with storebag value of %d\n", v21, v22, v23, v24, v25, v26, v20);
      self->_unsigned int maxAllowedBitrate2G = v13;
    }
    else
    {
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          v29 = (objc_class *)objc_opt_class();
          *(_DWORD *)buf = 136316162;
          uint64_t v342 = v27;
          __int16 v343 = 2080;
          v344 = "-[VCBitrateArbiter readStoreBagValues:]";
          __int16 v345 = 1024;
          int v346 = 334;
          __int16 v347 = 2080;
          Name = class_getName(v29);
          __int16 v349 = 1024;
          unsigned int v350 = v13;
          _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support 2G, ignored storebag value of %d", buf, 0x2Cu);
        }
      }
      v30 = (objc_class *)objc_opt_class();
      char v31 = class_getName(v30);
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support 2G, ignored storebag value of %d\n", v32, v33, v34, v35, v36, v37, v31);
    }
  }
  int v38 = [(VCBitrateArbiter *)self storeBagBitrateForKey:@"rtc-ss-bitrate-max-2g"];
  if (v38)
  {
    unsigned int v39 = v38;
    if (rangeCheck(v38))
    {
      unsigned int v40 = self->_maxAllowedBitrate2G;
      int v41 = VRTraceGetErrorLogLevelForModule();
      if (v40)
      {
        if (v41 >= 7)
        {
          uint64_t v42 = VRTraceErrorLogLevelToCSTR();
          v43 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            v44 = (objc_class *)objc_opt_class();
            v45 = class_getName(v44);
            *(_DWORD *)buf = 136316162;
            uint64_t v342 = v42;
            __int16 v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            __int16 v345 = 1024;
            int v346 = 346;
            __int16 v347 = 2080;
            Name = v45;
            __int16 v349 = 1024;
            unsigned int v350 = v39;
            _os_log_impl(&dword_1E1EA4000, v43, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding ScreenShare 2G bitrate with storebag value of %d", buf, 0x2Cu);
          }
        }
        v46 = (objc_class *)objc_opt_class();
        char v47 = class_getName(v46);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding ScreenShare 2G bitrate with storebag value of %d\n", v48, v49, v50, v51, v52, v53, v47);
        self->_maxAllowedScreenShareBitrate2G = v39;
      }
      else
      {
        if (v41 >= 7)
        {
          uint64_t v54 = VRTraceErrorLogLevelToCSTR();
          v55 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            v56 = (objc_class *)objc_opt_class();
            v57 = class_getName(v56);
            *(_DWORD *)buf = 136316162;
            uint64_t v342 = v54;
            __int16 v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            __int16 v345 = 1024;
            int v346 = 349;
            __int16 v347 = 2080;
            Name = v57;
            __int16 v349 = 1024;
            unsigned int v350 = v39;
            _os_log_impl(&dword_1E1EA4000, v55, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support 2G, ignored storebag value of %d", buf, 0x2Cu);
          }
        }
        v58 = (objc_class *)objc_opt_class();
        char v59 = class_getName(v58);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support 2G, ignored storebag value of %d\n", v60, v61, v62, v63, v64, v65, v59);
      }
    }
  }
  else
  {
    self->_maxAllowedScreenShareBitrate2G = 510;
  }
  int v66 = [(VCBitrateArbiter *)self storeBagBitrateForKey:@"rtc-ac-bitrate-max-2g"];
  if (v66)
  {
    unsigned int v67 = v66;
    if (IsValidAudioBitrateRange(v66))
    {
      unsigned int v68 = self->_maxAllowedBitrate2G;
      int v69 = VRTraceGetErrorLogLevelForModule();
      if (v68)
      {
        if (v69 >= 7)
        {
          uint64_t v70 = VRTraceErrorLogLevelToCSTR();
          v71 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            v72 = (objc_class *)objc_opt_class();
            v73 = class_getName(v72);
            *(_DWORD *)buf = 136316162;
            uint64_t v342 = v70;
            __int16 v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            __int16 v345 = 1024;
            int v346 = 362;
            __int16 v347 = 2080;
            Name = v73;
            __int16 v349 = 1024;
            unsigned int v350 = v67;
            _os_log_impl(&dword_1E1EA4000, v71, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding 2G AppleCalling bitrate with storebag value of %d", buf, 0x2Cu);
          }
        }
        v74 = (objc_class *)objc_opt_class();
        char v75 = class_getName(v74);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding 2G AppleCalling bitrate with storebag value of %d\n", v76, v77, v78, v79, v80, v81, v75);
        self->_maxAllowedAudioOnlyBitrate2G = v67;
      }
      else
      {
        if (v69 >= 7)
        {
          uint64_t v82 = VRTraceErrorLogLevelToCSTR();
          v83 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            v84 = (objc_class *)objc_opt_class();
            v85 = class_getName(v84);
            *(_DWORD *)buf = 136316162;
            uint64_t v342 = v82;
            __int16 v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            __int16 v345 = 1024;
            int v346 = 365;
            __int16 v347 = 2080;
            Name = v85;
            __int16 v349 = 1024;
            unsigned int v350 = v67;
            _os_log_impl(&dword_1E1EA4000, v83, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support 2G, ignored storebag value of %d", buf, 0x2Cu);
          }
        }
        v86 = (objc_class *)objc_opt_class();
        char v87 = class_getName(v86);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support 2G, ignored storebag value of %d\n", v88, v89, v90, v91, v92, v93, v87);
      }
    }
  }
  else
  {
    self->_maxAllowedAudioOnlyBitrate2G = 21;
  }
  int v94 = [(VCBitrateArbiter *)self storeBagBitrateForKey:@"gk-p2p-bitrate-max-3g"];
  if (rangeCheck(v94))
  {
    unsigned int maxAllowedBitrate3G = self->_maxAllowedBitrate3G;
    int v96 = VRTraceGetErrorLogLevelForModule();
    if (maxAllowedBitrate3G)
    {
      if (v96 >= 7)
      {
        uint64_t v97 = VRTraceErrorLogLevelToCSTR();
        v98 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          v99 = (objc_class *)objc_opt_class();
          v100 = class_getName(v99);
          *(_DWORD *)buf = 136316162;
          uint64_t v342 = v97;
          __int16 v343 = 2080;
          v344 = "-[VCBitrateArbiter readStoreBagValues:]";
          __int16 v345 = 1024;
          int v346 = 374;
          __int16 v347 = 2080;
          Name = v100;
          __int16 v349 = 1024;
          unsigned int v350 = v94;
          _os_log_impl(&dword_1E1EA4000, v98, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding 3G bitrate with storebag value of %d", buf, 0x2Cu);
        }
      }
      v101 = (objc_class *)objc_opt_class();
      char v102 = class_getName(v101);
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding 3G bitrate with storebag value of %d\n", v103, v104, v105, v106, v107, v108, v102);
      self->_unsigned int maxAllowedBitrate3G = v94;
    }
    else
    {
      if (v96 >= 7)
      {
        uint64_t v109 = VRTraceErrorLogLevelToCSTR();
        v110 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          v111 = (objc_class *)objc_opt_class();
          v112 = class_getName(v111);
          *(_DWORD *)buf = 136316162;
          uint64_t v342 = v109;
          __int16 v343 = 2080;
          v344 = "-[VCBitrateArbiter readStoreBagValues:]";
          __int16 v345 = 1024;
          int v346 = 377;
          __int16 v347 = 2080;
          Name = v112;
          __int16 v349 = 1024;
          unsigned int v350 = v94;
          _os_log_impl(&dword_1E1EA4000, v110, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support 3G, ignored storebag value of %d", buf, 0x2Cu);
        }
      }
      v113 = (objc_class *)objc_opt_class();
      char v114 = class_getName(v113);
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support 3G, ignored storebag value of %d\n", v115, v116, v117, v118, v119, v120, v114);
    }
  }
  int v121 = [(VCBitrateArbiter *)self storeBagBitrateForKey:@"rtc-ss-bitrate-max-3g"];
  if (v121)
  {
    unsigned int v122 = v121;
    if (rangeCheck(v121))
    {
      unsigned int v123 = self->_maxAllowedBitrate3G;
      int v124 = VRTraceGetErrorLogLevelForModule();
      if (v123)
      {
        if (v124 >= 7)
        {
          uint64_t v125 = VRTraceErrorLogLevelToCSTR();
          v126 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            v127 = (objc_class *)objc_opt_class();
            v128 = class_getName(v127);
            *(_DWORD *)buf = 136316162;
            uint64_t v342 = v125;
            __int16 v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            __int16 v345 = 1024;
            int v346 = 389;
            __int16 v347 = 2080;
            Name = v128;
            __int16 v349 = 1024;
            unsigned int v350 = v122;
            _os_log_impl(&dword_1E1EA4000, v126, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding 3G ScreenShare bitrate with storebag value of %d", buf, 0x2Cu);
          }
        }
        v129 = (objc_class *)objc_opt_class();
        char v130 = class_getName(v129);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding 3G ScreenShare bitrate with storebag value of %d\n", v131, v132, v133, v134, v135, v136, v130);
        self->_maxAllowedScreenShareBitrate3G = v122;
      }
      else
      {
        if (v124 >= 7)
        {
          uint64_t v137 = VRTraceErrorLogLevelToCSTR();
          v138 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            v139 = (objc_class *)objc_opt_class();
            v140 = class_getName(v139);
            *(_DWORD *)buf = 136316162;
            uint64_t v342 = v137;
            __int16 v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            __int16 v345 = 1024;
            int v346 = 392;
            __int16 v347 = 2080;
            Name = v140;
            __int16 v349 = 1024;
            unsigned int v350 = v122;
            _os_log_impl(&dword_1E1EA4000, v138, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support 3G, ignored storebag value of %d", buf, 0x2Cu);
          }
        }
        v141 = (objc_class *)objc_opt_class();
        char v142 = class_getName(v141);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support 3G, ignored storebag value of %d\n", v143, v144, v145, v146, v147, v148, v142);
      }
    }
  }
  else
  {
    self->_maxAllowedScreenShareBitrate3G = 510;
  }
  int v149 = [(VCBitrateArbiter *)self storeBagBitrateForKey:@"rtc-ac-bitrate-max-3g"];
  if (v149)
  {
    unsigned int v150 = v149;
    if (IsValidAudioBitrateRange(v149))
    {
      unsigned int v151 = self->_maxAllowedBitrate3G;
      int v152 = VRTraceGetErrorLogLevelForModule();
      if (v151)
      {
        if (v152 >= 7)
        {
          uint64_t v153 = VRTraceErrorLogLevelToCSTR();
          v154 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            v155 = (objc_class *)objc_opt_class();
            v156 = class_getName(v155);
            *(_DWORD *)buf = 136316162;
            uint64_t v342 = v153;
            __int16 v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            __int16 v345 = 1024;
            int v346 = 405;
            __int16 v347 = 2080;
            Name = v156;
            __int16 v349 = 1024;
            unsigned int v350 = v150;
            _os_log_impl(&dword_1E1EA4000, v154, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding 3G AppleCalling bitrate with storebag value of %d", buf, 0x2Cu);
          }
        }
        v157 = (objc_class *)objc_opt_class();
        char v158 = class_getName(v157);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding 3G AppleCalling bitrate with storebag value of %d\n", v159, v160, v161, v162, v163, v164, v158);
        self->_maxAllowedAudioOnlyBitrate3G = v150;
      }
      else
      {
        if (v152 >= 7)
        {
          uint64_t v165 = VRTraceErrorLogLevelToCSTR();
          v166 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            v167 = (objc_class *)objc_opt_class();
            v168 = class_getName(v167);
            *(_DWORD *)buf = 136316162;
            uint64_t v342 = v165;
            __int16 v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            __int16 v345 = 1024;
            int v346 = 408;
            __int16 v347 = 2080;
            Name = v168;
            __int16 v349 = 1024;
            unsigned int v350 = v150;
            _os_log_impl(&dword_1E1EA4000, v166, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support 3G, ignored storebag value of %d", buf, 0x2Cu);
          }
        }
        v169 = (objc_class *)objc_opt_class();
        char v170 = class_getName(v169);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support 3G, ignored storebag value of %d\n", v171, v172, v173, v174, v175, v176, v170);
      }
    }
  }
  else
  {
    self->_maxAllowedAudioOnlyBitrate3G = 40;
  }
  int v177 = [(VCBitrateArbiter *)self storeBagBitrateForKey:@"gk-p2p-bitrate-max-lte-v2"];
  if (rangeCheck(v177))
  {
    if (self->_maxAllowedBitrateLTE)
    {
      if ((VRTraceIsInternalOSInstalled() & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v178 = VRTraceErrorLogLevelToCSTR();
          v179 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            v180 = (objc_class *)objc_opt_class();
            v181 = class_getName(v180);
            *(_DWORD *)buf = 136316162;
            uint64_t v342 = v178;
            __int16 v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            __int16 v345 = 1024;
            int v346 = 418;
            __int16 v347 = 2080;
            Name = v181;
            __int16 v349 = 1024;
            unsigned int v350 = v177;
            _os_log_impl(&dword_1E1EA4000, v179, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding LTE bitrate with storebag value of %d", buf, 0x2Cu);
          }
        }
        v182 = (objc_class *)objc_opt_class();
        char v183 = class_getName(v182);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding LTE bitrate with storebag value of %d\n", v184, v185, v186, v187, v188, v189, v183);
        self->_unsigned int maxAllowedBitrateLTE = v177;
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v190 = VRTraceErrorLogLevelToCSTR();
        v191 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          v192 = (objc_class *)objc_opt_class();
          v193 = class_getName(v192);
          *(_DWORD *)buf = 136316162;
          uint64_t v342 = v190;
          __int16 v343 = 2080;
          v344 = "-[VCBitrateArbiter readStoreBagValues:]";
          __int16 v345 = 1024;
          int v346 = 422;
          __int16 v347 = 2080;
          Name = v193;
          __int16 v349 = 1024;
          unsigned int v350 = v177;
          _os_log_impl(&dword_1E1EA4000, v191, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support LTE, ignored storebag value of %d", buf, 0x2Cu);
        }
      }
      v194 = (objc_class *)objc_opt_class();
      char v195 = class_getName(v194);
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support LTE, ignored storebag value of %d\n", v196, v197, v198, v199, v200, v201, v195);
    }
  }
  int v202 = [(VCBitrateArbiter *)self storeBagBitrateForKey:@"gk-p2p-bitrate-max-5g"];
  if (rangeCheck(v202))
  {
    unsigned int maxAllowedBitrateHighRat = self->_maxAllowedBitrateHighRat;
    int v204 = VRTraceGetErrorLogLevelForModule();
    if (maxAllowedBitrateHighRat)
    {
      if (v204 >= 7)
      {
        uint64_t v205 = VRTraceErrorLogLevelToCSTR();
        v206 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          v207 = (objc_class *)objc_opt_class();
          v208 = class_getName(v207);
          *(_DWORD *)buf = 136316162;
          uint64_t v342 = v205;
          __int16 v343 = 2080;
          v344 = "-[VCBitrateArbiter readStoreBagValues:]";
          __int16 v345 = 1024;
          int v346 = 431;
          __int16 v347 = 2080;
          Name = v208;
          __int16 v349 = 1024;
          unsigned int v350 = v202;
          _os_log_impl(&dword_1E1EA4000, v206, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding 5G bitrate with storebag value of %d", buf, 0x2Cu);
        }
      }
      v209 = (objc_class *)objc_opt_class();
      char v210 = class_getName(v209);
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding 5G bitrate with storebag value of %d\n", v211, v212, v213, v214, v215, v216, v210);
      self->_unsigned int maxAllowedBitrateHighRat = v202;
    }
    else
    {
      if (v204 >= 7)
      {
        uint64_t v217 = VRTraceErrorLogLevelToCSTR();
        v218 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          v219 = (objc_class *)objc_opt_class();
          v220 = class_getName(v219);
          *(_DWORD *)buf = 136316162;
          uint64_t v342 = v217;
          __int16 v343 = 2080;
          v344 = "-[VCBitrateArbiter readStoreBagValues:]";
          __int16 v345 = 1024;
          int v346 = 434;
          __int16 v347 = 2080;
          Name = v220;
          __int16 v349 = 1024;
          unsigned int v350 = v202;
          _os_log_impl(&dword_1E1EA4000, v218, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support 5G, ignored storebag value of %d", buf, 0x2Cu);
        }
      }
      v221 = (objc_class *)objc_opt_class();
      char v222 = class_getName(v221);
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support 5G, ignored storebag value of %d\n", v223, v224, v225, v226, v227, v228, v222);
    }
  }
  int v229 = [(VCBitrateArbiter *)self storeBagBitrateForKey:@"gk-p2p-bitrate-max-wifi"];
  if (rangeCheck(v229))
  {
    unsigned int maxAllowedBitrateWifi = self->_maxAllowedBitrateWifi;
    int v231 = VRTraceGetErrorLogLevelForModule();
    if (maxAllowedBitrateWifi)
    {
      if (v231 >= 7)
      {
        uint64_t v232 = VRTraceErrorLogLevelToCSTR();
        v233 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          v234 = (objc_class *)objc_opt_class();
          v235 = class_getName(v234);
          *(_DWORD *)buf = 136316162;
          uint64_t v342 = v232;
          __int16 v343 = 2080;
          v344 = "-[VCBitrateArbiter readStoreBagValues:]";
          __int16 v345 = 1024;
          int v346 = 443;
          __int16 v347 = 2080;
          Name = v235;
          __int16 v349 = 1024;
          unsigned int v350 = v229;
          _os_log_impl(&dword_1E1EA4000, v233, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding Wi-Fi bitrate with storebag value of %d", buf, 0x2Cu);
        }
      }
      v236 = (objc_class *)objc_opt_class();
      char v237 = class_getName(v236);
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding Wi-Fi bitrate with storebag value of %d\n", v238, v239, v240, v241, v242, v243, v237);
      self->_unsigned int maxAllowedBitrateWifi = v229;
    }
    else
    {
      if (v231 >= 7)
      {
        uint64_t v244 = VRTraceErrorLogLevelToCSTR();
        v245 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          v246 = (objc_class *)objc_opt_class();
          v247 = class_getName(v246);
          *(_DWORD *)buf = 136316162;
          uint64_t v342 = v244;
          __int16 v343 = 2080;
          v344 = "-[VCBitrateArbiter readStoreBagValues:]";
          __int16 v345 = 1024;
          int v346 = 446;
          __int16 v347 = 2080;
          Name = v247;
          __int16 v349 = 1024;
          unsigned int v350 = v229;
          _os_log_impl(&dword_1E1EA4000, v245, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support Wi-Fi, ignored storebag value of %d", buf, 0x2Cu);
        }
      }
      v248 = (objc_class *)objc_opt_class();
      char v249 = class_getName(v248);
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support Wi-Fi, ignored storebag value of %d\n", v250, v251, v252, v253, v254, v255, v249);
    }
  }
  int v256 = [(VCBitrateArbiter *)self storeBagBitrateForKey:@"rtc-ss-bitrate-max-lte"];
  if (v256)
  {
    unsigned int v257 = v256;
    if (rangeCheck(v256))
    {
      unsigned int maxAllowedBitrateLTE = self->_maxAllowedBitrateLTE;
      int v259 = VRTraceGetErrorLogLevelForModule();
      if (maxAllowedBitrateLTE)
      {
        if (v259 >= 7)
        {
          uint64_t v260 = VRTraceErrorLogLevelToCSTR();
          v261 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            v262 = (objc_class *)objc_opt_class();
            v263 = class_getName(v262);
            *(_DWORD *)buf = 136316162;
            uint64_t v342 = v260;
            __int16 v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            __int16 v345 = 1024;
            int v346 = 458;
            __int16 v347 = 2080;
            Name = v263;
            __int16 v349 = 1024;
            unsigned int v350 = v257;
            _os_log_impl(&dword_1E1EA4000, v261, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding LTE ScreenShare bitrate with storebag value of %d", buf, 0x2Cu);
          }
        }
        v264 = (objc_class *)objc_opt_class();
        char v265 = class_getName(v264);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding LTE ScreenShare bitrate with storebag value of %d\n", v266, v267, v268, v269, v270, v271, v265);
        self->_maxAllowedScreenShareBitrateLTE = v257;
      }
      else
      {
        if (v259 >= 7)
        {
          uint64_t v272 = VRTraceErrorLogLevelToCSTR();
          v273 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            v274 = (objc_class *)objc_opt_class();
            v275 = class_getName(v274);
            *(_DWORD *)buf = 136316162;
            uint64_t v342 = v272;
            __int16 v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            __int16 v345 = 1024;
            int v346 = 461;
            __int16 v347 = 2080;
            Name = v275;
            __int16 v349 = 1024;
            unsigned int v350 = v257;
            _os_log_impl(&dword_1E1EA4000, v273, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support LTE, ignored storebag value of %d", buf, 0x2Cu);
          }
        }
        v276 = (objc_class *)objc_opt_class();
        char v277 = class_getName(v276);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support LTE, ignored storebag value of %d\n", v278, v279, v280, v281, v282, v283, v277);
      }
    }
  }
  else
  {
    self->_maxAllowedScreenShareBitrateLTE = 510;
  }
  int v284 = [(VCBitrateArbiter *)self storeBagBitrateForKey:@"rtc-ac-bitrate-max-lte"];
  if (v284)
  {
    unsigned int v285 = v284;
    if (IsValidAudioBitrateRange(v284))
    {
      unsigned int v286 = self->_maxAllowedBitrateLTE;
      int v287 = VRTraceGetErrorLogLevelForModule();
      if (v286)
      {
        if (v287 >= 7)
        {
          uint64_t v288 = VRTraceErrorLogLevelToCSTR();
          v289 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            v290 = (objc_class *)objc_opt_class();
            v291 = class_getName(v290);
            *(_DWORD *)buf = 136316162;
            uint64_t v342 = v288;
            __int16 v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            __int16 v345 = 1024;
            int v346 = 474;
            __int16 v347 = 2080;
            Name = v291;
            __int16 v349 = 1024;
            unsigned int v350 = v285;
            _os_log_impl(&dword_1E1EA4000, v289, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding LTE AppleCalling bitrate with storebag value of %d", buf, 0x2Cu);
          }
        }
        v292 = (objc_class *)objc_opt_class();
        char v293 = class_getName(v292);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding LTE AppleCalling bitrate with storebag value of %d\n", v294, v295, v296, v297, v298, v299, v293);
        self->_maxAllowedAudioOnlyBitrateLTE = v285;
      }
      else
      {
        if (v287 >= 7)
        {
          uint64_t v300 = VRTraceErrorLogLevelToCSTR();
          v301 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            v302 = (objc_class *)objc_opt_class();
            v303 = class_getName(v302);
            *(_DWORD *)buf = 136316162;
            uint64_t v342 = v300;
            __int16 v343 = 2080;
            v344 = "-[VCBitrateArbiter readStoreBagValues:]";
            __int16 v345 = 1024;
            int v346 = 477;
            __int16 v347 = 2080;
            Name = v303;
            __int16 v349 = 1024;
            unsigned int v350 = v285;
            _os_log_impl(&dword_1E1EA4000, v301, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: hardware does not support LTE, ignored storebag value of %d", buf, 0x2Cu);
          }
        }
        v304 = (objc_class *)objc_opt_class();
        char v305 = class_getName(v304);
        VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: hardware does not support LTE, ignored storebag value of %d\n", v306, v307, v308, v309, v310, v311, v305);
      }
    }
  }
  else
  {
    self->_maxAllowedAudioOnlyBitrateLTE = 40;
  }
  unsigned int v312 = [(VCBitrateArbiter *)self storeBagBitrateForKey:@"gk-p2p-tcp-relay-bitrate-max"];
  self->_unsigned int maxAllowedBitrateTCPRelay = v312;
  if (v312)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v313 = VRTraceErrorLogLevelToCSTR();
      v314 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v315 = (objc_class *)objc_opt_class();
        v316 = class_getName(v315);
        unsigned int maxAllowedBitrateTCPRelay = self->_maxAllowedBitrateTCPRelay;
        *(_DWORD *)buf = 136316162;
        uint64_t v342 = v313;
        __int16 v343 = 2080;
        v344 = "-[VCBitrateArbiter readStoreBagValues:]";
        __int16 v345 = 1024;
        int v346 = 484;
        __int16 v347 = 2080;
        Name = v316;
        __int16 v349 = 1024;
        unsigned int v350 = maxAllowedBitrateTCPRelay;
        _os_log_impl(&dword_1E1EA4000, v314, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: overriding TCP Relay bitrate with storebag value of %d", buf, 0x2Cu);
      }
    }
    v318 = (objc_class *)objc_opt_class();
    char v319 = class_getName(v318);
    VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: overriding TCP Relay bitrate with storebag value of %d\n", v320, v321, v322, v323, v324, v325, v319);
  }
  BOOL v326 = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:@"vc-raise-u-one-bandwidth-limit-when-constrained" exceptionKey:@"vc-raise-u-one-bandwidth-limit-when-constrained-exceptions" userDefaultKey:@"raiseU1BandwidthLimitWhenConstrained" featureFlagDomain:"AVConference" featureFlagName:"RaiseU1BandwidthLimitWhenContrained"];
  if (v326) {
    unsigned int v327 = 600;
  }
  else {
    unsigned int v327 = 228;
  }
  self->_unsigned int maxAllowedBitrateConstrained = v327;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v328 = VRTraceErrorLogLevelToCSTR();
    v329 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      v330 = (objc_class *)objc_opt_class();
      v331 = class_getName(v330);
      unsigned int maxAllowedBitrateConstrained = self->_maxAllowedBitrateConstrained;
      *(_DWORD *)buf = 136316418;
      uint64_t v342 = v328;
      __int16 v343 = 2080;
      v344 = "-[VCBitrateArbiter readStoreBagValues:]";
      __int16 v345 = 1024;
      int v346 = 489;
      __int16 v347 = 2080;
      Name = v331;
      __int16 v349 = 1024;
      unsigned int v350 = maxAllowedBitrateConstrained;
      __int16 v351 = 1024;
      BOOL v352 = v326;
      _os_log_impl(&dword_1E1EA4000, v329, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: max bitrate for constrained wifi set to %d, enabled setting=%d", buf, 0x32u);
    }
  }
  v333 = (objc_class *)objc_opt_class();
  char v334 = class_getName(v333);
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s: max bitrate for constrained wifi set to %d, enabled setting=%d\n", v335, v336, v337, v338, v339, v340, v334);
}

- (void)updateMaxAllowedBitrate:(unsigned int *)a3 key:(__CFString *)a4 type:(id)a5 isAudio:(BOOL)a6 carrierBundleBitrates:(__CFDictionary *)a7
{
  BOOL v7 = a6;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a7, a4);
  if (Value)
  {
    unsigned int valuePtr = -1431655766;
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
    if (v7)
    {
      if (!IsValidAudioBitrateRange(valuePtr)) {
        return;
      }
    }
    else if (!rangeCheck(valuePtr))
    {
      return;
    }
    unsigned int v11 = *a3;
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v11)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v19 = v13;
          __int16 v20 = 2080;
          uint64_t v21 = "-[VCBitrateArbiter updateMaxAllowedBitrate:key:type:isAudio:carrierBundleBitrates:]";
          __int16 v22 = 1024;
          int v23 = 505;
          __int16 v24 = 2112;
          id v25 = a5;
          __int16 v26 = 1024;
          unsigned int v27 = valuePtr;
          _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCBitrateArbiter: overriding %@ bitrate with carrier bundle value of %d", buf, 0x2Cu);
        }
      }
      *a3 = valuePtr;
    }
    else if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v19 = v15;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VCBitrateArbiter updateMaxAllowedBitrate:key:type:isAudio:carrierBundleBitrates:]";
        __int16 v22 = 1024;
        int v23 = 508;
        __int16 v24 = 2112;
        id v25 = a5;
        __int16 v26 = 1024;
        unsigned int v27 = valuePtr;
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCBitrateArbiter: hardware does not support %@, ignored carrier bundle value of %d", buf, 0x2Cu);
      }
    }
  }
}

- (void)readCarrierBundleValues
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  if (VCCarrierBundle_QueryCarrierBundleValueForKey(@"FaceTimeOverCellular", &cf)) {
    BOOL v3 = cf == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      id v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v10 = v4;
        __int16 v11 = 2080;
        uint64_t v12 = "-[VCBitrateArbiter readCarrierBundleValues]";
        __int16 v13 = 1024;
        int v14 = 544;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCBitrateArbiter: no carrier bundle values found", buf, 0x1Cu);
      }
    }
  }
  else
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFDictionaryGetTypeID())
    {
      CFTypeRef v7 = cf;
      [(VCBitrateArbiter *)self updateMaxAllowedBitrate:&self->_maxAllowedBitrate2G key:@"MaxBitrate2G" type:@"2G" isAudio:0 carrierBundleBitrates:cf];
      [(VCBitrateArbiter *)self updateMaxAllowedBitrate:&self->_maxAllowedAudioOnlyBitrate2G key:@"MaxAudioOnlyBitrate2G" type:@"2G" isAudio:1 carrierBundleBitrates:v7];
      [(VCBitrateArbiter *)self updateMaxAllowedBitrate:&self->_maxAllowedBitrate3G key:@"MaxBitrate3G" type:@"3G" isAudio:0 carrierBundleBitrates:v7];
      [(VCBitrateArbiter *)self updateMaxAllowedBitrate:&self->_maxAllowedAudioOnlyBitrate3G key:@"MaxAudioOnlyBitrate3G" type:@"3G" isAudio:1 carrierBundleBitrates:v7];
      [(VCBitrateArbiter *)self updateMaxAllowedBitrate:&self->_maxAllowedBitrateLTE key:@"MaxBitrateLTE" type:@"LTE" isAudio:0 carrierBundleBitrates:v7];
      [(VCBitrateArbiter *)self updateMaxAllowedBitrate:&self->_maxAllowedAudioOnlyBitrateLTE key:@"MaxAudioOnlyBitrateLTE" type:@"LTE" isAudio:1 carrierBundleBitrates:v7];
      [(VCBitrateArbiter *)self updateMaxAllowedBitrate:&self->_maxAllowedBitrateHighRat key:@"MaxBitrate5G" type:@"5G" isAudio:0 carrierBundleBitrates:v7];
    }
    CFRelease(cf);
  }
}

- (unsigned)maxAllowedCellularBitrate
{
  return vmaxvq_u32(*(uint32x4_t *)&self->_maxAllowedBitrate2G);
}

- (unsigned)maxAllowedScreenShareCellularBitrate
{
  unsigned int maxAllowedScreenShareBitrate2G = self->_maxAllowedScreenShareBitrate2G;
  if (maxAllowedScreenShareBitrate2G <= self->_maxAllowedScreenShareBitrate3G) {
    unsigned int maxAllowedScreenShareBitrate2G = self->_maxAllowedScreenShareBitrate3G;
  }
  if (maxAllowedScreenShareBitrate2G <= self->_maxAllowedScreenShareBitrateLTE) {
    return self->_maxAllowedScreenShareBitrateLTE;
  }
  else {
    return maxAllowedScreenShareBitrate2G;
  }
}

- (unsigned)maxAllowedBitrateForConnectionType:(int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    CFTypeID v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315906;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      __int16 v11 = "-[VCBitrateArbiter maxAllowedBitrateForConnectionType:]";
      __int16 v12 = 1024;
      int v13 = 563;
      __int16 v14 = 1024;
      int v15 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCBitrateArbiter: received connectionType %d", (uint8_t *)&v8, 0x22u);
    }
  }
  unsigned int result = 40000000;
  switch(a3)
  {
    case 0:
      unsigned int result = self->_maxAllowedBitrate2G;
      break;
    case 1:
      unsigned int result = self->_maxAllowedBitrate3G;
      break;
    case 2:
      unsigned int result = self->_maxAllowedBitrateLTE;
      break;
    case 3:
      unsigned int result = self->_maxAllowedBitrateWifi;
      break;
    case 4:
    case 5:
      return result;
    case 6:
      unsigned int result = self->_maxAllowedBitrateHighRat;
      break;
    case 7:
      unsigned int result = 60000000;
      break;
    default:
      unsigned int result = 100;
      break;
  }
  return result;
}

- (unsigned)maxAllowedBitrateForVCConnection:(id)a3 forLocalInterface:(BOOL)a4
{
  return [(VCBitrateArbiter *)self maxAllowedBitrateForVCConnection:a3 forLocalInterface:a4 encodeRule:0];
}

- (unsigned)maxAllowedBitrateForVCConnection:(id)a3 forLocalInterface:(BOOL)a4 encodeRule:(id)a5
{
  BOOL v6 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a4) {
    int v9 = [a3 localConnectionType];
  }
  else {
    int v9 = [a3 remoteConnectionType];
  }
  int v10 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v6)
    {
      int IsLocalExpensive = VCConnection_IsLocalExpensive((uint64_t)a3);
      int IsLocalConstrained = VCConnection_IsLocalConstrained((uint64_t)a3);
    }
    else
    {
      int IsLocalExpensive = VCConnection_IsRemoteExpensive((uint64_t)a3);
      int IsLocalConstrained = VCConnection_IsRemoteConstrained((uint64_t)a3);
    }
    int v13 = IsLocalConstrained;
  }
  else
  {
    int v13 = 0;
    int IsLocalExpensive = 1;
  }
  switch(v10)
  {
    case 0:
      unsigned int maxAllowedBitrate2G = self->_maxAllowedBitrate2G;
      break;
    case 1:
      unsigned int maxAllowedBitrate2G = self->_maxAllowedBitrate3G;
      break;
    case 2:
    case 6:
      uint64_t v14 = 24;
      if (IsLocalExpensive) {
        uint64_t v14 = 20;
      }
      unsigned int maxAllowedBitrate2G = *(_DWORD *)((char *)&self->super.isa + v14);
      if (v13)
      {
        if (self->_maxAllowedBitrateConstrained >= maxAllowedBitrate2G) {
          unsigned int maxAllowedBitrateConstrained = *(_DWORD *)((char *)&self->super.isa + v14);
        }
        else {
          unsigned int maxAllowedBitrateConstrained = self->_maxAllowedBitrateConstrained;
        }
        if (maxAllowedBitrate2G) {
          unsigned int maxAllowedBitrate2G = maxAllowedBitrateConstrained;
        }
        else {
          unsigned int maxAllowedBitrate2G = self->_maxAllowedBitrateConstrained;
        }
      }
      break;
    case 3:
      if (v13) {
        unsigned int maxAllowedBitrate2G = self->_maxAllowedBitrateConstrained;
      }
      else {
        unsigned int maxAllowedBitrate2G = self->_maxAllowedBitrateWifi;
      }
      break;
    case 4:
    case 5:
      unsigned int maxAllowedBitrate2G = 40000000;
      break;
    case 7:
      unsigned int maxAllowedBitrate2G = 60000000;
      break;
    default:
      unsigned int maxAllowedBitrate2G = 100;
      break;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    double v18 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        uint64_t v19 = "Local";
      }
      else {
        uint64_t v19 = "Remote";
      }
      int v21 = 136317186;
      uint64_t v22 = v17;
      __int16 v23 = 2080;
      __int16 v24 = "-[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:encodeRule:]";
      __int16 v25 = 1024;
      int v26 = 665;
      __int16 v27 = 1024;
      unsigned int v28 = maxAllowedBitrate2G;
      __int16 v29 = 2080;
      v30 = v19;
      __int16 v31 = 1024;
      int v32 = v10;
      __int16 v33 = 1024;
      int v34 = v13;
      __int16 v35 = 1024;
      int v36 = IsLocalExpensive;
      __int16 v37 = 1024;
      int v38 = [a5 isVideoFullHD];
      _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Bitrate = %d. received connection for %s, connectionType = %d, constraint %d, expensive %d, videoFullHD %d", (uint8_t *)&v21, 0x44u);
    }
  }
  return maxAllowedBitrate2G;
}

- (unsigned)maxAllowedScreenShareBitrateForConnection:(int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    BOOL v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315906;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      __int16 v11 = "-[VCBitrateArbiter maxAllowedScreenShareBitrateForConnection:]";
      __int16 v12 = 1024;
      int v13 = 671;
      __int16 v14 = 1024;
      int v15 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received connection type %d", (uint8_t *)&v8, 0x22u);
    }
  }
  if a3 <= 6 && ((0x4Fu >> a3)) {
    return *(_DWORD *)((char *)&self->super.isa + qword_1E25A2AE8[a3]);
  }
  else {
    return 510;
  }
}

- (unsigned)maxAllowedAudioOnlyBitrateForConnection:(int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    BOOL v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315906;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      __int16 v11 = "-[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:]";
      __int16 v12 = 1024;
      int v13 = 695;
      __int16 v14 = 1024;
      int v15 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received connection type %d", (uint8_t *)&v8, 0x22u);
    }
  }
  if a3 <= 6 && ((0x4Fu >> a3)) {
    return *(_DWORD *)((char *)&self->super.isa + qword_1E25A2B20[a3]);
  }
  else {
    return 40;
  }
}

- (id)maxAllowedBitrateRuleForConnection:(int)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    BOOL v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v20 = v5;
      __int16 v21 = 2080;
      uint64_t v22 = "-[VCBitrateArbiter maxAllowedBitrateRuleForConnection:]";
      __int16 v23 = 1024;
      int v24 = 719;
      __int16 v25 = 1024;
      int v26 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received connection type %d", buf, 0x22u);
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  supportedBitrateRules = self->supportedBitrateRules;
  uint64_t v8 = [(NSMutableArray *)supportedBitrateRules countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v16;
LABEL_6:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v16 != v10) {
      objc_enumerationMutation(supportedBitrateRules);
    }
    __int16 v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
    if ([v12 connectionType] == a3) {
      return v12;
    }
    if (v9 == ++v11)
    {
      uint64_t v9 = [(NSMutableArray *)supportedBitrateRules countByEnumeratingWithState:&v15 objects:v14 count:16];
      if (v9) {
        goto LABEL_6;
      }
      return 0;
    }
  }
}

- (unsigned)maxAllowedBitrateForVCConnection:(id)a3 forLocalInterface:(BOOL)a4 arbiterMode:(unsigned __int8)a5 encodeRule:(id)a6
{
  int v7 = a5;
  BOOL v8 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a4) {
    uint64_t v11 = [a3 localConnectionType];
  }
  else {
    uint64_t v11 = [a3 remoteConnectionType];
  }
  uint64_t v12 = v11;
  unsigned int result = 20000000;
  switch(v7)
  {
    case 0:
    case 2:
    case 7:
      unsigned int result = [(VCBitrateArbiter *)self maxAllowedAudioOnlyBitrateForConnection:v12];
      break;
    case 1:
    case 4:
    case 5:
      unsigned int result = [(VCBitrateArbiter *)self maxAllowedBitrateForVCConnection:a3 forLocalInterface:v8 encodeRule:a6];
      break;
    case 3:
      unsigned int result = [(VCBitrateArbiter *)self maxAllowedScreenShareBitrateForConnection:v12];
      break;
    case 6:
      return result;
    default:
      if ((VCBitrateArbiter *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          unsigned int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!result) {
            return result;
          }
          -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:]();
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          __int16 v14 = (__CFString *)[(VCBitrateArbiter *)self performSelector:sel_logPrefix];
        }
        else {
          __int16 v14 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v15 = VRTraceErrorLogLevelToCSTR();
          long long v16 = *MEMORY[0x1E4F47A50];
          unsigned int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!result) {
            return result;
          }
          int v17 = 136316418;
          uint64_t v18 = v15;
          __int16 v19 = 2080;
          uint64_t v20 = "-[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:]";
          __int16 v21 = 1024;
          int v22 = 753;
          __int16 v23 = 2112;
          int v24 = v14;
          __int16 v25 = 2048;
          int v26 = self;
          __int16 v27 = 1024;
          int v28 = v7;
          _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected arbiterMode=%hhu", (uint8_t *)&v17, 0x36u);
        }
      }
      unsigned int result = 0;
      break;
  }
  return result;
}

- (unsigned)maxAllowedBitrateForConnectionType:(int)a3 arbiterMode:(unsigned __int8)a4
{
  int v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned int result = 20000000;
  switch(a4)
  {
    case 0u:
    case 2u:
      return [(VCBitrateArbiter *)self maxAllowedAudioOnlyBitrateForConnection:*(void *)&a3];
    case 1u:
    case 4u:
    case 5u:
      return [(VCBitrateArbiter *)self maxAllowedBitrateForConnectionType:*(void *)&a3];
    case 3u:
      return [(VCBitrateArbiter *)self maxAllowedScreenShareBitrateForConnection:*(void *)&a3];
    case 6u:
      return result;
    case 7u:
      return 6000000;
    default:
      if ((VCBitrateArbiter *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          unsigned int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!result) {
            return result;
          }
          -[VCBitrateArbiter maxAllowedBitrateForConnectionType:arbiterMode:]();
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v7 = (__CFString *)[(VCBitrateArbiter *)self performSelector:sel_logPrefix];
        }
        else {
          int v7 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v8 = VRTraceErrorLogLevelToCSTR();
          uint64_t v9 = *MEMORY[0x1E4F47A50];
          unsigned int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!result) {
            return result;
          }
          int v10 = 136316418;
          uint64_t v11 = v8;
          __int16 v12 = 2080;
          int v13 = "-[VCBitrateArbiter maxAllowedBitrateForConnectionType:arbiterMode:]";
          __int16 v14 = 1024;
          int v15 = 775;
          __int16 v16 = 2112;
          int v17 = v7;
          __int16 v18 = 2048;
          __int16 v19 = self;
          __int16 v20 = 1024;
          int v21 = v4;
          _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected arbiterMode=%hhu", (uint8_t *)&v10, 0x36u);
        }
      }
      return 0;
  }
}

+ (void)updateMaxAllowedBitratePerConnection:(unsigned int *)a3 connectionType:(int)a4 negotiatedSettings:(id)a5
{
  unsigned int v6 = [a5 maxBandwidthWithArbiterMode:1 connectionType:*(void *)&a4];
  if (v6) {
    *a3 = v6;
  }
}

- (void)updateNegotiatedSettings:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  p_unsigned int maxAllowedBitrate2G = &self->_maxAllowedBitrate2G;
  +[VCBitrateArbiter updateMaxAllowedBitratePerConnection:&self->_maxAllowedBitrate2G connectionType:0 negotiatedSettings:a3];
  p_unsigned int maxAllowedBitrate3G = &self->_maxAllowedBitrate3G;
  +[VCBitrateArbiter updateMaxAllowedBitratePerConnection:&self->_maxAllowedBitrate3G connectionType:1 negotiatedSettings:a3];
  p_unsigned int maxAllowedBitrateLTE = &self->_maxAllowedBitrateLTE;
  +[VCBitrateArbiter updateMaxAllowedBitratePerConnection:&self->_maxAllowedBitrateLTE connectionType:2 negotiatedSettings:a3];
  p_unsigned int maxAllowedBitrateHighRat = &self->_maxAllowedBitrateHighRat;
  +[VCBitrateArbiter updateMaxAllowedBitratePerConnection:&self->_maxAllowedBitrateHighRat connectionType:6 negotiatedSettings:a3];
  p_unsigned int maxAllowedBitrateWifi = &self->_maxAllowedBitrateWifi;
  +[VCBitrateArbiter updateMaxAllowedBitratePerConnection:p_maxAllowedBitrateWifi connectionType:3 negotiatedSettings:a3];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = *p_maxAllowedBitrate2G;
      unsigned int v13 = *p_maxAllowedBitrate3G;
      unsigned int v14 = *p_maxAllowedBitrateLTE;
      unsigned int v15 = *p_maxAllowedBitrateHighRat;
      unsigned int v16 = *p_maxAllowedBitrateWifi;
      int v17 = 136316930;
      uint64_t v18 = v10;
      __int16 v19 = 2080;
      __int16 v20 = "-[VCBitrateArbiter updateNegotiatedSettings:]";
      __int16 v21 = 1024;
      int v22 = 795;
      __int16 v23 = 1024;
      unsigned int v24 = v12;
      __int16 v25 = 1024;
      unsigned int v26 = v13;
      __int16 v27 = 1024;
      unsigned int v28 = v14;
      __int16 v29 = 1024;
      unsigned int v30 = v15;
      __int16 v31 = 1024;
      unsigned int v32 = v16;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _maxAllowedBitrate2G = %d,  _maxAllowedBitrate3G = %d, _maxAllowedBitrateLTE = %d, _maxAllowedBitrateHighRat = %d, _unsigned int maxAllowedBitrateWifi = %d", (uint8_t *)&v17, 0x3Au);
    }
  }
}

- (unsigned)maxAllowedBitrate
{
  return self->_maxAllowedBitrate;
}

- (unsigned)maxAllowedBitrate2G
{
  return self->_maxAllowedBitrate2G;
}

- (unsigned)maxAllowedBitrate3G
{
  return self->_maxAllowedBitrate3G;
}

- (unsigned)maxAllowedBitrateLTE
{
  return self->_maxAllowedBitrateLTE;
}

- (unsigned)maxAllowedBitrateHighRat
{
  return self->_maxAllowedBitrateHighRat;
}

- (unsigned)maxAllowedBitrateWifi
{
  return self->_maxAllowedBitrateWifi;
}

- (unsigned)maxAllowedBitrateTCPRelay
{
  return self->_maxAllowedBitrateTCPRelay;
}

- (unsigned)maxAllowedBitrateP2P
{
  return self->_maxAllowedBitrateP2P;
}

- (unsigned)maxAllowedBitrateUSB
{
  return self->_maxAllowedBitrateUSB;
}

- (void)maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected arbiterMode=%hhu", v2, v3, v4, v5);
}

- (void)maxAllowedBitrateForConnectionType:arbiterMode:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected arbiterMode=%hhu", v2, v3, v4, v5);
}

@end