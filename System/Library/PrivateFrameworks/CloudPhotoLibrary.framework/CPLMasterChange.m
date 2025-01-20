@interface CPLMasterChange
+ (BOOL)requiresStableHashForResourceType:(unint64_t)a3;
+ (BOOL)supportsDeletion;
+ (BOOL)supportsResourceType:(unint64_t)a3;
+ (BOOL)supportsResources;
+ (BOOL)supportsSharing;
- (BOOL)allowsToOnlyUploadNewResources;
- (BOOL)inTrash;
- (BOOL)isImage;
- (BOOL)isMasterChange;
- (BOOL)isResourceTypeAGeneratedDerivative:(unint64_t)a3;
- (BOOL)isVideo;
- (BOOL)validateRecordForTracker:(id)a3;
- (CPLMasterChange)init;
- (NSArray)expungeableResourceStates;
- (NSArray)resources;
- (NSData)mediaMetaData;
- (NSDate)creationDate;
- (NSDate)importDate;
- (NSString)codec;
- (NSString)filename;
- (NSString)importGroupIdentifier;
- (NSString)importedByBundleIdentifier;
- (NSString)importedByDisplayName;
- (NSString)itemType;
- (NSString)mediaMetaDataType;
- (NSString)originatingFingerprint;
- (id)checkDefaultValueBlockForPropertyWithSelector:(SEL)a3;
- (id)dateDeleted;
- (id)fingerprintSchemeWithContext:(id)a3;
- (id)name;
- (id)propertiesDescription;
- (id)propertiesForChangeType:(unint64_t)a3;
- (id)resourceForType:(unint64_t)a3;
- (int64_t)dequeueOrder;
- (int64_t)originalOrientation;
- (signed)importedBy;
- (signed)videoFrameRate;
- (unint64_t)dataClassType;
- (unint64_t)fullSizeJPEGSource;
- (void)_copyDerivatives:(unint64_t *)a3 count:(int)a4 ifMatchingResourceType:(unint64_t)a5 fromRecord:(id)a6 inResourcePerType:(id)a7;
- (void)copyDerivativesFromRecordIfPossible:(id)a3;
- (void)setCodec:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setExpungeableResourceStates:(id)a3;
- (void)setFilename:(id)a3;
- (void)setFullSizeJPEGSource:(unint64_t)a3;
- (void)setImportDate:(id)a3;
- (void)setImportGroupIdentifier:(id)a3;
- (void)setImportedBy:(signed __int16)a3;
- (void)setImportedByBundleIdentifier:(id)a3;
- (void)setImportedByDisplayName:(id)a3;
- (void)setItemType:(id)a3;
- (void)setMediaMetaData:(id)a3;
- (void)setMediaMetaDataType:(id)a3;
- (void)setOriginalOrientation:(int64_t)a3;
- (void)setOriginatingFingerprint:(id)a3;
- (void)setResources:(id)a3;
- (void)setVideoFrameRate:(signed __int16)a3;
@end

@implementation CPLMasterChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codec, 0);
  objc_storeStrong((id *)&self->_importedByDisplayName, 0);
  objc_storeStrong((id *)&self->_importedByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_originatingFingerprint, 0);
  objc_storeStrong((id *)&self->_mediaMetaData, 0);
  objc_storeStrong((id *)&self->_mediaMetaDataType, 0);
  objc_storeStrong((id *)&self->_importGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_importDate, 0);
  objc_storeStrong((id *)&self->_itemType, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_expungeableResourceStates, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_fingerprintScheme, 0);

  objc_storeStrong((id *)&self->_resourcePerResourceType, 0);
}

- (void)setCodec:(id)a3
{
}

- (NSString)codec
{
  return self->_codec;
}

- (void)setVideoFrameRate:(signed __int16)a3
{
  self->_videoFrameRate = a3;
}

- (signed)videoFrameRate
{
  return self->_videoFrameRate;
}

- (void)setImportedByDisplayName:(id)a3
{
}

- (NSString)importedByDisplayName
{
  return self->_importedByDisplayName;
}

- (void)setImportedByBundleIdentifier:(id)a3
{
}

- (NSString)importedByBundleIdentifier
{
  return self->_importedByBundleIdentifier;
}

- (void)setImportedBy:(signed __int16)a3
{
  self->_importedBy = a3;
}

- (signed)importedBy
{
  return self->_importedBy;
}

- (void)setOriginatingFingerprint:(id)a3
{
}

