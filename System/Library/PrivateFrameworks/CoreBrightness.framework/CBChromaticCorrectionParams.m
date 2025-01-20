@interface CBChromaticCorrectionParams
- (BOOL)initAmmoliteFromServiceOG:(unsigned int)a3;
- (BOOL)initFromTwilightFromServiceOG:(unsigned int)a3;
- (CBFloatArray)luxTable;
- (CBFloatArray)nitsTable;
- (CBFloatArray)rampBezierAnchors;
- (CBFloatArray2D)strengthTable;
- (float)aodRampDuration;
- (float)getStrengthForRow:(unint64_t)a3 andColumn:(unint64_t)a4;
- (float)luxActivationThreshold;
- (float)nitsActivationThreshold;
- (float)rampDownDuration;
- (float)rampDownLuxDeltaThreshold;
- (float)rampUpDuration;
- (float)rampUpLuxDeltaThreshold;
- (float)rampUpdateRate;
- (id)initFromAmmoliteFromService:(unsigned int)a3;
- (id)initFromTwilightFromService:(unsigned int)a3;
- (void)dealloc;
@end

@implementation CBChromaticCorrectionParams

- (CBFloatArray)nitsTable
{
  return self->_nitsTable;
}

- (float)nitsActivationThreshold
{
  return self->_nitsActivationThreshold;
}

- (float)luxActivationThreshold
{
  return self->_luxActivationThreshold;
}

- (float)getStrengthForRow:(unint64_t)a3 andColumn:(unint64_t)a4
{
  return matrix_element((uint64_t)self->_strengthTableOG, a3, a4, self->_nitsTableSizeOG);
}

- (id)initFromTwilightFromService:(unsigned int)a3
{
  v19 = self;
  SEL v18 = a2;
  unsigned int v17 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CBChromaticCorrectionParams;
  v19 = [(CBChromaticCorrectionParams *)&v16 init];
  if (v19)
  {
    os_log_t v3 = os_log_create("com.apple.CoreBrightness.BacklightNode", "Twilight");
    v19->_log = (OS_os_log *)v3;
    char v15 = 0;
    if ([(CBChromaticCorrectionParams *)v19 initFromTwilightFromServiceOG:v17])
    {
      v4 = [CBFloatArray alloc];
      uint64_t v5 = [(CBFloatArray *)v4 initWithValues:v19->_luxTableOG andCount:v19->_luxTableSizeOG];
      v19->_luxTable = (CBFloatArray *)v5;
      v6 = [CBFloatArray alloc];
      uint64_t v7 = [(CBFloatArray *)v6 initWithValues:v19->_nitsTableOG andCount:v19->_nitsTableSizeOG];
      v19->_nitsTable = (CBFloatArray *)v7;
      v14 = [CBFloatArray2D alloc];
      strengthTableOG = v19->_strengthTableOG;
      uint64_t v13 = [(CBFloatArray *)v19->_nitsTable count];
      uint64_t v8 = [(CBFloatArray2D *)v14 initWithValues:strengthTableOG andCountCols:v13 andRows:[(CBFloatArray *)v19->_luxTable count]];
      v19->_strengthTable = (CBFloatArray2D *)v8;
      v9 = [CBFloatArray alloc];
      uint64_t v10 = [(CBFloatArray *)v9 initWithValues:v19->_rampBezierAnchorsOG andCount:3];
      v19->_rampBezierAnchors = (CBFloatArray *)v10;
      char v15 = 1;
    }
    if (v19->_luxTableOG) {
      free(v19->_luxTableOG);
    }
    if (v19->_nitsTableOG) {
      free(v19->_nitsTableOG);
    }
    if (v19->_strengthTableOG) {
      free(v19->_strengthTableOG);
    }
    if (v19->_rampBezierAnchorsOG) {
      free(v19->_rampBezierAnchorsOG);
    }
    if ((v15 & 1) == 0)
    {

      return 0;
    }
  }
  return v19;
}

