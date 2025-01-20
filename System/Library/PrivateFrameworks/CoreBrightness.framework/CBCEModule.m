@interface CBCEModule
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (CBCEModule)initWithQueue:(id)a3 ceModelID:(unsigned int)a4;
- (Class)modelClass;
- (Class)modelInputClass;
- (id)copyInference:(id)a3;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4;
- (id)setModelInputWithAlsEvent:(id)a3 ceInput:(id)a4;
- (id)setModelInputWithXtalkArr:(id)a3 alsArr:(id)a4 alsRatioArr:(id)a5 X:(double)a6 Y:(double)a7 Z:(double)a8 CCT:(double)a9 u:(double)a10 v:(double)a11 lux:(double)a12 nits:(double)a13 iTime:(double)a14 gain:(double)a15 x:(double)a16 y:(double)a17 a:(double)a18 b:(double)a19 ceInput:(id)a20;
- (void)dealloc;
- (void)sendNotificationForKey:(id)a3 withValue:(id)a4;
- (void)setModelClass:(Class)a3;
- (void)setModelInputClass:(Class)a3;
@end

@implementation CBCEModule

- (id)setModelInputWithXtalkArr:(id)a3 alsArr:(id)a4 alsRatioArr:(id)a5 X:(double)a6 Y:(double)a7 Z:(double)a8 CCT:(double)a9 u:(double)a10 v:(double)a11 lux:(double)a12 nits:(double)a13 iTime:(double)a14 gain:(double)a15 x:(double)a16 y:(double)a17 a:(double)a18 b:(double)a19 ceInput:(id)a20
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v61 = self;
  SEL v60 = a2;
  id v59 = a3;
  id v58 = a4;
  id v57 = a5;
  double v56 = a6;
  double v55 = a7;
  double v54 = a8;
  double v53 = a9;
  double v52 = a10;
  double v51 = a11;
  double v50 = a12;
  double v49 = a13;
  double v48 = a14;
  double v47 = a15;
  double v46 = a16;
  double v45 = a17;
  double v44 = a18;
  double v43 = a19;
  id v42 = a20;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  v41 = &unk_1F1418350;
  uint64_t v40 = 0;
  id v20 = objc_alloc((Class)getMLMultiArrayClass());
  v39 = (void *)[v20 initWithShape:v41 dataType:65568 error:&v40];
  if (v40)
  {
    if (v61->super._logHandle)
    {
      logHandle = v61->super._logHandle;
    }
    else
    {
      uint64_t v31 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      logHandle = v31;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v63, v40);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Error generating the input for CE: %@", v63, 0xCu);
    }
  }
  int v37 = 0;
  for (int i = 0; i < 5; ++i)
  {
    ++v37;
    objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(v59, "objectAtIndexedSubscript:", i));
    currentInputDict = v61->_currentInputDict;
    uint64_t v29 = [v59 objectAtIndexedSubscript:i];
    -[NSMutableDictionary setValue:forKey:](currentInputDict, "setValue:forKey:", v29, objc_msgSend(NSString, "stringWithFormat:", @"xtalk%d", i));
  }
  for (int j = 0; j < 5; ++j)
  {
    ++v37;
    objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(v58, "objectAtIndexedSubscript:", j));
    v28 = v61->_currentInputDict;
    uint64_t v27 = [v58 objectAtIndexedSubscript:j];
    -[NSMutableDictionary setValue:forKey:](v28, "setValue:forKey:", v27, objc_msgSend(NSString, "stringWithFormat:", @"als%d", j));
  }
  for (int k = 0; k < 5; ++k)
  {
    ++v37;
    objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(v57, "objectAtIndexedSubscript:", k));
    v26 = v61->_currentInputDict;
    uint64_t v25 = [v57 objectAtIndexedSubscript:k];
    -[NSMutableDictionary setValue:forKey:](v26, "setValue:forKey:", v25, objc_msgSend(NSString, "stringWithFormat:", @"alsRatio%d", k));
  }
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v56));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v55));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v54));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v53));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v52));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v51));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v50));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v49));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v48));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v47));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v46));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v45));
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v44));
  int v38 = v37 + 14;
  objc_msgSend(v39, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v43));
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", [NSNumber numberWithDouble:v56], @"X");
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", [NSNumber numberWithDouble:v55], @"Y");
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", [NSNumber numberWithDouble:v54], @"Z");
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", [NSNumber numberWithDouble:v53], @"CCT");
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", [NSNumber numberWithDouble:v52], @"uPrime");
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", [NSNumber numberWithDouble:v51], @"vPrime");
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", [NSNumber numberWithDouble:v50], @"lux");
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", [NSNumber numberWithDouble:v49], @"nits");
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", [NSNumber numberWithDouble:v48], @"iTime");
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", [NSNumber numberWithDouble:v47], @"gain");
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", [NSNumber numberWithDouble:v46], @"x");
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", [NSNumber numberWithDouble:v45], @"y");
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", [NSNumber numberWithDouble:v44], @"a");
  -[NSMutableDictionary setValue:forKey:](v61->_currentInputDict, "setValue:forKey:", [NSNumber numberWithDouble:v43], @"b");
  if (v61->super._logHandle)
  {
    v24 = v61->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    v24 = inited;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v62, (uint64_t)v39);
    _os_log_impl(&dword_1BA438000, v24, OS_LOG_TYPE_DEFAULT, "mlmArrIn: %@", v62, 0xCu);
  }
  if (v38 != 29) {
    __assert_rtn("-[CBCEModule setModelInputWithXtalkArr:alsArr:alsRatioArr:X:Y:Z:CCT:u:v:lux:nits:iTime:gain:x:y:a:b:ceInput:]", "CBCEModule.m", 304, "j == FEATURE_CNT");
  }
  id v42 = (id)[v42 initWithInput:v39];
  id v21 = v39;
  return v42;
}

