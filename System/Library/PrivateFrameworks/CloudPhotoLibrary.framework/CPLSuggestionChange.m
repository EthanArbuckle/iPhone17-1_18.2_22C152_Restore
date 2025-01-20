@interface CPLSuggestionChange
+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3;
+ (BOOL)supportsDeletion;
+ (BOOL)supportsDirectDeletion;
+ (BOOL)supportsSecureCoding;
+ (id)_createTestSuggestionWithKeyAssets:(id)a3 representativeAssets:(id)a4;
- (CPLSuggestionChange)initWithCoder:(id)a3;
- (CPLSuggestionRecordList)recordList;
- (NSData)actionData;
- (NSData)featuresData;
- (NSDate)activationDate;
- (NSDate)creationDate;
- (NSDate)expungeDate;
- (NSDate)relevantUntilDate;
- (NSString)subtitle;
- (NSString)title;
- (id)checkDefaultValueBlockForPropertyWithSelector:(SEL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)propertiesDescription;
- (id)scopedIdentifiersForMapping;
- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4;
- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4;
- (int64_t)version;
- (unsigned)notificationState;
- (unsigned)state;
- (unsigned)subtype;
- (unsigned)type;
- (void)setActionData:(id)a3;
- (void)setActivationDate:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setExpungeDate:(id)a3;
- (void)setFeaturesData:(id)a3;
- (void)setNotificationState:(unsigned __int16)a3;
- (void)setRecordList:(id)a3;
- (void)setRelevantUntilDate:(id)a3;
- (void)setState:(unsigned __int16)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtype:(unsigned __int16)a3;
- (void)setTitle:(id)a3;
- (void)setType:(unsigned __int16)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation CPLSuggestionChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresData, 0);
  objc_storeStrong((id *)&self->_actionData, 0);
  objc_storeStrong((id *)&self->_expungeDate, 0);
  objc_storeStrong((id *)&self->_relevantUntilDate, 0);
  objc_storeStrong((id *)&self->_activationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_recordList, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setFeaturesData:(id)a3
{
}

- (NSData)featuresData
{
  return self->_featuresData;
}

- (void)setActionData:(id)a3
{
}

- (NSData)actionData
{
  return self->_actionData;
}

- (void)setExpungeDate:(id)a3
{
}

- (NSDate)expungeDate
{
  return self->_expungeDate;
}

- (void)setRelevantUntilDate:(id)a3
{
}

- (NSDate)relevantUntilDate
{
  return self->_relevantUntilDate;
}

- (void)setActivationDate:(id)a3
{
}

- (NSDate)activationDate
{
  return self->_activationDate;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setState:(unsigned __int16)a3
{
  self->_state = a3;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setNotificationState:(unsigned __int16)a3
{
  self->_notificationState = a3;
}

- (unsigned)notificationState
{
  return self->_notificationState;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setRecordList:(id)a3
{
}

- (CPLSuggestionRecordList)recordList
{
  return self->_recordList;
}

- (void)setSubtype:(unsigned __int16)a3
{
  self->_subtype = a3;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (void)setType:(unsigned __int16)a3
{
  self->_type = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (id)checkDefaultValueBlockForPropertyWithSelector:(SEL)a3
{
  if (sel_notificationState == a3)
  {
    v3 = &__block_literal_global_2260;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CPLSuggestionChange;
    v3 = -[CPLRecordChange checkDefaultValueBlockForPropertyWithSelector:](&v5, sel_checkDefaultValueBlockForPropertyWithSelector_);
  }
  return v3;
}

BOOL __69__CPLSuggestionChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke(uint64_t a1, void *a2)
{
  return [a2 notificationState] == 0;
}

- (id)propertiesDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu asset", -[CPLSuggestionRecordList assetsCount](self->_recordList, "assetsCount"));
}

+ (id)_createTestSuggestionWithKeyAssets:(id)a3 representativeAssets:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 firstObject];
  v8 = [v7 scopedIdentifier];
  v9 = [v8 scopeIdentifier];
  v10 = v9;
  v45 = v6;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v12 = [v6 firstObject];
    v13 = [v12 scopedIdentifier];
    v14 = [v13 scopeIdentifier];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      CPLPrimaryScopeIdentifierForCurrentUniverse();
      id v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v11 = v16;
  }
  v47 = v11;
  id v17 = +[CPLRecordChange newRecordInScopeWithIdentifier:v11];
  [v17 setTitle:@"Test suggestion title"];
  [v17 setSubtitle:@"Test suggestion subtitle"];
  [v17 setType:2];
  [v17 setSubtype:201];
  [v17 setState:1];
  v18 = [MEMORY[0x1E4F1C9C8] date];
  [v17 setCreationDate:v18];

  [v17 setVersion:1];
  v19 = [MEMORY[0x1E4F1C9C8] date];
  [v17 setActivationDate:v19];

  [v17 setNotificationState:0];
  v20 = [@"action data" dataUsingEncoding:4];
  [v17 setActionData:v20];

  v21 = [@"features data" dataUsingEncoding:4];
  [v17 setFeaturesData:v21];

  v44 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:86400.0];
  objc_msgSend(v17, "setRelevantUntilDate:");
  [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:5184000.0];
  v43 = v46 = v17;
  objc_msgSend(v17, "setExpungeDate:");
  v22 = objc_alloc_init(CPLSuggestionRecordList);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v23 = v5;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v53 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        v29 = objc_alloc_init(CPLSuggestionAssetFlag);
        [(CPLSuggestionAssetFlag *)v29 setIsKeyAsset:1];
        [(CPLSuggestionAssetFlag *)v29 setIsRepresentative:0];
        v30 = objc_alloc_init(CPLSuggestionAsset);
        v31 = [v28 _unscopedIdentifier];
        [(CPLSuggestionAsset *)v30 setAssetIdentifier:v31];

        [(CPLSuggestionAsset *)v30 setAssetFlag:v29];
        [(CPLSuggestionRecordList *)v22 addAsset:v30];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v25);
  }
  v42 = v23;

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v32 = v45;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v49 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        v38 = objc_alloc_init(CPLSuggestionAssetFlag);
        -[CPLSuggestionAssetFlag setIsKeyAsset:](v38, "setIsKeyAsset:", 0, v42);
        [(CPLSuggestionAssetFlag *)v38 setIsRepresentative:1];
        v39 = objc_alloc_init(CPLSuggestionAsset);
        v40 = [v37 _unscopedIdentifier];
        [(CPLSuggestionAsset *)v39 setAssetIdentifier:v40];

        [(CPLSuggestionAsset *)v39 setAssetFlag:v38];
        [(CPLSuggestionRecordList *)v22 addAsset:v39];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v34);
  }

  [v46 setRecordList:v22];
  return v46;
}

