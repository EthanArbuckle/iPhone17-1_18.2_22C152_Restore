@interface PHImportResults
+ (PHImportResults)resultsWithException:(id)a3;
+ (PHImportResults)resultsWithExceptions:(id)a3;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSError)error;
- (NSMutableArray)importRecords;
- (NSMutableDictionary)pmrInfo;
- (NSString)uuid;
- (PHImportException)highestPriorityException;
- (PHImportResults)init;
- (PHImportSource)importSource;
- (double)runTime;
- (id)exceptions;
- (id)generatePMRInfo;
- (id)importRecordExceptions;
- (unint64_t)failedToImportCount;
- (unint64_t)importedCount;
- (unsigned)result;
- (void)addImportRecord:(id)a3;
- (void)addUnsupportedPath:(id)a3;
- (void)insertStart:(id)a3 end:(id)a4 intoGroups:(id)a5 ofType:(unint64_t)a6;
- (void)log:(id)a3 activity:(id)a4 description:(id)a5 digits:(unint64_t)a6;
- (void)logPMR;
- (void)setEndTime:(id)a3;
- (void)setImportRecords:(id)a3;
- (void)setPmrInfo:(id)a3;
- (void)setResult:(unsigned __int8)a3;
- (void)setStartTime:(id)a3;
- (void)setUuid:(id)a3;
- (void)verifyGroups:(id)a3;
@end

@implementation PHImportResults

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highestPriorityException, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_pmrInfo, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_importRecords, 0);

  objc_storeStrong((id *)&self->_importSource, 0);
}

- (PHImportException)highestPriorityException
{
  return (PHImportException *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPmrInfo:(id)a3
{
}

- (NSMutableDictionary)pmrInfo
{
  return self->_pmrInfo;
}

- (void)setEndTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setResult:(unsigned __int8)a3
{
  self->_result = a3;
}

- (void)setImportRecords:(id)a3
{
}

- (NSMutableArray)importRecords
{
  return self->_importRecords;
}

- (PHImportSource)importSource
{
  return (PHImportSource *)objc_getProperty(self, a2, 24, 1);
}

- (void)logPMR
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = PLImportGetLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

  if (v4)
  {
    v5 = [(PHImportResults *)self generatePMRInfo];
    v6 = [v5 objectForKeyedSubscript:@"ImportTotalTime"];
    v7 = [v6 objectForKeyedSubscript:@"Count"];
    uint64_t v8 = [v7 unsignedIntegerValue];

    if (v8)
    {
      LODWORD(v9) = 0;
      unint64_t v10 = v8;
      do
      {
        uint64_t v9 = (v9 + 1);
        BOOL v11 = v10 > 9;
        v10 /= 0xAuLL;
      }
      while (v11);
    }
    else
    {
      uint64_t v9 = 0;
    }
    v12 = [MEMORY[0x1E4F28E78] stringWithString:@"\n\n"];
    [v12 appendString:@"\t============================================================\n"];
    [v12 appendString:@"\t                    Import Performance                      \n"];
    [v12 appendString:@"\t============================================================\n"];
    v13 = [v5 objectForKeyedSubscript:@"ImportTotalTime"];
    v14 = [v13 objectForKeyedSubscript:@"Duration"];
    [v14 doubleValue];
    objc_msgSend(v12, "appendFormat:", @"\tTotal time to import %lu items: %8.4f\n", v8, v15);

    [v12 appendString:@"\t------------------------------------------------------------\n"];
    v16 = [v5 objectForKeyedSubscript:@"ImportDownload"];
    [(PHImportResults *)self log:v12 activity:v16 description:@"\tDownload files:           " digits:v9];

    v17 = [v5 objectForKeyedSubscript:@"ImportReadMetadata"];
    [(PHImportResults *)self log:v12 activity:v17 description:@"\tRead metadata:            " digits:v9];

    v18 = [v5 objectForKeyedSubscript:@"ImportAdjustments"];
    [(PHImportResults *)self log:v12 activity:v18 description:@"\tApply adjustments:        " digits:v9];

    v19 = [v5 objectForKeyedSubscript:@"ImportLivePhotoPairing"];
    [(PHImportResults *)self log:v12 activity:v19 description:@"\tPair LivePhotos:          " digits:v9];

    v20 = [v5 objectForKeyedSubscript:@"ImportMisc"];
    [(PHImportResults *)self log:v12 activity:v20 description:@"\tMiscellaneous processing: " digits:v9];

    [v12 appendString:@"\t============================================================\n"];
    v21 = PLImportGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v12;
      _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_DEBUG, "PMR %@", buf, 0xCu);
    }
  }
}

