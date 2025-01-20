@interface CPLSocialGroupChange
+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3;
+ (BOOL)cplShouldIgnorePropertyForEquality:(id)a3;
+ (BOOL)relatedRelationshipIsWeak;
+ (BOOL)supportsDeletion;
+ (BOOL)supportsDirectDeletion;
+ (BOOL)supportsSecureCoding;
+ (Class)relatedRecordClass;
+ (id)_createTestSocialGroupWithPersons:(id)a3;
+ (id)equalityBlockForDirection:(unint64_t)a3;
- (CPLSocialGroupPersonList)persons;
- (NSData)personsData;
- (NSString)customTitle;
- (NSString)keyAssetIdentifier;
- (id)keyAssetScopedIdentifier;
- (id)propertiesDescription;
- (id)scopedIdentifiersForMapping;
- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4;
- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4;
- (signed)verifiedType;
- (unint64_t)position;
- (void)setCustomTitle:(id)a3;
- (void)setKeyAssetIdentifier:(id)a3;
- (void)setKeyAssetScopedIdentifier:(id)a3;
- (void)setPersonData:(id)a3;
- (void)setPersons:(id)a3;
- (void)setPersonsData:(id)a3;
- (void)setPosition:(unint64_t)a3;
- (void)setVerifiedType:(signed __int16)a3;
@end

@implementation CPLSocialGroupChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personsData, 0);
  objc_storeStrong((id *)&self->_keyAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
}

- (void)setPersonsData:(id)a3
{
}

- (NSData)personsData
{
  return self->_personsData;
}

- (void)setKeyAssetIdentifier:(id)a3
{
}

- (NSString)keyAssetIdentifier
{
  return self->_keyAssetIdentifier;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setCustomTitle:(id)a3
{
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (void)setVerifiedType:(signed __int16)a3
{
  self->_verifiedType = a3;
}

- (signed)verifiedType
{
  return self->_verifiedType;
}

- (void)setKeyAssetScopedIdentifier:(id)a3
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
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLSocialGroupChange.m"];
      v16 = NSStringFromSelector(a2);
      v17 = [(CPLRecordChange *)self scopedIdentifier];
      v18 = [v17 scopeIdentifier];
      v19 = [v21 scopeIdentifier];
      [v14 handleFailureInMethod:a2, self, v15, 93, @"Invalid call to %@ with mismatched scope: %@ vs. %@", v16, v18, v19 object file lineNumber description];

      abort();
    }
  }
  v20 = [v21 identifier];
  [(CPLSocialGroupChange *)self setKeyAssetIdentifier:v20];
}

- (id)keyAssetScopedIdentifier
{
  keyAssetIdentifier = self->_keyAssetIdentifier;
  if (keyAssetIdentifier)
  {
    v4 = keyAssetIdentifier;
    uint64_t v5 = [CPLScopedIdentifier alloc];
    v6 = [(CPLRecordChange *)self scopedIdentifier];
    id v7 = [(CPLScopedIdentifier *)v5 initRelativeToScopedIdentifier:v6 identifier:v4];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)setPersonData:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    v4 = (NSData *)[v6 copy];
    personsData = self->_personsData;
    self->_personsData = v4;
  }
  else
  {
    personsData = self->_personsData;
    self->_personsData = 0;
  }
}

- (CPLSocialGroupPersonList)persons
{
  if (self->_personsData) {
    v2 = [[CPLSocialGroupPersonList alloc] initWithData:self->_personsData];
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPersons:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    uint64_t v5 = [v4 data];
    p_personsData = (id *)&self->_personsData;
    id v7 = *p_personsData;
    id *p_personsData = (id)v5;

    if ([*p_personsData length]) {
      goto LABEL_6;
    }
  }
  else
  {
    p_personsData = (id *)&self->_personsData;
  }
  id v8 = *p_personsData;
  id *p_personsData = 0;

LABEL_6:
}

- (id)propertiesDescription
{
  v2 = NSString;
  v3 = [(CPLSocialGroupChange *)self persons];
  id v4 = objc_msgSend(v2, "stringWithFormat:", @"%lu persons", objc_msgSend(v3, "personsCount"));

  return v4;
}

+ (id)equalityBlockForDirection:(unint64_t)a3
{
  if (a3 == 1) {
    return &__block_literal_global_1545;
  }
  else {
    return 0;
  }
}

uint64_t __50__CPLSocialGroupChange_equalityBlockForDirection___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, char *a5)
{
  if (sel_personsData != a5) {
    return 0;
  }
  id v7 = a3;
  id v8 = [a2 personsData];
  uint64_t v9 = [v7 personsData];

  unint64_t v10 = v8;
  BOOL v11 = (v10 | v9) == 0;
  if (v10 && v9)
  {
    v12 = [[CPLSocialGroupPersonList alloc] initWithData:v10];
    v13 = [[CPLSocialGroupPersonList alloc] initWithData:v9];
    id v14 = v12;
    v15 = v13;
    unint64_t v16 = (unint64_t)v15;
    BOOL v11 = v14 && v15 && ([v14 isEqual:v15] & 1) != 0 || ((unint64_t)v14 | v16) == 0;
  }
  if (v11) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

+ (BOOL)relatedRelationshipIsWeak
{
  return 1;
}

+ (BOOL)supportsDirectDeletion
{
  return 1;
}

+ (BOOL)supportsDeletion
{
  return 1;
}

+ (id)_createTestSocialGroupWithPersons:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 firstObject];
  uint64_t v5 = [v4 scopedIdentifier];
  id v6 = [v5 scopeIdentifier];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    CPLPrimaryScopeIdentifierForCurrentUniverse();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v8;

  __int16 v24 = v9;
  id v10 = +[CPLRecordChange newRecordInScopeWithIdentifier:v9];
  [v10 setCustomTitle:@"Test title"];
  [v10 setVerifiedType:1];
  [v10 setPosition:5];
  BOOL v11 = [MEMORY[0x1E4F29128] UUID];
  v12 = [v11 UUIDString];
  [v10 setKeyAssetIdentifier:v12];

  v13 = objc_alloc_init(CPLSocialGroupPersonList);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = v3;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v20 = objc_alloc_init(CPLSocialGroupPerson);
        id v21 = [v19 scopedIdentifier];
        v22 = [v21 identifier];
        [(CPLSocialGroupPerson *)v20 setPersonIdentifier:v22];

        [(CPLSocialGroupPersonList *)v13 addPerson:v20];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  [v10 setPersons:v13];
  return v10;
}

