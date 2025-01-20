@interface CPLRecordChange
+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3;
+ (BOOL)cplShouldIgnorePropertyForEquality:(id)a3;
+ (BOOL)relatedRelationshipIsWeak;
+ (BOOL)requiresStableHashForResourceType:(unint64_t)a3;
+ (BOOL)secondaryRelationshipIsWeak;
+ (BOOL)shouldReallyQuarantineRecord;
+ (BOOL)supportsDeletion;
+ (BOOL)supportsDirectDeletion;
+ (BOOL)supportsResourceType:(unint64_t)a3;
+ (BOOL)supportsResources;
+ (BOOL)supportsSecureCoding;
+ (BOOL)supportsSharingScopedIdentifier;
+ (Class)classForStoredClassName:(id)a3 forCPLArchiver:(id)a4;
+ (Class)relatedRecordClass;
+ (id)_descriptionForChangeType:(unint64_t)a3 isSparseFullChange:(BOOL)a4 onlyUploadNewResources:(BOOL)a5;
+ (id)copyPropertyBlockForDirection:(unint64_t)a3;
+ (id)cplAdditionalSecureClassesForProperty:(id)a3;
+ (id)descriptionForChangeType:(unint64_t)a3;
+ (id)descriptionForDirection:(unint64_t)a3;
+ (id)equalityBlockForDirection:(unint64_t)a3;
+ (id)newChangeWithScopedIdentifier:(id)a3 changeType:(unint64_t)a4;
+ (id)newChangeWithType:(unint64_t)a3;
+ (id)newDeleteChangeWithScopedIdentifier:(id)a3;
+ (id)newRecord;
+ (id)newRecordInScopeWithIdentifier:(id)a3;
+ (id)newRecordWithScopedIdentifier:(id)a3;
+ (int64_t)maxInlineDataSize;
- (BOOL)_relatedRecordShouldBeShared;
- (BOOL)_shouldNotTrustCloudCache;
- (BOOL)allResourcesAreAvailable;
- (BOOL)allowsToOnlyUploadNewResources;
- (BOOL)applyChange:(id)a3 copyPropertiesToFinalChange:(id)a4 forChangeType:(unint64_t)a5 direction:(unint64_t)a6 diffTracker:(id)a7;
- (BOOL)canLowerQuota;
- (BOOL)changeIsOnlyAddingResourcesToRecord:(id)a3 addedResources:(id *)a4;
- (BOOL)hasChangeType:(unint64_t)a3;
- (BOOL)inExpunged;
- (BOOL)inTrash;
- (BOOL)isAssetChange;
- (BOOL)isDelete;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFullRecord;
- (BOOL)isInScopeWithIdentifier:(id)a3;
- (BOOL)isMasterChange;
- (BOOL)isResourceTypeAGeneratedDerivative:(unint64_t)a3;
- (BOOL)isScopeChange;
- (BOOL)isSharedInScopeWithIdentifier:(id)a3;
- (BOOL)isSparseFullChange;
- (BOOL)relatedRelationshipIsWeak;
- (BOOL)requiresStableHashForResourceType:(unint64_t)a3;
- (BOOL)resourceChangeWillOnlyChangeDerivatives:(id)a3;
- (BOOL)secondaryRelationshipIsWeak;
- (BOOL)serverRecordIsCorrupted;
- (BOOL)shouldApplyPropertiesWithSelector:(SEL)a3;
- (BOOL)shouldFilterDefaultValuesForNewProperties;
- (BOOL)shouldOnlyUploadNewResources;
- (BOOL)supportsDeletion;
- (BOOL)supportsDirectDeletion;
- (BOOL)supportsResourceType:(unint64_t)a3;
- (BOOL)supportsResources;
- (BOOL)supportsSharing;
- (BOOL)supportsSharingScopedIdentifier;
- (BOOL)validateChangeWithError:(id *)a3;
- (BOOL)validateFullRecord;
- (BOOL)validateRecordForTracker:(id)a3;
- (CPLRecordChange)initWithCPLArchiver:(id)a3;
- (CPLRecordChange)initWithCoder:(id)a3;
- (CPLScopedIdentifier)resourceCopyFromScopedIdentifier;
- (CPLScopedIdentifier)scopedIdentifier;
- (Class)relatedRecordClass;
- (NSArray)sharingContributorUserIdentifiers;
- (NSArray)updateSharingContributorUserIdentifiers;
- (NSData)recordChangeData;
- (NSData)sharingRecordChangeData;
- (NSDate)dateDeleted;
- (NSDate)recordModificationDate;
- (NSString)realIdentifier;
- (NSString)sharingRecordIdentifier;
- (NSString)sharingScopeIdentifier;
- (id)_ignoredRecord;
- (id)_pushContext;
- (id)_recordKnownByCloudCache;
- (id)_unscopedIdentifier;
- (id)allRelatedScopedIdentifiers;
- (id)asRecordView;
- (id)attachedDiffTracker;
- (id)checkDefaultValueBlockForPropertyWithSelector:(SEL)a3;
- (id)compactedChangeWithRelatedChanges:(id)a3 isOnlyChange:(BOOL)a4 fullRecord:(id)a5 usingStorageView:(id)a6;
- (id)copyChangeType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)cplFullDescription;
- (id)description;
- (id)fingerprintSchemeWithContext:(id)a3;
- (id)mergeRecordChangeWithNewRecordChange:(id)a3 direction:(unint64_t)a4;
- (id)onlyAddedResources;
- (id)propertiesDescription;
- (id)propertiesForChangeType:(unint64_t)a3;
- (id)proposedCloudScopedIdentifierWithError:(id *)a3;
- (id)proposedLocalScopedIdentifier;
- (id)realRecordChangeFromRecordChange:(id)a3 direction:(unint64_t)a4 newRecord:(id *)a5;
- (id)realRecordChangeFromRecordChange:(id)a3 direction:(unint64_t)a4 newRecord:(id *)a5 changeType:(unint64_t)a6 diffTracker:(id)a7;
- (id)realRecordChangeFromRecordChange:(id)a3 direction:(unint64_t)a4 newRecord:(id *)a5 diffTracker:(id)a6;
- (id)realScopedIdentifier;
- (id)redactedDescription;
- (id)relatedIdentifier;
- (id)relatedScopedIdentifier;
- (id)resourceForType:(unint64_t)a3;
- (id)resourcePerType;
- (id)resources;
- (id)resourcesDescription;
- (id)scopedIdentifiersForMapping;
- (id)secondaryIdentifier;
- (id)secondaryScopedIdentifier;
- (id)sharingRecordScopedIdentifier;
- (id)storedClassNameForCPLArchiver:(id)a3;
- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4;
- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4;
- (int64_t)dequeueOrder;
- (unint64_t)baseDerivativeResourceType;
- (unint64_t)baseVideoComplemenentResourceType;
- (unint64_t)changeType;
- (unint64_t)effectiveResourceSizeToUploadUsingStorage:(id)a3;
- (unint64_t)estimatedRecordSize;
- (unint64_t)fullChangeTypeForFullRecord;
- (unint64_t)largestResourceSize;
- (unint64_t)originalResourceSize;
- (unint64_t)realResourceSize;
- (unint64_t)realUploadResourceSize;
- (unint64_t)totalResourceSize;
- (void)_noteRelatedRecordShouldBeShared;
- (void)_setIgnoredRecord:(id)a3;
- (void)_setPushContext:(id)a3;
- (void)_setRecordKnownByCloudCache:(id)a3;
- (void)_setShouldNotTrustCloudCache:(BOOL)a3;
- (void)applyChange:(id)a3;
- (void)applyChangeType:(unint64_t)a3 fromChange:(id)a4;
- (void)attachDiffTracker:(id)a3;
- (void)awakeFromStorage;
- (void)clearChangeType:(unint64_t)a3;
- (void)clearIdentifiers;
- (void)copyDerivatives:(unint64_t *)a3 count:(int)a4 avoidResourceType:(unint64_t)a5 fromRecord:(id)a6 inResourcePerType:(id)a7;
- (void)copyDerivativesFromRecordIfPossible:(id)a3;
- (void)enumerateChangeTypesForChangeType:(unint64_t)a3 block:(id)a4;
- (void)markAsSparseFullChange;
- (void)markToOnlyUploadNewResources;
- (void)prepareForStorage;
- (void)restoreRelationshipsFromFullRecord:(id)a3;
- (void)setChangeType:(unint64_t)a3;
- (void)setDateDeleted:(id)a3;
- (void)setInExpunged:(BOOL)a3;
- (void)setInTrash:(BOOL)a3;
- (void)setRealIdentifier:(id)a3;
- (void)setRecordChangeData:(id)a3;
- (void)setRecordModificationDate:(id)a3;
- (void)setResourceCopyFromScopedIdentifier:(id)a3;
- (void)setResources:(id)a3;
- (void)setScopeIndex:(int64_t)a3;
- (void)setScopedIdentifier:(id)a3;
- (void)setServerRecordIsCorrupted:(BOOL)a3;
- (void)setSharingContributorUserIdentifiers:(id)a3;
- (void)setSharingRecordChangeData:(id)a3;
- (void)setSharingRecordIdentifier:(id)a3;
- (void)setSharingRecordScopedIdentifier:(id)a3;
- (void)setSharingScopeIdentifier:(id)a3;
- (void)setShouldFilterDefaultValuesForNewProperties:(BOOL)a3;
- (void)setUpdateSharingContributorUserIdentifiers:(id)a3;
- (void)updateScopeIdentifier:(id)a3;
@end

@implementation CPLRecordChange

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 cplCopyPropertiesFromObject:self withCopyBlock:0];
  return v4;
}

- (CPLRecordChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLRecordChange;
  v5 = [(CPLRecordChange *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [v5 cplDecodePropertiesFromCoder:v4];
    v7 = [(CPLRecordChange *)v6 scopedIdentifier];

    if (!v7)
    {
      if (initWithCoder__onceToken_4954 != -1) {
        dispatch_once(&initWithCoder__onceToken_4954, &__block_literal_global_54);
      }
      v8 = [v4 decodeObjectOfClass:initWithCoder__stringClass forKey:@"identifier"];
      if (v8)
      {
        v9 = [[CPLScopedIdentifier alloc] initWithScopeIdentifier:@"PrimarySync" identifier:v8];
        [(CPLRecordChange *)v6 setScopedIdentifier:v9];
      }
    }
  }

  return v6;
}

uint64_t __46__CPLRecordChange_CPLNSCoding__initWithCoder___block_invoke()
{
  uint64_t result = objc_opt_class();
  initWithCoder__stringClass = result;
  return result;
}

- (id)storedClassNameForCPLArchiver:(id)a3
{
  v3 = NSStringFromClass((Class)[(CPLRecordChange *)self classForCoder]);
  id v4 = objc_msgSend(v3, "substringWithRange:", 3, objc_msgSend(v3, "length") - 9);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)cplAdditionalSecureClassesForProperty:(id)a3
{
  id v4 = a3;
  if (cplAdditionalSecureClassesForProperty__onceToken != -1) {
    dispatch_once(&cplAdditionalSecureClassesForProperty__onceToken, &__block_literal_global_4976);
  }
  v5 = [(id)cplAdditionalSecureClassesForProperty__additionalClasses objectForKey:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___CPLRecordChange;
    objc_msgSendSuper2(&v10, sel_cplAdditionalSecureClassesForProperty_, v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

void __70__CPLRecordChange_CPLNSCoding__cplAdditionalSecureClassesForProperty___block_invoke()
{
  v10[7] = *MEMORY[0x1E4F143B8];
  v9[0] = @"resources";
  v0 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v10[0] = v0;
  v9[1] = @"expungeableResourceStates";
  v1 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v10[1] = v1;
  v9[2] = @"containerRelations";
  v2 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v10[2] = v2;
  v9[3] = @"keywords";
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v10[3] = v3;
  v9[4] = @"people";
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v10[4] = v4;
  v9[5] = @"sharingContributorUserIdentifiers";
  v5 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v10[5] = v5;
  v9[6] = @"updateSharingContributorUserIdentifiers";
  v6 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v10[6] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:7];
  v8 = (void *)cplAdditionalSecureClassesForProperty__additionalClasses;
  cplAdditionalSecureClassesForProperty__additionalClasses = v7;
}

+ (Class)classForStoredClassName:(id)a3 forCPLArchiver:(id)a4
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (NSString *)[[v4 alloc] initWithFormat:@"CPL%@Change", v5];

  uint64_t v7 = NSClassFromString(v6);
  return v7;
}

+ (BOOL)cplShouldIgnorePropertyForEquality:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"identifier"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLRecordChange;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForEquality_, v4);
  }

  return v5;
}

