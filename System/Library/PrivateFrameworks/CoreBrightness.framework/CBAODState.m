@interface CBAODState
+ (id)sharedInstance;
- ($9B79091F130840996C5B4CF8AB9B5A60)curve;
- ($9B79091F130840996C5B4CF8AB9B5A60)darkerCurve;
- (BOOL)enableAODLiveON;
- (BOOL)handleAODCurveUpdate:(id)a3;
- (BOOL)handleAODDarkerCurveUpdate:(id)a3;
- (BOOL)isAODActive;
- (BOOL)isAODSupported;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (CBAODState)init;
- (NSMutableArray)thresholdsAPDeltaPBrightenBuckets;
- (NSMutableArray)thresholdsAPDeltaPDimBuckets;
- (NSMutableArray)thresholdsAPLuxBuckets;
- (NSMutableArray)thresholdsDeltaPBrightenBuckets;
- (NSMutableArray)thresholdsDeltaPDimBuckets;
- (NSMutableArray)thresholdsLuxBuckets;
- (char)AODStateString;
- (float)AODTransitionProfileEaseInOut_K;
- (float)AODTransitionProfileSpring_damping;
- (float)AODTransitionProfileSpring_mass;
- (float)AODTransitionProfileSpring_stiffness;
- (float)AODTransitionProfileSpring_velocity;
- (float)AODTransitionTargetAlgoOptimised_dimmingThreshold;
- (float)maxAODNits;
- (float)minAODNits;
- (float)nitsCap;
- (float)pullALSUpdatePeriod;
- (float)thresholdPCCLuxDelta;
- (float)whitepointDeltaThreshold;
- (float)whitepointTransitionLength;
- (float)whitepointTransitionLengthLowLux;
- (float)whitepointTransitionLengthLuxThreshold;
- (id)copyNumberFromPrefsForKey:(id)a3;
- (unint64_t)AODState;
- (unint64_t)AODStateExternal;
- (unint64_t)AODTransitionProfile;
- (void)acquirePowerAssertion;
- (void)checkBootArgsConfiguration;
- (void)checkDefaultsConfiguration;
- (void)dealloc;
- (void)logAODCurve:(id *)a3 name:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)releasePowerAssertion;
- (void)setAODState:(unint64_t)a3;
- (void)setAODStateExternal:(unint64_t)a3;
- (void)setAODTransitionProfile:(unint64_t)a3;
- (void)setAODTransitionProfileEaseInOut_K:(float)a3;
- (void)setAODTransitionProfileSpring_damping:(float)a3;
- (void)setAODTransitionProfileSpring_mass:(float)a3;
- (void)setAODTransitionProfileSpring_stiffness:(float)a3;
- (void)setAODTransitionProfileSpring_velocity:(float)a3;
- (void)setAODTransitionTargetAlgoOptimised_dimmingThreshold:(float)a3;
- (void)setEnableAODLiveON:(BOOL)a3;
- (void)setIsAODSupported:(BOOL)a3;
- (void)setNitsCap:(float)a3;
- (void)setPullALSUpdatePeriod:(float)a3;
- (void)setWhitepointDeltaThreshold:(float)a3;
- (void)setWhitepointTransitionLength:(float)a3;
- (void)setWhitepointTransitionLengthLowLux:(float)a3;
- (void)setWhitepointTransitionLengthLuxThreshold:(float)a3;
@end

@implementation CBAODState

- (BOOL)isAODActive
{
  BOOL v3 = 1;
  if (self->_AODState != 1)
  {
    BOOL v3 = 1;
    if (self->_AODState != 3)
    {
      BOOL v3 = 1;
      if (self->_AODState != 2) {
        return self->_AODState == 4;
      }
    }
  }
  return v3;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v11 = 0;
  if ([a4 isEqualToString:@"AOTCurve"])
  {
    char v11 = [(CBAODState *)self handleAODCurveUpdate:a3];
  }
  else if ([a4 isEqualToString:@"AODDarkerCurve"])
  {
    char v11 = [(CBAODState *)self handleAODDarkerCurveUpdate:a3];
  }
  else if ([a4 isEqualToString:@"AODPullALSUpdatePeriod"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a3 floatValue];
      self->_pullALSUpdatePeriod = v4;
      char v11 = 1;
    }
  }
  else if ([a4 isEqualToString:@"AODWPTransitionLength"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a3 floatValue];
      self->_whitepointTransitionLength = v5;
      char v11 = 1;
    }
  }
  else if ([a4 isEqualToString:@"AODWPTransitionLengthLowLux"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a3 floatValue];
      self->_whitepointTransitionLengthLowLux = v6;
      char v11 = 1;
    }
  }
  else if ([a4 isEqualToString:@"AODWPDeltaThreshold"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a3 floatValue];
      self->_whitepointDeltaThreshold = v7;
      char v11 = 1;
    }
  }
  if (v11)
  {
    if (self->_logHandle)
    {
      logHandle = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)a4, (uint64_t)a3);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Set property %@ = %@", v15, 0x16u);
    }
  }
  return v11 & 1;
}

