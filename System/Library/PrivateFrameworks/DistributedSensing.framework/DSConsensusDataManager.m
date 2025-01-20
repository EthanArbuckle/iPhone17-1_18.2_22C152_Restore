@interface DSConsensusDataManager
- (DSConsensusDataManager)initWithWindowOfInterest:(double)a3;
- (NSMutableArray)consensusDataArray;
- (NSMutableDictionary)consensusDataArrayMap;
- (NSMutableDictionary)consensusFrequencyTable;
- (void)_addDatumToFrequencyTable:(id)a3;
- (void)_addDatumtoDataArrayMap:(id)a3;
- (void)_evictOldestDatum;
- (void)_removeDatumFromDataArrayMap:(id)a3;
- (void)_removeDatumFromFrequencyTable:(id)a3;
- (void)addDatum:(id)a3;
- (void)printConsensusData;
- (void)printConsensusDataFromWindowStart:(double)a3 ToWindowEnd:(double)a4;
- (void)setConsensusDataArray:(id)a3;
- (void)setConsensusDataArrayMap:(id)a3;
- (void)setConsensusFrequencyTable:(id)a3;
@end

@implementation DSConsensusDataManager

- (DSConsensusDataManager)initWithWindowOfInterest:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DSConsensusDataManager;
  v4 = [(DSConsensusDataManager *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_windowOfInterest = a3;
    v6 = v4;
  }

  return v5;
}

- (void)_evictOldestDatum
{
  if ([(NSMutableArray *)self->_consensusDataArray count])
  {
    while (1)
    {
      id v9 = [(NSMutableArray *)self->_consensusDataArray objectAtIndexedSubscript:0];
      v3 = [MEMORY[0x263EFF910] date];
      [v3 timeIntervalSince1970];
      double v5 = v4;
      v6 = [v9 time];
      [v6 timeIntervalSince1970];
      double v8 = v5 - v7;

      if (v8 <= self->_windowOfInterest) {
        break;
      }
      [(NSMutableArray *)self->_consensusDataArray removeObjectAtIndex:0];
      [(DSConsensusDataManager *)self _removeDatumFromFrequencyTable:v9];
      [(DSConsensusDataManager *)self _removeDatumFromDataArrayMap:v9];

      if (![(NSMutableArray *)self->_consensusDataArray count]) {
        return;
      }
    }
  }
}

- (void)addDatum:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(DSConsensusDataManager *)self _evictOldestDatum];
  if ((unint64_t)[(NSMutableArray *)self->_consensusDataArray count] < 0x64)
  {
    double v8 = [v4 identifier];

    if (v8)
    {
      consensusDataArray = self->_consensusDataArray;
      if (!consensusDataArray)
      {
        v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        v11 = self->_consensusDataArray;
        self->_consensusDataArray = v10;

        consensusDataArray = self->_consensusDataArray;
      }
      [(NSMutableArray *)consensusDataArray addObject:v4];
      [(DSConsensusDataManager *)self _addDatumToFrequencyTable:v4];
      [(DSConsensusDataManager *)self _addDatumtoDataArrayMap:v4];
    }
  }
  else
  {
    if (onceTokenDSConsensus_0 != -1) {
      dispatch_once(&onceTokenDSConsensus_0, &__block_literal_global_6);
    }
    double v5 = (void *)logObjDSConsensus_0;
    if (os_log_type_enabled((os_log_t)logObjDSConsensus_0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_consensusDataArray;
      double v7 = v5;
      int v12 = 134217984;
      uint64_t v13 = [(NSMutableArray *)v6 count];
      _os_log_impl(&dword_223BD6000, v7, OS_LOG_TYPE_DEFAULT, "consensus data array at its maximum capacity: %lu", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)_addDatumtoDataArrayMap:(id)a3
{
  id v4 = a3;
  consensusDataArrayMap = self->_consensusDataArrayMap;
  id v16 = v4;
  if (!consensusDataArrayMap)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    double v7 = self->_consensusDataArrayMap;
    self->_consensusDataArrayMap = v6;

    id v4 = v16;
    consensusDataArrayMap = self->_consensusDataArrayMap;
  }
  double v8 = [v4 identifier];
  id v9 = [(NSMutableDictionary *)consensusDataArrayMap objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    v11 = self->_consensusDataArrayMap;
    int v12 = [v16 identifier];
    [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v12];
  }
  uint64_t v13 = self->_consensusDataArrayMap;
  uint64_t v14 = [v16 identifier];
  v15 = [(NSMutableDictionary *)v13 objectForKeyedSubscript:v14];
  [v15 addObject:v16];
}

- (void)_removeDatumFromDataArrayMap:(id)a3
{
  id v9 = a3;
  id v4 = [v9 identifier];
  double v5 = [(NSMutableDictionary *)self->_consensusDataArrayMap objectForKeyedSubscript:v4];

  if (v5)
  {
    v6 = [(NSMutableDictionary *)self->_consensusDataArrayMap objectForKeyedSubscript:v4];
    [v6 removeObject:v9];

    double v7 = [(NSMutableDictionary *)self->_consensusDataArrayMap objectForKeyedSubscript:v4];
    uint64_t v8 = [v7 count];

    if (!v8) {
      [(NSMutableDictionary *)self->_consensusDataArrayMap setObject:0 forKeyedSubscript:v4];
    }
  }
}

- (void)_addDatumToFrequencyTable:(id)a3
{
  id v13 = a3;
  if (!self->_consensusFrequencyTable)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    consensusFrequencyTable = self->_consensusFrequencyTable;
    self->_consensusFrequencyTable = v4;
  }
  id v6 = [NSString alloc];
  int v7 = [v13 confidence];
  if (v7 <= 6)
  {
    if (!v7)
    {
      uint64_t v8 = "lowest";
      goto LABEL_15;
    }
    if (v7 == 4)
    {
      uint64_t v8 = "low-medium";
      goto LABEL_15;
    }
  }
  else
  {
    switch(v7)
    {
      case 7:
        uint64_t v8 = "medium";
        goto LABEL_15;
      case 11:
        uint64_t v8 = "medium-high";
        goto LABEL_15;
      case 15:
        uint64_t v8 = "highest";
        goto LABEL_15;
    }
  }
  uint64_t v8 = "?";
LABEL_15:
  id v9 = (void *)[v6 initWithUTF8String:v8];
  if (v9)
  {
    id v10 = [(NSMutableDictionary *)self->_consensusFrequencyTable objectForKeyedSubscript:v9];

    if (!v10)
    {
      id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
      [(NSMutableDictionary *)self->_consensusFrequencyTable setObject:v11 forKeyedSubscript:v9];
    }
    int v12 = [(NSMutableDictionary *)self->_consensusFrequencyTable objectForKeyedSubscript:v9];
    [v12 addObject:v13];
  }
}

- (void)_removeDatumFromFrequencyTable:(id)a3
{
  id v12 = a3;
  id v4 = [NSString alloc];
  int v5 = [v12 confidence];
  if (v5 <= 6)
  {
    if (!v5)
    {
      id v6 = "lowest";
      goto LABEL_13;
    }
    if (v5 == 4)
    {
      id v6 = "low-medium";
      goto LABEL_13;
    }
LABEL_12:
    id v6 = "?";
    goto LABEL_13;
  }
  if (v5 == 7)
  {
    id v6 = "medium";
    goto LABEL_13;
  }
  if (v5 == 11)
  {
    id v6 = "medium-high";
    goto LABEL_13;
  }
  if (v5 != 15) {
    goto LABEL_12;
  }
  id v6 = "highest";
LABEL_13:
  int v7 = (void *)[v4 initWithUTF8String:v6];
  if (v7)
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_consensusFrequencyTable objectForKeyedSubscript:v7];

    if (v8)
    {
      id v9 = [(NSMutableDictionary *)self->_consensusFrequencyTable objectForKeyedSubscript:v7];
      [v9 removeObject:v12];

      id v10 = [(NSMutableDictionary *)self->_consensusFrequencyTable objectForKeyedSubscript:v7];
      uint64_t v11 = [v10 count];

      if (!v11) {
        [(NSMutableDictionary *)self->_consensusFrequencyTable setObject:0 forKeyedSubscript:v7];
      }
    }
  }
}

