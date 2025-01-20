@interface CPLRecordChange
+ (id)assetTransferOptionsByRecordTypeAndKey;
+ (id)ckAssetProperties;
+ (id)ckPropertyForRelatedIdentifier;
+ (id)ckValueForRelatedRecord:(id)a3;
+ (void)setRelatedValueOnRecord:(id)a3 fromRelatedRecord:(id)a4;
- (BOOL)fillCKRecordBuilderWithResourceChange:(id)a3 resourceCountAndSize:(id)a4 scopeProvider:(id)a5 error:(id *)a6;
- (BOOL)fillResourcesOfCKRecordBuilder:(id)a3 clearMissing:(BOOL)a4 resourceCountAndSize:(id)a5 scopeProvider:(id)a6 error:(id *)a7;
- (BOOL)prepareWithCKRecordBuilder:(id)a3 resourceCountAndSize:(id)a4 scopeProvider:(id)a5 error:(id *)a6;
- (BOOL)shouldAppearInCKUploadContext;
- (BOOL)shouldClearMissingResourcesInCKRecord;
- (BOOL)shouldProtectResourceTypeFromClearing:(unint64_t)a3;
- (BOOL)shouldUseEncryptedPropertiesIfPossibleWithContext:(id)a3;
- (void)fillCKRecord:(id)a3 scopeProvider:(id)a4;
- (void)fillWithCKRecord:(id)a3 missingResourceProperties:(id *)a4 scopeProvider:(id)a5;
- (void)prepareWithCKRecord:(id)a3 scopeIdentifier:(id)a4 scopeProvider:(id)a5 currentUserRecordID:(id)a6;
@end

@implementation CPLRecordChange

+ (id)assetTransferOptionsByRecordTypeAndKey
{
  if (qword_1002CE7E8 != -1) {
    dispatch_once(&qword_1002CE7E8, &stru_100279180);
  }
  v2 = (void *)qword_1002CE7F0;
  return v2;
}

- (BOOL)fillResourcesOfCKRecordBuilder:(id)a3 clearMissing:(BOOL)a4 resourceCountAndSize:(id)a5 scopeProvider:(id)a6 error:(id *)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = [(CPLRecordChange *)self resourceCopyFromScopedIdentifier];
  unsigned int v16 = [(CPLRecordChange *)self shouldOnlyUploadNewResources];
  if (v15)
  {
    id v123 = 0;
    v17 = [v12 recordIDForResourcesOfRecordWithScopedIdentifier:v15 cloudKitScope:&v123 error:a7];
    id v18 = v123;
    if (!v17)
    {
      BOOL v19 = 0;
      goto LABEL_108;
    }
  }
  else
  {
    id v18 = 0;
    v17 = 0;
  }
  id v89 = v18;
  v93 = v15;
  int v97 = v16 ^ 1;
  int v92 = v10 & (v16 ^ 1);
  if (v92) {
    bzero(v131, 0x3E9uLL);
  }
  v20 = [(CPLRecordChange *)self resources];
  v91 = v14;
  v99 = [v14 fingerprintContext];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v21 = v20;
  id v22 = [v21 countByEnumeratingWithState:&v119 objects:v130 count:16];
  v108 = v21;
  if (!v22)
  {
    v25 = 0;
    int v48 = 0;
LABEL_91:

    BOOL v19 = v48 == 0;
    int v73 = v92;
    if (v48) {
      int v73 = 0;
    }
    if (v73 == 1)
    {
      v109[0] = _NSConcreteStackBlock;
      v109[1] = 3221225472;
      v109[2] = sub_10007A810;
      v109[3] = &unk_1002791F8;
      v111 = v131;
      v109[4] = self;
      id v110 = v12;
      +[CPLResource enumerateResourceTypesWithBlock:v109];

      BOOL v19 = 1;
    }
    v74 = v108;
    goto LABEL_107;
  }
  id v23 = v22;
  uint64_t v90 = (uint64_t)v13;
  v94 = v12;
  v88 = v17;
  char v100 = 0;
  unsigned int v24 = 0;
  v25 = 0;
  uint64_t v26 = *(void *)v120;
  v27 = &CPLSyncSessionBlockedStateSyncRequestedKey_ptr;
  v101 = self;