+ (id)sharedInstance
{
  id v11 = a1;
  SEL v10 = a2;
  objc_sync_enter(a1);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  float v7 = __28__CBAODState_sharedInstance__block_invoke;
  v8 = &unk_1E6218FE0;
  id v9 = v11;
  v13 = &sharedInstance_onceToken_3;
  v12 = &v4;
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(v13, v12);
  }
  objc_sync_exit(a1);
  return (id)sharedInstance__sharedObject_3;
}

- (unint64_t)AODState
{
  return self->_AODState;
}

uint64_t __28__CBAODState_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v4 = a1;
  uint64_t v3 = a1;
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)&OBJC_METACLASS___CBAODState;
  uint64_t result = objc_msgSend(objc_msgSendSuper2(&v2, sel_alloc), "init");
  sharedInstance__sharedObject_3 = result;
  return result;
}

- (CBAODState)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = self;
  SEL v15 = a2;
  v14.receiver = self;
  v14.super_class = (Class)CBAODState;
  uint64_t v16 = [(CBAODState *)&v14 init];
  if (v16)
  {
    os_log_t v2 = os_log_create("com.apple.CoreBrightness.AOD.CBAODState", "default");
    v16->_logHandle = (OS_os_log *)v2;
    v16->_AODState = 0;
    v16->_AODStateExternal = 0;
    v16->_enableAODLiveON = 0;
    v16->_AODTransitionProfile = 2;
    v16->_AODTransitionProfileEaseInOut_K = 3.0;
    v16->_AODTransitionProfileSpring_mass = 1.0;
    v16->_AODTransitionProfileSpring_damping = 3.48;
    v16->_AODTransitionProfileSpring_velocity = 2.0;
    v16->_AODTransitionProfileSpring_stiffness = 6.0;
    v16->_AODTransitionTargetAlgoOptimised_dimmingThreshold = 0.2;
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CoreBrightness"];
    v16->_defaults = (NSUserDefaults *)v3;
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, @"AODPullALSUpdatePeriod");
    [(NSUserDefaults *)v16->_defaults addObserver:v16 forKeyPath:@"AODWPTransitionLength" options:1 context:0];
    [(NSUserDefaults *)v16->_defaults addObserver:v16 forKeyPath:@"AODWPTransitionLengthLowLux" options:1 context:0];
    [(NSUserDefaults *)v16->_defaults addObserver:v16 forKeyPath:@"AODWPDeltaThreshold" options:1 context:0];
    [(NSUserDefaults *)v16->_defaults addObserver:v16 forKeyPath:@"AODTransitionProfileType" options:1 context:0];
    [(NSUserDefaults *)v16->_defaults addObserver:v16 forKeyPath:@"AODTransitionProfileEaseInOutK" options:1 context:0];
    [(NSUserDefaults *)v16->_defaults addObserver:v16 forKeyPath:@"AODTransitionProfileSpringMass" options:1 context:0];
    [(NSUserDefaults *)v16->_defaults addObserver:v16 forKeyPath:@"AODTransitionProfileSpringVelocity" options:1 context:0];
    [(NSUserDefaults *)v16->_defaults addObserver:v16 forKeyPath:@"AODTransitionProfileSpringStiffness" options:1 context:0];
    [(NSUserDefaults *)v16->_defaults addObserver:v16 forKeyPath:@"AODTransitionProfileSpringDamping" options:1 context:0];
    [(NSUserDefaults *)v16->_defaults addObserver:v16 forKeyPath:@"AODTRansitionTargetAlgoOptimisedDimThr" options:1 context:0];
    v16->_whitepointDeltaThreshold = 0.009;
    v16->_whitepointTransitionLength = 5.0;
    v16->_whitepointTransitionLengthLowLux = 5.0;
    v16->_whitepointTransitionLengthLuxThreshold = 35.0;
    v16->_pullALSUpdatePeriod = 5.0;
    long long v23 = xmmword_1BA60D6D0;
    int v24 = 713503427;
    long long v21 = xmmword_1BA60D6E4;
    int v22 = -1632750650;
    uint64_t v4 = MGIsDeviceOneOfType();
    if ((v4 & 1) != 0 && v16->_enableAODLiveON) {
      v16->_pullALSUpdatePeriod = 120.0;
    }
    context = (void *)MEMORY[0x1BA9ECAE0](v4, v5);
    uint64_t v6 = objc_msgSend(&unk_1F1418290, "mutableCopy", &v21, 0);
    v16->_thresholdsLuxBuckets = (NSMutableArray *)v6;
    uint64_t v7 = [&unk_1F14182A8 mutableCopy];
    v16->_thresholdsDeltaPBrightenBuckets = (NSMutableArray *)v7;
    uint64_t v8 = [&unk_1F14182C0 mutableCopy];
    v16->_thresholdsDeltaPDimBuckets = (NSMutableArray *)v8;
    uint64_t v9 = [&unk_1F14182D8 mutableCopy];
    v16->_thresholdsAPLuxBuckets = (NSMutableArray *)v9;
    uint64_t v10 = [&unk_1F14182F0 mutableCopy];
    v16->_thresholdsAPDeltaPBrightenBuckets = (NSMutableArray *)v10;
    uint64_t v11 = [&unk_1F1418308 mutableCopy];
    v16->_thresholdsAPDeltaPDimBuckets = (NSMutableArray *)v11;
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v16->_defaults, "addObserver:forKeyPath:options:context:", v16, @"AODThresholdsLuxBuckets");
    [(NSUserDefaults *)v16->_defaults addObserver:v16 forKeyPath:@"AODThresholdsDeltaPBrightenBuckets" options:1 context:0];
    [(NSUserDefaults *)v16->_defaults addObserver:v16 forKeyPath:@"AODThresholdsDeltaPDimBuckets" options:1 context:0];
    [(NSUserDefaults *)v16->_defaults addObserver:v16 forKeyPath:@"AODAPThresholdsLuxBuckets" options:1 context:0];
    [(NSUserDefaults *)v16->_defaults addObserver:v16 forKeyPath:@"AODAPThresholdsDeltaPBrightenBuckets" options:1 context:0];
    [(NSUserDefaults *)v16->_defaults addObserver:v16 forKeyPath:@"AODAPThresholdsDeltaPDimBuckets" options:1 context:0];
    v16->_thresholdPCCLuxDelta = 30.0;
    long long v19 = xmmword_1BA60D6F8;
    int v20 = 1176256512;
    long long v17 = xmmword_1BA60D70C;
    int v18 = 1140457472;
    __memcpy_chk();
    __memcpy_chk();
    v16->_curve.size = 5;
    __memcpy_chk();
    __memcpy_chk();
    v16->_darkerCurve.size = 5;
    v16->_nitsCap = -1.0;
    [(CBAODState *)v16 checkDefaultsConfiguration];
    [(CBAODState *)v16 checkBootArgsConfiguration];
  }
  return v16;
}

