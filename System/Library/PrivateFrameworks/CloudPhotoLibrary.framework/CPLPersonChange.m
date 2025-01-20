@interface CPLPersonChange
+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3;
+ (BOOL)cplShouldIgnorePropertyForEquality:(id)a3;
+ (BOOL)serverSupportsAssetSortOrder;
+ (BOOL)serverSupportsDetectionType;
+ (BOOL)serverSupportsGraphPeopleHome;
+ (BOOL)serverSupportsMergeTargetRef;
+ (BOOL)supportsDeletion;
+ (BOOL)supportsDirectDeletion;
+ (Class)relatedRecordClass;
- (BOOL)validateRecordForTracker:(id)a3;
- (NSData)contactDescriptor;
- (NSDictionary)contactMatchingDictionary;
- (NSString)displayName;
- (NSString)fullName;
- (NSString)mergeTargetPersonIdentifier;
- (id)mergeTargetPersonScopedIdentifier;
- (int64_t)assetSortOrder;
- (int64_t)manualSortOrder;
- (int64_t)personType;
- (int64_t)verifiedType;
- (signed)detectionType;
- (void)setAssetSortOrder:(int64_t)a3;
- (void)setContactDescriptor:(id)a3;
- (void)setContactMatchingDictionary:(id)a3;
- (void)setDetectionType:(signed __int16)a3;
- (void)setDisplayName:(id)a3;
- (void)setFullName:(id)a3;
- (void)setManualSortOrder:(int64_t)a3;
- (void)setMergeTargetPersonIdentifier:(id)a3;
- (void)setMergeTargetPersonScopedIdentifier:(id)a3;
- (void)setPersonType:(int64_t)a3;
- (void)setVerifiedType:(int64_t)a3;
@end

@implementation CPLPersonChange

+ (BOOL)cplShouldIgnorePropertyForEquality:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"contactMatchingDictionary"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLPersonChange;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForEquality_, v4);
  }

  return v5;
}

+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"contactMatchingDictionary"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLPersonChange;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForCoding_, v4);
  }

  return v5;
}

+ (BOOL)supportsDirectDeletion
{
  return 1;
}

+ (BOOL)supportsDeletion
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactDescriptor, 0);
  objc_storeStrong((id *)&self->_mergeTargetPersonIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
}

- (void)setContactDescriptor:(id)a3
{
}

- (NSData)contactDescriptor
{
  return self->_contactDescriptor;
}

- (void)setMergeTargetPersonIdentifier:(id)a3
{
}

- (NSString)mergeTargetPersonIdentifier
{
  return self->_mergeTargetPersonIdentifier;
}

- (void)setDetectionType:(signed __int16)a3
{
  self->_detectionType = a3;
}

- (signed)detectionType
{
  return self->_detectionType;
}

- (void)setVerifiedType:(int64_t)a3
{
  self->_verifiedType = a3;
}

- (int64_t)verifiedType
{
  return self->_verifiedType;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setAssetSortOrder:(int64_t)a3
{
  self->_assetSortOrder = a3;
}

- (int64_t)assetSortOrder
{
  return self->_assetSortOrder;
}

- (void)setManualSortOrder:(int64_t)a3
{
  self->_manualSortOrder = a3;
}

- (int64_t)manualSortOrder
{
  return self->_manualSortOrder;
}

- (void)setPersonType:(int64_t)a3
{
  self->_personType = a3;
}

- (int64_t)personType
{
  return self->_personType;
}

- (void)setFullName:(id)a3
{
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setMergeTargetPersonScopedIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  uint64_t v5 = [v21 scopeIdentifier];
  v6 = [(CPLRecordChange *)self scopedIdentifier];
  uint64_t v7 = [v6 scopeIdentifier];

  if (v5 && v7)
  {
    char v8 = [(id)v5 isEqual:v7];

    if ((v8 & 1) == 0) {
      goto LABEL_4;
    }
  }
  else
  {

    if (v5 | v7)
    {
LABEL_4:
      if (!_CPLSilentLogging)
      {
        v9 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = NSStringFromSelector(a2);
          v11 = [(CPLRecordChange *)self scopedIdentifier];
          v12 = [v11 scopeIdentifier];
          v13 = [v21 scopeIdentifier];
          *(_DWORD *)buf = 138412802;
          v23 = v10;
          __int16 v24 = 2112;
          v25 = v12;
          __int16 v26 = 2112;
          v27 = v13;
          _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Invalid call to %@ with mismatched scope: %@ vs. %@", buf, 0x20u);
        }
      }
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPersonChange.m"];
      v16 = NSStringFromSelector(a2);
      v17 = [(CPLRecordChange *)self scopedIdentifier];
      v18 = [v17 scopeIdentifier];
      v19 = [v21 scopeIdentifier];
      [v14 handleFailureInMethod:a2, self, v15, 64, @"Invalid call to %@ with mismatched scope: %@ vs. %@", v16, v18, v19 object file lineNumber description];

      abort();
    }
  }
  v20 = [v21 identifier];
  [(CPLPersonChange *)self setMergeTargetPersonIdentifier:v20];
}