- (void)log:(id)a3 activity:(id)a4 description:(id)a5 digits:(unint64_t)a6
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = [v8 objectForKeyedSubscript:@"Count"];
  unint64_t v11 = [v10 unsignedIntegerValue];

  if (v11)
  {
    v12 = [v8 objectForKeyedSubscript:@"Duration"];
    [v12 doubleValue];
    double v14 = v13;

    [v18 appendFormat:@"%@%8.4f", v9, *(void *)&v14];
    uint64_t v15 = [v8 objectForKeyedSubscript:@"Absolute Duration"];
    [v15 doubleValue];
    double v17 = v16;

    if (v14 != v17) {
      [v18 appendFormat:@" (ab: %.3f, av: %.3f)", *(void *)&v17, v17 / (double)v11];
    }
    [v18 appendString:@"\n"];
  }
}

- (void)verifyGroups:(id)a3
{
  uint64_t v3 = 0;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  do
  {
    BOOL v4 = [a3 objectAtIndexedSubscript:v3];
    [v4 sortUsingComparator:&__block_literal_global_112_38158];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = 0;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          unint64_t v11 = v8;
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v5);
          }
          v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          double v13 = PLImportGetLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            double v14 = [(id)pmrKey objectAtIndexedSubscript:v3];
            *(_DWORD *)buf = 138412546;
            v26 = v14;
            __int16 v27 = 2112;
            v28 = v12;
            _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_INFO, "%@: created group: %@", buf, 0x16u);
          }
          if (v11)
          {
            uint64_t v15 = [v12 start];
            double v16 = [v11 end];
            [v15 timeIntervalSinceDate:v16];
            double v18 = v17;

            if (v18 < 0.0)
            {
              v19 = PLImportGetLog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v26 = v11;
                __int16 v27 = 2112;
                v28 = v12;
                _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "!!!!!!!!!!ERROR: Found a group (%@) which overlaps another group (%@)", buf, 0x16u);
              }
            }
          }
          id v8 = v12;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v7);
    }
    ++v3;
  }
  while (v3 != 17);
}

uint64_t __32__PHImportResults_verifyGroups___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 start];
  uint64_t v7 = [v5 start];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  if (v9 >= 0.0)
  {
    unint64_t v11 = [v4 start];
    v12 = [v5 start];
    [v11 timeIntervalSinceDate:v12];
    uint64_t v10 = v13 > 0.0;
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

- (void)insertStart:(id)a3 end:(id)a4 intoGroups:(id)a5 ofType:(unint64_t)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v12 = a5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v13)
  {
LABEL_13:

LABEL_22:
    uint64_t v15 = [[DurationGroup alloc] initWithStart:v10 end:v11];
    [v12 addObject:v15];
    goto LABEL_23;
  }
  uint64_t v14 = v13;
  uint64_t v15 = 0;
  uint64_t v16 = *(void *)v37;
LABEL_3:
  uint64_t v17 = 0;
  double v18 = v15;
  while (1)
  {
    if (*(void *)v37 != v16) {
      objc_enumerationMutation(v12);
    }
    uint64_t v15 = (DurationGroup *)*(id *)(*((void *)&v36 + 1) + 8 * v17);

    v19 = [(DurationGroup *)v15 start];
    [v10 timeIntervalSinceDate:v19];
    double v21 = v20;

    if (v21 < 0.0) {
      break;
    }
    v25 = [(DurationGroup *)v15 end];
    [v10 timeIntervalSinceDate:v25];
    double v27 = v26;

    if (v27 < 0.0)
    {
      v31 = [(DurationGroup *)v15 end];
      [v11 timeIntervalSinceDate:v31];
      double v33 = v32;

      if (v33 < 0.0) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }
LABEL_10:
    ++v17;
    double v18 = v15;
    if (v14 == v17)
    {
      uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v14) {
        goto LABEL_3;
      }

      goto LABEL_13;
    }
  }
  long long v22 = [(DurationGroup *)v15 start];
  [v11 timeIntervalSinceDate:v22];
  double v24 = v23;

  if (v24 < 0.0) {
    goto LABEL_10;
  }
  [(DurationGroup *)v15 setStart:v10];
  v28 = [(DurationGroup *)v15 end];
  [v11 timeIntervalSinceDate:v28];
  double v30 = v29;

  if (v30 >= 0.0) {
LABEL_17:
  }
    [(DurationGroup *)v15 setEnd:v11];
  [(DurationGroup *)v15 setWasChanged:1];