- (void)dealloc
{
  uint64_t v4 = self;
  SEL v3 = a2;

  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }

  if (v4->_systemActivityAssertion)
  {
    [(SWSystemActivityAssertion *)v4->_systemActivityAssertion invalidate];

    v4->_systemActivityAssertion = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBAODState;
  [(CBAODState *)&v2 dealloc];
}

- (char)AODStateString
{
  if (self->_AODState)
  {
    unint64_t AODState = self->_AODState;
    char v2 = 1;
  }
  else
  {
    unint64_t AODState = 0;
    char v2 = 0;
  }
  if (v2) {
    return "invalid";
  }
  switch(AODState)
  {
    case 0uLL:
      uint64_t v5 = "OFF";
      break;
    case 1uLL:
      uint64_t v5 = "ON";
      break;
    case 2uLL:
      uint64_t v5 = "prepare to enter";
      break;
    case 3uLL:
      uint64_t v5 = "entering";
      break;
    case 4uLL:
      uint64_t v5 = "exiting";
      break;
    default:
      JUMPOUT(0);
  }
  return v5;
}

- (void)checkDefaultsConfiguration
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (self->_defaults)
  {
    [(NSUserDefaults *)self->_defaults synchronize];
    id v46 = [(NSUserDefaults *)self->_defaults objectForKey:@"AODPullALSUpdatePeriod"];
    if (v46)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (self->_logHandle)
        {
          logHandle = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t inited = init_default_corebrightness_log();
          }
          logHandle = inited;
        }
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v80, @"AODPullALSUpdatePeriod", (uint64_t)v46);
          _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v80, 0x16u);
        }
        [v46 floatValue];
        self->_pullALSUpdatePeriod = v2;
      }
    }
    id v47 = [(NSUserDefaults *)self->_defaults objectForKey:@"AODWPTransitionLength"];
    if (v47)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (self->_logHandle)
        {
          v43 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v42 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v42 = init_default_corebrightness_log();
          }
          v43 = v42;
        }
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v79, @"AODWPTransitionLength", (uint64_t)v47);
          _os_log_impl(&dword_1BA438000, v43, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v79, 0x16u);
        }
        [v47 floatValue];
        self->_whitepointTransitionLength = v3;
      }
    }
    id v48 = [(NSUserDefaults *)self->_defaults objectForKey:@"AODWPTransitionLengthLowLux"];
    if (v48)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (self->_logHandle)
        {
          v41 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v40 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v40 = init_default_corebrightness_log();
          }
          v41 = v40;
        }
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v78, @"AODWPTransitionLengthLowLux", (uint64_t)v48);
          _os_log_impl(&dword_1BA438000, v41, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v78, 0x16u);
        }
        [v48 floatValue];
        self->_whitepointTransitionLengthLowLux = v4;
      }
    }
    id v49 = [(NSUserDefaults *)self->_defaults objectForKey:@"AODWPDeltaThreshold"];
    if (v49)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (self->_logHandle)
        {
          v39 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v38 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v38 = init_default_corebrightness_log();
          }
          v39 = v38;
        }
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v77, @"AODWPDeltaThreshold", (uint64_t)v49);
          _os_log_impl(&dword_1BA438000, v39, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v77, 0x16u);
        }
        [v49 floatValue];
        self->_whitepointDeltaThreshold = v5;
      }
    }
    id v50 = [(NSUserDefaults *)self->_defaults objectForKey:@"AODThresholdsLuxBuckets"];
    if (v50)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (self->_logHandle)
        {
          v37 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v36 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v36 = init_default_corebrightness_log();
          }
          v37 = v36;
        }
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v76, @"AODThresholdsLuxBuckets", (uint64_t)v50);
          _os_log_impl(&dword_1BA438000, v37, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v76, 0x16u);
        }

        self->_thresholdsLuxBuckets = (NSMutableArray *)[v50 mutableCopy];
      }
    }
    id v51 = [(NSUserDefaults *)self->_defaults objectForKey:@"AODThresholdsDeltaPBrightenBuckets"];
    if (v51)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (self->_logHandle)
        {
          v35 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v34 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v34 = init_default_corebrightness_log();
          }
          v35 = v34;
        }
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v75, @"AODThresholdsDeltaPBrightenBuckets", (uint64_t)v51);
          _os_log_impl(&dword_1BA438000, v35, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v75, 0x16u);
        }

        self->_thresholdsDeltaPBrightenBuckets = (NSMutableArray *)[v51 mutableCopy];
      }
    }
    id v52 = [(NSUserDefaults *)self->_defaults objectForKey:@"AODThresholdsDeltaPDimBuckets"];
    if (v52)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (self->_logHandle)
        {
          v33 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v32 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v32 = init_default_corebrightness_log();
          }
          v33 = v32;
        }
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v74, @"AODThresholdsDeltaPDimBuckets", (uint64_t)v52);
          _os_log_impl(&dword_1BA438000, v33, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v74, 0x16u);
        }

        self->_thresholdsDeltaPDimBuckets = (NSMutableArray *)[v52 mutableCopy];
      }
    }
    id v53 = [(NSUserDefaults *)self->_defaults objectForKey:@"AODAPThresholdsLuxBuckets"];
    if (v53)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (self->_logHandle)
        {
          v31 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v30 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v30 = init_default_corebrightness_log();
          }
          v31 = v30;
        }
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v73, @"AODThresholdsLuxBuckets", (uint64_t)v53);
          _os_log_impl(&dword_1BA438000, v31, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v73, 0x16u);
        }

        self->_thresholdsAPLuxBuckets = (NSMutableArray *)[v53 mutableCopy];
      }
    }
    id v54 = [(NSUserDefaults *)self->_defaults objectForKey:@"AODAPThresholdsDeltaPBrightenBuckets"];
    if (v54)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (self->_logHandle)
        {
          v29 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v28 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v28 = init_default_corebrightness_log();
          }
          v29 = v28;
        }
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v72, @"AODAPThresholdsDeltaPBrightenBuckets", (uint64_t)v54);
          _os_log_impl(&dword_1BA438000, v29, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v72, 0x16u);
        }

        self->_thresholdsAPDeltaPBrightenBuckets = (NSMutableArray *)[v54 mutableCopy];
      }
    }
    id v55 = [(NSUserDefaults *)self->_defaults objectForKey:@"AODAPThresholdsDeltaPDimBuckets"];
    if (v55)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (self->_logHandle)
        {
          v27 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v26 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v26 = init_default_corebrightness_log();
          }
          v27 = v26;
        }
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v71, @"AODAPThresholdsDeltaPDimBuckets", (uint64_t)v55);
          _os_log_impl(&dword_1BA438000, v27, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v71, 0x16u);
        }

        self->_thresholdsAPDeltaPDimBuckets = (NSMutableArray *)[v55 mutableCopy];
      }
    }
    id v56 = [(NSUserDefaults *)self->_defaults objectForKey:@"AODTransitionProfileType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self->_logHandle)
      {
        uint64_t v25 = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v24 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v24 = init_default_corebrightness_log();
        }
        uint64_t v25 = v24;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v70, @"AODTransitionProfileType", (uint64_t)v56);
        _os_log_impl(&dword_1BA438000, v25, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v70, 0x16u);
      }
      self->_AODTransitionProfile = [v56 integerValue];
    }
    id v57 = [(NSUserDefaults *)self->_defaults objectForKey:@"AODTransitionProfileEaseInOutK"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self->_logHandle)
      {
        long long v23 = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v22 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v22 = init_default_corebrightness_log();
        }
        long long v23 = v22;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v69, @"AODTransitionProfileEaseInOutK", (uint64_t)v57);
        _os_log_impl(&dword_1BA438000, v23, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v69, 0x16u);
      }
      [v57 floatValue];
      self->_AODTransitionProfileEaseInOut_K = v6;
    }
    id v58 = [(NSUserDefaults *)self->_defaults objectForKey:@"AODTransitionProfileSpringMass"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self->_logHandle)
      {
        long long v21 = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v20 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v20 = init_default_corebrightness_log();
        }
        long long v21 = v20;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v68, @"AODTransitionProfileSpringMass", (uint64_t)v58);
        _os_log_impl(&dword_1BA438000, v21, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v68, 0x16u);
      }
      [v58 floatValue];
      self->_AODTransitionProfileSpring_mass = v7;
    }
    id v59 = [(NSUserDefaults *)self->_defaults objectForKey:@"AODTransitionProfileSpringVelocity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self->_logHandle)
      {
        long long v19 = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v18 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v18 = init_default_corebrightness_log();
        }
        long long v19 = v18;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v67, @"AODTransitionProfileSpringVelocity", (uint64_t)v59);
        _os_log_impl(&dword_1BA438000, v19, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v67, 0x16u);
      }
      [v59 floatValue];
      self->_AODTransitionProfileSpring_velocity = v8;
    }
    id v60 = [(NSUserDefaults *)self->_defaults objectForKey:@"AODTransitionProfileSpringStiffness"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self->_logHandle)
      {
        long long v17 = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v16 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v16 = init_default_corebrightness_log();
        }
        long long v17 = v16;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v66, @"AODTransitionProfileSpringStiffness", (uint64_t)v60);
        _os_log_impl(&dword_1BA438000, v17, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v66, 0x16u);
      }
      [v60 floatValue];
      self->_AODTransitionProfileSpring_stiffness = v9;
    }
    id v61 = [(NSUserDefaults *)self->_defaults objectForKey:@"AODTransitionProfileSpringDamping"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self->_logHandle)
      {
        SEL v15 = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v14 = init_default_corebrightness_log();
        }
        SEL v15 = v14;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v65, @"AODTransitionProfileSpringDamping", (uint64_t)v61);
        _os_log_impl(&dword_1BA438000, v15, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v65, 0x16u);
      }
      [v61 floatValue];
      self->_AODTransitionProfileSpring_damping = v10;
    }
    id v62 = [(NSUserDefaults *)self->_defaults objectForKey:@"AODTRansitionTargetAlgoOptimisedDimThr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self->_logHandle)
      {
        v13 = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v12 = init_default_corebrightness_log();
        }
        v13 = v12;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v64, @"AODTRansitionTargetAlgoOptimisedDimThr", (uint64_t)v62);
        _os_log_impl(&dword_1BA438000, v13, OS_LOG_TYPE_DEFAULT, "Defaults configuration %@ = %@", v64, 0x16u);
      }
      [v62 floatValue];
      self->_AODTransitionTargetAlgoOptimised_dimmingThreshold = v11;
    }
  }
}

