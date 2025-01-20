@interface CPLChangeStorage
- (BOOL)getRelatedScopedIdentifier:(id *)a3 forRecordWithScopedIdentifier:(id)a4;
- (BOOL)getStoredChangeType:(unint64_t *)a3 forRecordWithScopedIdentifier:(id)a4;
- (BOOL)hasChangesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (NSString)storageDescription;
- (id)changeWithScopedIdentifier:(id)a3;
- (id)changesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
@end

@implementation CPLChangeStorage

- (BOOL)hasChangesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = -[CPLChangeStorage changesWithRelatedScopedIdentifier:class:](self, "changesWithRelatedScopedIdentifier:class:", a3, a4, 0, 0, 0, 0, 0, 0, 0, 0);
  BOOL v5 = [v4 countByEnumeratingWithState:&v7 objects:v8 count:16] != 0;

  return v5;
}

- (BOOL)getStoredChangeType:(unint64_t *)a3 forRecordWithScopedIdentifier:(id)a4
{
  BOOL v5 = [(CPLChangeStorage *)self changeWithScopedIdentifier:a4];
  v6 = v5;
  if (v5) {
    *a3 = [v5 changeType];
  }

  return v6 != 0;
}

- (BOOL)getRelatedScopedIdentifier:(id *)a3 forRecordWithScopedIdentifier:(id)a4
{
  BOOL v5 = [(CPLChangeStorage *)self changeWithScopedIdentifier:a4];
  v6 = v5;
  if (v5)
  {
    if ([v5 isDelete])
    {
      id v7 = 0;
LABEL_6:
      *a3 = v7;
      goto LABEL_7;
    }
    if ([v6 hasChangeType:2])
    {
      id v7 = [v6 relatedScopedIdentifier];
      goto LABEL_6;
    }
  }
LABEL_7:

  return v6 != 0;
}

- (NSString)storageDescription
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  BOOL v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLChangedRecordStorageView.m"];
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 28, @"%@ should be implemented by subclasses", v6 object file lineNumber description];

  abort();
}

- (id)changesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28B00] currentHandler];
  v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLChangedRecordStorageView.m"];
  uint64_t v9 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, v8, 23, @"%@ should be implemented by subclasses", v9 object file lineNumber description];

  abort();
}

- (id)changeWithScopedIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLChangedRecordStorageView.m"];
  v8 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 18, @"%@ should be implemented by subclasses", v8 object file lineNumber description];

  abort();
}

@end