LABEL_9:
  uint64_t v28 = 0;
  while (1)
  {
    if (*(void *)v120 != v26) {
      objc_enumerationMutation(v21);
    }
    v29 = *(void **)(*((void *)&v119 + 1) + 8 * v28);
    if ((CPLIsDynamicResource(v29) & 1) != 0
      || +[CPLCloudKitFakeDynamicDerivatives isFakeDerivative:v29])
    {
      goto LABEL_80;
    }
    if (!v25)
    {
      v25 = [(CPLRecordChange *)self fingerprintSchemeWithContext:v99];
      unsigned int v24 = [v25 isForStableHash] ^ 1;
      char v100 = _CPLShouldValidateStableHash();
    }
    uint64_t v30 = (uint64_t)[v29 resourceType];
    if (([v27[157] shouldIgnoreResourceTypeOnUpload:v30] & 1) == 0)
    {
      if ([(CPLRecordChange *)self supportsResourceType:v30]) {
        break;
      }
    }
LABEL_79:
    id v21 = v108;
LABEL_80:
    if (v23 == (id)++v28)
    {
      id v72 = [v21 countByEnumeratingWithState:&v119 objects:v130 count:16];
      id v23 = v72;
      if (!v72)
      {
        int v48 = 0;
LABEL_89:
        v17 = v88;
        id v12 = v94;
        id v13 = (id)v90;
        goto LABEL_91;
      }
      goto LABEL_9;
    }
  }
  v103 = sub_1000961D8((uint64_t)CPLCloudKitResourceKeys, v30);
  v106 = v25;
  if (v103)
  {
    v31 = [v29 identity];
    [v31 imageDimensions];
    double v33 = v32;
    double v35 = v34;
    id v36 = [v31 fileSize];
    v104 = [v31 fileUTI];
    v105 = [v31 fingerPrint];
    int v37 = [(CPLRecordChange *)self requiresStableHashForResourceType:v30];
    unsigned int v102 = v24;
    unint64_t v98 = (unint64_t)v36;
    if (v24)
    {
      v107 = [v31 stableHash];
      if (v107) {
        int v38 = 0;
      }
      else {
        int v38 = v37;
      }
      if (v38 != 1)
      {
LABEL_30:
        uint64_t v41 = [v31 fileURL];
        unsigned int v42 = [v31 isAvailable];
        if (v41) {
          unsigned int v43 = v42;
        }
        else {
          unsigned int v43 = 0;
        }
        if ((v97 | v43) == 1)
        {
          unsigned int v44 = v42;
          uint64_t v45 = 0;
          if (!v93
            || v41
            || (id v46 = [v29 sourceResourceType],
                sub_1000961D8((uint64_t)CPLCloudKitResourceKeys, (uint64_t)v46),
                (uint64_t v45 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            if (v44)
            {
              id v96 = (id)v45;
              unsigned int v47 = (v41 | v45) != 0;
            }
            else
            {
              v50 = (void *)v45;

              uint64_t v41 = 0;
              id v96 = 0;
              unsigned int v47 = ![(CPLRecordChange *)v101 shouldProtectResourceTypeFromClearing:v30];
            }
            v49 = v103;
            if (v92) {
              v131[v30] = 1;
            }
            v51 = sub_1000B5ACC((id *)[CPLCloudKitResourceRecordProperties alloc], v103, [(CPLRecordChange *)v101 recordClass], v106);
            v52 = v51;
            if (v41) {
              unsigned int v53 = 0;
            }
            else {
              unsigned int v53 = v47;
            }
            if (v104) {
              int v54 = 1;
            }
            else {
              int v54 = v53;
            }
            sub_1000B5B78((uint64_t)v51, v94, v105, v107, v37, v98, v104, v54, v33, v35);
            v95 = v52;
            if (v47)
            {
              self = v101;
              if (v41)
              {
                if (v90)
                {
                  id v55 = [v31 fileSize];
                  uint64_t v56 = sub_1000379A4(v90);
                  sub_1000379B0(v90, (uint64_t)v55 + v56);
                }
                id v57 = [objc_alloc((Class)CKAsset) initWithFileURL:v41];
                [v57 setItemTypeHint:@"fxd"];
                [v106 configureAssetTransferOptionsForCKAsset:v57 scopeProvider:v91];
                if (!_CPLSilentLogging)
                {
                  v58 = __CPLGenericOSLogDomain();
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                  {
                    v59 = [(CPLRecordChange *)v101 scopedIdentifier];
                    v60 = [v57 assetTransferOptions];
                    *(_DWORD *)buf = 138412546;
                    v125 = v59;
                    __int16 v126 = 2112;
                    v127 = v60;
                    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "Setting asset transfer options for %@ to %@", buf, 0x16u);

                    v49 = v103;
                    self = v101;
                  }
                }
                [v57 setStorageGroupingPolicy:1];
                v61 = sub_1000967A4((uint64_t)v49);
                [v94 setCKAsset:v57 forKey:v61];

                goto LABEL_59;
              }
              if (!v96)
              {
                sub_1000967A4((uint64_t)v103);
                id v57 = (id)objc_claimAutoreleasedReturnValue();
                [v94 setObject:0 forKey:v57];
LABEL_59:

                int v48 = 0;
LABEL_73:
                v27 = &CPLSyncSessionBlockedStateSyncRequestedKey_ptr;
                goto LABEL_74;
              }
              if (!v105)
              {
                if (a7)
                {
                  *a7 = +[CPLErrors cplErrorWithCode:150 description:@"Trying to copy a resource with no fingerprint"];
                }
                int v48 = 1;
                goto LABEL_73;
              }
              if (v90)
              {
                uint64_t v66 = sub_1000379BC(v90);
                sub_1000379C8(v90, v66 + 1);
                id v67 = [v31 fileSize];
                uint64_t v68 = sub_1000379D4(v90);
                sub_1000379E0(v90, (uint64_t)v67 + v68);
              }
              if (!v89)
              {
                if (!_CPLSilentLogging)
                {
                  v80 = __CPLGenericOSLogDomain();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                  {
                    v81 = sub_1000967A4((uint64_t)v96);
                    v82 = sub_1000967A4((uint64_t)v103);
                    *(_DWORD *)buf = 138412802;
                    v125 = (CPLRecordChange *)v88;
                    __int16 v126 = 2112;
                    v127 = v81;
                    __int16 v128 = 2112;
                    v129 = v82;
                    _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "No source scope for %@ to find asset reference %@ for %@", buf, 0x20u);
                  }
                }
                v83 = +[NSAssertionHandler currentHandler];
                v84 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CKRecord+CPL_base.m"];
                v85 = sub_1000967A4((uint64_t)v96);
                v86 = sub_1000967A4((uint64_t)v103);
                [v83 handleFailureInMethod:a2, v101, v84, 1031, @"No source scope for %@ to find asset reference %@ for %@", v88, v85, v86 object file lineNumber description];

                abort();
              }
              v69 = sub_1000967A4((uint64_t)v103);
              v112[0] = _NSConcreteStackBlock;
              v112[1] = 3221225472;
              v112[2] = sub_10007A56C;
              v112[3] = &unk_1002791D0;
              id v70 = v88;
              id v113 = v70;
              id v96 = v96;
              id v114 = v96;
              id v115 = v105;
              id v116 = v103;
              id v71 = v89;
              id v117 = v71;
              id v118 = v91;
              [v94 requestRecordWithID:v70 cloudKitScope:v71 forKey:v69 completionHandler:v112];
            }
            int v48 = 0;
            self = v101;
            goto LABEL_73;
          }
          self = v101;
          if (!_CPLSilentLogging)
          {
            v62 = __CPLGenericOSLogDomain();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              v63 = +[CPLResource shortDescriptionForResourceType:v46];
              v64 = +[CPLResource shortDescriptionForResourceType:v30];
              *(_DWORD *)buf = 138412546;
              v125 = v63;
              __int16 v126 = 2112;
              v127 = v64;
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "Trying to copy an unsupported resource type %@ to %@", buf, 0x16u);

              self = v101;
            }
          }
          if (a7)
          {
            uint64_t v65 = +[CPLResource shortDescriptionForResourceType:v46];
            v95 = +[CPLResource shortDescriptionForResourceType:v30];
            id v96 = (id)v65;
            +[CPLErrors cplErrorWithCode:150, @"Trying to copy an unsupported resource type %@ to %@", v65, v95 description];
            uint64_t v41 = 0;
            *a7 = (id)objc_claimAutoreleasedReturnValue();
            v27 = &CPLSyncSessionBlockedStateSyncRequestedKey_ptr;
            int v48 = 1;
            v49 = v103;
LABEL_74:

LABEL_75:
            if (v48 == 3)
            {
              v25 = v106;
              unsigned int v24 = v102;
            }
            else
            {
              v25 = v106;
              unsigned int v24 = v102;
              if (v48) {
                goto LABEL_89;
              }
            }
            goto LABEL_79;
          }
          uint64_t v41 = 0;
          int v48 = 1;
        }
        else
        {
          int v48 = 3;
          self = v101;
        }
        v27 = &CPLSyncSessionBlockedStateSyncRequestedKey_ptr;
        v49 = v103;
        goto LABEL_75;
      }
      if (!_CPLSilentLogging)
      {
        v39 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = +[CPLResource shortDescriptionForResourceType:v30];
          *(_DWORD *)buf = 138412546;
          v125 = v101;
          __int16 v126 = 2112;
          v127 = v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Trying to upload resource type %@ on %@ without a stable hash", buf, 0x16u);
        }
      }
      if (v100)
      {
        if (a7)
        {
          v78 = +[CPLResource shortDescriptionForResourceType:v30];
          *a7 = +[CPLErrors cplErrorWithCode:150, @"Trying to upload resource %@ without a stable hash", v78 description];
        }
        v17 = v88;
        id v12 = v94;
        id v13 = (id)v90;
        v77 = v103;
        goto LABEL_105;
      }
    }
    v107 = 0;
    goto LABEL_30;
  }
  v17 = v88;
  id v12 = v94;
  id v13 = (id)v90;
  if (!_CPLSilentLogging)
  {
    v75 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      v76 = [v27[157] shortDescriptionForResourceType:v30];
      *(_DWORD *)buf = 138412290;
      v125 = v76;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "Trying to upload an unsupported resource type %@", buf, 0xCu);
    }
  }
  if (a7)
  {
    v77 = [v27[157] shortDescriptionForResourceType:v30];
    *a7 = +[CPLErrors cplErrorWithCode:150, @"Trying to upload an unsupported resource type %@", v77 description];
LABEL_105:
  }
  v74 = v108;

  BOOL v19 = 0;
  v25 = v106;
