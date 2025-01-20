@interface ENExposureConfiguration
- (ENDiagnosisReportType)reportTypeNoneMap;
- (ENExposureConfiguration)init;
- (ENExposureConfiguration)initWithDictionary:(id)a3 error:(id *)a4;
- (ENExposureConfiguration)initWithXPCObject:(id)a3 error:(id *)a4;
- (ENRiskScore)minimumRiskScore;
- (NSArray)attenuationDurationThresholds;
- (NSArray)attenuationLevelValues;
- (NSArray)daysSinceLastExposureLevelValues;
- (NSArray)durationLevelValues;
- (NSArray)transmissionRiskLevelValues;
- (NSDictionary)infectiousnessForDaysSinceOnsetOfSymptoms;
- (NSDictionary)metadata;
- (NSInteger)daysSinceLastExposureThreshold;
- (double)attenuationLevelValueWithAttenuation:(unsigned __int8)a3;
- (double)attenuationWeight;
- (double)daysSinceLastExposureLevelValueWithDays:(int64_t)a3;
- (double)daysSinceLastExposureWeight;
- (double)durationLevelValueWithDuration:(double)a3;
- (double)durationWeight;
- (double)immediateDurationWeight;
- (double)infectiousnessHighWeight;
- (double)infectiousnessStandardWeight;
- (double)infectiousnessWeightWithDaysSinceOnsetOfSymptoms:(int64_t)a3 skip:(BOOL *)a4;
- (double)mediumDurationWeight;
- (double)minimumRiskScoreFullRange;
- (double)nearDurationWeight;
- (double)otherDurationWeight;
- (double)reportTypeConfirmedClinicalDiagnosisWeight;
- (double)reportTypeConfirmedTestWeight;
- (double)reportTypeRecursiveWeight;
- (double)reportTypeSelfReportedWeight;
- (double)reportTypeWeightWithReportType:(unsigned int)a3 skip:(BOOL *)a4;
- (double)transmissionLevelValueWithTransmissionRiskLevel:(unsigned __int8)a3;
- (double)transmissionRiskWeight;
- (double)weightedDurationWithExposureInfo:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unsigned)flags;
- (unsigned)infectiousnessWithDaysSinceOnsetOfSymptoms:(int64_t)a3;
- (unsigned)mappedDiagnosisReportType:(unsigned int)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setAttenuationDurationThresholds:(NSArray *)attenuationDurationThresholds;
- (void)setAttenuationLevelValues:(NSArray *)attenuationLevelValues;
- (void)setAttenuationWeight:(double)attenuationWeight;
- (void)setDaysSinceLastExposureLevelValues:(NSArray *)daysSinceLastExposureLevelValues;
- (void)setDaysSinceLastExposureThreshold:(NSInteger)daysSinceLastExposureThreshold;
- (void)setDaysSinceLastExposureWeight:(double)daysSinceLastExposureWeight;
- (void)setDurationLevelValues:(NSArray *)durationLevelValues;
- (void)setDurationWeight:(double)durationWeight;
- (void)setFlags:(unsigned int)a3;
- (void)setImmediateDurationWeight:(double)immediateDurationWeight;
- (void)setInfectiousnessForDaysSinceOnsetOfSymptoms:(NSDictionary *)infectiousnessForDaysSinceOnsetOfSymptoms;
- (void)setInfectiousnessHighWeight:(double)infectiousnessHighWeight;
- (void)setInfectiousnessStandardWeight:(double)infectiousnessStandardWeight;
- (void)setMediumDurationWeight:(double)mediumDurationWeight;
- (void)setMetadata:(NSDictionary *)metadata;
- (void)setMinimumRiskScore:(ENRiskScore)minimumRiskScore;
- (void)setMinimumRiskScoreFullRange:(double)minimumRiskScoreFullRange;
- (void)setNearDurationWeight:(double)nearDurationWeight;
- (void)setOtherDurationWeight:(double)otherDurationWeight;
- (void)setReportTypeConfirmedClinicalDiagnosisWeight:(double)reportTypeConfirmedClinicalDiagnosisWeight;
- (void)setReportTypeConfirmedTestWeight:(double)reportTypeConfirmedTestWeight;
- (void)setReportTypeNoneMap:(ENDiagnosisReportType)reportTypeNoneMap;
- (void)setReportTypeRecursiveWeight:(double)reportTypeRecursiveWeight;
- (void)setReportTypeSelfReportedWeight:(double)reportTypeSelfReportedWeight;
- (void)setTransmissionRiskLevelValues:(NSArray *)transmissionRiskLevelValues;
- (void)setTransmissionRiskWeight:(double)transmissionRiskWeight;
@end

@implementation ENExposureConfiguration

- (ENExposureConfiguration)init
{
  v13.receiver = self;
  v13.super_class = (Class)ENExposureConfiguration;
  v2 = [(ENExposureConfiguration *)&v13 init];
  v3 = v2;
  if (v2)
  {
    int64x2_t v4 = vdupq_n_s64(0x807060504030201uLL);
    *(int64x2_t *)(v2 + 8) = v4;
    *(int64x2_t *)(v2 + 24) = v4;
    v5 = (void *)*((void *)v2 + 18);
    *((void *)v2 + 18) = &unk_26C60D3A8;

    v6 = (void *)*((void *)v3 + 21);
    *((void *)v3 + 21) = &unk_26C60D3C0;

    v7 = (void *)*((void *)v3 + 23);
    *((void *)v3 + 22) = 0x3FF0000000000000;
    *((void *)v3 + 23) = &unk_26C60D3D8;

    v8 = (void *)*((void *)v3 + 25);
    *((void *)v3 + 24) = 0x3FF0000000000000;
    *((void *)v3 + 25) = &unk_26C60D3F0;

    int64x2_t v9 = vdupq_n_s64(0x4059000000000000uLL);
    *((void *)v3 + 26) = 0x3FF0000000000000;
    *(int64x2_t *)(v3 + 56) = v9;
    *(int64x2_t *)(v3 + 72) = v9;
    *((int64x2_t *)v3 + 7) = v9;
    *((int64x2_t *)v3 + 8) = v9;
    *((int64x2_t *)v3 + 6) = v9;
    *((_DWORD *)v3 + 11) = 1;
    v10 = (void *)*((void *)v3 + 28);
    *((void *)v3 + 28) = &unk_26C60D408;

    *((void *)v3 + 29) = 0x3FF0000000000000;
    v11 = v3;
  }

  return (ENExposureConfiguration *)v3;
}

