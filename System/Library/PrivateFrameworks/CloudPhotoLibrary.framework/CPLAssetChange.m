@interface CPLAssetChange
+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3;
+ (BOOL)cplShouldIgnorePropertyForEquality:(id)a3;
+ (BOOL)requiresStableHashForResourceType:(unint64_t)a3;
+ (BOOL)serverSupportsComputeState;
+ (BOOL)serverSupportsDeletedByUserIdentifier;
+ (BOOL)serverSupportsLastViewedDate;
+ (BOOL)serverSupportsSharedLibrarySharingState;
+ (BOOL)serverSupportsVision;
+ (BOOL)supportsDeletion;
+ (BOOL)supportsResourceType:(unint64_t)a3;
+ (BOOL)supportsResources;
+ (BOOL)supportsSecureCoding;
+ (BOOL)supportsSharingScopedIdentifier;
+ (Class)relatedRecordClass;
+ (id)copyPropertyBlockForDirection:(unint64_t)a3;
+ (id)equalityBlockForDirection:(unint64_t)a3;
- (BOOL)canLowerQuota;
- (BOOL)isAssetChange;
- (BOOL)isFavorite;
- (BOOL)isHidden;
- (BOOL)validateChangeWithError:(id *)a3;
- (BOOL)validateFullRecord;
- (BOOL)validateRecordForTracker:(id)a3;
- (CLLocation)location;
- (CPLAdjustments)adjustments;
- (CPLAssetChange)init;
- (CPLAssetChange)initWithCoder:(id)a3;
- (CPLFaceAnalysisReference)faces;
- (CPLPlaceAnnotation)placeAnnotation;
- (NSArray)keywords;
- (NSArray)people;
- (NSArray)resources;
- (NSData)adjustedMediaMetaData;
- (NSData)facesData;
- (NSDate)addedDate;
- (NSDate)assetDate;
- (NSDate)computeStateLastUpdatedDate;
- (NSDate)lastSharedDate;
- (NSDate)lastViewedDate;
- (NSNumber)timeZoneOffset;
- (NSString)accessibilityDescription;
- (NSString)adjustedMediaMetaDataType;
- (NSString)burstIdentifier;
- (NSString)caption;
- (NSString)computeStateAdjustmentFingerprint;
- (NSString)computeStateVersion;
- (NSString)deletedByUserIdentifier;
- (NSString)extendedDescription;
- (NSString)facesAdjustmentsFingerprint;
- (NSString)masterIdentifier;
- (NSString)mediaGroupIdentifier;
- (NSString)syndicationIdentifier;
- (NSString)timeZoneName;
- (id)allRelatedScopedIdentifiers;
- (id)checkDefaultValueBlockForPropertyWithSelector:(SEL)a3;
- (id)compactedChangeWithRelatedChanges:(id)a3 isOnlyChange:(BOOL)a4 fullRecord:(id)a5 usingStorageView:(id)a6;
- (id)fingerprintSchemeWithContext:(id)a3;
- (id)masterScopedIdentifier;
- (id)propertiesDescription;
- (id)propertiesForChangeType:(unint64_t)a3;
- (id)resourceForType:(unint64_t)a3;
- (id)scopeIdentifiersForQuarantine;
- (id)scopedIdentifiersForMapping;
- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4;
- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4;
- (int64_t)customRenderedValue;
- (int64_t)dequeueOrder;
- (int64_t)duration;
- (int64_t)facesVersion;
- (int64_t)orientation;
- (int64_t)playCount;
- (int64_t)shareCount;
- (int64_t)sharedLibrarySharingState;
- (int64_t)videoComplementDurationTimescale;
- (int64_t)videoComplementDurationValue;
- (int64_t)videoComplementImageDisplayTimescale;
- (int64_t)videoComplementImageDisplayValue;
- (int64_t)viewCount;
- (signed)viewPresentation;
- (unint64_t)assetHDRType;
- (unint64_t)assetSubtype;
- (unint64_t)burstFlags;
- (unint64_t)fullChangeTypeForFullRecord;
- (unint64_t)originalChoice;
- (unint64_t)supportedChangeTypes;
- (unint64_t)videoComplementVisibilityState;
- (unsigned)trashedReason;
- (void)copyDerivativesFromRecordIfPossible:(id)a3;
- (void)setAccessibilityDescription:(id)a3;
- (void)setAddedDate:(id)a3;
- (void)setAdjustedMediaMetaData:(id)a3;
- (void)setAdjustedMediaMetaDataType:(id)a3;
- (void)setAdjustments:(id)a3;
- (void)setAssetDate:(id)a3;
- (void)setAssetHDRType:(unint64_t)a3;
- (void)setAssetSubtype:(unint64_t)a3;
- (void)setBurstFlags:(unint64_t)a3;
- (void)setBurstIdentifier:(id)a3;
- (void)setCaption:(id)a3;
- (void)setComputeStateAdjustmentFingerprint:(id)a3;
- (void)setComputeStateLastUpdatedDate:(id)a3;
- (void)setComputeStateVersion:(id)a3;
- (void)setCustomRenderedValue:(int64_t)a3;
- (void)setDeletedByUserIdentifier:(id)a3;
- (void)setDuration:(int64_t)a3;
- (void)setExtendedDescription:(id)a3;
- (void)setFaces:(id)a3;
- (void)setFacesAdjustmentsFingerprint:(id)a3;
- (void)setFacesData:(id)a3;
- (void)setFacesVersion:(int64_t)a3;
- (void)setFavorite:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setKeywords:(id)a3;
- (void)setLastSharedDate:(id)a3;
- (void)setLastViewedDate:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMasterIdentifier:(id)a3;
- (void)setMasterScopedIdentifier:(id)a3;
- (void)setMediaGroupIdentifier:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOriginalChoice:(unint64_t)a3;
- (void)setPeople:(id)a3;
- (void)setPlaceAnnotation:(id)a3;
- (void)setPlayCount:(int64_t)a3;
- (void)setResources:(id)a3;
- (void)setShareCount:(int64_t)a3;
- (void)setSharedLibrarySharingState:(int64_t)a3;
- (void)setSyndicationIdentifier:(id)a3;
- (void)setTimeZoneName:(id)a3;
- (void)setTimeZoneOffset:(id)a3;
- (void)setTrashedReason:(unsigned __int16)a3;
- (void)setVideoComplementDurationTimescale:(int64_t)a3;
- (void)setVideoComplementDurationValue:(int64_t)a3;
- (void)setVideoComplementImageDisplayTimescale:(int64_t)a3;
- (void)setVideoComplementImageDisplayValue:(int64_t)a3;
- (void)setVideoComplementVisibilityState:(unint64_t)a3;
- (void)setViewCount:(int64_t)a3;
- (void)setViewPresentation:(signed __int16)a3;
@end

@implementation CPLAssetChange