- (NSString)originatingFingerprint
{
  return self->_originatingFingerprint;
}

- (void)setFullSizeJPEGSource:(unint64_t)a3
{
  self->_fullSizeJPEGSource = a3;
}

- (unint64_t)fullSizeJPEGSource
{
  return self->_fullSizeJPEGSource;
}

- (void)setOriginalOrientation:(int64_t)a3
{
  self->_originalOrientation = a3;
}

- (int64_t)originalOrientation
{
  return self->_originalOrientation;
}

- (void)setMediaMetaData:(id)a3
{
}

- (NSData)mediaMetaData
{
  return self->_mediaMetaData;
}

- (void)setMediaMetaDataType:(id)a3
{
}

- (NSString)mediaMetaDataType
{
  return self->_mediaMetaDataType;
}

- (void)setImportGroupIdentifier:(id)a3
{
}

- (NSString)importGroupIdentifier
{
  return self->_importGroupIdentifier;
}

- (void)setFilename:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setImportDate:(id)a3
{
}

- (NSDate)importDate
{
  return self->_importDate;
}

- (void)setItemType:(id)a3
{
}

- (NSString)itemType
{
  return self->_itemType;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSArray)expungeableResourceStates
{
  return self->_expungeableResourceStates;
}

- (NSArray)resources
{
  return self->_resources;
}

- (id)dateDeleted
{
  return 0;
}

- (BOOL)inTrash
{
  return 0;
}

- (BOOL)isMasterChange
{
  return 1;
}

- (BOOL)allowsToOnlyUploadNewResources
{
  return 1;
}

- (BOOL)isResourceTypeAGeneratedDerivative:(unint64_t)a3
{
  if (a3 == 2) {
    return 1;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)CPLMasterChange;
  return -[CPLRecordChange isResourceTypeAGeneratedDerivative:](&v6, sel_isResourceTypeAGeneratedDerivative_);
}

- (unint64_t)dataClassType
{
  if (![(NSString *)self->_itemType length]) {
    return 0;
  }
  uint64_t v3 = [MEMORY[0x1E4F442D8] typeWithIdentifier:self->_itemType];
  if ([v3 conformsToType:*MEMORY[0x1E4F44400]])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 conformsToType:*MEMORY[0x1E4F44448]])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 conformsToType:*MEMORY[0x1E4F44330]])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)name
{
  return 0;
}

- (void)copyDerivativesFromRecordIfPossible:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 supportsResources])
  {
    if ([v4 isMasterChange])
    {
      uint64_t v5 = 18;
      goto LABEL_6;
    }
    if ([v4 isAssetChange])
    {
      uint64_t v5 = 19;
LABEL_6:
      id v6 = (id)[(NSDictionary *)self->_resourcePerResourceType mutableCopy];
      if (!v6) {
        id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      unint64_t v7 = [v6 count];
      uint64_t v8 = [v4 resourceForType:v5];

      if (v8)
      {
        [(CPLMasterChange *)self _copyDerivatives:&copyDerivativesFromRecordIfPossible__originalDerivativesImage count:4 ifMatchingResourceType:1 fromRecord:v4 inResourcePerType:v6];
        v9 = &copyDerivativesFromRecordIfPossible__originalDerivativesVideo;
        v10 = self;
        uint64_t v11 = 5;
        uint64_t v12 = 18;
      }
      else
      {
        v9 = &copyDerivativesFromRecordIfPossible__originalDerivativesImageAndVideo;
        v10 = self;
        uint64_t v11 = 9;
        uint64_t v12 = 1;
      }
      [(CPLMasterChange *)v10 _copyDerivatives:v9 count:v11 ifMatchingResourceType:v12 fromRecord:v4 inResourcePerType:v6];
      if (v7 >= [v6 count])
      {
        if (_CPLSilentLogging)
        {
LABEL_21:

          goto LABEL_22;
        }
        v20 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = objc_opt_class();
          id v22 = v21;
          v23 = [v4 scopedIdentifier];
          v24 = objc_opt_class();
          id v25 = v24;
          v26 = [(CPLRecordChange *)self scopedIdentifier];
          *(_DWORD *)buf = 138413058;
          unint64_t v29 = (unint64_t)v21;
          __int16 v30 = 2112;
          v31 = v23;
          __int16 v32 = 2112;
          v33 = v24;
          __int16 v34 = 2112;
          v35 = v26;
          _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_DEFAULT, "Found no derivatives to copy from <%@ %@> to <%@ %@>", buf, 0x2Au);
        }
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          v13 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v14 = [v6 count] - v7;
            v15 = objc_opt_class();
            id v27 = v15;
            v16 = [v4 scopedIdentifier];
            v17 = objc_opt_class();
            id v18 = v17;
            v19 = [(CPLRecordChange *)self scopedIdentifier];
            *(_DWORD *)buf = 134219010;
            unint64_t v29 = v14;
            __int16 v30 = 2112;
            v31 = v15;
            __int16 v32 = 2112;
            v33 = v16;
            __int16 v34 = 2112;
            v35 = v17;
            __int16 v36 = 2112;
            v37 = v19;
            _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "Automatically copied %lu derivatives from <%@ %@> to <%@ %@>", buf, 0x34u);
          }
        }
        v20 = [v6 allValues];
        [(CPLMasterChange *)self setResources:v20];
      }

      goto LABEL_21;
    }
  }