- (ENExposureConfiguration)initWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(ENExposureConfiguration *)self init];
  if (!v6)
  {
    if (a4) {
      goto LABEL_148;
    }
    goto LABEL_149;
  }
  v6->_flags = CFDictionaryGetInt64Ranged();
  CFDictionaryGetDouble();
  v6->_immediateDurationWeight = v7;
  if (v7 < 0.0 || v7 > 250.0)
  {
    if (a4) {
      goto LABEL_148;
    }
    goto LABEL_149;
  }
  CFDictionaryGetDouble();
  v6->_nearDurationWeight = v8;
  if (v8 < 0.0 || v8 > 250.0)
  {
    if (a4) {
      goto LABEL_148;
    }
    goto LABEL_149;
  }
  CFDictionaryGetDouble();
  v6->_mediumDurationWeight = v9;
  if (v9 < 0.0 || v9 > 250.0)
  {
    if (a4) {
      goto LABEL_148;
    }
    goto LABEL_149;
  }
  CFDictionaryGetDouble();
  v6->_otherDurationWeight = v10;
  if (v10 < 0.0 || v10 > 250.0)
  {
    if (a4)
    {
LABEL_148:
      ENErrorF(2);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_108;
    }
LABEL_149:
    v12 = 0;
    goto LABEL_108;
  }
  CFDictionaryGetTypeID();
  CFDictionaryGetTypedValue();
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  if (obj)
  {
    uint64_t v87 = 0;
    v88 = &v87;
    uint64_t v89 = 0x3032000000;
    v90 = __Block_byref_object_copy_;
    v91 = __Block_byref_object_dispose_;
    id v92 = 0;
    v86[0] = MEMORY[0x263EF8330];
    v86[1] = 3221225472;
    v86[2] = __52__ENExposureConfiguration_initWithDictionary_error___block_invoke;
    v86[3] = &unk_2642447C8;
    v86[4] = &v87;
    [obj enumerateKeysAndObjectsUsingBlock:v86];
    v11 = (void *)v88[5];
    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
    }
    else
    {
      objc_storeStrong((id *)&v6->_infectiousnessForDaysSinceOnsetOfSymptoms, obj);
    }
    _Block_object_dispose(&v87, 8);

    if (v11) {
      goto LABEL_14;
    }
  }
  CFDictionaryGetDouble();
  v6->_infectiousnessStandardWeight = v13;
  if (v13 < 0.0 || v13 > 250.0)
  {
    if (a4) {
      goto LABEL_165;
    }
    goto LABEL_14;
  }
  CFDictionaryGetDouble();
  v6->_infectiousnessHighWeight = v14;
  if (v14 < 0.0 || v14 > 250.0)
  {
    if (a4) {
      goto LABEL_165;
    }
    goto LABEL_14;
  }
  CFDictionaryGetDouble();
  v6->_reportTypeConfirmedTestWeight = v15;
  if (v15 < 0.0 || v15 > 250.0)
  {
    if (a4) {
      goto LABEL_165;
    }
    goto LABEL_14;
  }
  CFDictionaryGetDouble();
  v6->_reportTypeConfirmedClinicalDiagnosisWeight = v16;
  if (v16 < 0.0 || v16 > 250.0)
  {
    if (a4) {
      goto LABEL_165;
    }
    goto LABEL_14;
  }
  CFDictionaryGetDouble();
  v6->_reportTypeSelfReportedWeight = v17;
  if (v17 < 0.0 || v17 > 250.0)
  {
    if (a4) {
      goto LABEL_165;
    }
    goto LABEL_14;
  }
  CFDictionaryGetDouble();
  v6->_reportTypeRecursiveWeight = v18;
  if (v18 < 0.0 || v18 > 250.0)
  {
    if (a4) {
      goto LABEL_165;
    }
    goto LABEL_14;
  }
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
  v6->_reportTypeNoneMap = Int64Ranged;
  if (Int64Ranged >= 5)
  {
    if (a4)
    {
LABEL_165:
      ENErrorF(2);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_107;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_107;
  }
  CFArrayGetTypeID();
  CFDictionaryGetTypedValue();
  id v64 = (id)objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    if (([v64 count] & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v20 = v64;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v82 objects:v97 count:16];
      if (!v21) {
        goto LABEL_39;
      }
      uint64_t v22 = *(void *)v83;
      while (1)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v83 != v22) {
            objc_enumerationMutation(v20);
          }
          v24 = *(void **)(*((void *)&v82 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
LABEL_112:
              ENErrorF(2);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
LABEL_113:

LABEL_114:
            v12 = 0;
            goto LABEL_106;
          }
          if ((unint64_t)[v24 longLongValue] >= 0x100)
          {
            if (a4) {
              goto LABEL_112;
            }
            goto LABEL_113;
          }
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v82 objects:v97 count:16];
        if (!v21)
        {
LABEL_39:

          objc_storeStrong((id *)&v6->_attenuationDurationThresholds, v64);
          goto LABEL_40;
        }
      }
    }
    if (!a4) {
      goto LABEL_114;
    }
    [v64 count];
    ENErrorF(2);
    id v56 = (id)objc_claimAutoreleasedReturnValue();
LABEL_172:
    v12 = 0;
    *a4 = v56;
    goto LABEL_106;
  }
LABEL_40:
  v6->_daysSinceLastExposureThreshold = (int)CFDictionaryGetInt64Ranged();
  CFDictionaryGetDouble();
  v6->_minimumRiskScoreFullRange = v25;
  if (v25 < 0.0 || v25 > 4096.0)
  {
    if (!a4) {
      goto LABEL_114;
    }
    ENErrorF(2);
    id v56 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_172;
  }
  CFArrayGetTypeID();
  CFDictionaryGetTypedValue();
  id v63 = (id)objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    if ([v63 count] == 8)
    {
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v26 = v63;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v78 objects:v96 count:16];
      if (!v27) {
        goto LABEL_53;
      }
      uint64_t v28 = *(void *)v79;
      while (1)
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v79 != v28) {
            objc_enumerationMutation(v26);
          }
          v30 = *(void **)(*((void *)&v78 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
LABEL_118:
              ENErrorF(2);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
LABEL_119:

LABEL_120:
            v12 = 0;
            goto LABEL_105;
          }
          if ((unint64_t)[v30 longLongValue] >= 9)
          {
            if (a4) {
              goto LABEL_118;
            }
            goto LABEL_119;
          }
        }
        uint64_t v27 = [v26 countByEnumeratingWithState:&v78 objects:v96 count:16];
        if (!v27)
        {
LABEL_53:

          objc_storeStrong((id *)&v6->_attenuationLevelValues, v63);
          goto LABEL_54;
        }
      }
    }
    if (!a4) {
      goto LABEL_120;
    }
    [v63 count];
    ENErrorF(2);
    id v57 = (id)objc_claimAutoreleasedReturnValue();
