@interface CPLLibraryInfo
+ (BOOL)supportsSecureCoding;
+ (id)cplAdditionalSecureClassesForProperty:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CPLAccountFlags)accountFlags;
- (CPLFeatureVersionHistory)featureVersionHistory;
- (CPLLibraryInfo)initWithCoder:(id)a3;
- (CPLMomentShare)momentShare;
- (NSData)accountFlagsData;
- (NSDictionary)assetCounts;
- (NSNumber)featureCompatibleVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)prettyDescriptionWithAnchorDesciptionBlock:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountFlagsData:(id)a3;
- (void)setAssetCounts:(id)a3;
- (void)setFeatureCompatibleVersion:(id)a3;
- (void)setFeatureVersionHistory:(id)a3;
- (void)setMomentShare:(id)a3;
@end

@implementation CPLLibraryInfo

+ (id)cplAdditionalSecureClassesForProperty:(id)a3
{
  id v4 = a3;
  if (cplAdditionalSecureClassesForProperty__onceToken_157 != -1) {
    dispatch_once(&cplAdditionalSecureClassesForProperty__onceToken_157, &__block_literal_global_159);
  }
  v5 = [(id)cplAdditionalSecureClassesForProperty__additionalClasses_156 objectForKey:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___CPLLibraryInfo;
    objc_msgSendSuper2(&v10, sel_cplAdditionalSecureClassesForProperty_, v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

void __69__CPLLibraryInfo_CPLNSCoding__cplAdditionalSecureClassesForProperty___block_invoke()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"assetCounts";
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = (void *)cplAdditionalSecureClassesForProperty__additionalClasses_156;
  cplAdditionalSecureClassesForProperty__additionalClasses_156 = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureCompatibleVersion, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_accountFlagsData, 0);
  objc_storeStrong((id *)&self->_featureVersionHistory, 0);
  objc_storeStrong((id *)&self->_assetCounts, 0);
}

- (void)setFeatureCompatibleVersion:(id)a3
{
}

- (NSNumber)featureCompatibleVersion
{
  return self->_featureCompatibleVersion;
}

- (void)setMomentShare:(id)a3
{
}

- (CPLMomentShare)momentShare
{
  return self->_momentShare;
}

- (void)setAccountFlagsData:(id)a3
{
}

- (NSData)accountFlagsData
{
  return self->_accountFlagsData;
}

- (void)setFeatureVersionHistory:(id)a3
{
}

- (CPLFeatureVersionHistory)featureVersionHistory
{
  return self->_featureVersionHistory;
}

- (void)setAssetCounts:(id)a3
{
}

- (NSDictionary)assetCounts
{
  return self->_assetCounts;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDictionary *)self->_assetCounts hash];
  unint64_t v4 = [(CPLFeatureVersionHistory *)self->_featureVersionHistory hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_accountFlagsData hash];
  unint64_t v6 = v4 ^ v5 ^ [(CPLMomentShare *)self->_momentShare hash];
  return v6 ^ [(NSNumber *)self->_featureCompatibleVersion hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (CPLLibraryInfo *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_22;
  }
  unint64_t v5 = self->_assetCounts;
  unint64_t v6 = (void *)v5;
  assetCounts = v4->_assetCounts;
  if (v5 && assetCounts)
  {
    char v8 = objc_msgSend((id)v5, "isEqual:");

    if ((v8 & 1) == 0) {
      goto LABEL_22;
    }
  }
  else
  {
    unint64_t v10 = v5 | (unint64_t)assetCounts;

    if (v10) {
      goto LABEL_22;
    }
  }
  unint64_t v11 = self->_featureVersionHistory;
  v12 = (void *)v11;
  featureVersionHistory = v4->_featureVersionHistory;
  if (v11 && featureVersionHistory)
  {
    BOOL v14 = objc_msgSend((id)v11, "isEqual:");

    if (!v14) {
      goto LABEL_22;
    }
  }
  else
  {
    unint64_t v15 = v11 | (unint64_t)featureVersionHistory;

    if (v15) {
      goto LABEL_22;
    }
  }
  unint64_t v16 = self->_accountFlagsData;
  v17 = (void *)v16;
  accountFlagsData = v4->_accountFlagsData;
  if (v16 && accountFlagsData)
  {
    char v19 = objc_msgSend((id)v16, "isEqual:");

    if ((v19 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  unint64_t v20 = v16 | (unint64_t)accountFlagsData;

  if (v20)
  {
LABEL_22:
    BOOL v9 = 0;
    goto LABEL_23;
  }
LABEL_19:
  unint64_t v21 = self->_momentShare;
  v22 = (void *)v21;
  momentShare = v4->_momentShare;
  if (v21 && momentShare)
  {
    BOOL v24 = objc_msgSend((id)v21, "isEqual:");

    if (!v24) {
      goto LABEL_22;
    }
  }
  else
  {
    unint64_t v26 = v21 | (unint64_t)momentShare;

    if (v26) {
      goto LABEL_22;
    }
  }
  unint64_t v27 = self->_featureCompatibleVersion;
  v28 = v4->_featureCompatibleVersion;
  unint64_t v29 = (unint64_t)v28;
  BOOL v9 = v27 && v28 && ([(id)v27 isEqual:v28] & 1) != 0 || (v27 | v29) == 0;

LABEL_23:
  return v9;
}

- (CPLAccountFlags)accountFlags
{
  if (self->_accountFlagsData) {
    v2 = [[CPLAccountFlags alloc] initWithData:self->_accountFlagsData];
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (id)prettyDescriptionWithAnchorDesciptionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__13559;
  v46 = __Block_byref_object_dispose__13560;
  id v47 = 0;
  unint64_t v5 = &__block_literal_global_24;
  if (v4) {
    unint64_t v5 = v4;
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__13559;
  v40 = __Block_byref_object_dispose__13560;
  id v41 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = -1;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = -1;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __61__CPLLibraryInfo_prettyDescriptionWithAnchorDesciptionBlock___block_invoke_2;
  v26[3] = &unk_1E60A8ED0;
  v28 = &v42;
  unint64_t v29 = v35;
  id v6 = v5;
  id v27 = v6;
  v30 = &v36;
  id v7 = (void *)MEMORY[0x1BA994060](v26);
  featureVersionHistory = self->_featureVersionHistory;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__CPLLibraryInfo_prettyDescriptionWithAnchorDesciptionBlock___block_invoke_3;
  v21[3] = &unk_1E60A8EF8;
  v23 = &v31;
  BOOL v24 = &v36;
  v25 = v35;
  id v9 = v7;
  id v22 = v9;
  [(CPLFeatureVersionHistory *)featureVersionHistory enumerateHistoryWithBlock:v21];
  if (v37[5]) {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, v32[3]);
  }
  if (!v43[5])
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"History: None"];
    unint64_t v11 = (void *)v43[5];
    v43[5] = v10;
  }
  v12 = NSString;
  uint64_t v13 = [(CPLLibraryInfo *)self accountFlags];
  BOOL v14 = (void *)v13;
  if (v13) {
    unint64_t v15 = (__CFString *)v13;
  }
  else {
    unint64_t v15 = @"none";
  }
  unint64_t v16 = [(CPLLibraryInfo *)self assetCounts];
  featureCompatibleVersion = self->_featureCompatibleVersion;
  int64_t v18 = [(CPLFeatureVersionHistory *)self->_featureVersionHistory currentFeatureVersion];
  char v19 = [v12 stringWithFormat:@"Account flags: %@\nAsset counts:\n%@\nFeature compatible version: %@\n\nCurrent feature version: %ld\n%@", v15, v16, featureCompatibleVersion, v18, v43[5]];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  return v19;
}

void __61__CPLLibraryInfo_prettyDescriptionWithAnchorDesciptionBlock___block_invoke_2(void *a1, uint64_t a2)
{
  id v4 = *(void **)(*(void *)(a1[5] + 8) + 40);
  uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 24);
  if (v4)
  {
    uint64_t v6 = (*(void (**)(void))(a1[4] + 16))();
    id v14 = (id)v6;
    if (v5 == a2) {
      [v4 appendFormat:@"\n  %ld: %@", a2, v6, v13];
    }
    else {
      [v4 appendFormat:@"\n  %ld-%ld: %@", v5, a2, v6];
    }
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
    uint64_t v8 = *(void *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v9 = (*(void (**)(void))(a1[4] + 16))();
    id v14 = (id)v9;
    if (v5 == a2) {
      uint64_t v10 = [v7 initWithFormat:@"History:\n  %ld: %@", v8, v9, v13];
    }
    else {
      uint64_t v10 = [v7 initWithFormat:@"History:\n  %ld-%ld: %@", v8, a2, v9];
    }
    uint64_t v11 = *(void *)(a1[5] + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

void __61__CPLLibraryInfo_prettyDescriptionWithAnchorDesciptionBlock___block_invoke_3(void *a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a2;
  uint64_t v7 = *(void *)(a1[6] + 8);
  uint64_t v10 = *(void **)(v7 + 40);
  uint64_t v8 = (id *)(v7 + 40);
  uint64_t v9 = v10;
  id v11 = v6;
  if (v10)
  {
    if ([v9 isEqual:v6]) {
      goto LABEL_5;
    }
    (*(void (**)(void))(a1[4] + 16))();
    uint64_t v8 = (id *)(*(void *)(a1[6] + 8) + 40);
  }
  objc_storeStrong(v8, a3);
  *(void *)(*(void *)(a1[7] + 8) + 24) = a2;
LABEL_5:
}

uint64_t __61__CPLLibraryInfo_prettyDescriptionWithAnchorDesciptionBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cplSyncAnchorSimpleDescription];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CPLLibraryInfo);
  [(CPLLibraryInfo *)v4 setAssetCounts:self->_assetCounts];
  uint64_t v5 = (void *)[(CPLFeatureVersionHistory *)self->_featureVersionHistory copy];
  [(CPLLibraryInfo *)v4 setFeatureVersionHistory:v5];

  [(CPLLibraryInfo *)v4 setAccountFlagsData:self->_accountFlagsData];
  id v6 = (void *)[(CPLMomentShare *)self->_momentShare copy];
  [(CPLLibraryInfo *)v4 setMomentShare:v6];

  uint64_t v7 = (void *)[(NSNumber *)self->_featureCompatibleVersion copy];
  [(CPLLibraryInfo *)v4 setFeatureCompatibleVersion:v7];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  assetCounts = self->_assetCounts;
  id v5 = a3;
  [v5 encodeObject:assetCounts forKey:@"counts"];
  [v5 encodeObject:self->_featureVersionHistory forKey:@"history"];
  [v5 encodeObject:self->_accountFlagsData forKey:@"flags"];
  [v5 encodeObject:self->_momentShare forKey:@"momentShare"];
  [v5 encodeObject:self->_featureCompatibleVersion forKey:@"featureCompatibleVersion"];
}

- (CPLLibraryInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CPLLibraryInfo;
  id v5 = [(CPLLibraryInfo *)&v30 init];
  if (v5)
  {
    if (initWithCoder__onceToken_13604 != -1) {
      dispatch_once(&initWithCoder__onceToken_13604, &__block_literal_global_13605);
    }
    uint64_t v6 = [v4 decodeObjectOfClasses:initWithCoder__countsClasses forKey:@"counts"];
    assetCounts = v5->_assetCounts;
    v5->_assetCounts = (NSDictionary *)v6;

    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 1;
    uint64_t v8 = v5->_assetCounts;
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __32__CPLLibraryInfo_initWithCoder___block_invoke_2;
    v23 = &unk_1E60A8E88;
    v25 = &v26;
    uint64_t v9 = v5;
    BOOL v24 = v9;
    [(NSDictionary *)v8 enumerateKeysAndObjectsUsingBlock:&v20];
    if (!*((unsigned char *)v27 + 24))
    {

      _Block_object_dispose(&v26, 8);
      int64_t v18 = 0;
      goto LABEL_8;
    }
    uint64_t v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), @"history", v20, v21, v22, v23);
    featureVersionHistory = v9->_featureVersionHistory;
    v9->_featureVersionHistory = (CPLFeatureVersionHistory *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flags"];
    accountFlagsData = v9->_accountFlagsData;
    v9->_accountFlagsData = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"momentShare"];
    momentShare = v9->_momentShare;
    v9->_momentShare = (CPLMomentShare *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureCompatibleVersion"];
    featureCompatibleVersion = v9->_featureCompatibleVersion;
    v9->_featureCompatibleVersion = (NSNumber *)v16;

    _Block_object_dispose(&v26, 8);
  }
  int64_t v18 = v5;
LABEL_8:

  return v18;
}

void __32__CPLLibraryInfo_initWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__CPLLibraryInfo_initWithCoder___block_invoke_3;
    block[3] = &unk_1E60A6660;
    id v10 = *(id *)(a1 + 32);
    id v11 = v7;
    id v12 = v8;
    if (initWithCoder__logOnceToken != -1) {
      dispatch_once(&initWithCoder__logOnceToken, block);
    }
    *a4 = 1;
  }
}

void __32__CPLLibraryInfo_initWithCoder___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    v2 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = objc_opt_class();
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      int v7 = 138412802;
      id v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      id v6 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_ERROR, "Failed to deserialize %@ - invalid assetCounts dictionary %@: %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

uint64_t __32__CPLLibraryInfo_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  uint64_t v4 = initWithCoder__countsClasses;
  initWithCoder__countsClasses = v3;
  return MEMORY[0x1F41817F8](v3, v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end