- (BOOL)enableAODLiveON
{
  float v10 = self;
  SEL v9 = a2;
  uint64_t v3 = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  float v6 = __29__CBAODState_enableAODLiveON__block_invoke;
  float v7 = &unk_1E6218FE0;
  float v8 = self;
  uint64_t v12 = &enableAODLiveON_once;
  float v11 = &v3;
  if (enableAODLiveON_once != -1) {
    dispatch_once(v12, v11);
  }
  return v10->_enableAODLiveON;
}

void __29__CBAODState_enableAODLiveON__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v5 = (void *)[*(id *)(a1 + 32) copyNumberFromPrefsForKey:@"CBSupportsAlwaysOnOverride"];
  if (v5)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = [v5 BOOLValue] & 1;
    if (*(void *)(*(void *)(a1 + 32) + 16))
    {
      uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      uint64_t v3 = inited;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(*(void *)(a1 + 32) + 32)) {
        v1 = "enabled";
      }
      else {
        v1 = "disabled";
      }
      __os_log_helper_16_2_1_8_32((uint64_t)v6, (uint64_t)v1);
      _os_log_impl(&dword_1BA438000, v3, OS_LOG_TYPE_DEFAULT, "AOD live-on %s by defaults config.", v6, 0xCu);
    }
  }
}

