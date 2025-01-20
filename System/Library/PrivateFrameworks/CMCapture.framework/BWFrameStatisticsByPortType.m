@interface BWFrameStatisticsByPortType
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BWFrameStatisticsByPortType)init;
- (BWFrameStatisticsByPortType)initWithCoder:(id)a3;
- (BWFrameStatisticsByPortType)initWithPortTypes:(id)a3;
- (BWFrameStatisticsByPortType)initWithPortTypes:(id)a3 autoFocusRecommendedMasterPortTypeEnabled:(BOOL)a4;
- (NSArray)portTypes;
- (float)adrcExposureRealizedGain;
- (id)description;
- (id)objectForKeyedSubscript:(id)a3;
- (uint64_t)_updateAutoFocusRecommendedMasterPortTypeWithFrameMetadata:(uint64_t)result;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)frameCount;
- (unint64_t)hash;
- (void)_setFrameCount:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)updateWithFrameMetadata:(id)a3 updateFocusDistance:(BOOL)a4;
@end

@implementation BWFrameStatisticsByPortType

- (void)updateWithFrameMetadata:(id)a3 updateFocusDistance:(BOOL)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v4 = a4;
    memset(&v23, 0, sizeof(v23));
    CMTimeMakeFromDictionary(&v23, (CFDictionaryRef)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]]);
    id v7 = -[NSDictionary objectForKeyedSubscript:](self->_portTypeToFrameStatistics, "objectForKeyedSubscript:", [a3 objectForKeyedSubscript:*MEMORY[0x1E4F54128]]);
    CMTime v22 = v23;
    fs_updateFrameStatisticsWithFrameMetadata(v7, a3, (long long *)&v22.value, v4);
    v8 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F54300]];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      uint64_t v12 = *MEMORY[0x1E4F52E00];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (([v14 isEqualToString:v12] & 1) == 0)
          {
            id v15 = [(NSDictionary *)self->_portTypeToFrameStatistics objectForKeyedSubscript:v14];
            v16 = (void *)[v8 objectForKeyedSubscript:v14];
            CMTime v22 = v23;
            fs_updateFrameStatisticsWithFrameMetadata(v15, v16, (long long *)&v22.value, v4);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v10);
    }
    if (self->_autoFocusRecommendedMasterPortTypeEnabled)
    {
      if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F542E0]), "BOOLValue"))-[BWFrameStatisticsByPortType _updateAutoFocusRecommendedMasterPortTypeWithFrameMetadata:]((uint64_t)self, a3); {
    }
      }
    ++self->_frameCount;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"ADRCExposureRealizedGain"), "floatValue");
    self->_adrcExposureRealizedGain = v17;
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  NSUInteger v5 = [(NSDictionary *)self->_portTypeToFrameStatistics count];
  if (v5 == [*((id *)a3 + 2) count])
  {
    memcpy(*((void **)a3 + 3), self->_frameStatisticsStoragesForPortTypes, 248 * v5);
    *((void *)a3 + 4) = self->_frameCount;
    *((unsigned char *)a3 + 44) = self->_autoFocusRecommendedMasterPortTypeEnabled;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    portTypes = self->_portTypes;
    uint64_t v7 = [(NSArray *)portTypes countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(portTypes);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          id v12 = [(NSDictionary *)self->_portTypeToFrameStatistics objectForKeyedSubscript:v11];
          v13 = (void *)[*((id *)a3 + 2) objectForKeyedSubscript:v11];
          objc_msgSend(v13, "_setAEStatistics:", objc_msgSend(v12, "aeStatistics"));
          objc_msgSend(v13, "_setDisplayStrobeRGBEstimate:", objc_msgSend(v12, "displayStrobeRGBEstimate"));
          objc_msgSend(v13, "_setColorCorrectionMatrix:", objc_msgSend(v12, "colorCorrectionMatrix"));
        }
        uint64_t v8 = [(NSArray *)portTypes countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (uint64_t)_updateAutoFocusRecommendedMasterPortTypeWithFrameMetadata:(uint64_t)result
{
  v17[5] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F53CE0]];
    if (!v4) {
      uint64_t v4 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    }
    if (_NSIsNSCFConstantString()) {
      goto LABEL_17;
    }
    uint64_t v5 = *MEMORY[0x1E4F52DF0];
    v17[0] = *MEMORY[0x1E4F52DD8];
    v17[1] = v5;
    uint64_t v6 = *MEMORY[0x1E4F52DF8];
    v17[2] = *MEMORY[0x1E4F52DE8];
    v17[3] = v6;
    v17[4] = *MEMORY[0x1E4F52E10];
    uint64_t v7 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];
    result = [v7 indexOfObject:v4];
    if (result != 0x7FFFFFFFFFFFFFFFLL)
    {
      result = [v7 objectAtIndexedSubscript:result];
      uint64_t v4 = result;
      if (result)
      {
LABEL_17:
        result = [*(id *)(v3 + 16) objectForKeyedSubscript:v4];
        if (result)
        {
          long long v14 = 0u;
          long long v15 = 0u;
          long long v12 = 0u;
          long long v13 = 0u;
          uint64_t v8 = *(void **)(v3 + 16);
          result = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (result)
          {
            uint64_t v9 = result;
            uint64_t v10 = *(void *)v13;
            do
            {
              uint64_t v11 = 0;
              do
              {
                if (*(void *)v13 != v10) {
                  objc_enumerationMutation(v8);
                }
                *(void *)(objc_msgSend((id)objc_msgSend(*(id *)(v3 + 16), "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * v11++)), "frameStatisticsStorage")+ 200) = v4;
              }
              while (v9 != v11);
              result = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
              uint64_t v9 = result;
            }
            while (result);
          }
        }
      }
    }
  }
  return result;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return [(NSDictionary *)self->_portTypeToFrameStatistics objectForKeyedSubscript:a3];
}

- (BWFrameStatisticsByPortType)initWithPortTypes:(id)a3 autoFocusRecommendedMasterPortTypeEnabled:(BOOL)a4
{
  v13.receiver = self;
  v13.super_class = (Class)BWFrameStatisticsByPortType;
  uint64_t v6 = [(BWFrameStatisticsByPortType *)&v13 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a3, "count"));
    uint64_t v8 = ($CDAAB53AF0D0843407507AB6EB17E647 *)malloc_type_calloc([a3 count], 0xF8uLL, 0x1080040A456596DuLL);
    if ([a3 count])
    {
      unint64_t v9 = 0;
      uint64_t v10 = (uint64_t)v8;
      do
      {
        uint64_t v11 = -[BWFrameStatistics initWthPortType:storage:]([BWFrameStatistics alloc], (void *)[a3 objectAtIndexedSubscript:v9], v10);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, objc_msgSend(a3, "objectAtIndexedSubscript:", v9));

        ++v9;
        v10 += 248;
      }
      while ([a3 count] > v9);
    }
    v6->_portTypes = (NSArray *)a3;
    v6->_portTypeToFrameStatistics = (NSDictionary *)[v7 copy];
    v6->_frameStatisticsStoragesForPortTypes = v8;
    v6->_autoFocusRecommendedMasterPortTypeEnabled = a4;
  }
  return v6;
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSDictionary *)self->_portTypeToFrameStatistics countByEnumeratingWithState:a3 objects:a4 count:a5];
}

