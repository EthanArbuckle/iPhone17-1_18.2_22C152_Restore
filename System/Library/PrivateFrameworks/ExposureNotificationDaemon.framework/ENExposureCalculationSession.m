@interface ENExposureCalculationSession
- ($6B14AE857B43CEDA041F2BA42EED81B6)scanInstanceFromAdvertisement:(SEL)a3 key:(id)a4;
- (BOOL)_shouldMatchKey:(id)a3;
- (BOOL)allowRecursiveReportType;
- (BOOL)cacheExposureInfo;
- (BOOL)cacheExposureWindows;
- (ENExposureCalculationSession)initWithAttenuationThreshold:(unsigned __int8)a3 capacity:(unsigned int)a4;
- (ENExposureConfiguration)exposureConfiguration;
- (NSNumber)advertisementSampleCountThreshold;
- (NSNumber)allowedRPIBroadcastDuration;
- (id)attenuationDurationMapDataForExposureWindows:(id)a3;
- (id)cachedExposuresDifferentialPrivacyRiskParameters;
- (id)exposureInfoForExposureWindows:(id)a3 key:(id)a4;
- (id)exposureInfoForMatchedAdvertisements:(id)a3 key:(id)a4;
- (id)exposureInfosForEachExposureWindow:(id)a3 key:(id)a4;
- (id)exposureWindowsForMatchedAdvertisements:(id)a3 key:(id)a4;
- (id)exposureWindowsForMatchedAdvertisements:(id)a3 key:(id)a4 options:(int64_t)a5;
- (id)filterAdvertisements:(id)a3 fromKey:(id)a4;
- (id)groupExposureWindowsByDay:(id)a3;
- (id)groupExposureWindowsByInfectiousness:(id)a3;
- (unint64_t)cachedExposureInfoCount;
- (unint64_t)cachedExposureWindowCount;
- (unsigned)droppedScanInstanceCount;
- (unsigned)weightedAttenuationValueForDurations:(unsigned int *)a3;
- (void)dealloc;
- (void)enumerateCachedExposureInfo:(id)a3;
- (void)enumerateCachedExposureInfo:(id)a3 inRange:(_NSRange)a4 withBatchSize:(unsigned int)a5;
- (void)enumerateCachedExposureInfo:(id)a3 withBatchSize:(unsigned int)a4;
- (void)enumerateCachedExposureWindows:(id)a3 inRange:(_NSRange)a4 withBatchSize:(unsigned int)a5;
- (void)enumerateCachedExposureWindows:(id)a3 inRange:(_NSRange)a4 withBatchSize:(unsigned int)a5 options:(int64_t)a6;
- (void)setAdvertisementSampleCountThreshold:(id)a3;
- (void)setAllowRecursiveReportType:(BOOL)a3;
- (void)setAllowedRPIBroadcastDuration:(id)a3;
- (void)setCacheExposureInfo:(BOOL)a3;
- (void)setCacheExposureWindows:(BOOL)a3;
- (void)setExposureConfiguration:(id)a3;
@end

@implementation ENExposureCalculationSession

