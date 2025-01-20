@interface FPImportCookie
+ (BOOL)supportsSecureCoding;
- (BOOL)hasExpired;
- (BOOL)isEmpty;
- (FPImportCookie)initWithCoder:(id)a3;
- (FPImportCookie)initWithURL:(id)a3 error:(id *)a4;
- (NSDictionary)entries;
- (id)description;
- (id)providersWithOngoingImport;
- (void)addEntry:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeEntryForPathRelativeToVolumeRoot:(id)a3;
@end

@implementation FPImportCookie

- (FPImportCookie)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v19 = 0;
  v7 = FPGetImportCookieForURL(v6, &v19);
  id v8 = v19;
  v9 = v8;
  if (!v7)
  {
    if (v8)
    {
      if (a4)
      {
        id v13 = v8;
LABEL_8:
        v11 = 0;
        *a4 = v13;
        goto LABEL_4;
      }
      goto LABEL_15;
    }
    v18.receiver = self;
    v18.super_class = (Class)FPImportCookie;
    self = [(FPImportCookie *)&v18 init];
    if (self)
    {
      id v14 = [v6 path];
      int v15 = access((const char *)[v14 fileSystemRepresentation], 0);

      if (v15 < 0)
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:itemURL:debugDescription:", *__error(), v6, @"FPImportCookie passed non-existent url");
          id v13 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
LABEL_15:
        v11 = 0;
        goto LABEL_4;
      }
      v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      entries = self->_entries;
      self->_entries = v16;
    }
    v10 = self;
    self = v10;
    goto LABEL_3;
  }
  v10 = v7;
LABEL_3:
  v11 = v10;
LABEL_4:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
}

- (FPImportCookie)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FPImportCookie;
  v5 = [(FPImportCookie *)&v13 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"_entries"];
    entries = v5->_entries;
    v5->_entries = (NSMutableDictionary *)v10;
  }
  return v5;
}

- (void)addEntry:(id)a3
{
  entries = self->_entries;
  id v4 = a3;
  id v5 = [v4 domainPathRelativeToVolumeRoot];
  [(NSMutableDictionary *)entries setObject:v4 forKeyedSubscript:v5];
}

- (void)removeEntryForPathRelativeToVolumeRoot:(id)a3
{
}

- (BOOL)isEmpty
{
  return [(NSMutableDictionary *)self->_entries count] == 0;
}

- (BOOL)hasExpired
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  ExpirationInterval();
  double v4 = v3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [(NSMutableDictionary *)self->_entries allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    double v12 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) creationTime];
        double v15 = v7 - v14;
        if (v12 >= v15) {
          double v12 = v15;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = 1.79769313e308;
  }

  return v12 > v4;
}

- (id)providersWithOngoingImport
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  ExpirationInterval();
  double v4 = v3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  double v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [(NSMutableDictionary *)self->_entries allValues];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        double v15 = [v14 displayName];
        uint64_t v16 = [v15 length];

        if (v16)
        {
          [v14 creationTime];
          if (v8 - v17 < v4)
          {
            long long v18 = [v14 displayName];
            [v5 addObject:v18];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v2 = [(FPImportCookie *)self entries];
  double v3 = [v2 allValues];
  double v4 = objc_msgSend(v3, "fp_map:", &__block_literal_global_15);
  id v5 = [v4 componentsJoinedByString:@","];

  double v6 = [NSString stringWithFormat:@"<%@: %@>", objc_opt_class(), v5];

  return v6;
}

uint64_t __29__FPImportCookie_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 description];
}

- (NSDictionary)entries
{
  return &self->_entries->super;
}

- (void).cxx_destruct
{
}

@end