+ (void)initialize
{
}

- (BWFrameStatisticsByPortType)init
{
  return 0;
}

- (BWFrameStatisticsByPortType)initWithPortTypes:(id)a3
{
  return [(BWFrameStatisticsByPortType *)self initWithPortTypes:a3 autoFocusRecommendedMasterPortTypeEnabled:0];
}

- (void)dealloc
{
  free(self->_frameStatisticsStoragesForPortTypes);
  v3.receiver = self;
  v3.super_class = (Class)BWFrameStatisticsByPortType;
  [(BWFrameStatisticsByPortType *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && self->_frameCount == *((void *)a3 + 4)
      && self->_adrcExposureRealizedGain == *((float *)a3 + 10)
      && self->_autoFocusRecommendedMasterPortTypeEnabled == *((unsigned __int8 *)a3 + 44)
      && (size_t v5 = 248 * [(NSDictionary *)self->_portTypeToFrameStatistics count],
          v5 == 248 * [*((id *)a3 + 2) count]))
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      portTypeToFrameStatistics = self->_portTypeToFrameStatistics;
      uint64_t v7 = [(NSDictionary *)portTypeToFrameStatistics countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v19;
LABEL_9:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(portTypeToFrameStatistics);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
          uint64_t v12 = [*((id *)a3 + 2) objectForKeyedSubscript:v11];
          if (!v12) {
            break;
          }
          objc_super v13 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_portTypeToFrameStatistics, "objectForKeyedSubscript:", v11), "aeStatistics");
          uint64_t v14 = objc_msgSend((id)objc_msgSend(*((id *)a3 + 2), "objectForKeyedSubscript:", v11), "aeStatistics");
          if (v13 != (void *)v14)
          {
            LODWORD(v12) = [v13 isEqualToDictionary:v14];
            if (!v12) {
              break;
            }
          }
          long long v15 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_portTypeToFrameStatistics, "objectForKeyedSubscript:", v11), "displayStrobeRGBEstimate");
          uint64_t v16 = objc_msgSend((id)objc_msgSend(*((id *)a3 + 2), "objectForKeyedSubscript:", v11), "displayStrobeRGBEstimate");
          if (v15 != (void *)v16)
          {
            LODWORD(v12) = [v15 isEqualToArray:v16];
            if (!v12) {
              break;
            }
          }
          if (v8 == ++v10)
          {
            uint64_t v8 = [(NSDictionary *)portTypeToFrameStatistics countByEnumeratingWithState:&v18 objects:v22 count:16];
            if (v8) {
              goto LABEL_9;
            }
            goto LABEL_19;
          }
        }
      }
      else
      {
LABEL_19:
        LOBYTE(v12) = memcmp(self->_frameStatisticsStoragesForPortTypes, *((const void **)a3 + 3), v5) == 0;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_portTypeToFrameStatistics hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWFrameStatisticsByPortType)initWithCoder:(id)a3
{
  v34[2] = *MEMORY[0x1E4F143B8];
  size_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  uint64_t v6 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v34, 2)), @"portTypes");
  size_t __n = 0;
  uint64_t v7 = (const void *)[a3 decodeBytesForKey:@"frameStatisticsStoragesForPortTypes" returnedLength:&__n];
  size_t v8 = __n;
  if (v8 == 248 * [v6 count])
  {
    uint64_t v9 = [(BWFrameStatisticsByPortType *)self initWithPortTypes:v6];
    uint64_t v10 = v9;
    if (v9)
    {
      memcpy(v9->_frameStatisticsStoragesForPortTypes, v7, __n);
      v10->_frameCount = [a3 decodeInt64ForKey:@"frameCount"];
      [a3 decodeFloatForKey:@"adrcExposureRealizedGain"];
      v10->_adrcExposureRealizedGain = v11;
      v10->_autoFocusRecommendedMasterPortTypeEnabled = [a3 decodeBoolForKey:@"AFRecommendedMasterPortTypeEnabled"];
      uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
      v33[0] = objc_opt_class();
      v33[1] = objc_opt_class();
      v33[2] = objc_opt_class();
      v33[3] = objc_opt_class();
      v33[4] = objc_opt_class();
      objc_super v13 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v12, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v33, 5)), @"AEStatisticsByPortType");
      uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
      v32[0] = objc_opt_class();
      v32[1] = objc_opt_class();
      v32[2] = objc_opt_class();
      v32[3] = objc_opt_class();
      long long v15 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v32, 4)), @"DisplayStrobeRGBEstimateByPortType");
      uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
      v31[0] = objc_opt_class();
      v31[1] = objc_opt_class();
      v31[2] = objc_opt_class();
      long long v17 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v16, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v31, 3)), @"ColorCorrectionMatrixByPortType");
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      portTypeToFrameStatistics = v10->_portTypeToFrameStatistics;
      uint64_t v19 = [(NSDictionary *)portTypeToFrameStatistics countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v26 != v21) {
              objc_enumerationMutation(portTypeToFrameStatistics);
            }
            uint64_t v23 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v10->_portTypeToFrameStatistics, "objectForKeyedSubscript:", v23), "_setAEStatistics:", objc_msgSend(v13, "objectForKeyedSubscript:", v23));
            objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v10->_portTypeToFrameStatistics, "objectForKeyedSubscript:", v23), "_setDisplayStrobeRGBEstimate:", objc_msgSend(v15, "objectForKeyedSubscript:", v23));
            objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v10->_portTypeToFrameStatistics, "objectForKeyedSubscript:", v23), "_setColorCorrectionMatrix:", objc_msgSend(v17, "objectForKeyedSubscript:", v23));
          }
          uint64_t v20 = [(NSDictionary *)portTypeToFrameStatistics countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v20);
      }
    }
  }
  else
  {

    return 0;
  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [a3 encodeObject:self->_portTypes forKey:@"portTypes"];
  objc_msgSend(a3, "encodeBytes:length:forKey:", self->_frameStatisticsStoragesForPortTypes, 248 * -[NSDictionary count](self->_portTypeToFrameStatistics, "count"), @"frameStatisticsStoragesForPortTypes");
  [a3 encodeInt64:self->_frameCount forKey:@"frameCount"];
  *(float *)&double v5 = self->_adrcExposureRealizedGain;
  [a3 encodeFloat:@"adrcExposureRealizedGain" forKey:v5];
  [a3 encodeBool:self->_autoFocusRecommendedMasterPortTypeEnabled forKey:@"AFRecommendedMasterPortTypeEnabled"];
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  size_t v8 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  portTypeToFrameStatistics = self->_portTypeToFrameStatistics;
  uint64_t v10 = [(NSDictionary *)portTypeToFrameStatistics countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(portTypeToFrameStatistics);
        }
        uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_portTypeToFrameStatistics, "objectForKeyedSubscript:", v14), "aeStatistics"), v14);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_portTypeToFrameStatistics, "objectForKeyedSubscript:", v14), "displayStrobeRGBEstimate"), v14);
        objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_portTypeToFrameStatistics, "objectForKeyedSubscript:", v14), "colorCorrectionMatrix"), v14);
      }
      uint64_t v11 = [(NSDictionary *)portTypeToFrameStatistics countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
  if ([v6 count]) {
    [a3 encodeObject:v6 forKey:@"AEStatisticsByPortType"];
  }
  if ([v7 count]) {
    [a3 encodeObject:v7 forKey:@"DisplayStrobeRGBEstimateByPortType"];
  }
  if ([v8 count]) {
    [a3 encodeObject:v8 forKey:@"ColorCorrectionMatrixByPortType"];
  }
}