- (BOOL)isAODSupported
{
  float v10 = self;
  SEL v9 = a2;
  uint64_t v3 = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  float v6 = __28__CBAODState_isAODSupported__block_invoke;
  uint64_t v7 = &unk_1E6218FE0;
  float v8 = self;
  uint64_t v12 = &isAODSupported_once;
  float v11 = &v3;
  if (isAODSupported_once != -1) {
    dispatch_once(v12, v11);
  }
  return v10->_isAODSupported;
}

uint64_t __28__CBAODState_isAODSupported__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 0;
  uint64_t result = MGGetBoolAnswer();
  if (result)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
  }
  else
  {
    uint64_t result = [+[CBAODState sharedInstance] enableAODLiveON];
    *(unsigned char *)(*(void *)(a1 + 32) + 33) = result & 1;
  }
  return result;
}

- (id)copyNumberFromPrefsForKey:(id)a3
{
  int v5 = 0;
  if (self->_defaults)
  {
    [(NSUserDefaults *)self->_defaults synchronize];
    id v4 = [(NSUserDefaults *)self->_defaults objectForKey:a3];
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return v4;
      }
    }
  }
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v11, (uint64_t)a3, (uint64_t)a5);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Changed property %@ to value %@", v11, 0x16u);
  }
  [(CBAODState *)self checkDefaultsConfiguration];
}

