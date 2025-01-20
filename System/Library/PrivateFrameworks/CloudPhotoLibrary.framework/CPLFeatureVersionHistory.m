@interface CPLFeatureVersionHistory
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CPLFeatureVersionHistory)initWithCoder:(id)a3;
- (CPLFeatureVersionHistory)initWithCurrentFeatureVersion:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)syncAnchorForFeatureVersion:(int64_t)a3;
- (int64_t)currentFeatureVersion;
- (int64_t)featureVersionForSyncAnchor:(id)a3;
- (unint64_t)hash;
- (void)addSyncAnchor:(id)a3 forFeatureVersion:(int64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateHistoryWithBlock:(id)a3;
@end

@implementation CPLFeatureVersionHistory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionToAnchor, 0);
  objc_storeStrong((id *)&self->_anchorToVersion, 0);
}

- (int64_t)currentFeatureVersion
{
  return self->_currentFeatureVersion;
}

- (void)enumerateHistoryWithBlock:(id)a3
{
  v4 = (void (**)(id, int64_t, void *, unsigned char *))a3;
  if ((self->_currentFeatureVersion & 0x8000000000000000) == 0)
  {
    int64_t v5 = -1;
    while (1)
    {
      ++v5;
      versionToAnchor = self->_versionToAnchor;
      v7 = [NSNumber numberWithInteger:v5];
      v8 = [(NSMutableDictionary *)versionToAnchor objectForKeyedSubscript:v7];

      if (v8)
      {
        char v9 = 0;
        v4[2](v4, v5, v8, &v9);
        if (v9) {
          break;
        }
      }

      if (v5 >= self->_currentFeatureVersion) {
        goto LABEL_8;
      }
    }
  }
LABEL_8:
}

- (id)description
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@ %ld", objc_opt_class(), self->_currentFeatureVersion];
  v4 = [(NSMutableDictionary *)self->_versionToAnchor allKeys];
  int64_t v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 1;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = [v11 integerValue];
        v13 = [(NSMutableDictionary *)self->_versionToAnchor objectForKeyedSubscript:v11];
        v14 = [(NSMutableDictionary *)self->_anchorToVersion objectForKeyedSubscript:v13];
        uint64_t v15 = [v14 integerValue];
        v16 = "-";
        if (v15 == v12) {
          v16 = ", ";
        }
        if (v8) {
          v16 = " anchors: ";
        }
        objc_msgSend(v3, "appendFormat:", @"%s%ld", v16, v12);

        char v8 = 0;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      char v8 = 0;
    }
    while (v7);
  }

  [v3 appendString:@">"];
  return v3;
}

- (int64_t)featureVersionForSyncAnchor:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_anchorToVersion objectForKeyedSubscript:a3];
  v4 = v3;
  if (v3) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)syncAnchorForFeatureVersion:(int64_t)a3
{
  versionToAnchor = self->_versionToAnchor;
  v4 = [NSNumber numberWithInteger:a3];
  int64_t v5 = [(NSMutableDictionary *)versionToAnchor objectForKeyedSubscript:v4];

  return v5;
}

- (void)addSyncAnchor:(id)a3 forFeatureVersion:(int64_t)a4
{
  id v9 = (id)[a3 copy];
  uint64_t v6 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)self->_versionToAnchor setObject:v9 forKeyedSubscript:v6];
  uint64_t v7 = [(NSMutableDictionary *)self->_anchorToVersion objectForKeyedSubscript:v9];
  char v8 = v7;
  if (!v7 || [v7 integerValue] > a4) {
    [(NSMutableDictionary *)self->_anchorToVersion setObject:v6 forKeyedSubscript:v9];
  }
}