- (id)initFromAmmoliteFromService:(unsigned int)a3
{
  v19 = self;
  SEL v18 = a2;
  unsigned int v17 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CBChromaticCorrectionParams;
  v19 = [(CBChromaticCorrectionParams *)&v16 init];
  if (v19)
  {
    os_log_t v3 = os_log_create("com.apple.CoreBrightness.BacklightNode", "Ammolite");
    v19->_log = (OS_os_log *)v3;
    char v15 = 0;
    if ([(CBChromaticCorrectionParams *)v19 initAmmoliteFromServiceOG:v17])
    {
      v4 = [CBFloatArray alloc];
      uint64_t v5 = [(CBFloatArray *)v4 initWithValues:v19->_luxTableOG andCount:v19->_luxTableSizeOG];
      v19->_luxTable = (CBFloatArray *)v5;
      v6 = [CBFloatArray alloc];
      uint64_t v7 = [(CBFloatArray *)v6 initWithValues:v19->_nitsTableOG andCount:v19->_nitsTableSizeOG];
      v19->_nitsTable = (CBFloatArray *)v7;
      v14 = [CBFloatArray2D alloc];
      strengthTableOG = v19->_strengthTableOG;
      uint64_t v13 = [(CBFloatArray *)v19->_nitsTable count];
      uint64_t v8 = [(CBFloatArray2D *)v14 initWithValues:strengthTableOG andCountCols:v13 andRows:[(CBFloatArray *)v19->_luxTable count]];
      v19->_strengthTable = (CBFloatArray2D *)v8;
      v9 = [CBFloatArray alloc];
      uint64_t v10 = [(CBFloatArray *)v9 initWithValues:v19->_rampBezierAnchorsOG andCount:3];
      v19->_rampBezierAnchors = (CBFloatArray *)v10;
      char v15 = 1;
    }
    if (v19->_luxTableOG) {
      free(v19->_luxTableOG);
    }
    if (v19->_nitsTableOG) {
      free(v19->_nitsTableOG);
    }
    if (v19->_strengthTableOG) {
      free(v19->_strengthTableOG);
    }
    if (v19->_rampBezierAnchorsOG) {
      free(v19->_rampBezierAnchorsOG);
    }
    if ((v15 & 1) == 0)
    {

      return 0;
    }
  }
  return v19;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;

  if (v4->_log)
  {

    v4->_log = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBChromaticCorrectionParams;
  [(CBChromaticCorrectionParams *)&v2 dealloc];
}

- (BOOL)initAmmoliteFromServiceOG:(unsigned int)a3
{
  uint64_t v279 = *MEMORY[0x1E4F143B8];
  v245 = self;
  SEL v244 = a2;
  io_registry_entry_t v243 = a3;
  if (a3)
  {
    int v239 = 0;
    char v238 = load_int_from_edt(v243, @"supports-ammolite", &v239) & 1;
    if (v238 && v239)
    {
      float fixed_float_from_edt = load_fixed_float_from_edt(v243, @"LmaxProduct");
      float v255 = fixed_float_from_edt;
      v245->_float luxActivationThreshold = load_float_from_edt(v243, @"aml-lux-activation-threshold");
      float luxActivationThreshold = v245->_luxActivationThreshold;
      if (v245->_luxActivationThreshold >= 0.0)
      {
        v245->_float nitsActivationThreshold = load_float_from_edt(v243, @"aml-nits-activation-threshold");
        float nitsActivationThreshold = v245->_nitsActivationThreshold;
        if (v245->_nitsActivationThreshold >= 0.0)
        {
          v245->_luxTableSizeOG = load_float_array_from_edt(v243, @"aml-lux-table", &v245->_luxTableOG);
          if (v245->_luxTableOG)
          {
            if (v245->_luxTableSizeOG)
            {
              if (float_equal(*v245->_luxTableOG, v245->_luxActivationThreshold))
              {
                for (unint64_t i = 0; i < v245->_luxTableSizeOG - 1; ++i)
                {
                  if (v245->_luxTableOG[i] >= v245->_luxTableOG[i + 1])
                  {
                    v218 = 0;
                    if (v245->_log)
                    {
                      v120 = v245->_log;
                    }
                    else
                    {
                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
                      }
                      else {
                        uint64_t inited = init_default_corebrightness_log();
                      }
                      v120 = inited;
                    }
                    v218 = v120;
                    os_log_type_t v217 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                    {
                      v117 = v218;
                      os_log_type_t v118 = v217;
                      __os_log_helper_16_0_0(v216);
                      _os_log_error_impl(&dword_1BA438000, v117, v118, "Lux table is not monotonically increasing", v216, 2u);
                    }
                    char v246 = 0;
                    return v246 & 1;
                  }
                }
                v245->_nitsTableSizeOG = load_float_array_from_edt(v243, @"aml-nits-table", &v245->_nitsTableOG);
                if (v245->_nitsTableOG)
                {
                  if (v245->_nitsTableSizeOG)
                  {
                    if (float_equal(v245->_nitsTableOG[v245->_nitsTableSizeOG - 1], fixed_float_from_edt))
                    {
                      for (unint64_t j = 0; j < v245->_nitsTableSizeOG - 1; ++j)
                      {
                        if (v245->_nitsTableOG[j] >= v245->_nitsTableOG[j + 1])
                        {
                          v206 = 0;
                          if (v245->_log)
                          {
                            v106 = v245->_log;
                          }
                          else
                          {
                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                              uint64_t v105 = _COREBRIGHTNESS_LOG_DEFAULT;
                            }
                            else {
                              uint64_t v105 = init_default_corebrightness_log();
                            }
                            v106 = v105;
                          }
                          v206 = v106;
                          os_log_type_t v205 = OS_LOG_TYPE_ERROR;
                          if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
                          {
                            v103 = v206;
                            os_log_type_t v104 = v205;
                            __os_log_helper_16_0_0(v204);
                            _os_log_error_impl(&dword_1BA438000, v103, v104, "Nits table is not monotonically increasing", v204, 2u);
                          }
                          char v246 = 0;
                          return v246 & 1;
                        }
                      }
                      v245->_strengthTableSizeOG = load_float_array_from_edt(v243, @"aml-strength-table", &v245->_strengthTableOG);
                      if (v245->_strengthTableOG)
                      {
                        if (v245->_strengthTableSizeOG == v245->_nitsTableSizeOG * v245->_luxTableSizeOG)
                        {
                          for (unint64_t k = 0; k < v245->_strengthTableSizeOG; ++k)
                          {
                            if (v245->_strengthTableOG[k] < 0.0 || v245->_strengthTableOG[k] > 1.0)
                            {
                              os_log_t v197 = 0;
                              if (v245->_log)
                              {
                                v96 = v245->_log;
                              }
                              else
                              {
                                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                  uint64_t v95 = _COREBRIGHTNESS_LOG_DEFAULT;
                                }
                                else {
                                  uint64_t v95 = init_default_corebrightness_log();
                                }
                                v96 = v95;
                              }
                              os_log_t v197 = v96;
                              os_log_type_t v196 = OS_LOG_TYPE_ERROR;
                              if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
                              {
                                __os_log_helper_16_0_2_8_0_8_0((uint64_t)v275, k, COERCE__INT64(v245->_strengthTableOG[k]));
                                _os_log_error_impl(&dword_1BA438000, v197, v196, "Strength table element #%lu with value %f is out of the valid [0, 1] range", v275, 0x16u);
                              }
                              char v246 = 0;
                              return v246 & 1;
                            }
                          }
                          unint64_t v195 = 0;
                          while (2)
                          {
                            if (v195 >= v245->_luxTableSizeOG)
                            {
                              unint64_t v188 = 0;
LABEL_189:
                              if (v188 >= v245->_nitsTableSizeOG)
                              {
                                v245->_float rampUpdateRate = load_float_from_edt(v243, @"aml-ramp-update-rate");
                                float rampUpdateRate = v245->_rampUpdateRate;
                                unint64_t float_array_from_edt = load_float_array_from_edt(v243, @"aml-ramp-bezier-anchors", &v245->_rampBezierAnchorsOG);
                                if (v245->_rampBezierAnchorsOG)
                                {
                                  if (float_array_from_edt == 3)
                                  {
                                    if (*v245->_rampBezierAnchorsOG >= 0.0 && *v245->_rampBezierAnchorsOG <= 1.0)
                                    {
                                      if (v245->_rampBezierAnchorsOG[1] >= 0.0 && v245->_rampBezierAnchorsOG[1] <= 1.0)
                                      {
                                        if (v245->_rampBezierAnchorsOG[2] >= 0.0
                                          && v245->_rampBezierAnchorsOG[2] <= 1.0)
                                        {
                                          v245->_rampUpDuratiounint64_t n = load_float_from_edt(v243, @"aml-ramp-up-duration");
                                          rampUpDuratiounint64_t n = v245->_rampUpDuration;
                                          if (v245->_rampUpDuration >= 0.0)
                                          {
                                            v245->_float rampUpLuxDeltaThreshold = load_float_from_edt(v243, @"aml-ramp-up-lux-threshold");
                                            float rampUpLuxDeltaThreshold = v245->_rampUpLuxDeltaThreshold;
                                            if (v245->_rampUpLuxDeltaThreshold >= 0.0)
                                            {
                                              v245->_rampDownDuratiounint64_t n = load_float_from_edt(v243, @"aml-ramp-down-duration");
                                              rampDownDuratiounint64_t n = v245->_rampDownDuration;
                                              if (v245->_rampDownDuration >= 0.0)
                                              {
                                                v245->_float rampDownLuxDeltaThreshold = load_float_from_edt(v243, @"aml-ramp-down-lux-threshold");
                                                float rampDownLuxDeltaThreshold = v245->_rampDownLuxDeltaThreshold;
                                                if (v245->_rampDownLuxDeltaThreshold >= 0.0)
                                                {
                                                  if ([+[CBAODState sharedInstance])
                                                  {
                                                    v156 = 0;
                                                    if (v245->_log)
                                                    {
                                                      v50 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                        uint64_t v49 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      }
                                                      else {
                                                        uint64_t v49 = init_default_corebrightness_log();
                                                      }
                                                      v50 = v49;
                                                    }
                                                    v156 = v50;
                                                    os_log_type_t v155 = OS_LOG_TYPE_ERROR;
                                                    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                                                    {
                                                      v47 = v156;
                                                      os_log_type_t v48 = v155;
                                                      __os_log_helper_16_0_0(v154);
                                                      _os_log_error_impl(&dword_1BA438000, v47, v48, "AOD ramp duration is negative", v154, 2u);
                                                    }
                                                    char v246 = 0;
                                                  }
                                                  else
                                                  {
                                                    id v153 = objc_alloc_init(MEMORY[0x1E4F28E78]);
                                                    for (unint64_t m = 0; m < v245->_luxTableSizeOG; ++m)
                                                    {
                                                      uint64_t v8 = "";
                                                      if (m != v245->_luxTableSizeOG - 1) {
                                                        uint64_t v8 = ",";
                                                      }
                                                      objc_msgSend(v153, "appendFormat:", @" %f%s", v245->_luxTableOG[m], v8);
                                                    }
                                                    [v153 appendString:@" "];
                                                    id v151 = objc_alloc_init(MEMORY[0x1E4F28E78]);
                                                    for (unint64_t n = 0; n < v245->_nitsTableSizeOG; ++n)
                                                    {
                                                      v9 = "";
                                                      if (n != v245->_nitsTableSizeOG - 1) {
                                                        v9 = ",";
                                                      }
                                                      objc_msgSend(v151, "appendFormat:", @" %f%s", v245->_nitsTableOG[n], v9);
                                                    }
                                                    [v151 appendString:@" "];
                                                    if (v245->_log)
                                                    {
                                                      v46 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                        uint64_t v45 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      }
                                                      else {
                                                        uint64_t v45 = init_default_corebrightness_log();
                                                      }
                                                      v46 = v45;
                                                    }
                                                    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v271, COERCE__INT64(fixed_float_from_edt));
                                                      _os_log_impl(&dword_1BA438000, v46, OS_LOG_TYPE_DEFAULT, "NitsMaximum=%f", v271, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v44 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                        uint64_t v43 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      }
                                                      else {
                                                        uint64_t v43 = init_default_corebrightness_log();
                                                      }
                                                      v44 = v43;
                                                    }
                                                    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v270, COERCE__INT64(v245->_luxActivationThreshold));
                                                      _os_log_impl(&dword_1BA438000, v44, OS_LOG_TYPE_DEFAULT, "LuxActivationThreshold=%f", v270, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v42 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                        uint64_t v41 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      }
                                                      else {
                                                        uint64_t v41 = init_default_corebrightness_log();
                                                      }
                                                      v42 = v41;
                                                    }
                                                    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v269, COERCE__INT64(v245->_nitsActivationThreshold));
                                                      _os_log_impl(&dword_1BA438000, v42, OS_LOG_TYPE_DEFAULT, "NitsActivationThreshold=%f", v269, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v40 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                        uint64_t v39 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      }
                                                      else {
                                                        uint64_t v39 = init_default_corebrightness_log();
                                                      }
                                                      v40 = v39;
                                                    }
                                                    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v268, COERCE__INT64(v245->_rampUpdateRate));
                                                      _os_log_impl(&dword_1BA438000, v40, OS_LOG_TYPE_DEFAULT, "RampUpdateRate=%f", v268, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v38 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                        uint64_t v37 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      }
                                                      else {
                                                        uint64_t v37 = init_default_corebrightness_log();
                                                      }
                                                      v38 = v37;
                                                    }
                                                    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v267, COERCE__INT64(*v245->_rampBezierAnchorsOG), COERCE__INT64(v245->_rampBezierAnchorsOG[1]), COERCE__INT64(v245->_rampBezierAnchorsOG[2]));
                                                      _os_log_impl(&dword_1BA438000, v38, OS_LOG_TYPE_DEFAULT, "RampBezierAnchors={ %f, %f, %f }", v267, 0x20u);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v36 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                        uint64_t v35 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      }
                                                      else {
                                                        uint64_t v35 = init_default_corebrightness_log();
                                                      }
                                                      v36 = v35;
                                                    }
                                                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v266, COERCE__INT64(v245->_rampUpDuration));
                                                      _os_log_impl(&dword_1BA438000, v36, OS_LOG_TYPE_DEFAULT, "RampUpDuration=%f", v266, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v34 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                        uint64_t v33 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      }
                                                      else {
                                                        uint64_t v33 = init_default_corebrightness_log();
                                                      }
                                                      v34 = v33;
                                                    }
                                                    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v265, COERCE__INT64(v245->_rampUpLuxDeltaThreshold));
                                                      _os_log_impl(&dword_1BA438000, v34, OS_LOG_TYPE_DEFAULT, "RampUpLuxDeltaThreshold=%f", v265, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v32 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                        uint64_t v31 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      }
                                                      else {
                                                        uint64_t v31 = init_default_corebrightness_log();
                                                      }
                                                      v32 = v31;
                                                    }
                                                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v264, COERCE__INT64(v245->_rampDownDuration));
                                                      _os_log_impl(&dword_1BA438000, v32, OS_LOG_TYPE_DEFAULT, "RampDownDuration=%f", v264, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v30 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                        uint64_t v29 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      }
                                                      else {
                                                        uint64_t v29 = init_default_corebrightness_log();
                                                      }
                                                      v30 = v29;
                                                    }
                                                    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v263, COERCE__INT64(v245->_rampDownLuxDeltaThreshold));
                                                      _os_log_impl(&dword_1BA438000, v30, OS_LOG_TYPE_DEFAULT, "RampDownLuxDeltaThreshold=%f", v263, 0xCu);
                                                    }
                                                    if ([+[CBAODState sharedInstance] isAODSupported])
                                                    {
                                                      if (v245->_log)
                                                      {
                                                        v28 = v245->_log;
                                                      }
                                                      else
                                                      {
                                                        uint64_t v27 = _COREBRIGHTNESS_LOG_DEFAULT
                                                            ? _COREBRIGHTNESS_LOG_DEFAULT
                                                            : init_default_corebrightness_log();
                                                        v28 = v27;
                                                      }
                                                      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        [(CBChromaticCorrectionParams *)v245 aodRampDuration];
                                                        __os_log_helper_16_0_1_8_0((uint64_t)v262, COERCE__INT64(v10));
                                                        _os_log_impl(&dword_1BA438000, v28, OS_LOG_TYPE_DEFAULT, "RampAODDuration=%f", v262, 0xCu);
                                                      }
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v26 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                        uint64_t v25 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      }
                                                      else {
                                                        uint64_t v25 = init_default_corebrightness_log();
                                                      }
                                                      v26 = v25;
                                                    }
                                                    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v261, v245->_luxTableSizeOG);
                                                      _os_log_impl(&dword_1BA438000, v26, OS_LOG_TYPE_DEFAULT, "LuxTableSize=%lu", v261, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v24 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                        uint64_t v23 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      }
                                                      else {
                                                        uint64_t v23 = init_default_corebrightness_log();
                                                      }
                                                      v24 = v23;
                                                    }
                                                    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_2_1_8_32((uint64_t)v260, [v153 UTF8String]);
                                                      _os_log_impl(&dword_1BA438000, v24, OS_LOG_TYPE_DEFAULT, "LuxTable={%s}", v260, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v22 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                        uint64_t v21 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      }
                                                      else {
                                                        uint64_t v21 = init_default_corebrightness_log();
                                                      }
                                                      v22 = v21;
                                                    }
                                                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v259, v245->_nitsTableSizeOG);
                                                      _os_log_impl(&dword_1BA438000, v22, OS_LOG_TYPE_DEFAULT, "NitsTableSize=%lu", v259, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      v20 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                        uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      }
                                                      else {
                                                        uint64_t v19 = init_default_corebrightness_log();
                                                      }
                                                      v20 = v19;
                                                    }
                                                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_2_1_8_32((uint64_t)v258, [v151 UTF8String]);
                                                      _os_log_impl(&dword_1BA438000, v20, OS_LOG_TYPE_DEFAULT, "NitsTable={%s}", v258, 0xCu);
                                                    }
                                                    if (v245->_log)
                                                    {
                                                      SEL v18 = v245->_log;
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                        uint64_t v17 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      }
                                                      else {
                                                        uint64_t v17 = init_default_corebrightness_log();
                                                      }
                                                      SEL v18 = v17;
                                                    }
                                                    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      __os_log_helper_16_0_1_8_0((uint64_t)v257, v245->_strengthTableSizeOG);
                                                      _os_log_impl(&dword_1BA438000, v18, OS_LOG_TYPE_DEFAULT, "StrengthTableSize=%lu", v257, 0xCu);
                                                    }
                                                    for (unint64_t ii = 0; ii < v245->_luxTableSizeOG; ++ii)
                                                    {
                                                      id v148 = objc_alloc_init(MEMORY[0x1E4F28E78]);
                                                      for (unint64_t jj = 0; jj < v245->_nitsTableSizeOG; ++jj)
                                                      {
                                                        [(CBChromaticCorrectionParams *)v245 getStrengthForRow:ii andColumn:jj];
                                                        double v12 = v11;
                                                        uint64_t v13 = "";
                                                        if (jj != v245->_nitsTableSizeOG - 1) {
                                                          uint64_t v13 = ",";
                                                        }
                                                        objc_msgSend(v148, "appendFormat:", @" %f%s ", *(void *)&v12, v13);
                                                      }
                                                      if (v245->_log)
                                                      {
                                                        objc_super v16 = v245->_log;
                                                      }
                                                      else
                                                      {
                                                        if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                          uint64_t v15 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                        }
                                                        else {
                                                          uint64_t v15 = init_default_corebrightness_log();
                                                        }
                                                        objc_super v16 = v15;
                                                      }
                                                      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        __os_log_helper_16_2_2_8_0_8_32((uint64_t)v256, ii, [v148 UTF8String]);
                                                        _os_log_impl(&dword_1BA438000, v16, OS_LOG_TYPE_DEFAULT, "StrengthTable[%lu]={%s}", v256, 0x16u);
                                                      }
                                                    }
                                                    char v246 = 1;
                                                  }
                                                }
                                                else
                                                {
                                                  v159 = 0;
                                                  if (v245->_log)
                                                  {
                                                    v54 = v245->_log;
                                                  }
                                                  else
                                                  {
                                                    if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                      uint64_t v53 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                    }
                                                    else {
                                                      uint64_t v53 = init_default_corebrightness_log();
                                                    }
                                                    v54 = v53;
                                                  }
                                                  v159 = v54;
                                                  os_log_type_t v158 = OS_LOG_TYPE_ERROR;
                                                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                                                  {
                                                    v51 = v159;
                                                    os_log_type_t v52 = v158;
                                                    __os_log_helper_16_0_0(v157);
                                                    _os_log_error_impl(&dword_1BA438000, v51, v52, "Ramp down lux delta threshold is negative", v157, 2u);
                                                  }
                                                  char v246 = 0;
                                                }
                                              }
                                              else
                                              {
                                                v162 = 0;
                                                if (v245->_log)
                                                {
                                                  v58 = v245->_log;
                                                }
                                                else
                                                {
                                                  if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                    uint64_t v57 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                  }
                                                  else {
                                                    uint64_t v57 = init_default_corebrightness_log();
                                                  }
                                                  v58 = v57;
                                                }
                                                v162 = v58;
                                                os_log_type_t v161 = OS_LOG_TYPE_ERROR;
                                                if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                                                {
                                                  v55 = v162;
                                                  os_log_type_t v56 = v161;
                                                  __os_log_helper_16_0_0(v160);
                                                  _os_log_error_impl(&dword_1BA438000, v55, v56, "Ramp down duration is negative", v160, 2u);
                                                }
                                                char v246 = 0;
                                              }
                                            }
                                            else
                                            {
                                              v165 = 0;
                                              if (v245->_log)
                                              {
                                                v62 = v245->_log;
                                              }
                                              else
                                              {
                                                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                  uint64_t v61 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                }
                                                else {
                                                  uint64_t v61 = init_default_corebrightness_log();
                                                }
                                                v62 = v61;
                                              }
                                              v165 = v62;
                                              os_log_type_t v164 = OS_LOG_TYPE_ERROR;
                                              if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                                              {
                                                v59 = v165;
                                                os_log_type_t v60 = v164;
                                                __os_log_helper_16_0_0(v163);
                                                _os_log_error_impl(&dword_1BA438000, v59, v60, "Ramp up lux delta threshold is negative", v163, 2u);
                                              }
                                              char v246 = 0;
                                            }
                                          }
                                          else
                                          {
                                            v168 = 0;
                                            if (v245->_log)
                                            {
                                              v66 = v245->_log;
                                            }
                                            else
                                            {
                                              if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                uint64_t v65 = _COREBRIGHTNESS_LOG_DEFAULT;
                                              }
                                              else {
                                                uint64_t v65 = init_default_corebrightness_log();
                                              }
                                              v66 = v65;
                                            }
                                            v168 = v66;
                                            os_log_type_t v167 = OS_LOG_TYPE_ERROR;
                                            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                                            {
                                              v63 = v168;
                                              os_log_type_t v64 = v167;
                                              __os_log_helper_16_0_0(v166);
                                              _os_log_error_impl(&dword_1BA438000, v63, v64, "Ramp up duration is negative", v166, 2u);
                                            }
                                            char v246 = 0;
                                          }
                                        }
                                        else
                                        {
                                          v171 = 0;
                                          if (v245->_log)
                                          {
                                            v70 = v245->_log;
                                          }
                                          else
                                          {
                                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                              uint64_t v69 = _COREBRIGHTNESS_LOG_DEFAULT;
                                            }
                                            else {
                                              uint64_t v69 = init_default_corebrightness_log();
                                            }
                                            v70 = v69;
                                          }
                                          v171 = v70;
                                          os_log_type_t v170 = OS_LOG_TYPE_ERROR;
                                          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                                          {
                                            v67 = v171;
                                            os_log_type_t v68 = v170;
                                            __os_log_helper_16_0_0(v169);
                                            _os_log_error_impl(&dword_1BA438000, v67, v68, "Third ramp Bezier anchor is out of valid [0, 1] range", v169, 2u);
                                          }
                                          char v246 = 0;
                                        }
                                      }
                                      else
                                      {
                                        v174 = 0;
                                        if (v245->_log)
                                        {
                                          v74 = v245->_log;
                                        }
                                        else
                                        {
                                          if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                            uint64_t v73 = _COREBRIGHTNESS_LOG_DEFAULT;
                                          }
                                          else {
                                            uint64_t v73 = init_default_corebrightness_log();
                                          }
                                          v74 = v73;
                                        }
                                        v174 = v74;
                                        os_log_type_t v173 = OS_LOG_TYPE_ERROR;
                                        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                                        {
                                          v71 = v174;
                                          os_log_type_t v72 = v173;
                                          __os_log_helper_16_0_0(v172);
                                          _os_log_error_impl(&dword_1BA438000, v71, v72, "Second ramp Bezier anchor is out of valid [0, 1] range", v172, 2u);
                                        }
                                        char v246 = 0;
                                      }
                                    }
                                    else
                                    {
                                      v177 = 0;
                                      if (v245->_log)
                                      {
                                        v78 = v245->_log;
                                      }
                                      else
                                      {
                                        if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                          uint64_t v77 = _COREBRIGHTNESS_LOG_DEFAULT;
                                        }
                                        else {
                                          uint64_t v77 = init_default_corebrightness_log();
                                        }
                                        v78 = v77;
                                      }
                                      v177 = v78;
                                      os_log_type_t v176 = OS_LOG_TYPE_ERROR;
                                      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
                                      {
                                        v75 = v177;
                                        os_log_type_t v76 = v176;
                                        __os_log_helper_16_0_0(v175);
                                        _os_log_error_impl(&dword_1BA438000, v75, v76, "First ramp Bezier anchor is out of valid [0, 1] range", v175, 2u);
                                      }
                                      char v246 = 0;
                                    }
                                  }
                                  else
                                  {
                                    v180 = 0;
                                    if (v245->_log)
                                    {
                                      v82 = v245->_log;
                                    }
                                    else
                                    {
                                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                        uint64_t v81 = _COREBRIGHTNESS_LOG_DEFAULT;
                                      }
                                      else {
                                        uint64_t v81 = init_default_corebrightness_log();
                                      }
                                      v82 = v81;
                                    }
                                    v180 = v82;
                                    os_log_type_t v179 = OS_LOG_TYPE_ERROR;
                                    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
                                    {
                                      v79 = v180;
                                      os_log_type_t v80 = v179;
                                      __os_log_helper_16_0_0(v178);
                                      _os_log_error_impl(&dword_1BA438000, v79, v80, "Incorrect number of ramp Bezier anchors", v178, 2u);
                                    }
                                    char v246 = 0;
                                  }
                                }
                                else
                                {
                                  v183 = 0;
                                  if (v245->_log)
                                  {
                                    v86 = v245->_log;
                                  }
                                  else
                                  {
                                    if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                      uint64_t v85 = _COREBRIGHTNESS_LOG_DEFAULT;
                                    }
                                    else {
                                      uint64_t v85 = init_default_corebrightness_log();
                                    }
                                    v86 = v85;
                                  }
                                  v183 = v86;
                                  os_log_type_t v182 = OS_LOG_TYPE_ERROR;
                                  if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                                  {
                                    v83 = v183;
                                    os_log_type_t v84 = v182;
                                    __os_log_helper_16_0_0(v181);
                                    _os_log_error_impl(&dword_1BA438000, v83, v84, "Unable to load ramp Bezier anchors", v181, 2u);
                                  }
                                  char v246 = 0;
                                }
                              }
                              else
                              {
                                for (unint64_t kk = 0; ; ++kk)
                                {
                                  if (kk >= v245->_luxTableSizeOG - 1)
                                  {
                                    ++v188;
                                    goto LABEL_189;
                                  }
                                  [(CBChromaticCorrectionParams *)v245 getStrengthForRow:kk andColumn:v188];
                                  float v89 = v6;
                                  [(CBChromaticCorrectionParams *)v245 getStrengthForRow:kk + 1 andColumn:v188];
                                  if (v89 > v7) {
                                    break;
                                  }
                                }
                                os_log_t v186 = 0;
                                if (v245->_log)
                                {
                                  v88 = v245->_log;
                                }
                                else
                                {
                                  if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                    uint64_t v87 = _COREBRIGHTNESS_LOG_DEFAULT;
                                  }
                                  else {
                                    uint64_t v87 = init_default_corebrightness_log();
                                  }
                                  v88 = v87;
                                }
                                os_log_t v186 = v88;
                                os_log_type_t v185 = OS_LOG_TYPE_ERROR;
                                if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                                {
                                  __os_log_helper_16_0_1_8_0((uint64_t)v272, v188);
                                  _os_log_error_impl(&dword_1BA438000, v186, v185, "Strength table column #%lu is not monotonically non-decreasing", v272, 0xCu);
                                }
                                char v246 = 0;
                              }
                            }
                            else
                            {
                              for (munint64_t m = 0; mm < v245->_nitsTableSizeOG - 1; ++mm)
                              {
                                [(CBChromaticCorrectionParams *)v245 getStrengthForRow:v195 andColumn:mm];
                                float v94 = v3;
                                [(CBChromaticCorrectionParams *)v245 getStrengthForRow:v195 andColumn:mm + 1];
                                if (v94 > v4)
                                {
                                  os_log_t v193 = 0;
                                  if (v245->_log)
                                  {
                                    v93 = v245->_log;
                                  }
                                  else
                                  {
                                    if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                      uint64_t v92 = _COREBRIGHTNESS_LOG_DEFAULT;
                                    }
                                    else {
                                      uint64_t v92 = init_default_corebrightness_log();
                                    }
                                    v93 = v92;
                                  }
                                  os_log_t v193 = v93;
                                  os_log_type_t v192 = OS_LOG_TYPE_ERROR;
                                  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                                  {
                                    __os_log_helper_16_0_1_8_0((uint64_t)v274, v195);
                                    _os_log_error_impl(&dword_1BA438000, v193, v192, "Strength table row #%lu is not monotonically non-decreasing", v274, 0xCu);
                                  }
                                  char v246 = 0;
                                  return v246 & 1;
                                }
                              }
                              [(CBChromaticCorrectionParams *)v245 getStrengthForRow:v195 andColumn:0];
                              float v191 = v5;
                              if (float_equal(v5, 0.0))
                              {
                                ++v195;
                                continue;
                              }
                              os_log_t v190 = 0;
                              if (v245->_log)
                              {
                                v91 = v245->_log;
                              }
                              else
                              {
                                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                  uint64_t v90 = _COREBRIGHTNESS_LOG_DEFAULT;
                                }
                                else {
                                  uint64_t v90 = init_default_corebrightness_log();
                                }
                                v91 = v90;
                              }
                              os_log_t v190 = v91;
                              os_log_type_t v189 = OS_LOG_TYPE_ERROR;
                              if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                              {
                                __os_log_helper_16_0_2_8_0_8_0((uint64_t)v273, v195, COERCE__INT64(v191));
                                _os_log_error_impl(&dword_1BA438000, v190, v189, "First element of strength table row #%lu with value %f is not 0", v273, 0x16u);
                              }
                              char v246 = 0;
                            }
                            break;
                          }
                        }
                        else
                        {
                          os_log_t v200 = 0;
                          if (v245->_log)
                          {
                            v98 = v245->_log;
                          }
                          else
                          {
                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                              uint64_t v97 = _COREBRIGHTNESS_LOG_DEFAULT;
                            }
                            else {
                              uint64_t v97 = init_default_corebrightness_log();
                            }
                            v98 = v97;
                          }
                          os_log_t v200 = v98;
                          os_log_type_t v199 = OS_LOG_TYPE_ERROR;
                          if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                          {
                            __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v276, v245->_strengthTableSizeOG, v245->_luxTableSizeOG, v245->_nitsTableSizeOG);
                            _os_log_error_impl(&dword_1BA438000, v200, v199, "Strength table has wrong size %lu for lux table size %lu and nits table size %lu", v276, 0x20u);
                          }
                          char v246 = 0;
                        }
                      }
                      else
                      {
                        v203 = 0;
                        if (v245->_log)
                        {
                          v102 = v245->_log;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT) {
                            uint64_t v101 = _COREBRIGHTNESS_LOG_DEFAULT;
                          }
                          else {
                            uint64_t v101 = init_default_corebrightness_log();
                          }
                          v102 = v101;
                        }
                        v203 = v102;
                        os_log_type_t v202 = OS_LOG_TYPE_ERROR;
                        if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                        {
                          v99 = v203;
                          os_log_type_t v100 = v202;
                          __os_log_helper_16_0_0(v201);
                          _os_log_error_impl(&dword_1BA438000, v99, v100, "Unable to load strength table", v201, 2u);
                        }
                        char v246 = 0;
                      }
                    }
                    else
                    {
                      os_log_t v209 = 0;
                      if (v245->_log)
                      {
                        v108 = v245->_log;
                      }
                      else
                      {
                        if (_COREBRIGHTNESS_LOG_DEFAULT) {
                          uint64_t v107 = _COREBRIGHTNESS_LOG_DEFAULT;
                        }
                        else {
                          uint64_t v107 = init_default_corebrightness_log();
                        }
                        v108 = v107;
                      }
                      os_log_t v209 = v108;
                      os_log_type_t v208 = OS_LOG_TYPE_ERROR;
                      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                      {
                        __os_log_helper_16_0_1_8_0((uint64_t)v277, COERCE__INT64(fixed_float_from_edt));
                        _os_log_error_impl(&dword_1BA438000, v209, v208, "Last element in the nits table is not %f", v277, 0xCu);
                      }
                      char v246 = 0;
                    }
                  }
                  else
                  {
                    v212 = 0;
                    if (v245->_log)
                    {
                      v112 = v245->_log;
                    }
                    else
                    {
                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                        uint64_t v111 = _COREBRIGHTNESS_LOG_DEFAULT;
                      }
                      else {
                        uint64_t v111 = init_default_corebrightness_log();
                      }
                      v112 = v111;
                    }
                    v212 = v112;
                    os_log_type_t v211 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                    {
                      v109 = v212;
                      os_log_type_t v110 = v211;
                      __os_log_helper_16_0_0(v210);
                      _os_log_error_impl(&dword_1BA438000, v109, v110, "Nits table has less than one element", v210, 2u);
                    }
                    char v246 = 0;
                  }
                }
                else
                {
                  v215 = 0;
                  if (v245->_log)
                  {
                    v116 = v245->_log;
                  }
                  else
                  {
                    if (_COREBRIGHTNESS_LOG_DEFAULT) {
                      uint64_t v115 = _COREBRIGHTNESS_LOG_DEFAULT;
                    }
                    else {
                      uint64_t v115 = init_default_corebrightness_log();
                    }
                    v116 = v115;
                  }
                  v215 = v116;
                  os_log_type_t v214 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
                  {
                    v113 = v215;
                    os_log_type_t v114 = v214;
                    __os_log_helper_16_0_0(v213);
                    _os_log_error_impl(&dword_1BA438000, v113, v114, "Unable to load nits table", v213, 2u);
                  }
                  char v246 = 0;
                }
              }
              else
              {
                os_log_t v221 = 0;
                if (v245->_log)
                {
                  v122 = v245->_log;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT) {
                    uint64_t v121 = _COREBRIGHTNESS_LOG_DEFAULT;
                  }
                  else {
                    uint64_t v121 = init_default_corebrightness_log();
                  }
                  v122 = v121;
                }
                os_log_t v221 = v122;
                os_log_type_t v220 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
                {
                  __os_log_helper_16_0_1_8_0((uint64_t)v278, COERCE__INT64(v245->_luxActivationThreshold));
                  _os_log_error_impl(&dword_1BA438000, v221, v220, "First element in the lux table is not %f", v278, 0xCu);
                }
                char v246 = 0;
              }
            }
            else
            {
              v224 = 0;
              if (v245->_log)
              {
                v126 = v245->_log;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                  uint64_t v125 = _COREBRIGHTNESS_LOG_DEFAULT;
                }
                else {
                  uint64_t v125 = init_default_corebrightness_log();
                }
                v126 = v125;
              }
              v224 = v126;
              os_log_type_t v223 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
              {
                v123 = v224;
                os_log_type_t v124 = v223;
                __os_log_helper_16_0_0(v222);
                _os_log_error_impl(&dword_1BA438000, v123, v124, "Lux table has less than one element", v222, 2u);
              }
              char v246 = 0;
            }
          }
          else
          {
            v227 = 0;
            if (v245->_log)
            {
              v130 = v245->_log;
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT) {
                uint64_t v129 = _COREBRIGHTNESS_LOG_DEFAULT;
              }
              else {
                uint64_t v129 = init_default_corebrightness_log();
              }
              v130 = v129;
            }
            v227 = v130;
            os_log_type_t v226 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
            {
              v127 = v227;
              os_log_type_t v128 = v226;
              __os_log_helper_16_0_0(v225);
              _os_log_error_impl(&dword_1BA438000, v127, v128, "Unable to load lux table", v225, 2u);
            }
            char v246 = 0;
          }
        }
        else
        {
          v230 = 0;
          if (v245->_log)
          {
            v134 = v245->_log;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v133 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v133 = init_default_corebrightness_log();
            }
            v134 = v133;
          }
          v230 = v134;
          os_log_type_t v229 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
          {
            v131 = v230;
            os_log_type_t v132 = v229;
            __os_log_helper_16_0_0(v228);
            _os_log_error_impl(&dword_1BA438000, v131, v132, "Ammolite Initialization | Nits activation threshold is negative", v228, 2u);
          }
          char v246 = 0;
        }
      }
      else
      {
        v233 = 0;
        if (v245->_log)
        {
          v138 = v245->_log;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v137 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v137 = init_default_corebrightness_log();
          }
          v138 = v137;
        }
        v233 = v138;
        os_log_type_t v232 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
        {
          v135 = v233;
          os_log_type_t v136 = v232;
          __os_log_helper_16_0_0(v231);
          _os_log_error_impl(&dword_1BA438000, v135, v136, "Lux activation threshold is negative", v231, 2u);
        }
        char v246 = 0;
      }
    }
    else
    {
      v237 = 0;
      if (v245->_log)
      {
        v142 = v245->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v141 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v141 = init_default_corebrightness_log();
        }
        v142 = v141;
      }
      v237 = v142;
      os_log_type_t v236 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
      {
        v139 = v237;
        os_log_type_t v140 = v236;
        __os_log_helper_16_0_0(v235);
        _os_log_error_impl(&dword_1BA438000, v139, v140, "Ammolite is not supported", v235, 2u);
      }
      char v246 = 0;
    }
  }
  else
  {
    v242 = 0;
    if (v245->_log)
    {
      v146 = v245->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v145 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v145 = init_default_corebrightness_log();
      }
      v146 = v145;
    }
    v242 = v146;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
    {
      log = v242;
      os_log_type_t v144 = type;
      __os_log_helper_16_0_0(v240);
      _os_log_error_impl(&dword_1BA438000, log, v144, "Service is null", v240, 2u);
    }
    char v246 = 0;
  }
  return v246 & 1;
}

