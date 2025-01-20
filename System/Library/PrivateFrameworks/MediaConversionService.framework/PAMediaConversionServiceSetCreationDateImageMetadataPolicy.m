@interface PAMediaConversionServiceSetCreationDateImageMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithCreationDate:(id)a3 inTimeZone:(id)a4;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (NSDate)creationDate;
- (NSTimeZone)timeZone;
- (PAMediaConversionServiceSetCreationDateImageMetadataPolicy)initWithCoder:(id)a3;
- (id)processMetadata:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation PAMediaConversionServiceSetCreationDateImageMetadataPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)policyWithCreationDate:(id)a3 inTimeZone:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setCreationDate:v6];

  if (v5)
  {
    [v7 setTimeZone:v5];
  }
  else
  {
    v8 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    [v7 setTimeZone:v8];
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (void)setTimeZone:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (id)processMetadata:(id)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self creationDate];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    v7 = v6;
    if (v4) {
      [v6 addEntriesFromDictionary:v4];
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F8CC10]);
    v9 = [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self creationDate];
    v10 = [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self timeZone];
    [v8 setCreationDate:v9 timeZone:v10];

    v19[0] = *MEMORY[0x1E4F2F800];
    v11 = [v8 exifDictionary];
    v20[0] = v11;
    v19[1] = *MEMORY[0x1E4F2FD40];
    v12 = [v8 tiffDictionary];
    v20[1] = v12;
    v19[2] = *MEMORY[0x1E4F2FB80];
    v13 = [v8 iptcDictionary];
    v20[2] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __78__PAMediaConversionServiceSetCreationDateImageMetadataPolicy_processMetadata___block_invoke;
    v17[3] = &unk_1E6CFEBB8;
    id v15 = v7;
    id v18 = v15;
    [v14 enumerateKeysAndObjectsUsingBlock:v17];
  }
  else
  {
    id v15 = v4;
  }

  return v15;
}

void __78__PAMediaConversionServiceSetCreationDateImageMetadataPolicy_processMetadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
    v7 = (void *)[v6 mutableCopy];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v10 = v9;

    [v10 addEntriesFromDictionary:v5];
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v11];
  }
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  v33[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self creationDate];

  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2F800]];
    v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FD40]];
    v29 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FB80]];
    id v8 = objc_alloc_init(MEMORY[0x1E4F8CC10]);
    id v9 = [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self creationDate];
    v10 = [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self timeZone];
    [v8 setCreationDate:v9 timeZone:v10];

    id v11 = [v8 exifDictionary];
    v12 = [v8 tiffDictionary];
    v13 = [v8 iptcDictionary];
    uint64_t v14 = *MEMORY[0x1E4F2F950];
    v33[0] = *MEMORY[0x1E4F2F7F0];
    v33[1] = v14;
    uint64_t v15 = *MEMORY[0x1E4F2F7E8];
    v33[2] = *MEMORY[0x1E4F2F8D0];
    v33[3] = v15;
    uint64_t v16 = *MEMORY[0x1E4F2F8C8];
    v33[4] = *MEMORY[0x1E4F2F948];
    v33[5] = v16;
    uint64_t v17 = *MEMORY[0x1E4F2F8C0];
    v33[6] = *MEMORY[0x1E4F2F940];
    v33[7] = v17;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:8];
    v30 = v6;
    int v19 = __86__PAMediaConversionServiceSetCreationDateImageMetadataPolicy_metadataNeedsProcessing___block_invoke(v6, v11, v18);

    if (v19)
    {
      uint64_t v32 = *MEMORY[0x1E4F2FD38];
      char v20 = 1;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      v22 = v7;
      int v23 = __86__PAMediaConversionServiceSetCreationDateImageMetadataPolicy_metadataNeedsProcessing___block_invoke(v7, v12, v21);

      v24 = v29;
      if (v23)
      {
        uint64_t v25 = *MEMORY[0x1E4F2FBD0];
        v31[0] = *MEMORY[0x1E4F2FB78];
        v31[1] = v25;
        v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
        char v27 = __86__PAMediaConversionServiceSetCreationDateImageMetadataPolicy_metadataNeedsProcessing___block_invoke(v29, v13, v26);

        char v20 = v27 ^ 1;
      }
    }
    else
    {
      v22 = v7;
      char v20 = 1;
      v24 = v29;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

uint64_t __86__PAMediaConversionServiceSetCreationDateImageMetadataPolicy_metadataNeedsProcessing___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = a3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend(v5, "objectForKeyedSubscript:", v12, (void)v18);
        uint64_t v14 = [v6 objectForKeyedSubscript:v12];
        int v15 = [v13 isEqual:v14];

        if (!v15)
        {
          uint64_t v16 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v16 = 1;
LABEL_11:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self creationDate];
  [v4 encodeObject:v5 forKey:@"creationDate"];

  id v6 = [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self timeZone];
  [v4 encodeObject:v6 forKey:@"creationDateTimeZone"];
}

- (PAMediaConversionServiceSetCreationDateImageMetadataPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"creationDate"])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDateTimeZone"];
    [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self setCreationDate:v5];
    [(PAMediaConversionServiceSetCreationDateImageMetadataPolicy *)self setTimeZone:v6];
  }
  return self;
}

@end