+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"identifier"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLRecordChange;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForCoding_, v4);
  }

  return v5;
}

- (CPLRecordChange)initWithCPLArchiver:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLRecordChange;
  unsigned __int8 v5 = [&v11 initWithCPLArchiver:v4];
  v6 = v5;
  if (v5)
  {
    objc_super v7 = [(CPLRecordChange *)v5 scopedIdentifier];

    if (!v7)
    {
      if (initWithCPLArchiver__onceToken != -1) {
        dispatch_once(&initWithCPLArchiver__onceToken, &__block_literal_global_1896);
      }
      v8 = [v4 decodeObjectOfClass:initWithCPLArchiver__stringClass forKey:@"identifier"];
      if (v8)
      {
        v9 = [[CPLScopedIdentifier alloc] initWithScopeIdentifier:@"PrimarySync" identifier:v8];
        [(CPLRecordChange *)v6 setScopedIdentifier:v9];
      }
    }
  }

  return v6;
}

uint64_t __52__CPLRecordChange_CPLArchiver__initWithCPLArchiver___block_invoke()
{
  uint64_t result = objc_opt_class();
  initWithCPLArchiver__stringClass = result;
  return result;
}

- (id)proposedCloudScopedIdentifierWithError:(id *)a3
{
  v3 = [(CPLRecordChange *)self scopedIdentifier];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = (void *)[(CPLRecordChange *)self copy];
  char v27 = 0;
  v8 = [(CPLRecordChange *)self scopedIdentifier];
  if (v8)
  {
    uint64_t v9 = [v6 localScopedIdentifierForCloudScopedIdentifier:v8 isFinal:&v27];
    if (v9)
    {
      objc_super v10 = (void *)v9;
    }
    else
    {
      objc_super v10 = [(CPLRecordChange *)self proposedLocalScopedIdentifier];
      if (![v6 addCloudScopedIdentifier:v8 forLocalScopedIdentifier:v10 isFinal:1 direction:2 error:a4])
      {
        objc_super v11 = v7;
        objc_super v7 = 0;
        goto LABEL_28;
      }
    }
    [v7 setScopedIdentifier:v10];
    if (!v7
      || ![v7 supportsResources]
      || ![v7 hasChangeType:8])
    {
      goto LABEL_29;
    }
    v21 = a4;
    objc_super v11 = [v7 scopedIdentifier];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v12 = [v7 resources];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * i) setItemScopedIdentifier:v11];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v32 count:16];
      }
      while (v14);
    }

    char v22 = 0;
    v17 = [(CPLRecordChange *)self resourceCopyFromScopedIdentifier];
    if (v17)
    {
      v18 = [v6 localScopedIdentifierForCloudScopedIdentifier:v17 isFinal:&v22];
      if (v18)
      {
        [v7 setResourceCopyFromScopedIdentifier:v18];
      }
      else
      {
        if (v21)
        {
          id *v21 = +[CPLErrors invalidClientCacheErrorWithReason:0];
        }
        if (!_CPLSilentLogging)
        {
          v19 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v29 = v17;
            __int16 v30 = 2112;
            v31 = self;
            _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_ERROR, "Can't map cloud \"resourceCopyFromScopedIdentifier\" (%@) of %@", buf, 0x16u);
          }
        }
        objc_super v7 = 0;
      }
    }
LABEL_28:

LABEL_29:
  }

  return v7;
}

- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = (void *)[(CPLRecordChange *)self copy];
  char v27 = 0;
  v8 = [(CPLRecordChange *)self scopedIdentifier];
  if (v8)
  {
    uint64_t v9 = [v6 cloudScopedIdentifierForLocalScopedIdentifier:v8 isFinal:&v27];
    if (v9)
    {
      [v7 setScopedIdentifier:v9];
      if (!v7)
      {
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v10 = [(CPLRecordChange *)self proposedCloudScopedIdentifierWithError:a4];
      if (v10
        && (objc_super v11 = (void *)v10,
            [v6 setupCloudScopedIdentifier:v10 forLocalScopedIdentifier:v8 isFinal:0 direction:1 error:a4], v12 = objc_claimAutoreleasedReturnValue(), v11, v12))
      {
        [v7 setScopedIdentifier:v12];
      }
      else
      {
        v12 = v7;
        objc_super v7 = 0;
      }

      if (!v7) {
        goto LABEL_24;
      }
    }
    if ([v7 supportsResources] && objc_msgSend(v7, "hasChangeType:", 8))
    {
      uint64_t v13 = [v7 scopedIdentifier];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v14 = [v7 resources];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v24 != v17) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v23 + 1) + 8 * i) setItemScopedIdentifier:v13];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v16);
      }

      v19 = [(CPLRecordChange *)self resourceCopyFromScopedIdentifier];
      if (v19)
      {
        char v22 = 0;
        v20 = [v6 cloudScopedIdentifierForLocalScopedIdentifier:v19 isFinal:&v22];
        if (!v20) {
          v20 = (void *)[v19 copy];
        }
        [v7 setResourceCopyFromScopedIdentifier:v20];
      }
    }
    goto LABEL_24;
  }
LABEL_25:

  return v7;
}

- (id)scopedIdentifiersForMapping
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if ([(CPLRecordChange *)self supportsResources]
    && [(CPLRecordChange *)self hasChangeType:8]
    && ([(CPLRecordChange *)self resourceCopyFromScopedIdentifier],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = (void *)v3;
    unsigned __int8 v5 = [(CPLRecordChange *)self scopedIdentifier];
    v9[0] = v5;
    v9[1] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  }
  else
  {
    id v4 = [(CPLRecordChange *)self scopedIdentifier];
    v8 = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  }

  return v6;
}

- (id)compactedChangeWithRelatedChanges:(id)a3 isOnlyChange:(BOOL)a4 fullRecord:(id)a5 usingStorageView:(id)a6
{
  if (a4)
  {
    objc_super v7 = 0;
  }
  else
  {
    objc_super v7 = self;
  }
  return v7;
}

+ (BOOL)shouldReallyQuarantineRecord
{
  return 1;
}

+ (BOOL)secondaryRelationshipIsWeak
{
  return 0;
}

+ (BOOL)relatedRelationshipIsWeak
{
  return 0;
}

+ (id)copyPropertyBlockForDirection:(unint64_t)a3
{
  return 0;
}

+ (id)equalityBlockForDirection:(unint64_t)a3
{
  return 0;
}

+ (id)_descriptionForChangeType:(unint64_t)a3 isSparseFullChange:(BOOL)a4 onlyUploadNewResources:(BOOL)a5
{
  if (a3 == 1024)
  {
    uint64_t v9 = @"[D]";
    goto LABEL_18;
  }
  BOOL v5 = a5;
  __int16 v6 = a3;
  if (a3)
  {
    uint64_t v10 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"["];
    uint64_t v9 = v10;
    if ((v6 & 2) != 0)
    {
      [(__CFString *)v10 appendString:@"U"];
      if ((v6 & 8) == 0)
      {
LABEL_8:
        if ((v6 & 0x10) == 0) {
          goto LABEL_9;
        }
        goto LABEL_26;
      }
    }
    else if ((v6 & 8) == 0)
    {
      goto LABEL_8;
    }
    if (v5) {
      v12 = @"r";
    }
    else {
      v12 = @"R";
    }
    [(__CFString *)v9 appendString:v12];
    if ((v6 & 0x10) == 0)
    {
LABEL_9:
      if ((v6 & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_27;
    }
LABEL_26:
    [(__CFString *)v9 appendString:@"C"];
    if ((v6 & 0x20) == 0)
    {
LABEL_10:
      if ((v6 & 0x40) == 0) {
        goto LABEL_11;
      }
      goto LABEL_28;
    }
LABEL_27:
    [(__CFString *)v9 appendString:@"F"];
    if ((v6 & 0x40) == 0)
    {
LABEL_11:
      if ((v6 & 0x100) == 0)
      {
LABEL_13:
        [(__CFString *)v9 appendString:@"]"];
        goto LABEL_18;
      }
LABEL_12:
      [(__CFString *)v9 appendString:@"T"];
      goto LABEL_13;
    }
LABEL_28:
    [(__CFString *)v9 appendString:@"S"];
    if ((v6 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (a5)
  {
    objc_super v7 = @"[Ar]";
    v8 = @"[ar]";
  }
  else
  {
    objc_super v7 = @"[A]";
    v8 = @"[a]";
  }
  if (a4) {
    objc_super v7 = v8;
  }
  uint64_t v9 = v7;
LABEL_18:
  return v9;
}

+ (id)descriptionForChangeType:(unint64_t)a3
{
  return (id)[a1 _descriptionForChangeType:a3 isSparseFullChange:0 onlyUploadNewResources:0];
}

+ (int64_t)maxInlineDataSize
{
  return 20480;
}

+ (id)newChangeWithType:(unint64_t)a3
{
  id v4 = (void *)[a1 newRecord];
  [v4 setChangeType:a3];
  return v4;
}

+ (id)newDeleteChangeWithScopedIdentifier:(id)a3
{
  uint64_t v3 = (void *)[a1 newRecordWithScopedIdentifier:a3];
  [v3 setChangeType:1024];
  return v3;
}

+ (id)newChangeWithScopedIdentifier:(id)a3 changeType:(unint64_t)a4
{
  BOOL v5 = (void *)[a1 newRecordWithScopedIdentifier:a3];
  [v5 setChangeType:a4];
  return v5;
}

+ (id)newRecordWithScopedIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setScopedIdentifier:v3];

  return v4;
}

+ (id)newRecordInScopeWithIdentifier:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  __int16 v6 = [v4 UUID];
  objc_super v7 = [v6 UUIDString];

  v8 = [[CPLScopedIdentifier alloc] initWithScopeIdentifier:v5 identifier:v7];
  uint64_t v9 = (void *)[a1 newRecordWithScopedIdentifier:v8];

  return v9;
}

+ (id)newRecord
{
  id v3 = CPLPrimaryScopeIdentifierForCurrentUniverse();
  id v4 = (void *)[a1 newRecordInScopeWithIdentifier:v3];

  return v4;
}

+ (BOOL)supportsSharingScopedIdentifier
{
  return 0;
}

+ (BOOL)supportsDirectDeletion
{
  return 0;
}

+ (BOOL)supportsDeletion
{
  return 0;
}

+ (BOOL)requiresStableHashForResourceType:(unint64_t)a3
{
  return 0;
}

+ (BOOL)supportsResourceType:(unint64_t)a3
{
  return 1;
}

+ (BOOL)supportsResources
{
  return 0;
}

+ (id)descriptionForDirection:(unint64_t)a3
{
  if (a3 >= 3) {
    id v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"unknown direction %lu", a3);
  }
  else {
    id v3 = off_1E60A91D8[a3];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingRecordChangeData, 0);
  objc_storeStrong((id *)&self->_recordChangeData, 0);
  objc_storeStrong((id *)&self->_realIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_resourceCopyFromScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_dateDeleted, 0);
  objc_storeStrong((id *)&self->_recordModificationDate, 0);
  objc_storeStrong((id *)&self->_scopedIdentifier, 0);
  objc_storeStrong((id *)&self->_updateSharingContributorUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_sharingContributorUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_ignoredRecord, 0);
  objc_storeStrong((id *)&self->_pushContext, 0);
  objc_storeStrong((id *)&self->_recordKnownByCloudCache, 0);
  objc_storeStrong((id *)&self->_attachedDiffTracker, 0);
}

