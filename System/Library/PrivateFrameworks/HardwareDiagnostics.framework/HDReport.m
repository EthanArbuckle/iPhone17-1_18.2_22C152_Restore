@interface HDReport
+ (BOOL)supportsSecureCoding;
- (BOOL)attemptToSetPassed;
- (HDReport)init;
- (HDReport)initWithCoder:(id)a3;
- (NSArray)results;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSDictionary)auxiliaryData;
- (NSDictionary)files;
- (NSError)error;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)status;
- (void)addFile:(id)a3 forName:(id)a4;
- (void)addResult:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)failedForError:(id)a3;
- (void)setAuxiliaryData:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation HDReport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDReport)init
{
  v10.receiver = self;
  v10.super_class = (Class)HDReport;
  v2 = [(HDReport *)&v10 init];
  v3 = v2;
  if (v2)
  {
    error = v2->_error;
    v2->_error = 0;
    v2->_status = 0;

    uint64_t v5 = objc_opt_new();
    results = v3->_results;
    v3->_results = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    files = v3->_files;
    v3->_files = (NSMutableDictionary *)v7;
  }
  return v3;
}

- (HDReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HDReport;
  uint64_t v5 = [(HDReport *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDReport.startTime"];
    startTime = v5->_startTime;
    v5->_startTime = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDReport.endTime"];
    endTime = v5->_endTime;
    v5->_endTime = (NSDate *)v8;

    objc_super v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"HDReport.results"];
    results = v5->_results;
    v5->_results = (NSMutableArray *)v13;

    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"HDReport.files"];
    files = v5->_files;
    v5->_files = (NSMutableDictionary *)v19;

    v21 = HDAuxDataDecodingClassAllowList();
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"HDReport.auxiliaryData"];
    auxiliaryData = v5->_auxiliaryData;
    v5->_auxiliaryData = (NSDictionary *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HDReport.error"];
    error = v5->_error;
    v5->_error = (NSError *)v24;

    v5->_status = [v4 decodeIntegerForKey:@"HDReport.status"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  startTime = self->_startTime;
  id v5 = a3;
  [v5 encodeObject:startTime forKey:@"HDReport.startTime"];
  [v5 encodeObject:self->_endTime forKey:@"HDReport.endTime"];
  [v5 encodeObject:self->_results forKey:@"HDReport.results"];
  [v5 encodeObject:self->_files forKey:@"HDReport.files"];
  [v5 encodeObject:self->_auxiliaryData forKey:@"HDReport.auxiliaryData"];
  [v5 encodeObject:self->_error forKey:@"HDReport.error"];
  [v5 encodeInteger:self->_status forKey:@"HDReport.status"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v6 = [(HDReport *)self files];
  uint64_t v7 = [v6 allKeys];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v37 + 1) + 8 * v11);
        uint64_t v13 = [(HDReport *)self files];
        v14 = [v13 objectForKeyedSubscript:v12];

        [v5 addFile:v14 forName:v12];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v9);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v15 = [(HDReport *)self results];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        [v5 addResult:*(void *)(*((void *)&v33 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v17);
  }

  v20 = [(HDReport *)self auxiliaryData];
  v21 = (void *)[v20 copyWithZone:a3];
  [v5 setAuxiliaryData:v21];

  uint64_t v22 = [(HDReport *)self startTime];
  v23 = (void *)[v22 copyWithZone:a3];
  [v5 setStartTime:v23];

  uint64_t v24 = [(HDReport *)self endTime];
  v25 = (void *)[v24 copyWithZone:a3];
  [v5 setEndTime:v25];

  uint64_t v26 = [(HDReport *)self error];
  if (v26)
  {
    objc_super v27 = (void *)v26;
    v28 = [(HDReport *)self error];
    v29 = [v5 error];
    char v30 = [v28 isEqual:v29];

    if ((v30 & 1) == 0)
    {
      v31 = [(HDReport *)self error];
      [v5 failedForError:v31];
    }
  }
  return v5;
}

