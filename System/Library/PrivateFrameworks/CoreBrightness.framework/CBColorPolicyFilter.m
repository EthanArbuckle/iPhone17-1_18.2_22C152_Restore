@interface CBColorPolicyFilter
- (BOOL)isColorMitigationTriggered;
- (BOOL)sampleIsFromCERegion:(id)a3;
- (BOOL)sampleIsFromMitigatedRegion:(id)a3;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BOOL)shouldMitigateForSample:(id)a3 withLuxThr:(float *)a4 NitsThr:(float *)a5 andSize:(int)a6;
- (CBColorPolicyFilter)initWithID:(unsigned int)a3;
- (CBHIDEvent)filteredALS;
- (float)biLinearInterpBetweenIndices:(char *)a3 forPoint1:(float)a4 andPoint2:(float)a5;
- (float)computeBaselineStrengthForLux:(float)a3 andNits:(float)a4;
- (float)filteredStrength;
- (float)interpolateBetweenX1:(float)a3 Y1:(float)a4 X2:(float)a5 Y2:(float)a6 X:(float)a7;
- (id)copyPropertyForKey:(id)a3;
- (id)filterEvent:(id)a3;
- (id)handleALSEvent:(id)a3;
- (void)dealloc;
- (void)initializeMitigationsForDevice:(unsigned int)a3;
- (void)resetFilter;
- (void)setFilteredStrength:(float)a3;
- (void)setIsColorMitigationTriggered:(BOOL)a3;
- (void)setModuleObject:(id)a3;
@end

@implementation CBColorPolicyFilter

- (id)filterEvent:(id)a3
{
  if ([a3 eventType] == 12) {
    return [(CBColorPolicyFilter *)self handleALSEvent:a3];
  }
  else {
    return a3;
  }
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  char v12 = 0;
  if ([a4 isEqual:@"CEEnable"])
  {
    self->_ceEnabled = [a3 BOOLValue] & 1;
    char v12 = 1;
  }
  if ([a4 isEqual:@"CEConfidenceThreshold"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a3 floatValue];
      char v12 = 1;
    }
  }
  if ([a4 isEqual:@"MitigationBoundaryOverride"])
  {
    if (a3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[a3 objectForKey:@"TTRestriction_th_E"];
        v10 = (void *)[a3 objectForKey:@"TTRestriction_th_L"];
        uint64_t v7 = [v11 count];
        if (v7 == [v10 count])
        {
          if ([v11 count])
          {
            int v9 = [v11 count];
            if (v9 > 20) {
              int v9 = 20;
            }
            self->_mitigationThrSize = v9;
            for (int i = 0; i < v9; ++i)
            {
              objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", i), "floatValue");
              self->_mitigationThrE[i] = v4;
              objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", i), "floatValue");
              self->_mitigationThrL[i] = v5;
            }
          }
        }
      }
    }
    else
    {
      [(CBColorPolicyFilter *)self initializeMitigationsForDevice:0];
    }
  }
  return v12 & 1;
}

- (id)copyPropertyForKey:(id)a3
{
  float v4 = 0;
  if ([a3 isEqual:@"CEEnable"]) {
    return (id)[objc_alloc(NSNumber) initWithBool:self->_ceEnabled];
  }
  return v4;
}

float __38__CBColorPolicyFilter_handleALSEvent___block_invoke_2(uint64_t a1, void *a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"Strength"), "floatValue");
    if (result >= *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
    }
  }
  return result;
}

uint64_t __38__CBColorPolicyFilter_handleALSEvent___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"Mitigated"), "BOOLValue");
    if ((result & 1) == 0) {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
    }
  }
  return result;
}

- (float)filteredStrength
{
  return self->_filteredStrength;
}

- (BOOL)sampleIsFromCERegion:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v7 = [(CBColorPolicyFilter *)self shouldMitigateForSample:a3 withLuxThr:self->_ceMitigationThrE NitsThr:self->_ceMitigationThrL andSize:self->_ceMitigationThrSize];
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    if (v7) {
      v3 = "";
    }
    else {
      v3 = "NOT";
    }
    __os_log_helper_16_2_1_8_32((uint64_t)v9, (uint64_t)v3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "HarmonyPolicy: Sample IS %s from CE region", v9, 0xCu);
  }
  return v7 & 1;
}