- (CPLAssetChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPLAssetChange;
  v5 = [(CPLRecordChange *)&v10 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    v7 = [(CPLAssetChange *)v5 facesData];

    if (!v7)
    {
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faces"];
      if (v8)
      {
        if (initWithCoder__onceToken_74 != -1) {
          dispatch_once(&initWithCoder__onceToken_74, &__block_literal_global_76);
        }
        [(CPLAssetChange *)v6 setFaces:v8];
      }
    }
  }

  return v6;
}

void __45__CPLAssetChange_CPLNSCoding__initWithCoder___block_invoke()
{
  if (!_CPLSilentLogging)
  {
    v0 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1B4CAC000, v0, OS_LOG_TYPE_DEFAULT, "Storage might contain old serialized faces", v1, 2u);
    }
  }
}

+ (BOOL)cplShouldIgnorePropertyForEquality:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"faces"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLAssetChange;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForEquality_, v4);
  }

  return v5;
}

+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"faces"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLAssetChange;
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLAssetChange;
  objc_super v7 = [(CPLRecordChange *)&v13 translateToClientChangeUsingIDMapping:v6 error:a4];
  if (v7)
  {
    char v12 = 0;
    v8 = [(CPLAssetChange *)self masterScopedIdentifier];
    if (v8)
    {
      v9 = [v6 localScopedIdentifierForCloudScopedIdentifier:v8 isFinal:&v12];
      if (v9)
      {
        [v7 setMasterScopedIdentifier:v9];
      }
      else
      {
        if (a4)
        {
          *a4 = +[CPLErrors invalidClientCacheErrorWithReason:0];
        }
        if (!_CPLSilentLogging)
        {
          objc_super v10 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v15 = v8;
            __int16 v16 = 2112;
            v17 = self;
            _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Can't map cloud \"masterScopedIdentifier\" (%@) of %@", buf, 0x16u);
          }
        }
        objc_super v7 = 0;
      }
    }
  }

  return v7;
}

- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLAssetChange;
  objc_super v7 = [(CPLRecordChange *)&v13 translateToCloudChangeUsingIDMapping:v6 error:a4];
  if (v7)
  {
    char v12 = 0;
    v8 = [(CPLAssetChange *)self masterScopedIdentifier];
    if (v8)
    {
      v9 = [v6 cloudScopedIdentifierForLocalScopedIdentifier:v8 isFinal:&v12];
      if (v9)
      {
        [v7 setMasterScopedIdentifier:v9];
      }
      else
      {
        if (a4)
        {
          *a4 = +[CPLErrors invalidClientCacheErrorWithReason:0];
        }
        if (!_CPLSilentLogging)
        {
          objc_super v10 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v15 = v8;
            __int16 v16 = 2112;
            v17 = self;
            _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Can't map local \"masterScopedIdentifier\" (%@) of %@", buf, 0x16u);
          }
        }
        objc_super v7 = 0;
      }
    }
  }

  return v7;
}

- (id)scopedIdentifiersForMapping
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v8.receiver = self;
  v8.super_class = (Class)CPLAssetChange;
  id v4 = [(CPLRecordChange *)&v8 scopedIdentifiersForMapping];
  unsigned __int8 v5 = (void *)[v3 initWithArray:v4];

  id v6 = [(CPLAssetChange *)self masterScopedIdentifier];
  if (v6) {
    [v5 addObject:v6];
  }

  return v5;
}

- (id)compactedChangeWithRelatedChanges:(id)a3 isOnlyChange:(BOOL)a4 fullRecord:(id)a5 usingStorageView:(id)a6
{
  BOOL v52 = a4;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v57 = a5;
  id v56 = a6;
  if ([(CPLRecordChange *)self changeType] == 1024)
  {
    v9 = self;
    goto LABEL_53;
  }
  v54 = self;
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x2020000000;
  char v78 = 0;
  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v10 = (void *)[v55 mutableCopy];
  v11 = [(CPLRecordChange *)self scopedIdentifier];
  char v12 = [v56 recordViewsWithRelatedScopedIdentifier:v11 class:objc_opt_class()];

  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__10557;
  v73 = __Block_byref_object_dispose__10558;
  id v74 = 0;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v65 objects:v81 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v66 != v14) {
          objc_enumerationMutation(obj);
        }
        __int16 v16 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        v17 = [v16 scopedIdentifier];
        uint64_t v18 = [v10 objectForKey:v17];
        if (v18)
        {
          [v10 removeObjectForKey:v17];
          if ([v18 changeType] == 1024)
          {
            *((unsigned char *)v76 + 24) = 1;
            goto LABEL_22;
          }
          v22 = [v18 relation];
          if (v70[5])
          {
            v23 = [v18 recordModificationDate];

            if (v23)
            {
              v24 = (void *)v70[5];
              v25 = [v18 recordModificationDate];
              uint64_t v26 = [v24 laterDate:v25];
              v27 = (void *)v70[5];
              v70[5] = v26;

              goto LABEL_17;
            }
          }
          else
          {
            uint64_t v28 = [v18 recordModificationDate];
            v25 = (void *)v70[5];
            v70[5] = v28;
LABEL_17:
          }
          if (!v22)
          {
            if (!_CPLSilentLogging)
            {
              v49 = __CPLStorageOSLogDomain_10525();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v80 = v18;
                _os_log_impl(&dword_1B4CAC000, v49, OS_LOG_TYPE_ERROR, "%@ has no relation", buf, 0xCu);
              }
            }
            v50 = [MEMORY[0x1E4F28B00] currentHandler];
            v51 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLClientCacheView_Extensions.m"];
            [v50 handleFailureInMethod:a2, v54, v51, 513, @"%@ has no relation", v18 object file lineNumber description];

            abort();
          }
          v29 = [v16 relation];
          char v30 = [v22 isEqual:v29];

          if ((v30 & 1) == 0) {
            *((unsigned char *)v76 + 24) = 1;
          }
          [v59 addObject:v22];

          goto LABEL_22;
        }
        v19 = [v16 relation];
        BOOL v20 = v19 == 0;

        if (v20)
        {
          if (!_CPLSilentLogging)
          {
            v46 = __CPLStorageOSLogDomain_10525();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v80 = v16;
              _os_log_impl(&dword_1B4CAC000, v46, OS_LOG_TYPE_ERROR, "%@ in client cache has no relation", buf, 0xCu);
            }
          }
          v47 = [MEMORY[0x1E4F28B00] currentHandler];
          v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLClientCacheView_Extensions.m"];
          [v47 handleFailureInMethod:a2, v54, v48, 496, @"%@ in client cache has no relation", v16 object file lineNumber description];

          abort();
        }
        v21 = [v16 relation];
        [v59 addObject:v21];