LABEL_107:

  id v14 = v91;
  v15 = v93;
  id v18 = v89;
LABEL_108:

  return v19;
}

+ (id)ckAssetProperties
{
  return 0;
}

- (void)fillCKRecord:(id)a3 scopeProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)CPLSimpleRecordTargetMapping);
  BOOL v10 = [[CPLSimpleCKRecordBuilder alloc] initWithBaseCKRecord:v7 scopeProvider:0 currentUserRecordID:0 targetMapping:v9];
  id v14 = 0;
  unsigned __int8 v11 = [(CPLRecordChange *)self prepareWithCKRecordBuilder:v10 resourceCountAndSize:0 scopeProvider:v8 error:&v14];
  id v12 = v14;
  id v13 = v12;
  if ((v11 & 1) == 0) {
    sub_1001CC3E0(v12, (uint64_t)a2, (uint64_t)self);
  }
}

- (BOOL)shouldAppearInCKUploadContext
{
  return 1;
}

- (BOOL)shouldProtectResourceTypeFromClearing:(unint64_t)a3
{
  return 0;
}

- (BOOL)shouldUseEncryptedPropertiesIfPossibleWithContext:(id)a3
{
  v3 = [(CPLRecordChange *)self fingerprintSchemeWithContext:a3];
  unsigned __int8 v4 = [v3 isMMCSv2];

  return v4;
}