- (BOOL)sampleIsFromMitigatedRegion:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v7 = [(CBColorPolicyFilter *)self shouldMitigateForSample:a3 withLuxThr:self->_mitigationThrE NitsThr:self->_mitigationThrL andSize:self->_mitigationThrSize];
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    if (v7) {
      v3 = "";
    }
    else {
      v3 = "NOT";
    }
    __os_log_helper_16_2_1_8_32((uint64_t)v9, (uint64_t)v3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "HarmonyPolicy: Sample IS %s from mitigated region", v9, 0xCu);
  }
  return v7 & 1;
}

- (id)handleALSEvent:(id)a3
{
  v111 = (float *)&v126;
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  v143 = self;
  SEL v142 = a2;
  id v141 = a3;
  char v140 = 1;
  char v139 = 0;
  int v138 = 1049247089;
  float v137 = 1.0;
  int v136 = 0;
  int v135 = 0;
  [a3 illuminance];
  double v112 = v3;
  *(float *)&double v3 = v3;
  int v135 = LODWORD(v3);
  memset(__b, 0, sizeof(__b));
  id v110 = v141;
  if (v141) {
    [v110 vendorData];
  }
  else {
    memset(__b, 0, sizeof(__b));
  }
  float v4 = v111;
  v111[41] = 0.0;
  v4[41] = (float)*(unsigned __int16 *)&__b[6];
  v4[78] = *(float *)&__b[72];
  if (v4[77] >= 10.0)
  {
    if (__b[82])
    {
      int v108 = [*((id *)v111 + 43) sampleIsFromMitigatedRegion:*((void *)v111 + 41)];
      if (v108)
      {
        *(float *)&double v9 = v111[77];
        *(float *)&double v10 = v111[41];
        [*((id *)v111 + 43) computeBaselineStrengthForLux:v9 andNits:v10];
        int v107 = v11;
        char v12 = v111;
        *((_DWORD *)v111 + 80) = v11;
        [*((id *)v12 + 41) setColorMitigationTriggered:1];
        *(unsigned char *)(*((void *)v111 + 43) + 425) = 1;
      }
      else
      {
        [*((id *)v111 + 41) setColorMitigationTriggered:0];
        v13 = v111;
        *(unsigned char *)(*((void *)v111 + 43) + 425) = 0;
        v13[80] = 0.27;
      }
      v14 = v111;
      *(void *)(*((void *)v111 + 43) + 432) = *((void *)v111 + 41);
      *(float *)(*((void *)v14 + 43) + 428) = v14[80];
    }
    else
    {
      int v106 = [*((id *)v111 + 43) sampleIsFromMitigatedRegion:*((void *)v111 + 41)];
      if (v106)
      {
        [*((id *)v111 + 41) setColorMitigationTriggered:1];
        v15 = v111;
        v111[40] = 0.0;
        *(float *)&double v16 = v15[41];
        [*((id *)v15 + 43) computeBaselineStrengthForLux:COERCE_DOUBLE((unint64_t)*((_DWORD *)v15 + 77)) andNits:v16];
        int v105 = v17;
        v18 = v111;
        *((_DWORD *)v111 + 40) = v17;
        if (*(unsigned char *)(*((void *)v18 + 43) + 384))
        {
          int v104 = [*((id *)v111 + 43) sampleIsFromCERegion:*((void *)v111 + 41)];
          if (v104)
          {
            v19 = v111;
            char v139 = 1;
            *((void *)v111 + 19) = 0;
            uint64_t v103 = [*(id *)(*((void *)v19 + 43) + 376) copyInference:*((void *)v19 + 41)];
            v20 = v111;
            *((void *)v111 + 19) = v103;
            uint64_t v101 = *((void *)v20 + 19);
            uint64_t v102 = objc_opt_class();
            int isKindOfClass = objc_opt_isKindOfClass();
            if (isKindOfClass)
            {
              id v99 = (id)[*((id *)v111 + 19) objectForKey:@"CEStrength"];
              [v99 floatValue];
              int v98 = v21;
              v22 = v111;
              *((_DWORD *)v111 + 80) = v21;
              id v97 = (id)[*((id *)v22 + 19) objectForKey:@"CEConfidence"];
              [v97 floatValue];
              int v96 = v23;
              *((_DWORD *)v111 + 79) = v23;
            }

            if (v111[79] >= *(float *)(*((void *)v111 + 43) + 388))
            {
              if (v111[80] < v111[40])
              {
                v29 = v111;
                char v139 = 0;
                *((void *)v111 + 16) = 0;
                if (*(void *)(*((void *)v29 + 43) + 8))
                {
                  uint64_t v89 = *(void *)(*((void *)v111 + 43) + 8);
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                  {
                    uint64_t v88 = _COREBRIGHTNESS_LOG_DEFAULT;
                  }
                  else
                  {
                    uint64_t inited = init_default_corebrightness_log();
                    uint64_t v88 = inited;
                  }
                  uint64_t v89 = v88;
                }
                v30 = v111;
                *((void *)v111 + 16) = v89;
                os_log_type_t v132 = OS_LOG_TYPE_INFO;
                if (os_log_type_enabled(*((os_log_t *)v30 + 16), OS_LOG_TYPE_INFO))
                {
                  os_log_t v84 = (os_log_t)*((void *)v111 + 16);
                  *(_DWORD *)v85 = v132;
                  *(double *)&uint64_t v31 = v111[80];
                  *(double *)&uint64_t v32 = v111[40];
                  v86 = v146;
                  __os_log_helper_16_0_2_8_0_8_0((uint64_t)v146, v31, v32);
                  _os_log_impl(&dword_1BA438000, v84, v85[0], "HarmonyPolicy: CE strength (%f) < baseline (%f), using baseline", v146, 0x16u);
                }
                v111[80] = v111[40];
              }
            }
            else
            {
              v24 = v111;
              v111[80] = v111[40];
              *((void *)v24 + 18) = 0;
              if (*(void *)(*((void *)v24 + 43) + 8))
              {
                uint64_t v95 = *(void *)(*((void *)v111 + 43) + 8);
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT)
                {
                  uint64_t v94 = _COREBRIGHTNESS_LOG_DEFAULT;
                }
                else
                {
                  uint64_t v93 = init_default_corebrightness_log();
                  uint64_t v94 = v93;
                }
                uint64_t v95 = v94;
              }
              v25 = v111;
              *((void *)v111 + 18) = v95;
              os_log_type_t type = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(*((os_log_t *)v25 + 18), OS_LOG_TYPE_INFO))
              {
                os_log_t log = (os_log_t)*((void *)v111 + 18);
                *(_DWORD *)v91 = type;
                *(double *)&uint64_t v26 = v111[79];
                *(double *)&uint64_t v27 = *(float *)(*((void *)v111 + 43) + 388);
                *(double *)&uint64_t v28 = v111[80];
                buf = v147;
                __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v147, v26, v27, v28);
                _os_log_impl(&dword_1BA438000, log, v91[0], "HarmonyPolicy: Low CE Confidence: %f (threshold: %f), Using baseline strength: %f", v147, 0x20u);
              }
              char v139 = 0;
            }
          }
          else
          {
            v111[80] = 0.27;
          }
        }
        else
        {
          v111[80] = v111[40];
        }
        *(unsigned char *)(*((void *)v111 + 43) + 425) = 1;
      }
      else
      {
        [*((id *)v111 + 41) setColorMitigationTriggered:0];
        v33 = v111;
        *(unsigned char *)(*((void *)v111 + 43) + 425) = 0;
        v33[80] = 0.27;
      }
    }
    if (v140)
    {
      *((void *)v111 + 14) = 0;
      id v83 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      uint64_t v81 = *((void *)v111 + 41);
      uint64_t v82 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v111 + 78)];
      *(float *)&double v34 = v111[80];
      uint64_t v80 = [NSNumber numberWithFloat:v34];
      id v78 = (id)NSNumber;
      int v79 = [*((id *)v111 + 41) colorMitigationTriggered];
      uint64_t v77 = [v78 numberWithBool:v79 & 1];
      uint64_t v76 = [NSNumber numberWithBool:v139 & 1];
      v74 = &v54;
      uint64_t v75 = objc_msgSend(v83, "initWithObjectsAndKeys:", v81, @"ALSSample", v82, @"sampleTimestamp", v80, @"Strength", v77, @"Mitigated", v76, @"isStrengthFromCE", 0);
      v35 = v111;
      *((void *)v111 + 14) = v75;
      *((void *)v35 + 13) = 0;
      if (*(void *)(*((void *)v35 + 43) + 8))
      {
        uint64_t v73 = *(void *)(*((void *)v111 + 43) + 8);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
        {
          uint64_t v72 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else
        {
          uint64_t v71 = init_default_corebrightness_log();
          uint64_t v72 = v71;
        }
        uint64_t v73 = v72;
      }
      v36 = v111;
      *((void *)v111 + 13) = v73;
      os_log_type_t v131 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(*((os_log_t *)v36 + 13), OS_LOG_TYPE_INFO))
      {
        os_log_t v68 = (os_log_t)*((void *)v111 + 13);
        *(_DWORD *)v69 = v131;
        uint64_t v37 = *((void *)v111 + 14);
        v70 = v145;
        __os_log_helper_16_2_1_8_64((uint64_t)v145, v37);
        _os_log_impl(&dword_1BA438000, v68, v69[0], "HarmonyPolicy: Incoming ALS sample, pushed to queue: %@", v70, 0xCu);
      }
      [*(id *)(*((void *)v111 + 43) + 392) pushObj:*((void *)v111 + 14)];
      v38 = v111;
      ++*(void *)(*((void *)v111 + 43) + 408);

      if (*(void *)(*((void *)v111 + 43) + 408) > *(void *)(*((void *)v111 + 43) + 400))
      {
        context = (void *)MEMORY[0x1BA9ECAE0]();
        uint64_t v66 = [*(id *)(*((void *)v111 + 43) + 392) popObj];
        v39 = context;
        v40 = v111;
        *((void *)v111 + 14) = v66;
        --*(void *)(*((void *)v40 + 43) + 408);
      }
    }
    if ((__b[82] & 1) == 0)
    {
      int v65 = [*((id *)v111 + 41) colorMitigationTriggered];
      if (v65)
      {
        v44 = v111;
        *(void *)(*((void *)v111 + 43) + 416) = 0;
        *((void *)v44 + 11) = 0;
        uint64_t v64 = [*(id *)(*((void *)v44 + 43) + 392) stack];
        v45 = v111;
        *((void *)v111 + 11) = v64;
        *((void *)v45 + 5) = 0;
        *((void *)v45 + 6) = v130;
        v45[14] = 1.3744e11;
        *((_DWORD *)v45 + 15) = 48;
        *((void *)v45 + 8) = __Block_byref_object_copy__21;
        *((void *)v45 + 9) = __Block_byref_object_dispose__21;
        *((void *)v45 + 10) = 0;
        *((void *)v45 + 10) = 0;
        v46 = (void *)*((void *)v45 + 11);
        uint64_t v126 = MEMORY[0x1E4F143A8];
        int v127 = -1073741824;
        int v128 = 0;
        v129 = __38__CBColorPolicyFilter_handleALSEvent___block_invoke;
        *((void *)v45 + 3) = &unk_1E621A028;
        *((void *)v45 + 4) = v130;
        objc_msgSend(v46, "enumerateObjectsUsingBlock:");
        if (!*(void *)(*((void *)v111 + 6) + 40))
        {
          v47 = v111;
          *(unsigned char *)(*((void *)v111 + 43) + 424) = 1;
          v122[0] = 0;
          v122[1] = v122;
          int v123 = 0x20000000;
          int v124 = 32;
          int v125 = 0;
          v48 = (void *)*((void *)v47 + 11);
          uint64_t v115 = MEMORY[0x1E4F143A8];
          int v116 = -1073741824;
          int v117 = 0;
          v118 = __38__CBColorPolicyFilter_handleALSEvent___block_invoke_2;
          v119 = &unk_1E621AE50;
          v120 = v122;
          v121 = v130;
          objc_msgSend(v48, "enumerateObjectsUsingBlock:");
          _Block_object_dispose(v122, 8);
        }
        uint64_t v63 = [*(id *)(*((void *)v111 + 6) + 40) objectForKey:@"ALSSample"];
        v49 = v111;
        *(void *)(*((void *)v111 + 43) + 432) = v63;
        id v62 = (id)[*(id *)(*((void *)v49 + 6) + 40) objectForKey:@"Strength"];
        [v62 floatValue];
        int v61 = v50;
        *(_DWORD *)(*((void *)v111 + 43) + 428) = v50;
        _Block_object_dispose(v130, 8);
      }
      else if (*(unsigned char *)(*((void *)v111 + 43) + 424))
      {
        v42 = v111;
        ++*(void *)(*((void *)v111 + 43) + 416);
        if (*(void *)(*((void *)v42 + 43) + 416) < 0x14uLL)
        {
          [*((id *)v111 + 41) setColorMitigationTriggered:1];
          v43 = v111;
          *(unsigned char *)(*((void *)v111 + 43) + 425) = 1;
          *(void *)(*((void *)v43 + 43) + 432) = *((void *)v43 + 41);
        }
        else
        {
          v43 = v111;
          *(void *)(*((void *)v111 + 43) + 432) = *((void *)v111 + 41);
        }
        *(float *)(*((void *)v43 + 43) + 428) = v43[80];
      }
      else
      {
        v41 = v111;
        *(void *)(*((void *)v111 + 43) + 432) = *((void *)v111 + 41);
        *(float *)(*((void *)v41 + 43) + 428) = v41[80];
      }
    }
  }
  else
  {
    float v5 = v111;
    v111[80] = 0.27;
    int v109 = [*((id *)v5 + 43) sampleIsFromMitigatedRegion:*((void *)v5 + 41)];
    if (v109)
    {
      [*((id *)v111 + 41) setColorMitigationTriggered:1];
      v6 = v111;
      *(unsigned char *)(*((void *)v111 + 43) + 425) = 1;
      *(unsigned char *)(*((void *)v6 + 43) + 424) = 1;
      *(void *)(*((void *)v6 + 43) + 416) = 0;
    }
    else if ((*(unsigned char *)(*((void *)v111 + 43) + 424) & 1) != 0 {
           && (char v7 = v111,
    }
               ++*(void *)(*((void *)v111 + 43) + 416),
               *(void *)(*((void *)v7 + 43) + 416) < 0x14uLL))
    {
      [*((id *)v111 + 41) setColorMitigationTriggered:1];
      *(unsigned char *)(*((void *)v111 + 43) + 425) = 1;
    }
    else
    {
      [*((id *)v111 + 41) setColorMitigationTriggered:0];
      *(unsigned char *)(*((void *)v111 + 43) + 425) = 0;
    }
    v8 = v111;
    char v140 = 0;
    *(void *)(*((void *)v111 + 43) + 432) = *((void *)v111 + 41);
    *(float *)(*((void *)v8 + 43) + 428) = v8[80];
  }
  osos_log_t log = 0;
  if (*(void *)(*((void *)v111 + 43) + 8))
  {
    os_log_t v60 = *(os_log_t *)(*((void *)v111 + 43) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
    {
      v59 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else
    {
      uint64_t v58 = init_default_corebrightness_log();
      v59 = v58;
    }
    os_log_t v60 = v59;
  }
  osos_log_t log = v60;
  os_log_type_t v113 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
  {
    os_log_t v55 = oslog;
    *(_DWORD *)v56 = v113;
    uint64_t v51 = *(void *)(*((void *)v111 + 43) + 432);
    *(double *)&uint64_t v52 = *(float *)(*((void *)v111 + 43) + 428);
    v57 = v144;
    __os_log_helper_16_2_2_8_64_8_0((uint64_t)v144, v51, v52);
    _os_log_impl(&dword_1BA438000, v55, v56[0], "HarmonyPolicy: _filteredALS: %@, _filtered strength: %f", v57, 0x16u);
  }
  return *(id *)(*((void *)v111 + 43) + 432);
}

- (BOOL)shouldMitigateForSample:(id)a3 withLuxThr:(float *)a4 NitsThr:(float *)a5 andSize:(int)a6
{
  v20 = self;
  SEL v19 = a2;
  id v18 = a3;
  int v17 = a4;
  double v16 = a5;
  int v15 = a6;
  if (!a4 || !v16) {
    return 0;
  }
  v14 = v17;
  v13 = v16;
  int v12 = v15;
  char v11 = 0;
  [v18 illuminance];
  *(float *)&double v6 = v6;
  float v10 = *(float *)&v6;
  memset(__b, 0, sizeof(__b));
  if (v18) {
    [v18 vendorData];
  }
  else {
    memset(__b, 0, sizeof(__b));
  }
  if (v12 < 2 || v10 < *v14) {
    return 0;
  }
  if (v10 >= v14[v12 - 1]) {
    return 0;
  }
  for (int i = 0; i < v12 - 1; ++i)
  {
    if (v10 <= v14[i + 1])
    {
      if ((float)(v13[i]
                 + (float)((float)((float)(v13[i + 1] - v13[i]) / (float)(v14[i + 1] - v14[i])) * (float)(v10 - v14[i]))) < (float)*(unsigned __int16 *)&__b[6])
        char v11 = 1;
      return v11 & 1;
    }
  }
  return v11 & 1;
}

- (float)computeBaselineStrengthForLux:(float)a3 andNits:(float)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20 = self;
  SEL v19 = a2;
  float v18 = a3;
  float v17 = a4;
  char v15 = 0;
  char v14 = 0;
  char v13 = 0;
  char v12 = 0;
  for (int i = 0; i < 47; ++i)
  {
    if (i + 1 >= 47)
    {
      char v14 = i;
      char v15 = i;
    }
    else
    {
      if ((float)baselineLux[i] < v18 && (float)baselineLux[i + 1] > v18)
      {
        char v15 = i;
        char v14 = i + 1;
        break;
      }
      if (v18 <= (float)baselineLux[i])
      {
        char v14 = i;
        char v15 = i;
        break;
      }
    }
  }
  for (int j = 0; j < 161; ++j)
  {
    if (j + 1 >= 161)
    {
      char v12 = j;
      char v13 = j;
    }
    else
    {
      if ((float)baselineNits[j] < v17 && (float)baselineNits[j + 1] > v17)
      {
        char v13 = j;
        char v12 = j + 1;
        break;
      }
      if (v17 <= (float)baselineNits[j])
      {
        char v12 = j;
        char v13 = j;
        break;
      }
    }
  }
  v16[0] = v15;
  v16[1] = v14;
  v16[2] = v13;
  v16[3] = v12;
  *(float *)&double v4 = v17;
  [(CBColorPolicyFilter *)v20 biLinearInterpBetweenIndices:v16 forPoint1:COERCE_DOUBLE((unint64_t)LODWORD(v18)) andPoint2:v4];
  float v11 = (float)(uint64_t)llroundf(v5 * 100.0) / 100.0;
  if (v20->super._logHandle)
  {
    logHandle = v20->super._logHandle;
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v21, COERCE__INT64(v18), COERCE__INT64(v17), COERCE__INT64(v11));
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "HarmonyPolicy: BaselineHarmony: mitigatedStr, for (lux, nits): %f, %f = %f (rounded)", v21, 0x20u);
  }
  return v11;
}