LABEL_22:
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v65 objects:v81 count:16];
    }
    while (v13);
  }

  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __113__CPLAssetChange_CPLClientCacheView__compactedChangeWithRelatedChanges_isOnlyChange_fullRecord_usingStorageView___block_invoke;
  v60[3] = &unk_1E60A83F0;
  v62 = &v75;
  v63 = &v69;
  SEL v64 = a2;
  v60[4] = v54;
  id v31 = v59;
  id v61 = v31;
  [v10 enumerateKeysAndObjectsUsingBlock:v60];
  if (v57)
  {
    [v57 setContainerRelations:v31];
    if (v70[5])
    {
      v32 = [v57 recordModificationDate];
      v33 = v32;
      uint64_t v34 = v70[5];
      if (v32)
      {
        v35 = [v32 laterDate:v34];
        [v57 setRecordModificationDate:v35];
      }
      else
      {
        [v57 setRecordModificationDate:v34];
      }
    }
  }
  if (v52)
  {
    if (*((unsigned char *)v76 + 24))
    {
      v36 = objc_opt_class();
      v37 = [(CPLRecordChange *)v54 scopedIdentifier];
      v38 = (CPLAssetChange *)[v36 newChangeWithScopedIdentifier:v37 changeType:16];

      if ([v31 count]) {
        [(CPLItemChange *)v38 setContainerRelations:v31];
      }
      goto LABEL_44;
    }
    v38 = 0;
  }
  else
  {
    if ([(CPLRecordChange *)v54 isFullRecord])
    {
      if ([v31 count]) {
        [(CPLItemChange *)v54 setContainerRelations:v31];
      }
    }
    else if (*((unsigned char *)v76 + 24))
    {
      v38 = (CPLAssetChange *)[(CPLAssetChange *)v54 copy];
      if ([v31 count]) {
        [(CPLItemChange *)v38 setContainerRelations:v31];
      }
      uint64_t v39 = [(CPLRecordChange *)v38 changeType];
      if (v39) {
        uint64_t v40 = v39 | 0x10;
      }
      else {
        uint64_t v40 = 0;
      }
      [(CPLRecordChange *)v38 setChangeType:v40];
LABEL_44:
      if (!v38) {
        goto LABEL_52;
      }
LABEL_47:
      if (v70[5])
      {
        v41 = [(CPLRecordChange *)v38 recordModificationDate];

        if (v41)
        {
          v42 = [(CPLRecordChange *)v38 recordModificationDate];
          v43 = [v42 laterDate:v70[5]];
          [(CPLRecordChange *)v38 setRecordModificationDate:v43];
        }
        else
        {
          [(CPLRecordChange *)v38 setRecordModificationDate:v70[5]];
        }
      }
      goto LABEL_52;
    }
    v38 = v54;
    if (v38) {
      goto LABEL_47;
    }
  }
LABEL_52:
  v44 = v61;
  v9 = v38;

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);
LABEL_53:

  return v9;
}

void __113__CPLAssetChange_CPLClientCacheView__compactedChangeWithRelatedChanges_isOnlyChange_fullRecord_usingStorageView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  if ([v6 changeType] == 1024)
  {
    if (!_CPLSilentLogging)
    {
      objc_super v7 = __CPLStorageOSLogDomain_10525();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v5;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Trying to delete an inexisting relation: %@", buf, 0xCu);
      }
    }
    goto LABEL_14;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  objc_super v8 = [v6 relation];
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  objc_super v10 = [v6 recordModificationDate];
  v11 = v10;
  if (!v9)
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v13 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v10;
    goto LABEL_11;
  }

  if (v11)
  {
    char v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v13 = [v6 recordModificationDate];
    uint64_t v14 = [v12 laterDate:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    __int16 v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

LABEL_11:
  }
  if (!v8)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v18 = __CPLStorageOSLogDomain_10525();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = 0;
        _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_ERROR, "%@ in client cache has no relation", buf, 0xCu);
      }
    }
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v20 = *(void *)(a1 + 64);
    uint64_t v21 = *(void *)(a1 + 32);
    v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLClientCacheView_Extensions.m"];
    [v19 handleFailureInMethod:v20, v21, v22, 539, @"%@ in client cache has no relation", 0 object file lineNumber description];

    abort();
  }
  [*(id *)(a1 + 40) addObject:v8];

LABEL_14:
}

- (BOOL)validateRecordForTracker:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CPLAssetChange;
  if (![(CPLRecordChange *)&v33 validateRecordForTracker:v4]) {
    goto LABEL_39;
  }
  if ([(CPLRecordChange *)self isFullRecord])
  {
    id v5 = [(CPLAssetChange *)self masterScopedIdentifier];
    if (v5)
    {
      if ([v4 knowsClientRecordWithScopedIdentifier:v5])
      {

        goto LABEL_6;
      }
      if (!_CPLSilentLogging)
      {
        uint64_t v25 = __CPLSessionOSLogDomain_15527();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = self;
          _os_log_impl(&dword_1B4CAC000, v25, OS_LOG_TYPE_DEFAULT, "Client pushed an asset but we need the master too: %@", buf, 0xCu);
        }
      }
      uint64_t v21 = [v4 pushChangeTasks];
      v22 = [(CPLRecordChange *)self scopedIdentifier];
      v23 = v21;
      uint64_t v24 = 4;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        v19 = __CPLSessionOSLogDomain_15527();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v35 = self;
          uint64_t v20 = "Client pushed an asset with no master identifier: %@";
LABEL_30:
          _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);
        }
LABEL_31:
      }
LABEL_32:
      uint64_t v21 = [v4 pushChangeTasks];
      v22 = [(CPLRecordChange *)self scopedIdentifier];
      v23 = v21;
      uint64_t v24 = 0;
    }
    [v23 addTask:v24 forRecordWithScopedIdentifier:v22];

LABEL_39:
    BOOL v26 = 0;
    goto LABEL_42;
  }
LABEL_6:
  if ([(CPLRecordChange *)self hasChangeType:16])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v5 = [(CPLItemChange *)self containerRelations];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v30;
      char v10 = 1;
      *(void *)&long long v7 = 138412546;
      long long v28 = v7;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "containerIdentifier", v28);
          if (!v12
            || (uint64_t v13 = (void *)v12,
                uint64_t v14 = [CPLScopedIdentifier alloc],
                [(CPLRecordChange *)self scopedIdentifier],
                uint64_t v15 = objc_claimAutoreleasedReturnValue(),
                __int16 v16 = [(CPLScopedIdentifier *)v14 initRelativeToScopedIdentifier:v15 identifier:v13], v15, v13, !v16))
          {
            if (_CPLSilentLogging) {
              goto LABEL_32;
            }
            v19 = __CPLSessionOSLogDomain_15527();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v35 = self;
              uint64_t v20 = "Client pushed a relation with no album in an asset: %@";
              goto LABEL_30;
            }
            goto LABEL_31;
          }
          if (([v4 knowsClientRecordWithScopedIdentifier:v16] & 1) == 0)
          {
            if (!_CPLSilentLogging)
            {
              uint64_t v17 = __CPLSessionOSLogDomain_15527();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v28;
                v35 = v16;
                __int16 v36 = 2112;
                v37 = self;
                _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEFAULT, "Client pushed an asset belonging in an unknown album %@: %@", buf, 0x16u);
              }
            }
            uint64_t v18 = [v4 pushChangeTasks];
            [v18 addTask:5 forRecordWithScopedIdentifier:v16];

            char v10 = 0;
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v29 objects:v38 count:16];
        if (v8) {
          continue;
        }
        break;
      }

      if ((v10 & 1) == 0) {
        goto LABEL_39;
      }
    }
    else
    {
    }
  }
  BOOL v26 = 1;