- (id)setModelInputWithAlsEvent:(id)a3 ceInput:(id)a4
{
  double v43 = self;
  SEL v42 = a2;
  id v41 = a3;
  id v40 = a4;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  memset(__b, 0, sizeof(__b));
  if (v41) {
    [v41 vendorData];
  }
  else {
    memset(__b, 0, sizeof(__b));
  }
  id v38 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
  for (int i = 0; i < 5; ++i)
    objc_msgSend(v38, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *(unsigned int *)&__b[4 * i + 83]));
  int v36 = __b[4];
  id v35 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:__b[4]];
  for (int j = 0; j < v36; ++j)
  {
    *(float *)&double v4 = fmaxf(1.0, *(float *)&__b[4 * j + 28]);
    objc_msgSend(v35, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v4));
  }
  id v33 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
  for (int k = 0; k < 5; ++k)
  {
    objc_msgSend((id)objc_msgSend(v38, "objectAtIndexedSubscript:", k), "doubleValue");
    double v12 = v5;
    objc_msgSend((id)objc_msgSend(v35, "objectAtIndexedSubscript:", k), "doubleValue");
    double v31 = v12 / v6;
    objc_msgSend(v33, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", v12 / v6));
  }
  double v30 = 0.0;
  if (v41) {
    [v41 colorSample];
  }
  else {
    memset(&v29[15], 0, 0x3CuLL);
  }
  float v11 = v29[15];
  if (v41) {
    [v41 colorSample];
  }
  else {
    memset(v29, 0, 0x3CuLL);
  }
  double v30 = (float)(v11 / v29[1]);
  double v28 = 0.0;
  if (v41) {
    [v41 colorSample];
  }
  else {
    memset(&v27[15], 0, 0x3CuLL);
  }
  float v10 = v27[16];
  if (v41) {
    [v41 colorSample];
  }
  else {
    memset(v27, 0, 0x3CuLL);
  }
  double v28 = (float)(v10 / v27[1]);
  double v26 = 0.0;
  if (v41) {
    [v41 colorSample];
  }
  else {
    memset((char *)&v25[8] + 4, 0, 0x3CuLL);
  }
  float v9 = *((float *)&v25[9] + 1);
  if (v41) {
    [v41 colorSample];
  }
  else {
    memset(&v25[1], 0, 0x3CuLL);
  }
  double v26 = (float)(v9 / *((float *)&v25[1] + 1));
  v25[0] = 0;
  if (v41) {
    [v41 colorSample];
  }
  else {
    memset(v24, 0, sizeof(v24));
  }
  v25[0] = *(void *)&v24[3];
  double v23 = CFXChromaticity2CCT((float *)v25);
  double v22 = 4.0 * v30 / (v30 + 15.0 * v28 + 3.0 * v26);
  double v21 = 9.0 * v28 / (v30 + 15.0 * v28 + 3.0 * v26);
  double v20 = *(float *)&__b[20];
  double v19 = (double)*(unsigned __int16 *)&__b[6];
  double v18 = *(float *)v25;
  double v17 = *((float *)v25 + 1);
  uint64_t v15 = 0;
  float v16 = 0.0;
  if (v41) {
    [v41 colorSample];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  CFXTristimulus2Lab(v14, (float *)&v15);
  *(double *)&unint64_t v7 = v16;
  LODWORD(v7) = *(_DWORD *)&__b[8];
  id v40 = -[CBCEModule setModelInputWithXtalkArr:alsArr:alsRatioArr:X:Y:Z:CCT:u:v:lux:nits:iTime:gain:x:y:a:b:ceInput:](v43, "setModelInputWithXtalkArr:alsArr:alsRatioArr:X:Y:Z:CCT:u:v:lux:nits:iTime:gain:x:y:a:b:ceInput:", v38, v35, v33, v40, v30, v28, v26, v23, v22, v21, v20, v19, (double)v7 / 1000.0, (double)(*(int *)&__b[16] >> 16), *(void *)&v18, *(void *)&v17, *((float *)&v15 + 1),
          v16);
  return v40;
}

- (id)copyInference:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = self;
  SEL v28 = a2;
  id v27 = a3;
  double v26 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v25 = v27;
    context = (void *)MEMORY[0x1BA9ECAE0](-[NSMutableDictionary setObject:forKey:](v29->_alsEvents, "setObject:forKey:", v27, [v27 serviceRegistryID]));
    uint64_t v24 = 0;
    if (v29->_overriding) {
      v29->_currentInput = v29->_overriddenInput;
    }
    else {
      v29->_currentInput = [(CBCEModule *)v29 setModelInputWithAlsEvent:v25 ceInput:v29->_currentInput];
    }
    double v23 = (void *)[v29->_model predictionFromFeatures:v29->_currentInput error:&v24];
    if (v24)
    {
      if (v29->super._logHandle)
      {
        logHandle = v29->super._logHandle;
      }
      else
      {
        uint64_t v16 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        logHandle = v16;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v32, v24);
        _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "prediction_error: %@", v32, 0xCu);
      }
    }
    if (v29->super._logHandle)
    {
      uint64_t v15 = v29->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      uint64_t v15 = inited;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v31, (uint64_t)v29->_currentInputDict);
      _os_log_impl(&dword_1BA438000, v15, OS_LOG_TYPE_DEFAULT, "[V2.1] Input features: %@", v31, 0xCu);
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "featureValueForName:", @"strength_output"), "multiArrayValue"), "objectAtIndexedSubscript:"), "floatValue");
    double v22 = v3;
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "featureValueForName:", @"uncertainty"), "multiArrayValue"), "objectAtIndexedSubscript:", 0), "floatValue");
    double v21 = v4;
    float v5 = v22 * 100.0;
    double v20 = (void *)[NSNumber numberWithDouble:(double)(uint64_t)llroundf(v5) / 100.0];
    double v6 = 1.0 - v21;
    *(float *)&double v6 = 1.0 - v21;
    double v19 = (void *)[NSNumber numberWithFloat:v6];
    double v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v20, @"CEStrength", v19, @"CEConfidence", 0);
    [v20 floatValue];
    objc_msgSend(v25, "setStrength:");
    [v19 floatValue];
    objc_msgSend(v25, "setConfidence:");
    if (v29->super._logHandle)
    {
      v13 = v29->super._logHandle;
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
      float v10 = NSStringFromClass([(CBCEModule *)v29 modelClass]);
      [v25 strength];
      *(double *)&uint64_t v11 = v7;
      [v25 confidence];
      __os_log_helper_16_2_3_8_64_8_0_8_0((uint64_t)v30, (uint64_t)v10, v11, COERCE__INT64(v8));
      _os_log_impl(&dword_1BA438000, v13, OS_LOG_TYPE_DEFAULT, "[%@]strength: %.2f, confidence: %f", v30, 0x20u);
    }
    if (v29->_overriding) {
      [(CBCEModule *)v29 sendNotificationForKey:@"CEOverride" withValue:v29->_currentInputDict];
    }
    [(CBCEModule *)v29 sendNotificationForKey:@"CEInput" withValue:v29->_currentInputDict];
    [(CBCEModule *)v29 sendNotificationForKey:@"CEOutput" withValue:v26];
  }
  [(NSMutableDictionary *)v29->_currentOutputDict setDictionary:v26];
  return v26;
}

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  if (self->super._notificationBlock) {
    (*((void (**)(void))self->super._notificationBlock + 2))();
  }
}

