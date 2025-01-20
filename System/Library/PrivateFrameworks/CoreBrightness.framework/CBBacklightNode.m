@interface CBBacklightNode
- (CBBacklightNode)initWithService:(unsigned int)a3;
- (CBChromaticCorrectionParams)ammolite;
- (CBRTPLCParams)rtplc;
- (CBTwilightParams)twilight;
- (__CFDictionary)copyRestrictionDictionaryMultiPoint;
- (id)newMultiPointFactorsArray:(id)a3;
- (id)newMultiPointThresholdsArray:(id)a3;
- (int)createMultipointRestrictionArrayForThresholdsName:(id)a3 andFactorsName:(id)a4 andThresholds:(id *)a5 andFactors:(id *)a6;
- (int)grimaldiSamplingStrategy;
- (unsigned)createMultipointArrayCommon:(id)a3 unitSize:(unint64_t *)a4 outputCount:(unint64_t *)a5;
- (void)dealloc;
- (void)initPropertiesFromService:(unsigned int)a3;
@end

@implementation CBBacklightNode

- (CBRTPLCParams)rtplc
{
  return self->_rtplc;
}

- (CBBacklightNode)initWithService:(unsigned int)a3
{
  v21 = self;
  SEL v20 = a2;
  unsigned int v19 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CBBacklightNode;
  v21 = [(CBBacklightNode *)&v18 init];
  if (!v21) {
    return v21;
  }
  if (v19)
  {
    v21->_service = v19;
    v4 = [CBRTPLCParams alloc];
    uint64_t v5 = [(CBRTPLCParams *)v4 initWithService:v19];
    v21->_rtplc = (CBRTPLCParams *)v5;
    v6 = [CBTwilightParams alloc];
    uint64_t v7 = [(CBTwilightParams *)v6 initWithService:v19];
    v21->_twilight = (CBTwilightParams *)v7;
    v8 = [CBChromaticCorrectionParams alloc];
    uint64_t v9 = [(CBChromaticCorrectionParams *)v8 initFromAmmoliteFromService:v19];
    v21->_ammolite = (CBChromaticCorrectionParams *)v9;
    [(CBBacklightNode *)v21 initPropertiesFromService:v19];
    return v21;
  }
  os_log_t v3 = os_log_create("com.apple.CoreBrightness.BacklightNode", "default");
  v21->_log = (OS_os_log *)v3;
  os_log_t oslog = 0;
  if (v21->_log)
  {
    v14 = v21->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    v14 = inited;
  }
  os_log_t oslog = v14;
  os_log_type_t type = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    log = oslog;
    os_log_type_t v12 = type;
    __os_log_helper_16_0_0(v15);
    _os_log_error_impl(&dword_1BA438000, log, v12, "Service is null", v15, 2u);
  }

  return v21;
}

- (void)initPropertiesFromService:(unsigned int)a3
{
  if ((load_int_from_edt(a3, @"grimaldi-sampling-strategy", &self->_grimaldiSamplingStrategy) & 1) == 0) {
    self->_grimaldiSamplingStrategy = 0;
  }
}

- (unsigned)createMultipointArrayCommon:(id)a3 unitSize:(unint64_t *)a4 outputCount:(unint64_t *)a5
{
  v13 = (void *)IORegistryEntrySearchCFProperty(self->_service, "IOService", (CFStringRef)a3, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 3u);
  if (!v13) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  unint64_t v12 = [v13 length];
  size_t size = 0;
  unint64_t count = 0;
  if (v12 == 12)
  {
    unint64_t count = 6;
    size_t size = 2;
  }
  else if (!(v12 % 4) && v12 >= 0x18)
  {
    unint64_t count = v12 / 4;
    size_t size = 4;
  }
  uint64_t v9 = malloc_type_calloc(count, size, 0xBDDC5BFFuLL);
  if (v9)
  {
    [v13 getBytes:v9 length:v12];

    v8 = (unsigned int *)malloc_type_malloc(4 * count, 0x100004052888210uLL);
    if (v8)
    {
      for (unint64_t i = 0; i < count; ++i)
      {
        if (size == 2) {
          unsigned int v6 = *((unsigned __int16 *)v9 + i);
        }
        else {
          unsigned int v6 = v9[i];
        }
        v8[i] = v6;
      }
      free(v9);
      *a4 = size;
      *a5 = count;
      return v8;
    }
    else
    {
      free(v9);
      return 0;
    }
  }
  else
  {
LABEL_4:

    return 0;
  }
}

- (id)newMultiPointThresholdsArray:(id)a3
{
  v9[3] = self;
  v9[2] = a2;
  v9[1] = a3;
  v9[0] = 0;
  unint64_t v8 = 0;
  uint64_t v7 = [(CBBacklightNode *)self createMultipointArrayCommon:a3 unitSize:v9 outputCount:&v8];
  if (!v7) {
    return 0;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v6)
  {
    for (unint64_t i = 0; i < v8; ++i)
    {
      *(void *)&double v3 = v7[i];
      *(float *)&double v3 = (float)LODWORD(v3);
      objc_msgSend(v6, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v3));
    }
    free(v7);
    return v6;
  }
  else
  {
    free(v7);
    return 0;
  }
}

