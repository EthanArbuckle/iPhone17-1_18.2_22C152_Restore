@interface MSASPendingChanges
- (BOOL)hasPendingChanges;
- (MSASPendingChanges)initWithSyncedKeyValueChangesForAlbumGUIDS:(id)a3 albumChanges:(id)a4 accessControlChangesForAlbumGUIDS:(id)a5;
- (NSMutableDictionary)pendingAlbumGUIDToAssetCollections;
- (NSMutableSet)pendingAlbumChanges;
- (NSMutableSet)pendingAlbumGUIDsWithKeyValueChanges;
- (NSMutableSet)pendingAlbumGUIDsWithSharingInfoChanges;
- (void)addPendingAssetCollectionChanges:(id)a3 forAlbumGUID:(id)a4;
- (void)addPendingChangesForAlbumGUID:(id)a3;
- (void)removePendingAssetCollection:(id)a3 forAlbumGUID:(id)a4;
- (void)removePendingChangesForAlbumGUID:(id)a3;
- (void)removePendingKeyValueChangesForAlbumGUID:(id)a3;
- (void)removePendingSharingInfoChangesForAlbumGUID:(id)a3;
- (void)setPendingAlbumChanges:(id)a3;
- (void)setPendingAlbumGUIDToAssetCollections:(id)a3;
- (void)setPendingAlbumGUIDsWithKeyValueChanges:(id)a3;
- (void)setPendingAlbumGUIDsWithSharingInfoChanges:(id)a3;
@end

@implementation MSASPendingChanges

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAlbumGUIDToAssetCollections, 0);
  objc_storeStrong((id *)&self->_pendingAlbumGUIDsWithSharingInfoChanges, 0);
  objc_storeStrong((id *)&self->_pendingAlbumChanges, 0);
  objc_storeStrong((id *)&self->_pendingAlbumGUIDsWithKeyValueChanges, 0);
}

- (void)setPendingAlbumGUIDToAssetCollections:(id)a3
{
}

- (NSMutableDictionary)pendingAlbumGUIDToAssetCollections
{
  return self->_pendingAlbumGUIDToAssetCollections;
}

- (void)setPendingAlbumGUIDsWithSharingInfoChanges:(id)a3
{
}

- (NSMutableSet)pendingAlbumGUIDsWithSharingInfoChanges
{
  return self->_pendingAlbumGUIDsWithSharingInfoChanges;
}

- (void)setPendingAlbumChanges:(id)a3
{
}

- (NSMutableSet)pendingAlbumChanges
{
  return self->_pendingAlbumChanges;
}

- (void)setPendingAlbumGUIDsWithKeyValueChanges:(id)a3
{
}

- (NSMutableSet)pendingAlbumGUIDsWithKeyValueChanges
{
  return self->_pendingAlbumGUIDsWithKeyValueChanges;
}

- (BOOL)hasPendingChanges
{
  return [(NSMutableSet *)self->_pendingAlbumGUIDsWithKeyValueChanges count]
      || [(NSMutableSet *)self->_pendingAlbumChanges count]
      || [(NSMutableSet *)self->_pendingAlbumGUIDsWithSharingInfoChanges count]
      || [(NSMutableDictionary *)self->_pendingAlbumGUIDToAssetCollections count] != 0;
}

- (void)removePendingSharingInfoChangesForAlbumGUID:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(NSMutableSet *)self->_pendingAlbumGUIDsWithSharingInfoChanges removeObject:v4];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not remove pending sharing info changes for album with nil GUID.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)removePendingAssetCollection:(id)a3 forAlbumGUID:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  pendingAlbumGUIDToAssetCollections = self->_pendingAlbumGUIDToAssetCollections;
  id v8 = a3;
  v9 = [(NSMutableDictionary *)pendingAlbumGUIDToAssetCollections objectForKey:v6];
  v10 = [v8 GUID];

  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543362;
      v14 = self;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not remove pending asset collection with nil GUID.", (uint8_t *)&v13, 0xCu);
      if (!v6) {
        goto LABEL_10;
      }
    }
    else if (!v6)
    {
      goto LABEL_10;
    }
LABEL_6:
    uint64_t v11 = [v9 count];
    v12 = self->_pendingAlbumGUIDToAssetCollections;
    if (v11) {
      [(NSMutableDictionary *)v12 setObject:v9 forKey:v6];
    }
    else {
      [(NSMutableDictionary *)v12 removeObjectForKey:v6];
    }
    goto LABEL_12;
  }
  [v9 removeObject:v10];
  if (v6) {
    goto LABEL_6;
  }
LABEL_10:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v13 = 138543362;
    v14 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not remove pending asset collections for album with nil GUID.", (uint8_t *)&v13, 0xCu);
  }
LABEL_12:
}

- (void)addPendingAssetCollectionChanges:(id)a3 forAlbumGUID:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_pendingAlbumGUIDToAssetCollections objectForKey:v7];
  if (!v8)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__MSASPendingChanges_addPendingAssetCollectionChanges_forAlbumGUID___block_invoke;
  v10[3] = &unk_1E6C3DB50;
  id v11 = v8;
  id v9 = v8;
  [v6 enumerateObjectsUsingBlock:v10];
  if (v7)
  {
    [(NSMutableDictionary *)self->_pendingAlbumGUIDToAssetCollections setObject:v9 forKey:v7];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v13 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not add pending asset collection changes for album with nil GUID.", buf, 0xCu);
  }
}

void __68__MSASPendingChanges_addPendingAssetCollectionChanges_forAlbumGUID___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 GUID];
  [v2 addObject:v3];
}

- (void)removePendingChangesForAlbumGUID:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(NSMutableSet *)self->_pendingAlbumChanges removeObject:v4];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not remove pending changes for album with nil GUID.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)addPendingChangesForAlbumGUID:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(NSMutableSet *)self->_pendingAlbumChanges addObject:v4];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not add pending changes for album with nil GUID.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)removePendingKeyValueChangesForAlbumGUID:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(NSMutableSet *)self->_pendingAlbumGUIDsWithKeyValueChanges removeObject:v4];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not remove pending key value changes for album with nil GUID.", (uint8_t *)&v5, 0xCu);
  }
}

- (MSASPendingChanges)initWithSyncedKeyValueChangesForAlbumGUIDS:(id)a3 albumChanges:(id)a4 accessControlChangesForAlbumGUIDS:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MSASPendingChanges;
  id v11 = [(MSASPendingChanges *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA80] setWithArray:v8];
    pendingAlbumGUIDsWithKeyValueChanges = v11->_pendingAlbumGUIDsWithKeyValueChanges;
    v11->_pendingAlbumGUIDsWithKeyValueChanges = (NSMutableSet *)v12;

    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v9, "count"));
    pendingAlbumChanges = v11->_pendingAlbumChanges;
    v11->_pendingAlbumChanges = (NSMutableSet *)v14;

    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
    pendingAlbumGUIDToAssetCollections = v11->_pendingAlbumGUIDToAssetCollections;
    v11->_pendingAlbumGUIDToAssetCollections = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA80] setWithArray:v10];
    pendingAlbumGUIDsWithSharingInfoChanges = v11->_pendingAlbumGUIDsWithSharingInfoChanges;
    v11->_pendingAlbumGUIDsWithSharingInfoChanges = (NSMutableSet *)v18;
  }
  return v11;
}

@end