LABEL_19:

  if (!v15) {
    goto LABEL_22;
  }
  if ([(DurationGroup *)v15 wasChanged])
  {
    [v12 removeObject:v15];
    v34 = [(DurationGroup *)v15 start];
    v35 = [(DurationGroup *)v15 end];
    [(PHImportResults *)self insertStart:v34 end:v35 intoGroups:v12 ofType:a6];
  }
LABEL_23:
}

- (id)generatePMRInfo
{
  v2 = self;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  pmrInfo = self->_pmrInfo;
  if (!pmrInfo)
  {
    if (generatePMRInfo_onceToken != -1) {
      dispatch_once(&generatePMRInfo_onceToken, &__block_literal_global_38164);
    }
    uint64_t v71 = 0;
    memset(v70, 0, sizeof(v70));
    uint64_t v69 = 0;
    memset(v68, 0, sizeof(v68));
    id v4 = objc_opt_new();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v46 = v2;
    obuint64_t j = [(PHImportResults *)v2 importRecords];
    uint64_t v45 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
    if (v45)
    {
      uint64_t v44 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v55 != v44) {
            objc_enumerationMutation(obj);
          }
          unint64_t v6 = 0;
          uint64_t v7 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          do
          {
            if ([v4 count] <= v6)
            {
              double v8 = objc_opt_new();
              [v4 addObject:v8];
            }
            else
            {
              double v8 = [v4 objectAtIndexedSubscript:v6];
            }
            double v9 = [v7 timers];
            [v9 duration:v6];
            double v11 = v10;

            if (v11 > 0.0)
            {
              ++*((void *)v70 + v6);
              *((double *)v68 + v6) = v11 + *((double *)v68 + v6);
              id v12 = [v7 timers];
              v51[0] = MEMORY[0x1E4F143A8];
              v51[1] = 3221225472;
              v51[2] = __34__PHImportResults_generatePMRInfo__block_invoke_2;
              v51[3] = &unk_1E5847560;
              v51[4] = v2;
              id v52 = v8;
              unint64_t v53 = v6;
              [v12 processTimesOfType:v6 withBlock:v51];
            }
            ++v6;
          }
          while (v6 != 17);
        }
        uint64_t v45 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
      }
      while (v45);
    }

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:17];
    uint64_t v14 = v2->_pmrInfo;
    v2->_pmrInfo = (NSMutableDictionary *)v13;

    v65[0] = @"Count";
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHImportResults importedCount](v2, "importedCount"));
    v65[1] = @"Duration";
    v66[0] = v15;
    uint64_t v16 = NSNumber;
    [(PHImportResults *)v2 runTime];
    uint64_t v17 = objc_msgSend(v16, "numberWithDouble:");
    v66[1] = v17;
    double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];
    v19 = v2->_pmrInfo;
    double v20 = [(id)pmrKey objectAtIndexedSubscript:17];
    [(NSMutableDictionary *)v19 setObject:v18 forKeyedSubscript:v20];

    for (uint64_t j = 0; j != 17; ++j)
    {
      uint64_t v22 = *((void *)v70 + j);
      if (v22)
      {
        double v23 = [v4 objectAtIndexedSubscript:j];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v24 = v23;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v47 objects:v64 count:16];
        if (!v25)
        {

LABEL_40:
          _PFAssertFailHandler();
        }
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v48;
        double v28 = 0.0;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v48 != v27) {
              objc_enumerationMutation(v24);
            }
            double v30 = *(void **)(*((void *)&v47 + 1) + 8 * k);
            v31 = [v30 end];
            double v32 = [v30 start];
            [v31 timeIntervalSinceDate:v32];
            double v28 = v28 + v33;
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v47 objects:v64 count:16];
        }
        while (v26);

        v2 = v46;
        if (v28 == 0.0) {
          goto LABEL_40;
        }
        double v34 = *((double *)v68 + j);
        if (v34 == 0.0) {
          goto LABEL_40;
        }
        if (v28 > v34)
        {
          v35 = PLImportGetLog();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134349312;
            double v61 = v28;
            __int16 v62 = 2050;
            double v63 = v34;
            _os_log_impl(&dword_19B043000, v35, OS_LOG_TYPE_ERROR, "It is unexpected for duration (%{public}g) to be <= absoluteDuration (%{public}g)", buf, 0x16u);
          }
        }
        v58[0] = @"Count";
        long long v36 = [NSNumber numberWithUnsignedInteger:v22];
        v59[0] = v36;
        v58[1] = @"Duration";
        long long v37 = [NSNumber numberWithDouble:v28];
        v59[1] = v37;
        v58[2] = @"Absolute Duration";
        long long v38 = [NSNumber numberWithDouble:v34];
        v59[2] = v38;
        long long v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:3];
        v40 = v46->_pmrInfo;
        uint64_t v41 = [(id)pmrKey objectAtIndexedSubscript:j];
        [(NSMutableDictionary *)v40 setObject:v39 forKeyedSubscript:v41];
      }
    }

    pmrInfo = v2->_pmrInfo;
  }

  return pmrInfo;
}