- (ENExposureCalculationSession)initWithAttenuationThreshold:(unsigned __int8)a3 capacity:(unsigned int)a4
{
  v16.receiver = self;
  v16.super_class = (Class)ENExposureCalculationSession;
  v5 = [(ENExposureCalculationSession *)&v16 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_8;
  }
  if (a4 >= 0xDF638) {
    unsigned int v7 = 915000;
  }
  else {
    unsigned int v7 = a4;
  }
  v5->_scanInstanceBufferSize = v7;
  uint64_t v8 = os_transaction_create();
  transaction = v6->_transaction;
  v6->_transaction = (OS_os_transaction *)v8;

  v6->_cachedExposureWindowMetadataCount = 0;
  v10 = ($7ADA1EF68C37A8F83EC2BAFA30593E49 *)malloc_type_calloc(v6->_scanInstanceBufferSize, 0x18uLL, 0x100004034E20058uLL);
  v6->_exposureWindowMetadataBuffer = v10;
  if (!v10)
  {
    if (gLogCategory__ENExposureCalculationSession > 90
      || gLogCategory__ENExposureCalculationSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_18;
    }
LABEL_14:
    LogPrintF_safe();
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
  v6->_cachedExposureWindowCount = 0;
  v11 = ($6B14AE857B43CEDA041F2BA42EED81B6 *)malloc_type_calloc(v6->_scanInstanceBufferSize, 0x10uLL, 0x1000040451B5BE8uLL);
  v6->_scanInstanceBuffer = v11;
  if (!v11)
  {
    if (gLogCategory__ENExposureCalculationSession > 90
      || gLogCategory__ENExposureCalculationSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  *(_DWORD *)v6->_attenuationDurationThresholds = -47566;
  allowedRPIBroadcastDuration = v6->_allowedRPIBroadcastDuration;
  v6->_allowedRPIBroadcastDuration = (NSNumber *)&unk_1F2B360B8;

  advertisementSampleCountThreshold = v6->_advertisementSampleCountThreshold;
  v6->_advertisementSampleCountThreshold = (NSNumber *)&unk_1F2B36028;

LABEL_8:
  v14 = v6;
LABEL_19:

  return v14;
}

- (void)dealloc
{
  v3 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v4 = [v3 isSensitiveLoggingAllowed];

  if (v4
    && gLogCategory_ENExposureCalculationSession <= 50
    && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
  {
    id v5 = [(ENExposureConfiguration *)self->_exposureConfiguration description];
    [v5 UTF8String];
    LogPrintF_safe();
  }
  free(self->_exposureWindowMetadataBuffer);
  free(self->_scanInstanceBuffer);
  transaction = self->_transaction;
  self->_transaction = 0;

  v7.receiver = self;
  v7.super_class = (Class)ENExposureCalculationSession;
  [(ENExposureCalculationSession *)&v7 dealloc];
}

- (void)setExposureConfiguration:(id)a3
{
  int v4 = (ENExposureConfiguration *)[a3 copy];
  exposureConfiguration = self->_exposureConfiguration;
  self->_exposureConfiguration = v4;

  v6 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v7 = [v6 isSensitiveLoggingAllowed];

  if (v7
    && gLogCategory_ENExposureCalculationSession <= 50
    && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
  {
    id v8 = [(ENExposureConfiguration *)self->_exposureConfiguration description];
    uint64_t v19 = [v8 UTF8String];
    LogPrintF_safe();
  }
  v21 = [(ENExposureConfiguration *)self->_exposureConfiguration attenuationDurationThresholds];
  uint64_t v9 = [v21 count];
  unsigned __int8 v10 = v9;
  if ((v9 & 0xFE) == 2)
  {
    v11 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v12 = [v11 isSensitiveLoggingAllowed];

    if (v12)
    {
      if (gLogCategory_ENExposureCalculationSession <= 50)
      {
        if (gLogCategory_ENExposureCalculationSession != -1 || (uint64_t v9 = _LogCategory_Initialize(), v9))
        {
          v20 = [v21 componentsJoinedByString:@", "];
          LogPrintF_safe();
        }
      }
    }
    uint64_t v14 = v10;
    v13 = v21;
    if (v10)
    {
      uint64_t v15 = 0;
      attenuationDurationThresholds = self->_attenuationDurationThresholds;
      do
      {
        v17 = objc_msgSend(v13, "objectAtIndex:", v15, v20);
        unsigned __int8 v18 = [v17 unsignedIntValue];

        v13 = v21;
        attenuationDurationThresholds[v15++] = v18;
      }
      while (v14 != v15);
    }
  }
  else
  {
    v13 = v21;
    if (gLogCategory__ENExposureCalculationSession <= 90)
    {
      if (gLogCategory__ENExposureCalculationSession != -1 || (uint64_t v9 = _LogCategory_Initialize(), v13 = v21, v9))
      {
        uint64_t v9 = LogPrintF_safe();
        v13 = v21;
      }
    }
  }

  MEMORY[0x1F41817F8](v9, v13);
}

- (unsigned)weightedAttenuationValueForDurations:(unsigned int *)a3
{
  int v4 = [(ENExposureConfiguration *)self->_exposureConfiguration attenuationLevelValues];
  if ([v4 count] == 8)
  {
    id v5 = v4;
  }
  else
  {
    if (gLogCategory__ENExposureCalculationSession <= 90
      && (gLogCategory__ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v19 = [v4 count];
      LogPrintF_safe();
    }
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
    int v6 = 8;
    do
    {
      objc_msgSend(v5, "addObject:", &unk_1F2B360C8, v19);
      --v6;
    }
    while (v6);
  }
  uint64_t v7 = 0;
  unsigned int v8 = 0;
  double v9 = 0.0;
  do
  {
    unsigned int v10 = a3[v7];
    v11 = [v5 objectAtIndexedSubscript:v7];
    [v11 doubleValue];
    double v13 = v12 * (double)v10;

    if (v13 == 0.0) {
      unsigned int v14 = 0;
    }
    else {
      unsigned int v14 = v10;
    }
    v8 += v14;
    double v15 = -0.0;
    if (v13 != 0.0) {
      double v15 = v13;
    }
    double v9 = v9 + v15;
    ++v7;
  }
  while (v7 != 8);
  if (v8) {
    double v9 = round(v9 / (double)v8);
  }
  double v16 = 255.0;
  if (v9 <= 255.0) {
    double v16 = v9;
  }
  int v17 = (int)v16;

  return v17;
}

- (id)exposureInfoForExposureWindows:(id)a3 key:(id)a4
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v34 = a4;
  obuint64_t j = v6;
  v50[0] = 0;
  v50[1] = 0;
  memset(v49, 0, sizeof(v49));
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v37 = [v6 countByEnumeratingWithState:&v43 objects:v48 count:16];
  v33 = self;
  unsigned int v7 = 0;
  if (v37)
  {
    uint64_t v36 = *(void *)v44;
    attenuationDurationThresholds = self->_attenuationDurationThresholds;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v44 != v36) {
          objc_enumerationMutation(v6);
        }
        uint64_t v38 = v9;
        unsigned int v10 = *(void **)(*((void *)&v43 + 1) + 8 * v9);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        v11 = objc_msgSend(v10, "scanInstances", v33);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v40 != v14) {
                objc_enumerationMutation(v11);
              }
              double v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              int v17 = (unsigned __int16)[v16 secondsSinceLastScan];
              v7 += v17;
              unsigned int v18 = [v16 typicalAttenuation];
              uint64_t v19 = 0;
              while (v18 > attenuationDurationThresholds[v19])
              {
                if (++v19 == 4) {
                  goto LABEL_16;
                }
              }
              *((_DWORD *)v50 + v19) += v17;
LABEL_16:
              v20 = &byte_1D3A7B318;
              uint64_t v21 = 28;
              while (1)
              {
                unsigned int v22 = *v20++;
                if (v18 <= v22) {
                  break;
                }
                v21 -= 4;
                if (v21 == -4) {
                  goto LABEL_21;
                }
              }
              *(_DWORD *)((char *)v49 + v21) += v17;
LABEL_21:
              ;
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v13);
        }

        uint64_t v9 = v38 + 1;
      }
      while (v38 + 1 != v37);
      uint64_t v37 = [v6 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v37);
  }
  uint64_t v23 = -[ENExposureCalculationSession weightedAttenuationValueForDurations:](v33, "weightedAttenuationValueForDurations:", v49, v33);
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
  for (uint64_t j = 0; j != 16; j += 4)
  {
    if (*(_DWORD *)((char *)v50 + j) >= 0xFFFFu) {
      int v26 = 0xFFFF;
    }
    else {
      int v26 = *(_DWORD *)((char *)v50 + j);
    }
    *(_DWORD *)((char *)v50 + j) = v26;
    v27 = objc_msgSend(MEMORY[0x1E4F28EC8], "numberWithUnsignedInt:");
    [v24 addObject:v27];
  }
  if (v7 >= 0xFFFF) {
    unsigned int v28 = 0xFFFF;
  }
  else {
    unsigned int v28 = v7;
  }
  int v29 = [v34 rollingStartNumber];
  v30 = [MEMORY[0x1E4F1C9C0] dateWithTimeIntervalSince1970:(double)(86400 * (600 * v29 / 0x15180u))];
  id v31 = objc_alloc_init(MEMORY[0x1E4F25770]);
  [v31 setDate:v30];
  [v31 setAttenuationValue:v23];
  [v31 setDuration:(double)v28];
  [v31 setAttenuationDurations:v24];
  objc_msgSend(v31, "setTransmissionRiskLevel:", objc_msgSend(v34, "transmissionRiskLevel"));
  objc_msgSend(v31, "setDiagnosisReportType:", objc_msgSend(v34, "diagnosisReportType"));
  objc_msgSend(v31, "setDaysSinceOnsetOfSymptoms:", objc_msgSend(v34, "daysSinceOnsetOfSymptoms"));

  return v31;
}