- (Class)modelClass
{
  return self->_modelClass;
}

- (CBCEModule)initWithQueue:(id)a3 ceModelID:(unsigned int)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v26 = self;
  SEL v25 = a2;
  id v24 = a3;
  unsigned int v23 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CBCEModule;
  double v26 = [(CBModule *)&v22 initWithQueue:a3];
  if (v26)
  {
    os_log_t v4 = os_log_create("com.apple.CoreBrightness.CBCEModule", "default");
    v26->super._logHandle = (OS_os_log *)v4;
    float v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v26->_alsEvents = v5;
    double v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v26->_currentInputDict = v6;
    float v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v26->_currentOutputDict = v7;
    double v21 = (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"CBCE%d", v23);
    os_log_t v20 = 0;
    if (v26->super._logHandle)
    {
      logHandle = v26->super._logHandle;
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
    os_log_t v20 = logHandle;
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v27, (uint64_t)v21);
      _os_log_impl(&dword_1BA438000, v20, v19, "Modelname: %@", v27, 0xCu);
    }
    Class v8 = NSClassFromString(v21);
    [(CBCEModule *)v26 setModelClass:v8];
    uint64_t v18 = 0;
    id v17 = objc_alloc_init((Class)getMLModelConfigurationClass());
    [v17 setComputeUnits:0];
    uint64_t v9 = objc_msgSend(objc_alloc(-[CBCEModule modelClass](v26, "modelClass")), "initWithConfiguration:error:", v17, &v18);
    v26->_model = (id)v9;

    id v10 = v26->_model;
    Class v11 = NSClassFromString((NSString *)[NSString stringWithFormat:@"%@Input", v21]);
    [(CBCEModule *)v26 setModelInputClass:v11];
    id v12 = objc_alloc([(CBCEModule *)v26 modelInputClass]);
    v26->_overriddenInput = v12;
    id v13 = objc_alloc([(CBCEModule *)v26 modelInputClass]);
    v26->_currentInput = v13;
  }
  return v26;
}

