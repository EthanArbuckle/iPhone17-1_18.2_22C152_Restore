@interface ICLAppRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUpdatedSystemApp;
- (ICLAppRecord)initWithCoder:(id)a3;
- (ICLAppRecord)initWithLegacyRecordDictionary:(id)a3;
- (NSArray)driverKitExtensionURLs;
- (NSArray)stashedVersions;
- (NSURL)parallelPlaceholderURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)legacyRecordDictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDriverKitExtensionURLs:(id)a3;
- (void)setIsUpdatedSystemApp:(BOOL)a3;
- (void)setParallelPlaceholderURL:(id)a3;
- (void)setStashedVersions:(id)a3;
@end

@implementation ICLAppRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLAppRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICLAppRecord;
  v5 = [(ICLPlaceholderRecord *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parallelPlaceholderURL"];
    parallelPlaceholderURL = v5->_parallelPlaceholderURL;
    v5->_parallelPlaceholderURL = (NSURL *)v6;

    v5->_isUpdatedSystemApp = [v4 decodeBoolForKey:@"isUpdatedSystemApp"];
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"driverKitExtensionURLs"];
    driverKitExtensionURLs = v5->_driverKitExtensionURLs;
    v5->_driverKitExtensionURLs = (NSArray *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"stashedVersions"];
    stashedVersions = v5->_stashedVersions;
    v5->_stashedVersions = (NSArray *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ICLAppRecord;
  id v4 = a3;
  [(ICLPlaceholderRecord *)&v8 encodeWithCoder:v4];
  v5 = [(ICLAppRecord *)self parallelPlaceholderURL];
  [v4 encodeObject:v5 forKey:@"parallelPlaceholderURL"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ICLAppRecord isUpdatedSystemApp](self, "isUpdatedSystemApp"), @"isUpdatedSystemApp");
  uint64_t v6 = [(ICLAppRecord *)self driverKitExtensionURLs];
  [v4 encodeObject:v6 forKey:@"driverKitExtensionURLs"];

  v7 = [(ICLAppRecord *)self stashedVersions];
  [v4 encodeObject:v7 forKey:@"stashedVersions"];
}

- (ICLAppRecord)initWithLegacyRecordDictionary:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)ICLAppRecord;
  v5 = [(ICLPlaceholderRecord *)&v33 initWithLegacyRecordDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"ParallelPlaceholderPath"];
    objc_opt_class();
    id v7 = v6;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:1];
      [(ICLAppRecord *)v5 setParallelPlaceholderURL:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"IsUpdatedSystemApp"];
    [(ICLAppRecord *)v5 setIsUpdatedSystemApp:MIBooleanValue(v10, 0)];

    uint64_t v11 = [v4 objectForKeyedSubscript:@"DriverKitExtensionPaths"];
    objc_opt_class();
    id v12 = v11;
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    if (v13)
    {
      objc_opt_class();
      if (MIArrayContainsOnlyClass(v13))
      {
        id v28 = v8;
        uint64_t v14 = objc_opt_new();
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v15 = v13;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v30;
          do
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v30 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(*((void *)&v29 + 1) + 8 * v19) isDirectory:1];
              [v14 addObject:v20];

              ++v19;
            }
            while (v17 != v19);
            uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
          }
          while (v17);
        }

        v21 = (void *)[v14 copy];
        [(ICLAppRecord *)v5 setDriverKitExtensionURLs:v21];

        id v8 = v28;
      }
    }
    v22 = [v4 objectForKeyedSubscript:@"StashedVersionInfo"];
    objc_opt_class();
    id v23 = v22;
    if (objc_opt_isKindOfClass()) {
      id v24 = v23;
    }
    else {
      id v24 = 0;
    }

    if (v24)
    {
      v25 = [[ICLStashedAppRecord alloc] initWithLegacyRecordDictionary:v24];
      v34 = v25;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
      [(ICLAppRecord *)v5 setStashedVersions:v26];
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)ICLAppRecord;
  id v5 = -[ICLPlaceholderRecord copyWithZone:](&v13, sel_copyWithZone_);
  uint64_t v6 = [(ICLAppRecord *)self parallelPlaceholderURL];
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setParallelPlaceholderURL:v7];

  objc_msgSend(v5, "setIsUpdatedSystemApp:", -[ICLAppRecord isUpdatedSystemApp](self, "isUpdatedSystemApp"));
  id v8 = [(ICLAppRecord *)self driverKitExtensionURLs];
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  [v5 setDriverKitExtensionURLs:v9];

  v10 = [(ICLAppRecord *)self stashedVersions];
  uint64_t v11 = (void *)[v10 copyWithZone:a3];
  [v5 setStashedVersions:v11];

  return v5;
}