- (NSArray)portTypes
{
  return self->_portTypes;
}

- (void)_setFrameCount:(unint64_t)a3
{
  self->_frameCount = a3;
}

- (float)adrcExposureRealizedGain
{
  return self->_adrcExposureRealizedGain;
}

- (void)reset
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  bzero(self->_frameStatisticsStoragesForPortTypes, 248 * [(NSDictionary *)self->_portTypeToFrameStatistics count]);
  self->_frameCount = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  portTypeToFrameStatistics = self->_portTypeToFrameStatistics;
  uint64_t v4 = [(NSDictionary *)portTypeToFrameStatistics countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(portTypeToFrameStatistics);
        }
        -[BWFrameStatistics reset]((id *)[(NSDictionary *)self->_portTypeToFrameStatistics objectForKeyedSubscript:*(void *)(*((void *)&v8 + 1) + 8 * i)]);
      }
      uint64_t v5 = [(NSDictionary *)portTypeToFrameStatistics countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = (void *)[v3 stringWithFormat:@"<%@ : %p> Frame count: %lld\n", NSStringFromClass(v4), self, self->_frameCount];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  portTypeToFrameStatistics = self->_portTypeToFrameStatistics;
  uint64_t v7 = [(NSDictionary *)portTypeToFrameStatistics countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(portTypeToFrameStatistics);
        }
        [v5 appendFormat:@"%@\n", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_portTypeToFrameStatistics, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i)), "description")];
      }
      uint64_t v8 = [(NSDictionary *)portTypeToFrameStatistics countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  return v5;
}

@end