@interface MXDiagnosticPayload
+ (BOOL)supportsSecureCoding;
- (MXDiagnosticPayload)initWithCoder:(id)a3;
- (MXDiagnosticPayload)initWithTimeStampBegin:(id)a3 withTimeStampEnd:(id)a4 withDiagnostics:(id)a5;
- (NSArray)appLaunchDiagnostics;
- (NSArray)cpuExceptionDiagnostics;
- (NSArray)crashDiagnostics;
- (NSArray)diskWriteExceptionDiagnostics;
- (NSArray)hangDiagnostics;
- (NSData)JSONRepresentation;
- (NSDate)timeStampBegin;
- (NSDate)timeStampEnd;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXDiagnosticPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  timeStampBegin = self->_timeStampBegin;
  id v5 = a3;
  [v5 encodeObject:timeStampBegin forKey:@"timeStampBegin"];
  [v5 encodeObject:self->_timeStampEnd forKey:@"timeStampEnd"];
  [v5 encodeObject:self->_cpuExceptionDiagnostics forKey:@"cpuExceptionDiagnostics"];
  [v5 encodeObject:self->_diskWriteExceptionDiagnostics forKey:@"diskWriteExceptionDiagnostics"];
  [v5 encodeObject:self->_hangDiagnostics forKey:@"hangDiagnostics"];
  [v5 encodeObject:self->_appLaunchDiagnostics forKey:@"appLaunchDiagnostics"];
  [v5 encodeObject:self->_crashDiagnostics forKey:@"crashDiagnostics"];
}

- (MXDiagnosticPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MXDiagnosticPayload;
  id v5 = [(MXDiagnosticPayload *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeStampBegin"];
    timeStampBegin = v5->_timeStampBegin;
    v5->_timeStampBegin = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeStampEnd"];
    timeStampEnd = v5->_timeStampEnd;
    v5->_timeStampEnd = (NSDate *)v8;

    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"cpuExceptionDiagnostics"];
    cpuExceptionDiagnostics = v5->_cpuExceptionDiagnostics;
    v5->_cpuExceptionDiagnostics = (NSArray *)v13;

    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"diskWriteExceptionDiagnostics"];
    diskWriteExceptionDiagnostics = v5->_diskWriteExceptionDiagnostics;
    v5->_diskWriteExceptionDiagnostics = (NSArray *)v18;

    v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"hangDiagnostics"];
    hangDiagnostics = v5->_hangDiagnostics;
    v5->_hangDiagnostics = (NSArray *)v23;

    v25 = (void *)MEMORY[0x263EFFA08];
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"appLaunchDiagnostics"];
    appLaunchDiagnostics = v5->_appLaunchDiagnostics;
    v5->_appLaunchDiagnostics = (NSArray *)v28;

    v30 = (void *)MEMORY[0x263EFFA08];
    uint64_t v31 = objc_opt_class();
    v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"crashDiagnostics"];
    crashDiagnostics = v5->_crashDiagnostics;
    v5->_crashDiagnostics = (NSArray *)v33;
  }
  return v5;
}

- (MXDiagnosticPayload)initWithTimeStampBegin:(id)a3 withTimeStampEnd:(id)a4 withDiagnostics:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MXDiagnosticPayload;
  v12 = [(MXDiagnosticPayload *)&v25 init];
  if (!v12) {
    goto LABEL_5;
  }
  uint64_t v13 = 0;
  if (v9 && v10)
  {
    uint64_t v14 = [v11 valueForKey:@"cpuExceptionDiagnostics"];
    cpuExceptionDiagnostics = v12->_cpuExceptionDiagnostics;
    v12->_cpuExceptionDiagnostics = (NSArray *)v14;

    uint64_t v16 = [v11 valueForKey:@"diskWriteExceptionDiagnostics"];
    diskWriteExceptionDiagnostics = v12->_diskWriteExceptionDiagnostics;
    v12->_diskWriteExceptionDiagnostics = (NSArray *)v16;

    uint64_t v18 = [v11 valueForKey:@"hangDiagnostics"];
    hangDiagnostics = v12->_hangDiagnostics;
    v12->_hangDiagnostics = (NSArray *)v18;

    uint64_t v20 = [v11 valueForKey:@"appLaunchDiagnostics"];
    appLaunchDiagnostics = v12->_appLaunchDiagnostics;
    v12->_appLaunchDiagnostics = (NSArray *)v20;

    uint64_t v22 = [v11 valueForKey:@"crashDiagnostics"];
    crashDiagnostics = v12->_crashDiagnostics;
    v12->_crashDiagnostics = (NSArray *)v22;

    objc_storeStrong((id *)&v12->_timeStampEnd, a4);
    objc_storeStrong((id *)&v12->_timeStampBegin, a3);
LABEL_5:
    uint64_t v13 = v12;
  }

  return v13;
}