- (void)setSharingRecordIdentifier:(id)a3
{
}

- (NSString)sharingRecordIdentifier
{
  return self->_sharingRecordIdentifier;
}

- (void)setServerRecordIsCorrupted:(BOOL)a3
{
  self->_serverRecordIsCorrupted = a3;
}

- (BOOL)serverRecordIsCorrupted
{
  return self->_serverRecordIsCorrupted;
}

- (void)setSharingRecordChangeData:(id)a3
{
}

- (NSData)sharingRecordChangeData
{
  return self->_sharingRecordChangeData;
}

- (void)setRecordChangeData:(id)a3
{
}

- (NSData)recordChangeData
{
  return self->_recordChangeData;
}

- (void)setRealIdentifier:(id)a3
{
}

- (NSString)realIdentifier
{
  return self->_realIdentifier;
}

- (NSString)sharingScopeIdentifier
{
  return self->_sharingScopeIdentifier;
}

- (void)setInExpunged:(BOOL)a3
{
  self->_inExpunged = a3;
}

- (BOOL)inExpunged
{
  return self->_inExpunged;
}

- (void)setInTrash:(BOOL)a3
{
  self->_inTrash = a3;
}

- (BOOL)inTrash
{
  return self->_inTrash;
}

- (void)setResourceCopyFromScopedIdentifier:(id)a3
{
}

- (CPLScopedIdentifier)resourceCopyFromScopedIdentifier
{
  return self->_resourceCopyFromScopedIdentifier;
}

- (void)setDateDeleted:(id)a3
{
}

- (NSDate)dateDeleted
{
  return self->_dateDeleted;
}

- (void)setChangeType:(unint64_t)a3
{
  self->_changeType = a3;
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (void)setRecordModificationDate:(id)a3
{
}

- (NSDate)recordModificationDate
{
  return self->_recordModificationDate;
}

- (CPLScopedIdentifier)scopedIdentifier
{
  return self->_scopedIdentifier;
}

- (void)_setRecordKnownByCloudCache:(id)a3
{
}

- (id)_recordKnownByCloudCache
{
  return self->_recordKnownByCloudCache;
}

- (BOOL)isScopeChange
{
  return 0;
}

- (BOOL)isAssetChange
{
  return 0;
}

- (BOOL)isMasterChange
{
  return 0;
}

- (void)applyChangeType:(unint64_t)a3 fromChange:(id)a4
{
  id v6 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __46__CPLRecordChange_applyChangeType_fromChange___block_invoke;
  uint64_t v14 = &unk_1E60AAC20;
  uint64_t v15 = self;
  id v16 = v6;
  id v7 = v6;
  [(CPLRecordChange *)self enumerateChangeTypesForChangeType:a3 block:&v11];
  unint64_t v8 = [(CPLRecordChange *)self changeType];
  if (v8) {
    BOOL v9 = a3 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = v8 | a3;
  }
  if (v8 != v10) {
    -[CPLRecordChange setChangeType:](self, "setChangeType:");
  }
}

void __46__CPLRecordChange_applyChangeType_fromChange___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) propertiesForChangeType:a2];
  [*(id *)(a1 + 32) cplCopyProperties:v3 fromObject:*(void *)(a1 + 40) withCopyBlock:0];
}

- (void)applyChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  unint64_t v5 = [(CPLRecordChange *)self changeType];
  if (v5 == 1024)
  {
    if (!_CPLSilentLogging)
    {
      unint64_t v10 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v13;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Can't apply %@ to a delete", buf, 0xCu);
      }
    }
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m"];
    [v11 handleFailureInMethod:a2, self, v12, 1418, @"Can't apply %@ to a delete", v13 object file lineNumber description];

    abort();
  }
  unint64_t v6 = v5;
  uint64_t v7 = [v13 changeType];
  if (v7 == 1024)
  {
    unint64_t v8 = self;
LABEL_7:
    [(CPLRecordChange *)v8 setChangeType:v7];
    goto LABEL_9;
  }
  if (!v7)
  {
    [self cplCopyPropertiesFromObject:v13 withCopyBlock:0];
    if (!v6) {
      goto LABEL_9;
    }
    unint64_t v8 = self;
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  [(CPLRecordChange *)self applyChangeType:v7 fromChange:v13];
  BOOL v9 = [v13 recordModificationDate];
  [(CPLRecordChange *)self setRecordModificationDate:v9];

LABEL_9:
}

- (void)clearChangeType:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__CPLRecordChange_clearChangeType___block_invoke;
  v3[3] = &unk_1E60AABD0;
  v3[4] = self;
  [(CPLRecordChange *)self enumerateChangeTypesForChangeType:a3 block:v3];
}

void __35__CPLRecordChange_clearChangeType___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) hasChangeType:a2])
  {
    id v4 = [*(id *)(a1 + 32) propertiesForChangeType:a2];
    [*(id *)(a1 + 32) cplClearProperties:v4];
  }
}

- (id)copyChangeType:(unint64_t)a3
{
  if (a3)
  {
    if (!-[CPLRecordChange hasChangeType:](self, "hasChangeType:")) {
      return 0;
    }
    unint64_t v5 = objc_opt_class();
    unint64_t v6 = [(CPLRecordChange *)self scopedIdentifier];
    uint64_t v7 = (void *)[v5 newChangeWithScopedIdentifier:v6 changeType:a3];

    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __34__CPLRecordChange_copyChangeType___block_invoke;
    uint64_t v16 = &unk_1E60AAC20;
    uint64_t v17 = self;
    id v8 = v7;
    id v18 = v8;
    [(CPLRecordChange *)self enumerateChangeTypesForChangeType:a3 block:&v13];
    BOOL v9 = [(CPLRecordChange *)self recordModificationDate];
    [v8 setRecordModificationDate:v9];

    [v8 restoreRelationshipsFromFullRecord:self];
    unint64_t v10 = v18;
    id v11 = v8;

    return v11;
  }
  else
  {
    return (id)[(CPLRecordChange *)self copy];
  }
}

void __34__CPLRecordChange_copyChangeType___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) propertiesForChangeType:a2];
  [*(id *)(a1 + 40) cplCopyProperties:v3 fromObject:*(void *)(a1 + 32) withCopyBlock:0];
}

- (void)enumerateChangeTypesForChangeType:(unint64_t)a3 block:(id)a4
{
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  char v6 = [(CPLRecordChange *)self supportedChangeTypes];
  if ((v6 & 2) != 0 && (!a3 || (a3 & 2) != 0)) {
    v7[2](v7, 2);
  }
  if ((v6 & 8) != 0 && (!a3 || (a3 & 8) != 0)) {
    v7[2](v7, 8);
  }
  if ((v6 & 0x10) != 0 && (!a3 || (a3 & 0x10) != 0)) {
    v7[2](v7, 16);
  }
  if ((v6 & 0x20) != 0 && (!a3 || (a3 & 0x20) != 0)) {
    v7[2](v7, 32);
  }
  if ((v6 & 0x40) != 0 && (!a3 || (a3 & 0x40) != 0)) {
    v7[2](v7, 64);
  }
}

- (void)copyDerivativesFromRecordIfPossible:(id)a3
{
  id v5 = a3;
  char v6 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m"];
  id v8 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 1372, @"%@ should be implemented by subclass", v8 object file lineNumber description];

  abort();
}

- (void)copyDerivatives:(unint64_t *)a3 count:(int)a4 avoidResourceType:(unint64_t)a5 fromRecord:(id)a6 inResourcePerType:(id)a7
{
  id v25 = a6;
  id v12 = a7;
  if (a4 >= 1)
  {
    uint64_t v13 = a4;
    do
    {
      uint64_t v15 = *a3++;
      uint64_t v14 = v15;
      if (v15 != a5)
      {
        uint64_t v16 = [NSNumber numberWithUnsignedInteger:v14];
        uint64_t v17 = [v12 objectForKeyedSubscript:v16];

        if (!v17)
        {
          id v18 = [v25 resourceForType:v14];
          v19 = v18;
          if (v18)
          {
            v20 = [v18 identity];
            int v21 = [v20 isAvailable];

            if (v21)
            {
              char v22 = (void *)[v19 copy];
              long long v23 = [(CPLRecordChange *)self scopedIdentifier];
              [v22 setItemScopedIdentifier:v23];

              [v22 setSourceResourceType:v14];
              long long v24 = [NSNumber numberWithUnsignedInteger:v14];
              [v12 setObject:v22 forKeyedSubscript:v24];
            }
          }
        }
      }
      --v13;
    }
    while (v13);
  }
}

- (unint64_t)baseVideoComplemenentResourceType
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m"];
  char v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 1348, @"%@ should be implemented in subclasses", v6 object file lineNumber description];

  abort();
}

- (unint64_t)baseDerivativeResourceType
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m"];
  char v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 1344, @"%@ should be implemented in subclasses", v6 object file lineNumber description];

  abort();
}

- (id)resourcePerType
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m"];
  char v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 1340, @"%@ should be implemented in subclasses", v6 object file lineNumber description];

  abort();
}

- (BOOL)allResourcesAreAvailable
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(CPLRecordChange *)self supportsSharingScopedIdentifier])
  {
    id v3 = [(CPLRecordChange *)self sharingScopeIdentifier];

    if (v3) {
      return 1;
    }
  }
  if (![(CPLRecordChange *)self supportsResources]
    || ![(CPLRecordChange *)self hasChangeType:8])
  {
    return 1;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(CPLRecordChange *)self resources];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) identity];
        int v10 = [v9 isAvailable];

        if (!v10)
        {
          BOOL v11 = 0;
          goto LABEL_17;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_17:

  return v11;
}

- (BOOL)isResourceTypeAGeneratedDerivative:(unint64_t)a3
{
  return +[CPLResource isDerivativeResourceType:a3];
}

- (unint64_t)fullChangeTypeForFullRecord
{
  if ([(CPLRecordChange *)self supportsResources]) {
    unint64_t v3 = 10;
  }
  else {
    unint64_t v3 = 2;
  }
  if ([(CPLRecordChange *)self supportsSharingScopedIdentifier]) {
    return v3 | 0x40;
  }
  else {
    return v3;
  }
}

- (BOOL)canLowerQuota
{
  return 0;
}

- (void)_setShouldNotTrustCloudCache:(BOOL)a3
{
  self->_shouldNotTrustCloudCache = a3;
}