- (id)exposureInfosForEachExposureWindow:(id)a3 key:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v40 = a4;
  long long v39 = objc_msgSend(MEMORY[0x1E4F1CA40], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = v5;
  uint64_t v41 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v41)
  {
    uint64_t v37 = *(void *)v49;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v49 != v37) {
          objc_enumerationMutation(obj);
        }
        unsigned int v7 = *(void **)(*((void *)&v48 + 1) + 8 * v6);
        v54[0] = 0;
        v54[1] = 0;
        memset(v53, 0, sizeof(v53));
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v42 = v7;
        uint64_t v43 = v6;
        unsigned int v8 = [v7 scanInstances];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          unsigned int v11 = 0;
          uint64_t v12 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v45 != v12) {
                objc_enumerationMutation(v8);
              }
              uint64_t v14 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              int v15 = (unsigned __int16)[v14 secondsSinceLastScan];
              v11 += v15;
              unsigned int v16 = [v14 typicalAttenuation];
              uint64_t v17 = 0;
              while (v16 > self->_attenuationDurationThresholds[v17])
              {
                if (++v17 == 4) {
                  goto LABEL_16;
                }
              }
              *((_DWORD *)v54 + v17) += v15;
LABEL_16:
              unsigned int v18 = &byte_1D3A7B318;
              uint64_t v19 = 28;
              while (1)
              {
                unsigned int v20 = *v18++;
                if (v16 <= v20) {
                  break;
                }
                v19 -= 4;
                if (v19 == -4) {
                  goto LABEL_21;
                }
              }
              *(_DWORD *)((char *)v53 + v19) += v15;
LABEL_21:
              ;
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v52 count:16];
          }
          while (v10);
        }
        else
        {
          unsigned int v11 = 0;
        }

        uint64_t v21 = [(ENExposureCalculationSession *)self weightedAttenuationValueForDurations:v53];
        id v22 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
        for (uint64_t j = 0; j != 16; j += 4)
        {
          if (*(_DWORD *)((char *)v54 + j) >= 0xFFFFu) {
            int v24 = 0xFFFF;
          }
          else {
            int v24 = *(_DWORD *)((char *)v54 + j);
          }
          *(_DWORD *)((char *)v54 + j) = v24;
          v25 = objc_msgSend(MEMORY[0x1E4F28EC8], "numberWithUnsignedInt:");
          [v22 addObject:v25];
        }
        if (v11 >= 0xFFFF) {
          unsigned int v26 = 0xFFFF;
        }
        else {
          unsigned int v26 = v11;
        }
        int v27 = [v40 rollingStartNumber];
        unsigned int v28 = [MEMORY[0x1E4F1C9C0] dateWithTimeIntervalSince1970:(double)(86400 * (600 * v27 / 0x15180u))];
        id v29 = objc_alloc_init(MEMORY[0x1E4F25770]);
        [v29 setDate:v28];
        [v29 setAttenuationValue:v21];
        [v29 setDuration:(double)v26];
        [v29 setAttenuationDurations:v22];
        objc_msgSend(v29, "setTransmissionRiskLevel:", objc_msgSend(v40, "transmissionRiskLevel"));
        objc_msgSend(v29, "setDiagnosisReportType:", objc_msgSend(v40, "diagnosisReportType"));
        objc_msgSend(v29, "setDaysSinceOnsetOfSymptoms:", objc_msgSend(v40, "daysSinceOnsetOfSymptoms"));
        v30 = +[ENLoggingPrefs sharedENLoggingPrefs];
        char v31 = [v30 isSensitiveLoggingAllowed];

        if ((v31 & 1) != 0
          && gLogCategory_ENExposureCalculationSession <= 10
          && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
        {
          id v34 = v42;
          id v35 = v29;
          LogPrintF_safe();
        }
        objc_msgSend(v39, "addObject:", v29, v34, v35);

        uint64_t v6 = v43 + 1;
      }
      while (v43 + 1 != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v41);
  }

  v32 = (void *)[v39 copy];

  return v32;
}

- (id)exposureInfoForMatchedAdvertisements:(id)a3 key:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(ENExposureCalculationSession *)self exposureWindowsForMatchedAdvertisements:a3 key:v6 options:1];
  if (v7)
  {
    unsigned int v8 = [(ENExposureCalculationSession *)self exposureInfoForExposureWindows:v7 key:v6];
  }
  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (unint64_t)cachedExposureInfoCount
{
  return self->_cachedExposureWindowMetadataCount;
}

- (void)enumerateCachedExposureInfo:(id)a3
{
}

- (void)enumerateCachedExposureInfo:(id)a3 withBatchSize:(unsigned int)a4
{
}