LABEL_42:

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facesData, 0);
  objc_storeStrong((id *)&self->_computeStateLastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_computeStateAdjustmentFingerprint, 0);
  objc_storeStrong((id *)&self->_computeStateVersion, 0);
  objc_storeStrong((id *)&self->_deletedByUserIdentifier, 0);
  objc_storeStrong((id *)&self->_syndicationIdentifier, 0);
  objc_storeStrong((id *)&self->_lastViewedDate, 0);
  objc_storeStrong((id *)&self->_placeAnnotation, 0);
  objc_storeStrong((id *)&self->_facesAdjustmentsFingerprint, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_adjustments, 0);
  objc_storeStrong((id *)&self->_mediaGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_burstIdentifier, 0);
  objc_storeStrong((id *)&self->_timeZoneOffset, 0);
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_adjustedMediaMetaData, 0);
  objc_storeStrong((id *)&self->_adjustedMediaMetaDataType, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_extendedDescription, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_assetDate, 0);
  objc_storeStrong((id *)&self->_addedDate, 0);
  objc_storeStrong((id *)&self->_lastSharedDate, 0);
  objc_storeStrong((id *)&self->_masterIdentifier, 0);
  objc_storeStrong((id *)&self->_fingerprintScheme, 0);
  objc_storeStrong((id *)&self->_resourcePerResourceType, 0);
}

- (NSData)facesData
{
  return self->_facesData;
}

- (void)setComputeStateLastUpdatedDate:(id)a3
{
}

- (NSDate)computeStateLastUpdatedDate
{
  return self->_computeStateLastUpdatedDate;
}

- (void)setComputeStateAdjustmentFingerprint:(id)a3
{
}

- (NSString)computeStateAdjustmentFingerprint
{
  return self->_computeStateAdjustmentFingerprint;
}

- (void)setComputeStateVersion:(id)a3
{
}

- (NSString)computeStateVersion
{
  return self->_computeStateVersion;
}

- (void)setTrashedReason:(unsigned __int16)a3
{
  self->_trashedReason = a3;
}

- (unsigned)trashedReason
{
  return self->_trashedReason;
}

- (void)setDeletedByUserIdentifier:(id)a3
{
}

- (NSString)deletedByUserIdentifier
{
  return self->_deletedByUserIdentifier;
}

- (void)setSharedLibrarySharingState:(int64_t)a3
{
  self->_sharedLibrarySharingState = a3;
}

- (int64_t)sharedLibrarySharingState
{
  return self->_sharedLibrarySharingState;
}

- (void)setSyndicationIdentifier:(id)a3
{
}

- (NSString)syndicationIdentifier
{
  return self->_syndicationIdentifier;
}

- (void)setViewPresentation:(signed __int16)a3
{
  self->_viewPresentation = a3;
}

- (signed)viewPresentation
{
  return self->_viewPresentation;
}

- (void)setLastViewedDate:(id)a3
{
}

- (NSDate)lastViewedDate
{
  return self->_lastViewedDate;
}

- (void)setViewCount:(int64_t)a3
{
  self->_viewCount = a3;
}

- (int64_t)viewCount
{
  return self->_viewCount;
}

- (void)setShareCount:(int64_t)a3
{
  self->_shareCount = a3;
}

- (int64_t)shareCount
{
  return self->_shareCount;
}

- (void)setPlayCount:(int64_t)a3
{
  self->_playCount = a3;
}

- (int64_t)playCount
{
  return self->_playCount;
}

- (void)setPlaceAnnotation:(id)a3
{
}

- (CPLPlaceAnnotation)placeAnnotation
{
  return self->_placeAnnotation;
}

- (void)setFacesAdjustmentsFingerprint:(id)a3
{
}

- (NSString)facesAdjustmentsFingerprint
{
  return self->_facesAdjustmentsFingerprint;
}

- (void)setFacesVersion:(int64_t)a3
{
  self->_facesVersion = a3;
}

- (int64_t)facesVersion
{
  return self->_facesVersion;
}

- (NSArray)people
{
  return self->_people;
}

- (void)setCustomRenderedValue:(int64_t)a3
{
  self->_customRenderedValue = a3;
}

- (int64_t)customRenderedValue
{
  return self->_customRenderedValue;
}

- (void)setOriginalChoice:(unint64_t)a3
{
  self->_originalChoice = a3;
}

- (unint64_t)originalChoice
{
  return self->_originalChoice;
}

- (void)setAdjustments:(id)a3
{
}

- (CPLAdjustments)adjustments
{
  return self->_adjustments;
}

- (void)setAssetHDRType:(unint64_t)a3
{
  self->_assetHDRType = a3;
}

- (unint64_t)assetHDRType
{
  return self->_assetHDRType;
}

- (void)setAssetSubtype:(unint64_t)a3
{
  self->_assetSubtype = a3;
}

- (unint64_t)assetSubtype
{
  return self->_assetSubtype;
}

- (void)setVideoComplementVisibilityState:(unint64_t)a3
{
  self->_videoComplementVisibilityState = a3;
}

- (unint64_t)videoComplementVisibilityState
{
  return self->_videoComplementVisibilityState;
}

- (void)setVideoComplementImageDisplayTimescale:(int64_t)a3
{
  self->_videoComplementImageDisplayTimescale = a3;
}

- (int64_t)videoComplementImageDisplayTimescale
{
  return self->_videoComplementImageDisplayTimescale;
}

- (void)setVideoComplementImageDisplayValue:(int64_t)a3
{
  self->_videoComplementImageDisplayValue = a3;
}

- (int64_t)videoComplementImageDisplayValue
{
  return self->_videoComplementImageDisplayValue;
}

- (void)setVideoComplementDurationTimescale:(int64_t)a3
{
  self->_videoComplementDurationTimescale = a3;
}

- (int64_t)videoComplementDurationTimescale
{
  return self->_videoComplementDurationTimescale;
}

- (void)setVideoComplementDurationValue:(int64_t)a3
{
  self->_videoComplementDurationValue = a3;
}

- (int64_t)videoComplementDurationValue
{
  return self->_videoComplementDurationValue;
}

- (void)setMediaGroupIdentifier:(id)a3
{
}

- (NSString)mediaGroupIdentifier
{
  return self->_mediaGroupIdentifier;
}

- (void)setBurstIdentifier:(id)a3
{
}

- (NSString)burstIdentifier
{
  return self->_burstIdentifier;
}

- (void)setBurstFlags:(unint64_t)a3
{
  self->_burstFlags = a3;
}

- (unint64_t)burstFlags
{
  return self->_burstFlags;
}

- (void)setTimeZoneOffset:(id)a3
{
}

- (NSNumber)timeZoneOffset
{
  return self->_timeZoneOffset;
}

- (void)setTimeZoneName:(id)a3
{
}

