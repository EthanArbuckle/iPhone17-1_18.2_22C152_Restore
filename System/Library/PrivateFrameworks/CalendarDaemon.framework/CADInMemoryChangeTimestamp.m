@interface CADInMemoryChangeTimestamp
+ (BOOL)doesTimestamp:(id)a3 includeAllChangesVisibleToTimestamp:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)timestampForNow;
- (CADInMemoryChangeTimestamp)initWithCoder:(id)a3;
- (CADInMemoryChangeTimestamp)initWithTimestamps:(id)a3;
- (id)allDatabases;
- (id)redactedDescription;
- (id)timestampForDatabase:(int)a3;
- (id)timestamps;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CADInMemoryChangeTimestamp

+ (id)timestampForNow
{
  v2 = objc_alloc_init(CADInMemoryChangeTimestamp);
  v3 = (CalSingleDatabaseInMemoryChangeTimestamp *)objc_alloc_init(MEMORY[0x1E4F57480]);
  universalTimestamp = v2->_universalTimestamp;
  v2->_universalTimestamp = v3;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamps, 0);
  objc_storeStrong((id *)&self->_universalTimestamp, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADInMemoryChangeTimestamp)initWithTimestamps:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADInMemoryChangeTimestamp;
  v5 = [(CADInMemoryChangeTimestamp *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    timestamps = v5->_timestamps;
    v5->_timestamps = (NSDictionary *)v6;
  }
  return v5;
}

- (CADInMemoryChangeTimestamp)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CADInMemoryChangeTimestamp;
  v5 = [(CADInMemoryChangeTimestamp *)&v15 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    objc_super v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"timestamps"];
    timestamps = v5->_timestamps;
    v5->_timestamps = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"universalTimestamp"];
    universalTimestamp = v5->_universalTimestamp;
    v5->_universalTimestamp = (CalSingleDatabaseInMemoryChangeTimestamp *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  universalTimestamp = self->_universalTimestamp;
  id v5 = a3;
  [v5 encodeObject:universalTimestamp forKey:@"universalTimestamp"];
  [v5 encodeObject:self->_timestamps forKey:@"timestamps"];
}

- (id)timestampForDatabase:(int)a3
{
  universalTimestamp = self->_universalTimestamp;
  if (universalTimestamp)
  {
    id v4 = universalTimestamp;
  }
  else
  {
    timestamps = self->_timestamps;
    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:*(void *)&a3];
    id v4 = [(NSDictionary *)timestamps objectForKeyedSubscript:v6];
  }
  return v4;
}

- (id)allDatabases
{
  return [(NSDictionary *)self->_timestamps allKeys];
}

- (id)redactedDescription
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  universalTimestamp = self->_universalTimestamp;
  if (universalTimestamp)
  {
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"[all={.self=%llu,.others=%llu}]", -[CalSingleDatabaseInMemoryChangeTimestamp myself](universalTimestamp, "myself"), -[CalSingleDatabaseInMemoryChangeTimestamp others](self->_universalTimestamp, "others"));
  }
  else
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"["];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = self->_timestamps;
    uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if ((unint64_t)[v4 length] >= 2) {
            [v4 appendString:@", "];
          }
          v11 = [(NSDictionary *)self->_timestamps objectForKeyedSubscript:v10];
          [v4 appendFormat:@"%@={.self=%llu,.others=%llu}", v10, objc_msgSend(v11, "myself"), objc_msgSend(v11, "others")];
        }
        uint64_t v7 = [(NSDictionary *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

- (id)timestamps
{
  return self->_timestamps;
}

+ (BOOL)doesTimestamp:(id)a3 includeAllChangesVisibleToTimestamp:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = objc_msgSend(v5, "timestamps", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        long long v13 = [v5 timestamps];
        long long v14 = [v13 objectForKeyedSubscript:v12];

        long long v15 = [v6 timestamps];
        long long v16 = [v15 objectForKeyedSubscript:v12];

        uint64_t v17 = [v14 others];
        uint64_t v18 = [v16 myself];

        if (v17 < v18)
        {
          BOOL v19 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 1;
LABEL_11:

  return v19;
}

@end