LABEL_22:
}

- (void)_copyDerivatives:(unint64_t *)a3 count:(int)a4 ifMatchingResourceType:(unint64_t)a5 fromRecord:(id)a6 inResourcePerType:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v22 = a6;
  id v12 = a7;
  v13 = [NSNumber numberWithUnsignedInteger:a5];
  unint64_t v14 = [v12 objectForKeyedSubscript:v13];

  if (v14)
  {
    uint64_t v15 = [v14 sourceResourceType];
    if (v15)
    {
      uint64_t v16 = v15;
      v17 = [v22 resourceForType:v15];
      id v18 = [v14 identity];
      uint64_t v19 = [v18 fingerPrint];

      v20 = [v17 identity];
      uint64_t v21 = [v20 fingerPrint];

      if (v19 && v21)
      {
        if (([(id)v19 isEqual:v21] & 1) == 0) {
          goto LABEL_9;
        }
      }
      else if (v19 | v21)
      {
LABEL_9:

        goto LABEL_10;
      }
      [(CPLRecordChange *)self copyDerivatives:a3 count:v9 avoidResourceType:v16 fromRecord:v22 inResourcePerType:v12];
      goto LABEL_9;
    }
  }
LABEL_10:
}

- (id)resourceForType:(unint64_t)a3
{
  resourcePerResourceType = self->_resourcePerResourceType;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v5 = [(NSDictionary *)resourcePerResourceType objectForKeyedSubscript:v4];

  return v5;
}

- (void)setExpungeableResourceStates:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[CPLExpungeableResourceState normalizedExpungeableResourceStatesFromExpungeableResourceStates:v5];
  uint64_t v7 = [(NSArray *)v6 count];
  uint64_t v8 = [v5 count];

  if (v7 != v8 && _CPLSilentLogging == 0)
  {
    v10 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      id v12 = v11;
      v13 = [(CPLRecordChange *)self scopedIdentifier];
      unint64_t v14 = NSStringFromSelector(a2);
      int v16 = 138412802;
      v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      __int16 v20 = 2114;
      uint64_t v21 = v14;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "<%@ %@> %{public}@ got duplicate or incorrect resource types", (uint8_t *)&v16, 0x20u);
    }
  }
  expungeableResourceStates = self->_expungeableResourceStates;
  self->_expungeableResourceStates = v6;
}

- (void)setResources:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v20 = 0;
  id v5 = a3;
  id v6 = +[CPLResource normalizedResourcesFromResources:v5 resourcePerResourceType:&v20];
  uint64_t v7 = (NSDictionary *)v20;
  uint64_t v8 = [(NSArray *)v6 count];
  uint64_t v9 = [v5 count];

  if (v8 != v9 && _CPLSilentLogging == 0)
  {
    uint64_t v11 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = objc_opt_class();
      id v13 = v12;
      unint64_t v14 = [(CPLRecordChange *)self scopedIdentifier];
      uint64_t v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      v24 = v14;
      __int16 v25 = 2114;
      v26 = v15;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "<%@ %@> %{public}@ got duplicate or incorrect resource types", buf, 0x20u);
    }
  }
  resources = self->_resources;
  self->_resources = v6;
  v17 = v6;

  resourcePerResourceType = self->_resourcePerResourceType;
  self->_resourcePerResourceType = v7;
  uint64_t v19 = v7;
}