- (NSString)timeZoneName
{
  return self->_timeZoneName;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setAdjustedMediaMetaData:(id)a3
{
}

- (NSData)adjustedMediaMetaData
{
  return self->_adjustedMediaMetaData;
}

- (void)setAdjustedMediaMetaDataType:(id)a3
{
}

- (NSString)adjustedMediaMetaDataType
{
  return self->_adjustedMediaMetaDataType;
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (void)setLocation:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setDuration:(int64_t)a3
{
  self->_duration = a3;
}

- (int64_t)duration
{
  return self->_duration;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (void)setAccessibilityDescription:(id)a3
{
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setExtendedDescription:(id)a3
{
}

- (NSString)extendedDescription
{
  return self->_extendedDescription;
}

- (void)setCaption:(id)a3
{
}

- (NSString)caption
{
  return self->_caption;
}

- (NSArray)resources
{
  return self->_resources;
}

- (void)setAssetDate:(id)a3
{
}

- (NSDate)assetDate
{
  return self->_assetDate;
}

- (void)setAddedDate:(id)a3
{
}

- (NSDate)addedDate
{
  return self->_addedDate;
}

- (void)setLastSharedDate:(id)a3
{
}

- (NSDate)lastSharedDate
{
  return self->_lastSharedDate;
}

- (void)setMasterIdentifier:(id)a3
{
}

- (NSString)masterIdentifier
{
  return self->_masterIdentifier;
}

- (BOOL)isAssetChange
{
  return 1;
}

- (id)scopeIdentifiersForQuarantine
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(CPLRecordChange *)self scopedIdentifier];
  if ([(CPLRecordChange *)self isFullRecord])
  {
    v8[0] = v3;
    id v4 = [(CPLAssetChange *)self masterScopedIdentifier];
    v8[1] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  }
  else
  {
    long long v7 = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  }

  return v5;
}

- (unint64_t)supportedChangeTypes
{
  v3.receiver = self;
  v3.super_class = (Class)CPLAssetChange;
  return [(CPLRecordChange *)&v3 supportedChangeTypes] | 0x10;
}

- (unint64_t)fullChangeTypeForFullRecord
{
  v3.receiver = self;
  v3.super_class = (Class)CPLAssetChange;
  return [(CPLRecordChange *)&v3 fullChangeTypeForFullRecord] | 0x20;
}

- (BOOL)canLowerQuota
{
  if ([(CPLRecordChange *)self isDelete])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(CPLRecordChange *)self hasChangeType:2];
    if (v3)
    {
      LOBYTE(v3) = [(CPLRecordChange *)self inTrash];
    }
  }
  return v3;
}

- (void)setFacesData:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    id v4 = (NSData *)[v6 copy];
    facesData = self->_facesData;
    self->_facesData = v4;
  }
  else
  {
    facesData = self->_facesData;
    self->_facesData = 0;
  }
}

- (CPLFaceAnalysisReference)faces
{
  if (self->_facesData) {
    v2 = [[CPLFaceAnalysisReference alloc] initWithData:self->_facesData];
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFaces:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    uint64_t v5 = [v4 data];
    p_facesData = (id *)&self->_facesData;
    id v7 = *p_facesData;
    id *p_facesData = (id)v5;

    if ([*p_facesData length]) {
      goto LABEL_6;
    }
  }
  else
  {
    p_facesData = (id *)&self->_facesData;
  }
  id v8 = *p_facesData;
  id *p_facesData = 0;

LABEL_6:
}

- (BOOL)validateChangeWithError:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CPLAssetChange;
  BOOL v5 = -[CPLRecordChange validateChangeWithError:](&v9, sel_validateChangeWithError_);
  if (v5)
  {
    if ([(CPLRecordChange *)self hasChangeType:2])
    {
      masterIdentifier = self->_masterIdentifier;
      LOBYTE(v5) = masterIdentifier != 0;
      if (a3 && !masterIdentifier)
      {
        id v7 = +[CPLErrors cplErrorWithCode:18, @"%@ has no master identifier", self description];
        LOBYTE(v5) = 0;
        *a3 = v7;
      }
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)validateFullRecord
{
  v5.receiver = self;
  v5.super_class = (Class)CPLAssetChange;
  BOOL v3 = [(CPLRecordChange *)&v5 validateFullRecord];
  if (v3) {
    LOBYTE(v3) = self->_masterIdentifier != 0;
  }
  return v3;
}

- (id)checkDefaultValueBlockForPropertyWithSelector:(SEL)a3
{
  if (sel_assetHDRType == a3)
  {
    id v7 = &__block_literal_global_104;
    goto LABEL_34;
  }
  if (sel_originalChoice == a3)
  {
    id v7 = &__block_literal_global_108;
    goto LABEL_34;
  }
  if (sel_assetDate == a3 || sel_facesData == a3 || sel_timeZoneOffset == a3 || sel_mediaGroupIdentifier == a3)
  {
    uint64_t v6 = _CPLDefaultValueObjectNil;
LABEL_33:
    id v7 = (void *)MEMORY[0x1BA994060](v6, a2);
    goto LABEL_34;
  }
  if (sel_people == a3
    || sel_videoComplementDurationValue == a3
    || sel_videoComplementDurationTimescale == a3
    || sel_videoComplementImageDisplayValue == a3
    || sel_videoComplementImageDisplayTimescale == a3
    || sel_videoComplementVisibilityState == a3
    || sel_playCount == a3
    || sel_shareCount == a3
    || sel_viewCount == a3
    || sel_customRenderedValue == a3
    || sel_viewPresentation == a3)
  {
    uint64_t v6 = _CPLDefaultValueNSINTEGER0;
    goto LABEL_33;
  }
  if (sel_assetSubtype == a3)
  {
    id v7 = &__block_literal_global_140;
  }
  else if (sel_keywords == a3)
  {
    id v7 = &__block_literal_global_144;
  }
  else if (sel_trashedReason == a3)
  {
    id v7 = &__block_literal_global_148;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CPLAssetChange;
    id v7 = -[CPLRecordChange checkDefaultValueBlockForPropertyWithSelector:](&v9, sel_checkDefaultValueBlockForPropertyWithSelector_);
  }
LABEL_34:
  return v7;
}

BOOL __64__CPLAssetChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 trashedReason] == 0;
}

BOOL __64__CPLAssetChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 keywords];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

BOOL __64__CPLAssetChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 assetSubtype] == 0;
}

BOOL __64__CPLAssetChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 originalChoice] == 0;
}

BOOL __64__CPLAssetChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assetHDRType] == 0;
}