uint64_t __34__PHImportResults_generatePMRInfo__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) insertStart:a2 end:a3 intoGroups:*(void *)(a1 + 40) ofType:*(void *)(a1 + 48)];
}

void __34__PHImportResults_generatePMRInfo__block_invoke()
{
  v0 = (void *)pmrKey;
  pmrKey = (uint64_t)&unk_1EEB26CE8;
}

- (double)runTime
{
  uint64_t v3 = [(PHImportResults *)self startTime];
  if (!v3) {
    return 0.0;
  }
  id v4 = (void *)v3;
  id v5 = [(PHImportResults *)self endTime];

  if (!v5) {
    return 0.0;
  }
  unint64_t v6 = [(PHImportResults *)self endTime];
  uint64_t v7 = [(PHImportResults *)self startTime];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  return v9;
}

- (NSError)error
{
  v2 = [(PHImportResults *)self exceptions];
  uint64_t v3 = [v2 firstObject];
  id v4 = [v3 underlyingError];

  return (NSError *)v4;
}

- (id)exceptions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10.receiver = self;
  v10.super_class = (Class)PHImportResults;
  id v4 = [(PHImportExceptionRecorder *)&v10 exceptions];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)PHImportResults;
    unint64_t v6 = [(PHImportExceptionRecorder *)&v9 exceptions];
    [v3 addObjectsFromArray:v6];
  }
  uint64_t v7 = [(PHImportResults *)self importRecordExceptions];
  if ([v7 count]) {
    [v3 addObjectsFromArray:v7];
  }

  return v3;
}

- (id)importRecordExceptions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_importRecords;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "exceptions", (void)v11);
        if ([v9 count]) {
          [v3 addObjectsFromArray:v9];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)failedToImportCount
{
  v2 = [(PHImportResults *)self importRecordExceptions];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)importedCount
{
  return [(NSMutableArray *)self->_importRecords count];
}

- (void)addImportRecord:(id)a3
{
}

- (void)addUnsupportedPath:(id)a3
{
  id v3 = [(PHImportExceptionRecorder *)self addExceptionWithType:1 path:a3 underlyingError:0 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportResults.m" line:104];
}

- (unsigned)result
{
  int v2 = self->_result;
  if (v2 != 3)
  {
    if ([(PHImportResults *)self importedCount])
    {
      id v4 = [(PHImportResults *)self exceptions];
      uint64_t v5 = [v4 count];

      if (v5) {
        LOBYTE(v2) = 2;
      }
      else {
        LOBYTE(v2) = 1;
      }
    }
    else
    {
      LOBYTE(v2) = 4;
    }
    self->_result = v2;
  }
  return v2;
}

- (PHImportResults)init
{
  v6.receiver = self;
  v6.super_class = (Class)PHImportResults;
  int v2 = [(PHImportExceptionRecorder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    importRecords = v2->_importRecords;
    v2->_importRecords = (NSMutableArray *)v3;
  }
  return v2;
}

+ (PHImportResults)resultsWithExceptions:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 addExceptions:v3];

  return (PHImportResults *)v4;
}

+ (PHImportResults)resultsWithException:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 addException:v3];

  return (PHImportResults *)v4;
}

@end