- (void)checkBootArgsConfiguration
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = self;
  v6[1] = (size_t)a2;
  bzero(__s1, 0x400uLL);
  v6[0] = 1024;
  if (!sysctlbyname("kern.bootargs", __s1, v6, 0, 0))
  {
    int v5 = strstr(__s1, "cb_aod_enable_liveon");
    if (v5)
    {
      BOOL v2 = strtol(v5 + 21, 0, 0) != 0;
      v7->_enableAODLiveON = v2;
      id v4 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        if (v7->_enableAODLiveON) {
          uint64_t v3 = "Enable";
        }
        else {
          uint64_t v3 = "Disable";
        }
        __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
        _os_log_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEFAULT, "Boot arg override: %s AOD live-on.", v8, 0xCu);
      }
    }
  }
}

- (BOOL)handleAODCurveUpdate:(id)a3
{
  uint64_t v12 = self;
  SEL v11 = a2;
  id v10 = a3;
  char v9 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = (id)[v10 objectForKey:@"CurveLevelMed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = (id)[v8 valueForKey:@"lux"];
      id v6 = (id)[v8 valueForKey:@"nits"];
      unsigned __int8 v5 = [v7 count];
      dword_1E9F73CE8 = v5;
      [v7 enumerateObjectsUsingBlock:&__block_literal_global_4];
      [v6 enumerateObjectsUsingBlock:&__block_literal_global_134];
      memcpy(&v12->_curve, &handleAODCurveUpdate__newCurve, sizeof(v12->_curve));
      char v9 = 1;
    }
    memcpy(__dst, &v12->_curve, 0xA4uLL);
    [(CBAODState *)v12 logAODCurve:__dst name:@"Curve"];
  }
  return v9 & 1;
}

uint64_t __35__CBAODState_handleAODCurveUpdate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 floatValue];
  handleAODCurveUpdate__newCurve[a3] = v4;
  return result;
}

uint64_t __35__CBAODState_handleAODCurveUpdate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 floatValue];
  handleAODCurveUpdate__newCurve[a3 + 20] = v4;
  return result;
}

