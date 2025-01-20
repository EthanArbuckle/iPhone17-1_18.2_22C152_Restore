@interface CPLItemChange
+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3;
- (CPLItemChange)init;
- (NSArray)containerRelations;
- (id)containerDescription;
- (id)containerRelationChangesComparedToRelationEnumerator:(id)a3 error:(id *)a4;
- (id)propertiesForChangeType:(unint64_t)a3;
- (void)setContainerRelations:(id)a3;
@end

@implementation CPLItemChange

+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3
{
  id v4 = a3;
  if (([v4 isEqual:@"isImage"] & 1) != 0
    || ([v4 isEqual:@"isVideo"] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLItemChange;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForCoding_, v4);
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setContainerRelations:(id)a3
{
}

- (NSArray)containerRelations
{
  return self->_containerRelations;
}

- (id)containerRelationChangesComparedToRelationEnumerator:(id)a3 error:(id *)a4
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t v8 = [(CPLRecordChange *)self changeType];
  if (v8 && (v8 & 0x10) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v51 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v79 = self;
        _os_log_impl(&dword_1B4CAC000, v51, OS_LOG_TYPE_ERROR, "Trying to calculate relation changes for %@ with no container relation change", buf, 0xCu);
      }
    }
    v48 = [MEMORY[0x1E4F28B00] currentHandler];
    v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLItemChange.m"];
    [v48 handleFailureInMethod:a2, self, v49, 51, @"Trying to calculate relation changes for %@ with no container relation change", self object file lineNumber description];
LABEL_53:

    abort();
  }
  v9 = [(CPLItemChange *)self containerRelations];
  uint64_t v10 = [v9 count];
  if (v10)
  {
    uint64_t v11 = v10;
    SEL v53 = a2;
    v54 = self;
    id v57 = [(CPLRecordChange *)self scopedIdentifier];
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v11];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v55 = v9;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v69 objects:v77 count:16];
    if (!v14)
    {
LABEL_12:

      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v52 = v7;
      obuint64_t j = v7;
      uint64_t v22 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
      if (!v22) {
        goto LABEL_26;
      }
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v66;
      while (1)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v66 != v24) {
            objc_enumerationMutation(obj);
          }
          v26 = *(CPLItemChange **)(*((void *)&v65 + 1) + 8 * i);
          if (!v26)
          {
            if (!_CPLSilentLogging)
            {
              v47 = __CPLGenericOSLogDomain();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v79 = 0;
                _os_log_impl(&dword_1B4CAC000, v47, OS_LOG_TYPE_ERROR, "%@ provided a nil object", buf, 0xCu);
              }
            }
            v48 = [MEMORY[0x1E4F28B00] currentHandler];
            v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLItemChange.m"];
            [v48 handleFailureInMethod:v53, v54, v49, 74, @"%@ provided a nil object", 0 object file lineNumber description];
            goto LABEL_53;
          }
          v27 = [*(id *)(*((void *)&v65 + 1) + 8 * i) relation];
          v28 = [v27 containerIdentifier];

          v29 = [v12 objectForKey:v28];
          if (v29)
          {
            id v30 = [(CPLItemChange *)v26 relation];
            if (([v30 isEqual:v29] & 1) == 0)
            {
              v31 = (void *)[(CPLItemChange *)v26 copy];
              if (!v31)
              {
                if (!_CPLSilentLogging)
                {
                  v50 = __CPLGenericOSLogDomain();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v79 = v26;
                    _os_log_impl(&dword_1B4CAC000, v50, OS_LOG_TYPE_ERROR, "Unable to copy %@", buf, 0xCu);
                  }
                }
                v48 = [MEMORY[0x1E4F28B00] currentHandler];
                v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLItemChange.m"];
                [v48 handleFailureInMethod:v53, v54, v49, 87, @"Unable to copy %@", v26 object file lineNumber description];
                goto LABEL_53;
              }
              v32 = v31;
              [v31 setChangeType:2];
              [v32 setRelation:v29];
              [v21 addObject:v32];
            }
            [v12 removeObjectForKey:v28];
          }
          else
          {
            v33 = [(CPLRecordChange *)v26 scopedIdentifier];
            id v30 = +[CPLRecordChange newRecordWithScopedIdentifier:v33];

            [v30 setChangeType:1024];
            [v21 addObject:v30];
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
        if (!v23)
        {
LABEL_26:

          v62[0] = MEMORY[0x1E4F143A8];
          v62[1] = 3221225472;
          v62[2] = __76__CPLItemChange_containerRelationChangesComparedToRelationEnumerator_error___block_invoke;
          v62[3] = &unk_1E60AB3E8;
          id v63 = v57;
          id v34 = v21;
          id v64 = v34;
          id v35 = v57;
          [v12 enumerateKeysAndObjectsUsingBlock:v62];
          v36 = v64;
          id v13 = v34;

          v37 = v63;
          id v38 = v13;
          id v57 = v12;
          v12 = v35;
          id v7 = v52;
          goto LABEL_29;
        }
      }
    }
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v70;
LABEL_6:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v70 != v16) {
        objc_enumerationMutation(v13);
      }
      v18 = *(void **)(*((void *)&v69 + 1) + 8 * v17);
      uint64_t v19 = [v18 containerIdentifier];
      if (!v19) {
        break;
      }
      v20 = (void *)v19;
      [v12 setObject:v18 forKey:v19];

      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v69 objects:v77 count:16];
        if (!v15) {
          goto LABEL_12;
        }
        goto LABEL_6;
      }
    }
    if (a4)
    {
      v75 = @"CPLErrorResetReason";
      v76 = @"Invalid container relation";
      v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      v39 = [(CPLRecordChange *)v54 scopedIdentifier];
      *a4 = +[CPLErrors cplErrorWithCode:20, 0, v37, @"Client sent a relation for %@ with no container identifier: %@", v39, v18 underlyingError userInfo description];

      id v38 = 0;
LABEL_29:
    }
    else
    {
      id v38 = 0;
    }

    v9 = v55;
  }
  else
  {
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v57 = v7;
    uint64_t v40 = [v57 countByEnumeratingWithState:&v58 objects:v73 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v59 != v42) {
            objc_enumerationMutation(v57);
          }
          v44 = [*(id *)(*((void *)&v58 + 1) + 8 * j) scopedIdentifier];
          id v45 = +[CPLRecordChange newRecordWithScopedIdentifier:v44];

          [v45 setChangeType:1024];
          [v38 addObject:v45];
        }
        uint64_t v41 = [v57 countByEnumeratingWithState:&v58 objects:v73 count:16];
      }
      while (v41);
    }
  }

  return v38;
}