- (void)enumerateCachedExposureInfo:(id)a3 inRange:(_NSRange)a4 withBatchSize:(unsigned int)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  long long v39 = (void (**)(id, id, void))a3;
  if (length)
  {
    NSUInteger cachedScanInstanceCount = self->_cachedScanInstanceCount;
    if (location >= cachedScanInstanceCount)
    {
      id v35 = [MEMORY[0x1E4F28B08] currentHandler];
      [v35 handleFailureInMethod:a2, self, @"ENExposureCalculationSession.m", 599, @"Invalid parameter not satisfying: %@", @"range.location < _cachedScanInstanceCount" object file lineNumber description];

      NSUInteger cachedScanInstanceCount = self->_cachedScanInstanceCount;
    }
    SEL v36 = a2;
    NSUInteger v11 = 0;
    if (cachedScanInstanceCount)
    {
      scanInstanceBuffer = self->_scanInstanceBuffer;
      while (1)
      {
        unsigned int var0 = scanInstanceBuffer->var0;
        scanInstanceBuffer = ($6B14AE857B43CEDA041F2BA42EED81B6 *)((char *)scanInstanceBuffer + 16);
        if (location <= var0) {
          break;
        }
        if (cachedScanInstanceCount == ++v11)
        {
          NSUInteger v11 = cachedScanInstanceCount;
          break;
        }
      }
    }
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
    NSUInteger v38 = location + length;
    if (location < location + length)
    {
      NSUInteger v37 = a5;
      do
      {
        uint64_t v14 = MEMORY[0x1D9439DC0]();
        NSUInteger cachedExposureWindowMetadataCount = self->_cachedExposureWindowMetadataCount;
        context = (void *)v14;
        NSUInteger v41 = location + v37;
        if (location + v37 <= cachedExposureWindowMetadataCount) {
          NSUInteger v16 = v37;
        }
        else {
          NSUInteger v16 = cachedExposureWindowMetadataCount - location;
        }
        NSUInteger v17 = v16 + location;
        if (location >= v16 + location)
        {
          NSUInteger v18 = v11;
        }
        else
        {
          NSUInteger v18 = v11;
          do
          {
            NSUInteger v19 = self->_cachedScanInstanceCount;
            if (v11 < v19)
            {
              unsigned int v20 = &self->_scanInstanceBuffer->var0 + 4 * v11;
              NSUInteger v18 = v11;
              while (1)
              {
                unsigned int v21 = *v20;
                v20 += 4;
                if (location != v21) {
                  break;
                }
                if (v19 == ++v18)
                {
                  NSUInteger v18 = self->_cachedScanInstanceCount;
                  break;
                }
              }
            }
            if (location >= self->_cachedExposureWindowMetadataCount)
            {
              id v34 = [MEMORY[0x1E4F28B08] currentHandler];
              [v34 handleFailureInMethod:v36, self, @"ENExposureCalculationSession.m", 626, @"Invalid parameter not satisfying: %@", @"metadataIndex < _cachedExposureWindowMetadataCount" object file lineNumber description];
            }
            id v22 = &self->_exposureWindowMetadataBuffer[location];
            int64_t var1 = v22->var1;
            uint64_t var2 = v22->var2;
            uint64_t var3 = v22->var3;
            unsigned __int8 var4 = v22->var4;
            uint64_t var5 = v22->var5;
            int v28 = *(_DWORD *)(&v22->var5 + 1);
            id v29 = (uint64_t *)((char *)self->_scanInstanceBuffer + 16 * v11);
            *(void *)&long long v44 = *(void *)&v22->var0;
            unsigned int v43 = v44;
            *((void *)&v44 + 1) = var1;
            char v45 = var2;
            char v46 = var3;
            unsigned __int8 v47 = var4;
            char v48 = var5;
            int v49 = v28;
            v30 = exposureWindowsForScanInstances(v29, (unsigned __int16)(v18 - v11), &v44, 0, 0, 1800.0);
            id v31 = objc_alloc_init(MEMORY[0x1E4F25800]);
            [v31 setRollingStartNumber:v43];
            [v31 setTransmissionRiskLevel:var2];
            [v31 setDaysSinceOnsetOfSymptoms:var1];
            [v31 setDiagnosisReportType:var3];
            [v31 setVariantOfConcernType:var5];
            v32 = [(ENExposureCalculationSession *)self exposureConfiguration];
            LOBYTE(var3) = [v32 flags];

            if ((var3 & 2) != 0)
            {
              if (gLogCategory__ENExposureCalculationSession <= 50
                && (gLogCategory__ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }
              v33 = [(ENExposureCalculationSession *)self exposureInfosForEachExposureWindow:v30 key:v31];
              [v42 addObjectsFromArray:v33];
            }
            else
            {
              v33 = [(ENExposureCalculationSession *)self exposureInfoForExposureWindows:v30 key:v31];
              [v42 addObject:v33];
            }

            ++location;
            NSUInteger v11 = v18;
          }
          while (location < v17);
        }
        v39[2](v39, v42, 0);
        [v42 removeAllObjects];
        NSUInteger location = v41;
        NSUInteger v11 = v18;
      }
      while (v41 < v38);
    }
  }
}

