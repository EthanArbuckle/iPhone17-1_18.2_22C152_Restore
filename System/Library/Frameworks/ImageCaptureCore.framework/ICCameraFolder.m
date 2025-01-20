@interface ICCameraFolder
- (BOOL)hasThumbnail;
- (CGImage)thumbnailIfAvailable;
- (ICCameraFolder)initWithName:(id)a3 parentFolder:(id)a4 device:(id)a5;
- (NSArray)contents;
- (NSMutableArray)files;
- (NSMutableArray)folders;
- (NSString)mediaItemType;
- (id)description;
- (id)getFileWithID:(unint64_t)a3;
- (id)getFolderWithID:(unint64_t)a3;
- (id)metadataIfAvailable;
- (id)valueForUndefinedKey:(id)a3;
- (os_unfair_lock_s)folderMediaLock;
- (void)addFile:(id)a3;
- (void)addFolder:(id)a3;
- (void)dealloc;
- (void)deleteFile:(id)a3;
- (void)deleteFileWithID:(unint64_t)a3;
- (void)deleteFolder:(id)a3;
- (void)deleteFolderWithID:(unint64_t)a3;
- (void)deleteItem:(id)a3;
- (void)setFiles:(id)a3;
- (void)setFolderMediaLock:(os_unfair_lock_s)a3;
- (void)setFolders:(id)a3;
@end

@implementation ICCameraFolder

- (NSString)mediaItemType
{
  return (NSString *)@"folder";
}

- (ICCameraFolder)initWithName:(id)a3 parentFolder:(id)a4 device:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)ICCameraFolder;
  v5 = [(ICCameraItem *)&v11 initWithName:a3 parentFolder:a4 device:a5];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    [(ICCameraFolder *)v5 setFiles:v6];

    v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    [(ICCameraFolder *)v5 setFolders:v7];

    v8 = [(id)*MEMORY[0x1E4F443C8] identifier];
    [(ICCameraItem *)v5 setUTI:v8];

    [(ICCameraItem *)v5 setThumbnailState:8];
    [(ICCameraItem *)v5 setMetadataState:8];
    [(ICCameraFolder *)v5 setFolderMediaLock:0];
    v9 = v5;
  }

  return v5;
}

- (void)dealloc
{
  p_folderMediaLock = &self->_folderMediaLock;
  os_unfair_lock_lock(&self->_folderMediaLock);
  files = self->_files;
  self->_files = 0;

  folders = self->_folders;
  self->_folders = 0;

  os_unfair_lock_unlock(p_folderMediaLock);
  v6.receiver = self;
  v6.super_class = (Class)ICCameraFolder;
  [(ICCameraFolder *)&v6 dealloc];
}

- (id)description
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = [(ICCameraFolder *)self files];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    LODWORD(v6) = 0;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = [*(id *)(*((void *)&v18 + 1) + 8 * i) sidecarFiles];
        uint64_t v6 = [v9 count] + v6 + 1;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
    uint64_t v10 = v6;
  }
  else
  {
    uint64_t v10 = 0;
  }

  objc_super v11 = NSString;
  id v12 = [(ICCameraItem *)self name];
  uint64_t v13 = [v12 UTF8String];
  unint64_t v14 = [(ICCameraItem *)self objectID];
  v15 = [(ICCameraFolder *)self folders];
  v16 = objc_msgSend(v11, "stringWithFormat:", @"🔶 [%10s ID:%6lu]➡[%8s:%6u][%8s:%6lu]", v13, v14, "Files", v10, "Folders", objc_msgSend(v15, "count"));

  return v16;
}

- (void)addFile:(id)a3
{
  p_folderMediaLock = &self->_folderMediaLock;
  id v5 = a3;
  os_unfair_lock_lock(p_folderMediaLock);
  [(NSMutableArray *)self->_files addObject:v5];

  os_unfair_lock_unlock(p_folderMediaLock);
}

- (void)addFolder:(id)a3
{
  p_folderMediaLock = &self->_folderMediaLock;
  id v5 = a3;
  os_unfair_lock_lock(p_folderMediaLock);
  [(NSMutableArray *)self->_folders addObject:v5];

  os_unfair_lock_unlock(p_folderMediaLock);
}

- (void)deleteItem:(id)a3
{
  p_folderMediaLock = &self->_folderMediaLock;
  id v5 = a3;
  os_unfair_lock_lock(p_folderMediaLock);
  uint64_t v6 = [v5 UTI];
  uint64_t v7 = [(id)*MEMORY[0x1E4F443C8] identifier];
  int v8 = [v6 isEqualToString:v7];

  v9 = &OBJC_IVAR___ICCameraFolder__files;
  if (v8) {
    v9 = &OBJC_IVAR___ICCameraFolder__folders;
  }
  [*(id *)((char *)&self->super.super.isa + *v9) removeObject:v5];

  os_unfair_lock_unlock(p_folderMediaLock);
}

- (void)deleteFile:(id)a3
{
  p_folderMediaLock = &self->_folderMediaLock;
  id v5 = a3;
  os_unfair_lock_lock(p_folderMediaLock);
  [(NSMutableArray *)self->_files removeObject:v5];

  os_unfair_lock_unlock(p_folderMediaLock);
}