+ (BOOL)supportsDirectDeletion
{
  return 1;
}

+ (BOOL)supportsDeletion
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 cplCopyPropertiesFromObject:self withCopyBlock:0];
  return v4;
}

- (CPLSuggestionChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLSuggestionChange;
  id v5 = [(CPLRecordChange *)&v11 initWithCoder:v4];
  id v6 = v5;
  if (v5)
  {
    v7 = [(CPLSuggestionChange *)v5 recordList];

    if (!v7)
    {
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetList"];
      if ([v8 length])
      {
        v9 = [[CPLSuggestionRecordList alloc] initWithData:v8];
        if (initWithCoder__onceToken_84 != -1) {
          dispatch_once(&initWithCoder__onceToken_84, &__block_literal_global_86);
        }
        [(CPLSuggestionChange *)v6 setRecordList:v9];
      }
    }
  }

  return v6;
}

void __50__CPLSuggestionChange_CPLNSCoding__initWithCoder___block_invoke()
{
  if (!_CPLSilentLogging)
  {
    v0 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1B4CAC000, v0, OS_LOG_TYPE_DEFAULT, "Storage might contain old serialized assetList", v1, 2u);
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"assetList"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLSuggestionChange;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForCoding_, v4);
  }

  return v5;
}

- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v66.receiver = self;
  v66.super_class = (Class)CPLSuggestionChange;
  objc_super v7 = [(CPLRecordChange *)&v66 translateToClientChangeUsingIDMapping:v6 error:a4];
  v8 = v7;
  if (v7)
  {
    long long v52 = v7;
    [v7 recordList];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v53 = v65 = 0u;
    v9 = [v53 assets];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v62 objects:v69 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v63 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          uint64_t v15 = [v14 assetIdentifier];
          if (v15)
          {
            id v16 = (void *)v15;
            id v17 = [CPLScopedIdentifier alloc];
            v18 = [(CPLRecordChange *)self scopedIdentifier];
            id v19 = [(CPLScopedIdentifier *)v17 initRelativeToScopedIdentifier:v18 identifier:v16];

            if (v19)
            {
              v20 = [v6 localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:v19];
              v21 = v20;
              if (v20)
              {
                v22 = [v20 identifier];
                [v14 setAssetIdentifier:v22];
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v62 objects:v69 count:16];
      }
      while (v11);
    }

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v23 = [v53 memorys];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v58 objects:v68 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v59 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v58 + 1) + 8 * j);
          uint64_t v29 = [v28 memoryIdentifier];
          if (v29)
          {
            v30 = (void *)v29;
            v31 = [CPLScopedIdentifier alloc];
            id v32 = [(CPLRecordChange *)self scopedIdentifier];
            id v33 = [(CPLScopedIdentifier *)v31 initRelativeToScopedIdentifier:v32 identifier:v30];

            if (v33)
            {
              uint64_t v34 = [v6 localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:v33];
              uint64_t v35 = v34;
              if (v34)
              {
                v36 = [v34 identifier];
                [v28 setMemoryIdentifier:v36];
              }
            }
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v58 objects:v68 count:16];
      }
      while (v25);
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v37 = [v53 persons];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v54 objects:v67 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v55;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v55 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = *(void **)(*((void *)&v54 + 1) + 8 * k);
          uint64_t v43 = [v42 personIdentifier];
          if (v43)
          {
            v44 = (void *)v43;
            v45 = [CPLScopedIdentifier alloc];
            v46 = [(CPLRecordChange *)self scopedIdentifier];
            id v47 = [(CPLScopedIdentifier *)v45 initRelativeToScopedIdentifier:v46 identifier:v44];

            if (v47)
            {
              long long v48 = [v6 localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:v47];
              long long v49 = v48;
              if (v48)
              {
                long long v50 = [v48 identifier];
                [v42 setPersonIdentifier:v50];
              }
            }
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v54 objects:v67 count:16];
      }
      while (v39);
    }

    v8 = v52;
  }

  return v8;
}

- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v67.receiver = self;
  v67.super_class = (Class)CPLSuggestionChange;
  objc_super v7 = [(CPLRecordChange *)&v67 translateToCloudChangeUsingIDMapping:v6 error:a4];
  v8 = v7;
  if (v7)
  {
    long long v52 = v7;
    [v7 recordList];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v53 = v66 = 0u;
    v9 = [v53 assets];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v63 objects:v70 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v64 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          uint64_t v15 = [v14 assetIdentifier];
          if (v15)
          {
            id v16 = (void *)v15;
            id v17 = [CPLScopedIdentifier alloc];
            v18 = [(CPLRecordChange *)self scopedIdentifier];
            id v19 = [(CPLScopedIdentifier *)v17 initRelativeToScopedIdentifier:v18 identifier:v16];

            if (v19)
            {
              char v62 = 0;
              v20 = [v6 cloudScopedIdentifierForLocalScopedIdentifier:v19 isFinal:&v62];
              v21 = v20;
              if (v20)
              {
                v22 = [v20 identifier];
                [v14 setAssetIdentifier:v22];
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v63 objects:v70 count:16];
      }
      while (v11);
    }

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v23 = [v53 memorys];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v58 objects:v69 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v59 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v58 + 1) + 8 * j);
          uint64_t v29 = [v28 memoryIdentifier];
          if (v29)
          {
            v30 = (void *)v29;
            v31 = [CPLScopedIdentifier alloc];
            id v32 = [(CPLRecordChange *)self scopedIdentifier];
            id v33 = [(CPLScopedIdentifier *)v31 initRelativeToScopedIdentifier:v32 identifier:v30];

            if (v33)
            {
              char v62 = 0;
              uint64_t v34 = [v6 cloudScopedIdentifierForLocalScopedIdentifier:v33 isFinal:&v62];
              uint64_t v35 = v34;
              if (v34)
              {
                v36 = [v34 identifier];
                [v28 setMemoryIdentifier:v36];
              }
            }
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v58 objects:v69 count:16];
      }
      while (v25);
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v37 = [v53 persons];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v54 objects:v68 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v55;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v55 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = *(void **)(*((void *)&v54 + 1) + 8 * k);
          uint64_t v43 = [v42 personIdentifier];
          if (v43)
          {
            v44 = (void *)v43;
            v45 = [CPLScopedIdentifier alloc];
            v46 = [(CPLRecordChange *)self scopedIdentifier];
            id v47 = [(CPLScopedIdentifier *)v45 initRelativeToScopedIdentifier:v46 identifier:v44];

            if (v47)
            {
              char v62 = 0;
              long long v48 = [v6 cloudScopedIdentifierForLocalScopedIdentifier:v47 isFinal:&v62];
              long long v49 = v48;
              if (v48)
              {
                long long v50 = [v48 identifier];
                [v42 setPersonIdentifier:v50];
              }
            }
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v54 objects:v68 count:16];
      }
      while (v39);
    }

    v8 = v52;
  }

  return v8;
}