LABEL_177:
    v12 = 0;
    *a4 = v57;
    goto LABEL_105;
  }
LABEL_54:
  double attenuationWeight = v6->_attenuationWeight;
  if (attenuationWeight < 0.0 || attenuationWeight > 100.0)
  {
    if (!a4) {
      goto LABEL_120;
    }
    ENErrorF(2);
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_177;
  }
  CFArrayGetTypeID();
  CFDictionaryGetTypedValue();
  id v62 = (id)objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    if ([v62 count] == 8)
    {
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v32 = v62;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v74 objects:v95 count:16];
      if (!v33) {
        goto LABEL_67;
      }
      uint64_t v34 = *(void *)v75;
      while (1)
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v75 != v34) {
            objc_enumerationMutation(v32);
          }
          v36 = *(void **)(*((void *)&v74 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
LABEL_124:
              ENErrorF(2);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
LABEL_125:

LABEL_126:
            v12 = 0;
            goto LABEL_104;
          }
          if ((unint64_t)[v36 longLongValue] >= 9)
          {
            if (a4) {
              goto LABEL_124;
            }
            goto LABEL_125;
          }
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v74 objects:v95 count:16];
        if (!v33)
        {
LABEL_67:

          objc_storeStrong((id *)&v6->_daysSinceLastExposureLevelValues, v62);
          goto LABEL_68;
        }
      }
    }
    if (!a4) {
      goto LABEL_126;
    }
    [v62 count];
    ENErrorF(2);
    id v58 = (id)objc_claimAutoreleasedReturnValue();
LABEL_182:
    v12 = 0;
    *a4 = v58;
    goto LABEL_104;
  }
LABEL_68:
  double daysSinceLastExposureWeight = v6->_daysSinceLastExposureWeight;
  if (daysSinceLastExposureWeight < 0.0 || daysSinceLastExposureWeight > 100.0)
  {
    if (!a4) {
      goto LABEL_126;
    }
    ENErrorF(2);
    id v58 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_182;
  }
  CFArrayGetTypeID();
  v38 = CFDictionaryGetTypedValue();
  v39 = v38;
  if (!v38) {
    goto LABEL_82;
  }
  if ([v38 count] != 8)
  {
    if (a4)
    {
      [v39 count];
      ENErrorF(2);
      id v60 = (id)objc_claimAutoreleasedReturnValue();
LABEL_192:
      v12 = 0;
      *a4 = v60;
      goto LABEL_103;
    }
    goto LABEL_132;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v40 = v39;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v70 objects:v94 count:16];
  if (!v41) {
    goto LABEL_81;
  }
  uint64_t v42 = *(void *)v71;
  while (2)
  {
    for (uint64_t m = 0; m != v41; ++m)
    {
      if (*(void *)v71 != v42) {
        objc_enumerationMutation(v40);
      }
      v44 = *(void **)(*((void *)&v70 + 1) + 8 * m);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4) {
          goto LABEL_130;
        }
        goto LABEL_131;
      }
      if ((unint64_t)[v44 longLongValue] >= 9)
      {
        if (a4)
        {
LABEL_130:
          ENErrorF(2);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_131:

        goto LABEL_132;
      }
    }
    uint64_t v41 = [v40 countByEnumeratingWithState:&v70 objects:v94 count:16];
    if (v41) {
      continue;
    }
    break;
  }
LABEL_81:

  objc_storeStrong((id *)&v6->_durationLevelValues, v39);
LABEL_82:
  double durationWeight = v6->_durationWeight;
  if (durationWeight < 0.0 || durationWeight > 100.0)
  {
    if (a4) {
      goto LABEL_191;
    }
    goto LABEL_132;
  }
  LODWORD(v87) = 0;
  unint64_t Int64 = CFDictionaryGetInt64();
  if (v87) {
    goto LABEL_87;
  }
  if (Int64 >= 0x100)
  {
    if (a4)
    {
LABEL_191:
      ENErrorF(2);
      id v60 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_192;
    }
LABEL_132:
    v12 = 0;
    goto LABEL_103;
  }
  v6->_minimumRiskScore = Int64;
LABEL_87:
  CFArrayGetTypeID();
  v47 = CFDictionaryGetTypedValue();
  v48 = v47;
  if (!v47) {
    goto LABEL_99;
  }
  if ([v47 count] == 8)
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v49 = v48;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v66 objects:v93 count:16];
    if (!v50) {
      goto LABEL_98;
    }
    uint64_t v51 = *(void *)v67;
LABEL_91:
    uint64_t v52 = 0;
    while (1)
    {
      if (*(void *)v67 != v51) {
        objc_enumerationMutation(v49);
      }
      v53 = *(void **)(*((void *)&v66 + 1) + 8 * v52);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      if ((unint64_t)[v53 longLongValue] >= 9)
      {
        if (a4) {
          goto LABEL_136;
        }
        goto LABEL_137;
      }
      if (v50 == ++v52)
      {
        uint64_t v50 = [v49 countByEnumeratingWithState:&v66 objects:v93 count:16];
        if (v50) {
          goto LABEL_91;
        }
LABEL_98:

        objc_storeStrong((id *)&v6->_transmissionRiskLevelValues, v48);
LABEL_99:
        double transmissionRiskWeight = v6->_transmissionRiskWeight;
        if (transmissionRiskWeight >= 0.0 && transmissionRiskWeight <= 100.0)
        {
          v12 = v6;
          goto LABEL_102;
        }
        if (a4)
        {
          ENErrorF(2);
          id v59 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_189;
        }
LABEL_138:
        v12 = 0;
        goto LABEL_102;
      }
    }
    if (a4)
    {
LABEL_136:
      ENErrorF(2);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_137:

    goto LABEL_138;
  }
  if (!a4) {
    goto LABEL_138;
  }
  [v48 count];
  ENErrorF(2);
  id v59 = (id)objc_claimAutoreleasedReturnValue();
LABEL_189:
  v12 = 0;
  *a4 = v59;
LABEL_102:

LABEL_103:
LABEL_104:

LABEL_105:
LABEL_106:

LABEL_107:
LABEL_108:

  return v12;
}