- (id)allRelatedScopedIdentifiers
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)CPLAssetChange;
  BOOL v3 = [(CPLRecordChange *)&v36 allRelatedScopedIdentifiers];
  id v4 = [(CPLAssetChange *)self faces];
  objc_super v5 = [v4 faces];
  if ([v5 count] || -[NSArray count](self->_people, "count"))
  {
    v27 = v3;
    BOOL v3 = (void *)[v3 mutableCopy];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    BOOL v26 = v5;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v32 + 1) + 8 * i) personIdentifier];
          if (v11)
          {
            uint64_t v12 = (void *)v11;
            uint64_t v13 = [CPLScopedIdentifier alloc];
            uint64_t v14 = [(CPLRecordChange *)self scopedIdentifier];
            id v15 = [(CPLScopedIdentifier *)v13 initRelativeToScopedIdentifier:v14 identifier:v12];

            if (v15)
            {
              [v3 addObject:v15];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v8);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    __int16 v16 = self->_people;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = [*(id *)(*((void *)&v28 + 1) + 8 * j) personIdentifier];
          if (v21)
          {
            v22 = [CPLScopedIdentifier alloc];
            v23 = [(CPLRecordChange *)self scopedIdentifier];
            id v24 = [(CPLScopedIdentifier *)v22 initRelativeToScopedIdentifier:v23 identifier:v21];

            [v3 addObject:v24];
          }
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v18);
    }

    if (v27) {
      [v3 unionSet:v27];
    }

    objc_super v5 = v26;
  }

  return v3;
}

- (int64_t)dequeueOrder
{
  BOOL v3 = [(CPLAssetChange *)self assetDate];
  if (v3) {
    [(CPLAssetChange *)self assetDate];
  }
  else {
  id v4 = [(CPLAssetChange *)self addedDate];
  }

  if (v4)
  {
    [v4 timeIntervalSinceReferenceDate];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CPLAssetChange;
    double v5 = (double)[(CPLRecordChange *)&v8 dequeueOrder];
  }
  int64_t v6 = (uint64_t)v5;

  return v6;
}

- (void)setPeople:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    id v4 = [v6 sortedArrayUsingComparator:&__block_literal_global_92];
    people = self->_people;
    self->_people = v4;
  }
  else
  {
    people = self->_people;
    self->_people = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

uint64_t __28__CPLAssetChange_setPeople___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 personIdentifier];
  uint64_t v7 = [v5 personIdentifier];
  objc_super v8 = (void *)v7;
  if (v6 && v7)
  {
    uint64_t v9 = [v6 compare:v7];
  }
  else if (v6)
  {
    if (v7)
    {
      uint64_t v9 = 0;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v11 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v13 = 138412290;
          id v14 = v5;
          _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "Found empty person identifier for %@", (uint8_t *)&v13, 0xCu);
        }
      }
      uint64_t v9 = 1;
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      char v10 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        id v14 = v4;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Found empty person identifier for %@", (uint8_t *)&v13, 0xCu);
      }
    }
    uint64_t v9 = -1;
  }

  return v9;
}

- (void)setKeywords:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5];
    uint64_t v7 = [v6 count];
    if (v7 != [v5 count] && _CPLSilentLogging == 0)
    {
      uint64_t v9 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        char v10 = objc_opt_class();
        id v11 = v10;
        uint64_t v12 = [(CPLRecordChange *)self scopedIdentifier];
        int v13 = NSStringFromSelector(a2);
        int v17 = 138412802;
        uint64_t v18 = v10;
        __int16 v19 = 2112;
        uint64_t v20 = v12;
        __int16 v21 = 2112;
        v22 = v13;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "<%@ %@> %@ got duplicate keywords", (uint8_t *)&v17, 0x20u);
      }
    }
    id v14 = +[CPLAssetKeywordSortDescriptor sortedKeywordsForKeywordSet:v6];
    keywords = self->_keywords;
    self->_keywords = v14;
  }
  else
  {
    __int16 v16 = self->_keywords;
    self->_keywords = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (void)copyDerivativesFromRecordIfPossible:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isAssetChange])
  {
    id v5 = [(CPLAssetChange *)self adjustments];
    if (!v5)
    {
LABEL_29:

      goto LABEL_30;
    }
    id v6 = [v4 adjustments];
    if (v6)
    {
      uint64_t v7 = [v5 otherAdjustmentsFingerprint];
      objc_super v8 = [v6 otherAdjustmentsFingerprint];
      unint64_t v9 = (unint64_t)v8;
      if (v7 && v8)
      {
        char v10 = [(id)v7 isEqual:v8];

        if ((v10 & 1) == 0) {
          goto LABEL_28;
        }
LABEL_9:
        id v11 = [(NSDictionary *)self->_resourcePerResourceType objectForKeyedSubscript:&unk_1F0D91490];
        uint64_t v12 = [v11 identity];
        uint64_t v13 = [v12 fingerPrint];

        id v14 = [v4 resourceForType:13];
        uint64_t v15 = [v14 identity];
        uint64_t v16 = [v15 fingerPrint];

        if (v13 && v16)
        {
          if (([(id)v13 isEqual:v16] & 1) == 0) {
            goto LABEL_27;
          }
        }
        else if (v13 | v16)
        {
LABEL_27:

          goto LABEL_28;
        }
        id v17 = (id)[(NSDictionary *)self->_resourcePerResourceType mutableCopy];
        if (!v17) {
          id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        unint64_t v18 = [v17 count];
        [(CPLRecordChange *)self copyDerivatives:&copyDerivativesFromRecordIfPossible__originalDerivativesImageAndVideo_18200 count:9 avoidResourceType:0 fromRecord:v4 inResourcePerType:v17];
        if (v18 >= [v17 count])
        {
          if (_CPLSilentLogging)
          {
LABEL_26:

            goto LABEL_27;
          }
          uint64_t v23 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            long long v29 = objc_opt_class();
            id v33 = v29;
            id v24 = [v4 scopedIdentifier];
            uint64_t v25 = objc_opt_class();
            id v31 = v25;
            BOOL v26 = [(CPLRecordChange *)self scopedIdentifier];
            *(_DWORD *)buf = 138413058;
            unint64_t v35 = (unint64_t)v29;
            __int16 v36 = 2112;
            v37 = v24;
            __int16 v38 = 2112;
            uint64_t v39 = v25;
            __int16 v40 = 2112;
            v41 = v26;
            _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_DEFAULT, "Found no derivatives to copy from <%@ %@> to <%@ %@>", buf, 0x2Au);
          }
        }
        else
        {
          if (!_CPLSilentLogging)
          {
            __int16 v19 = __CPLGenericOSLogDomain();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v28 = [v17 count] - v18;
              v27 = objc_opt_class();
              id v32 = v27;
              uint64_t v20 = [v4 scopedIdentifier];
              __int16 v21 = objc_opt_class();
              id v30 = v21;
              [(CPLRecordChange *)self scopedIdentifier];
              *(_DWORD *)buf = 134219010;
              unint64_t v35 = v28;
              __int16 v36 = 2112;
              v37 = v27;
              __int16 v38 = 2112;
              uint64_t v39 = v20;
              __int16 v40 = 2112;
              v41 = v21;
              v43 = __int16 v42 = 2112;
              v22 = (void *)v43;
              _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_DEFAULT, "Automatically copied %lu derivatives from <%@ %@> to <%@ %@>", buf, 0x34u);
            }
          }
          uint64_t v23 = objc_msgSend(v17, "allValues", v27);
          [(CPLAssetChange *)self setResources:v23];
        }

        goto LABEL_26;
      }

      if (!(v7 | v9)) {
        goto LABEL_9;
      }
    }
LABEL_28:

    goto LABEL_29;
  }