- (id)scopedIdentifiersForMapping
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v50.receiver = self;
  v50.super_class = (Class)CPLSuggestionChange;
  id v4 = [(CPLRecordChange *)&v50 scopedIdentifiersForMapping];
  unsigned __int8 v5 = (void *)[v3 initWithArray:v4];

  [(CPLSuggestionChange *)self recordList];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v37 = long long v49 = 0u;
  id v6 = [v37 assets];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v46 + 1) + 8 * i) assetIdentifier];
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          v13 = [CPLScopedIdentifier alloc];
          v14 = [(CPLRecordChange *)self scopedIdentifier];
          id v15 = [(CPLScopedIdentifier *)v13 initRelativeToScopedIdentifier:v14 identifier:v12];

          if (v15)
          {
            [v5 addObject:v15];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v8);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v16 = [v37 memorys];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v43 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = [*(id *)(*((void *)&v42 + 1) + 8 * j) memoryIdentifier];
        if (v21)
        {
          v22 = (void *)v21;
          id v23 = [CPLScopedIdentifier alloc];
          uint64_t v24 = [(CPLRecordChange *)self scopedIdentifier];
          id v25 = [(CPLScopedIdentifier *)v23 initRelativeToScopedIdentifier:v24 identifier:v22];

          if (v25)
          {
            [v5 addObject:v25];
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v52 count:16];
    }
    while (v18);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v26 = [v37 persons];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v51 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = [*(id *)(*((void *)&v38 + 1) + 8 * k) personIdentifier];
        if (v31)
        {
          id v32 = (void *)v31;
          id v33 = [CPLScopedIdentifier alloc];
          uint64_t v34 = [(CPLRecordChange *)self scopedIdentifier];
          id v35 = [(CPLScopedIdentifier *)v33 initRelativeToScopedIdentifier:v34 identifier:v32];

          if (v35)
          {
            [v5 addObject:v35];
          }
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v38 objects:v51 count:16];
    }
    while (v28);
  }

  return v5;
}

@end