- (id)filterAdvertisements:(id)a3 fromKey:(id)a4
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 rollingPeriod];
  uint64_t v9 = (void *)v8;
  if (v8 >= 0x91)
  {
    uint64_t v10 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v11 = [v10 isSensitiveLoggingAllowed];

    if (v11
      && gLogCategory_ENExposureCalculationSession <= 50
      && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v80 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v81 = [v80 isRPILoggingAllowed];

    if (!v81
      || gLogCategory_ENExposureCalculationSession > 50
      || gLogCategory_ENExposureCalculationSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_117;
    }
LABEL_113:
    LogPrintF_safe();
LABEL_117:
    id v90 = (id)MEMORY[0x1E4F1CBF8];
    goto LABEL_118;
  }
  uint64_t v12 = (long long *)malloc_type_malloc((16 * v8), 0xADD90807uLL);
  if (!v12)
  {
    if (gLogCategory__ENExposureCalculationSession > 90
      || gLogCategory__ENExposureCalculationSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_117;
    }
    goto LABEL_113;
  }
  uint64_t v13 = v12;
  v86 = self;
  uint64_t v14 = v9;
  id v88 = v7;
  [v7 deriveRollingProximityIdentifiersWithBuffer:v12 count:v9];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
  obuint64_t j = v9;
  if (v9)
  {
    NSUInteger v16 = v13;
    do
    {
      long long v17 = *v16++;
      long long v109 = v17;
      NSUInteger v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B0]) initWithBytes:&v109 length:16];
      [v15 addObject:v18];

      --v14;
    }
    while (v14);
  }
  v93 = v15;
  free(v13);
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v87 = v6;
  id v20 = v6;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v102 objects:v108 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v103;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v103 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v102 + 1) + 8 * i);
        unsigned int v26 = objc_msgSend(v25, "rpi", v83);
        char v27 = [v93 containsObject:v26];

        if (v27)
        {
          [v19 addObject:v25];
        }
        else
        {
          int v28 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v29 = [v28 isSensitiveLoggingAllowed];

          if (v29
            && gLogCategory_ENExposureCalculationSession <= 50
            && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          v30 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v31 = [v30 isRPILoggingAllowed];

          if (v31
            && gLogCategory_ENExposureCalculationSession <= 50
            && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
          {
            uint64_t v83 = (uint64_t)obj;
            LogPrintF_safe();
          }
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v102 objects:v108 count:16];
    }
    while (v22);
  }

  id v89 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id obja = v19;
  uint64_t v32 = [obja countByEnumeratingWithState:&v98 objects:v107 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v99;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v99 != v34) {
          objc_enumerationMutation(obja);
        }
        SEL v36 = *(void **)(*((void *)&v98 + 1) + 8 * j);
        NSUInteger v37 = objc_msgSend(v36, "decryptedMetadataForTemporaryExposureKey:", v88, v83, v85);
        uint64_t v38 = [v36 saturated];
        int v39 = objc_msgSend(v37, "attenuationForRSSI:saturated:", objc_msgSend(v36, "typicalRSSI"), v38);
        int v40 = objc_msgSend(v37, "attenuationForRSSI:saturated:", objc_msgSend(v36, "maxRSSI"), v38);
        if ((int)[v37 txPower] >= -60 && (int)objc_msgSend(v37, "txPower") < 21)
        {
          if (v39)
          {
            if (v40)
            {
              uint64_t v43 = [v36 counter];
              unsigned __int8 v44 = [(NSNumber *)v86->_advertisementSampleCountThreshold unsignedShortValue];
              if (v43 >= v44)
              {
                [v89 addObject:v36];
              }
              else
              {
                unsigned __int8 v45 = v44;
                char v46 = +[ENLoggingPrefs sharedENLoggingPrefs];
                int v47 = [v46 isSensitiveLoggingAllowed];

                if (v47
                  && gLogCategory_ENExposureCalculationSession <= 50
                  && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
                {
                  uint64_t v83 = v43;
                  uint64_t v85 = v45;
LABEL_56:
                  LogPrintF_safe();
                }
              }
            }
            else
            {
              v52 = +[ENLoggingPrefs sharedENLoggingPrefs];
              int v53 = [v52 isSensitiveLoggingAllowed];

              if (v53
                && gLogCategory_ENExposureCalculationSession <= 50
                && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }
              uint64_t v56 = +[ENLoggingPrefs sharedENLoggingPrefs];
              int v57 = [v56 isRPILoggingAllowed];

              if (v57
                && gLogCategory_ENExposureCalculationSession <= 50
                && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
              {
                uint64_t v83 = 0;
                goto LABEL_56;
              }
            }
          }
          else
          {
            char v48 = +[ENLoggingPrefs sharedENLoggingPrefs];
            int v49 = [v48 isSensitiveLoggingAllowed];

            if (v49
              && gLogCategory_ENExposureCalculationSession <= 50
              && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
            }
            v54 = +[ENLoggingPrefs sharedENLoggingPrefs];
            int v55 = [v54 isRPILoggingAllowed];

            if (v55
              && gLogCategory_ENExposureCalculationSession <= 50
              && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
            {
              uint64_t v83 = 0;
              goto LABEL_56;
            }
          }
        }
        else
        {
          NSUInteger v41 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v42 = [v41 isSensitiveLoggingAllowed];

          if (v42
            && gLogCategory_ENExposureCalculationSession <= 50
            && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          long long v50 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v51 = [v50 isRPILoggingAllowed];

          if (v51
            && gLogCategory_ENExposureCalculationSession <= 50
            && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
          {
            uint64_t v83 = (int)[v37 txPower];
            goto LABEL_56;
          }
        }
      }
      uint64_t v33 = [obja countByEnumeratingWithState:&v98 objects:v107 count:16];
    }
    while (v33);
  }

  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA68]);
  id v90 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
  [(NSNumber *)v86->_allowedRPIBroadcastDuration floatValue];
  if (v59 >= 1200.0)
  {
    double v61 = 1200.0;
  }
  else
  {
    [(NSNumber *)v86->_allowedRPIBroadcastDuration floatValue];
    double v61 = v60;
  }
  v62 = objc_msgSend(v89, "sortedArrayUsingComparator:", &__block_literal_global_7, v83);
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  uint64_t v63 = [v62 countByEnumeratingWithState:&v94 objects:v106 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v95;
    do
    {
      for (uint64_t k = 0; k != v64; ++k)
      {
        if (*(void *)v95 != v65) {
          objc_enumerationMutation(v62);
        }
        v67 = *(void **)(*((void *)&v94 + 1) + 8 * k);
        v68 = objc_msgSend(v67, "rpi", *(void *)&v84);
        v69 = [v58 objectForKey:v68];

        if (!v69)
        {
          v70 = (void *)MEMORY[0x1E4F1C9C0];
          [v67 timestamp];
          v69 = objc_msgSend(v70, "dateWithTimeIntervalSince1970:");
          v71 = [v67 rpi];
          [v58 setObject:v69 forKey:v71];
        }
        v72 = (void *)MEMORY[0x1E4F1C9C0];
        [v67 timestamp];
        v73 = objc_msgSend(v72, "dateWithTimeIntervalSince1970:");
        [v73 timeIntervalSinceDate:v69];
        if (v74 <= v61)
        {
          [v90 addObject:v67];
        }
        else
        {
          double v75 = v74;
          v76 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v77 = [v76 isSensitiveLoggingAllowed];

          if (v77
            && gLogCategory_ENExposureCalculationSession <= 50
            && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          v78 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v79 = [v78 isRPILoggingAllowed];

          if (v79
            && gLogCategory_ENExposureCalculationSession <= 50
            && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
          {
            double v84 = v75;
            LogPrintF_safe();
          }
        }
      }
      uint64_t v64 = [v62 countByEnumeratingWithState:&v94 objects:v106 count:16];
    }
    while (v64);
  }

  id v6 = v87;
  id v7 = v88;
LABEL_118:

  return v90;
}

- ($6B14AE857B43CEDA041F2BA42EED81B6)scanInstanceFromAdvertisement:(SEL)a3 key:(id)a4
{
  id v6 = a4;
  id v7 = [v6 decryptedMetadataForTemporaryExposureKey:a5];
  uint64_t v8 = [v6 saturated];
  objc_msgSend(v7, "attenuationForRSSI:saturated:", objc_msgSend(v6, "typicalRSSI"), v8);
  objc_msgSend(v7, "attenuationForRSSI:saturated:", objc_msgSend(v6, "maxRSSI"), v8);
  LODWORD(v11) = 0;
  [v6 timestamp];
  HIDWORD(v11) = v9;
  [v6 scanInterval];

  return v11;
}

- (id)exposureWindowsForMatchedAdvertisements:(id)a3 key:(id)a4
{
  return [(ENExposureCalculationSession *)self exposureWindowsForMatchedAdvertisements:a3 key:a4 options:0];
}

- (id)exposureWindowsForMatchedAdvertisements:(id)a3 key:(id)a4 options:(int64_t)a5
{
  char v5 = a5;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v62 = v8;
  if (![(ENExposureCalculationSession *)self _shouldMatchKey:v9])
  {
    long long v50 = 0;
    goto LABEL_58;
  }
  char v60 = v5;
  double v61 = [(ENExposureCalculationSession *)self filterAdvertisements:v8 fromKey:v9];
  uint64_t v10 = v61;
  if ([v61 count])
  {
    id v11 = v61;
    uint64_t v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_7];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v14 = v12;
    id v15 = 0;
    uint64_t v16 = [v14 countByEnumeratingWithState:&v65 objects:&v69 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v66 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          if (v15
            && ([*(id *)(*((void *)&v65 + 1) + 8 * i) timestamp],
                double v21 = v20,
                [v15 timestamp],
                v21 - v22 <= 4.0))
          {
            [v15 combineWithAdvertisement:v19];
          }
          else
          {
            [v13 addObject:v19];
            id v23 = v19;

            id v15 = v23;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v65 objects:&v69 count:16];
      }
      while (v16);
    }

    if ([v13 count] != 1)
    {
      unint64_t v24 = 0;
      do
      {
        v25 = [v13 objectAtIndex:v24];
        unsigned int v26 = [v13 objectAtIndex:++v24];
        [v25 timestamp];
        double v28 = v27;
        [v26 timestamp];
        if (v28 > v29 - (double)[v26 scanInterval])
        {
          [v26 timestamp];
          double v31 = v30;
          [v25 timestamp];
          [v26 setScanInterval:(int)(v31 - v32)];
        }
      }
      while (v24 < [v13 count] - 1);
    }

    if ([v13 count])
    {
      unsigned __int16 v33 = [v13 count];
      uint64_t v34 = (uint64_t *)malloc_type_calloc(v33, 0x10uLL, 0x1000040451B5BE8uLL);
      id v35 = v34;
      if (v34)
      {
        if (v33)
        {
          uint64_t v36 = 0;
          NSUInteger v37 = v34 + 1;
          do
          {
            uint64_t v38 = (void *)MEMORY[0x1D9439DC0]();
            int v39 = [v13 objectAtIndex:v36];
            *(v37 - 1) = [(ENExposureCalculationSession *)self scanInstanceFromAdvertisement:v39 key:v9];
            *NSUInteger v37 = v40;

            ++v36;
            v37 += 2;
          }
          while (v33 != v36);
        }
        NSUInteger v41 = [v13 lastObject];
        int v42 = [v41 decryptedMetadataForTemporaryExposureKey:v9];
        id v43 = v9;
        unsigned int v44 = [v43 rollingStartNumber];
        uint64_t v59 = [v43 daysSinceOnsetOfSymptoms];
        unsigned __int8 v58 = [v43 transmissionRiskLevel];
        unsigned __int8 v57 = [v43 diagnosisReportType];
        unsigned __int8 v56 = [v43 variantOfConcernType];

        unsigned __int8 v45 = [v42 calibrationConfidence];
        unsigned __int8 v46 = v45;
        if ((v60 & 2) != 0) {
          double v47 = INFINITY;
        }
        else {
          double v47 = 1800.0;
        }
        if (!self->_cacheExposureWindows && !self->_cacheExposureInfo) {
          goto LABEL_55;
        }
        *(void *)&long long v69 = 0;
        *((void *)&v69 + 1) = &v69;
        uint64_t v70 = 0x2020000000;
        int v71 = 0;
        if (self->_cachedScanInstanceCount >= self->_scanInstanceBufferSize)
        {
          if (gLogCategory__ENExposureCalculationSession <= 90
            && (gLogCategory__ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          uint64_t v51 = *((void *)&v69 + 1);
          int v52 = *(_DWORD *)(*((void *)&v69 + 1) + 24) + v33;
          *(_DWORD *)(*((void *)&v69 + 1) + 24) = v52;
          if (!v52) {
            goto LABEL_54;
          }
        }
        else
        {
          unsigned int cachedExposureWindowMetadataCount = self->_cachedExposureWindowMetadataCount;
          self->_unsigned int cachedExposureWindowMetadataCount = cachedExposureWindowMetadataCount + 1;
          int v49 = &self->_exposureWindowMetadataBuffer[cachedExposureWindowMetadataCount];
          v49->unsigned int var0 = v44;
          *(&v49->var0 + 1) = 0;
          v49->int64_t var1 = v59;
          v49->uint64_t var2 = v58;
          v49->uint64_t var3 = v57;
          v49->unsigned __int8 var4 = v45;
          v49->uint64_t var5 = v56;
          *(_DWORD *)(&v49->var5 + 1) = 0;
          v63[0] = MEMORY[0x1E4F143A8];
          v63[1] = 3221225472;
          v63[2] = __84__ENExposureCalculationSession_exposureWindowsForMatchedAdvertisements_key_options___block_invoke;
          v63[3] = &unk_1E69AE560;
          unsigned int v64 = cachedExposureWindowMetadataCount;
          v63[4] = self;
          v63[5] = &v69;
          groupScanInstances(v35, v33, v63, v47);
          if (*(_DWORD *)(*((void *)&v69 + 1) + 24)
            && gLogCategory__ENExposureCalculationSession <= 90
            && (gLogCategory__ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          uint64_t v51 = *((void *)&v69 + 1);
          if (!*(_DWORD *)(*((void *)&v69 + 1) + 24)) {
            goto LABEL_54;
          }
        }
        if (gLogCategory__ENExposureCalculationSession <= 90)
        {
          if (gLogCategory__ENExposureCalculationSession != -1
            || (v53 = _LogCategory_Initialize(), uint64_t v51 = *((void *)&v69 + 1), v53))
          {
            LogPrintF_safe();
            uint64_t v51 = *((void *)&v69 + 1);
          }
        }
        self->_droppedScanInstanceCount += *(_DWORD *)(v51 + 24);
LABEL_54:
        _Block_object_dispose(&v69, 8);
LABEL_55:
        exposureConfiguration = self->_exposureConfiguration;
        *(void *)&long long v69 = v44;
        *((void *)&v69 + 1) = v59;
        LOBYTE(v70) = v58;
        BYTE1(v70) = v57;
        BYTE2(v70) = v46;
        BYTE3(v70) = v56;
        HIDWORD(v70) = 0;
        long long v50 = exposureWindowsForScanInstances(v35, v33, &v69, (v60 & 1) == 0, exposureConfiguration, v47);
        free(v35);

        goto LABEL_56;
      }
      if (gLogCategory__ENExposureCalculationSession <= 90
        && (gLogCategory__ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    long long v50 = 0;
LABEL_56:

    uint64_t v10 = v61;
    goto LABEL_57;
  }
  long long v50 = 0;
LABEL_57:

LABEL_58:

  return v50;
}

uint64_t __84__ENExposureCalculationSession_exposureWindowsForMatchedAdvertisements_key_options___block_invoke(uint64_t result, uint64_t a2, unsigned int a3)
{
  ++*(void *)(*(void *)(result + 32) + 88);
  if (a3)
  {
    uint64_t v3 = a3;
    int v4 = (uint64_t *)(a2 + 4);
    do
    {
      uint64_t v8 = *v4;
      int v9 = *((_DWORD *)v4 + 2);
      uint64_t v5 = *(void *)(result + 32);
      uint64_t v6 = *(unsigned int *)(v5 + 48);
      if (v6 >= *(_DWORD *)(v5 + 20))
      {
        ++*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24);
      }
      else
      {
        uint64_t v7 = *(void *)(v5 + 40) + 16 * v6;
        *(_DWORD *)uint64_t v7 = *(_DWORD *)(result + 48);
        *(void *)(v7 + 4) = v8;
        *(_DWORD *)(v7 + 12) = v9;
        ++*(_DWORD *)(*(void *)(result + 32) + 48);
      }
      v4 += 2;
      --v3;
    }
    while (v3);
  }
  return result;
}

- (BOOL)_shouldMatchKey:(id)a3
{
  int v4 = [a3 diagnosisReportType];
  if (v4 == 5) {
    return 0;
  }
  if (v4 == 4) {
    return self->_allowRecursiveReportType;
  }
  return 1;
}

- (void)enumerateCachedExposureWindows:(id)a3 inRange:(_NSRange)a4 withBatchSize:(unsigned int)a5
{
}

- (void)enumerateCachedExposureWindows:(id)a3 inRange:(_NSRange)a4 withBatchSize:(unsigned int)a5 options:(int64_t)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v12 = (void (**)(id, id, void))a3;
  unint64_t cachedExposureWindowCount = self->_cachedExposureWindowCount;
  if (location + length <= cachedExposureWindowCount)
  {
    NSUInteger v40 = location + length;
    NSUInteger v41 = v12;
    if ((a6 & 2) != 0) {
      double v14 = INFINITY;
    }
    else {
      double v14 = 1800.0;
    }
    if ((a6 & 2) != 0) {
      unint64_t cachedExposureWindowCount = self->_cachedExposureWindowMetadataCount;
    }
    unsigned int v43 = a5;
    unint64_t v39 = cachedExposureWindowCount;
    SEL v37 = a2;
    if (location)
    {
      NSUInteger v15 = 0;
      unint64_t v16 = 0;
      scanInstanceBuffer = self->_scanInstanceBuffer;
      uint64_t v18 = *(void *)&scanInstanceBuffer->var1;
      unsigned __int8 v45 = scanInstanceBuffer;
      uint64_t v19 = *(void *)&scanInstanceBuffer->var0;
      uint64_t v20 = HIDWORD(*(void *)&scanInstanceBuffer->var0);
      do
      {
        double v21 = (uint64_t *)((char *)v45 + 16 * v16);
        unint64_t v23 = *v21;
        uint64_t v22 = v21[1];
        if (scanInstancesInDifferentWindows(v19 | (v20 << 32), v18, *v21, v22, v14))
        {
          uint64_t v19 = v23;
          uint64_t v20 = HIDWORD(v23);
          ++v15;
          uint64_t v18 = v22;
        }
        if (v15 != location) {
          ++v16;
        }
      }
      while (v15 < location);
    }
    else
    {
      unint64_t v16 = 0;
    }
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
    if (location < v40)
    {
      unint64_t v38 = v43;
      do
      {
        context = (void *)MEMORY[0x1D9439DC0]();
        NSUInteger v44 = location + v38;
        if (location + v38 <= v39) {
          unint64_t v25 = v38;
        }
        else {
          unint64_t v25 = v39 - location;
        }
        if ([v24 count] >= v25)
        {
          unint64_t v26 = v16;
        }
        else
        {
          unint64_t v26 = v16;
          unint64_t v46 = v25;
          do
          {
            double v27 = self->_scanInstanceBuffer;
            double v28 = (uint64_t *)((char *)v27 + 16 * v16);
            uint64_t v29 = *v28;
            unint64_t cachedScanInstanceCount = self->_cachedScanInstanceCount;
            if (v16 < cachedScanInstanceCount)
            {
              int64_t v31 = a6;
              uint64_t v32 = v28[1];
              unsigned __int16 v33 = v28 + 1;
              unint64_t v26 = v16;
              while (!scanInstancesInDifferentWindows(v29, v32, *(v33 - 1), *v33, v14))
              {
                v33 += 2;
                if (cachedScanInstanceCount == ++v26)
                {
                  unint64_t v26 = cachedScanInstanceCount;
                  break;
                }
              }
              a6 = v31;
              unint64_t v25 = v46;
            }
            if (self->_cachedExposureWindowMetadataCount <= v29)
            {
              uint64_t v36 = [MEMORY[0x1E4F28B08] currentHandler];
              [v36 handleFailureInMethod:v37, self, @"ENExposureCalculationSession.m", 967, @"Invalid parameter not satisfying: %@", @"metadataIndex < _cachedExposureWindowMetadataCount" object file lineNumber description];

              unint64_t v25 = v46;
              double v27 = self->_scanInstanceBuffer;
            }
            uint64_t v34 = &self->_exposureWindowMetadataBuffer[v29];
            long long v47 = *(_OWORD *)&v34->var0;
            uint64_t v48 = *(void *)&v34->var2;
            id v35 = exposureWindowsForScanInstances((uint64_t *)v27 + 2 * v16, (unsigned __int16)(v26 - v16), &v47, (a6 & 1) == 0, self->_exposureConfiguration, v14);
            [v24 addObjectsFromArray:v35];

            unint64_t v16 = v26;
          }
          while ([v24 count] < v25);
        }
        v41[2](v41, v24, 0);
        [v24 removeAllObjects];
        NSUInteger location = v44;
        unint64_t v16 = v26;
      }
      while (v44 < v40);
    }

    uint64_t v12 = v41;
  }
}

- (id)groupExposureWindowsByDay:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [MEMORY[0x1E4F1C9A0] calendarWithIdentifier:*MEMORY[0x1E4F1C310]];
  unint64_t v23 = [MEMORY[0x1E4F1CAE8] timeZoneForSecondsFromGMT:0];
  objc_msgSend(v4, "setTimeZone:");
  uint64_t v5 = [MEMORY[0x1E4F1C9C0] date];
  id v24 = v4;
  uint64_t v6 = [v4 startOfDayForDate:v5];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
  uint64_t v8 = 7;
  do
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
    [v7 addObject:v9];

    --v8;
  }
  while (v8);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v3;
  uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(obj);
        }
        double v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        NSUInteger v15 = [v14 date];
        [v6 timeIntervalSinceDate:v15];
        int64_t v17 = (unint64_t)v16 / 0x15180;

        uint64_t v18 = 0;
        do
        {
          uint64_t v19 = v18 + 1;
          BOOL v20 = v17 < qword_1D3A7B320[v18] || v18 == 6;
          ++v18;
        }
        while (!v20);
        double v21 = [v7 objectAtIndex:v19 - 1];
        [v21 addObject:v14];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }

  return v7;
}