- (float)biLinearInterpBetweenIndices:(char *)a3 forPoint1:(float)a4 andPoint2:(float)a5
{
  float v33 = a5;
  if (!self->_mitigatedStrengthLUT || !a3) {
    return -1.0;
  }
  int v31 = *a3;
  unsigned __int8 v30 = a3[1];
  unsigned __int8 v29 = a3[2];
  unsigned __int8 v28 = a3[3];
  float v27 = (float)baselineLux[v31];
  float v26 = (float)baselineLux[v30];
  float v25 = (float)baselineNits[v29];
  float v24 = (float)baselineNits[v28];
  float v23 = self->_mitigatedStrengthLUT[v28][v31];
  *(void *)&double v8 = LODWORD(self->_mitigatedStrengthLUT[v28][v30]);
  float v22 = self->_mitigatedStrengthLUT[v28][v30];
  if (__PAIR64__(v29, v30) == __PAIR64__(v28, v31)) {
    return self->_mitigatedStrengthLUT[v29][v31];
  }
  if (v31 == v30)
  {
    *(float *)&double v8 = (float)baselineNits[v29];
    *(float *)&double v9 = self->_mitigatedStrengthLUT[v29][v31];
    *(float *)&double v5 = (float)baselineNits[v28];
    *(float *)&double v6 = self->_mitigatedStrengthLUT[v28][v31];
    *(float *)&double v7 = v33;
    [(CBColorPolicyFilter *)self interpolateBetweenX1:v8 Y1:v9 X2:v5 Y2:v6 X:v7];
    return v10;
  }
  else
  {
    if (v29 == v28)
    {
      *(float *)&double v8 = (float)baselineLux[v31];
      a5 = self->_mitigatedStrengthLUT[v29][v31];
      *(float *)&double v5 = (float)baselineLux[v30];
      *(float *)&double v6 = self->_mitigatedStrengthLUT[v29][v30];
      *(float *)&double v7 = a4;
    }
    else
    {
      *(float *)&double v12 = self->_mitigatedStrengthLUT[v29][v31];
      *(float *)&double v5 = (float)baselineLux[v30];
      *(float *)&double v6 = self->_mitigatedStrengthLUT[v29][v30];
      *(float *)&double v7 = a4;
      [(CBColorPolicyFilter *)self interpolateBetweenX1:COERCE_DOUBLE((unint64_t)LODWORD(v27)) Y1:v12 X2:v5 Y2:v6 X:v7];
      float v21 = v13;
      *(float *)&double v14 = v27;
      *(float *)&double v15 = v23;
      *(float *)&double v16 = v26;
      *(float *)&double v17 = v22;
      *(float *)&double v18 = a4;
      [(CBColorPolicyFilter *)self interpolateBetweenX1:v14 Y1:v15 X2:v16 Y2:v17 X:v18];
      int v20 = LODWORD(v8);
      *(float *)&double v8 = v25;
      a5 = v21;
      *(float *)&double v5 = v24;
      LODWORD(v6) = v20;
      *(float *)&double v7 = v33;
    }
    [(CBColorPolicyFilter *)self interpolateBetweenX1:v8 Y1:*(double *)&a5 X2:v5 Y2:v6 X:v7];
    return v11;
  }
}