- (void)addResult:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v27 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    results = v5->_results;
    uint64_t v7 = (void *)[v27 copy];
    [(NSMutableArray *)results addObject:v7];

    if ([v27 valueWithinLimits])
    {
      if (!v5->_status) {
        v5->_status = 1;
      }
      goto LABEL_11;
    }
    v5->_status = -1;
    error = v5->_error;
    if (error)
    {
      if ([(NSError *)error code] == 7)
      {
        uint64_t v9 = [(NSError *)v5->_error domain];
        int v10 = [v9 isEqualToString:@"com.apple.osdiags.hardware-diagnostics.ErrorDomain"];

        if (v10)
        {
          uint64_t v16 = HDCreateError(@"com.apple.osdiags.hardware-diagnostics.ErrorDomain", 7, @"Multiple limit failures", v11, v12, v13, v14, v15, v26);
          uint64_t v17 = v5->_error;
          v5->_error = (NSError *)v16;

LABEL_11:
          objc_sync_exit(v5);

          id v4 = v27;
          goto LABEL_12;
        }
      }
      if (v5->_error) {
        goto LABEL_11;
      }
    }
    uint64_t v18 = [v27 name];
    uint64_t v24 = HDCreateError(@"com.apple.osdiags.hardware-diagnostics.ErrorDomain", 7, @"Measurement (%@) out of limits", v19, v20, v21, v22, v23, (uint64_t)v18);
    v25 = v5->_error;
    v5->_error = (NSError *)v24;

    goto LABEL_11;
  }
LABEL_12:
}

- (void)addFile:(id)a3 forName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  [(NSMutableDictionary *)v7->_files setObject:v8 forKeyedSubscript:v6];
  objc_sync_exit(v7);
}

- (NSDictionary)files
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSMutableDictionary *)v2->_files copy];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (NSArray)results
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v2->_results copyItems:1];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (BOOL)attemptToSetPassed
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t status = v2->_status;
  if (status != -1) {
    v2->_int64_t status = 1;
  }
  BOOL v4 = status != -1;
  objc_sync_exit(v2);

  return v4;
}

- (void)failedForError:(id)a3
{
  id v6 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v5->_int64_t status = -1;
  if (v6) {
    objc_storeStrong((id *)&v5->_error, a3);
  }
  objc_sync_exit(v5);
}

- (id)dictionaryRepresentation
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  BOOL v4 = objc_opt_new();
  [v4 setDateStyle:2];
  [v4 setTimeStyle:4];
  if (self->_startTime)
  {
    id v5 = objc_msgSend(v4, "stringFromDate:");
    [v3 setObject:v5 forKeyedSubscript:@"start-time"];
  }
  if (self->_endTime)
  {
    id v6 = objc_msgSend(v4, "stringFromDate:");
    [v3 setObject:v6 forKeyedSubscript:@"end-time"];
  }
  unint64_t v7 = self->_status + 1;
  if (v7 > 2) {
    id v8 = 0;
  }
  else {
    id v8 = off_264D000F0[v7];
  }
  [v3 setObject:v8 forKeyedSubscript:@"status"];
  if ([(NSDictionary *)self->_auxiliaryData count])
  {
    uint64_t v9 = (void *)[(NSDictionary *)self->_auxiliaryData copy];
    [v3 setObject:v9 forKeyedSubscript:@"auxiliary-data"];
  }
  error = self->_error;
  if (error)
  {
    uint64_t v11 = [(NSError *)error dictionaryRepresentation];
    [v3 setObject:v11 forKeyedSubscript:@"error"];
  }
  if ([(NSMutableDictionary *)self->_files count])
  {
    v32 = v4;
    uint64_t v12 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v13 = self->_files;
    uint64_t v14 = [(NSMutableDictionary *)v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v19 = [(NSMutableDictionary *)self->_files objectForKeyedSubscript:v18];
          uint64_t v20 = [v19 path];
          [v12 setObject:v20 forKeyedSubscript:v18];
        }
        uint64_t v15 = [(NSMutableDictionary *)v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v15);
    }

    uint64_t v21 = (void *)[v12 copy];
    [v3 setObject:v21 forKeyedSubscript:@"files"];

    BOOL v4 = v32;
  }
  if ([(NSMutableArray *)self->_results count])
  {
    uint64_t v22 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v23 = self->_results;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v34 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v33 + 1) + 8 * j) dictionaryRepresentation];
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v25);
    }

    v29 = (void *)[v22 copy];
    [v3 setObject:v29 forKeyedSubscript:@"results"];
  }
  char v30 = (void *)[v3 copy];

  return v30;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (NSDictionary)auxiliaryData
{
  return self->_auxiliaryData;
}

- (void)setAuxiliaryData:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_auxiliaryData, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end