void __76__CPLItemChange_containerRelationChangesComparedToRelationEnumerator_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  v6 = [v5 proposedScopedIdentifierForItemScopedIdentifier:v4];
  id v8 = +[CPLRecordChange newRecordWithScopedIdentifier:v6];

  id v7 = [*(id *)(a1 + 32) identifier];
  [v8 setItemIdentifier:v7];

  [v8 setRelation:v5];
  [*(id *)(a1 + 40) addObject:v8];
}

- (id)propertiesForChangeType:(unint64_t)a3
{
  if (a3 == 16)
  {
    if (propertiesForChangeType__onceToken_23041 != -1) {
      dispatch_once(&propertiesForChangeType__onceToken_23041, &__block_literal_global_23042);
    }
    id v3 = (id)propertiesForChangeType__properties_23043;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CPLItemChange;
    -[CPLRecordChange propertiesForChangeType:](&v5, sel_propertiesForChangeType_);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

uint64_t __41__CPLItemChange_propertiesForChangeType___block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"containerRelations", 0);
  uint64_t v1 = propertiesForChangeType__properties_23043;
  propertiesForChangeType__properties_23043 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)containerDescription
{
  v2 = self;
  id v3 = [(CPLItemChange *)self containerRelations];
  LOBYTE(v2) = [(CPLRecordChange *)v2 changeType];
  if ([v3 count] | v2 & 0x10) {
    uint64_t v4 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"in %lu cont.", objc_msgSend(v3, "count"));
  }
  else {
    uint64_t v4 = &stru_1F0D5F858;
  }

  return v4;
}

- (CPLItemChange)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPLItemChange;
  return [(CPLItemChange *)&v3 init];
}

@end