- (NSData)JSONRepresentation
{
  v2 = [(MXDiagnosticPayload *)self toDictionary];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    id v5 = 0;
    v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:1 error:&v5];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)toDictionary
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  id v5 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v4 setLocale:v5];
  [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  if (self->_timeStampBegin)
  {
    uint64_t v6 = objc_msgSend(v4, "stringFromDate:");
    [v3 setObject:v6 forKey:@"timeStampBegin"];
  }
  if (self->_timeStampEnd)
  {
    v7 = objc_msgSend(v4, "stringFromDate:");
    [v3 setObject:v7 forKey:@"timeStampEnd"];
  }
  if (self->_cpuExceptionDiagnostics)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v9 = self->_cpuExceptionDiagnostics;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v60 objects:v68 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v61 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v60 + 1) + 8 * i) toDictionary];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v60 objects:v68 count:16];
      }
      while (v11);
    }

    [v3 setValue:v8 forKey:@"cpuExceptionDiagnostics"];
  }
  if (self->_diskWriteExceptionDiagnostics)
  {
    id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v16 = self->_diskWriteExceptionDiagnostics;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v56 objects:v67 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v57 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = [*(id *)(*((void *)&v56 + 1) + 8 * j) toDictionary];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v56 objects:v67 count:16];
      }
      while (v18);
    }

    [v3 setValue:v15 forKey:@"diskWriteExceptionDiagnostics"];
  }
  if (self->_hangDiagnostics)
  {
    id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v23 = self->_hangDiagnostics;
    uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v52 objects:v66 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v53;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v53 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = [*(id *)(*((void *)&v52 + 1) + 8 * k) toDictionary];
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v52 objects:v66 count:16];
      }
      while (v25);
    }

    [v3 setValue:v22 forKey:@"hangDiagnostics"];
  }
  if (self->_appLaunchDiagnostics)
  {
    id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v30 = self->_appLaunchDiagnostics;
    uint64_t v31 = [(NSArray *)v30 countByEnumeratingWithState:&v48 objects:v65 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v49;
      do
      {
        for (uint64_t m = 0; m != v32; ++m)
        {
          if (*(void *)v49 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = [*(id *)(*((void *)&v48 + 1) + 8 * m) toDictionary];
          [v29 addObject:v35];
        }
        uint64_t v32 = [(NSArray *)v30 countByEnumeratingWithState:&v48 objects:v65 count:16];
      }
      while (v32);
    }

    [v3 setValue:v29 forKey:@"appLaunchDiagnostics"];
  }
  if (self->_crashDiagnostics)
  {
    id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v37 = self->_crashDiagnostics;
    uint64_t v38 = [(NSArray *)v37 countByEnumeratingWithState:&v44 objects:v64 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v45;
      do
      {
        for (uint64_t n = 0; n != v39; ++n)
        {
          if (*(void *)v45 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * n), "toDictionary", (void)v44);
          [v36 addObject:v42];
        }
        uint64_t v39 = [(NSArray *)v37 countByEnumeratingWithState:&v44 objects:v64 count:16];
      }
      while (v39);
    }

    [v3 setValue:v36 forKey:@"crashDiagnostics"];
  }

  return v3;
}

- (NSArray)cpuExceptionDiagnostics
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)diskWriteExceptionDiagnostics
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)hangDiagnostics
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)appLaunchDiagnostics
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)crashDiagnostics
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)timeStampBegin
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSDate)timeStampEnd
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStampEnd, 0);
  objc_storeStrong((id *)&self->_timeStampBegin, 0);
  objc_storeStrong((id *)&self->_crashDiagnostics, 0);
  objc_storeStrong((id *)&self->_appLaunchDiagnostics, 0);
  objc_storeStrong((id *)&self->_hangDiagnostics, 0);
  objc_storeStrong((id *)&self->_diskWriteExceptionDiagnostics, 0);

  objc_storeStrong((id *)&self->_cpuExceptionDiagnostics, 0);
}

@end