- (BOOL)initFromTwilightFromServiceOG:(unsigned int)a3
{
  float v3 = (void *)((uint64_t (*)(CBChromaticCorrectionParams *, SEL, void))MEMORY[0x1F4188790])(self, a2, *(void *)&a3);
  uint64_t v302 = *MEMORY[0x1E4F143B8];
  id v266 = v3;
  uint64_t v265 = v4;
  io_registry_entry_t v264 = v5;
  if (v5)
  {
    int v260 = 0;
    char v259 = load_int_from_edt(v264, @"supports-twilight", &v260) & 1;
    if (v259 && v260)
    {
      float fixed_float_from_edt = load_fixed_float_from_edt(v264, @"LminProduct");
      float v255 = fminf(fixed_float_from_edt, load_fixed_float_from_edt(v264, @"aot-accessible-min-nits"));
      float v276 = v255;
      *((float *)v266 + 20) = load_float_from_edt(v264, @"tw-lux-activation-threshold");
      int v275 = *((_DWORD *)v266 + 20);
      if (*((float *)v266 + 20) >= 0.0)
      {
        *((float *)v266 + 21) = load_float_from_edt(v264, @"tw-nits-activation-threshold");
        int v274 = *((_DWORD *)v266 + 21);
        if (*((float *)v266 + 21) >= 0.0)
        {
          *((void *)v266 + 2) = load_float_array_from_edt(v264, @"tw-lux-table", (void *)v266 + 3);
          if (*((void *)v266 + 3))
          {
            if (*((void *)v266 + 2) >= 2uLL)
            {
              if (float_equal(**((float **)v266 + 3), 0.0))
              {
                if (float_equal(*(float *)(*((void *)v266 + 3) + 4 * (*((void *)v266 + 2) - 1)), *((float *)v266 + 20)))
                {
                  for (unint64_t i = 0; i < *((void *)v266 + 2) - 1; ++i)
                  {
                    if (*(float *)(*((void *)v266 + 3) + 4 * i) >= *(float *)(*((void *)v266 + 3) + 4 * (i + 1)))
                    {
                      os_log_type_t v236 = 0;
                      if (*((void *)v266 + 1))
                      {
                        os_log_type_t v128 = *((void *)v266 + 1);
                      }
                      else
                      {
                        if (_COREBRIGHTNESS_LOG_DEFAULT) {
                          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
                        }
                        else {
                          uint64_t inited = init_default_corebrightness_log();
                        }
                        os_log_type_t v128 = inited;
                      }
                      os_log_type_t v236 = v128;
                      os_log_type_t v235 = OS_LOG_TYPE_ERROR;
                      if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v125 = v236;
                        os_log_type_t v126 = v235;
                        __os_log_helper_16_0_0(v234);
                        _os_log_error_impl(&dword_1BA438000, v125, v126, "Lux table is not monotonically increasing", v234, 2u);
                      }
                      char v267 = 0;
                      return v267 & 1;
                    }
                  }
                  *((void *)v266 + 4) = load_float_array_from_edt(v264, @"tw-nits-table", (void *)v266 + 5);
                  if (*((void *)v266 + 5))
                  {
                    if (*((void *)v266 + 4) >= 2uLL)
                    {
                      if (float_equal(**((float **)v266 + 5), v255))
                      {
                        if (float_equal(*(float *)(*((void *)v266 + 5) + 4 * (*((void *)v266 + 4) - 1)), *((float *)v266 + 21)))
                        {
                          for (unint64_t j = 0; j < *((void *)v266 + 4) - 1; ++j)
                          {
                            if (*(float *)(*((void *)v266 + 5) + 4 * j) >= *(float *)(*((void *)v266 + 5)
                                                                                       + 4 * (j + 1)))
                            {
                              v222 = 0;
                              if (*((void *)v266 + 1))
                              {
                                v112 = *((void *)v266 + 1);
                              }
                              else
                              {
                                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                  uint64_t v111 = _COREBRIGHTNESS_LOG_DEFAULT;
                                }
                                else {
                                  uint64_t v111 = init_default_corebrightness_log();
                                }
                                v112 = v111;
                              }
                              v222 = v112;
                              os_log_type_t v221 = OS_LOG_TYPE_ERROR;
                              if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                              {
                                v109 = v222;
                                os_log_type_t v110 = v221;
                                __os_log_helper_16_0_0(v220);
                                _os_log_error_impl(&dword_1BA438000, v109, v110, "Nits table is not monotonically increasing", v220, 2u);
                              }
                              char v267 = 0;
                              return v267 & 1;
                            }
                          }
                          *((void *)v266 + 6) = load_float_array_from_edt(v264, @"tw-strength-table", (void *)v266 + 7);
                          if (*((void *)v266 + 7))
                          {
                            if (*((void *)v266 + 6) == *((void *)v266 + 4) * *((void *)v266 + 2))
                            {
                              for (unint64_t k = 0; k < *((void *)v266 + 6); ++k)
                              {
                                if (*(float *)(*((void *)v266 + 7) + 4 * k) < 0.0
                                  || *(float *)(*((void *)v266 + 7) + 4 * k) > 1.0)
                                {
                                  os_log_t v213 = 0;
                                  if (*((void *)v266 + 1))
                                  {
                                    v102 = *((void *)v266 + 1);
                                  }
                                  else
                                  {
                                    if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                      uint64_t v101 = _COREBRIGHTNESS_LOG_DEFAULT;
                                    }
                                    else {
                                      uint64_t v101 = init_default_corebrightness_log();
                                    }
                                    v102 = v101;
                                  }
                                  os_log_t v213 = v102;
                                  os_log_type_t v212 = OS_LOG_TYPE_ERROR;
                                  if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                                  {
                                    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v297, k, COERCE__INT64(*(float *)(*((void *)v266 + 7) + 4 * k)));
                                    _os_log_error_impl(&dword_1BA438000, v213, v212, "Strength table element #%lu with value %f is out of the valid [0, 1] range", v297, 0x16u);
                                  }
                                  char v267 = 0;
                                  return v267 & 1;
                                }
                              }
                              unint64_t v211 = 0;
                              while (2)
                              {
                                if (v211 >= *((void *)v266 + 2))
                                {
                                  unint64_t v204 = 0;
                                  while (2)
                                  {
                                    if (v204 >= *((void *)v266 + 4))
                                    {
                                      *((float *)v266 + 16) = load_float_from_edt(v264, @"tw-ramp-update-rate");
                                      int v273 = *((_DWORD *)v266 + 16);
                                      unint64_t float_array_from_edt = load_float_array_from_edt(v264, @"tw-ramp-bezier-anchors", (void *)v266 + 9);
                                      if (*((void *)v266 + 9))
                                      {
                                        if (float_array_from_edt == 3)
                                        {
                                          if (**((float **)v266 + 9) >= 0.0 && **((float **)v266 + 9) <= 1.0)
                                          {
                                            if (*(float *)(*((void *)v266 + 9) + 4) >= 0.0
                                              && *(float *)(*((void *)v266 + 9) + 4) <= 1.0)
                                            {
                                              if (*(float *)(*((void *)v266 + 9) + 8) >= 0.0
                                                && *(float *)(*((void *)v266 + 9) + 8) <= 1.0)
                                              {
                                                *((float *)v266 + 23) = load_float_from_edt(v264, @"tw-ramp-up-duration");
                                                int v272 = *((_DWORD *)v266 + 23);
                                                if (*((float *)v266 + 23) >= 0.0)
                                                {
                                                  *((float *)v266 + 24) = load_float_from_edt(v264, @"tw-ramp-up-lux-threshold");
                                                  int v271 = *((_DWORD *)v266 + 24);
                                                  if (*((float *)v266 + 24) >= 0.0)
                                                  {
                                                    *((float *)v266 + 25) = load_float_from_edt(v264, @"tw-ramp-down-duration");
                                                    int v270 = *((_DWORD *)v266 + 25);
                                                    if (*((float *)v266 + 25) >= 0.0)
                                                    {
                                                      *((float *)v266 + 26) = load_float_from_edt(v264, @"tw-ramp-down-lux-threshold");
                                                      int v269 = *((_DWORD *)v266 + 26);
                                                      if (*((float *)v266 + 26) >= 0.0)
                                                      {
                                                        if ([+[CBAODState sharedInstance])
                                                        {
                                                          v169 = 0;
                                                          if (*((void *)v266 + 1))
                                                          {
                                                            v54 = *((void *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                              uint64_t v53 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            }
                                                            else {
                                                              uint64_t v53 = init_default_corebrightness_log();
                                                            }
                                                            v54 = v53;
                                                          }
                                                          v169 = v54;
                                                          os_log_type_t v168 = OS_LOG_TYPE_ERROR;
                                                          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                                                          {
                                                            v51 = v169;
                                                            os_log_type_t v52 = v168;
                                                            __os_log_helper_16_0_0(v167);
                                                            _os_log_error_impl(&dword_1BA438000, v51, v52, "AOD ramp duration is negative", v167, 2u);
                                                          }
                                                          char v267 = 0;
                                                        }
                                                        else
                                                        {
                                                          id v166 = objc_alloc_init(MEMORY[0x1E4F28E78]);
                                                          for (unint64_t m = 0; m < *((void *)v266 + 2); ++m)
                                                          {
                                                            double v12 = "";
                                                            if (m != *((void *)v266 + 2) - 1) {
                                                              double v12 = ",";
                                                            }
                                                            objc_msgSend(v166, "appendFormat:", @" %f%s", *(float *)(*((void *)v266 + 3) + 4 * m), v12);
                                                          }
                                                          [v166 appendString:@" "];
                                                          id v164 = objc_alloc_init(MEMORY[0x1E4F28E78]);
                                                          for (unint64_t n = 0; n < *((void *)v266 + 4); ++n)
                                                          {
                                                            uint64_t v13 = "";
                                                            if (n != *((void *)v266 + 4) - 1) {
                                                              uint64_t v13 = ",";
                                                            }
                                                            objc_msgSend(v164, "appendFormat:", @" %f%s", *(float *)(*((void *)v266 + 5) + 4 * n), v13);
                                                          }
                                                          [v164 appendString:@" "];
                                                          if (*((void *)v266 + 1))
                                                          {
                                                            v50 = *((void *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                              uint64_t v49 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            }
                                                            else {
                                                              uint64_t v49 = init_default_corebrightness_log();
                                                            }
                                                            v50 = v49;
                                                          }
                                                          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v292, COERCE__INT64(v255));
                                                            _os_log_impl(&dword_1BA438000, v50, OS_LOG_TYPE_DEFAULT, "NitsMinimum=%f", v292, 0xCu);
                                                          }
                                                          if (*((void *)v266 + 1))
                                                          {
                                                            os_log_type_t v48 = *((void *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                              uint64_t v47 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            }
                                                            else {
                                                              uint64_t v47 = init_default_corebrightness_log();
                                                            }
                                                            os_log_type_t v48 = v47;
                                                          }
                                                          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v291, COERCE__INT64(*((float *)v266 + 20)));
                                                            _os_log_impl(&dword_1BA438000, v48, OS_LOG_TYPE_DEFAULT, "LuxActivationThreshold=%f", v291, 0xCu);
                                                          }
                                                          if (*((void *)v266 + 1))
                                                          {
                                                            v46 = *((void *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                              uint64_t v45 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            }
                                                            else {
                                                              uint64_t v45 = init_default_corebrightness_log();
                                                            }
                                                            v46 = v45;
                                                          }
                                                          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v290, COERCE__INT64(*((float *)v266 + 21)));
                                                            _os_log_impl(&dword_1BA438000, v46, OS_LOG_TYPE_DEFAULT, "NitsActivationThreshold=%f", v290, 0xCu);
                                                          }
                                                          if (*((void *)v266 + 1))
                                                          {
                                                            v44 = *((void *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                              uint64_t v43 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            }
                                                            else {
                                                              uint64_t v43 = init_default_corebrightness_log();
                                                            }
                                                            v44 = v43;
                                                          }
                                                          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v289, COERCE__INT64(*((float *)v266 + 22)));
                                                            _os_log_impl(&dword_1BA438000, v44, OS_LOG_TYPE_DEFAULT, "RampUpdateRate=%f", v289, 0xCu);
                                                          }
                                                          if (*((void *)v266 + 1))
                                                          {
                                                            v42 = *((void *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                              uint64_t v41 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            }
                                                            else {
                                                              uint64_t v41 = init_default_corebrightness_log();
                                                            }
                                                            v42 = v41;
                                                          }
                                                          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v288, COERCE__INT64(**((float **)v266 + 9)), COERCE__INT64(*(float *)(*((void *)v266 + 9) + 4)), COERCE__INT64(*(float *)(*((void *)v266 + 9) + 8)));
                                                            _os_log_impl(&dword_1BA438000, v42, OS_LOG_TYPE_DEFAULT, "RampBezierAnchors={ %f, %f, %f }", v288, 0x20u);
                                                          }
                                                          if (*((void *)v266 + 1))
                                                          {
                                                            v40 = *((void *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                              uint64_t v39 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            }
                                                            else {
                                                              uint64_t v39 = init_default_corebrightness_log();
                                                            }
                                                            v40 = v39;
                                                          }
                                                          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v287, COERCE__INT64(*((float *)v266 + 23)));
                                                            _os_log_impl(&dword_1BA438000, v40, OS_LOG_TYPE_DEFAULT, "RampUpDuration=%f", v287, 0xCu);
                                                          }
                                                          if (*((void *)v266 + 1))
                                                          {
                                                            v38 = *((void *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                              uint64_t v37 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            }
                                                            else {
                                                              uint64_t v37 = init_default_corebrightness_log();
                                                            }
                                                            v38 = v37;
                                                          }
                                                          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v286, COERCE__INT64(*((float *)v266 + 24)));
                                                            _os_log_impl(&dword_1BA438000, v38, OS_LOG_TYPE_DEFAULT, "RampUpLuxDeltaThreshold=%f", v286, 0xCu);
                                                          }
                                                          if (*((void *)v266 + 1))
                                                          {
                                                            v36 = *((void *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                              uint64_t v35 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            }
                                                            else {
                                                              uint64_t v35 = init_default_corebrightness_log();
                                                            }
                                                            v36 = v35;
                                                          }
                                                          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v285, COERCE__INT64(*((float *)v266 + 25)));
                                                            _os_log_impl(&dword_1BA438000, v36, OS_LOG_TYPE_DEFAULT, "RampDownDuration=%f", v285, 0xCu);
                                                          }
                                                          if (*((void *)v266 + 1))
                                                          {
                                                            v34 = *((void *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                              uint64_t v33 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            }
                                                            else {
                                                              uint64_t v33 = init_default_corebrightness_log();
                                                            }
                                                            v34 = v33;
                                                          }
                                                          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v284, COERCE__INT64(*((float *)v266 + 26)));
                                                            _os_log_impl(&dword_1BA438000, v34, OS_LOG_TYPE_DEFAULT, "RampDownLuxDeltaThreshold=%f", v284, 0xCu);
                                                          }
                                                          if ([+[CBAODState sharedInstance] isAODSupported])
                                                          {
                                                            if (*((void *)v266 + 1))
                                                            {
                                                              v32 = *((void *)v266 + 1);
                                                            }
                                                            else
                                                            {
                                                              uint64_t v31 = _COREBRIGHTNESS_LOG_DEFAULT
                                                                  ? _COREBRIGHTNESS_LOG_DEFAULT
                                                                  : init_default_corebrightness_log();
                                                              v32 = v31;
                                                            }
                                                            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                                                            {
                                                              [v266 aodRampDuration];
                                                              __os_log_helper_16_0_1_8_0((uint64_t)v283, COERCE__INT64(v14));
                                                              _os_log_impl(&dword_1BA438000, v32, OS_LOG_TYPE_DEFAULT, "RampAODDuration=%f", v283, 0xCu);
                                                            }
                                                          }
                                                          if (*((void *)v266 + 1))
                                                          {
                                                            v30 = *((void *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                              uint64_t v29 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            }
                                                            else {
                                                              uint64_t v29 = init_default_corebrightness_log();
                                                            }
                                                            v30 = v29;
                                                          }
                                                          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v282, *((void *)v266 + 2));
                                                            _os_log_impl(&dword_1BA438000, v30, OS_LOG_TYPE_DEFAULT, "LuxTableSize=%lu", v282, 0xCu);
                                                          }
                                                          if (*((void *)v266 + 1))
                                                          {
                                                            v28 = *((void *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                              uint64_t v27 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            }
                                                            else {
                                                              uint64_t v27 = init_default_corebrightness_log();
                                                            }
                                                            v28 = v27;
                                                          }
                                                          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_2_1_8_32((uint64_t)v281, [v166 UTF8String]);
                                                            _os_log_impl(&dword_1BA438000, v28, OS_LOG_TYPE_DEFAULT, "LuxTable={%s}", v281, 0xCu);
                                                          }
                                                          if (*((void *)v266 + 1))
                                                          {
                                                            v26 = *((void *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                              uint64_t v25 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            }
                                                            else {
                                                              uint64_t v25 = init_default_corebrightness_log();
                                                            }
                                                            v26 = v25;
                                                          }
                                                          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v280, *((void *)v266 + 4));
                                                            _os_log_impl(&dword_1BA438000, v26, OS_LOG_TYPE_DEFAULT, "NitsTableSize=%lu", v280, 0xCu);
                                                          }
                                                          if (*((void *)v266 + 1))
                                                          {
                                                            v24 = *((void *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                              uint64_t v23 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            }
                                                            else {
                                                              uint64_t v23 = init_default_corebrightness_log();
                                                            }
                                                            v24 = v23;
                                                          }
                                                          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_2_1_8_32((uint64_t)v279, [v164 UTF8String]);
                                                            _os_log_impl(&dword_1BA438000, v24, OS_LOG_TYPE_DEFAULT, "NitsTable={%s}", v279, 0xCu);
                                                          }
                                                          if (*((void *)v266 + 1))
                                                          {
                                                            v22 = *((void *)v266 + 1);
                                                          }
                                                          else
                                                          {
                                                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                              uint64_t v21 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                            }
                                                            else {
                                                              uint64_t v21 = init_default_corebrightness_log();
                                                            }
                                                            v22 = v21;
                                                          }
                                                          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            __os_log_helper_16_0_1_8_0((uint64_t)v278, *((void *)v266 + 6));
                                                            _os_log_impl(&dword_1BA438000, v22, OS_LOG_TYPE_DEFAULT, "StrengthTableSize=%lu", v278, 0xCu);
                                                          }
                                                          for (unint64_t ii = 0; ii < *((void *)v266 + 2); ++ii)
                                                          {
                                                            id v161 = objc_alloc_init(MEMORY[0x1E4F28E78]);
                                                            for (unint64_t jj = 0; jj < *((void *)v266 + 4); ++jj)
                                                            {
                                                              [v266 getStrengthForRow:ii andColumn:jj];
                                                              double v16 = v15;
                                                              uint64_t v17 = "";
                                                              if (jj != *((void *)v266 + 4) - 1) {
                                                                uint64_t v17 = ",";
                                                              }
                                                              objc_msgSend(v161, "appendFormat:", @" %f%s ", *(void *)&v16, v17);
                                                            }
                                                            if (*((void *)v266 + 1))
                                                            {
                                                              v20 = *((void *)v266 + 1);
                                                            }
                                                            else
                                                            {
                                                              if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                                uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                              }
                                                              else {
                                                                uint64_t v19 = init_default_corebrightness_log();
                                                              }
                                                              v20 = v19;
                                                            }
                                                            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                                                            {
                                                              __os_log_helper_16_2_2_8_0_8_32((uint64_t)v277, ii, [v161 UTF8String]);
                                                              _os_log_impl(&dword_1BA438000, v20, OS_LOG_TYPE_DEFAULT, "StrengthTable[%lu]={%s}", v277, 0x16u);
                                                            }
                                                          }
                                                          char v267 = 1;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v172 = 0;
                                                        if (*((void *)v266 + 1))
                                                        {
                                                          v58 = *((void *)v266 + 1);
                                                        }
                                                        else
                                                        {
                                                          if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                            uint64_t v57 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                          }
                                                          else {
                                                            uint64_t v57 = init_default_corebrightness_log();
                                                          }
                                                          v58 = v57;
                                                        }
                                                        v172 = v58;
                                                        os_log_type_t v171 = OS_LOG_TYPE_ERROR;
                                                        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                                                        {
                                                          v55 = v172;
                                                          os_log_type_t v56 = v171;
                                                          __os_log_helper_16_0_0(v170);
                                                          _os_log_error_impl(&dword_1BA438000, v55, v56, "Ramp down lux delta threshold is negative", v170, 2u);
                                                        }
                                                        char v267 = 0;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v175 = 0;
                                                      if (*((void *)v266 + 1))
                                                      {
                                                        v62 = *((void *)v266 + 1);
                                                      }
                                                      else
                                                      {
                                                        if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                          uint64_t v61 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                        }
                                                        else {
                                                          uint64_t v61 = init_default_corebrightness_log();
                                                        }
                                                        v62 = v61;
                                                      }
                                                      v175 = v62;
                                                      os_log_type_t v174 = OS_LOG_TYPE_ERROR;
                                                      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                                                      {
                                                        v59 = v175;
                                                        os_log_type_t v60 = v174;
                                                        __os_log_helper_16_0_0(v173);
                                                        _os_log_error_impl(&dword_1BA438000, v59, v60, "Ramp down duration is negative", v173, 2u);
                                                      }
                                                      char v267 = 0;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v178 = 0;
                                                    if (*((void *)v266 + 1))
                                                    {
                                                      v66 = *((void *)v266 + 1);
                                                    }
                                                    else
                                                    {
                                                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                        uint64_t v65 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                      }
                                                      else {
                                                        uint64_t v65 = init_default_corebrightness_log();
                                                      }
                                                      v66 = v65;
                                                    }
                                                    v178 = v66;
                                                    os_log_type_t v177 = OS_LOG_TYPE_ERROR;
                                                    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                                                    {
                                                      v63 = v178;
                                                      os_log_type_t v64 = v177;
                                                      __os_log_helper_16_0_0(v176);
                                                      _os_log_error_impl(&dword_1BA438000, v63, v64, "Ramp up lux delta threshold is negative", v176, 2u);
                                                    }
                                                    char v267 = 0;
                                                  }
                                                }
                                                else
                                                {
                                                  v181 = 0;
                                                  if (*((void *)v266 + 1))
                                                  {
                                                    v70 = *((void *)v266 + 1);
                                                  }
                                                  else
                                                  {
                                                    if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                      uint64_t v69 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                    }
                                                    else {
                                                      uint64_t v69 = init_default_corebrightness_log();
                                                    }
                                                    v70 = v69;
                                                  }
                                                  v181 = v70;
                                                  os_log_type_t v180 = OS_LOG_TYPE_ERROR;
                                                  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                                                  {
                                                    v67 = v181;
                                                    os_log_type_t v68 = v180;
                                                    __os_log_helper_16_0_0(v179);
                                                    _os_log_error_impl(&dword_1BA438000, v67, v68, "Ramp up duration is negative", v179, 2u);
                                                  }
                                                  char v267 = 0;
                                                }
                                              }
                                              else
                                              {
                                                v184 = 0;
                                                if (*((void *)v266 + 1))
                                                {
                                                  v74 = *((void *)v266 + 1);
                                                }
                                                else
                                                {
                                                  if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                    uint64_t v73 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                  }
                                                  else {
                                                    uint64_t v73 = init_default_corebrightness_log();
                                                  }
                                                  v74 = v73;
                                                }
                                                v184 = v74;
                                                os_log_type_t v183 = OS_LOG_TYPE_ERROR;
                                                if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                                                {
                                                  v71 = v184;
                                                  os_log_type_t v72 = v183;
                                                  __os_log_helper_16_0_0(v182);
                                                  _os_log_error_impl(&dword_1BA438000, v71, v72, "Third ramp Bezier anchor is out of valid [0, 1] range", v182, 2u);
                                                }
                                                char v267 = 0;
                                              }
                                            }
                                            else
                                            {
                                              v187 = 0;
                                              if (*((void *)v266 + 1))
                                              {
                                                v78 = *((void *)v266 + 1);
                                              }
                                              else
                                              {
                                                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                  uint64_t v77 = _COREBRIGHTNESS_LOG_DEFAULT;
                                                }
                                                else {
                                                  uint64_t v77 = init_default_corebrightness_log();
                                                }
                                                v78 = v77;
                                              }
                                              v187 = v78;
                                              os_log_type_t v186 = OS_LOG_TYPE_ERROR;
                                              if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
                                              {
                                                v75 = v187;
                                                os_log_type_t v76 = v186;
                                                __os_log_helper_16_0_0(v185);
                                                _os_log_error_impl(&dword_1BA438000, v75, v76, "Second ramp Bezier anchor is out of valid [0, 1] range", v185, 2u);
                                              }
                                              char v267 = 0;
                                            }
                                          }
                                          else
                                          {
                                            os_log_t v190 = 0;
                                            if (*((void *)v266 + 1))
                                            {
                                              v82 = *((void *)v266 + 1);
                                            }
                                            else
                                            {
                                              if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                                uint64_t v81 = _COREBRIGHTNESS_LOG_DEFAULT;
                                              }
                                              else {
                                                uint64_t v81 = init_default_corebrightness_log();
                                              }
                                              v82 = v81;
                                            }
                                            os_log_t v190 = v82;
                                            os_log_type_t v189 = OS_LOG_TYPE_ERROR;
                                            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
                                            {
                                              v79 = v190;
                                              os_log_type_t v80 = v189;
                                              __os_log_helper_16_0_0(v188);
                                              _os_log_error_impl(&dword_1BA438000, v79, v80, "First ramp Bezier anchor is out of valid [0, 1] range", v188, 2u);
                                            }
                                            char v267 = 0;
                                          }
                                        }
                                        else
                                        {
                                          os_log_t v193 = 0;
                                          if (*((void *)v266 + 1))
                                          {
                                            v86 = *((void *)v266 + 1);
                                          }
                                          else
                                          {
                                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                              uint64_t v85 = _COREBRIGHTNESS_LOG_DEFAULT;
                                            }
                                            else {
                                              uint64_t v85 = init_default_corebrightness_log();
                                            }
                                            v86 = v85;
                                          }
                                          os_log_t v193 = v86;
                                          os_log_type_t v192 = OS_LOG_TYPE_ERROR;
                                          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                                          {
                                            v83 = v193;
                                            os_log_type_t v84 = v192;
                                            __os_log_helper_16_0_0(v191);
                                            _os_log_error_impl(&dword_1BA438000, v83, v84, "Incorrect number of ramp Bezier anchors", v191, 2u);
                                          }
                                          char v267 = 0;
                                        }
                                      }
                                      else
                                      {
                                        os_log_type_t v196 = 0;
                                        if (*((void *)v266 + 1))
                                        {
                                          uint64_t v90 = *((void *)v266 + 1);
                                        }
                                        else
                                        {
                                          if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                            uint64_t v89 = _COREBRIGHTNESS_LOG_DEFAULT;
                                          }
                                          else {
                                            uint64_t v89 = init_default_corebrightness_log();
                                          }
                                          uint64_t v90 = v89;
                                        }
                                        os_log_type_t v196 = v90;
                                        os_log_type_t v195 = OS_LOG_TYPE_ERROR;
                                        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
                                        {
                                          uint64_t v87 = v196;
                                          os_log_type_t v88 = v195;
                                          __os_log_helper_16_0_0(v194);
                                          _os_log_error_impl(&dword_1BA438000, v87, v88, "Unable to load ramp Bezier anchors", v194, 2u);
                                        }
                                        char v267 = 0;
                                      }
                                    }
                                    else
                                    {
                                      for (unint64_t kk = 0; kk < *((void *)v266 + 2) - 1; ++kk)
                                      {
                                        [v266 getStrengthForRow:kk andColumn:v204];
                                        float v95 = v9;
                                        [v266 getStrengthForRow:kk + 1 andColumn:v204];
                                        if (v95 < v10)
                                        {
                                          os_log_t v202 = 0;
                                          if (*((void *)v266 + 1))
                                          {
                                            float v94 = *((void *)v266 + 1);
                                          }
                                          else
                                          {
                                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                              uint64_t v93 = _COREBRIGHTNESS_LOG_DEFAULT;
                                            }
                                            else {
                                              uint64_t v93 = init_default_corebrightness_log();
                                            }
                                            float v94 = v93;
                                          }
                                          os_log_t v202 = v94;
                                          os_log_type_t v201 = OS_LOG_TYPE_ERROR;
                                          if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
                                          {
                                            __os_log_helper_16_0_1_8_0((uint64_t)v294, v204);
                                            _os_log_error_impl(&dword_1BA438000, v202, v201, "Strength table column #%lu is not monotonically non-increasing", v294, 0xCu);
                                          }
                                          char v267 = 0;
                                          return v267 & 1;
                                        }
                                      }
                                      float v200 = 0.0;
                                      [v266 getStrengthForRow:*((void *)v266 + 2) - 1 andColumn:v204];
                                      float v200 = v11;
                                      if (float_equal(v11, 0.0))
                                      {
                                        ++v204;
                                        continue;
                                      }
                                      os_log_t v199 = 0;
                                      if (*((void *)v266 + 1))
                                      {
                                        uint64_t v92 = *((void *)v266 + 1);
                                      }
                                      else
                                      {
                                        if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                          uint64_t v91 = _COREBRIGHTNESS_LOG_DEFAULT;
                                        }
                                        else {
                                          uint64_t v91 = init_default_corebrightness_log();
                                        }
                                        uint64_t v92 = v91;
                                      }
                                      os_log_t v199 = v92;
                                      os_log_type_t v198 = OS_LOG_TYPE_ERROR;
                                      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
                                      {
                                        __os_log_helper_16_0_2_8_0_8_0((uint64_t)v293, v204, COERCE__INT64(v200));
                                        _os_log_error_impl(&dword_1BA438000, v199, v198, "Last element of strength table column #%lu with value %f is not 0", v293, 0x16u);
                                      }
                                      char v267 = 0;
                                    }
                                    break;
                                  }
                                }
                                else
                                {
                                  for (munint64_t m = 0; mm < *((void *)v266 + 4) - 1; ++mm)
                                  {
                                    [v266 getStrengthForRow:v211 andColumn:mm];
                                    float v100 = v6;
                                    [v266 getStrengthForRow:v211 andColumn:mm + 1];
                                    if (v100 < v7)
                                    {
                                      os_log_t v209 = 0;
                                      if (*((void *)v266 + 1))
                                      {
                                        v99 = *((void *)v266 + 1);
                                      }
                                      else
                                      {
                                        if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                          uint64_t v98 = _COREBRIGHTNESS_LOG_DEFAULT;
                                        }
                                        else {
                                          uint64_t v98 = init_default_corebrightness_log();
                                        }
                                        v99 = v98;
                                      }
                                      os_log_t v209 = v99;
                                      os_log_type_t v208 = OS_LOG_TYPE_ERROR;
                                      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
                                      {
                                        __os_log_helper_16_0_1_8_0((uint64_t)v296, v211);
                                        _os_log_error_impl(&dword_1BA438000, v209, v208, "Strength table row #%lu is not monotonically non-increasing", v296, 0xCu);
                                      }
                                      char v267 = 0;
                                      return v267 & 1;
                                    }
                                  }
                                  float v207 = 0.0;
                                  [v266 getStrengthForRow:v211 andColumn:*((void *)v266 + 4) - 1];
                                  float v207 = v8;
                                  if (float_equal(v8, 0.0))
                                  {
                                    ++v211;
                                    continue;
                                  }
                                  os_log_t v206 = 0;
                                  if (*((void *)v266 + 1))
                                  {
                                    uint64_t v97 = *((void *)v266 + 1);
                                  }
                                  else
                                  {
                                    if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                      uint64_t v96 = _COREBRIGHTNESS_LOG_DEFAULT;
                                    }
                                    else {
                                      uint64_t v96 = init_default_corebrightness_log();
                                    }
                                    uint64_t v97 = v96;
                                  }
                                  os_log_t v206 = v97;
                                  os_log_type_t v205 = OS_LOG_TYPE_ERROR;
                                  if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
                                  {
                                    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v295, v211, COERCE__INT64(v207));
                                    _os_log_error_impl(&dword_1BA438000, v206, v205, "Last element of strength table row #%lu with value %f is not 0", v295, 0x16u);
                                  }
                                  char v267 = 0;
                                }
                                break;
                              }
                            }
                            else
                            {
                              os_log_t v216 = 0;
                              if (*((void *)v266 + 1))
                              {
                                os_log_type_t v104 = *((void *)v266 + 1);
                              }
                              else
                              {
                                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                  uint64_t v103 = _COREBRIGHTNESS_LOG_DEFAULT;
                                }
                                else {
                                  uint64_t v103 = init_default_corebrightness_log();
                                }
                                os_log_type_t v104 = v103;
                              }
                              os_log_t v216 = v104;
                              os_log_type_t v215 = OS_LOG_TYPE_ERROR;
                              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                              {
                                __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v298, *((void *)v266 + 6), *((void *)v266 + 2), *((void *)v266 + 4));
                                _os_log_error_impl(&dword_1BA438000, v216, v215, "Strength table has wrong size %lu for lux table size %lu and nits table size %lu", v298, 0x20u);
                              }
                              char v267 = 0;
                            }
                          }
                          else
                          {
                            v219 = 0;
                            if (*((void *)v266 + 1))
                            {
                              v108 = *((void *)v266 + 1);
                            }
                            else
                            {
                              if (_COREBRIGHTNESS_LOG_DEFAULT) {
                                uint64_t v107 = _COREBRIGHTNESS_LOG_DEFAULT;
                              }
                              else {
                                uint64_t v107 = init_default_corebrightness_log();
                              }
                              v108 = v107;
                            }
                            v219 = v108;
                            os_log_type_t v218 = OS_LOG_TYPE_ERROR;
                            if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                            {
                              uint64_t v105 = v219;
                              os_log_type_t v106 = v218;
                              __os_log_helper_16_0_0(v217);
                              _os_log_error_impl(&dword_1BA438000, v105, v106, "Unable to load strength table", v217, 2u);
                            }
                            char v267 = 0;
                          }
                        }
                        else
                        {
                          os_log_t v225 = 0;
                          if (*((void *)v266 + 1))
                          {
                            os_log_type_t v114 = *((void *)v266 + 1);
                          }
                          else
                          {
                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                              uint64_t v113 = _COREBRIGHTNESS_LOG_DEFAULT;
                            }
                            else {
                              uint64_t v113 = init_default_corebrightness_log();
                            }
                            os_log_type_t v114 = v113;
                          }
                          os_log_t v225 = v114;
                          os_log_type_t v224 = OS_LOG_TYPE_ERROR;
                          if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
                          {
                            __os_log_helper_16_0_1_8_0((uint64_t)v299, COERCE__INT64(*((float *)v266 + 21)));
                            _os_log_error_impl(&dword_1BA438000, v225, v224, "Last element in the nits table is not %f", v299, 0xCu);
                          }
                          char v267 = 0;
                        }
                      }
                      else
                      {
                        os_log_t v227 = 0;
                        if (*((void *)v266 + 1))
                        {
                          v116 = *((void *)v266 + 1);
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT) {
                            uint64_t v115 = _COREBRIGHTNESS_LOG_DEFAULT;
                          }
                          else {
                            uint64_t v115 = init_default_corebrightness_log();
                          }
                          v116 = v115;
                        }
                        os_log_t v227 = v116;
                        os_log_type_t v226 = OS_LOG_TYPE_ERROR;
                        if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
                        {
                          __os_log_helper_16_0_1_8_0((uint64_t)v300, COERCE__INT64(v255));
                          _os_log_error_impl(&dword_1BA438000, v227, v226, "First element in the nits table is not %f", v300, 0xCu);
                        }
                        char v267 = 0;
                      }
                    }
                    else
                    {
                      v230 = 0;
                      if (*((void *)v266 + 1))
                      {
                        v120 = *((void *)v266 + 1);
                      }
                      else
                      {
                        if (_COREBRIGHTNESS_LOG_DEFAULT) {
                          uint64_t v119 = _COREBRIGHTNESS_LOG_DEFAULT;
                        }
                        else {
                          uint64_t v119 = init_default_corebrightness_log();
                        }
                        v120 = v119;
                      }
                      v230 = v120;
                      os_log_type_t v229 = OS_LOG_TYPE_ERROR;
                      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                      {
                        v117 = v230;
                        os_log_type_t v118 = v229;
                        __os_log_helper_16_0_0(v228);
                        _os_log_error_impl(&dword_1BA438000, v117, v118, "Nits table has less than two elements", v228, 2u);
                      }
                      char v267 = 0;
                    }
                  }
                  else
                  {
                    v233 = 0;
                    if (*((void *)v266 + 1))
                    {
                      os_log_type_t v124 = *((void *)v266 + 1);
                    }
                    else
                    {
                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                        uint64_t v123 = _COREBRIGHTNESS_LOG_DEFAULT;
                      }
                      else {
                        uint64_t v123 = init_default_corebrightness_log();
                      }
                      os_log_type_t v124 = v123;
                    }
                    v233 = v124;
                    os_log_type_t v232 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v121 = v233;
                      os_log_type_t v122 = v232;
                      __os_log_helper_16_0_0(v231);
                      _os_log_error_impl(&dword_1BA438000, v121, v122, "Unable to load nits table", v231, 2u);
                    }
                    char v267 = 0;
                  }
                }
                else
                {
                  os_log_t v239 = 0;
                  if (*((void *)v266 + 1))
                  {
                    v130 = *((void *)v266 + 1);
                  }
                  else
                  {
                    if (_COREBRIGHTNESS_LOG_DEFAULT) {
                      uint64_t v129 = _COREBRIGHTNESS_LOG_DEFAULT;
                    }
                    else {
                      uint64_t v129 = init_default_corebrightness_log();
                    }
                    v130 = v129;
                  }
                  os_log_t v239 = v130;
                  os_log_type_t v238 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
                  {
                    __os_log_helper_16_0_1_8_0((uint64_t)v301, COERCE__INT64(*((float *)v266 + 20)));
                    _os_log_error_impl(&dword_1BA438000, v239, v238, "Last element in the lux table is not %f", v301, 0xCu);
                  }
                  char v267 = 0;
                }
              }
              else
              {
                v242 = 0;
                if (*((void *)v266 + 1))
                {
                  v134 = *((void *)v266 + 1);
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT) {
                    uint64_t v133 = _COREBRIGHTNESS_LOG_DEFAULT;
                  }
                  else {
                    uint64_t v133 = init_default_corebrightness_log();
                  }
                  v134 = v133;
                }
                v242 = v134;
                os_log_type_t v241 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
                {
                  v131 = v242;
                  os_log_type_t v132 = v241;
                  __os_log_helper_16_0_0(v240);
                  _os_log_error_impl(&dword_1BA438000, v131, v132, "First element in the lux table is not 0", v240, 2u);
                }
                char v267 = 0;
              }
            }
            else
            {
              v245 = 0;
              if (*((void *)v266 + 1))
              {
                v138 = *((void *)v266 + 1);
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                  uint64_t v137 = _COREBRIGHTNESS_LOG_DEFAULT;
                }
                else {
                  uint64_t v137 = init_default_corebrightness_log();
                }
                v138 = v137;
              }
              v245 = v138;
              os_log_type_t v244 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
              {
                v135 = v245;
                os_log_type_t v136 = v244;
                __os_log_helper_16_0_0(v243);
                _os_log_error_impl(&dword_1BA438000, v135, v136, "Lux table has less than two elements", v243, 2u);
              }
              char v267 = 0;
            }
          }
          else
          {
            v248 = 0;
            if (*((void *)v266 + 1))
            {
              v142 = *((void *)v266 + 1);
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT) {
                uint64_t v141 = _COREBRIGHTNESS_LOG_DEFAULT;
              }
              else {
                uint64_t v141 = init_default_corebrightness_log();
              }
              v142 = v141;
            }
            v248 = v142;
            os_log_type_t v247 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
            {
              v139 = v248;
              os_log_type_t v140 = v247;
              __os_log_helper_16_0_0(v246);
              _os_log_error_impl(&dword_1BA438000, v139, v140, "Unable to load lux table", v246, 2u);
            }
            char v267 = 0;
          }
        }
        else
        {
          v251 = 0;
          if (*((void *)v266 + 1))
          {
            v146 = *((void *)v266 + 1);
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v145 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v145 = init_default_corebrightness_log();
            }
            v146 = v145;
          }
          v251 = v146;
          os_log_type_t v250 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
          {
            v143 = v251;
            os_log_type_t v144 = v250;
            __os_log_helper_16_0_0(v249);
            _os_log_error_impl(&dword_1BA438000, v143, v144, "Nits activation threshold is negative", v249, 2u);
          }
          char v267 = 0;
        }
      }
      else
      {
        v254 = 0;
        if (*((void *)v266 + 1))
        {
          v150 = *((void *)v266 + 1);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v149 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v149 = init_default_corebrightness_log();
          }
          v150 = v149;
        }
        v254 = v150;
        os_log_type_t v253 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
        {
          v147 = v254;
          os_log_type_t v148 = v253;
          __os_log_helper_16_0_0(v252);
          _os_log_error_impl(&dword_1BA438000, v147, v148, "Lux activation threshold is negative", v252, 2u);
        }
        char v267 = 0;
      }
    }
    else
    {
      v258 = 0;
      if (*((void *)v266 + 1))
      {
        os_log_type_t v155 = *((void *)v266 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v154 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v154 = init_default_corebrightness_log();
        }
        os_log_type_t v155 = v154;
      }
      v258 = v155;
      os_log_type_t v257 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
      {
        v152 = v258;
        os_log_type_t v153 = v257;
        __os_log_helper_16_0_0(v256);
        _os_log_error_impl(&dword_1BA438000, v152, v153, "Twilight is not supported", v256, 2u);
      }
      char v267 = 0;
    }
  }
  else
  {
    v263 = 0;
    if (*((void *)v266 + 1))
    {
      v159 = *((void *)v266 + 1);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v158 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v158 = init_default_corebrightness_log();
      }
      v159 = v158;
    }
    v263 = v159;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
    {
      log = v263;
      os_log_type_t v157 = type;
      __os_log_helper_16_0_0(v261);
      _os_log_error_impl(&dword_1BA438000, log, v157, "Service is null", v261, 2u);
    }
    char v267 = 0;
  }
  return v267 & 1;
}

- (CBFloatArray)luxTable
{
  return self->_luxTable;
}

- (CBFloatArray2D)strengthTable
{
  return self->_strengthTable;
}

- (CBFloatArray)rampBezierAnchors
{
  return self->_rampBezierAnchors;
}

- (float)rampUpdateRate
{
  return self->_rampUpdateRate;
}

- (float)rampUpDuration
{
  return self->_rampUpDuration;
}

- (float)rampUpLuxDeltaThreshold
{
  return self->_rampUpLuxDeltaThreshold;
}

- (float)rampDownDuration
{
  return self->_rampDownDuration;
}

- (float)rampDownLuxDeltaThreshold
{
  return self->_rampDownLuxDeltaThreshold;
}

- (float)aodRampDuration
{
  return self->_aodRampDuration;
}

@end