- (float)interpolateBetweenX1:(float)a3 Y1:(float)a4 X2:(float)a5 Y2:(float)a6 X:(float)a7
{
  return a4 + (float)((float)((float)(a6 - a4) / (float)(a5 - a3)) * (float)(a7 - a3));
}

- (CBColorPolicyFilter)initWithID:(unsigned int)a3
{
  double v9 = self;
  SEL v8 = a2;
  unsigned int v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CBColorPolicyFilter;
  double v9 = [(CBFilter *)&v6 init];
  if (v9)
  {
    os_log_t v3 = os_log_create("com.apple.CoreBrightness.CBColorPolicyFilter", "default");
    v9->super._logHandle = (OS_os_log *)v3;
    [(CBColorPolicyFilter *)v9 initializeMitigationsForDevice:v7];
    double v4 = -[CBStack initWithLength:]([CBStack alloc], "initWithLength:");
    v9->_alsStack = v4;
    v9->_stackLength = 20;
    v9->_stackCurrentCount = 0;
    v9->_consecutiveNonMitgatedCount = 0;
    v9->_mitigationUsedYet = 0;
    v9->_ceConfidenceThreshold = 0.1;
    v9->_ceEnabled = 1;
  }
  return v9;
}

- (void)dealloc
{
  double v4 = self;
  SEL v3 = a2;
  if (self->super._logHandle)
  {

    v4->super._logHandle = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBColorPolicyFilter;
  [(CBFilter *)&v2 dealloc];
}

- (void)setModuleObject:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->_ceModule = (CBCEModule *)a3;
    SEL v3 = self->_ceModule;
  }
}