void __52__ENExposureConfiguration_initWithDictionary_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a3;
  id v7 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v12 unsignedIntValue] >= 3)
  {
    uint64_t v9 = ENErrorF(2);
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64x2_t v4 = [ENExposureConfiguration alloc];
  id v5 = [(ENExposureConfiguration *)self dictionaryRepresentation];
  uint64_t v10 = 0;
  v6 = [(ENExposureConfiguration *)v4 initWithDictionary:v5 error:&v10];
  uint64_t v7 = v10;

  double v8 = 0;
  if (!v7) {
    double v8 = v6;
  }

  return v8;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int64x2_t v4 = [NSNumber numberWithUnsignedInt:self->_flags];
  [v3 setObject:v4 forKeyedSubscript:@"exposureFlags"];

  id v5 = [NSNumber numberWithDouble:self->_immediateDurationWeight];
  [v3 setObject:v5 forKeyedSubscript:@"immediateDurationWeight"];

  v6 = [NSNumber numberWithDouble:self->_nearDurationWeight];
  [v3 setObject:v6 forKeyedSubscript:@"nearDurationWeight"];

  uint64_t v7 = [NSNumber numberWithDouble:self->_mediumDurationWeight];
  [v3 setObject:v7 forKeyedSubscript:@"mediumDurationWeight"];

  double v8 = [NSNumber numberWithDouble:self->_otherDurationWeight];
  [v3 setObject:v8 forKeyedSubscript:@"otherDurationWeight"];

  [v3 setObject:self->_infectiousnessForDaysSinceOnsetOfSymptoms forKeyedSubscript:@"infectiousnessForDaysSinceOnsetOfSymptoms"];
  uint64_t v9 = [NSNumber numberWithDouble:self->_infectiousnessStandardWeight];
  [v3 setObject:v9 forKeyedSubscript:@"infectiousnessStandardWeight"];

  uint64_t v10 = [NSNumber numberWithDouble:self->_infectiousnessHighWeight];
  [v3 setObject:v10 forKeyedSubscript:@"infectiousnessHighWeight"];

  v11 = [NSNumber numberWithDouble:self->_reportTypeConfirmedTestWeight];
  [v3 setObject:v11 forKeyedSubscript:@"reportTypeConfirmedTestWeight"];

  id v12 = [NSNumber numberWithDouble:self->_reportTypeConfirmedClinicalDiagnosisWeight];
  [v3 setObject:v12 forKeyedSubscript:@"reportTypeConfirmedClinicalDiagnosisWeight"];

  double v13 = [NSNumber numberWithDouble:self->_reportTypeSelfReportedWeight];
  [v3 setObject:v13 forKeyedSubscript:@"reportTypeSelfReportedWeight"];

  double v14 = [NSNumber numberWithDouble:self->_reportTypeRecursiveWeight];
  [v3 setObject:v14 forKeyedSubscript:@"reportTypeRecursiveWeight"];

  double v15 = [NSNumber numberWithUnsignedInt:self->_reportTypeNoneMap];
  [v3 setObject:v15 forKeyedSubscript:@"reportTypeNoneMap"];

  [v3 setObject:self->_attenuationDurationThresholds forKeyedSubscript:@"attenuationDurationThresholds"];
  double v16 = [NSNumber numberWithInteger:self->_daysSinceLastExposureThreshold];
  [v3 setObject:v16 forKeyedSubscript:@"daysSinceLastExposureThreshold"];

  double v17 = [NSNumber numberWithUnsignedChar:self->_minimumRiskScore];
  [v3 setObject:v17 forKeyedSubscript:@"minimumRiskScore"];

  double v18 = [NSNumber numberWithDouble:self->_minimumRiskScoreFullRange];
  [v3 setObject:v18 forKeyedSubscript:@"minimumRiskScoreFullRange"];

  [v3 setObject:self->_attenuationLevelValues forKeyedSubscript:@"attenuationLevelValues"];
  v19 = [NSNumber numberWithDouble:self->_attenuationWeight];
  [v3 setObject:v19 forKeyedSubscript:@"attenuationWeight"];

  [v3 setObject:self->_daysSinceLastExposureLevelValues forKeyedSubscript:@"daysSinceLastExposureLevelValues"];
  id v20 = [NSNumber numberWithDouble:self->_daysSinceLastExposureWeight];
  [v3 setObject:v20 forKeyedSubscript:@"daysSinceLastExposureWeight"];

  [v3 setObject:self->_durationLevelValues forKeyedSubscript:@"durationLevelValues"];
  uint64_t v21 = [NSNumber numberWithDouble:self->_durationWeight];
  [v3 setObject:v21 forKeyedSubscript:@"durationWeight"];

  [v3 setObject:self->_transmissionRiskLevelValues forKeyedSubscript:@"transmissionRiskLevelValues"];
  uint64_t v22 = [NSNumber numberWithDouble:self->_transmissionRiskWeight];
  [v3 setObject:v22 forKeyedSubscript:@"transmissionRiskWeight"];

  v23 = (void *)[v3 copy];

  return v23;
}

