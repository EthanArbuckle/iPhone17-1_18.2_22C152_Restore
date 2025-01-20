@interface CPLContainerRelationChange
+ (BOOL)shouldReallyQuarantineRecord;
+ (BOOL)supportsDeletion;
+ (BOOL)supportsDirectDeletion;
+ (Class)relatedRecordClass;
+ (id)relationToContainerWithIdentifier:(id)a3;
+ (id)relationWithItemScopedIdentifier:(id)a3 containerIdentifier:(id)a4;
- (BOOL)validateFullRecord;
- (CPLContainerRelation)relation;
- (NSString)itemIdentifier;
- (id)compactedChangeWithRelatedChanges:(id)a3 isOnlyChange:(BOOL)a4 fullRecord:(id)a5 usingStorageView:(id)a6;
- (id)containerScopedIdentifier;
- (id)description;
- (id)itemScopedIdentifier;
- (id)scopedIdentifiersForMapping;
- (id)secondaryIdentifier;
- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4;
- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4;
- (void)setContainerScopedIdentifier:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setItemScopedIdentifier:(id)a3;
- (void)setRelation:(id)a3;
- (void)setSecondaryIdentifier:(id)a3;
@end

@implementation CPLContainerRelationChange

- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)[(CPLContainerRelationChange *)self copy];
  char v25 = 0;
  v8 = [(CPLRecordChange *)self scopedIdentifier];
  if (v8)
  {
    char v24 = 0;
    v9 = [(CPLContainerRelationChange *)self itemScopedIdentifier];
    if (v9)
    {
      v10 = [v6 localScopedIdentifierForCloudScopedIdentifier:v9 isFinal:&v24];
      if (v10)
      {
        [v7 setItemScopedIdentifier:v10];
      }
      else
      {
        if (a4)
        {
          *a4 = +[CPLErrors invalidClientCacheErrorWithReason:0];
        }
        if (!_CPLSilentLogging)
        {
          v11 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v9;
            __int16 v28 = 2112;
            v29 = self;
            _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "Can't map cloud \"itemScopedIdentifier\" (%@) of %@", buf, 0x16u);
          }
        }
        v7 = 0;
      }
    }
    char v24 = 0;
    v12 = [(CPLContainerRelationChange *)self containerScopedIdentifier];
    if (v12)
    {
      v13 = [v6 localScopedIdentifierForCloudScopedIdentifier:v12 isFinal:&v24];
      if (v13)
      {
        [v7 setContainerScopedIdentifier:v13];
      }
      else
      {
        if (a4)
        {
          *a4 = +[CPLErrors invalidClientCacheErrorWithReason:0];
        }
        if (!_CPLSilentLogging)
        {
          v14 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v12;
            __int16 v28 = 2112;
            v29 = self;
            _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Can't map cloud \"containerScopedIdentifier\" (%@) of %@", buf, 0x16u);
          }
        }
        v7 = 0;
      }
    }
    if (v7)
    {
      uint64_t v15 = [v6 localScopedIdentifierForCloudScopedIdentifier:v8 isFinal:&v25];
      if (v15)
      {
        v16 = (void *)v15;
      }
      else
      {
        uint64_t v17 = [v7 itemIdentifier];
        if (!v17) {
          goto LABEL_30;
        }
        v18 = (void *)v17;
        v19 = [v7 relation];
        v20 = [v19 containerIdentifier];

        if (v20)
        {
          v21 = [v7 relation];
          v22 = [v7 itemScopedIdentifier];
          v16 = [v21 proposedScopedIdentifierForItemScopedIdentifier:v22];
        }
        else
        {
LABEL_30:
          v16 = [(CPLRecordChange *)self proposedLocalScopedIdentifier];
        }
        if (([v6 addCloudScopedIdentifier:v8 forLocalScopedIdentifier:v16 isFinal:1 direction:2 error:a4] & 1) == 0)
        {

          v7 = 0;
          goto LABEL_33;
        }
      }
      [v7 setScopedIdentifier:v16];
LABEL_33:
    }
  }

  return v7;
}

- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)[(CPLContainerRelationChange *)self copy];
  char v25 = 0;
  v8 = [(CPLRecordChange *)self scopedIdentifier];
  if (v8)
  {
    v9 = [v6 cloudScopedIdentifierForLocalScopedIdentifier:v8 isFinal:&v25];
    if (v9) {
      [v7 setScopedIdentifier:v9];
    }
    char v24 = 0;
    v10 = [(CPLContainerRelationChange *)self itemScopedIdentifier];
    if (v10)
    {
      v11 = [v6 cloudScopedIdentifierForLocalScopedIdentifier:v10 isFinal:&v24];
      if (v11)
      {
        [v7 setItemScopedIdentifier:v11];
      }
      else
      {
        if (a4)
        {
          *a4 = +[CPLErrors invalidClientCacheErrorWithReason:0];
        }
        if (!_CPLSilentLogging)
        {
          v12 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v10;
            __int16 v28 = 2112;
            v29 = self;
            _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Can't map local \"itemScopedIdentifier\" (%@) of %@", buf, 0x16u);
          }
        }
        v7 = 0;
      }
    }
    char v24 = 0;
    v13 = [(CPLContainerRelationChange *)self containerScopedIdentifier];
    if (v13)
    {
      v14 = [v6 cloudScopedIdentifierForLocalScopedIdentifier:v13 isFinal:&v24];
      if (v14)
      {
        [v7 setContainerScopedIdentifier:v14];
      }
      else
      {
        if (a4)
        {
          *a4 = +[CPLErrors invalidClientCacheErrorWithReason:0];
        }
        if (!_CPLSilentLogging)
        {
          uint64_t v15 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v13;
            __int16 v28 = 2112;
            v29 = self;
            _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_ERROR, "Can't map local \"containerScopedIdentifier\" (%@) of %@", buf, 0x16u);
          }
        }
        v7 = 0;
      }
    }
    if (v9 || !v7) {
      goto LABEL_37;
    }
    uint64_t v16 = [v7 itemIdentifier];
    if (!v16) {
      goto LABEL_32;
    }
    uint64_t v17 = (void *)v16;
    v18 = [v7 relation];
    v19 = [v18 containerIdentifier];

    if (v19)
    {
      v20 = [v7 relation];
      v21 = [v7 itemScopedIdentifier];
      v22 = [v20 proposedScopedIdentifierForItemScopedIdentifier:v21];

      if (!v22)
      {
LABEL_31:

        v9 = 0;
        goto LABEL_36;
      }
    }
    else
    {
LABEL_32:
      v22 = [(CPLRecordChange *)self proposedCloudScopedIdentifierWithError:a4];
      if (!v22) {
        goto LABEL_31;
      }
    }
    v9 = [v6 setupCloudScopedIdentifier:v22 forLocalScopedIdentifier:v8 isFinal:0 direction:1 error:a4];

    if (v9)
    {
      [v7 setScopedIdentifier:v9];
LABEL_37:

      goto LABEL_38;
    }

LABEL_36:
    v7 = 0;
    goto LABEL_37;
  }
LABEL_38:

  return v7;
}

- (id)scopedIdentifiersForMapping
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v9.receiver = self;
  v9.super_class = (Class)CPLContainerRelationChange;
  v4 = [(CPLRecordChange *)&v9 scopedIdentifiersForMapping];
  v5 = (void *)[v3 initWithArray:v4];

  id v6 = [(CPLContainerRelationChange *)self itemScopedIdentifier];
  if (v6) {
    [v5 addObject:v6];
  }

  v7 = [(CPLContainerRelationChange *)self containerScopedIdentifier];
  if (v7) {
    [v5 addObject:v7];
  }

  return v5;
}

- (id)compactedChangeWithRelatedChanges:(id)a3 isOnlyChange:(BOOL)a4 fullRecord:(id)a5 usingStorageView:(id)a6
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relation, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

- (void)setRelation:(id)a3
{
}