- (BOOL)_shouldNotTrustCloudCache
{
  return self->_shouldNotTrustCloudCache;
}

- (void)_setPushContext:(id)a3
{
}

- (id)_pushContext
{
  return self->_pushContext;
}

- (unint64_t)estimatedRecordSize
{
  unint64_t v3 = (void *)MEMORY[0x1BA993DF0](self, a2);
  id v4 = objc_msgSend(MEMORY[0x1E4F28DB0], "cpl_archivedDataWithRootObject:", self);
  unint64_t v5 = [v4 length];

  return v5;
}

- (BOOL)validateChangeWithError:(id *)a3
{
  scopedIdentifier = self->_scopedIdentifier;
  if (a3 && !scopedIdentifier)
  {
    *a3 = +[CPLErrors cplErrorWithCode:18, @"%@ has no identifier", self description];
  }
  return scopedIdentifier != 0;
}

- (BOOL)validateFullRecord
{
  return 1;
}

- (id)onlyAddedResources
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(CPLRecordChange *)self resources];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  unint64_t v5 = [(CPLRecordChange *)self resourceCopyFromScopedIdentifier];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        id v12 = objc_msgSend(v11, "identity", (void)v17);
        long long v13 = [v12 fileURL];
        if (v13)
        {

LABEL_8:
          [v4 addObject:v11];
          goto LABEL_9;
        }
        if (v5)
        {
          uint64_t v14 = [v11 sourceResourceType];

          if (v14) {
            goto LABEL_8;
          }
        }
        else
        {
        }
LABEL_9:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v15 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v8 = v15;
    }
    while (v15);
  }

  return v4;
}

- (BOOL)changeIsOnlyAddingResourcesToRecord:(id)a3 addedResources:(id *)a4
{
  id v6 = a3;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__14340;
  v41 = __Block_byref_object_dispose__14341;
  id v42 = 0;
  uint64_t v7 = [(CPLRecordChange *)self resourceCopyFromScopedIdentifier];
  BOOL v8 = v7 != 0;

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __70__CPLRecordChange_changeIsOnlyAddingResourcesToRecord_addedResources___block_invoke;
  v35[3] = &unk_1E60A9198;
  BOOL v36 = v8;
  v35[4] = &v37;
  v34 = (uint64_t (**)(void, void))MEMORY[0x1BA994060](v35);
  *a4 = 0;
  v31 = v6;
  v32 = [v6 resources];
  uint64_t v9 = [(CPLRecordChange *)self resources];
  unint64_t v33 = [v9 count];
  uint64_t v10 = [v32 count];
  unint64_t v11 = v10;
  unint64_t v12 = 0;
  BOOL v13 = v33 != 0;
  BOOL v14 = v10 != 0;
  if (v33 && v10)
  {
    unint64_t v15 = 0;
    unint64_t v12 = 0;
    while (1)
    {
      long long v16 = v9;
      long long v17 = [v9 objectAtIndexedSubscript:v12];
      long long v18 = [v32 objectAtIndexedSubscript:v15];
      long long v19 = a4;
      unint64_t v20 = [v17 resourceType];
      unint64_t v21 = [v18 resourceType];
      if (v20 == v21)
      {
        if ((((uint64_t (**)(void, void *))v34)[2](v34, v17) & 1) == 0)
        {
          uint64_t v22 = [v17 identity];
          long long v23 = [v18 identity];
          long long v24 = v23;
          if (!v22 || !v23)
          {

LABEL_27:
            BOOL v26 = 0;
            uint64_t v9 = v16;
            goto LABEL_28;
          }
          int v25 = [v22 cplIsEqual:v23 withEqualityBlock:&__block_literal_global_256];

          if (!v25) {
            goto LABEL_27;
          }
        }
        ++v15;
      }
      else if (v20 >= v21 || (((uint64_t (**)(void, void *))v34)[2](v34, v17) & 1) == 0)
      {
        goto LABEL_27;
      }
      ++v12;

      BOOL v14 = v15 < v11;
      BOOL v13 = v12 < v33;
      if (v12 >= v33) {
        break;
      }
      a4 = v19;
      uint64_t v9 = v16;
      if (v15 >= v11) {
        goto LABEL_14;
      }
    }
    a4 = v19;
    uint64_t v9 = v16;
    if (v15 < v11) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_14:
    if (v14)
    {
LABEL_15:
      BOOL v26 = 0;
      goto LABEL_28;
    }
  }
  if (v12 >= v33) {
    BOOL v13 = 0;
  }
  if (v13)
  {
    do
    {
      char v27 = [v9 objectAtIndexedSubscript:v12];
      char v28 = ((uint64_t (**)(void, void *))v34)[2](v34, v27);

      if ((v28 & 1) == 0) {
        goto LABEL_15;
      }
    }
    while (v33 != ++v12);
  }
  if (v38[5]) {
    uint64_t v29 = (void *)v38[5];
  }
  else {
    uint64_t v29 = (void *)MEMORY[0x1E4F1CBF0];
  }
  *a4 = v29;
  BOOL v26 = 1;
LABEL_28:

  _Block_object_dispose(&v37, 8);
  return v26;
}

uint64_t __70__CPLRecordChange_changeIsOnlyAddingResourcesToRecord_addedResources___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identity];
  unint64_t v5 = [v4 fileURL];
  if (!v5)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v11 = [v3 sourceResourceType];

      if (v11) {
        goto LABEL_3;
      }
    }
    else
    {
    }
    uint64_t v10 = 0;
    goto LABEL_11;
  }

LABEL_3:
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  [v6 addObject:v3];
  uint64_t v10 = 1;
LABEL_11:

  return v10;
}

uint64_t __70__CPLRecordChange_changeIsOnlyAddingResourcesToRecord_addedResources___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if ([a4 isEqualToString:@"available"]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (BOOL)allowsToOnlyUploadNewResources
{
  return 0;
}

- (BOOL)shouldOnlyUploadNewResources
{
  return self->_shouldOnlyUploadNewResources;
}

- (void)markToOnlyUploadNewResources
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (![(CPLRecordChange *)self allowsToOnlyUploadNewResources])
  {
    if (!_CPLSilentLogging)
    {
      id v4 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v8 = self;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Trying to mark as uploading only new resources for %@", buf, 0xCu);
      }
    }
    unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m"];
    [v5 handleFailureInMethod:a2, self, v6, 1159, @"Trying to mark as uploading only new resources for %@", self object file lineNumber description];

    abort();
  }
  if (!self->_shouldOnlyUploadNewResources) {
    self->_shouldOnlyUploadNewResources = 1;
  }
}

- (void)markAsSparseFullChange
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_isSparseFullChange)
  {
    if (![(CPLRecordChange *)self isFullRecord])
    {
      if (!_CPLSilentLogging)
      {
        id v4 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v8 = self;
          _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Trying to mark a non full record as sparse: %@", buf, 0xCu);
        }
      }
      unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m"];
      [v5 handleFailureInMethod:a2, self, v6, 1153, @"Trying to mark a non full record as sparse: %@", self object file lineNumber description];

      abort();
    }
    self->_isSparseFullChange = 1;
  }
}

- (BOOL)isSparseFullChange
{
  return self->_isSparseFullChange;
}

- (id)checkDefaultValueBlockForPropertyWithSelector:(SEL)a3
{
  if (sel_dateDeleted == a3)
  {
    id v3 = &__block_literal_global_244;
  }
  else if (sel_sharingScopeIdentifier == a3)
  {
    id v3 = (void *)MEMORY[0x1BA994060](_CPLDefaultValueObjectNil, a2);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

BOOL __65__CPLRecordChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 dateDeleted];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)shouldFilterDefaultValuesForNewProperties
{
  return self->_shouldFilterDefaultValuesForNewProperties;
}

- (void)setShouldFilterDefaultValuesForNewProperties:(BOOL)a3
{
  if (self->_shouldFilterDefaultValuesForNewProperties != a3) {
    self->_shouldFilterDefaultValuesForNewProperties = a3;
  }
}

- (BOOL)shouldApplyPropertiesWithSelector:(SEL)a3
{
  if (self->_shouldFilterDefaultValuesForNewProperties)
  {
    uint64_t v5 = -[CPLRecordChange checkDefaultValueBlockForPropertyWithSelector:](self, "checkDefaultValueBlockForPropertyWithSelector:");
    id v6 = (void *)v5;
    if (v5) {
      int v7 = (*(uint64_t (**)(uint64_t, CPLRecordChange *, SEL))(v5 + 16))(v5, self, a3) ^ 1;
    }
    else {
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (id)fingerprintSchemeWithContext:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  int v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m"];
  uint64_t v8 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 1109, @"%@ should be implemented by subclasses", v8 object file lineNumber description];

  abort();
}

- (unint64_t)largestResourceSize
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(CPLRecordChange *)self supportsResources]
    || ![(CPLRecordChange *)self hasChangeType:8])
  {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(CPLRecordChange *)self resources];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) identity];
        unint64_t v10 = [v9 fileSize];

        if (v6 <= v10) {
          unint64_t v6 = v10;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)resourcesDescription
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(CPLRecordChange *)self changeType];
  uint64_t v4 = [(CPLRecordChange *)self resources];
  uint64_t v5 = [(CPLRecordChange *)self resourceCopyFromScopedIdentifier];
  if ([v4 count])
  {
LABEL_2:
    uint64_t v6 = [v4 count];
    if (v5)
    {
      [NSString stringWithFormat:@"%lu resources (from %@)", v6, v5, v21];
      uint64_t v17 = LABEL_32:;
      goto LABEL_33;
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v22 = v6;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v7);
          }
          long long v14 = [*(id *)(*((void *)&v23 + 1) + 8 * i) identity];
          long long v15 = [v14 fileURL];

          if (!v15)
          {
            ++v11;
            v10 += [v14 isAvailable] ^ 1;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);

      long long v16 = &stru_1F0D5F858;
      uint64_t v6 = v22;
      if (v22)
      {
        uint64_t v5 = 0;
        if (v11)
        {
          if (v11 == v22)
          {
            long long v16 = @"sparse ";
            if (!v10) {
              goto LABEL_31;
            }
          }
          else
          {
            BOOL v19 = [(CPLRecordChange *)self allowsToOnlyUploadNewResources];
            long long v16 = @"MIXED! ";
            if (v19) {
              long long v16 = @"mixed ";
            }
            if (!v10) {
              goto LABEL_31;
            }
          }
LABEL_27:
          [NSString stringWithFormat:@"%lu %@resources (%lu unav.)", v22, v16, v10];
          goto LABEL_32;
        }
      }
      else
      {
        uint64_t v5 = 0;
      }
      if (v10) {
        goto LABEL_27;
      }
    }
    else
    {

      long long v16 = &stru_1F0D5F858;
    }
LABEL_31:
    [NSString stringWithFormat:@"%lu %@resources", v6, v16, v21];
    goto LABEL_32;
  }
  if (v3)
  {
    if ((v3 & 8) != 0) {
      goto LABEL_2;
    }
LABEL_23:
    long long v18 = &stru_1F0D5F858;
    goto LABEL_34;
  }
  if (!v5) {
    goto LABEL_23;
  }
  uint64_t v17 = [[NSString alloc] initWithFormat:@"(from %@)", v5];
LABEL_33:
  long long v18 = (__CFString *)v17;
LABEL_34:

  return v18;
}