- (ENExposureConfiguration)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(ENExposureConfiguration *)self init];
  if (!v7)
  {
    if (a4) {
      goto LABEL_107;
    }
    goto LABEL_108;
  }
  if (MEMORY[0x2166BCD00](v6) != MEMORY[0x263EF8708])
  {
    if (a4) {
      goto LABEL_107;
    }
    goto LABEL_108;
  }
  int64_t v49 = 0;
  int v8 = CUXPCDecodeUInt64RangedEx();
  if (v8 == 6)
  {
    v7->_flags = v49;
  }
  else if (v8 == 5)
  {
    goto LABEL_108;
  }
  if (!CUXPCDecodeNSArrayOfInteger()) {
    goto LABEL_108;
  }
  if (([(NSArray *)v7->_attenuationDurationThresholds count] & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    if (a4) {
      goto LABEL_107;
    }
    goto LABEL_108;
  }
  p_immediateDurationWeight = &v7->_immediateDurationWeight;
  if (!CUXPCDecodeDouble()) {
    goto LABEL_108;
  }
  if (*p_immediateDurationWeight < 0.0 || *p_immediateDurationWeight > 250.0)
  {
    if (a4) {
      goto LABEL_107;
    }
    goto LABEL_108;
  }
  p_nearDurationWeight = &v7->_nearDurationWeight;
  if (!CUXPCDecodeDouble()) {
    goto LABEL_108;
  }
  if (*p_nearDurationWeight < 0.0 || *p_nearDurationWeight > 250.0)
  {
    if (a4) {
      goto LABEL_107;
    }
    goto LABEL_108;
  }
  p_mediumDurationWeight = &v7->_mediumDurationWeight;
  if (!CUXPCDecodeDouble()) {
    goto LABEL_108;
  }
  if (*p_mediumDurationWeight < 0.0 || *p_mediumDurationWeight > 250.0)
  {
    if (a4) {
      goto LABEL_107;
    }
    goto LABEL_108;
  }
  p_otherDurationWeight = &v7->_otherDurationWeight;
  if (!CUXPCDecodeDouble()) {
    goto LABEL_108;
  }
  if (*p_otherDurationWeight < 0.0 || *p_otherDurationWeight > 250.0)
  {
    if (a4)
    {
LABEL_107:
      ENErrorF(2);
      double v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_93;
    }
LABEL_108:
    double v16 = 0;
    goto LABEL_93;
  }
  double v13 = xpc_dictionary_get_dictionary(v6, "infectLV");
  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    int64_t v49 = 0;
    uint64_t v50 = &v49;
    uint64_t v51 = 0x3032000000;
    uint64_t v52 = __Block_byref_object_copy_;
    v53 = __Block_byref_object_dispose_;
    id v54 = 0;
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __51__ENExposureConfiguration_initWithXPCObject_error___block_invoke;
    applier[3] = &unk_2642447F0;
    applier[4] = v14;
    applier[5] = &v49;
    xpc_dictionary_apply(v13, applier);
    double v15 = (void *)v50[5];
    if (v15)
    {
      if (a4) {
        *a4 = v15;
      }
    }
    else
    {
      objc_storeStrong((id *)&v7->_infectiousnessForDaysSinceOnsetOfSymptoms, v14);
    }
    _Block_object_dispose(&v49, 8);

    if (v15) {
      goto LABEL_24;
    }
  }
  p_infectiousnessStandardWeight = &v7->_infectiousnessStandardWeight;
  if (!CUXPCDecodeDouble()) {
    goto LABEL_24;
  }
  if (*p_infectiousnessStandardWeight < 0.0 || *p_infectiousnessStandardWeight > 250.0)
  {
    if (a4) {
      goto LABEL_140;
    }
    goto LABEL_24;
  }
  p_infectiousnessHighWeight = &v7->_infectiousnessHighWeight;
  if (!CUXPCDecodeDouble()) {
    goto LABEL_24;
  }
  if (*p_infectiousnessHighWeight < 0.0 || *p_infectiousnessHighWeight > 250.0)
  {
    if (a4) {
      goto LABEL_140;
    }
    goto LABEL_24;
  }
  p_reportTypeConfirmedTestWeight = &v7->_reportTypeConfirmedTestWeight;
  if (!CUXPCDecodeDouble()) {
    goto LABEL_24;
  }
  if (*p_reportTypeConfirmedTestWeight < 0.0 || *p_reportTypeConfirmedTestWeight > 250.0)
  {
    if (a4) {
      goto LABEL_140;
    }
    goto LABEL_24;
  }
  p_reportTypeConfirmedClinicalDiagnosisWeight = &v7->_reportTypeConfirmedClinicalDiagnosisWeight;
  if (!CUXPCDecodeDouble()) {
    goto LABEL_24;
  }
  if (*p_reportTypeConfirmedClinicalDiagnosisWeight < 0.0 || *p_reportTypeConfirmedClinicalDiagnosisWeight > 250.0)
  {
    if (a4) {
      goto LABEL_140;
    }
    goto LABEL_24;
  }
  p_reportTypeSelfReportedWeight = &v7->_reportTypeSelfReportedWeight;
  if (!CUXPCDecodeDouble()) {
    goto LABEL_24;
  }
  if (*p_reportTypeSelfReportedWeight < 0.0 || *p_reportTypeSelfReportedWeight > 250.0)
  {
    if (a4) {
      goto LABEL_140;
    }
    goto LABEL_24;
  }
  p_reportTypeRecursiveWeight = &v7->_reportTypeRecursiveWeight;
  if (!CUXPCDecodeDouble()) {
    goto LABEL_24;
  }
  if (*p_reportTypeRecursiveWeight < 0.0 || *p_reportTypeRecursiveWeight > 250.0)
  {
    if (a4) {
      goto LABEL_140;
    }
    goto LABEL_24;
  }
  int64_t v49 = 0;
  int v23 = CUXPCDecodeUInt64RangedEx();
  if (v23 == 6)
  {
    unsigned int reportTypeNoneMap = v49;
    v7->_unsigned int reportTypeNoneMap = v49;
  }
  else
  {
    if (v23 == 5) {
      goto LABEL_24;
    }
    unsigned int reportTypeNoneMap = v7->_reportTypeNoneMap;
  }
  if (reportTypeNoneMap >= 5)
  {
    if (a4) {
      goto LABEL_140;
    }
    goto LABEL_24;
  }
  int64_t v49 = 0;
  int v25 = CUXPCDecodeUInt64RangedEx();
  if (v25 == 6)
  {
    v7->_minimumRiskScore = v49;
  }
  else if (v25 == 5)
  {
    goto LABEL_24;
  }
  if (!CUXPCDecodeDouble()) {
    goto LABEL_24;
  }
  int64_t v49 = 0;
  int v26 = CUXPCDecodeSInt64RangedEx();
  if (v26 == 6)
  {
    v7->_daysSinceLastExposureThreshold = v49;
  }
  else if (v26 == 5)
  {
    goto LABEL_24;
  }
  p_attenuationLevelValues = (id *)&v7->_attenuationLevelValues;
  if (!CUXPCDecodeNSArrayOfInteger()) {
    goto LABEL_24;
  }
  if (*p_attenuationLevelValues)
  {
    if ([*p_attenuationLevelValues count] != 8)
    {
      if (a4) {
        goto LABEL_140;
      }
      goto LABEL_24;
    }
    for (uint64_t i = 0; i != 8; ++i)
    {
      v29 = [*p_attenuationLevelValues objectAtIndexedSubscript:i];
      v7->_attenuationLevelValuesMap[i] = [v29 unsignedIntValue];
    }
  }
  double attenuationWeight = v7->_attenuationWeight;
  if (attenuationWeight < 0.0 || attenuationWeight > 100.0)
  {
    if (a4) {
      goto LABEL_140;
    }
    goto LABEL_24;
  }
  p_durationLevelValues = (id *)&v7->_durationLevelValues;
  if (!CUXPCDecodeNSArrayOfInteger()) {
    goto LABEL_24;
  }
  if (*p_durationLevelValues)
  {
    if ([*p_durationLevelValues count] != 8)
    {
      if (a4) {
        goto LABEL_140;
      }
      goto LABEL_24;
    }
    for (uint64_t j = 0; j != 8; ++j)
    {
      uint64_t v34 = [*p_durationLevelValues objectAtIndexedSubscript:j];
      v7->_durationLevelValuesMap[j] = [v34 unsignedIntValue];
    }
  }
  p_daysSinceLastExposureLevelValues = (id *)&v7->_daysSinceLastExposureLevelValues;
  if (!CUXPCDecodeNSArrayOfInteger()) {
    goto LABEL_24;
  }
  if (*p_daysSinceLastExposureLevelValues)
  {
    if ([*p_daysSinceLastExposureLevelValues count] != 8)
    {
      if (a4) {
        goto LABEL_140;
      }
      goto LABEL_24;
    }
    for (uint64_t k = 0; k != 8; ++k)
    {
      v37 = [*p_daysSinceLastExposureLevelValues objectAtIndexedSubscript:k];
      v7->_daysSinceLastExposureLevelValuesMap[k] = [v37 unsignedIntValue];
    }
  }
  double daysSinceLastExposureWeight = v7->_daysSinceLastExposureWeight;
  if (daysSinceLastExposureWeight < 0.0 || daysSinceLastExposureWeight > 100.0)
  {
    if (a4) {
      goto LABEL_140;
    }
    goto LABEL_24;
  }
  double durationWeight = v7->_durationWeight;
  if (durationWeight < 0.0 || durationWeight > 100.0)
  {
    if (a4) {
      goto LABEL_140;
    }
    goto LABEL_24;
  }
  p_transmissionRiskLevelValues = (id *)&v7->_transmissionRiskLevelValues;
  if (!CUXPCDecodeNSArrayOfInteger()) {
    goto LABEL_24;
  }
  if (*p_transmissionRiskLevelValues)
  {
    if ([*p_transmissionRiskLevelValues count] != 8)
    {
      if (a4) {
        goto LABEL_140;
      }
      goto LABEL_24;
    }
    for (uint64_t m = 0; m != 8; ++m)
    {
      v44 = [*p_transmissionRiskLevelValues objectAtIndexedSubscript:m];
      v7->_transmissionRiskLevelValuesMap[m] = [v44 unsignedIntValue];
    }
  }
  double transmissionRiskWeight = v7->_transmissionRiskWeight;
  if (transmissionRiskWeight >= 0.0 && transmissionRiskWeight <= 100.0)
  {
    double v16 = v7;
    goto LABEL_92;
  }
  if (a4)
  {
LABEL_140:
    ENErrorF(2);
    double v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_92;
  }