- (id)checkDefaultValueBlockForPropertyWithSelector:(SEL)a3
{
  if (sel_fullSizeJPEGSource == a3)
  {
    uint64_t v3 = &__block_literal_global_29;
  }
  else if (sel_originatingFingerprint == a3)
  {
    uint64_t v3 = &__block_literal_global_33;
  }
  else if (sel_importedBy == a3)
  {
    uint64_t v3 = &__block_literal_global_37;
  }
  else if (sel_importedByBundleIdentifier == a3)
  {
    uint64_t v3 = &__block_literal_global_41;
  }
  else if (sel_importedByDisplayName == a3)
  {
    uint64_t v3 = &__block_literal_global_45;
  }
  else if (sel_videoFrameRate == a3)
  {
    uint64_t v3 = &__block_literal_global_49;
  }
  else if (sel_codec == a3)
  {
    uint64_t v3 = &__block_literal_global_53;
  }
  else if (sel_expungeableResourceStates == a3)
  {
    uint64_t v3 = &__block_literal_global_57;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CPLMasterChange;
    uint64_t v3 = -[CPLRecordChange checkDefaultValueBlockForPropertyWithSelector:](&v5, sel_checkDefaultValueBlockForPropertyWithSelector_);
  }

  return v3;
}

BOOL __65__CPLMasterChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 expungeableResourceStates];
  if (v3)
  {
    id v4 = [v2 expungeableResourceStates];
    BOOL v5 = [v4 count] == 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

BOOL __65__CPLMasterChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = [a2 codec];
  BOOL v3 = v2 == 0;

  return v3;
}

BOOL __65__CPLMasterChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 videoFrameRate] == 0;
}

BOOL __65__CPLMasterChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 importedByDisplayName];
  BOOL v3 = v2 == 0;

  return v3;
}

BOOL __65__CPLMasterChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 importedByBundleIdentifier];
  BOOL v3 = v2 == 0;

  return v3;
}

BOOL __65__CPLMasterChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 importedBy] == 0;
}

BOOL __65__CPLMasterChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 originatingFingerprint];
  BOOL v3 = v2 == 0;

  return v3;
}

BOOL __65__CPLMasterChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke(uint64_t a1, void *a2)
{
  return [a2 fullSizeJPEGSource] == 0;
}

- (id)propertiesForChangeType:(unint64_t)a3
{
  if (a3 == 8)
  {
    if (propertiesForChangeType__onceToken != -1) {
      dispatch_once(&propertiesForChangeType__onceToken, &__block_literal_global_2435);
    }
    id v3 = (id)propertiesForChangeType__properties;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CPLMasterChange;
    -[CPLItemChange propertiesForChangeType:](&v5, sel_propertiesForChangeType_);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

uint64_t __43__CPLMasterChange_propertiesForChangeType___block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"resources", @"resourceCopyFromScopedIdentifier", 0);
  uint64_t v1 = propertiesForChangeType__properties;
  propertiesForChangeType__properties = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)propertiesDescription
{
  unint64_t v3 = [(CPLRecordChange *)self changeType];
  unint64_t v4 = v3;
  if (!v3 || (v3 & 2) != 0)
  {
    filename = (__CFString *)self->_filename;
    if (!filename) {
      filename = @"no filename";
    }
    objc_super v5 = filename;
    if (!v4 || (v4 & 8) != 0)
    {
      id v7 = [NSString alloc];
      uint64_t v8 = [(CPLRecordChange *)self resourcesDescription];
      uint64_t v9 = [v7 initWithFormat:@"%@ / %@", v5, v8];

      objc_super v5 = (__CFString *)v9;
    }
  }
  else if ((v3 & 8) != 0)
  {
    objc_super v5 = [(CPLRecordChange *)self resourcesDescription];
  }
  else
  {
    objc_super v5 = &stru_1F0D5F858;
  }

  return v5;
}

- (int64_t)dequeueOrder
{
  unint64_t v3 = [(CPLMasterChange *)self creationDate];
  unint64_t v4 = v3;
  if (v3)
  {
    [v3 timeIntervalSinceReferenceDate];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CPLMasterChange;
    double v5 = (double)[(CPLRecordChange *)&v8 dequeueOrder];
  }
  int64_t v6 = (uint64_t)v5;

  return v6;
}