LABEL_30:
}

- (id)resourceForType:(unint64_t)a3
{
  resourcePerResourceType = self->_resourcePerResourceType;
  if (resourcePerResourceType)
  {
    id v4 = [NSNumber numberWithUnsignedInteger:a3];
    id v5 = [(NSDictionary *)resourcePerResourceType objectForKeyedSubscript:v4];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CPLAssetChange;
    id v5 = [(CPLRecordChange *)&v7 resourceForType:a3];
  }
  return v5;
}

- (void)setResources:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v20 = 0;
  id v5 = a3;
  id v6 = +[CPLResource normalizedResourcesFromResources:v5 resourcePerResourceType:&v20];
  objc_super v7 = (NSDictionary *)v20;
  uint64_t v8 = [(NSArray *)v6 count];
  uint64_t v9 = [v5 count];

  if (v8 != v9 && _CPLSilentLogging == 0)
  {
    id v11 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = v12;
      id v14 = [(CPLRecordChange *)self scopedIdentifier];
      uint64_t v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v22 = v12;
      __int16 v23 = 2112;
      id v24 = v14;
      __int16 v25 = 2114;
      BOOL v26 = v15;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "<%@ %@> %{public}@ got duplicate or incorrect resource types", buf, 0x20u);
    }
  }
  resources = self->_resources;
  self->_resources = v6;
  id v17 = v6;

  resourcePerResourceType = self->_resourcePerResourceType;
  self->_resourcePerResourceType = v7;
  __int16 v19 = v7;
}

- (void)setMasterScopedIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  uint64_t v5 = [v21 scopeIdentifier];
  id v6 = [(CPLRecordChange *)self scopedIdentifier];
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
        uint64_t v9 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          char v10 = NSStringFromSelector(a2);
          id v11 = [(CPLRecordChange *)self scopedIdentifier];
          uint64_t v12 = [v11 scopeIdentifier];
          id v13 = [v21 scopeIdentifier];
          *(_DWORD *)buf = 138412802;
          __int16 v23 = v10;
          __int16 v24 = 2112;
          __int16 v25 = v12;
          __int16 v26 = 2112;
          uint64_t v27 = v13;
          _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Invalid call to %@ with mismatched scope: %@ vs. %@", buf, 0x20u);
        }
      }
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLAssetChange.m"];
      uint64_t v16 = NSStringFromSelector(a2);
      id v17 = [(CPLRecordChange *)self scopedIdentifier];
      unint64_t v18 = [v17 scopeIdentifier];
      __int16 v19 = [v21 scopeIdentifier];
      [v14 handleFailureInMethod:a2, self, v15, 227, @"Invalid call to %@ with mismatched scope: %@ vs. %@", v16, v18, v19 object file lineNumber description];

      abort();
    }
  }
  id v20 = [v21 identifier];
  [(CPLAssetChange *)self setMasterIdentifier:v20];
}

- (id)masterScopedIdentifier
{
  BOOL v3 = [(CPLAssetChange *)self masterIdentifier];
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

- (id)propertiesForChangeType:(unint64_t)a3
{
  if (propertiesForChangeType__onceToken_18215 != -1) {
    dispatch_once(&propertiesForChangeType__onceToken_18215, &__block_literal_global_42_18216);
  }
  if (a3 == 32)
  {
    uint64_t v5 = (void *)propertiesForChangeType__facesProperties;
    goto LABEL_7;
  }
  if (a3 == 8)
  {
    uint64_t v5 = (void *)propertiesForChangeType__resourceProperties;
LABEL_7:
    id v6 = v5;
    goto LABEL_9;
  }
  v8.receiver = self;
  v8.super_class = (Class)CPLAssetChange;
  id v6 = [(CPLItemChange *)&v8 propertiesForChangeType:a3];
LABEL_9:
  return v6;
}

uint64_t __42__CPLAssetChange_propertiesForChangeType___block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"adjustments", @"adjustedMediaMetaData", @"adjustedMediaMetaDataType", @"resources", @"resourceCopyFromScopedIdentifier", @"orientation", @"duration", @"originalChoice", 0);
  v1 = (void *)propertiesForChangeType__resourceProperties;
  propertiesForChangeType__resourceProperties = v0;

  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"facesData", @"facesVersion", @"facesAdjustmentsFingerprint", 0);
  uint64_t v3 = propertiesForChangeType__facesProperties;
  propertiesForChangeType__facesProperties = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

- (id)propertiesDescription
{
  uint64_t v2 = self;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(CPLRecordChange *)self changeType];
  id v4 = [(CPLItemChange *)v2 containerDescription];
  uint64_t v5 = [(CPLRecordChange *)v2 resourcesDescription];
  id v6 = (void *)v5;
  if (!v3 || (v3 & 8) != 0)
  {
    uint64_t v9 = " / ";
    objc_super v8 = [(CPLAssetChange *)v2 adjustments];
    id v10 = [NSString alloc];
    id v11 = "";
    if (![v4 length]) {
      uint64_t v9 = "";
    }
    if ([v6 length]) {
      id v11 = " ";
    }
    if (v8)
    {
      uint64_t v12 = [v8 adjustmentSimpleDescription];
      uint64_t v7 = (__CFString *)[v10 initWithFormat:@"%s%@%s%@", v9, v6, v11, v12];

      id v6 = (void *)v12;
    }
    else
    {
      uint64_t v7 = (__CFString *)[v10 initWithFormat:@"%s%@%s%@", v9, v6, v11, @"no adj."];
    }
  }
  else
  {
    uint64_t v7 = &stru_1F0D5F858;
    objc_super v8 = (void *)v5;
  }

  if (!v3 || (v3 & 0x20) != 0)
  {
    id v14 = " / ";
    if (![v4 length] && !-[__CFString length](v7, "length")) {
      id v14 = "";
    }
    uint64_t v15 = [(CPLAssetChange *)v2 faces];
    uint64_t v16 = [v15 faces];
    if ([v16 count] | v3)
    {
      id v33 = v16;
      long long v34 = v14;
      unint64_t v36 = v3;
      v37 = v7;
      __int16 v38 = v2;
      uint64_t v39 = v4;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      unint64_t v35 = v15;
      id obj = [v15 faces];
      uint64_t v17 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = 0;
        uint64_t v20 = 0;
        uint64_t v21 = 0;
        uint64_t v22 = 0;
        uint64_t v23 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v42 != v23) {
              objc_enumerationMutation(obj);
            }
            __int16 v25 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            unsigned int v26 = [v25 isKeyFace];
            if ([v25 isManual])
            {
              ++v20;
            }
            else
            {
              uint64_t v27 = [v25 personIdentifier];

              if (v27) {
                ++v22;
              }
            }
            v19 += v26;
            uint64_t v28 = [v25 rejectedPersonIdentifiers];
            v21 += [v28 count];
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v18);
      }
      else
      {
        uint64_t v19 = 0;
        uint64_t v20 = 0;
        uint64_t v21 = 0;
        uint64_t v22 = 0;
      }

      id v13 = (__CFString *)[[NSString alloc] initWithFormat:@"%sfaces: %lu conf., %lu rej., %lu man., %lu key", v34, v22, v21, v20, v19];
      uint64_t v2 = v38;
      id v4 = v39;
      unint64_t v3 = v36;
      uint64_t v7 = v37;
      uint64_t v15 = v35;
      uint64_t v16 = v33;
    }
    else
    {
      id v13 = &stru_1F0D5F858;
    }

    if (!v3) {
      goto LABEL_37;
    }
  }
  else
  {
    id v13 = &stru_1F0D5F858;
  }
  if ((v3 & 2) == 0)
  {
    long long v29 = &stru_1F0D5F858;
    goto LABEL_43;
  }