LABEL_24:
  double v16 = 0;
LABEL_92:

LABEL_93:
  return v16;
}

uint64_t __51__ENExposureConfiguration_initWithXPCObject_error___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = atoll(a2);
  if (MEMORY[0x2166BCD00](v5) == MEMORY[0x263EF8738] && (unint64_t value = xpc_int64_get_value(v5), value < 3))
  {
    int v8 = [NSNumber numberWithLongLong:value];
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = [NSNumber numberWithLongLong:v6];
    [v9 setObject:v8 forKeyedSubscript:v10];

    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v12 = ENErrorF(2);
    uint64_t v11 = 0;
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    int v8 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }

  return v11;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t flags = self->_flags;
  if (flags) {
    xpc_dictionary_set_uint64(v4, "expF", flags);
  }
  xpc_dictionary_set_double(v5, "immediateDurW", self->_immediateDurationWeight);
  xpc_dictionary_set_double(v5, "nearDurW", self->_nearDurationWeight);
  xpc_dictionary_set_double(v5, "medDurW", self->_mediumDurationWeight);
  xpc_dictionary_set_double(v5, "otherDurW", self->_otherDurationWeight);
  uint64_t v7 = self->_infectiousnessForDaysSinceOnsetOfSymptoms;
  if (v7)
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __47__ENExposureConfiguration_encodeWithXPCObject___block_invoke;
    v12[3] = &unk_264244818;
    v12[4] = v8;
    [(NSDictionary *)v7 enumerateKeysAndObjectsUsingBlock:v12];
    xpc_dictionary_set_value(v5, "infectLV", v8);
  }
  xpc_dictionary_set_double(v5, "infWStd", self->_infectiousnessStandardWeight);
  xpc_dictionary_set_double(v5, "infWHigh", self->_infectiousnessHighWeight);
  xpc_dictionary_set_double(v5, "rtWCTest", self->_reportTypeConfirmedTestWeight);
  xpc_dictionary_set_double(v5, "rtWCClin", self->_reportTypeConfirmedClinicalDiagnosisWeight);
  xpc_dictionary_set_double(v5, "rtWSelfR", self->_reportTypeSelfReportedWeight);
  xpc_dictionary_set_double(v5, "rtWRecurs", self->_reportTypeRecursiveWeight);
  xpc_dictionary_set_uint64(v5, "rtNM", self->_reportTypeNoneMap);
  CFArrayGetTypeID();
  uint64_t v9 = CFDictionaryGetTypedValue();
  CUXPCEncodeNSArrayOfNSNumber();
  int64_t daysSinceLastExposureThreshold = self->_daysSinceLastExposureThreshold;
  if (daysSinceLastExposureThreshold) {
    xpc_dictionary_set_int64(v5, "dsleTh", daysSinceLastExposureThreshold);
  }
  double minimumRiskScoreFullRange = self->_minimumRiskScoreFullRange;
  if (minimumRiskScoreFullRange == 0.0) {
    CFDictionaryGetDouble();
  }
  if (minimumRiskScoreFullRange != 0.0) {
    xpc_dictionary_set_double(v5, "mnRSFR", minimumRiskScoreFullRange);
  }
  if (self->_minimumRiskScore) {
    xpc_dictionary_set_uint64(v5, "mnRS", self->_minimumRiskScore);
  }
  CUXPCEncodeNSArrayOfNSNumber();
  xpc_dictionary_set_double(v5, "attW", self->_attenuationWeight);
  CUXPCEncodeNSArrayOfNSNumber();
  xpc_dictionary_set_double(v5, "durW", self->_durationWeight);
  CUXPCEncodeNSArrayOfNSNumber();
  xpc_dictionary_set_double(v5, "dleW", self->_daysSinceLastExposureWeight);
  CUXPCEncodeNSArrayOfNSNumber();
  xpc_dictionary_set_double(v5, "trRW", self->_transmissionRiskWeight);
}