- (id)cplFullDescription
{
  unint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"======\n%@: {\n", objc_opt_class()];
  unint64_t v4 = [(CPLRecordChange *)self changeType];
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "_descriptionForChangeType:isSparseFullChange:onlyUploadNewResources:", v4, self->_isSparseFullChange, -[CPLRecordChange shouldOnlyUploadNewResources](self, "shouldOnlyUploadNewResources"));
  [v3 appendFormat:@"  changeType: %@\n", v5];

  uint64_t v6 = [(CPLRecordChange *)self recordModificationDate];
  id v7 = (void *)v6;
  if (v6) {
    [v3 appendFormat:@"  recordModificationDate: %@\n", v6];
  }
  uint64_t v8 = [(CPLRecordChange *)self recordChangeData];
  uint64_t v9 = v8;
  if (v8) {
    objc_msgSend(v3, "appendFormat:", @"  recordChangeDataSize: %lu\n", objc_msgSend(v8, "length"));
  }
  uint64_t v10 = [(CPLRecordChange *)self sharingRecordChangeData];
  uint64_t v11 = v10;
  if (v10) {
    objc_msgSend(v3, "appendFormat:", @"  sharingRecordChangeDataSize: %lu\n", objc_msgSend(v10, "length"));
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __37__CPLRecordChange_cplFullDescription__block_invoke;
  v16[3] = &unk_1E60A9170;
  unint64_t v19 = v4;
  id v12 = v3;
  id v17 = v12;
  long long v18 = self;
  long long v13 = (void (**)(void, void))MEMORY[0x1BA994060](v16);
  v13[2](v13, 256);
  [(CPLRecordChange *)self enumerateChangeTypesForChangeType:[(CPLRecordChange *)self changeType] block:v13];
  [v12 appendString:@"}"];
  id v14 = v12;

  return v14;
}

void __37__CPLRecordChange_cplFullDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    BOOL v3 = (v2 & a2) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3)
  {
    uint64_t v5 = a1;
    [*(id *)(a1 + 32) appendString:@"  ----\n"];
    [*(id *)(v5 + 40) propertiesForChangeType:a2];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v23 = v30 = 0u;
    uint64_t v6 = [v23 allObjects];
    id v7 = [v6 sortedArrayUsingSelector:sel_compare_];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      uint64_t v11 = @"  %@: [%lu bytes]\n";
      uint64_t v24 = *(void *)v28;
      uint64_t v25 = v5;
      do
      {
        uint64_t v12 = 0;
        uint64_t v26 = v9;
        do
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * v12);
          id v14 = [*(id *)(v5 + 40) valueForKey:v13];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend(*(id *)(v5 + 32), "appendFormat:", v11, v13, objc_msgSend(v14, "length"));
          }
          else
          {
            long long v15 = (void *)MEMORY[0x1BA993DF0]();
            long long v16 = [v14 cplFullDescription];
            if ((unint64_t)[v16 length] >= 0x2801)
            {
              id v17 = NSString;
              [v16 substringToIndex:1000];
              v19 = long long v18 = v7;
              objc_msgSend(v16, "substringFromIndex:", objc_msgSend(v16, "length") - 1000);
              uint64_t v21 = v20 = v11;
              uint64_t v22 = [v17 stringWithFormat:@"%@...%@", v19, v21];

              uint64_t v11 = v20;
              id v7 = v18;
              long long v16 = (void *)v22;
              uint64_t v10 = v24;
              uint64_t v5 = v25;
            }
            [*(id *)(v5 + 32) appendFormat:@"  %@: %@\n", v13, v16];

            uint64_t v9 = v26;
          }

          ++v12;
        }
        while (v9 != v12);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v9);
    }
  }
}

- (int64_t)dequeueOrder
{
  uint64_t v2 = [(CPLRecordChange *)self recordModificationDate];
  BOOL v3 = v2;
  if (v2)
  {
    [v2 timeIntervalSinceReferenceDate];
    int64_t v5 = (uint64_t)v4;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)restoreRelationshipsFromFullRecord:(id)a3
{
  id v6 = a3;
  if (![(CPLRecordChange *)self hasChangeType:2])
  {
    double v4 = [v6 relatedIdentifier];
    [(CPLRecordChange *)self setRelatedIdentifier:v4];

    int64_t v5 = [v6 secondaryIdentifier];
    [(CPLRecordChange *)self setSecondaryIdentifier:v5];
  }
}

- (void)awakeFromStorage
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(CPLRecordChange *)self supportsResources])
  {
    BOOL v3 = [(CPLRecordChange *)self scopedIdentifier];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    double v4 = [(CPLRecordChange *)self resources];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setItemScopedIdentifier:v3];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)prepareForStorage
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(CPLRecordChange *)self supportsResources])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    BOOL v3 = [(CPLRecordChange *)self resources];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setItemScopedIdentifier:0];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)clearIdentifiers
{
  scopedIdentifier = self->_scopedIdentifier;
  self->_scopedIdentifier = 0;

  [(CPLRecordChange *)self setRelatedIdentifier:0];
  [(CPLRecordChange *)self setSecondaryIdentifier:0];
}

- (id)allRelatedScopedIdentifiers
{
  BOOL v3 = [(CPLRecordChange *)self scopedIdentifier];
  uint64_t v4 = [(CPLRecordChange *)self relatedScopedIdentifier];
  uint64_t v5 = [(CPLRecordChange *)self secondaryScopedIdentifier];
  uint64_t v6 = (void *)v5;
  if (v3 || v4 || v5)
  {
    long long v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:3];
    id v7 = v8;
    if (v3) {
      [v8 addObject:v3];
    }
    if (v4) {
      [v7 addObject:v4];
    }
    if (v6) {
      [v7 addObject:v6];
    }
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }

  return v7;
}

- (id)proposedLocalScopedIdentifier
{
  uint64_t v2 = [(CPLRecordChange *)self scopedIdentifier];
  BOOL v3 = (void *)[v2 copy];

  return v3;
}

- (id)secondaryScopedIdentifier
{
  BOOL v3 = [(CPLRecordChange *)self secondaryIdentifier];
  if (v3)
  {
    uint64_t v4 = [CPLScopedIdentifier alloc];
    uint64_t v5 = [(CPLRecordChange *)self scopedIdentifier];
    id v6 = [(CPLScopedIdentifier *)v4 initRelativeToScopedIdentifier:v5 identifier:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)secondaryIdentifier
{
  return 0;
}

- (BOOL)secondaryRelationshipIsWeak
{
  uint64_t v2 = objc_opt_class();
  return [v2 secondaryRelationshipIsWeak];
}

- (id)relatedScopedIdentifier
{
  BOOL v3 = [(CPLRecordChange *)self relatedIdentifier];
  if (v3)
  {
    uint64_t v4 = [CPLScopedIdentifier alloc];
    uint64_t v5 = [(CPLRecordChange *)self scopedIdentifier];
    id v6 = [(CPLScopedIdentifier *)v4 initRelativeToScopedIdentifier:v5 identifier:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)relatedIdentifier
{
  return 0;
}

- (BOOL)relatedRelationshipIsWeak
{
  uint64_t v2 = objc_opt_class();
  return [v2 relatedRelationshipIsWeak];
}

- (id)propertiesForChangeType:(unint64_t)a3
{
  if (a3 == 256)
  {
    if (propertiesForChangeType__onceToken_169 != -1) {
      dispatch_once(&propertiesForChangeType__onceToken_169, &__block_literal_global_171);
    }
    uint64_t v4 = (void *)propertiesForChangeType__modificationDateProperty;
    goto LABEL_13;
  }
  if (a3 == 64)
  {
    if (propertiesForChangeType__onceToken_173 != -1) {
      dispatch_once(&propertiesForChangeType__onceToken_173, &__block_literal_global_175);
    }
    uint64_t v4 = (void *)propertiesForChangeType__sharingProperties;
LABEL_13:
    id v5 = v4;
LABEL_15:
    id v3 = v5;
    goto LABEL_16;
  }
  if (a3 != 2)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    goto LABEL_15;
  }
  if (propertiesForChangeType__onceToken_14416 != -1)
  {
    id v7 = self;
    dispatch_once(&propertiesForChangeType__onceToken_14416, &__block_literal_global_136);
    self = v7;
  }
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = __Block_byref_object_copy__14340;
  uint64_t v13 = __Block_byref_object_dispose__14341;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__CPLRecordChange_propertiesForChangeType___block_invoke_139;
  v8[3] = &unk_1E60AA7E0;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync((dispatch_queue_t)propertiesForChangeType__lock, v8);
  id v3 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

LABEL_16:
  return v3;
}

void __43__CPLRecordChange_propertiesForChangeType___block_invoke_139(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = [(id)propertiesForChangeType__classToProperties objectForKey:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v6 = [(id)objc_opt_class() cplAllPropertyNames];
    id v17 = (id)[v6 mutableCopy];

    id v7 = [*(id *)(a1 + 32) propertiesForChangeType:64];
    if (v7) {
      [v17 minusSet:v7];
    }
    long long v8 = [*(id *)(a1 + 32) propertiesForChangeType:32];

    if (v8) {
      [v17 minusSet:v8];
    }
    uint64_t v9 = [*(id *)(a1 + 32) propertiesForChangeType:16];

    if (v9) {
      [v17 minusSet:v9];
    }
    long long v10 = [*(id *)(a1 + 32) propertiesForChangeType:8];

    if (v10) {
      [v17 minusSet:v10];
    }
    uint64_t v11 = [*(id *)(a1 + 32) propertiesForChangeType:256];

    if (v11) {
      [v17 minusSet:v11];
    }
    [v17 removeObject:@"changeType"];
    [v17 removeObject:@"recordChangeData"];
    [v17 removeObject:@"sharingRecordChangeData"];
    if (!+[CPLAssetChange serverSupportsSharedLibrarySharingState](CPLAssetChange, "serverSupportsSharedLibrarySharingState"))[v17 removeObject:@"sharedLibrarySharingState"]; {
    if (!+[CPLAssetChange serverSupportsDeletedByUserIdentifier](CPLAssetChange, "serverSupportsDeletedByUserIdentifier"))[v17 removeObject:@"deletedByUserIdentifier"];
    }
    if (!+[CPLAssetChange serverSupportsLastViewedDate]) {
      [v17 removeObject:@"lastViewedDate"];
    }
    if (!+[CPLPersonChange serverSupportsDetectionType]) {
      [v17 removeObject:@"detectionType"];
    }
    BOOL v12 = +[CPLPersonChange serverSupportsAssetSortOrder];
    uint64_t v13 = v17;
    if (!v12)
    {
      [v17 removeObject:@"assetSortOrder"];
      uint64_t v13 = v17;
    }
    [v13 removeObject:@"serverRecordIsCorrupted"];
    uint64_t v14 = [v17 copy];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    [(id)propertiesForChangeType__classToProperties setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:v2];
  }
}

uint64_t __43__CPLRecordChange_propertiesForChangeType___block_invoke_3()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"sharingScopeIdentifier", @"sharingContributorUserIdentifiers", @"updateSharingContributorUserIdentifiers", 0);
  uint64_t v1 = propertiesForChangeType__sharingProperties;
  propertiesForChangeType__sharingProperties = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __43__CPLRecordChange_propertiesForChangeType___block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithObject:@"recordModificationDate"];
  uint64_t v1 = propertiesForChangeType__modificationDateProperty;
  propertiesForChangeType__modificationDateProperty = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __43__CPLRecordChange_propertiesForChangeType___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.changeproperties", 0);
  uint64_t v1 = (void *)propertiesForChangeType__lock;
  propertiesForChangeType__lock = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = propertiesForChangeType__classToProperties;
  propertiesForChangeType__classToProperties = (uint64_t)v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

- (id)mergeRecordChangeWithNewRecordChange:(id)a3 direction:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 changeType];
  if (v7)
  {
    uint64_t v8 = v7;
    if (v7 == 1024)
    {
      if ([(CPLRecordChange *)self changeType] == 1024) {
        uint64_t v9 = self;
      }
      else {
        uint64_t v9 = (CPLRecordChange *)v6;
      }
      id v17 = v9;
    }
    else
    {
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2020000000;
      unint64_t v42 = 0;
      unint64_t v42 = [(CPLRecordChange *)self changeType];
      uint64_t v18 = v40[3];
      if (v18 == 1024)
      {
        id v17 = (CPLRecordChange *)v6;
      }
      else
      {
        unint64_t v19 = (void *)[(CPLRecordChange *)self copy];
        unint64_t v20 = [(id)objc_opt_class() copyPropertyBlockForDirection:a4];
        uint64_t v21 = v20;
        if (v20)
        {
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __66__CPLRecordChange_mergeRecordChangeWithNewRecordChange_direction___block_invoke_2;
          v36[3] = &unk_1E60A9120;
          id v37 = v20;
          unint64_t v38 = a4;
          uint64_t v22 = (void *)MEMORY[0x1BA994060](v36);
        }
        else
        {
          uint64_t v22 = 0;
        }
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __66__CPLRecordChange_mergeRecordChangeWithNewRecordChange_direction___block_invoke_3;
        v29[3] = &unk_1E60A9148;
        uint64_t v34 = v8;
        v29[4] = self;
        id v23 = v19;
        id v30 = v23;
        id v31 = v6;
        id v24 = v22;
        BOOL v35 = v18 != 0;
        id v32 = v24;
        unint64_t v33 = &v39;
        [(CPLRecordChange *)self enumerateChangeTypesForChangeType:0 block:v29];
        if (v18) {
          [v23 setChangeType:v40[3]];
        }
        uint64_t v25 = [(CPLRecordChange *)self scopedIdentifier];
        uint64_t v26 = [v25 scopeIndex];

        if (v26 != 0x7FFFFFFFFFFFFFFFLL) {
          [v23 setScopeIndex:v26];
        }
        long long v27 = v32;
        id v17 = (CPLRecordChange *)v23;
      }
      _Block_object_dispose(&v39, 8);
    }
  }
  else
  {
    long long v10 = [(id)objc_opt_class() copyPropertyBlockForDirection:a4];
    if (v10)
    {
      uint64_t v11 = (void *)[(CPLRecordChange *)self copy];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __66__CPLRecordChange_mergeRecordChangeWithNewRecordChange_direction___block_invoke;
      v43[3] = &unk_1E60A90A8;
      id v46 = v10;
      id v12 = v11;
      id v44 = v12;
      id v13 = v6;
      id v45 = v13;
      unint64_t v47 = a4;
      [v12 cplCopyPropertiesFromObject:v13 withCopyBlock:v43];
      [v12 setChangeType:0];
      uint64_t v14 = [v13 scopedIdentifier];
      uint64_t v15 = [v14 scopeIndex];

      if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
        [v12 setScopeIndex:v15];
      }
      long long v16 = v45;
      id v17 = (CPLRecordChange *)v12;
    }
    else
    {
      id v17 = (CPLRecordChange *)v6;
    }
  }
  return v17;
}