LABEL_37:
  if ([v4 length])
  {
    id v30 = ", ";
  }
  else
  {
    id v30 = ", ";
    if (![(__CFString *)v7 length] && ![(__CFString *)v13 length]) {
      id v30 = "";
    }
  }
  long long v29 = (__CFString *)[[NSString alloc] initWithFormat:@"master: %@%s", v2->_masterIdentifier, v30];
LABEL_43:
  id v31 = (void *)[[NSString alloc] initWithFormat:@"%@%@%@%@", v29, v4, v7, v13];

  return v31;
}

- (id)fingerprintSchemeWithContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  fingerprintScheme = self->_fingerprintScheme;
  if (!fingerprintScheme)
  {
    if (!self->_masterIdentifier)
    {
      if (!_CPLSilentLogging)
      {
        id v11 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          uint64_t v12 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          uint64_t v17 = v12;
          __int16 v18 = 2112;
          uint64_t v19 = self;
          _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "%@ called on %@ with master identifier not set", buf, 0x16u);
        }
      }
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      id v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLAssetChange.m"];
      uint64_t v15 = NSStringFromSelector(a2);
      [v13 handleFailureInMethod:a2, self, v14, 124, @"%@ called on %@ with master identifier not set", v15, self object file lineNumber description];

      abort();
    }
    objc_msgSend(v5, "fingerprintSchemeForMasterIdentifier:");
    uint64_t v7 = (CPLFingerprintScheme *)objc_claimAutoreleasedReturnValue();
    objc_super v8 = self->_fingerprintScheme;
    self->_fingerprintScheme = v7;

    fingerprintScheme = self->_fingerprintScheme;
  }
  uint64_t v9 = fingerprintScheme;

  return v9;
}

- (CPLAssetChange)init
{
  v9.receiver = self;
  v9.super_class = (Class)CPLAssetChange;
  uint64_t v2 = [(CPLItemChange *)&v9 init];
  unint64_t v3 = v2;
  if (v2)
  {
    keywords = v2->_keywords;
    id v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_keywords = (NSArray *)MEMORY[0x1E4F1CBF0];

    resources = v3->_resources;
    v3->_resources = v5;

    people = v3->_people;
    v3->_people = v5;
  }
  return v3;
}

+ (BOOL)supportsSharingScopedIdentifier
{
  return 1;
}

+ (BOOL)supportsDeletion
{
  return 1;
}

+ (BOOL)requiresStableHashForResourceType:(unint64_t)a3
{
  BOOL result = 1;
  if (a3 != 2 && a3 != 16)
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLAssetChange;
    return objc_msgSendSuper2(&v7, sel_requiresStableHashForResourceType_);
  }
  return result;
}

+ (BOOL)supportsResourceType:(unint64_t)a3
{
  return a3 != 10;
}

+ (BOOL)supportsResources
{
  return 1;
}

+ (id)copyPropertyBlockForDirection:(unint64_t)a3
{
  if (a3 == 1) {
    return &__block_literal_global_11;
  }
  else {
    return 0;
  }
}

uint64_t __48__CPLAssetChange_copyPropertyBlockForDirection___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, char *a7)
{
  id v10 = a2;
  if (sel_facesData == a7)
  {
    id v12 = a3;
    uint64_t v13 = [a4 facesData];
    uint64_t v14 = [v12 facesData];

    if (v13 && v14)
    {
      if ([(id)v13 isEqual:v14]) {
        goto LABEL_10;
      }
    }
    else if (!(v13 | v14))
    {
      goto LABEL_10;
    }
    if (_CPLFacesDataAreAlmostIdentical((void *)v13, (void *)v14))
    {
      [v10 setFacesData:v13];
      uint64_t v11 = 1;
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    uint64_t v11 = 0;
    goto LABEL_11;
  }
  uint64_t v11 = 0;
LABEL_12:

  return v11;
}

+ (id)equalityBlockForDirection:(unint64_t)a3
{
  uint64_t v3 = &__block_literal_global_8;
  if (a3 != 2) {
    uint64_t v3 = 0;
  }
  if (a3 == 1) {
    return &__block_literal_global_18293;
  }
  else {
    return v3;
  }
}

uint64_t __44__CPLAssetChange_equalityBlockForDirection___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, char *a5)
{
  if (sel_facesData == a5)
  {
    id v9 = a3;
    id v10 = [a2 facesData];
    uint64_t v11 = [v9 facesData];

    if (_CPLFacesDataAreAlmostIdentical(v10, v11)) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
  }
  else if (sel_computeStateLastUpdatedDate == a5 {
         || sel_computeStateAdjustmentFingerprint == a5
  }
         || sel_computeStateVersion == a5)
  {
    return 2;
  }
  else
  {
    return 0;
  }
  return v7;
}

uint64_t __44__CPLAssetChange_equalityBlockForDirection___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, char *a5)
{
  if (sel_facesData == a5)
  {
    id v7 = a3;
    uint64_t v8 = [a2 facesData];
    uint64_t v9 = [v7 facesData];

    if (!v8 || !v9)
    {
      if (v8 | v9) {
        uint64_t v5 = 1;
      }
      else {
        uint64_t v5 = 2;
      }
      goto LABEL_15;
    }
    if (([(id)v8 isEqual:v9] & 1) == 0)
    {
      uint64_t v5 = 1;
LABEL_15:

      return v5;
    }
    id v10 = [[CPLFaceAnalysisReference alloc] initWithData:v9];
    uint64_t v11 = [(CPLFaceAnalysis *)v10 petFaceInstances];
    if ([v11 count])
    {
    }
    else
    {
      id v12 = [(CPLFaceAnalysis *)v10 torsoFaceInstances];
      uint64_t v13 = [v12 count];

      if (!v13)
      {
        uint64_t v5 = 2;
        goto LABEL_14;
      }
    }
    uint64_t v5 = 1;
LABEL_14:

    goto LABEL_15;
  }
  return 0;
}

+ (BOOL)serverSupportsComputeState
{
  return 0;
}

+ (BOOL)serverSupportsLastViewedDate
{
  return 1;
}

+ (BOOL)serverSupportsDeletedByUserIdentifier
{
  return 1;
}

+ (BOOL)serverSupportsSharedLibrarySharingState
{
  return 1;
}

+ (BOOL)serverSupportsVision
{
  return 1;
}

+ (Class)relatedRecordClass
{
  return (Class)objc_opt_class();
}

@end