void __47__ENExposureConfiguration_encodeWithXPCObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  *(_OWORD *)__str = 0u;
  long long v9 = 0u;
  id v5 = a3;
  snprintf(__str, 0x20uLL, "%lld", [a2 longLongValue]);
  uint64_t v6 = *(void **)(a1 + 32);
  int64_t v7 = [v5 longLongValue];

  xpc_dictionary_set_int64(v6, __str, v7);
}

- (id)description
{
  NSAppendPrintF_safe();
  id v18 = 0;
  NSAppendPrintF();
  id v3 = v18;

  NSAppendPrintF_safe();
  id v4 = v3;

  id v5 = self->_infectiousnessForDaysSinceOnsetOfSymptoms;
  if (v5)
  {
    NSAppendPrintF();
    id v6 = v4;

    id v4 = v6;
  }
  NSAppendPrintF_safe();
  id v7 = v4;

  NSAppendPrintF_safe();
  id v8 = v7;

  NSAppendPrintF_safe();
  id v9 = v8;

  NSAppendPrintF();
  id v10 = v9;

  NSAppendPrintF_safe();
  id v11 = v10;

  NSAppendPrintF_safe();
  id v12 = v11;

  NSAppendPrintF();
  id v13 = v12;

  NSAppendPrintF();
  id v14 = v13;

  NSAppendPrintF();
  id v15 = v14;

  NSAppendPrintF();
  id v16 = v15;

  return v16;
}

- (double)attenuationLevelValueWithAttenuation:(unsigned __int8)a3
{
  return self->_attenuationWeight * (double)a3;
}

- (double)daysSinceLastExposureLevelValueWithDays:(int64_t)a3
{
  uint64_t v4 = 16;
  uint64_t v5 = 17;
  uint64_t v6 = 18;
  uint64_t v7 = 19;
  uint64_t v8 = 20;
  uint64_t v9 = 21;
  uint64_t v10 = 22;
  if (a3 <= 1) {
    uint64_t v10 = 23;
  }
  if (a3 <= 3) {
    uint64_t v9 = v10;
  }
  if (a3 <= 5) {
    uint64_t v8 = v9;
  }
  if (a3 <= 7) {
    uint64_t v7 = v8;
  }
  if (a3 <= 9) {
    uint64_t v6 = v7;
  }
  if (a3 <= 11) {
    uint64_t v5 = v6;
  }
  if (a3 <= 13) {
    uint64_t v4 = v5;
  }
  LOBYTE(v3) = *((unsigned char *)&self->super.isa + v4);
  return self->_daysSinceLastExposureWeight * (double)v3;
}

- (double)durationLevelValueWithDuration:(double)a3
{
  double v3 = a3 / 60.0;
  if (v3 <= 0.0)
  {
    uint64_t v4 = 24;
  }
  else if (v3 <= 5.0)
  {
    uint64_t v4 = 25;
  }
  else if (v3 <= 10.0)
  {
    uint64_t v4 = 26;
  }
  else if (v3 <= 15.0)
  {
    uint64_t v4 = 27;
  }
  else if (v3 <= 20.0)
  {
    uint64_t v4 = 28;
  }
  else if (v3 <= 25.0)
  {
    uint64_t v4 = 29;
  }
  else
  {
    uint64_t v4 = 30;
    if (v3 > 30.0) {
      uint64_t v4 = 31;
    }
  }
  LOBYTE(v3) = *((unsigned char *)&self->super.isa + v4);
  return self->_durationWeight * (double)*(unint64_t *)&v3;
}

- (unsigned)infectiousnessWithDaysSinceOnsetOfSymptoms:(int64_t)a3
{
  return CFDictionaryGetInt64Ranged();
}

- (double)infectiousnessWeightWithDaysSinceOnsetOfSymptoms:(int64_t)a3 skip:(BOOL *)a4
{
  unsigned int v6 = [(ENExposureConfiguration *)self infectiousnessWithDaysSinceOnsetOfSymptoms:a3];
  if (v6 == 2) {
    return self->_infectiousnessHighWeight;
  }
  if (v6 == 1) {
    return self->_infectiousnessStandardWeight;
  }
  *a4 = 1;
  return 0.0;
}

- (unsigned)mappedDiagnosisReportType:(unsigned int)a3
{
  if (a3 - 5 <= 0xFFFFFFFB) {
    return self->_reportTypeNoneMap;
  }
  return a3;
}

- (double)reportTypeWeightWithReportType:(unsigned int)a3 skip:(BOOL *)a4
{
  unsigned int v6 = [(ENExposureConfiguration *)self mappedDiagnosisReportType:*(void *)&a3];
  *a4 = v6 == 0;
  double result = 0.0;
  switch(v6)
  {
    case 0u:
      return result;
    case 1u:
    case 4u:
      double result = self->_reportTypeConfirmedTestWeight;
      break;
    case 2u:
      double result = self->_reportTypeConfirmedClinicalDiagnosisWeight;
      break;
    case 3u:
      double result = self->_reportTypeSelfReportedWeight;
      break;
    default:
      double result = 100.0;
      break;
  }
  return result;
}

- (double)transmissionLevelValueWithTransmissionRiskLevel:(unsigned __int8)a3
{
  if (a3 >= 7u) {
    uint64_t v4 = 7;
  }
  else {
    uint64_t v4 = a3;
  }
  LOBYTE(v3) = self->_transmissionRiskLevelValuesMap[v4];
  return self->_transmissionRiskWeight * (double)v3;
}