+ (id)ckPropertyForRelatedIdentifier
{
  return 0;
}

+ (id)ckValueForRelatedRecord:(id)a3
{
  id v5 = a3;
  v6 = +[NSAssertionHandler currentHandler];
  id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CKRecord+CPL_base.m"];
  id v8 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, a1, v7, 1138, @"%@ should be implemented by subclasses", v8 object file lineNumber description];

  abort();
}

+ (void)setRelatedValueOnRecord:(id)a3 fromRelatedRecord:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [a1 ckPropertyForRelatedIdentifier];
  if (v7)
  {
    id v8 = [a1 ckValueForRelatedRecord:v6];
    [v9 setObject:v8 forKeyedSubscript:v7];
  }
}

- (void)prepareWithCKRecord:(id)a3 scopeIdentifier:(id)a4 scopeProvider:(id)a5 currentUserRecordID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v11 recordID];
  uint64_t v16 = [v13 scopedIdentifierForCKRecordID:v15];
  if (!v16) {
    sub_1001CE4DC((uint64_t)v15, (uint64_t)a2, (uint64_t)self);
  }
  v17 = (void *)v16;
  [(CPLRecordChange *)self setScopedIdentifier:v16];
  char v71 = 0;
  id v18 = objc_msgSend(v11, "cpl_sharingRecordScopedIdentifierWithScopeProvider:currentUserRecordID:isSparseRecord:", v13, v14, &v71);
  if ([(CPLRecordChange *)self supportsSharingScopedIdentifier])
  {
    [(CPLRecordChange *)self setSharingRecordScopedIdentifier:v18];
    if (v71)
    {
      BOOL v19 = [(CPLRecordChange *)self sharingRecordScopedIdentifier];

      if (!v19)
      {
        if (!_CPLSilentLogging)
        {
          v20 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = [v11 objectForKey:@"linkedShareZoneName"];
            [v11 objectForKey:@"linkedShareZoneOwner"];
            id v57 = v13;
            v60 = v15;
            id v55 = v14;
            v23 = id v22 = v12;
            [v23 recordID];
            v25 = unsigned int v24 = v18;
            uint64_t v26 = [v25 recordName];
            *(_DWORD *)buf = 138413058;
            v74 = self;
            __int16 v75 = 2112;
            v76 = v21;
            __int16 v77 = 2112;
            v78 = v26;
            __int16 v79 = 2112;
            id v80 = v11;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ is a sparse record pointing to an unknown or inactive sharing zone (%@#%@) - interpreting as a delete:\n%@", buf, 0x2Au);

            id v18 = v24;
            id v12 = v22;
            id v14 = v55;
            id v13 = v57;
            v15 = v60;
          }
LABEL_12:

          goto LABEL_13;
        }
        goto LABEL_13;
      }
      goto LABEL_42;
    }
    v27 = [v11 objectForKey:@"contributors"];
    if (!v27)
    {
      id v31 = 0;
LABEL_41:
      [(CPLRecordChange *)self setSharingContributorUserIdentifiers:v31];

      goto LABEL_42;
    }
    objc_opt_class();
    v63 = v18;
    if (objc_opt_isKindOfClass())
    {
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      int v54 = v27;
      uint64_t v28 = v27;
      id v29 = [v28 countByEnumeratingWithState:&v67 objects:v72 count:16];
      if (v29)
      {
        id v30 = v29;
        id v58 = v13;
        v61 = v15;
        id v56 = v14;
        id v53 = v12;
        id v31 = 0;
        uint64_t v32 = *(void *)v68;
        char v33 = 1;
LABEL_18:
        uint64_t v34 = 0;
        while (1)
        {
          if (*(void *)v68 != v32) {
            objc_enumerationMutation(v28);
          }
          double v35 = *(void **)(*((void *)&v67 + 1) + 8 * v34);
          if (v33)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
          }
          if (!v31) {
            id v31 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSObject count](v28, "count"));
          }
          id v36 = [v35 recordID];
          int v37 = [v36 recordName];
          [v31 addObject:v37];

          char v33 = 0;
          if (v30 == (id)++v34)
          {
            id v30 = [v28 countByEnumeratingWithState:&v67 objects:v72 count:16];
            char v33 = 0;
            if (v30) {
              goto LABEL_18;
            }
            goto LABEL_27;
          }
        }
        if (_CPLSilentLogging)
        {
LABEL_27:
          id v12 = v53;
          v27 = v54;
          id v14 = v56;
          id v13 = v58;
          v15 = v61;
          goto LABEL_39;
        }
        int v38 = __CPLGenericOSLogDomain();
        id v12 = v53;
        id v14 = v56;
        id v13 = v58;
        v15 = v61;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v74 = (CPLRecordChange *)@"contributors";
          __int16 v75 = 2112;
          v76 = v28;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Got unexpected value for %@: %@", buf, 0x16u);
        }
      }
      else
      {
        id v31 = 0;
      }
      v27 = v54;
    }
    else
    {
      if (_CPLSilentLogging)
      {
        id v31 = 0;
        goto LABEL_40;
      }
      uint64_t v28 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v74 = (CPLRecordChange *)@"contributors";
        __int16 v75 = 2112;
        v76 = v27;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Got unexpected value for %@: %@", buf, 0x16u);
      }
      id v31 = 0;
    }