- (id)groupExposureWindowsByInfectiousness:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
  uint64_t v5 = 3;
  do
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
    [v4 addObject:v6];

    --v5;
  }
  while (v5);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = 0;
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        while (qword_1D3A7B358[v12] < (unint64_t)objc_msgSend(v13, "infectiousness", (void)v16))
        {
          if (++v12 == 3)
          {
            uint64_t v12 = 0;
            break;
          }
        }
        double v14 = [v4 objectAtIndex:v12];
        [v14 addObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v4;
}

- (id)attenuationDurationMapDataForExposureWindows:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v32 + 1) + 8 * i) scanInstances];
        [v4 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v7);
  }

  memset(v37, 0, sizeof(v37));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = 0;
        long long v17 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        do
        {
          uint64_t v18 = v16 * 8 + 8;
          if (qword_1D3A7B370[v16] >= (unint64_t)objc_msgSend(v17, "typicalAttenuation", (void)v28))break; {
        }
          }
        while (v16++ != 7);
        *(void *)&v36[v18 + 120] += [v17 secondsSinceLastScan];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v13);
  }

  BOOL v20 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
  uint64_t v21 = 0;
  uint64_t v22 = v20;
  do
  {
    uint64_t v23 = 0;
    unint64_t v24 = *((void *)v37 + v21);
    double v25 = (double)v24;
    while (!v24 || dbl_1D3A7B3B0[v23] < v25)
    {
      if (++v23 == 8) {
        goto LABEL_26;
      }
    }
    v22[v23] = 1;
LABEL_26:
    ++v21;
    v22 += 8;
  }
  while (v21 != 8);
  long long v26 = objc_msgSend(MEMORY[0x1E4F1C9B0], "dataWithBytesNoCopy:length:", v20, 64, v25);

  return v26;
}