- (double)weightedDurationWithExposureInfo:(id)a3
{
  uint64_t v4 = [a3 attenuationDurations];
  uint64_t v5 = [v4 count];
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v7 = [v4 objectAtIndexedSubscript:0];
    [v7 doubleValue];
    double v9 = v8 * (self->_immediateDurationWeight / 100.0) + 0.0;

    if (v6 != 1)
    {
      uint64_t v10 = [v4 objectAtIndexedSubscript:1];
      [v10 doubleValue];
      double v9 = v9 + v11 * (self->_nearDurationWeight / 100.0);

      if (v6 >= 3)
      {
        id v12 = [v4 objectAtIndexedSubscript:2];
        [v12 doubleValue];
        double v9 = v9 + v13 * (self->_mediumDurationWeight / 100.0);

        if (v6 != 3)
        {
          id v14 = [v4 objectAtIndexedSubscript:3];
          [v14 doubleValue];
          double v9 = v9 + v15 * (self->_otherDurationWeight / 100.0);
        }
      }
    }
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (double)immediateDurationWeight
{
  return self->_immediateDurationWeight;
}

- (void)setImmediateDurationWeight:(double)immediateDurationWeight
{
  self->_immediateDurationWeight = immediateDurationWeight;
}

- (double)nearDurationWeight
{
  return self->_nearDurationWeight;
}

- (void)setNearDurationWeight:(double)nearDurationWeight
{
  self->_nearDurationWeight = nearDurationWeight;
}

- (double)mediumDurationWeight
{
  return self->_mediumDurationWeight;
}

- (void)setMediumDurationWeight:(double)mediumDurationWeight
{
  self->_mediumDurationWeight = mediumDurationWeight;
}

- (double)otherDurationWeight
{
  return self->_otherDurationWeight;
}

- (void)setOtherDurationWeight:(double)otherDurationWeight
{
  self->_otherDurationWeight = otherDurationWeight;
}

- (NSDictionary)infectiousnessForDaysSinceOnsetOfSymptoms
{
  return self->_infectiousnessForDaysSinceOnsetOfSymptoms;
}

- (void)setInfectiousnessForDaysSinceOnsetOfSymptoms:(NSDictionary *)infectiousnessForDaysSinceOnsetOfSymptoms
{
}

- (double)infectiousnessStandardWeight
{
  return self->_infectiousnessStandardWeight;
}

- (void)setInfectiousnessStandardWeight:(double)infectiousnessStandardWeight
{
  self->_infectiousnessStandardWeight = infectiousnessStandardWeight;
}

- (double)infectiousnessHighWeight
{
  return self->_infectiousnessHighWeight;
}

- (void)setInfectiousnessHighWeight:(double)infectiousnessHighWeight
{
  self->_infectiousnessHighWeight = infectiousnessHighWeight;
}

- (double)reportTypeConfirmedTestWeight
{
  return self->_reportTypeConfirmedTestWeight;
}

- (void)setReportTypeConfirmedTestWeight:(double)reportTypeConfirmedTestWeight
{
  self->_reportTypeConfirmedTestWeight = reportTypeConfirmedTestWeight;
}

- (double)reportTypeConfirmedClinicalDiagnosisWeight
{
  return self->_reportTypeConfirmedClinicalDiagnosisWeight;
}

- (void)setReportTypeConfirmedClinicalDiagnosisWeight:(double)reportTypeConfirmedClinicalDiagnosisWeight
{
  self->_reportTypeConfirmedClinicalDiagnosisWeight = reportTypeConfirmedClinicalDiagnosisWeight;
}

- (double)reportTypeSelfReportedWeight
{
  return self->_reportTypeSelfReportedWeight;
}

- (void)setReportTypeSelfReportedWeight:(double)reportTypeSelfReportedWeight
{
  self->_reportTypeSelfReportedWeight = reportTypeSelfReportedWeight;
}

- (double)reportTypeRecursiveWeight
{
  return self->_reportTypeRecursiveWeight;
}

- (void)setReportTypeRecursiveWeight:(double)reportTypeRecursiveWeight
{
  self->_reportTypeRecursiveWeight = reportTypeRecursiveWeight;
}

- (ENDiagnosisReportType)reportTypeNoneMap
{
  return self->_reportTypeNoneMap;
}

- (void)setReportTypeNoneMap:(ENDiagnosisReportType)reportTypeNoneMap
{
  self->_unsigned int reportTypeNoneMap = reportTypeNoneMap;
}

- (NSArray)attenuationDurationThresholds
{
  return self->_attenuationDurationThresholds;
}

- (void)setAttenuationDurationThresholds:(NSArray *)attenuationDurationThresholds
{
}

- (NSInteger)daysSinceLastExposureThreshold
{
  return self->_daysSinceLastExposureThreshold;
}

- (void)setDaysSinceLastExposureThreshold:(NSInteger)daysSinceLastExposureThreshold
{
  self->_int64_t daysSinceLastExposureThreshold = daysSinceLastExposureThreshold;
}

- (double)minimumRiskScoreFullRange
{
  return self->_minimumRiskScoreFullRange;
}

- (void)setMinimumRiskScoreFullRange:(double)minimumRiskScoreFullRange
{
  self->_double minimumRiskScoreFullRange = minimumRiskScoreFullRange;
}

- (NSArray)attenuationLevelValues
{
  return self->_attenuationLevelValues;
}

- (void)setAttenuationLevelValues:(NSArray *)attenuationLevelValues
{
}

- (double)attenuationWeight
{
  return self->_attenuationWeight;
}

- (void)setAttenuationWeight:(double)attenuationWeight
{
  self->_double attenuationWeight = attenuationWeight;
}

- (NSArray)daysSinceLastExposureLevelValues
{
  return self->_daysSinceLastExposureLevelValues;
}

- (void)setDaysSinceLastExposureLevelValues:(NSArray *)daysSinceLastExposureLevelValues
{
}

- (double)daysSinceLastExposureWeight
{
  return self->_daysSinceLastExposureWeight;
}

- (void)setDaysSinceLastExposureWeight:(double)daysSinceLastExposureWeight
{
  self->_double daysSinceLastExposureWeight = daysSinceLastExposureWeight;
}

- (NSArray)durationLevelValues
{
  return self->_durationLevelValues;
}

- (void)setDurationLevelValues:(NSArray *)durationLevelValues
{
}

- (double)durationWeight
{
  return self->_durationWeight;
}

- (void)setDurationWeight:(double)durationWeight
{
  self->_double durationWeight = durationWeight;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(NSDictionary *)metadata
{
}

- (ENRiskScore)minimumRiskScore
{
  return self->_minimumRiskScore;
}

- (void)setMinimumRiskScore:(ENRiskScore)minimumRiskScore
{
  self->_minimumRiskScore = minimumRiskScore;
}

- (NSArray)transmissionRiskLevelValues
{
  return self->_transmissionRiskLevelValues;
}

- (void)setTransmissionRiskLevelValues:(NSArray *)transmissionRiskLevelValues
{
}

- (double)transmissionRiskWeight
{
  return self->_transmissionRiskWeight;
}

- (void)setTransmissionRiskWeight:(double)transmissionRiskWeight
{
  self->_double transmissionRiskWeight = transmissionRiskWeight;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_uint64_t flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transmissionRiskLevelValues, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_durationLevelValues, 0);
  objc_storeStrong((id *)&self->_daysSinceLastExposureLevelValues, 0);
  objc_storeStrong((id *)&self->_attenuationLevelValues, 0);
  objc_storeStrong((id *)&self->_attenuationDurationThresholds, 0);

  objc_storeStrong((id *)&self->_infectiousnessForDaysSinceOnsetOfSymptoms, 0);
}

@end