- (id)newMultiPointFactorsArray:(id)a3
{
  v9[3] = self;
  v9[2] = a2;
  v9[1] = a3;
  v9[0] = 0;
  unint64_t v8 = 0;
  uint64_t v7 = [(CBBacklightNode *)self createMultipointArrayCommon:a3 unitSize:v9 outputCount:&v8];
  if (!v7) {
    return 0;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v6)
  {
    for (unint64_t i = 0; i < v8; ++i)
    {
      if (v9[0] == 2) {
        float v4 = (float)v7[i] / 1000.0;
      }
      else {
        float v4 = *(float *)&v7[i];
      }
      objc_msgSend(v6, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE((unint64_t)LODWORD(v4))));
    }
    free(v7);
    return v6;
  }
  else
  {
    free(v7);
    return 0;
  }
}

- (int)createMultipointRestrictionArrayForThresholdsName:(id)a3 andFactorsName:(id)a4 andThresholds:(id *)a5 andFactors:(id *)a6
{
  if (!a3 || !a4 || !a5 || !a6) {
    return 0;
  }
  id v9 = [(CBBacklightNode *)self newMultiPointThresholdsArray:a3];
  if (v9)
  {
    id v8 = [(CBBacklightNode *)self newMultiPointFactorsArray:a4];
    if (v8)
    {
      uint64_t v7 = [v9 count];
      if (v7 == [v8 count])
      {
        *a5 = v9;
        *a6 = v8;
        return 1;
      }
    }
    return 0;
  }
  return 0;
}

- (__CFDictionary)copyRestrictionDictionaryMultiPoint
{
  v21 = self;
  SEL v20 = a2;
  int v19 = 0;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!v18) {
    return 0;
  }
  id v17 = 0;
  id v16 = 0;
  if ([(CBBacklightNode *)v21 createMultipointRestrictionArrayForThresholdsName:@"max-restriction-thresholds" andFactorsName:@"max-restriction-factors" andThresholds:&v17 andFactors:&v16])
  {
    [v18 setObject:v17 forKey:@"max_thresholds"];
    [v18 setObject:v16 forKey:@"max_factors"];

    int v19 = 1;
    unsigned int v15 = 0;
    int v14 = 0;
    float float_from_edt = 0.0;
    float float_from_edt = load_float_from_edt(v21->_service, @"max-restr-rise-time-fast-thr");
    float v23 = float_from_edt;
    *(float *)&double v2 = float_from_edt;
    objc_msgSend(v18, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v2), @"max_rise_time_fast_threshold");
    if (load_uint_from_edt(v21->_service, @"max-restr-rise-time-fast", &v15))
    {
      double v3 = (float)v15 / 1000.0;
      *(float *)&double v3 = v3;
      int v14 = LODWORD(v3);
      objc_msgSend(v18, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v3), @"max_rise_time_fast");
    }
    if (load_uint_from_edt(v21->_service, @"max-restriction-rise-time", &v15))
    {
      double v4 = (float)v15 / 1000.0;
      *(float *)&double v4 = v4;
      int v14 = LODWORD(v4);
      objc_msgSend(v18, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v4), @"max_rise_time");
    }
    if (load_uint_from_edt(v21->_service, @"max-restriction-fall-time", &v15))
    {
      double v5 = (float)v15 / 1000.0;
      *(float *)&double v5 = v5;
      int v14 = LODWORD(v5);
      objc_msgSend(v18, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v5), @"max_fall_time");
    }
    if (load_uint_from_edt(v21->_service, @"max-restriction-factor-aab-off", &v15))
    {
      double v6 = (float)v15 / 1000.0;
      *(float *)&double v6 = v6;
      v12[1] = LODWORD(v6);
      objc_msgSend(v18, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v6), @"max_factor_aab_off");
    }
  }
  id v17 = 0;
  id v16 = 0;
  if ([(CBBacklightNode *)v21 createMultipointRestrictionArrayForThresholdsName:@"min-restriction-thresholds" andFactorsName:@"min-restriction-factors" andThresholds:&v17 andFactors:&v16])
  {
    [v18 setObject:v17 forKey:@"min_thresholds"];
    [v18 setObject:v16 forKey:@"min_factors"];

    int v19 = 1;
    v12[0] = 0;
    int v11 = 0;
    if (load_uint_from_edt(v21->_service, @"min-restriction-rise-time", v12))
    {
      double v7 = (float)v12[0] / 1000.0;
      *(float *)&double v7 = v7;
      int v11 = LODWORD(v7);
      objc_msgSend(v18, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v7), @"min_rise_time");
    }
    if (load_uint_from_edt(v21->_service, @"min-restriction-fall-time", v12))
    {
      double v8 = (float)v12[0] / 1000.0;
      *(float *)&double v8 = v8;
      int v11 = LODWORD(v8);
      objc_msgSend(v18, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v8), @"min_fall_time");
    }
  }
  if (v19)
  {
    unsigned int v10 = 0;
    if (load_uint_from_edt(v21->_service, @"restriction-pivoting-l", &v10)) {
      objc_msgSend(v18, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT((float)v10))), @"pivoting_L");
    }
    if (load_uint_from_edt(v21->_service, @"restriction-pivoting-l-2", &v10)) {
      objc_msgSend(v18, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT((float)v10))), @"pivoting_L_max");
    }
    [v18 setObject:&unk_1F1417E58 forKey:@"multi_point"];
  }
  else
  {

    return 0;
  }
  return (__CFDictionary *)v18;
}

- (void)dealloc
{
  double v4 = self;
  SEL v3 = a2;

  if (v4->_log)
  {

    v4->_log = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBBacklightNode;
  [(CBBacklightNode *)&v2 dealloc];
}

- (int)grimaldiSamplingStrategy
{
  return self->_grimaldiSamplingStrategy;
}

- (CBTwilightParams)twilight
{
  return self->_twilight;
}

- (CBChromaticCorrectionParams)ammolite
{
  return self->_ammolite;
}

@end