uint64_t __66__CPLRecordChange_mergeRecordChangeWithNewRecordChange_direction___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void, void, void, void, uint64_t, uint64_t, uint64_t, void))(a1[6] + 16))(a1[6], a1[4], a1[5], a1[4], a4, a5, a6, a1[7]);
}

uint64_t __66__CPLRecordChange_mergeRecordChangeWithNewRecordChange_direction___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, a3, a2, a4, a5, a6, *(void *)(a1 + 40));
}

void __66__CPLRecordChange_mergeRecordChangeWithNewRecordChange_direction___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if ((*(void *)(a1 + 72) & a2) != 0)
  {
    id v8 = [*(id *)(a1 + 32) propertiesForChangeType:a2];
    objc_msgSend(*(id *)(a1 + 40), "cplCopyProperties:fromObject:withCopyBlock:");
    if (*(unsigned char *)(a1 + 80))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v5 = *(void *)(v4 + 24);
      if (v5) {
        BOOL v6 = a2 == 0;
      }
      else {
        BOOL v6 = 1;
      }
      uint64_t v7 = v5 | a2;
      if (v6) {
        uint64_t v7 = 0;
      }
      *(void *)(v4 + 24) = v7;
    }
  }
}

- (BOOL)resourceChangeWillOnlyChangeDerivatives:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(CPLRecordChange *)self supportsResources]
    || ![(CPLRecordChange *)self isFullRecord]
    || ([v5 hasChangeType:8] & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      long long v28 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v41 = v5;
        __int16 v42 = 2112;
        v43 = self;
        _os_log_impl(&dword_1B4CAC000, v28, OS_LOG_TYPE_ERROR, "Incorrectly trying to filter out derivatives change %@ from %@", buf, 0x16u);
      }
    }
    long long v29 = [MEMORY[0x1E4F28B00] currentHandler];
    id v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m"];
    [v29 handleFailureInMethod:a2, self, v30, 689, @"Incorrectly trying to filter out derivatives change %@ from %@", v5, self object file lineNumber description];

    abort();
  }
  BOOL v6 = [(CPLRecordChange *)self propertiesForChangeType:8];
  uint64_t v7 = (void *)[v6 mutableCopy];

  [v7 removeObject:@"resources"];
  if ([self cplProperties:v7 areEqualToPropertiesOf:v5 withEqualityBlock:0])
  {
    id v8 = [(CPLRecordChange *)self resources];
    uint64_t v9 = [v5 resources];
    uint64_t v10 = [v8 count];
    if (v10 == [v9 count])
    {
      uint64_t v11 = [v9 objectEnumerator];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v12 = v8;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        id v31 = v9;
        id v32 = v8;
        unint64_t v33 = v7;
        id v34 = v5;
        uint64_t v15 = *(void *)v36;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v36 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            uint64_t v18 = [v11 nextObject];
            if (!-[CPLRecordChange isResourceTypeAGeneratedDerivative:](self, "isResourceTypeAGeneratedDerivative:", [v17 resourceType]))
            {
              unint64_t v19 = [v17 identity];
              int v20 = [v19 isAvailable];

              if (!v20) {
                goto LABEL_22;
              }
              uint64_t v21 = [v18 identity];
              uint64_t v22 = [v21 fileURL];
              if (v22)
              {
                id v23 = (void *)v22;
                [v21 setFileURL:0];
                char v24 = [v17 isEqual:v18];
                [v21 setFileURL:v23];

                if ((v24 & 1) == 0) {
                  goto LABEL_22;
                }
              }
              else
              {
                char v25 = [v17 isEqual:v18];

                if ((v25 & 1) == 0)
                {
LABEL_22:

                  BOOL v26 = 0;
                  goto LABEL_23;
                }
              }
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v14) {
            continue;
          }
          break;
        }
        BOOL v26 = 1;
LABEL_23:
        uint64_t v7 = v33;
        id v5 = v34;
        uint64_t v9 = v31;
        id v8 = v32;
      }
      else
      {
        BOOL v26 = 1;
      }
    }
    else
    {
      BOOL v26 = 0;
    }
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

- (id)attachedDiffTracker
{
  return self->_attachedDiffTracker;
}

- (void)attachDiffTracker:(id)a3
{
}

- (id)realRecordChangeFromRecordChange:(id)a3 direction:(unint64_t)a4 newRecord:(id *)a5
{
  return [(CPLRecordChange *)self realRecordChangeFromRecordChange:a3 direction:a4 newRecord:a5 diffTracker:0];
}

- (id)realRecordChangeFromRecordChange:(id)a3 direction:(unint64_t)a4 newRecord:(id *)a5 diffTracker:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  uint64_t v12 = [v11 changeType];
  if (v12) {
    uint64_t v13 = v12 | 0x100;
  }
  else {
    uint64_t v13 = 378;
  }
  uint64_t v14 = [(CPLRecordChange *)self realRecordChangeFromRecordChange:v11 direction:a4 newRecord:a5 changeType:v13 diffTracker:v10];

  return v14;
}

- (id)realRecordChangeFromRecordChange:(id)a3 direction:(unint64_t)a4 newRecord:(id *)a5 changeType:(unint64_t)a6 diffTracker:(id)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a7;
  if ((a6 & 0x400) != 0)
  {
    if (!_CPLSilentLogging)
    {
      long long v29 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v13;
        _os_log_impl(&dword_1B4CAC000, v29, OS_LOG_TYPE_ERROR, "Trying to compute changes for a delete change: %@", buf, 0xCu);
      }
    }
    id v30 = [MEMORY[0x1E4F28B00] currentHandler];
    id v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m"];
    [v30 handleFailureInMethod:a2, self, v31, 610, @"Trying to compute changes for a delete change: %@", v13 object file lineNumber description];

    abort();
  }
  uint64_t v15 = v14;
  long long v16 = [v13 scopedIdentifier];
  id v17 = [(CPLRecordChange *)self scopedIdentifier];
  char v18 = [v16 isEqual:v17];

  if ((v18 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v32 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        unint64_t v33 = [v13 scopedIdentifier];
        id v34 = [(CPLRecordChange *)self scopedIdentifier];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v34;
        _os_log_impl(&dword_1B4CAC000, v32, OS_LOG_TYPE_ERROR, "Mismatched identifier between change (%@) and record (%@)", buf, 0x16u);
      }
    }
    long long v35 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m"];
    long long v37 = [v13 scopedIdentifier];
    long long v38 = [(CPLRecordChange *)self scopedIdentifier];
    [v35 handleFailureInMethod:a2, self, v36, 611, @"Mismatched identifier between change (%@) and record (%@)", v37, v38 object file lineNumber description];

    abort();
  }
  *a5 = 0;
  unint64_t v19 = (void *)[(CPLRecordChange *)self copy];
  int v20 = objc_opt_class();
  uint64_t v21 = [(CPLRecordChange *)self scopedIdentifier];
  uint64_t v22 = (void *)[v20 newRecordWithScopedIdentifier:v21];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v54 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __95__CPLRecordChange_realRecordChangeFromRecordChange_direction_newRecord_changeType_diffTracker___block_invoke;
  v40[3] = &unk_1E60A90F8;
  unint64_t v47 = a6;
  id v39 = v15;
  id v41 = v39;
  id v23 = v19;
  id v42 = v23;
  id v24 = v13;
  id v43 = v24;
  id v25 = v22;
  id v44 = v25;
  id v45 = buf;
  unint64_t v48 = a4;
  id v46 = &v49;
  BOOL v26 = (void (**)(void, void))MEMORY[0x1BA994060](v40);
  [(CPLRecordChange *)self enumerateChangeTypesForChangeType:0 block:v26];
  v26[2](v26, 256);
  if (v50[3] == 256)
  {
    *(unsigned char *)(*(void *)&buf[8] + 24) = 0;
  }
  else if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    [v23 setChangeType:0];
    *a5 = v23;
    v50[3] &= ~0x100uLL;
    objc_msgSend(v25, "setChangeType:");
    goto LABEL_8;
  }

  id v25 = 0;
LABEL_8:
  id v27 = v25;

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(buf, 8);

  return v27;
}