- (void)dealloc
{
  os_log_t v4 = self;
  SEL v3 = a2;
  if (self->super._logHandle)
  {

    v4->super._logHandle = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBCEModule;
  [(CBModule *)&v2 dealloc];
}

- (id)copyPropertyForKey:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
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
    __os_log_helper_16_2_1_8_64((uint64_t)v15, (uint64_t)a3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "copyPropertyForKey called with key: %@", v15, 0xCu);
  }
  id v10 = 0;
  if ([a3 isEqualToString:@"CEOutput"])
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:self->_currentOutputDict copyItems:1];
    if (self->super._logHandle)
    {
      float v7 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v6 = init_default_corebrightness_log();
      }
      float v7 = v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v14, (uint64_t)v10);
      _os_log_impl(&dword_1BA438000, v7, OS_LOG_TYPE_DEFAULT, "copyPropertyForKey returning value: %@", v14, 0xCu);
    }
  }
  else if (([a3 isEqualToString:@"CEInput"] & 1) != 0 {
         || ([a3 isEqualToString:@"CEOverride"] & 1) != 0 && self->_overriding)
  }
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:self->_currentInputDict copyItems:1];
    if (self->super._logHandle)
    {
      float v5 = self->super._logHandle;
    }
    else
    {
      uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      float v5 = v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v13, (uint64_t)self->_currentInputDict);
      _os_log_impl(&dword_1BA438000, v5, OS_LOG_TYPE_DEFAULT, "copyPropertyForKey returning value: %@", v13, 0xCu);
    }
  }
  return v10;
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v67, (uint64_t)a3, (uint64_t)a4);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "setProperty called with property: %@ and key: %@", v67, 0x16u);
  }
  if ([a4 isEqualToString:@"CEOverride"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_overriding = 1;
      context = (void *)MEMORY[0x1BA9ECAE0]();
      if (self->super._logHandle)
      {
        uint64_t v33 = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v32 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v32 = init_default_corebrightness_log();
        }
        uint64_t v33 = v32;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v66, (uint64_t)a3);
        _os_log_debug_impl(&dword_1BA438000, v33, OS_LOG_TYPE_DEBUG, "Property: %@", v66, 0xCu);
      }
      id v56 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
      for (int i = 0; i < 5; ++i)
        objc_msgSend(v56, "addObject:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"crossTalk"), "objectAtIndexedSubscript:", i));
      if (self->super._logHandle)
      {
        double v31 = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v30 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v30 = init_default_corebrightness_log();
        }
        double v31 = v30;
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v65, (uint64_t)v56);
        _os_log_debug_impl(&dword_1BA438000, v31, OS_LOG_TYPE_DEBUG, "xtalk: %@", v65, 0xCu);
      }
      id v54 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
      for (int j = 0; j < 5; ++j)
        objc_msgSend(v54, "addObject:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"ALSRaw"), "objectAtIndexedSubscript:", j));
      if (self->super._logHandle)
      {
        uint64_t v29 = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v28 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v28 = init_default_corebrightness_log();
        }
        uint64_t v29 = v28;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v64, (uint64_t)v54);
        _os_log_debug_impl(&dword_1BA438000, v29, OS_LOG_TYPE_DEBUG, "alsraw: %@", v64, 0xCu);
      }
      id v52 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
      for (int k = 0; k < 5; ++k)
        objc_msgSend(v52, "addObject:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"ALSRatio"), "objectAtIndexedSubscript:", k));
      if (self->super._logHandle)
      {
        id v27 = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v26 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v26 = init_default_corebrightness_log();
        }
        id v27 = v26;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v63, (uint64_t)v52);
        _os_log_debug_impl(&dword_1BA438000, v27, OS_LOG_TYPE_DEBUG, "alsRatio: %@", v63, 0xCu);
      }
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"X"), "doubleValue");
      uint64_t v50 = v4;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"Y"), "doubleValue");
      uint64_t v49 = v5;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"Z"), "doubleValue");
      uint64_t v48 = v6;
      if (self->super._logHandle)
      {
        SEL v25 = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v24 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v24 = init_default_corebrightness_log();
        }
        SEL v25 = v24;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v62, v50, v49, v48);
        _os_log_debug_impl(&dword_1BA438000, v25, OS_LOG_TYPE_DEBUG, "XYZ: %f,%f,%f", v62, 0x20u);
      }
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"CCT"), "doubleValue");
      uint64_t v47 = v7;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"uPrime"), "doubleValue");
      uint64_t v46 = v8;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vPrime"), "doubleValue");
      uint64_t v45 = v9;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"lux"), "doubleValue");
      uint64_t v44 = v10;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"nits"), "doubleValue");
      uint64_t v43 = v11;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"iTime"), "doubleValue");
      uint64_t v42 = v12;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"gain"), "doubleValue");
      uint64_t v41 = v13;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"x"), "doubleValue");
      uint64_t v40 = v14;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"y"), "doubleValue");
      uint64_t v39 = v15;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"a"), "doubleValue");
      uint64_t v38 = v16;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"b"), "doubleValue");
      uint64_t v37 = v17;
      if (self->super._logHandle)
      {
        unsigned int v23 = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v22 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v22 = init_default_corebrightness_log();
        }
        unsigned int v23 = v22;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_11_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v61, v47, v46, v45, v44, v43, v42, v41, v40, v39, v38, v37);
        _os_log_debug_impl(&dword_1BA438000, v23, OS_LOG_TYPE_DEBUG, "CCT: %f, uPrime:%f, vPrime:%f, lux:%f, nits:%f, iTime:%f, gain: %f, x:%f, y:%f, a:%f, b:%f", v61, 0x70u);
      }
      self->_id overriddenInput = -[CBCEModule setModelInputWithXtalkArr:alsArr:alsRatioArr:X:Y:Z:CCT:u:v:lux:nits:iTime:gain:x:y:a:b:ceInput:](self, "setModelInputWithXtalkArr:alsArr:alsRatioArr:X:Y:Z:CCT:u:v:lux:nits:iTime:gain:x:y:a:b:ceInput:", v56, v54, v52, self->_overriddenInput, *(double *)&v50, *(double *)&v49, *(double *)&v48, *(double *)&v47, *(double *)&v46, *(double *)&v45, *(double *)&v44, *(double *)&v43, v42, v41, v40, v39, v38,
                                 v37);
    }
  }
  else if ([a4 isEqualToString:@"CEOverrideEnabled"])
  {
    self->_overriding = [a3 BOOLValue] & 1;
    if (self->super._logHandle)
    {
      double v21 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v20 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v20 = init_default_corebrightness_log();
      }
      double v21 = v20;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v60, self->_overriding);
      _os_log_impl(&dword_1BA438000, v21, OS_LOG_TYPE_INFO, "Setting CEOverride to %d", v60, 8u);
    }
    if (self->_overriding) {
      id overriddenInput = self->_overriddenInput;
    }
    else {
      id overriddenInput = 0;
    }
    self->_id overriddenInput = overriddenInput;
  }
  return 0;
}

- (void)setModelClass:(Class)a3
{
  self->_modelClass = a3;
}

- (Class)modelInputClass
{
  return self->_modelInputClass;
}

- (void)setModelInputClass:(Class)a3
{
  self->_modelInputClass = a3;
}

@end