- (id)legacyRecordDictionary
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v27.receiver = self;
  v27.super_class = (Class)ICLAppRecord;
  id v4 = [(ICLPlaceholderRecord *)&v27 legacyRecordDictionary];
  [v3 addEntriesFromDictionary:v4];

  id v5 = [(ICLAppRecord *)self parallelPlaceholderURL];
  uint64_t v6 = [v5 path];

  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:@"ParallelPlaceholderPath"];
  }

  if ([(ICLAppRecord *)self isUpdatedSystemApp]) {
    uint64_t v7 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CC28];
  }
  [v3 setObject:v7 forKeyedSubscript:@"IsUpdatedSystemApp"];
  id v8 = [(ICLAppRecord *)self driverKitExtensionURLs];
  uint64_t v9 = v8;
  if (v8 && [v8 count])
  {
    v10 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "path", (void)v23);
          [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v13);
    }

    uint64_t v17 = (void *)[v10 copy];
    if (v17) {
      [v3 setObject:v17 forKeyedSubscript:@"DriverKitExtensionPaths"];
    }
  }
  uint64_t v18 = [(ICLAppRecord *)self stashedVersions];
  uint64_t v19 = [v18 firstObject];

  if (v19)
  {
    v20 = [v19 legacyRecordDictionary];
    if (v20) {
      [v3 setObject:v20 forKeyedSubscript:@"StashedVersionInfo"];
    }
  }
  v21 = (void *)[v3 copy];

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICLAppRecord *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18.receiver = self;
      v18.super_class = (Class)ICLAppRecord;
      if ([(ICLPlaceholderRecord *)&v18 isEqual:v4])
      {
        id v5 = v4;
        uint64_t v6 = [(ICLAppRecord *)self parallelPlaceholderURL];
        uint64_t v7 = [(ICLAppRecord *)v5 parallelPlaceholderURL];
        BOOL v8 = MICompareObjects(v6, v7);

        if (v8)
        {
          BOOL v9 = [(ICLAppRecord *)self isUpdatedSystemApp];
          if (v9 == [(ICLAppRecord *)v5 isUpdatedSystemApp])
          {
            uint64_t v12 = [(ICLAppRecord *)self driverKitExtensionURLs];
            uint64_t v13 = [(ICLAppRecord *)v5 driverKitExtensionURLs];
            BOOL v14 = MICompareObjects(v12, v13);

            if (v14)
            {
              id v15 = [(ICLAppRecord *)self stashedVersions];
              uint64_t v16 = [(ICLAppRecord *)v5 stashedVersions];
              BOOL v17 = MICompareObjects(v15, v16);

              if (v17)
              {
                BOOL v10 = 1;
                goto LABEL_15;
              }
              if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              {
LABEL_14:
                BOOL v10 = 0;
LABEL_15:

                goto LABEL_16;
              }
            }
            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              goto LABEL_14;
            }
          }
          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            goto LABEL_14;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_14;
        }
        MOLogWrite();
        goto LABEL_14;
      }
    }
    BOOL v10 = 0;
  }
LABEL_16:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(ICLAppRecord *)self isUpdatedSystemApp];
  id v4 = [(ICLAppRecord *)self parallelPlaceholderURL];
  uint64_t v5 = [v4 hash];

  uint64_t v6 = [(ICLAppRecord *)self stashedVersions];
  uint64_t v7 = v5 ^ [v6 hash] ^ v3;

  BOOL v8 = [(ICLAppRecord *)self driverKitExtensionURLs];
  uint64_t v9 = v7 ^ [v8 hash];

  v11.receiver = self;
  v11.super_class = (Class)ICLAppRecord;
  return v9 ^ [(ICLPlaceholderRecord *)&v11 hash];
}

- (NSURL)parallelPlaceholderURL
{
  return self->_parallelPlaceholderURL;
}

- (void)setParallelPlaceholderURL:(id)a3
{
}

- (BOOL)isUpdatedSystemApp
{
  return self->_isUpdatedSystemApp;
}

- (void)setIsUpdatedSystemApp:(BOOL)a3
{
  self->_isUpdatedSystemApp = a3;
}

- (NSArray)driverKitExtensionURLs
{
  return self->_driverKitExtensionURLs;
}

- (void)setDriverKitExtensionURLs:(id)a3
{
}

- (NSArray)stashedVersions
{
  return self->_stashedVersions;
}

- (void)setStashedVersions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stashedVersions, 0);
  objc_storeStrong((id *)&self->_driverKitExtensionURLs, 0);
  objc_storeStrong((id *)&self->_parallelPlaceholderURL, 0);
}

@end