LABEL_39:

LABEL_40:
    id v18 = v63;
    goto LABEL_41;
  }
  if (v71)
  {
    if (!_CPLSilentLogging)
    {
      v20 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v74 = self;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ is an unsupported sparse record - interpreting as a delete", buf, 0xCu);
      }
      goto LABEL_12;
    }
LABEL_13:
    [(CPLRecordChange *)self setChangeType:1024];
    goto LABEL_53;
  }
LABEL_42:
  v62 = v15;
  v64 = v18;
  v39 = [v11 objectForKey:@"recordModificationDate"];
  [(CPLRecordChange *)self setRecordModificationDate:v39];

  v40 = [v11 objectForKey:@"isDeleted"];
  -[CPLRecordChange setInTrash:](self, "setInTrash:", [v40 BOOLValue]);

  uint64_t v41 = [v11 objectForKey:@"isExpunged"];
  -[CPLRecordChange setInExpunged:](self, "setInExpunged:", [v41 BOOLValue]);

  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_1000ABFD4;
  v65[3] = &unk_10027A5B8;
  id v42 = v11;
  id v66 = v42;
  unsigned int v43 = +[CPLArchiver archivedDataWithRootObject:v42 usingBlock:v65];
  [(CPLRecordChange *)self setRecordChangeData:v43];
  unsigned int v44 = [v42 objectForKey:@"remappedRef"];
  if (v44)
  {
    id v59 = v13;
    id v45 = v12;
    id v46 = [(CPLRecordChange *)self sharingContributorUserIdentifiers];
    if ([v46 count]
      && ([v14 recordName],
          unsigned int v47 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v48 = [v46 containsObject:v47],
          v47,
          (v48 & 1) == 0))
    {
      if (!_CPLSilentLogging)
      {
        v51 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v52 = [(CPLRecordChange *)self scopedIdentifier];
          *(_DWORD *)buf = 138412290;
          v74 = v52;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Ignoring remapped shared record %@ not contributed by the current user", buf, 0xCu);
        }
      }
      [(CPLRecordChange *)self setChangeType:1024];
    }
    else
    {
      v49 = [v44 recordID];
      v50 = [v49 recordName];
      [(CPLRecordChange *)self setRealIdentifier:v50];
    }
    id v12 = v45;

    id v13 = v59;
  }

  v15 = v62;
  id v18 = v64;