- (unint64_t)hash
{
  int64_t currentFeatureVersion = self->_currentFeatureVersion;
  return [(NSMutableDictionary *)self->_versionToAnchor hash] ^ currentFeatureVersion;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CPLFeatureVersionHistory *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_currentFeatureVersion == v4->_currentFeatureVersion)
    {
      unint64_t v5 = self->_versionToAnchor;
      uint64_t v6 = v4->_versionToAnchor;
      unint64_t v7 = (unint64_t)v6;
      BOOL v8 = v5 && v6 && ([(id)v5 isEqual:v6] & 1) != 0 || (v5 | v7) == 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (CPLFeatureVersionHistory)initWithCurrentFeatureVersion:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CPLFeatureVersionHistory;
  v4 = [(CPLFeatureVersionHistory *)&v11 init];
  unint64_t v5 = v4;
  if (v4)
  {
    v4->_int64_t currentFeatureVersion = a3;
    uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    anchorToVersion = v5->_anchorToVersion;
    v5->_anchorToVersion = v6;

    BOOL v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    versionToAnchor = v5->_versionToAnchor;
    v5->_versionToAnchor = v8;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[CPLFeatureVersionHistory alloc] initWithCurrentFeatureVersion:self->_currentFeatureVersion];
  uint64_t v5 = [(NSMutableDictionary *)self->_versionToAnchor copy];
  versionToAnchor = v4->_versionToAnchor;
  v4->_versionToAnchor = (NSMutableDictionary *)v5;

  uint64_t v7 = [(NSMutableDictionary *)self->_anchorToVersion copy];
  anchorToVersion = v4->_anchorToVersion;
  v4->_anchorToVersion = (NSMutableDictionary *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t currentFeatureVersion = self->_currentFeatureVersion;
  id v5 = a3;
  [v5 encodeInteger:currentFeatureVersion forKey:@"current"];
  [v5 encodeObject:self->_versionToAnchor forKey:@"versions"];
}

- (CPLFeatureVersionHistory)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = -[CPLFeatureVersionHistory initWithCurrentFeatureVersion:](self, "initWithCurrentFeatureVersion:", [v4 decodeIntegerForKey:@"current"]);
  if (v5)
  {
    if (initWithCoder__onceToken_19551 != -1) {
      dispatch_once(&initWithCoder__onceToken_19551, &__block_literal_global_19552);
    }
    uint64_t v6 = [v4 decodeObjectOfClasses:initWithCoder__versionsClasses forKey:@"versions"];
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 1;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __42__CPLFeatureVersionHistory_initWithCoder___block_invoke_2;
        v13[3] = &unk_1E60AA6D8;
        v14[1] = &v15;
        v14[0] = v5;
        [v6 enumerateKeysAndObjectsUsingBlock:v13];
        uint64_t v7 = (id *)v14;
      }
      else
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __42__CPLFeatureVersionHistory_initWithCoder___block_invoke_9;
        block[3] = &unk_1E60A5DD8;
        uint64_t v7 = (id *)&v12;
        uint64_t v12 = v5;
        if (initWithCoder__logOnceToken_19554 != -1) {
          dispatch_once(&initWithCoder__logOnceToken_19554, block);
        }
        *((unsigned char *)v16 + 24) = 0;
      }

      int v8 = *((unsigned __int8 *)v16 + 24);
      _Block_object_dispose(&v15, 8);

      if (!v8)
      {
        id v9 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      _Block_object_dispose(&v15, 8);
    }
  }
  id v9 = v5;
LABEL_13:

  return v9;
}

void __42__CPLFeatureVersionHistory_initWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_msgSend(*(id *)(a1 + 32), "addSyncAnchor:forFeatureVersion:", v8, objc_msgSend(v7, "integerValue"));
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__CPLFeatureVersionHistory_initWithCoder___block_invoke_3;
    block[3] = &unk_1E60A6660;
    id v10 = *(id *)(a1 + 32);
    id v11 = v7;
    id v12 = v8;
    if (initWithCoder__logOnceToken_19554 != -1) {
      dispatch_once(&initWithCoder__logOnceToken_19554, block);
    }
    *a4 = 1;
  }
}

void __42__CPLFeatureVersionHistory_initWithCoder___block_invoke_9()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    v0 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      int v2 = 138412290;
      id v3 = (id)objc_opt_class();
      id v1 = v3;
      _os_log_impl(&dword_1B4CAC000, v0, OS_LOG_TYPE_ERROR, "Failed to deserialize %@ - missing versionToAnchor", (uint8_t *)&v2, 0xCu);
    }
  }
}

void __42__CPLFeatureVersionHistory_initWithCoder___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    int v2 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v3 = objc_opt_class();
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      int v7 = 138412802;
      id v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      id v6 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_ERROR, "Failed to deserialize %@ - invalid versionToAnchor dictionary %@: %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

uint64_t __42__CPLFeatureVersionHistory_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  uint64_t v4 = initWithCoder__versionsClasses;
  initWithCoder__versionsClasses = v3;
  return MEMORY[0x1F41817F8](v3, v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end