void __95__CPLRecordChange_realRecordChangeFromRecordChange_direction_newRecord_changeType_diffTracker___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((*(void *)(a1 + 80) & a2) != 0)
  {
    uint64_t v19 = 0;
    int v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    uint64_t v4 = *(void **)(a1 + 32);
    if (v4)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __95__CPLRecordChange_realRecordChangeFromRecordChange_direction_newRecord_changeType_diffTracker___block_invoke_2;
      v12[3] = &unk_1E60A90D0;
      long long v16 = &v19;
      id v13 = *(id *)(a1 + 40);
      id v14 = *(id *)(a1 + 48);
      id v15 = *(id *)(a1 + 56);
      uint64_t v5 = *(void *)(a1 + 88);
      uint64_t v17 = a2;
      uint64_t v18 = v5;
      [v4 withTrackerForChangeType:a2 block:v12];

      if (!*((unsigned char *)v20 + 24)) {
        goto LABEL_14;
      }
    }
    else
    {
      int v6 = [*(id *)(a1 + 40) applyChange:*(void *)(a1 + 48) copyPropertiesToFinalChange:*(void *)(a1 + 56) forChangeType:a2 direction:*(void *)(a1 + 88) diffTracker:0];
      *((unsigned char *)v20 + 24) = v6;
      if (!v6)
      {
LABEL_14:
        _Block_object_dispose(&v19, 8);
        return;
      }
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    if (*(unsigned char *)(v7 + 24))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v9 = *(void *)(v8 + 24);
      if (v9) {
        BOOL v10 = a2 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      uint64_t v11 = v9 | a2;
      if (v10) {
        uint64_t v11 = 0;
      }
      *(void *)(v8 + 24) = v11;
    }
    else
    {
      *(unsigned char *)(v7 + 24) = 1;
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = a2;
    }
    goto LABEL_14;
  }
}

uint64_t __95__CPLRecordChange_realRecordChangeFromRecordChange_direction_newRecord_changeType_diffTracker___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) applyChange:*(void *)(a1 + 40) copyPropertiesToFinalChange:*(void *)(a1 + 48) forChangeType:*(void *)(a1 + 64) direction:*(void *)(a1 + 72) diffTracker:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)applyChange:(id)a3 copyPropertiesToFinalChange:(id)a4 forChangeType:(unint64_t)a5 direction:(unint64_t)a6 diffTracker:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (a5 == 256)
  {
    id v15 = [(CPLRecordChange *)self recordModificationDate];
    long long v16 = [v12 recordModificationDate];
    uint64_t v17 = v16;
    if (!v16) {
      goto LABEL_7;
    }
    if (!v15) {
      goto LABEL_11;
    }
    [v16 timeIntervalSinceDate:v15];
    if (v18 < 0.0) {
      double v18 = -v18;
    }
    if (v18 >= 0.00100000005)
    {
LABEL_11:
      [v13 setRecordModificationDate:v17];
      [(CPLRecordChange *)self setRecordModificationDate:v17];
      [v14 noteObjectsDifferOnProperty:@"recordModificationDate"];
      char v19 = 1;
    }
    else
    {
LABEL_7:
      char v19 = 0;
    }
LABEL_20:

    goto LABEL_21;
  }
  id v15 = [(CPLRecordChange *)self propertiesForChangeType:a5];
  if (v15)
  {
    int v20 = [(id)objc_opt_class() equalityBlockForDirection:a6];
    uint64_t v17 = v20;
    if (v20)
    {
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __95__CPLRecordChange_applyChange_copyPropertiesToFinalChange_forChangeType_direction_diffTracker___block_invoke;
      v44[3] = &unk_1E60A9058;
      id v45 = v20;
      unint64_t v46 = a6;
      uint64_t v21 = (void *)MEMORY[0x1BA994060](v44);
    }
    else
    {
      uint64_t v21 = 0;
    }
    BOOL v22 = [self cplProperties:v15 areEqualToPropertiesOf:v12 diffTracker:v14 withEqualityBlock:v21];
    if (!v22)
    {
      id v23 = [(id)objc_opt_class() copyPropertyBlockForDirection:a6];
      id v24 = v23;
      if (v23)
      {
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __95__CPLRecordChange_applyChange_copyPropertiesToFinalChange_forChangeType_direction_diffTracker___block_invoke_2;
        v38[3] = &unk_1E60A9080;
        id v31 = v23;
        id v25 = v23;
        id v42 = v25;
        id v39 = v13;
        id v32 = v21;
        id v26 = v12;
        id v40 = v26;
        id v41 = self;
        unint64_t v43 = a6;
        unint64_t v33 = (void *)MEMORY[0x1BA994060](v38);
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __95__CPLRecordChange_applyChange_copyPropertiesToFinalChange_forChangeType_direction_diffTracker___block_invoke_3;
        v34[3] = &unk_1E60A90A8;
        id v27 = v25;
        id v24 = v31;
        id v36 = v27;
        v34[4] = self;
        id v28 = v26;
        uint64_t v21 = v32;
        id v35 = v28;
        unint64_t v37 = a6;
        long long v29 = (void *)MEMORY[0x1BA994060](v34);
      }
      else
      {
        unint64_t v33 = 0;
        long long v29 = 0;
      }
      objc_msgSend(v13, "cplCopyProperties:fromObject:withCopyBlock:", v15, v12, v33, v31);
      [self cplCopyProperties:v15 fromObject:v12 withCopyBlock:v29];
    }
    char v19 = !v22;

    goto LABEL_20;
  }
  char v19 = 0;
LABEL_21:

  return v19;
}

uint64_t __95__CPLRecordChange_applyChange_copyPropertiesToFinalChange_forChangeType_direction_diffTracker___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, a3, a4, a5, *(void *)(a1 + 40));
}

uint64_t __95__CPLRecordChange_applyChange_copyPropertiesToFinalChange_forChangeType_direction_diffTracker___block_invoke_2(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void, void, void, void, uint64_t, uint64_t, uint64_t, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], a4, a5, a6, a1[8]);
}

uint64_t __95__CPLRecordChange_applyChange_copyPropertiesToFinalChange_forChangeType_direction_diffTracker___block_invoke_3(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void, void, void, void, uint64_t, uint64_t, uint64_t, void))(a1[6] + 16))(a1[6], a1[4], a1[5], a1[4], a4, a5, a6, a1[7]);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (self->_changeType == 1024)
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      uint64_t v7 = [(CPLRecordChange *)self scopedIdentifier];
      uint64_t v8 = [v4 scopedIdentifier];
      uint64_t v9 = v8;
      BOOL v6 = v7 && v8 && ([(id)v7 isEqual:v8] & 1) != 0 || (v7 | v9) == 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = [self cplIsEqual:v4];
  }

  return v6;
}

- (id)redactedDescription
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@ %@", objc_opt_class(), self->_scopedIdentifier];
  unint64_t changeType = self->_changeType;
  if ((changeType & 0x400) != 0)
  {
    BOOL v6 = @" [D]";
  }
  else
  {
    uint64_t v5 = objc_msgSend((id)objc_opt_class(), "_descriptionForChangeType:isSparseFullChange:onlyUploadNewResources:", changeType, self->_isSparseFullChange, -[CPLRecordChange shouldOnlyUploadNewResources](self, "shouldOnlyUploadNewResources"));
    [v3 appendFormat:@" %@", v5];

    if (![(CPLRecordChange *)self inTrash]) {
      goto LABEL_6;
    }
    BOOL v6 = @" [trash]";
  }
  [v3 appendString:v6];
LABEL_6:
  [v3 appendString:@">"];
  return v3;
}

- (id)description
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@ %@", objc_opt_class(), self->_scopedIdentifier];
  id v4 = v3;
  if (self->_realIdentifier) {
    [v3 appendFormat:@" real: %@", self->_realIdentifier];
  }
  sharingRecordChangeData = self->_sharingRecordChangeData;
  if (self->_recordChangeData)
  {
    if (sharingRecordChangeData) {
      BOOL v6 = @" [tag/shared tag]";
    }
    else {
      BOOL v6 = @" [tag]";
    }
  }
  else
  {
    if (!sharingRecordChangeData) {
      goto LABEL_10;
    }
    BOOL v6 = @" [shared tag]";
  }
  [v4 appendString:v6];
LABEL_10:
  unint64_t changeType = self->_changeType;
  if ((changeType & 0x400) != 0)
  {
    [v4 appendString:@" [D]"];
    goto LABEL_28;
  }
  uint64_t v8 = objc_msgSend((id)objc_opt_class(), "_descriptionForChangeType:isSparseFullChange:onlyUploadNewResources:", changeType, self->_isSparseFullChange, -[CPLRecordChange shouldOnlyUploadNewResources](self, "shouldOnlyUploadNewResources"));
  [v4 appendFormat:@" %@", v8];

  uint64_t v9 = [(CPLRecordChange *)self propertiesDescription];
  uint64_t v10 = [v9 length];
  BOOL v11 = [(CPLRecordChange *)self inTrash];
  if (v10)
  {
    id v12 = "";
    if (v11) {
      id v12 = "[trash] ";
    }
    [v4 appendFormat:@" %s%@", v12, v9];
  }
  else if (v11)
  {
    [v4 appendString:@" [trash]"];
  }
  if ([(CPLRecordChange *)self supportsSharingScopedIdentifier])
  {
    id v13 = [(CPLRecordChange *)self sharingScopeIdentifier];
    id v14 = [(CPLRecordChange *)self sharingContributorUserIdentifiers];
    uint64_t v15 = [v14 count];
    if (v15)
    {
      if (v13)
      {
        objc_msgSend(v4, "appendFormat:", @" [shared %tu cont.]", v15);
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v18 = v15;
      long long v16 = @" [%tu cont.]";
    }
    else
    {
      if (!v13) {
        goto LABEL_26;
      }
      long long v16 = @" [shared]";
    }
    objc_msgSend(v4, "appendFormat:", v16, v18);
    goto LABEL_26;
  }
LABEL_27:

LABEL_28:
  [v4 appendString:@">"];
  return v4;
}

- (id)propertiesDescription
{
  return &stru_1F0D5F858;
}

- (unint64_t)originalResourceSize
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = [(CPLRecordChange *)self resources];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v7 resourceType] == 1
          || [v7 resourceType] == 17
          || [v7 resourceType] == 18
          || [v7 resourceType] == 23
          || [v7 resourceType] == 24)
        {
          uint64_t v9 = [v7 identity];
          uint64_t v8 = [v9 fileURL];

          if (v8) {
            uint64_t v8 = (void *)[v9 fileSize];
          }

          goto LABEL_18;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v8 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
LABEL_18:

  return (unint64_t)v8;
}

- (unint64_t)realUploadResourceSize
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [(CPLRecordChange *)self resources];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((unint64_t)[v8 resourceType] <= 0x1D)
        {
          uint64_t v9 = [v8 identity];
          uint64_t v10 = [v9 fileURL];

          if (v10) {
            v5 += [v9 fileSize];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)realResourceSize
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = [(CPLRecordChange *)self resources];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) identity];
        uint64_t v9 = [v8 fileURL];

        if (v9) {
          v5 += [v8 fileSize];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)effectiveResourceSizeToUploadUsingStorage:(id)a3
{
  id v4 = a3;
  if (!self->_didCacheRealResourceSizeInStorage)
  {
    uint64_t v5 = [(CPLRecordPushContext *)self->_pushContext uploadIdentifier];
    if (v5
      && (v6 = (void *)v5, BOOL v7 = [(CPLRecordChange *)self hasChangeType:8], v6, v7))
    {
      uint64_t v8 = [(CPLRecordPushContext *)self->_pushContext uploadIdentifier];
      self->_unint64_t cachedRealResourceSizeInStorage = [v4 effectiveResourceSizeToUploadForUploadIdentifier:v8];
    }
    else
    {
      self->_unint64_t cachedRealResourceSizeInStorage = 0;
    }
    self->_didCacheRealResourceSizeInStorage = 1;
  }
  unint64_t cachedRealResourceSizeInStorage = self->_cachedRealResourceSizeInStorage;

  return cachedRealResourceSizeInStorage;
}

