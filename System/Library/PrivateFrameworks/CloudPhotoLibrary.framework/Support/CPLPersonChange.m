@interface CPLPersonChange
+ (id)ckPropertyForRelatedIdentifier;
+ (id)ckValueForRelatedRecord:(id)a3;
- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4;
- (void)fillWithCKRecord:(id)a3;
@end

@implementation CPLPersonChange

+ (id)ckPropertyForRelatedIdentifier
{
  return @"mergeTargetRef";
}

+ (id)ckValueForRelatedRecord:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)CKReference) initWithRecord:v3 action:0];

  return v4;
}

- (void)fillWithCKRecord:(id)a3
{
  id v21 = a3;
  id v4 = self;
  v5 = objc_msgSend(v21, "cpl_legacyDecryptedObjectForKey:validateClass:", @"personFullNameEnc", objc_opt_class());
  [(CPLPersonChange *)v4 setFullName:v5];

  objc_msgSend(v21, "cpl_objectForKey:validateClass:", @"personType", objc_opt_class());
  v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6) {
    v6 = &off_100291E90;
  }
  -[CPLPersonChange setPersonType:](v4, "setPersonType:", [v6 integerValue]);

  objc_msgSend(v21, "cpl_objectForKey:validateClass:", @"manualSortOrder", objc_opt_class());
  v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8) {
    v8 = &off_100291E90;
  }
  -[CPLPersonChange setManualSortOrder:](v4, "setManualSortOrder:", [v8 integerValue]);

  if (+[CPLPersonChange serverSupportsAssetSortOrder])
  {
    objc_msgSend(v21, "cpl_legacyDecryptedObjectForKey:validateClass:", @"sortAscendingEnc", objc_opt_class());
    v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10) {
      v10 = &off_100291E90;
    }
    -[CPLPersonChange setAssetSortOrder:](v4, "setAssetSortOrder:", [v10 integerValue]);
  }
  v12 = objc_msgSend(v21, "cpl_legacyDecryptedObjectForKey:validateClass:", @"displayName", objc_opt_class());
  [(CPLPersonChange *)v4 setDisplayName:v12];

  v13 = objc_msgSend(v21, "cpl_legacyDecryptedObjectForKey:validateClass:", @"contactDescriptor", objc_opt_class());
  [(CPLPersonChange *)v4 setContactDescriptor:v13];

  if (+[CPLPersonChange serverSupportsGraphPeopleHome])
  {
    v14 = [v21 objectForKey:@"verifiedType"];
    -[CPLPersonChange setVerifiedType:](v4, "setVerifiedType:", [v14 integerValue]);
  }
  if (+[CPLPersonChange serverSupportsDetectionType])
  {
    objc_msgSend(v21, "cpl_legacyDecryptedObjectForKey:validateClass:", @"detectionTypeEnc", objc_opt_class());
    v15 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v15) {
      v15 = &off_100291E90;
    }
    -[CPLPersonChange setDetectionType:](v4, "setDetectionType:", (__int16)[v15 integerValue]);
  }
  if (+[CPLPersonChange serverSupportsMergeTargetRef])
  {
    v17 = [v21 objectForKey:@"mergeTargetRef"];
    v18 = v17;
    if (v17)
    {
      v19 = [v17 recordID];
      v20 = [v19 recordName];

      [(CPLPersonChange *)v4 setMergeTargetPersonIdentifier:v20];
    }
  }
}

- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4
{
  id v27 = a3;
  v6 = self;
  v7 = [a4 fingerprintContext];
  if ([(CPLPersonChange *)v6 hasChangeType:2])
  {
    if ([(CPLPersonChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"fullName")])
    {
      uint64_t v8 = [(CPLPersonChange *)v6 fullName];
      v9 = (void *)v8;
      v10 = &stru_10027FEB8;
      if (v8) {
        v10 = (__CFString *)v8;
      }
      v11 = v10;

      [v27 setLegacyEncryptedObject:v11 forKey:@"personFullNameEnc"];
    }
    if ([(CPLPersonChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"personType")])
    {
      v12 = +[NSNumber numberWithInteger:[(CPLPersonChange *)v6 personType]];
      [v27 setObject:v12 forKey:@"personType"];
    }
    if ([(CPLPersonChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"manualSortOrder")])
    {
      v13 = +[NSNumber numberWithInteger:[(CPLPersonChange *)v6 manualSortOrder]];
      [v27 setObject:v13 forKey:@"manualSortOrder"];
    }
    if (+[CPLPersonChange serverSupportsAssetSortOrder]&& [(CPLPersonChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"assetSortOrder")])
    {
      v14 = +[NSNumber numberWithInteger:[(CPLPersonChange *)v6 assetSortOrder]];
      [v27 setLegacyEncryptedObject:v14 forKey:@"sortAscendingEnc"];
    }
    if ([(CPLPersonChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"displayName")])
    {
      uint64_t v15 = [(CPLPersonChange *)v6 displayName];
      v16 = (void *)v15;
      v17 = &stru_10027FEB8;
      if (v15) {
        v17 = (__CFString *)v15;
      }
      v18 = v17;

      [v27 setLegacyEncryptedObject:v18 forKey:@"displayName"];
    }
    if ([(CPLPersonChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"contactDescriptor")])
    {
      v19 = [(CPLPersonChange *)v6 contactDescriptor];
      if (v19) {
        [v27 setLegacyEncryptedObject:v19 forKey:@"contactDescriptor"];
      }
    }
    if ([(CPLPersonChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"verifiedType")]&& +[CPLPersonChange serverSupportsGraphPeopleHome]&& [(CPLPersonChange *)v6 verifiedType])
    {
      v20 = +[NSNumber numberWithInteger:[(CPLPersonChange *)v6 verifiedType]];
      [v27 setObject:v20 forKey:@"verifiedType"];
    }
    if (+[CPLPersonChange serverSupportsDetectionType]&& [(CPLPersonChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"detectionType")])
    {
      id v21 = +[NSNumber numberWithShort:[(CPLPersonChange *)v6 detectionType]];
      [v27 setLegacyEncryptedObject:v21 forKey:@"detectionTypeEnc"];
    }
    if ([(CPLPersonChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"mergeTargetPersonIdentifier")])
    {
      if (+[CPLPersonChange serverSupportsMergeTargetRef])
      {
        uint64_t v22 = [(CPLPersonChange *)v6 mergeTargetPersonIdentifier];
        if (v22)
        {
          v23 = (void *)v22;
          id v24 = objc_alloc((Class)CPLScopedIdentifier);
          v25 = [(CPLPersonChange *)v6 scopedIdentifier];
          id v26 = [v24 initRelativeToScopedIdentifier:v25 identifier:v23];

          if (v26)
          {
            [v27 setCKReferenceWithScopedIdentifier:v26 forKey:@"mergeTargetRef" referenceAction:0];
          }
        }
      }
    }
  }
}

@end