- (BOOL)handleAODDarkerCurveUpdate:(id)a3
{
  SEL v11 = self;
  SEL v10 = a2;
  id v9 = a3;
  char v8 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (id)[v9 valueForKey:@"lux"];
    id v6 = (id)[v9 valueForKey:@"nits"];
    unsigned __int8 v5 = [v7 count];
    dword_1E9F73D8C = v5;
    [v7 enumerateObjectsUsingBlock:&__block_literal_global_139];
    [v6 enumerateObjectsUsingBlock:&__block_literal_global_141];
    memcpy(&v11->_darkerCurve, &handleAODDarkerCurveUpdate__newCurve, sizeof(v11->_darkerCurve));
    char v8 = 1;
    memcpy(__dst, &v11->_darkerCurve, 0xA4uLL);
    [(CBAODState *)v11 logAODCurve:__dst name:@"DarkerCurve"];
  }
  return v8 & 1;
}

uint64_t __41__CBAODState_handleAODDarkerCurveUpdate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 floatValue];
  handleAODDarkerCurveUpdate__newCurve[a3] = v4;
  return result;
}

uint64_t __41__CBAODState_handleAODDarkerCurveUpdate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 floatValue];
  handleAODDarkerCurveUpdate__newCurve[a3 + 20] = v4;
  return result;
}

- (float)maxAODNits
{
  return self->_curve._E[self->_curve.size + 19];
}

- (float)minAODNits
{
  return self->_curve._L[0];
}

- (void)logAODCurve:(id *)a3 name:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  for (int i = 0; i < a3->var2; ++i)
  {
    if (a4)
    {
      if (self->_logHandle)
      {
        logHandle = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        logHandle = inited;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_4_8_64_4_0_8_0_8_0((uint64_t)v13, (uint64_t)a4, i, COERCE__INT64(a3->var0[i]), COERCE__INT64(a3->var1[i]));
        _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "%@[%d] = lux=%f ; nits=%f]", v13, 0x26u);
      }
    }
    else
    {
      if (self->_logHandle)
      {
        unsigned __int8 v5 = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v4 = init_default_corebrightness_log();
        }
        unsigned __int8 v5 = v4;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_3_4_0_8_0_8_0((uint64_t)v12, i, COERCE__INT64(a3->var0[i]), COERCE__INT64(a3->var1[i]));
        _os_log_impl(&dword_1BA438000, v5, OS_LOG_TYPE_DEFAULT, "Curve[%d] = lux=%f ; nits=%f]", v12, 0x1Cu);
      }
    }
  }
}

- (void)acquirePowerAssertion
{
  SEL v11 = self;
  SEL v10 = a2;
  objc_sync_enter(self);
  if (v11->_systemActivityAssertion)
  {
    [(SWSystemActivityAssertion *)v11->_systemActivityAssertion invalidate];

    v11->_systemActivityAssertion = 0;
  }
  v11->_systemActivityAssertion = (SWSystemActivityAssertion *)[objc_alloc(MEMORY[0x1E4FA9998]) initWithIdentifier:@"CoreBrightness AOD transitions in progress."];
  systemActivityAssertion = v11->_systemActivityAssertion;
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __35__CBAODState_acquirePowerAssertion__block_invoke;
  char v8 = &unk_1E6219908;
  id v9 = v11;
  -[SWSystemActivityAssertion acquireWithTimeout:handler:](systemActivityAssertion, "acquireWithTimeout:handler:", 10.0);
  objc_sync_exit(self);
}

void __35__CBAODState_acquirePowerAssertion__block_invoke(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v9 = a2 & 1;
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    int v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    int v5 = inited;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_4_4_0_8_66_8_66_8_0((uint64_t)v10, v9 & 1, a4, a3, *(void *)(*(void *)(a1 + 32) + 24));
    _os_log_impl(&dword_1BA438000, v5, OS_LOG_TYPE_DEFAULT, "[Power Assertion] Acquired=%d (details:%{public}@ error:%{public}@ assertionObj=%p)", v10, 0x26u);
  }
}

- (void)releasePowerAssertion
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  systemActivityAssertion = self->_systemActivityAssertion;
  char v5 = 0;
  if (systemActivityAssertion)
  {
    [(SWSystemActivityAssertion *)self->_systemActivityAssertion invalidate];

    self->_systemActivityAssertion = 0;
    char v5 = 1;
  }
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_2_4_0_8_0((uint64_t)v8, v5 & 1, (uint64_t)systemActivityAssertion);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "[Power Assertion] Released=%d (assertionObj=0x%lx)", v8, 0x12u);
  }
  objc_sync_exit(self);
}

- (void)setAODState:(unint64_t)a3
{
  self->_unint64_t AODState = a3;
}

- (unint64_t)AODStateExternal
{
  return self->_AODStateExternal;
}

- (void)setAODStateExternal:(unint64_t)a3
{
  self->_AODStateExternal = a3;
}

- (void)setEnableAODLiveON:(BOOL)a3
{
  self->_enableAODLiveON = a3;
}