LABEL_53:
}

- (void)fillWithCKRecord:(id)a3 missingResourceProperties:(id *)a4 scopeProvider:(id)a5
{
  id v7 = a3;
  uint64_t v28 = self;
  id v29 = a5;
  id v8 = [(id)objc_opt_class() ckAssetProperties];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
  id v31 = v8;
  if (!v9)
  {
    id v11 = 0;
    id v32 = 0;
    goto LABEL_24;
  }
  id v10 = v9;
  id v11 = 0;
  id v32 = 0;
  id v12 = &CPLSyncSessionBlockedStateSyncRequestedKey_ptr;
  uint64_t v13 = *(void *)v35;
  id v30 = v7;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v35 != v13) {
        objc_enumerationMutation(v8);
      }
      uint64_t v15 = *(void *)(*((void *)&v34 + 1) + 8 * i);
      uint64_t v16 = [v7 objectForKey:v15];
      if (v16)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = [v16 assetContent];
          if (v17) {
            goto LABEL_9;
          }
          id v18 = v11;
          BOOL v19 = v12;
          v20 = [v16 fileURL];
          if (v20
            && (+[NSFileManager defaultManager],
                id v21 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v22 = [v21 cplFileExistsAtURL:v20],
                v21,
                (v22 & 1) != 0))
          {
            id v17 = [objc_alloc((Class)NSData) initWithContentsOfURL:v20];

            id v12 = v19;
            id v11 = v18;
            id v7 = v30;
            id v8 = v31;
            if (v17)
            {
LABEL_9:
              if (!v11) {
                id v11 = objc_alloc_init((Class)NSMutableDictionary);
              }
              [v11 setObject:v17 forKeyedSubscript:v15];

              goto LABEL_20;
            }
          }
          else
          {

            id v12 = v19;
            id v11 = v18;
            id v7 = v30;
            id v8 = v31;
          }
          id v23 = v32;
          if (!v32) {
            id v23 = objc_alloc_init((Class)NSMutableArray);
          }
          id v32 = v23;
          [v23 addObject:v15];
        }
      }