+ (BOOL)cplShouldIgnorePropertyForEquality:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"persons"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLSocialGroupChange;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForEquality_, v4);
  }

  return v5;
}

+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"persons"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLSocialGroupChange;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForCoding_, v4);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)CPLSocialGroupChange;
  id v32 = a3;
  unsigned __int8 v5 = -[CPLRecordChange translateToClientChangeUsingIDMapping:error:](&v37, sel_translateToClientChangeUsingIDMapping_error_);
  id v6 = v5;
  if (v5)
  {
    v31 = v5;
    [v5 persons];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v30 = v36 = 0u;
    objc_super v7 = [v30 persons];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v13 = [v12 personIdentifier];
          if (v13)
          {
            id v14 = (void *)v13;
            uint64_t v15 = [CPLScopedIdentifier alloc];
            uint64_t v16 = [(CPLRecordChange *)self scopedIdentifier];
            id v17 = [(CPLScopedIdentifier *)v15 initRelativeToScopedIdentifier:v16 identifier:v14];

            if (v17)
            {
              v18 = [v32 localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:v17];
              v19 = v18;
              if (v18)
              {
                v20 = [v18 identifier];
                [v12 setPersonIdentifier:v20];
              }
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v9);
    }

    id v6 = v31;
    [v31 setPersons:v30];
    uint64_t v21 = [(CPLSocialGroupChange *)self keyAssetIdentifier];
    if (v21)
    {
      v22 = (void *)v21;
      v23 = [CPLScopedIdentifier alloc];
      __int16 v24 = [(CPLRecordChange *)self scopedIdentifier];
      id v25 = [(CPLScopedIdentifier *)v23 initRelativeToScopedIdentifier:v24 identifier:v22];

      if (v25)
      {
        long long v26 = [v32 localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:v25];
        long long v27 = v26;
        if (v26)
        {
          long long v28 = [v26 identifier];
          [v31 setKeyAssetIdentifier:v28];
        }
      }
    }
  }
  return v6;
}

- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)CPLSocialGroupChange;
  id v32 = a3;
  unsigned __int8 v5 = -[CPLRecordChange translateToCloudChangeUsingIDMapping:error:](&v38, sel_translateToCloudChangeUsingIDMapping_error_);
  id v6 = v5;
  if (v5)
  {
    v31 = v5;
    [v5 persons];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v30 = v37 = 0u;
    objc_super v7 = [v30 persons];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v13 = [v12 personIdentifier];
          if (v13)
          {
            id v14 = (void *)v13;
            uint64_t v15 = [CPLScopedIdentifier alloc];
            uint64_t v16 = [(CPLRecordChange *)self scopedIdentifier];
            id v17 = [(CPLScopedIdentifier *)v15 initRelativeToScopedIdentifier:v16 identifier:v14];

            if (v17)
            {
              char v33 = 0;
              v18 = [v32 cloudScopedIdentifierForLocalScopedIdentifier:v17 isFinal:&v33];
              v19 = v18;
              if (v18)
              {
                v20 = [v18 identifier];
                [v12 setPersonIdentifier:v20];
              }
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v9);
    }

    id v6 = v31;
    [v31 setPersons:v30];
    uint64_t v21 = [(CPLSocialGroupChange *)self keyAssetIdentifier];
    if (v21)
    {
      v22 = (void *)v21;
      v23 = [CPLScopedIdentifier alloc];
      __int16 v24 = [(CPLRecordChange *)self scopedIdentifier];
      id v25 = [(CPLScopedIdentifier *)v23 initRelativeToScopedIdentifier:v24 identifier:v22];

      if (v25)
      {
        char v33 = 0;
        long long v26 = [v32 cloudScopedIdentifierForLocalScopedIdentifier:v25 isFinal:&v33];
        long long v27 = v26;
        if (v26)
        {
          long long v28 = [v26 identifier];
          [v31 setKeyAssetIdentifier:v28];
        }
      }
    }
  }
  return v6;
}

- (id)scopedIdentifiersForMapping
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v22.receiver = self;
  v22.super_class = (Class)CPLSocialGroupChange;
  id v4 = [(CPLRecordChange *)&v22 scopedIdentifiersForMapping];
  unsigned __int8 v5 = (void *)[v3 initWithArray:v4];

  [(CPLSocialGroupChange *)self persons];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v17 = long long v21 = 0u;
  id v6 = [v17 persons];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) personIdentifier];
        if (v11)
        {
          v12 = (void *)v11;
          uint64_t v13 = [CPLScopedIdentifier alloc];
          id v14 = [(CPLRecordChange *)self scopedIdentifier];
          id v15 = [(CPLScopedIdentifier *)v13 initRelativeToScopedIdentifier:v14 identifier:v12];

          if (v15)
          {
            [v5 addObject:v15];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (Class)relatedRecordClass
{
  return (Class)objc_opt_class();
}

@end