- (NSMutableArray)thresholdsLuxBuckets
{
  return self->_thresholdsLuxBuckets;
}

- (NSMutableArray)thresholdsDeltaPBrightenBuckets
{
  return self->_thresholdsDeltaPBrightenBuckets;
}

- (NSMutableArray)thresholdsDeltaPDimBuckets
{
  return self->_thresholdsDeltaPDimBuckets;
}

- (NSMutableArray)thresholdsAPLuxBuckets
{
  return self->_thresholdsAPLuxBuckets;
}

- (NSMutableArray)thresholdsAPDeltaPBrightenBuckets
{
  return self->_thresholdsAPDeltaPBrightenBuckets;
}

- (NSMutableArray)thresholdsAPDeltaPDimBuckets
{
  return self->_thresholdsAPDeltaPDimBuckets;
}

- (float)thresholdPCCLuxDelta
{
  return self->_thresholdPCCLuxDelta;
}

- (unint64_t)AODTransitionProfile
{
  return self->_AODTransitionProfile;
}

- (void)setAODTransitionProfile:(unint64_t)a3
{
  self->_AODTransitionProfile = a3;
}

- (float)AODTransitionProfileEaseInOut_K
{
  return self->_AODTransitionProfileEaseInOut_K;
}

- (void)setAODTransitionProfileEaseInOut_K:(float)a3
{
  self->_AODTransitionProfileEaseInOut_K = a3;
}

- (float)AODTransitionProfileSpring_mass
{
  return self->_AODTransitionProfileSpring_mass;
}

- (void)setAODTransitionProfileSpring_mass:(float)a3
{
  self->_AODTransitionProfileSpring_mass = a3;
}

- (float)AODTransitionProfileSpring_velocity
{
  return self->_AODTransitionProfileSpring_velocity;
}

- (void)setAODTransitionProfileSpring_velocity:(float)a3
{
  self->_AODTransitionProfileSpring_velocity = a3;
}

- (float)AODTransitionProfileSpring_damping
{
  return self->_AODTransitionProfileSpring_damping;
}

- (void)setAODTransitionProfileSpring_damping:(float)a3
{
  self->_AODTransitionProfileSpring_damping = a3;
}

- (float)AODTransitionProfileSpring_stiffness
{
  return self->_AODTransitionProfileSpring_stiffness;
}

- (void)setAODTransitionProfileSpring_stiffness:(float)a3
{
  self->_AODTransitionProfileSpring_stiffness = a3;
}

- (float)AODTransitionTargetAlgoOptimised_dimmingThreshold
{
  return self->_AODTransitionTargetAlgoOptimised_dimmingThreshold;
}

- (void)setAODTransitionTargetAlgoOptimised_dimmingThreshold:(float)a3
{
  self->_AODTransitionTargetAlgoOptimised_dimmingThreshold = a3;
}

- (void)setIsAODSupported:(BOOL)a3
{
  self->_isAODSupported = a3;
}

- (float)pullALSUpdatePeriod
{
  return self->_pullALSUpdatePeriod;
}

- (void)setPullALSUpdatePeriod:(float)a3
{
  self->_pullALSUpdatePeriod = a3;
}

- (float)nitsCap
{
  return self->_nitsCap;
}

- (void)setNitsCap:(float)a3
{
  self->_nitsCap = a3;
}

- ($9B79091F130840996C5B4CF8AB9B5A60)curve
{
  objc_copyStruct(retstr, &self->_curve, 164, 1, 0);
  return result;
}

- ($9B79091F130840996C5B4CF8AB9B5A60)darkerCurve
{
  objc_copyStruct(retstr, &self->_darkerCurve, 164, 1, 0);
  return result;
}

- (float)whitepointTransitionLength
{
  return self->_whitepointTransitionLength;
}

- (void)setWhitepointTransitionLength:(float)a3
{
  self->_whitepointTransitionLength = a3;
}

- (float)whitepointTransitionLengthLowLux
{
  return self->_whitepointTransitionLengthLowLux;
}

- (void)setWhitepointTransitionLengthLowLux:(float)a3
{
  self->_whitepointTransitionLengthLowLux = a3;
}

- (float)whitepointTransitionLengthLuxThreshold
{
  return self->_whitepointTransitionLengthLuxThreshold;
}

- (void)setWhitepointTransitionLengthLuxThreshold:(float)a3
{
  self->_whitepointTransitionLengthLuxThreshold = a3;
}

- (float)whitepointDeltaThreshold
{
  return self->_whitepointDeltaThreshold;
}

- (void)setWhitepointDeltaThreshold:(float)a3
{
  self->_whitepointDeltaThreshold = a3;
}

@end