- (void)printConsensusData
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_consensusDataArray;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "printInfo", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)printConsensusDataFromWindowStart:(double)a3 ToWindowEnd:(double)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  double v7 = a4 - a3;
  if (v7 > 0.0 && v7 <= self->_windowOfInterest)
  {
    if (onceTokenDSConsensus_0 != -1) {
      dispatch_once(&onceTokenDSConsensus_0, &__block_literal_global_6);
    }
    long long v10 = logObjDSConsensus_0;
    if (os_log_type_enabled((os_log_t)logObjDSConsensus_0, OS_LOG_TYPE_ERROR))
    {
      double windowOfInterest = self->_windowOfInterest;
      *(_DWORD *)buf = 134218496;
      double v30 = a3;
      __int16 v31 = 2048;
      double v32 = a4;
      __int16 v33 = 2048;
      double v34 = windowOfInterest;
      _os_log_impl(&dword_223BD6000, v10, OS_LOG_TYPE_ERROR, "window start: %f and end: %f. Configured window of interest: %f", buf, 0x20u);
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v12 = self->_consensusDataArray;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v18 = objc_msgSend(MEMORY[0x263EFF910], "date", (void)v24);
          [v18 timeIntervalSince1970];
          double v20 = v19;
          v21 = [v17 time];
          [v21 timeIntervalSince1970];
          double v23 = v20 - v22;

          if (v23 >= a3)
          {
            if (v23 > a4) {
              goto LABEL_21;
            }
            [v17 printInfo];
          }
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v14);
    }
LABEL_21:
  }
  else
  {
    if (onceTokenDSConsensus_0 != -1) {
      dispatch_once(&onceTokenDSConsensus_0, &__block_literal_global_6);
    }
    long long v8 = logObjDSConsensus_0;
    if (os_log_type_enabled((os_log_t)logObjDSConsensus_0, OS_LOG_TYPE_ERROR))
    {
      double v9 = self->_windowOfInterest;
      *(_DWORD *)buf = 134218496;
      double v30 = a3;
      __int16 v31 = 2048;
      double v32 = a4;
      __int16 v33 = 2048;
      double v34 = v9;
      _os_log_impl(&dword_223BD6000, v8, OS_LOG_TYPE_ERROR, "Invalid window start: %f and end: %f. Configured window of interest: %f", buf, 0x20u);
    }
  }
}

- (NSMutableDictionary)consensusDataArrayMap
{
  return self->_consensusDataArrayMap;
}

- (void)setConsensusDataArrayMap:(id)a3
{
}

- (NSMutableArray)consensusDataArray
{
  return self->_consensusDataArray;
}

- (void)setConsensusDataArray:(id)a3
{
}

- (NSMutableDictionary)consensusFrequencyTable
{
  return self->_consensusFrequencyTable;
}

- (void)setConsensusFrequencyTable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consensusFrequencyTable, 0);
  objc_storeStrong((id *)&self->_consensusDataArray, 0);
  objc_storeStrong((id *)&self->_consensusDataArrayMap, 0);
}

@end