LABEL_20:
    }
    id v10 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
  }
  while (v10);
LABEL_24:
  id v24 = v32;
  *a4 = v24;
  if ([(CPLRecordChange *)v28 supportsResources])
  {
    char v33 = 1;
    v25 = [(CPLRecordChange *)v28 scopedIdentifier];
    uint64_t v26 = [v7 cplResourcesWithScopedIdentifier:v25 coherent:&v33 forRecord:v28 scopeProvider:v29];
    [(CPLRecordChange *)v28 setResources:v26];

    if (!v33) {
      [(CPLRecordChange *)v28 setServerRecordIsCorrupted:1];
    }
    id v8 = v31;
  }
  [(CPLRecordChange *)v28 fillWithCKRecord:v7];
  if ([v11 count]) {
    [(CPLRecordChange *)v28 fillMissingCKAssetProperties:v11 withCKRecord:v7];
  }
}

- (BOOL)prepareWithCKRecordBuilder:(id)a3 resourceCountAndSize:(id)a4 scopeProvider:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(CPLRecordChange *)self supportsResources]
    && [(CPLRecordChange *)self hasChangeType:8]
    && ![(CPLRecordChange *)self fillCKRecordBuilderWithResourceChange:v10 resourceCountAndSize:v11 scopeProvider:v12 error:a6])
  {
    BOOL v17 = 0;
  }
  else
  {
    uint64_t v13 = [(CPLRecordChange *)self recordModificationDate];
    if (v13)
    {
      [v10 setObject:v13 forKey:@"recordModificationDate"];
    }
    else
    {
      id v14 = +[NSDate date];
      [v10 setObject:v14 forKey:@"recordModificationDate"];
    }
    if ([(CPLRecordChange *)self hasChangeType:2]
      && ([(CPLRecordChange *)self isMasterChange] & 1) == 0
      && [(CPLRecordChange *)self hasChangeType:2]
      && ([(CPLRecordChange *)self supportsDirectDeletion] & 1) == 0)
    {
      uint64_t v15 = [(CPLRecordChange *)self attachedDiffTracker];
      if (!v15
        || ([(CPLRecordChange *)self isFullRecord] & 1) != 0
        || ([v15 areObjectsDifferentOnProperty:@"inTrash" changeType:2] & 1) != 0
        || [(CPLRecordChange *)self inExpunged])
      {
        if ([(CPLRecordChange *)self inTrash]) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = (uint64_t)[(CPLRecordChange *)self inExpunged];
        }
        id v18 = +[NSNumber numberWithInt:v16];
        [v10 setObject:v18 forKey:@"isDeleted"];

        BOOL v19 = +[NSNumber numberWithBool:[(CPLRecordChange *)self inExpunged]];
        [v10 setObject:v19 forKey:@"isExpunged"];
      }
      else if ([(CPLRecordChange *)self isFullRecord])
      {
        [v10 setObject:&__kCFBooleanFalse forKey:@"isExpunged"];
      }
    }
    [(CPLRecordChange *)self fillCKRecordBuilder:v10 scopeProvider:v12];
    BOOL v17 = 1;
  }

  return v17;
}

- (BOOL)fillCKRecordBuilderWithResourceChange:(id)a3 resourceCountAndSize:(id)a4 scopeProvider:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  LOBYTE(a6) = [(CPLRecordChange *)self fillResourcesOfCKRecordBuilder:v12 clearMissing:[(CPLRecordChange *)self shouldClearMissingResourcesInCKRecord] resourceCountAndSize:v11 scopeProvider:v10 error:a6];

  return (char)a6;
}

- (BOOL)shouldClearMissingResourcesInCKRecord
{
  return 1;
}

@end