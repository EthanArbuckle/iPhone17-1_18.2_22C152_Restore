@interface _HDSeriesFreezeJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (Class)seriesClass;
- (NSDictionary)metadata;
- (NSUUID)seriesUUID;
- (_HDSeriesFreezeJournalEntry)initWithCoder:(id)a3;
- (_HDSeriesFreezeJournalEntry)initWithSeriesUUID:(id)a3 metadata:(id)a4 class:(Class)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HDSeriesFreezeJournalEntry

- (_HDSeriesFreezeJournalEntry)initWithSeriesUUID:(id)a3 metadata:(id)a4 class:(Class)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!a5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_HDSeriesFreezeJournalEntry.m", 29, @"Invalid parameter not satisfying: %@", @"seriesClass != Nil" object file lineNumber description];
  }
  if (([(objc_class *)a5 conformsToProtocol:&unk_1F182B860] & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_HDSeriesFreezeJournalEntry.m", 30, @"Invalid parameter not satisfying: %@", @"[seriesClass conformsToProtocol:@protocol(_HDSeriesFreezeJournalEntrySeries)]" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)_HDSeriesFreezeJournalEntry;
  v11 = [(_HDSeriesFreezeJournalEntry *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    seriesUUID = v11->_seriesUUID;
    v11->_seriesUUID = (NSUUID *)v12;

    uint64_t v14 = [v10 copy];
    metadata = v11->_metadata;
    v11->_metadata = (NSDictionary *)v14;

    objc_storeStrong((id *)&v11->_seriesClass, a5);
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@ - freeze %@", v5, self->_seriesUUID];

  return v6;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v12 = (void *)[v11 seriesClass];
        v13 = [v11 seriesUUID];
        uint64_t v14 = [v11 metadata];
        id v29 = 0;
        char v15 = [v12 freezeSeriesWithIdentifier:v13 metadata:v14 profile:v6 error:&v29];
        id v16 = v29;

        if ((v15 & 1) == 0)
        {
          _HKInitializeLogging();
          v17 = (void *)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            v24 = v17;
            v25 = objc_opt_class();
            id v26 = v25;
            v27 = [v11 seriesUUID];
            *(_DWORD *)buf = 138412802;
            v35 = v25;
            __int16 v36 = 2112;
            v37 = v27;
            __int16 v38 = 2114;
            id v39 = v16;
            _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "%@: *** Failed to freeze series: %@ %{public}@", buf, 0x20u);
          }
          if (objc_msgSend(v16, "hk_isTransactionInterruptedError"))
          {

            goto LABEL_15;
          }
          v18 = NSString;
          uint64_t v19 = objc_opt_class();
          v20 = [v11 seriesUUID];
          v21 = [v18 stringWithFormat:@"%@-%@", v19, v20];

          v22 = [v6 daemon];
          v23 = [v22 autoBugCaptureReporter];
          [v23 reportJournalFailureWithErrorDescription:v21 provenance:0 error:v16];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDSeriesFreezeJournalEntry)initWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sid"];
  id v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureCodingClasses");
  uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"meta"];

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seriesClass"];

  Class v9 = NSClassFromString(v8);
  if (v9)
  {
    self = [(_HDSeriesFreezeJournalEntry *)self initWithSeriesUUID:v5 metadata:v7 class:v9];
    id v10 = self;
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543362;
      uint64_t v14 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "Failed to instantiate series freeze journal entry: unable to find subclass '%{public}@'", (uint8_t *)&v13, 0xCu);
    }
    id v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HDSeriesFreezeJournalEntry;
  id v4 = a3;
  [(HDJournalEntry *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_seriesUUID, @"sid", v6.receiver, v6.super_class);
  [v4 encodeObject:self->_metadata forKey:@"meta"];
  id v5 = NSStringFromClass(self->_seriesClass);
  [v4 encodeObject:v5 forKey:@"seriesClass"];
}

- (NSUUID)seriesUUID
{
  return self->_seriesUUID;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (Class)seriesClass
{
  return self->_seriesClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesClass, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_seriesUUID, 0);
}

@end