- (CPLContainerRelation)relation
{
  return self->_relation;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (BOOL)validateFullRecord
{
  v6.receiver = self;
  v6.super_class = (Class)CPLContainerRelationChange;
  if (![(CPLRecordChange *)&v6 validateFullRecord] || !self->_itemIdentifier) {
    return 0;
  }
  id v3 = [(CPLContainerRelation *)self->_relation containerIdentifier];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)description
{
  unint64_t v3 = [(CPLRecordChange *)self changeType];
  BOOL v4 = NSString;
  uint64_t v5 = objc_opt_class();
  objc_super v6 = [(CPLRecordChange *)self scopedIdentifier];
  if (v3 == 1024)
  {
    v7 = objc_msgSend((id)objc_opt_class(), "descriptionForChangeType:", -[CPLRecordChange changeType](self, "changeType"));
    v8 = [v4 stringWithFormat:@"<%@ %@ %@>", v5, v6, v7];
  }
  else
  {
    v7 = [(CPLRecordChange *)self recordModificationDate];
    objc_super v9 = objc_msgSend((id)objc_opt_class(), "descriptionForChangeType:", -[CPLRecordChange changeType](self, "changeType"));
    v10 = [(CPLContainerRelationChange *)self itemIdentifier];
    v11 = [(CPLContainerRelationChange *)self relation];
    v8 = [v4 stringWithFormat:@"<%@ %@ modified: %@ %@ %@ %@>", v5, v6, v7, v9, v10, v11];
  }
  return v8;
}

- (void)setSecondaryIdentifier:(id)a3
{
}

- (id)secondaryIdentifier
{
  return [(CPLContainerRelation *)self->_relation containerIdentifier];
}

- (void)setContainerScopedIdentifier:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  uint64_t v5 = [v22 scopeIdentifier];
  objc_super v6 = [(CPLRecordChange *)self scopedIdentifier];
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
        objc_super v9 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = NSStringFromSelector(a2);
          v11 = [(CPLRecordChange *)self scopedIdentifier];
          v12 = [v11 scopeIdentifier];
          v13 = [v22 scopeIdentifier];
          *(_DWORD *)buf = 138412802;
          char v24 = v10;
          __int16 v25 = 2112;
          v26 = v12;
          __int16 v27 = 2112;
          __int16 v28 = v13;
          _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Invalid call to %@ with mismatched scope: %@ vs. %@", buf, 0x20u);
        }
      }
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLContainerChange.m"];
      uint64_t v16 = NSStringFromSelector(a2);
      uint64_t v17 = [(CPLRecordChange *)self scopedIdentifier];
      v18 = [v17 scopeIdentifier];
      v19 = [v22 scopeIdentifier];
      [v14 handleFailureInMethod:a2, self, v15, 75, @"Invalid call to %@ with mismatched scope: %@ vs. %@", v16, v18, v19 object file lineNumber description];

      abort();
    }
  }
  v20 = [(CPLContainerRelationChange *)self relation];
  v21 = [v22 identifier];
  [v20 setContainerIdentifier:v21];
}

- (id)containerScopedIdentifier
{
  unint64_t v3 = [(CPLContainerRelationChange *)self relation];
  BOOL v4 = [v3 containerIdentifier];

  if (v4)
  {
    uint64_t v5 = [CPLScopedIdentifier alloc];
    objc_super v6 = [(CPLRecordChange *)self scopedIdentifier];
    id v7 = [(CPLScopedIdentifier *)v5 initRelativeToScopedIdentifier:v6 identifier:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)setItemScopedIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  uint64_t v5 = [v21 scopeIdentifier];
  objc_super v6 = [(CPLRecordChange *)self scopedIdentifier];
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
        objc_super v9 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = NSStringFromSelector(a2);
          v11 = [(CPLRecordChange *)self scopedIdentifier];
          v12 = [v11 scopeIdentifier];
          v13 = [v21 scopeIdentifier];
          *(_DWORD *)buf = 138412802;
          v23 = v10;
          __int16 v24 = 2112;
          __int16 v25 = v12;
          __int16 v26 = 2112;
          __int16 v27 = v13;
          _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Invalid call to %@ with mismatched scope: %@ vs. %@", buf, 0x20u);
        }
      }
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLContainerChange.m"];
      uint64_t v16 = NSStringFromSelector(a2);
      uint64_t v17 = [(CPLRecordChange *)self scopedIdentifier];
      v18 = [v17 scopeIdentifier];
      v19 = [v21 scopeIdentifier];
      [v14 handleFailureInMethod:a2, self, v15, 66, @"Invalid call to %@ with mismatched scope: %@ vs. %@", v16, v18, v19 object file lineNumber description];

      abort();
    }
  }
  v20 = [v21 identifier];
  [(CPLContainerRelationChange *)self setItemIdentifier:v20];
}

- (id)itemScopedIdentifier
{
  unint64_t v3 = [(CPLContainerRelationChange *)self itemIdentifier];
  if (v3)
  {
    BOOL v4 = [CPLScopedIdentifier alloc];
    uint64_t v5 = [(CPLRecordChange *)self scopedIdentifier];
    id v6 = [(CPLScopedIdentifier *)v4 initRelativeToScopedIdentifier:v5 identifier:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsDirectDeletion
{
  return 1;
}

+ (BOOL)supportsDeletion
{
  return 1;
}

+ (BOOL)shouldReallyQuarantineRecord
{
  return 0;
}

+ (id)relationWithItemScopedIdentifier:(id)a3 containerIdentifier:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 relationToContainerWithIdentifier:a4];
  char v8 = [v7 proposedScopedIdentifierForItemScopedIdentifier:v6];
  objc_super v9 = (void *)[a1 newRecordWithScopedIdentifier:v8];

  v10 = [v6 identifier];

  [v9 setItemIdentifier:v10];
  [v9 setRelation:v7];

  return v9;
}

+ (id)relationToContainerWithIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_alloc_init(CPLContainerRelation);
  [(CPLContainerRelation *)v4 setContainerIdentifier:v3];

  return v4;
}

+ (Class)relatedRecordClass
{
  return (Class)objc_opt_class();
}

@end