- (unint64_t)totalResourceSize
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = [(CPLRecordChange *)self resources];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) identity];
        uint64_t v9 = [v8 fileSize];

        v5 += v9;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)resourceForType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(CPLRecordChange *)self resources];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 resourceType] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)setResources:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m"];
  [v6 handleFailureInMethod:a2, self, v7, 298, @"%@ does not supports resources", objc_opt_class() object file lineNumber description];

  abort();
}

- (id)resources
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m"];
  [v4 handleFailureInMethod:a2, self, v5, 293, @"%@ does not supports resources", objc_opt_class() object file lineNumber description];

  abort();
}

- (void)updateScopeIdentifier:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(CPLRecordChange *)self scopedIdentifier];
  if (v4)
  {
    id v5 = [CPLScopedIdentifier alloc];
    uint64_t v6 = [v4 identifier];
    uint64_t v7 = [(CPLScopedIdentifier *)v5 initWithScopeIdentifier:v8 identifier:v6];
    [(CPLRecordChange *)self setScopedIdentifier:v7];

    [(CPLRecordChange *)self awakeFromStorage];
  }
}

- (void)_setIgnoredRecord:(id)a3
{
}

- (id)_ignoredRecord
{
  return self->_ignoredRecord;
}

- (BOOL)_relatedRecordShouldBeShared
{
  return self->_relatedRecordShouldBeShared;
}

- (void)_noteRelatedRecordShouldBeShared
{
  self->_relatedRecordShouldBeShared = 1;
}

- (void)setUpdateSharingContributorUserIdentifiers:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] > 1)
  {
    uint64_t v5 = [v4 sortedArrayUsingSelector:sel_compare_];
  }
  else
  {
    uint64_t v5 = [v4 copy];
  }
  uint64_t v6 = (NSArray *)v5;

  updateSharingContributorUserIdentifiers = self->_updateSharingContributorUserIdentifiers;
  self->_updateSharingContributorUserIdentifiers = v6;
}

- (NSArray)updateSharingContributorUserIdentifiers
{
  uint64_t v3 = [(NSArray *)self->_updateSharingContributorUserIdentifiers count];
  if (v3) {
    uint64_t v3 = self->_updateSharingContributorUserIdentifiers;
  }
  return v3;
}

- (void)setSharingContributorUserIdentifiers:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] > 1)
  {
    uint64_t v5 = [v4 sortedArrayUsingSelector:sel_compare_];
  }
  else
  {
    uint64_t v5 = [v4 copy];
  }
  uint64_t v6 = (NSArray *)v5;

  sharingContributorUserIdentifiers = self->_sharingContributorUserIdentifiers;
  self->_sharingContributorUserIdentifiers = v6;
}

- (NSArray)sharingContributorUserIdentifiers
{
  uint64_t v3 = [(NSArray *)self->_sharingContributorUserIdentifiers count];
  if (v3) {
    uint64_t v3 = self->_sharingContributorUserIdentifiers;
  }
  return v3;
}

- (BOOL)isSharedInScopeWithIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(CPLRecordChange *)self hasChangeType:64])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v9 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v13 = self;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Trying to get sharing scope identifier for %@ while it does not contain the info", buf, 0xCu);
      }
    }
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m"];
    [v10 handleFailureInMethod:a2, self, v11, 229, @"Trying to get sharing scope identifier for %@ while it does not contain the info", self object file lineNumber description];

    abort();
  }
  sharingScopeIdentifier = self->_sharingScopeIdentifier;
  if (sharingScopeIdentifier) {
    BOOL v7 = [(NSString *)sharingScopeIdentifier isEqualToString:v5];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)setSharingRecordScopedIdentifier:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (v4)
  {
    id v5 = [v4 scopeIdentifier];
    sharingScopeIdentifier = self->_sharingScopeIdentifier;
    self->_sharingScopeIdentifier = v5;

    BOOL v7 = [v10 identifier];
    sharingRecordIdentifier = self->_sharingRecordIdentifier;
    self->_sharingRecordIdentifier = v7;
  }
  else
  {
    uint64_t v9 = self->_sharingScopeIdentifier;
    self->_sharingScopeIdentifier = 0;

    sharingRecordIdentifier = self->_sharingRecordIdentifier;
    self->_sharingRecordIdentifier = 0;
  }
}

- (id)sharingRecordScopedIdentifier
{
  if (self->_sharingScopeIdentifier && self->_sharingRecordIdentifier) {
    id v2 = [[CPLScopedIdentifier alloc] initWithScopeIdentifier:self->_sharingScopeIdentifier identifier:self->_sharingRecordIdentifier];
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setSharingScopeIdentifier:(id)a3
{
  id v6 = a3;
  if ([(CPLRecordChange *)self supportsSharingScopedIdentifier])
  {
    id v4 = (NSString *)[v6 copy];
    sharingScopeIdentifier = self->_sharingScopeIdentifier;
    self->_sharingScopeIdentifier = v4;
  }
}

- (BOOL)supportsSharingScopedIdentifier
{
  id v2 = objc_opt_class();
  return [v2 supportsSharingScopedIdentifier];
}

- (BOOL)supportsSharing
{
  id v2 = objc_opt_class();
  return [v2 supportsSharing];
}

- (BOOL)supportsDirectDeletion
{
  if ([(id)objc_opt_class() supportsDirectDeletion]) {
    return 1;
  }
  id v4 = [(CPLRecordChange *)self realIdentifier];
  BOOL v3 = [v4 length] != 0;

  return v3;
}

- (BOOL)supportsDeletion
{
  id v2 = objc_opt_class();
  return [v2 supportsDeletion];
}

- (BOOL)requiresStableHashForResourceType:(unint64_t)a3
{
  id v4 = objc_opt_class();
  return [v4 requiresStableHashForResourceType:a3];
}

- (BOOL)supportsResourceType:(unint64_t)a3
{
  id v4 = objc_opt_class();
  return [v4 supportsResourceType:a3];
}

- (BOOL)supportsResources
{
  id v2 = objc_opt_class();
  return [v2 supportsResources];
}

- (BOOL)isDelete
{
  return self->_changeType == 1024;
}

- (BOOL)isFullRecord
{
  return self->_changeType == 0;
}

- (BOOL)hasChangeType:(unint64_t)a3
{
  if ((a3 & 8) == 0 || (BOOL v5 = [(CPLRecordChange *)self supportsResources]))
  {
    unint64_t changeType = self->_changeType;
    if (changeType == a3)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      BOOL v8 = (a3 & ~changeType) == 0 || changeType == 0;
      LOBYTE(v5) = a3 != 1024 && v8;
    }
  }
  return v5;
}

- (BOOL)isInScopeWithIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  scopedIdentifier = self->_scopedIdentifier;
  if (!scopedIdentifier)
  {
    if (!_CPLSilentLogging)
    {
      id v10 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = self;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Missing scope identifier in %@", buf, 0xCu);
      }
    }
    long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m"];
    [v11 handleFailureInMethod:a2, self, v12, 121, @"Missing scope identifier in %@", self object file lineNumber description];

    abort();
  }
  BOOL v7 = [(CPLScopedIdentifier *)scopedIdentifier scopeIdentifier];
  char v8 = [v7 isEqualToString:v5];

  return v8;
}

- (id)realScopedIdentifier
{
  BOOL v3 = [(CPLRecordChange *)self realIdentifier];
  if (v3)
  {
    id v4 = [CPLScopedIdentifier alloc];
    id v5 = [(CPLRecordChange *)self scopedIdentifier];
    id v6 = [(CPLScopedIdentifier *)v4 initRelativeToScopedIdentifier:v5 identifier:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)setScopeIndex:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[CPLScopedIdentifier setScopeIndex:](self->_scopedIdentifier, "setScopeIndex:");
  if ([(CPLRecordChange *)self supportsResources]
    && [(CPLRecordChange *)self hasChangeType:8])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [(CPLRecordChange *)self resources];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) itemScopedIdentifier];
          [v10 setScopeIndex:a3];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)setScopedIdentifier:(id)a3
{
}

- (id)_unscopedIdentifier
{
  return [(CPLScopedIdentifier *)self->_scopedIdentifier identifier];
}

- (id)asRecordView
{
  id v2 = [[CPLSimpleRecordView alloc] initWithRecord:self];
  return v2;
}

- (BOOL)validateRecordForTracker:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v29 = 0;
  BOOL v5 = [(CPLRecordChange *)self validateChangeWithError:&v29];
  uint64_t v6 = (CPLRecordChange *)v29;
  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v18 = __CPLSessionOSLogDomain_15527();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v6;
        _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_ERROR, "Client pushed an invalid record: %@", buf, 0xCu);
      }
    }
    uint64_t v8 = [v4 pushChangeTasks];
    uint64_t v9 = [(CPLRecordChange *)self scopedIdentifier];
    [v8 addTask:0 forRecordWithScopedIdentifier:v9];
LABEL_25:
    BOOL v17 = 0;
    goto LABEL_26;
  }
  uint64_t v7 = [(CPLRecordChange *)self scopedIdentifier];
  uint64_t v8 = [v7 scopeIdentifier];

  if (([v4 checkScopeIdentifier:v8] & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      char v19 = __CPLSessionOSLogDomain_15527();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = self;
        _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_ERROR, "Client pushed a record to an invalid scope: %@", buf, 0xCu);
      }
    }
    uint64_t v9 = [v4 pushChangeTasks];
    uint64_t v15 = [(CPLRecordChange *)self scopedIdentifier];
    [v9 addTask:6 forRecordWithScopedIdentifier:v15];
LABEL_24:

    goto LABEL_25;
  }
  if (![(CPLRecordChange *)self supportsResources]
    || ![(CPLRecordChange *)self hasChangeType:8])
  {
    BOOL v17 = 1;
    goto LABEL_27;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [(CPLRecordChange *)self resources];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v24 = v6;
    uint64_t v12 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(CPLRecordChange **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v15 = [(CPLRecordChange *)v14 identity];
        uint64_t v16 = [v15 fileUTI];

        if (!v16)
        {
          uint64_t v6 = v24;
          if (!_CPLSilentLogging)
          {
            uint64_t v21 = __CPLSessionOSLogDomain_15527();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v32 = v14;
              _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_ERROR, "Client pushed a resource with no fileUTI: %@", buf, 0xCu);
            }
          }
          BOOL v22 = [v4 pushChangeTasks];
          id v23 = [(CPLRecordChange *)self scopedIdentifier];
          [v22 addTask:0 forRecordWithScopedIdentifier:v23];

          goto LABEL_24;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
      BOOL v17 = 1;
      if (v11) {
        continue;
      }
      break;
    }
    uint64_t v6 = v24;
  }
  else
  {
    BOOL v17 = 1;
  }
LABEL_26:

LABEL_27:
  return v17;
}

- (Class)relatedRecordClass
{
  id v2 = objc_opt_class();
  return (Class)[v2 relatedRecordClass];
}

+ (Class)relatedRecordClass
{
  return (Class)objc_opt_class();
}

@end