- (id)cachedExposuresDifferentialPrivacyRiskParameters
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x3032000000;
  long long v29 = __Block_byref_object_copy__8;
  long long v30 = __Block_byref_object_dispose__8;
  id v31 = 0;
  unint64_t cachedExposureWindowCount = self->_cachedExposureWindowCount;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __80__ENExposureCalculationSession_cachedExposuresDifferentialPrivacyRiskParameters__block_invoke;
  v25[3] = &unk_1E69AE588;
  v25[4] = &v26;
  -[ENExposureCalculationSession enumerateCachedExposureWindows:inRange:withBatchSize:options:](self, "enumerateCachedExposureWindows:inRange:withBatchSize:options:", v25, 0, cachedExposureWindowCount, cachedExposureWindowCount, 3);
  id v4 = [(ENExposureCalculationSession *)self groupExposureWindowsByDay:v27[5]];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA50]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [(ENExposureCalculationSession *)self groupExposureWindowsByInfectiousness:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v32 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v18 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = [(ENExposureCalculationSession *)self attenuationDurationMapDataForExposureWindows:*(void *)(*((void *)&v17 + 1) + 8 * j)];
              [v5 appendData:v14];
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v32 count:16];
          }
          while (v11);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(&v26, 8);

  return v5;
}

uint64_t __80__ENExposureCalculationSession_cachedExposuresDifferentialPrivacyRiskParameters__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return MEMORY[0x1F41817F8](v3, v5);
}