- (void)deleteFolder:(id)a3
{
  p_folderMediaLock = &self->_folderMediaLock;
  id v5 = a3;
  os_unfair_lock_lock(p_folderMediaLock);
  [(NSMutableArray *)self->_folders removeObject:v5];

  os_unfair_lock_unlock(p_folderMediaLock);
}

- (NSArray)contents
{
  p_folderMediaLock = &self->_folderMediaLock;
  os_unfair_lock_lock(&self->_folderMediaLock);
  uint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_folders];
  [v4 addObjectsFromArray:self->_files];
  os_unfair_lock_unlock(p_folderMediaLock);

  return (NSArray *)v4;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"children"])
  {
    uint64_t v5 = [(ICCameraFolder *)self contents];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ICCameraFolder;
    uint64_t v5 = [(ICCameraItem *)&v8 valueForUndefinedKey:v4];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (NSMutableArray)files
{
  p_folderMediaLock = &self->_folderMediaLock;
  os_unfair_lock_lock(&self->_folderMediaLock);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithArray:self->_files];
  os_unfair_lock_unlock(p_folderMediaLock);

  return (NSMutableArray *)v4;
}

- (void)setFiles:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock(&self->_folderMediaLock);
  files = self->_files;
  self->_files = v4;

  os_unfair_lock_unlock(&self->_folderMediaLock);
}

- (NSMutableArray)folders
{
  p_folderMediaLock = &self->_folderMediaLock;
  os_unfair_lock_lock(&self->_folderMediaLock);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithArray:self->_folders];
  os_unfair_lock_unlock(p_folderMediaLock);

  return (NSMutableArray *)v4;
}

- (void)setFolders:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock(&self->_folderMediaLock);
  folders = self->_folders;
  self->_folders = v4;

  os_unfair_lock_unlock(&self->_folderMediaLock);
}

- (BOOL)hasThumbnail
{
  return 1;
}

- (void)deleteFolderWithID:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_folderMediaLock = &self->_folderMediaLock;
  os_unfair_lock_lock(&self->_folderMediaLock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = self->_folders;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = 0;
    uint64_t v10 = *(void *)v14;
LABEL_3:
    uint64_t v11 = 0;
    id v12 = v9;
    while (1)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(v6);
      }
      v9 = (NSMutableArray *)*(id *)(*((void *)&v13 + 1) + 8 * v11);

      if ([(NSMutableArray *)v9 objectID] == a3) {
        break;
      }
      ++v11;
      id v12 = v9;
      if (v8 == v11)
      {
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }

        goto LABEL_12;
      }
    }

    if (!v9) {
      goto LABEL_13;
    }
    [(NSMutableArray *)self->_folders removeObject:v9];
    uint64_t v6 = v9;
  }
LABEL_12:

LABEL_13:
  os_unfair_lock_unlock(p_folderMediaLock);
}

- (void)deleteFileWithID:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_folderMediaLock = &self->_folderMediaLock;
  os_unfair_lock_lock(&self->_folderMediaLock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = self->_files;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = 0;
    uint64_t v10 = *(void *)v14;
LABEL_3:
    uint64_t v11 = 0;
    id v12 = v9;
    while (1)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(v6);
      }
      v9 = (NSMutableArray *)*(id *)(*((void *)&v13 + 1) + 8 * v11);

      if ([(NSMutableArray *)v9 objectID] == a3) {
        break;
      }
      ++v11;
      id v12 = v9;
      if (v8 == v11)
      {
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }

        goto LABEL_12;
      }
    }

    if (!v9) {
      goto LABEL_13;
    }
    [(NSMutableArray *)self->_files removeObject:v9];
    uint64_t v6 = v9;
  }
LABEL_12:

LABEL_13:
  os_unfair_lock_unlock(p_folderMediaLock);
}

- (id)getFolderWithID:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(ICCameraItem *)self objectID] != a3 || (uint64_t v5 = self) == 0)
  {
    [(ICCameraFolder *)self folders];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "getFolderWithID:", a3, (void)v13);
          if (v11)
          {
            uint64_t v5 = (ICCameraFolder *)v11;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    uint64_t v5 = 0;
LABEL_13:
  }

  return v5;
}

- (id)getFileWithID:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [(ICCameraFolder *)self files];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
      if ([v10 objectID] == a3) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v10;

    if (v11) {
      goto LABEL_22;
    }
  }
  else
  {
LABEL_9:
  }
  [(ICCameraFolder *)self folders];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "getFileWithID:", a3, (void)v19);
        if (v17)
        {
          id v11 = (id)v17;
          goto LABEL_21;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_21:

LABEL_22:

  return v11;
}

- (CGImage)thumbnailIfAvailable
{
  return 0;
}

- (id)metadataIfAvailable
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (os_unfair_lock_s)folderMediaLock
{
  return self->_folderMediaLock;
}

- (void)setFolderMediaLock:(os_unfair_lock_s)a3
{
  self->_folderMediaLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folders, 0);

  objc_storeStrong((id *)&self->_files, 0);
}

@end