- (void)resetFilter
{
  self->_stackCurrentCount = 0;
  self->_consecutiveNonMitgatedCount = 0;
  self->_mitigationUsedYet = 0;
}

- (void)initializeMitigationsForDevice:(unsigned int)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memcpy(__dst, &unk_1BA61B1F8, sizeof(__dst));
  memcpy(v7, &unk_1BA61B224, sizeof(v7));
  self->_isColorMitigationTriggered = 0;
  self->_filteredStrength = 0.27;
  self->_mitigatedStrengthLUT = (float (*)[47])&baselineStrengthLUT;
  self->_mitigationThrSize = 11;
  __memcpy_chk();
  __memcpy_chk();
  if (a3 == 1 || a3 == 3)
  {
    memcpy(v6, &unk_1BA61B250, sizeof(v6));
    memcpy(v5, &unk_1BA61B27C, sizeof(v5));
    self->_ceMitigationThrSize = 11;
    __memcpy_chk();
    __memcpy_chk();
  }
  else if (a3 == 2 || a3 == 4)
  {
    self->_ceMitigationThrSize = 5;
    __memcpy_chk();
    __memcpy_chk();
  }
}

- (BOOL)isColorMitigationTriggered
{
  return self->_isColorMitigationTriggered;
}

- (void)setIsColorMitigationTriggered:(BOOL)a3
{
  self->_isColorMitigationTriggered = a3;
}

- (void)setFilteredStrength:(float)a3
{
  self->_filteredStrength = a3;
}

- (CBHIDEvent)filteredALS
{
  return self->_filteredALS;
}

@end