@interface ASDAUStripInfo
+ (BOOL)containsOnlyAUStrips:(id)a3;
- (ASDAUStripInfo)initWithDictionary:(id)a3 resourcePath:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)value;
- (NSString)path;
- (unint64_t)hash;
@end

@implementation ASDAUStripInfo

- (ASDAUStripInfo)initWithDictionary:(id)a3 resourcePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASDAUStripInfo;
  v8 = [(ASDAUStripInfo *)&v14 init];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"Path"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v7 stringByAppendingPathComponent:v9];
      path = v8->_path;
      v8->_path = (NSString *)v10;
    }
    v12 = [v6 objectForKeyedSubscript:@"Value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v8->_value, v12);
    }
  }
  return v8;
}

+ (BOOL)containsOnlyAUStrips:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          LOBYTE(v4) = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
    LOBYTE(v4) = 1;
  }
LABEL_11:

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (ASDAUStripInfo *)a3;
  if (self == v6)
  {
    char v10 = 1;
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v10 = 0;
    goto LABEL_22;
  }
  id v7 = v6;
  long long v8 = [(ASDAUStripInfo *)self path];
  if (v8 || ([(ASDAUStripInfo *)v7 path], (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v3 = [(ASDAUStripInfo *)self path];
    uint64_t v4 = [(ASDAUStripInfo *)v7 path];
    if (![v3 isEqual:v4])
    {
      char v10 = 0;
LABEL_18:

      goto LABEL_19;
    }
    int v9 = 1;
  }
  else
  {
    v17 = 0;
    int v9 = 0;
  }
  long long v11 = [(ASDAUStripInfo *)self value];
  if (v11 || ([(ASDAUStripInfo *)v7 value], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = [(ASDAUStripInfo *)self value];
    uint64_t v13 = [(ASDAUStripInfo *)v7 value];
    char v10 = [v12 isEqual:v13];

    if (v11) {
      goto LABEL_17;
    }
  }
  else
  {
    v16 = 0;
    char v10 = 1;
  }

LABEL_17:
  if (v9) {
    goto LABEL_18;
  }
LABEL_19:
  if (!v8) {

  }
LABEL_22:
  return v10;
}

- (unint64_t)hash
{
  id v3 = [(ASDAUStripInfo *)self path];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(ASDAUStripInfo *)self value];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)path
{
  return self->_path;
}

- (NSDictionary)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end