- (id)mergeTargetPersonScopedIdentifier
{
  v3 = [(CPLPersonChange *)self mergeTargetPersonIdentifier];
  if (v3)
  {
    id v4 = [CPLScopedIdentifier alloc];
    uint64_t v5 = [(CPLRecordChange *)self scopedIdentifier];
    id v6 = [(CPLScopedIdentifier *)v4 initRelativeToScopedIdentifier:v5 identifier:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)setContactMatchingDictionary:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v8 = 0;
    id v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:&v8];
    id v5 = v8;
    if (v4) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = _CPLSilentLogging == 0;
    }
    if (v6)
    {
      uint64_t v7 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v5;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Failed to encode contactMatchingDictionary as a plist: %@", buf, 0xCu);
      }
    }
    [(CPLPersonChange *)self setContactDescriptor:v4];
  }
  else
  {
    [(CPLPersonChange *)self setContactDescriptor:0];
  }
}

- (NSDictionary)contactMatchingDictionary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [(CPLPersonChange *)self contactDescriptor];
  if (v2)
  {
    id v8 = 0;
    v3 = [MEMORY[0x1E4F28F98] propertyListWithData:v2 options:0 format:0 error:&v8];
    id v4 = v8;
    if (v3) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = _CPLSilentLogging == 0;
    }
    if (v5)
    {
      BOOL v6 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v4;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Failed to decode contactDescriptor as a plist: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v3 = 0;
  }

  return (NSDictionary *)v3;
}

+ (BOOL)serverSupportsAssetSortOrder
{
  return 1;
}

+ (BOOL)serverSupportsDetectionType
{
  return 1;
}

+ (BOOL)serverSupportsMergeTargetRef
{
  if (serverSupportsMergeTargetRef_onceToken != -1) {
    dispatch_once(&serverSupportsMergeTargetRef_onceToken, &__block_literal_global_77_15385);
  }
  return serverSupportsMergeTargetRef_serverSupportsMergeTargetRef;
}

uint64_t __64__CPLPersonChange_DefaultsSupport__serverSupportsMergeTargetRef__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [v0 objectForKey:@"CPLServerSupportsMergeTargetRef"];

  v1 = v4;
  if (v4)
  {
    uint64_t v2 = [v4 BOOLValue];
    v1 = v4;
  }
  else
  {
    uint64_t v2 = 1;
  }
  serverSupportsMergeTargetRef_serverSupportsMergeTargetRef = v2;
  return MEMORY[0x1F41817F8](v2, v1);
}

+ (BOOL)serverSupportsGraphPeopleHome
{
  if (serverSupportsGraphPeopleHome_onceToken != -1) {
    dispatch_once(&serverSupportsGraphPeopleHome_onceToken, &__block_literal_global_15390);
  }
  return serverSupportsGraphPeopleHome_serverSupportsGraphPeopleHome;
}

uint64_t __65__CPLPersonChange_DefaultsSupport__serverSupportsGraphPeopleHome__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [v0 objectForKey:@"CPLServerSupportsGraphPeopleHome"];

  v1 = v4;
  if (v4)
  {
    uint64_t v2 = [v4 BOOLValue];
    v1 = v4;
  }
  else
  {
    uint64_t v2 = 1;
  }
  serverSupportsGraphPeopleHome_serverSupportsGraphPeopleHome = v2;
  return MEMORY[0x1F41817F8](v2, v1);
}

- (BOOL)validateRecordForTracker:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLPersonChange;
  if (![(CPLRecordChange *)&v9 validateRecordForTracker:v4]) {
    goto LABEL_7;
  }
  if ([(CPLRecordChange *)self hasChangeType:2]
    && +[CPLPersonChange serverSupportsGraphPeopleHome]
    && ![(CPLPersonChange *)self verifiedType])
  {
    BOOL v6 = [v4 pushChangeTasks];
    uint64_t v7 = [(CPLRecordChange *)self scopedIdentifier];
    [v6 addTask:0 forRecordWithScopedIdentifier:v7];

LABEL_7:
    BOOL v5 = 0;
    goto LABEL_8;
  }
  BOOL v5 = 1;
LABEL_8:

  return v5;
}

+ (Class)relatedRecordClass
{
  return (Class)objc_opt_class();
}

@end