- (unsigned)droppedScanInstanceCount
{
  return self->_droppedScanInstanceCount;
}

- (BOOL)allowRecursiveReportType
{
  return self->_allowRecursiveReportType;
}

- (void)setAllowRecursiveReportType:(BOOL)a3
{
  self->_allowRecursiveReportType = a3;
}

- (ENExposureConfiguration)exposureConfiguration
{
  return self->_exposureConfiguration;
}

- (NSNumber)allowedRPIBroadcastDuration
{
  return self->_allowedRPIBroadcastDuration;
}

- (void)setAllowedRPIBroadcastDuration:(id)a3
{
}

- (NSNumber)advertisementSampleCountThreshold
{
  return self->_advertisementSampleCountThreshold;
}

- (void)setAdvertisementSampleCountThreshold:(id)a3
{
}

- (BOOL)cacheExposureInfo
{
  return self->_cacheExposureInfo;
}

- (void)setCacheExposureInfo:(BOOL)a3
{
  self->_cacheExposureInfo = a3;
}

- (BOOL)cacheExposureWindows
{
  return self->_cacheExposureWindows;
}

- (void)setCacheExposureWindows:(BOOL)a3
{
  self->_cacheExposureWindows = a3;
}

- (unint64_t)cachedExposureWindowCount
{
  return self->_cachedExposureWindowCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisementSampleCountThreshold, 0);
  objc_storeStrong((id *)&self->_allowedRPIBroadcastDuration, 0);
  objc_storeStrong((id *)&self->_exposureConfiguration, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end