- (BOOL)isVideo
{
  NSUInteger v3 = [(NSString *)self->_itemType length];
  if (v3)
  {
    unint64_t v4 = [MEMORY[0x1E4F442D8] typeWithIdentifier:self->_itemType];
    char v5 = [v4 conformsToType:*MEMORY[0x1E4F44448]];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isImage
{
  NSUInteger v3 = [(NSString *)self->_itemType length];
  if (v3)
  {
    unint64_t v4 = [MEMORY[0x1E4F442D8] typeWithIdentifier:self->_itemType];
    char v5 = [v4 conformsToType:*MEMORY[0x1E4F44400]];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)fingerprintSchemeWithContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  fingerprintScheme = self->_fingerprintScheme;
  if (!fingerprintScheme)
  {
    if (!v5)
    {
      if (!_CPLSilentLogging)
      {
        id v13 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v17 = self;
          _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_ERROR, "Trying to get fingerprint scheme for %@ without a context", buf, 0xCu);
        }
      }
      unint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLMasterChange.m"];
      [v14 handleFailureInMethod:a2, self, v15, 45, @"Trying to get fingerprint scheme for %@ without a context", self object file lineNumber description];

      abort();
    }
    id v7 = [(CPLRecordChange *)self scopedIdentifier];
    objc_super v8 = [v7 identifier];
    uint64_t v9 = [v5 fingerprintSchemeForMasterIdentifier:v8];
    v10 = self->_fingerprintScheme;
    self->_fingerprintScheme = v9;

    fingerprintScheme = self->_fingerprintScheme;
  }
  uint64_t v11 = fingerprintScheme;

  return v11;
}

- (CPLMasterChange)init
{
  v8.receiver = self;
  v8.super_class = (Class)CPLMasterChange;
  id v2 = [(CPLItemChange *)&v8 init];
  NSUInteger v3 = v2;
  if (v2)
  {
    resources = v2->_resources;
    v2->_resources = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v5 = [(id)*MEMORY[0x1E4F44400] identifier];
    itemType = v3->_itemType;
    v3->_itemType = (NSString *)v5;
  }
  return v3;
}

+ (BOOL)supportsDeletion
{
  return 0;
}

+ (BOOL)requiresStableHashForResourceType:(unint64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CPLMasterChange;
  return objc_msgSendSuper2(&v6, sel_requiresStableHashForResourceType_);
}

+ (BOOL)supportsResourceType:(unint64_t)a3
{
  return a3 != 27;
}

+ (BOOL)supportsResources
{
  return 1;
}

+ (BOOL)supportsSharing
{
  return 1;
}

- (BOOL)validateRecordForTracker:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CPLMasterChange;
  if ([(CPLRecordChange *)&v17 validateRecordForTracker:v4])
  {
    if (__CPLCheckOriginalResourceInMaster && [(CPLRecordChange *)self hasChangeType:8])
    {
      uint64_t v5 = [(CPLMasterChange *)self resourceForType:1];
      if (!v5)
      {
        if (!_CPLSilentLogging)
        {
          v10 = __CPLSessionOSLogDomain_15527();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v19 = self;
            _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Client pushed a master with a missing original: %@", buf, 0xCu);
          }
          goto LABEL_16;
        }
LABEL_17:
        unint64_t v14 = [v4 pushChangeTasks];
        uint64_t v15 = [(CPLRecordChange *)self scopedIdentifier];
        [v14 addTask:0 forRecordWithScopedIdentifier:v15];

        BOOL v13 = 0;
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v6 = [(CPLRecordChange *)self _unscopedIdentifier];
      uint64_t v7 = [v5 identity];
      uint64_t v8 = [v7 fingerPrint];

      if (v6 && v8)
      {
        char v9 = [(id)v6 isEqual:v8];

        if ((v9 & 1) == 0) {
          goto LABEL_8;
        }
      }
      else
      {

        if (v6 | v8)
        {
LABEL_8:
          if (!_CPLSilentLogging)
          {
            v10 = __CPLSessionOSLogDomain_15527();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              uint64_t v11 = [v5 identity];
              id v12 = [v11 fingerPrint];
              *(_DWORD *)buf = 138412546;
              uint64_t v19 = v12;
              __int16 v20 = 2112;
              uint64_t v21 = self;
              _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Client pushed a master with a mismatched original finger print %@: %@", buf, 0x16u);
            }
LABEL_16:

            goto LABEL_17;
          }
          goto LABEL_17;
        }
      }
      BOOL v13 = 1;
      goto LABEL_20;
    }
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_21:

  return v13;
}

@end