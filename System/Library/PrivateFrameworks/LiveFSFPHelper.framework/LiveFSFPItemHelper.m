@interface LiveFSFPItemHelper
+ (id)UTIForExtension:(id)a3 liType:(int)a4;
+ (id)newItemForFH:(id)a3 withReference:(int)a4 name:(id)a5 parent:(id)a6 type:(int)a7 attrs:(id)a8 extension:(id)a9;
+ (int)dt_dir;
+ (int)dt_examine;
+ (int)dt_lnk;
+ (int)dt_reg;
- (BOOL)_fetchXattrValues;
- (BOOL)calcNumberOfChildren:(id *)a3;
- (BOOL)ensureFileHandleOrError:(id *)a3;
- (BOOL)isDirectory;
- (BOOL)isDocument;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (BOOL)isSymlink;
- (BOOL)isTrashed;
- (LiveFSFPEnumeratorDataContainer)container;
- (LiveFSFPExtensionHelper)extension;
- (LiveFSFPItemHelper)parent;
- (NSData)tagData;
- (NSData)versionIdentifier;
- (NSDate)contentModificationDate;
- (NSDate)creationDate;
- (NSDate)lastUsedDate;
- (NSMapTable)itemNameCache;
- (NSNumber)childItemCount;
- (NSNumber)documentSize;
- (NSNumber)favoriteRank;
- (NSString)description;
- (NSString)fh;
- (NSString)filename;
- (NSString)fp_domainIdentifier;
- (NSString)fp_parentDomainIdentifier;
- (NSString)fullPath;
- (NSString)itemIdentifier;
- (NSString)parentItemIdentifier;
- (NSString)path;
- (NSString)typeIdentifier;
- (id)initItemForFH:(id)a3 withReference:(int)a4 name:(id)a5 parent:(id)a6 type:(int)a7 attrs:(id)a8 extension:(id)a9;
- (id)lastUsedTime;
- (id)pathExtension;
- (int)liType;
- (int)refreshAttrsHasAProblem:(id *)a3;
- (int64_t)attr_load;
- (unint64_t)capabilities;
- (unint64_t)inodeNum;
- (void)_fetchFavoriteRank:(id)a3 completionHandler:(id)a4;
- (void)_fetchLastUsedDateWithProxy:(id)a3 completionHandler:(id)a4;
- (void)_fetchTagDataWithProxy:(id)a3 completionHandler:(id)a4;
- (void)_fetchXattrNamed:(id)a3 proxy:(id)a4 completionHandler:(id)a5;
- (void)afterRename:(id)a3 performBlock:(id)a4;
- (void)capabilities;
- (void)childItemCount;
- (void)contentModificationDate;
- (void)creationDate;
- (void)dealloc;
- (void)doDealloc;
- (void)dropAfterRenameBlockForName:(id)a3;
- (void)fullPath;
- (void)isHidden;
- (void)lastUsedTime;
- (void)parentItemIdentifier;
- (void)pathExtension;
- (void)performBlocksForRename:(id)a3 onEHQueue:(BOOL)a4;
- (void)recursivelyReparentChildren;
- (void)recursivelySetChildrenDeleted;
- (void)resetFileHandle;
- (void)setAttr_load:(int64_t)a3;
- (void)setAttributes:(id)a3 time:(int64_t)a4;
- (void)setAttributesLocked:(id)a3 time:(int64_t)a4;
- (void)setAttributesStale;
- (void)setContainer:(id)a3;
- (void)setExtension:(id)a3;
- (void)setFavoriteRank:(id)a3;
- (void)setInodeNum:(unint64_t)a3;
- (void)setItemDeleted;
- (void)setItemNameCache:(id)a3;
- (void)setLastUsedDate:(id)a3;
- (void)setLiType:(int)a3;
- (void)setNewParent:(id)a3 andName:(id)a4;
- (void)setParent:(id)a3;
- (void)setTagData:(id)a3;
- (void)typeIdentifier;
@end

@implementation LiveFSFPItemHelper

+ (int)dt_dir
{
  return 2;
}

+ (int)dt_reg
{
  return 1;
}

+ (int)dt_lnk
{
  return 3;
}

+ (int)dt_examine
{
  return -1;
}

- (NSString)fullPath
{
  fullPath = self->_fullPath;
  if (!fullPath)
  {
    v4 = [(LiveFSFPExtensionHelper *)self->_extension mountPath];
    v5 = [v4 path];
    v6 = [v5 stringByAppendingPathComponent:self->_path];
    v7 = self->_fullPath;
    self->_fullPath = v6;

    fullPath = self->_fullPath;
    if (!fullPath)
    {
      v8 = livefs_std_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[LiveFSFPItemHelper fullPath]();
      }

      fullPath = self->_fullPath;
    }
  }
  return fullPath;
}

- (id)initItemForFH:(id)a3 withReference:(int)a4 name:(id)a5 parent:(id)a6 type:(int)a7 attrs:(id)a8 extension:(id)a9
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v57 = a3;
  id v55 = a5;
  id v56 = a6;
  id v16 = a8;
  id v17 = a9;
  v18 = livefs_std_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSFPItemHelper initItemForFH:withReference:name:parent:type:attrs:extension:](v18, v19, v20, v21, v22, v23, v24, v25);
  }

  v58.receiver = self;
  v58.super_class = (Class)LiveFSFPItemHelper;
  v26 = [(LiveFSFPItemHelper *)&v58 init];
  v27 = v17;
  if (!v26) {
    goto LABEL_38;
  }
  if (a7 != -1 || v16)
  {
    int v54 = [v17 idsPersist];
    objc_storeStrong((id *)&v26->_extension, a9);
    if (a4) {
      v30 = v57;
    }
    else {
      v30 = 0;
    }
    objc_storeStrong((id *)&v26->_fh, v30);
    v26->_int liType = a7;
    objc_storeStrong((id *)&v26->_parent, a6);
    v26->numChildren = -1;
    fullPath = v26->_fullPath;
    v26->_fullPath = 0;

    if (v56)
    {
      objc_storeStrong((id *)&v26->_filename, a5);
      v32 = [v56 itemIdentifier];
      v33 = (void *)*MEMORY[0x263F053F0];

      if (v32 == v33)
      {
        v39 = (NSString *)v55;
        path = v26->_path;
        v26->_path = v39;
      }
      else
      {
        path = [v56 path];
        uint64_t v35 = [path stringByAppendingPathComponent:v55];
        v36 = v26->_path;
        v26->_path = (NSString *)v35;
      }
      int v38 = v54;

      if (v54)
      {
        objc_msgSend(MEMORY[0x263F52288], "identifierForItem:name:parentID:", 0, v55, objc_msgSend(v56, "inodeNum"));
        v40 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v40 = v26->_path;
      }
      itemIdentifier = v26->_itemIdentifier;
      v26->_itemIdentifier = v40;

      v37 = livefs_std_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        filename = v26->_filename;
        v42 = v26->_itemIdentifier;
        v44 = v26->_path;
        *(_DWORD *)buf = 138412802;
        v60 = v42;
        __int16 v61 = 2112;
        v62 = filename;
        __int16 v63 = 2112;
        v64 = v44;
        _os_log_impl(&dword_22CE49000, v37, OS_LOG_TYPE_DEFAULT, "Created Item ID %@ name '%@', path '%@'", buf, 0x20u);
      }
    }
    else
    {
      objc_storeStrong((id *)&v26->_itemIdentifier, (id)*MEMORY[0x263F053F0]);
      objc_storeStrong((id *)&v26->_fh, a3);
      objc_storeStrong((id *)&v26->_filename, a5);
      v37 = v26->_path;
      v26->_path = (NSString *)&stru_26E048A08;
      int v38 = v54;
    }

    [v17 addItem:v26 identifier:v26->_itemIdentifier fileHandle:v26->_fh];
    if (v16)
    {
      v26->_attr_load = time(0);
      id v45 = v16;
      v46 = (const void *)[v45 bytes];
      unint64_t v47 = [v45 length];
      if (v47 >= 0xB8) {
        size_t v48 = 184;
      }
      else {
        size_t v48 = v47;
      }
      memcpy(&v26->attributes, v46, v48);
      if (v38)
      {
        if ((v26->attributes.fa_validmask & 0x100) != 0)
        {
          v26->_inodeNum = v26->attributes.fa_fileid;
        }
        else
        {
          v49 = livefs_std_log();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
            -[LiveFSFPItemHelper initItemForFH:withReference:name:parent:type:attrs:extension:]();
          }
        }
      }
      int liType = v26->_liType;
      v27 = v17;
      if (liType == -1)
      {
        int liType = v26->attributes.fa_type;
        if ((liType - 1) > 2) {
          goto LABEL_37;
        }
        v26->_int liType = liType;
      }
    }
    else
    {
      v26->_attr_load = -1;
      int liType = v26->_liType;
    }
    if ((liType | 2) == 3)
    {
LABEL_38:
      v29 = v26;
      goto LABEL_39;
    }
LABEL_37:
    uint64_t v51 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    itemNameCache = v26->_itemNameCache;
    v26->_itemNameCache = (NSMapTable *)v51;

    goto LABEL_38;
  }
  v28 = livefs_std_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[LiveFSFPItemHelper initItemForFH:withReference:name:parent:type:attrs:extension:](v28);
  }

  v29 = 0;
LABEL_39:

  return v29;
}

- (void)doDealloc
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_22CE49000, v0, OS_LOG_TYPE_DEBUG, "%s starting in ID %@ fh %@", (uint8_t *)v1, 0x20u);
}

- (void)dealloc
{
  [(LiveFSFPItemHelper *)self doDealloc];
  v3.receiver = self;
  v3.super_class = (Class)LiveFSFPItemHelper;
  [(LiveFSFPItemHelper *)&v3 dealloc];
}

+ (id)newItemForFH:(id)a3 withReference:(int)a4 name:(id)a5 parent:(id)a6 type:(int)a7 attrs:(id)a8 extension:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v13 = *(void *)&a4;
  id v16 = a9;
  id v17 = a8;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  uint64_t v21 = (void *)[objc_alloc((Class)a1) initItemForFH:v20 withReference:v13 name:v19 parent:v18 type:v10 attrs:v17 extension:v16];

  return v21;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)LiveFSFPItemHelper;
  v4 = [(LiveFSFPItemHelper *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ ID '%@' name '%@' fh '%@'", v4, self->_itemIdentifier, self->_filename, self->_fh];

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    itemIdentifier = self->_itemIdentifier;
    v6 = [v4 itemIdentifier];
    BOOL v7 = [(NSString *)itemIdentifier isEqualToString:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)ensureFileHandleOrError:(id *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (!self->_fh)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__2;
    v27 = __Block_byref_object_dispose__2;
    id v28 = 0;
    if (self->_itemIdentifier == (NSString *)*MEMORY[0x263F053F0])
    {
      v8 = [(LiveFSFPExtensionHelper *)self->_extension conn];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke;
      v23[3] = &unk_264934180;
      v23[4] = &buf;
      v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v23];

      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_2;
      v22[3] = &unk_264934690;
      v22[4] = self;
      v22[5] = &buf;
      [v9 getRootFileHandleWithError:v22];
      uint64_t v10 = *(void **)(*((void *)&buf + 1) + 40);
      if (v10)
      {
        if (a3) {
          *a3 = v10;
        }
        BOOL v4 = 1;
        goto LABEL_21;
      }
      fh = self->_fh;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_3;
      v21[3] = &unk_2649346B8;
      v21[4] = self;
      v21[5] = &buf;
      [v9 fileAttributes:fh requestID:-1 reply:v21];
      if (!a3)
      {
        if ([(LiveFSFPExtensionHelper *)self->_extension idsPersist])
        {
          if ((self->attributes.fa_validmask & 0x100) != 0)
          {
            self->_inodeNum = self->attributes.fa_fileid;
          }
          else
          {
            id v18 = livefs_std_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
              -[LiveFSFPItemHelper initItemForFH:withReference:name:parent:type:attrs:extension:]();
            }
          }
        }
        goto LABEL_20;
      }
      id v14 = *(id *)(*((void *)&buf + 1) + 40);
    }
    else
    {
      BOOL v7 = [(LiveFSFPItemHelper *)self->_parent fh];
      if (v7)
      {
      }
      else if ([(LiveFSFPItemHelper *)self->_parent ensureFileHandleOrError:a3])
      {
        BOOL v4 = 1;
LABEL_22:
        _Block_object_dispose(&buf, 8);

        return v4;
      }
      v11 = [(LiveFSFPExtensionHelper *)self->_extension conn];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_16;
      v20[3] = &unk_264934180;
      v20[4] = &buf;
      v9 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v20];

      v12 = [(LiveFSFPItemHelper *)self->_parent fh];
      filename = self->_filename;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_2_17;
      v19[3] = &unk_2649346E0;
      v19[4] = self;
      v19[5] = &buf;
      [v9 lookupIn:v12 name:filename usingFlags:0 requestID:-1 reply:v19];

      if (!a3)
      {
        v15 = self->_extension;
        objc_sync_enter(v15);
        [(LiveFSFPExtensionHelper *)self->_extension addFileHandle:self->_fh toItem:self];
        objc_sync_exit(v15);

LABEL_20:
        BOOL v4 = *(void *)(*((void *)&buf + 1) + 40) != 0;
LABEL_21:

        goto LABEL_22;
      }
      id v14 = *(id *)(*((void *)&buf + 1) + 40);
    }
    *a3 = v14;
    goto LABEL_20;
  }
  objc_super v3 = livefs_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[LiveFSFPItemHelper ensureFileHandleOrError:]";
    _os_log_impl(&dword_22CE49000, v3, OS_LOG_TYPE_DEFAULT, "%s: exiting as already have the filehandle", (uint8_t *)&buf, 0xCu);
  }

  return 0;
}

void __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke(uint64_t a1, void *a2)
{
}

void __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  BOOL v7 = *(void **)(v6 + 304);
  *(void *)(v6 + 304) = v5;
}

void __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v19 = a3;
  if (a2)
  {
    uint64_t v5 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:a2];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 288) = time(0);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [v19 bytes];
    long long v10 = *(_OWORD *)(v9 + 32);
    long long v11 = *(_OWORD *)(v9 + 48);
    long long v12 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)(v8 + 8) = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 56) = v11;
    *(_OWORD *)(v8 + 40) = v10;
    *(_OWORD *)(v8 + 24) = v12;
    long long v13 = *(_OWORD *)(v9 + 96);
    long long v14 = *(_OWORD *)(v9 + 112);
    long long v15 = *(_OWORD *)(v9 + 80);
    *(_OWORD *)(v8 + 72) = *(_OWORD *)(v9 + 64);
    *(_OWORD *)(v8 + 120) = v14;
    *(_OWORD *)(v8 + 104) = v13;
    *(_OWORD *)(v8 + 88) = v15;
    long long v17 = *(_OWORD *)(v9 + 144);
    long long v16 = *(_OWORD *)(v9 + 160);
    uint64_t v18 = *(void *)(v9 + 176);
    *(_OWORD *)(v8 + 136) = *(_OWORD *)(v9 + 128);
    *(void *)(v8 + 184) = v18;
    *(_OWORD *)(v8 + 168) = v16;
    *(_OWORD *)(v8 + 152) = v17;
  }
}

void __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_16(uint64_t a1, void *a2)
{
}

void __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_2_17(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  if (a2)
  {
    uint64_t v24 = a2;
LABEL_9:
    uint64_t v37 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:v24];
    uint64_t v38 = *(void *)(*(void *)(a1 + 40) + 8);
    v39 = *(void **)(v38 + 40);
    *(void *)(v38 + 40) = v37;

    goto LABEL_10;
  }
  if (!v17 || !v18)
  {
    v36 = livefs_std_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
      __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_2_17_cold_1((uint64_t)v17, (uint64_t)v18, v36);
    }

    uint64_t v24 = 14;
    goto LABEL_9;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 304), a4);
  *(void *)(*(void *)(a1 + 32) + 288) = time(0);
  uint64_t v25 = *(void *)(a1 + 32);
  uint64_t v26 = [v18 bytes];
  long long v27 = *(_OWORD *)(v26 + 32);
  long long v28 = *(_OWORD *)(v26 + 48);
  long long v29 = *(_OWORD *)(v26 + 16);
  *(_OWORD *)(v25 + 8) = *(_OWORD *)v26;
  *(_OWORD *)(v25 + 56) = v28;
  *(_OWORD *)(v25 + 40) = v27;
  *(_OWORD *)(v25 + 24) = v29;
  long long v30 = *(_OWORD *)(v26 + 96);
  long long v31 = *(_OWORD *)(v26 + 112);
  long long v32 = *(_OWORD *)(v26 + 80);
  *(_OWORD *)(v25 + 72) = *(_OWORD *)(v26 + 64);
  *(_OWORD *)(v25 + 120) = v31;
  *(_OWORD *)(v25 + 104) = v30;
  *(_OWORD *)(v25 + 88) = v32;
  long long v34 = *(_OWORD *)(v26 + 144);
  long long v33 = *(_OWORD *)(v26 + 160);
  uint64_t v35 = *(void *)(v26 + 176);
  *(_OWORD *)(v25 + 136) = *(_OWORD *)(v26 + 128);
  *(void *)(v25 + 184) = v35;
  *(_OWORD *)(v25 + 168) = v33;
  *(_OWORD *)(v25 + 152) = v34;
LABEL_10:
}

- (void)resetFileHandle
{
  self->_fh = 0;
  MEMORY[0x270F9A758]();
}

- (void)setAttributesLocked:(id)a3 time:(int64_t)a4
{
  id v6 = a3;
  if (!a4) {
    a4 = time(0);
  }
  self->_attr_load = a4;
  id v17 = v6;
  uint64_t v7 = [v17 bytes];
  long long v8 = *(_OWORD *)v7;
  long long v9 = *(_OWORD *)(v7 + 16);
  long long v10 = *(_OWORD *)(v7 + 32);
  *(_OWORD *)&self->attributes.fa_size = *(_OWORD *)(v7 + 48);
  *(_OWORD *)&self->attributes.fa_nlink = v10;
  *(_OWORD *)&self->attributes.fa_seqno = v9;
  *(_OWORD *)&self->attributes.__fa_rsvd0 = v8;
  long long v11 = *(_OWORD *)(v7 + 64);
  timespec v12 = *(timespec *)(v7 + 80);
  timespec v13 = *(timespec *)(v7 + 96);
  self->attributes.fa_ctime = *(timespec *)(v7 + 112);
  self->attributes.fa_mtime = v13;
  self->attributes.fa_atime = v12;
  *(_OWORD *)&self->attributes.fa_fileid = v11;
  timespec v14 = *(timespec *)(v7 + 128);
  timespec v15 = *(timespec *)(v7 + 144);
  timespec v16 = *(timespec *)(v7 + 160);
  *(void *)&self->attributes.fa_int_flags = *(void *)(v7 + 176);
  self->attributes.fa_addedtime = v16;
  self->attributes.fa_backuptime = v15;
  self->attributes.fa_birthtime = v14;
  self->numChildren = -1;
}

- (void)setAttributes:(id)a3 time:(int64_t)a4
{
  id v7 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  [(LiveFSFPItemHelper *)v6 setAttributesLocked:v7 time:a4];
  objc_sync_exit(v6);
}

- (void)setAttributesStale
{
  obj = self;
  objc_sync_enter(obj);
  obj->_attr_load = -1;
  lastXattrValuesFetchDate = obj->_lastXattrValuesFetchDate;
  obj->_lastXattrValuesFetchDate = 0;

  objc_sync_exit(obj);
}

- (void)setItemDeleted
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_parent && obj->_filename) {
    -[LiveFSFPExtensionHelper removeItem:parent:name:fileHandle:](obj->_extension, "removeItem:parent:name:fileHandle:", obj->_itemIdentifier);
  }
  path = obj->_path;
  obj->_path = (NSString *)&stru_26E048A08;

  fullPath = obj->_fullPath;
  obj->_fullPath = (NSString *)&stru_26E048A08;

  parent = obj->_parent;
  obj->_parent = 0;

  [(LiveFSFPItemHelper *)obj doDealloc];
  fh = obj->_fh;
  obj->_fh = 0;

  obj->_attr_load = -1;
  objc_sync_exit(obj);
}

- (void)recursivelySetChildrenDeleted
{
  int liType = self->_liType;
  if (liType == +[LiveFSFPItemHelper dt_dir])
  {
    timespec v16 = [MEMORY[0x263EFF980] arrayWithObject:self];
    uint64_t v4 = [v16 lastObject];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      id v6 = 0;
      id v7 = v16;
      do
      {
        long long v8 = v6;
        [v7 removeObjectAtIndex:0];
        long long v9 = [v5 itemNameCache];
        id v6 = [v9 objectEnumerator];

        if (v6)
        {
          uint64_t v10 = [v6 nextObject];
          if (v10)
          {
            long long v11 = (void *)v10;
            do
            {
              id v12 = v11;
              objc_sync_enter(v12);
              int v13 = *((_DWORD *)v12 + 66);
              if (v13 == +[LiveFSFPItemHelper dt_dir]) {
                [v16 insertObject:v12 atIndex:0];
              }
              if (*((void *)v12 + 40) && *((void *)v12 + 34)) {
                -[LiveFSFPExtensionHelper removeItem:parent:name:fileHandle:](self->_extension, "removeItem:parent:name:fileHandle:", *((void *)v12 + 35));
              }
              timespec v14 = (void *)*((void *)v12 + 34);
              *((void *)v12 + 34) = 0;

              objc_sync_exit(v12);
              long long v11 = [v6 nextObject];
            }
            while (v11);
          }
        }

        uint64_t v5 = [v16 lastObject];
        id v7 = v16;
      }
      while (v5);
    }
    timespec v15 = v16;
  }
  else
  {
    timespec v15 = 0;
  }
}

- (void)recursivelyReparentChildren
{
  int liType = self->_liType;
  if (liType == +[LiveFSFPItemHelper dt_dir])
  {
    long long v27 = [MEMORY[0x263EFF980] arrayWithObject:self];
    uint64_t v4 = [v27 lastObject];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      id v6 = 0;
      id v7 = 0;
      long long v8 = (void *)*MEMORY[0x263F053F0];
      long long v9 = v27;
      do
      {
        uint64_t v10 = v7;
        [v9 removeObjectAtIndex:0];
        long long v11 = [v5 itemNameCache];
        id v7 = [v11 objectEnumerator];

        if (v7)
        {
          uint64_t v12 = [v7 nextObject];
          if (v12)
          {
            int v13 = (void *)v12;
            timespec v14 = v6;
            do
            {
              timespec v15 = v13;
              objc_sync_enter(v15);
              int v16 = *((_DWORD *)v15 + 66);
              if (v16 == +[LiveFSFPItemHelper dt_dir]) {
                [v27 insertObject:v15 atIndex:0];
              }
              id v17 = [v5 itemIdentifier];

              if (v17 == v8)
              {
                id v21 = v15[34];
                id v18 = v15[37];
                v15[37] = v21;
              }
              else
              {
                id v18 = [v5 path];
                uint64_t v19 = [v18 stringByAppendingPathComponent:v15[34]];
                id v20 = v15[37];
                v15[37] = (id)v19;
              }
              id v22 = v15[25];
              v15[25] = 0;

              id v6 = v15[35];
              if ([(LiveFSFPExtensionHelper *)self->_extension idsPersist])
              {
                id v23 = [MEMORY[0x263F52288] identifierForItem:0 name:v15[34] parentID:v5[43]];
              }
              else
              {
                id v23 = v15[37];
              }
              id v24 = v15[35];
              v15[35] = v23;

              [(LiveFSFPExtensionHelper *)self->_extension reIDItem:v15 oldID:v6];
              objc_sync_exit(v15);

              int v13 = [v7 nextObject];

              timespec v14 = v6;
            }
            while (v13);
          }
        }
        uint64_t v25 = [v27 lastObject];

        long long v9 = v27;
        uint64_t v5 = (void *)v25;
      }
      while (v25);
    }
    uint64_t v26 = v27;
  }
  else
  {
    uint64_t v26 = 0;
  }
}

- (void)setNewParent:(id)a3 andName:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  long long v9 = self;
  objc_sync_enter(v9);
  if ([(NSString *)v9->_filename isEqualToString:v8]
    && [(LiveFSFPItemHelper *)v9->_parent isEqual:v7])
  {
    uint64_t v10 = livefs_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      id v22 = "-[LiveFSFPItemHelper setNewParent:andName:]";
      _os_log_impl(&dword_22CE49000, v10, OS_LOG_TYPE_DEFAULT, "%s: reparenting to current values", (uint8_t *)&v21, 0xCu);
    }

    objc_sync_exit(v9);
  }
  else
  {
    long long v11 = [v7 itemIdentifier];
    uint64_t v12 = (void *)*MEMORY[0x263F053F0];

    if (v11 == v12)
    {
      int v16 = (NSString *)v8;
      path = v9->_path;
      v9->_path = v16;
    }
    else
    {
      path = [v7 path];
      uint64_t v14 = [path stringByAppendingPathComponent:v8];
      timespec v15 = v9->_path;
      v9->_path = (NSString *)v14;
    }
    fullPath = v9->_fullPath;
    v9->_fullPath = 0;

    id v18 = v9->_itemIdentifier;
    if ([(LiveFSFPExtensionHelper *)v9->_extension idsPersist])
    {
      uint64_t v19 = [MEMORY[0x263F52288] identifierForItem:0 name:v8 parentID:v7[43]];
    }
    else
    {
      uint64_t v19 = v9->_path;
    }
    itemIdentifier = v9->_itemIdentifier;
    v9->_itemIdentifier = v19;

    [(LiveFSFPExtensionHelper *)v9->_extension reparentItem:v9 oldID:v18 oldParent:v9->_parent oldName:v9->_filename newParent:v7 newName:v8];
    objc_storeStrong((id *)&v9->_filename, a4);
    objc_storeStrong((id *)&v9->_parent, a3);
    objc_sync_exit(v9);

    [(LiveFSFPItemHelper *)v9 recursivelyReparentChildren];
  }
}

- (void)afterRename:(id)a3 performBlock:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  pendingRenameCompletionBlocks = v7->_pendingRenameCompletionBlocks;
  if (!pendingRenameCompletionBlocks)
  {
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = v7->_pendingRenameCompletionBlocks;
    v7->_pendingRenameCompletionBlocks = (NSMutableDictionary *)v9;

    pendingRenameCompletionBlocks = v7->_pendingRenameCompletionBlocks;
  }
  long long v11 = (void *)MEMORY[0x230F765B0](v6);
  [(NSMutableDictionary *)pendingRenameCompletionBlocks setObject:v11 forKey:v12];

  objc_sync_exit(v7);
}

- (void)dropAfterRenameBlockForName:(id)a3
{
  id v6 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  pendingRenameCompletionBlocks = v4->_pendingRenameCompletionBlocks;
  if (pendingRenameCompletionBlocks) {
    [(NSMutableDictionary *)pendingRenameCompletionBlocks setValue:0 forKey:v6];
  }
  objc_sync_exit(v4);
}

- (void)performBlocksForRename:(id)a3 onEHQueue:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  pendingRenameCompletionBlocks = v7->_pendingRenameCompletionBlocks;
  if (pendingRenameCompletionBlocks)
  {
    if (v6)
    {
      uint64_t v9 = (NSMutableDictionary *)[(NSMutableDictionary *)pendingRenameCompletionBlocks mutableCopy];
    }
    else
    {
      uint64_t v9 = pendingRenameCompletionBlocks;
      uint64_t v10 = v7->_pendingRenameCompletionBlocks;
      v7->_pendingRenameCompletionBlocks = 0;
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __55__LiveFSFPItemHelper_performBlocksForRename_onEHQueue___block_invoke;
    v11[3] = &unk_264934708;
    BOOL v14 = a4;
    id v12 = v6;
    int v13 = v7;
    [(NSMutableDictionary *)v9 enumerateKeysAndObjectsUsingBlock:v11];
  }
  else
  {
    uint64_t v9 = 0;
  }
  objc_sync_exit(v7);
}

void __55__LiveFSFPItemHelper_performBlocksForRename_onEHQueue___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = *(void **)(a1 + 32);
  if (!v8 || [v8 isEqualToString:v10])
  {
    uint64_t v9 = (void (**)(void, void))MEMORY[0x230F765B0](v7);
    v9[2](v9, *(unsigned __int8 *)(a1 + 48));
    if (*(void *)(a1 + 32))
    {
      objc_msgSend(*(id *)(*(void *)(a1 + 40) + 224), "setValue:forKey:", 0);
      *a4 = 1;
    }
  }
}

- (void)setTagData:(id)a3
{
  id v6 = a3;
  if (v6 && [(LiveFSFPExtensionHelper *)self->_extension supportsTagging])
  {
    uint64_t v4 = (NSData *)[v6 copy];
    tagData = self->_tagData;
    self->_tagData = v4;
  }
  else
  {
    tagData = self->_tagData;
    self->_tagData = 0;
  }
}

- (void)setFavoriteRank:(id)a3
{
  if (a3) {
    self->_favoriteRank = (NSNumber *)[a3 copy];
  }
  else {
    self->_favoriteRank = 0;
  }
  MEMORY[0x270F9A758]();
}

- (void)setLastUsedDate:(id)a3
{
  if (a3) {
    self->_lastUsedDate = (NSDate *)[a3 copy];
  }
  else {
    self->_lastUsedDate = 0;
  }
  MEMORY[0x270F9A758]();
}

- (int)refreshAttrsHasAProblem:(id *)a3
{
  uint64_t v5 = livefs_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSFPItemHelper refreshAttrsHasAProblem:]();
  }

  if (![(LiveFSFPExtensionHelper *)self->_extension _isLoggedInOrError:a3]) {
    return 1;
  }
  if (a3) {
    *a3 = 0;
  }
  if (![(LiveFSFPExtensionHelper *)self->_extension isClusterMaster])
  {
    id v7 = self;
    objc_sync_enter(v7);
    time_t v8 = time(0);
    if (v7->_attr_load + 3600 > v8)
    {
      int v6 = 0;
LABEL_27:
      objc_sync_exit(v7);

      return v6;
    }
    uint64_t v27 = 0;
    long long v28 = &v27;
    uint64_t v29 = 0x3032000000;
    long long v30 = __Block_byref_object_copy__2;
    long long v31 = __Block_byref_object_dispose__2;
    id v32 = 0;
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__2;
    uint64_t v25 = __Block_byref_object_dispose__2;
    id v26 = 0;
    uint64_t v9 = [(LiveFSFPExtensionHelper *)self->_extension conn];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __46__LiveFSFPItemHelper_refreshAttrsHasAProblem___block_invoke;
    v20[3] = &unk_264934180;
    v20[4] = &v21;
    id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v20];

    fh = v7->_fh;
    if (fh)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __46__LiveFSFPItemHelper_refreshAttrsHasAProblem___block_invoke_25;
      v18[3] = &unk_264934298;
      v18[4] = &v21;
      v18[5] = &v27;
      [v10 fileAttributes:fh requestID:-1 reply:v18];
      uint64_t v12 = v28[5];
      if (v12)
      {
        [(LiveFSFPItemHelper *)v7 setAttributesLocked:v12 time:v8];
LABEL_18:
        int v6 = 0;
LABEL_26:

        _Block_object_dispose(&v21, 8);
        _Block_object_dispose(&v27, 8);

        goto LABEL_27;
      }
      id v15 = (id)v22[5];
      if (v15)
      {
        int v16 = livefs_std_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[LiveFSFPItemHelper refreshAttrsHasAProblem:]();
        }
LABEL_22:
      }
    }
    else
    {
      int v13 = (id *)(v22 + 5);
      id obj = (id)v22[5];
      BOOL v14 = [(LiveFSFPItemHelper *)v7 ensureFileHandleOrError:&obj];
      objc_storeStrong(v13, obj);
      if (!v14) {
        goto LABEL_18;
      }
      id v15 = (id)v22[5];
      if (v15)
      {
        int v16 = livefs_std_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[LiveFSFPItemHelper refreshAttrsHasAProblem:]();
        }
        goto LABEL_22;
      }
    }
    if (a3)
    {
      id v15 = v15;
      *a3 = v15;
    }

    int v6 = 1;
    goto LABEL_26;
  }
  return 0;
}

void __46__LiveFSFPItemHelper_refreshAttrsHasAProblem___block_invoke(uint64_t a1, void *a2)
{
}

void __46__LiveFSFPItemHelper_refreshAttrsHasAProblem___block_invoke_25(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v12 = v5;
  if (a2)
  {
    uint64_t v6 = a2;
LABEL_5:
    uint64_t v7 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
    goto LABEL_7;
  }
  if ((unint64_t)[v5 length] <= 0xB7)
  {
    uint64_t v6 = 22;
    goto LABEL_5;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = v12;
  uint64_t v9 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v11;
LABEL_7:
}

- (BOOL)isDirectory
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_liType == 2;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isSymlink
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_liType == 3;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isDocument
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_liType == 1;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isHidden
{
  if (![(LiveFSFPExtensionHelper *)self->_extension isClusterMaster])
  {
    if (![(LiveFSFPItemHelper *)self refreshAttrsHasAProblem:0]
      && (self->attributes.fa_validmask & 2) != 0)
    {
      if ([(NSString *)self->_filename hasPrefix:@"."])
      {
        LOBYTE(v4) = 1;
        return v4;
      }
      if ((self->attributes.fa_validmask & 0x20) != 0) {
        return BYTE1(self->attributes.fa_bsd_flags) >> 7;
      }
    }
    else
    {
      BOOL v3 = livefs_std_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[LiveFSFPItemHelper isHidden](self);
      }
    }
  }
  LOBYTE(v4) = 0;
  return v4;
}

- (NSString)parentItemIdentifier
{
  BOOL v3 = livefs_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(LiveFSFPItemHelper *)(uint64_t)self parentItemIdentifier];
  }

  BOOL v4 = (void *)*MEMORY[0x263F053F0];
  if ([(NSString *)self->_itemIdentifier isEqualToString:*MEMORY[0x263F053F0]])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(LiveFSFPItemHelper *)self->_parent itemIdentifier];
  }
  return (NSString *)v5;
}

- (NSString)fp_domainIdentifier
{
  uint64_t v2 = [(NSFileProviderExtension *)self->_extension domain];
  BOOL v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSString)fp_parentDomainIdentifier
{
  if ([(LiveFSFPExtensionHelper *)self->_extension isClusterDomain]
    && ![(LiveFSFPExtensionHelper *)self->_extension isClusterMaster]
    && [(NSString *)self->_itemIdentifier isEqualToString:*MEMORY[0x263F053F0]])
  {
    BOOL v3 = [(LiveFSFPExtensionHelper *)self->_extension clusterMasterID];
  }
  else
  {
    BOOL v4 = [(NSFileProviderExtension *)self->_extension domain];
    BOOL v3 = [v4 identifier];
  }
  return (NSString *)v3;
}

- (unint64_t)capabilities
{
  if ([(LiveFSFPExtensionHelper *)self->_extension isClusterMaster]) {
    return 1;
  }
  if (![(LiveFSFPItemHelper *)self refreshAttrsHasAProblem:0]
    && (self->attributes.fa_validmask & 2) != 0)
  {
    unint64_t fa_mode = self->attributes.fa_mode;
    [(LiveFSFPItemHelper *)self isDirectory];
    uint64_t v7 = [(LiveFSFPItemHelper *)self extension];
    int v8 = [v7 idsPersist] ^ 1;
    parent = self->_parent;
    uint64_t v10 = [(LiveFSFPItemHelper *)self extension];
    int v11 = [v10 supportsTrash];
    id v12 = [(LiveFSFPItemHelper *)self extension];
    int v13 = [v12 supportsTagging];
    BOOL v14 = [(LiveFSFPItemHelper *)self extension];
    int v15 = [v14 isReadOnlyVolume];
    if (parent) {
      int v16 = v15;
    }
    else {
      int v16 = 1;
    }
    if ((fa_mode & 0x80) != 0)
    {
      int v17 = 0;
    }
    else
    {
      int v16 = 1;
      int v17 = v8;
    }
    if ((fa_mode & 0x80) != 0) {
      int v18 = v15;
    }
    else {
      int v18 = 1;
    }
    int v19 = v17 | v15;
    if (!parent) {
      int v19 = 1;
    }
    if (v16) {
      uint64_t v20 = (fa_mode >> 8) & 1;
    }
    else {
      uint64_t v20 = (fa_mode >> 8) & 1 | 0xC;
    }
    uint64_t v21 = v20 | 0x10;
    if (!v11) {
      uint64_t v21 = v20;
    }
    uint64_t v22 = v21 | 0x20;
    if (!v19) {
      uint64_t v20 = v22;
    }
    if (!v18) {
      v20 |= 2uLL;
    }
    if (v15 | v13 ^ 1) {
      uint64_t v23 = 0;
    }
    else {
      uint64_t v23 = *MEMORY[0x263F053D8];
    }
    unint64_t v3 = v20 | v23;
  }
  else
  {
    BOOL v4 = livefs_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[LiveFSFPItemHelper capabilities](self);
    }

    return 0;
  }
  return v3;
}

- (id)pathExtension
{
  unint64_t v3 = livefs_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(LiveFSFPItemHelper *)self pathExtension];
  }

  uint64_t v4 = [(LiveFSFPItemHelper *)self filename];
  if (v4
    && (id v5 = (void *)v4,
        [(LiveFSFPItemHelper *)self filename],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 length],
        v6,
        v5,
        v7)
    && (int v8 = (char *)malloc_type_calloc(1uLL, 0x401uLL, 0xFF94DFC4uLL)) != 0)
  {
    uint64_t v9 = v8;
    uint64_t v10 = [(LiveFSFPItemHelper *)self filename];
    int v11 = [v10 getFileSystemRepresentation:v9 maxLength:1025];

    if (v11) {
      id v12 = v9;
    }
    else {
      id v12 = 0;
    }
    int v13 = _extensionInFilename(v12, 0);
    BOOL v14 = (void *)v13;
    if (v13)
    {
      size_t v15 = strlen(v13);
      if (v15)
      {
        size_t v16 = v15;
        int v17 = [MEMORY[0x263F08850] defaultManager];
        BOOL v14 = [v17 stringWithFileSystemRepresentation:v14 length:v16];
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    free(v9);
  }
  else
  {
    BOOL v14 = 0;
  }
  return v14;
}

+ (id)UTIForExtension:(id)a3 liType:(int)a4
{
  uint64_t v5 = UTIForExtension_liType__onceToken;
  uint64_t v6 = (__CFString *)a3;
  if (v5 != -1) {
    dispatch_once(&UTIForExtension_liType__onceToken, &__block_literal_global_32);
  }
  uint64_t v7 = (CFStringRef *)MEMORY[0x263F01A10];
  if (a4 != 2) {
    uint64_t v7 = (CFStringRef *)MEMORY[0x263F01A08];
  }
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x263F01910], v6, *v7);

  return PreferredIdentifierForTag;
}

uint64_t __45__LiveFSFPItemHelper_UTIForExtension_liType___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)UTIForExtension_liType__utiCache;
  UTIForExtension_liType__utiCache = v0;

  uint64_t v2 = (void *)UTIForExtension_liType__utiCache;
  return [v2 setCountLimit:200];
}

- (NSString)typeIdentifier
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v3 = livefs_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(LiveFSFPItemHelper *)(uint64_t)self typeIdentifier];
  }

  if (self->_liType == 3)
  {
    uint64_t v4 = (id *)MEMORY[0x263F01B38];
LABEL_5:
    id v5 = *v4;
    goto LABEL_13;
  }
  uint64_t v6 = [(LiveFSFPItemHelper *)self pathExtension];
  if (!v6)
  {
    if (self->_liType == 2)
    {
      uint64_t v4 = (id *)MEMORY[0x263F01A30];
      goto LABEL_5;
    }
    uint64_t v6 = &stru_26E048A08;
  }
  id v5 = [(id)objc_opt_class() UTIForExtension:v6 liType:self->_liType];
  [v5 hasPrefix:@"dyn."];
  uint64_t v7 = livefs_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int liType = self->_liType;
    filename = self->_filename;
    int v11 = 138412802;
    id v12 = v5;
    __int16 v13 = 1024;
    int v14 = liType;
    __int16 v15 = 2112;
    size_t v16 = filename;
    _os_log_debug_impl(&dword_22CE49000, v7, OS_LOG_TYPE_DEBUG, "typeIdentifier: returning %@ for type %d name %@", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_13:
  return (NSString *)v5;
}

- (BOOL)isTrashed
{
  unint64_t v3 = [(LiveFSFPItemHelper *)self extension];
  if ([v3 supportsTrash]) {
    BOOL v4 = [(NSString *)self->_path hasPrefix:@".Trashes/"];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSNumber)documentSize
{
  unint64_t v3 = 0;
  if (![(LiveFSFPItemHelper *)self refreshAttrsHasAProblem:0])
  {
    BOOL v4 = self;
    objc_sync_enter(v4);
    if (v4->attributes.fa_type == 2)
    {
      unint64_t v3 = 0;
    }
    else
    {
      unint64_t v3 = [NSNumber numberWithUnsignedLong:v4->attributes.fa_size];
    }
    objc_sync_exit(v4);
  }
  return (NSNumber *)v3;
}

- (BOOL)calcNumberOfChildren:(id *)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v46 = 0;
  unint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__2;
  v40 = __Block_byref_object_dispose__2;
  id v41 = 0;
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x2020000000;
  int v35 = 0;
  uint64_t v29 = 0;
  v30[0] = &v29;
  v30[1] = 0x2020000000;
  int v31 = 0;
  BOOL v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[LiveFSFPItemHelper calcNumberOfChildren:]";
    _os_log_impl(&dword_22CE49000, v4, OS_LOG_TYPE_DEFAULT, "%s starting -H-", (uint8_t *)&buf, 0xCu);
  }

  id v5 = 0;
  id v24 = v30;
  int v6 = 1;
LABEL_4:
  int v25 = v6;
  v47[3] = 0;
  v43[3] = 0;
  *(_DWORD *)(v30[0] + 24) = 0;
  uint64_t v7 = [(LiveFSFPExtensionHelper *)self->_extension conn];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __43__LiveFSFPItemHelper_calcNumberOfChildren___block_invoke;
  v28[3] = &unk_264934180;
  v28[4] = &v36;
  int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v28];

  while (!*((_DWORD *)v33 + 6) && !v37[5])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v51 = 0x2020000000;
    int v52 = 0;
    fh = self->_fh;
    uint64_t v10 = v43[3];
    uint64_t v11 = v47[3];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __43__LiveFSFPItemHelper_calcNumberOfChildren___block_invoke_2;
    v27[3] = &unk_264934750;
    v27[4] = &buf;
    v27[5] = &v32;
    v27[6] = &v29;
    v27[7] = &v42;
    v27[8] = &v46;
    [v8 readDirectory:fh amount:0x10000 cookie:v10 verifier:v11 requestID:-1 reply:v27];
    int v12 = *(_DWORD *)(*((void *)&buf + 1) + 24);
    if (v12)
    {
      if (v12 == -1002)
      {
        *(_DWORD *)(*((void *)&buf + 1) + 24) = 70;
      }
      else if (v12 == -1000)
      {
        _Block_object_dispose(&buf, 8);
        int v6 = v25 + 1;
        id v5 = v8;
        if (v25 != 6) {
          goto LABEL_4;
        }
        uint64_t v13 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:11];
        int v14 = (void *)v37[5];
        v37[5] = v13;

        id v15 = (id)v37[5];
        if (v15)
        {
          size_t v16 = livefs_std_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[LiveFSFPItemHelper calcNumberOfChildren:]();
          }
        }
        if (a3) {
          *a3 = v15;
        }

        goto LABEL_30;
      }
      uint64_t v19 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:");
      uint64_t v20 = (void *)v37[5];
      v37[5] = v19;

      id v21 = (id)v37[5];
      if (v21)
      {
        uint64_t v22 = livefs_std_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[LiveFSFPItemHelper calcNumberOfChildren:]();
        }
      }
      if (a3) {
        *a3 = v21;
      }

      _Block_object_dispose(&buf, 8);
LABEL_30:
      BOOL v18 = 1;
      goto LABEL_31;
    }
    _Block_object_dispose(&buf, 8);
  }
  uint64_t v17 = livefs_std_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    [(LiveFSFPItemHelper *)(uint64_t)self calcNumberOfChildren:v17];
  }

  BOOL v18 = 0;
  self->numChildren = *(_DWORD *)(v30[0] + 24);
LABEL_31:
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  return v18;
}

void __43__LiveFSFPItemHelper_calcNumberOfChildren___block_invoke(uint64_t a1, void *a2)
{
}

void __43__LiveFSFPItemHelper_calcNumberOfChildren___block_invoke_2(void *a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a5;
  uint64_t v10 = livefs_std_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315650;
    uint64_t v17 = "-[LiveFSFPItemHelper calcNumberOfChildren:]_block_invoke_2";
    __int16 v18 = 1024;
    int v19 = a2;
    __int16 v20 = 2048;
    uint64_t v21 = a3;
    _os_log_impl(&dword_22CE49000, v10, OS_LOG_TYPE_DEFAULT, "%s: ReadDir got result %d, bytes %zd", (uint8_t *)&v16, 0x1Cu);
  }

  if (a2 != -1001 && a2)
  {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = a2;
  }
  else if (a2 == -1001 || !a3)
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    uint64_t v11 = [v9 bytes];
    if (a3 >= 1)
    {
      LODWORD(v12) = 0;
      while (1)
      {
        if (*(unsigned char *)(v11 + 21) != 46) {
          ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
        }
        uint64_t v13 = *(void *)(v11 + 8);
        if (v13 == -1) {
          break;
        }
        uint64_t v14 = *(unsigned __int16 *)(v11 + 16);
        uint64_t v12 = (v12 + v14);
        *(void *)(*(void *)(a1[7] + 8) + 24) = v13;
        v11 += v14;
        if (v14) {
          BOOL v15 = v12 < a3;
        }
        else {
          BOOL v15 = 0;
        }
        if (!v15) {
          goto LABEL_20;
        }
      }
      *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = 1;
    }
LABEL_20:
    *(void *)(*(void *)(a1[8] + 8) + 24) = a4;
  }
}

- (NSNumber)childItemCount
{
  uint64_t v2 = livefs_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    [(LiveFSFPItemHelper *)v2 childItemCount];
  }

  return 0;
}

- (NSDate)contentModificationDate
{
  uint64_t v3 = livefs_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(LiveFSFPItemHelper *)v3 contentModificationDate];
  }

  uint64_t v11 = 0;
  if (![(LiveFSFPItemHelper *)self refreshAttrsHasAProblem:0])
  {
    if ((self->attributes.fa_validmask & 0x800) != 0)
    {
      uint64_t v12 = self;
      objc_sync_enter(v12);
      uint64_t v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v12->attributes.fa_mtime.tv_sec + (double)v12->attributes.fa_mtime.tv_nsec * 0.000000001];
      objc_sync_exit(v12);
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  return (NSDate *)v11;
}

- (NSDate)creationDate
{
  uint64_t v3 = livefs_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(LiveFSFPItemHelper *)v3 creationDate];
  }

  uint64_t v11 = 0;
  if (![(LiveFSFPItemHelper *)self refreshAttrsHasAProblem:0])
  {
    if ((self->attributes.fa_validmask & 0x2000) != 0)
    {
      uint64_t v12 = self;
      objc_sync_enter(v12);
      uint64_t v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v12->attributes.fa_birthtime.tv_sec + (double)v12->attributes.fa_birthtime.tv_nsec * 0.000000001];
      objc_sync_exit(v12);
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  return (NSDate *)v11;
}

- (id)lastUsedTime
{
  if (![(LiveFSFPItemHelper *)self refreshAttrsHasAProblem:0]
    && (self->attributes.fa_validmask & 0x800) != 0)
  {
    uint64_t v3 = self;
    objc_sync_enter(v3);
    uint64_t tv_sec = v3->attributes.fa_mtime.tv_sec;
    uint64_t tv_nsec = v3->attributes.fa_mtime.tv_nsec;
    uint64_t v8 = livefs_std_log();
    double v9 = (double)tv_sec + (double)tv_nsec * 0.000000001;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(LiveFSFPItemHelper *)v8 lastUsedTime];
    }

    uint64_t v4 = [NSNumber numberWithDouble:v9];
    objc_sync_exit(v3);
  }
  else
  {
    livefs_std_log();
    uint64_t v3 = (LiveFSFPItemHelper *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEBUG)) {
      -[LiveFSFPItemHelper lastUsedTime]();
    }
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_fetchXattrValues
{
  if ([(LiveFSFPExtensionHelper *)self->_extension isClusterMaster]) {
    return 0;
  }
  uint64_t v4 = self;
  objc_sync_enter(v4);
  BOOL isFetchingXattrValues = v4->_isFetchingXattrValues;
  if (v4->_isFetchingXattrValues)
  {
LABEL_4:
    objc_sync_exit(v4);

    return isFetchingXattrValues;
  }
  lastXattrValuesFetchDate = v4->_lastXattrValuesFetchDate;
  if (lastXattrValuesFetchDate)
  {
    [(NSDate *)lastXattrValuesFetchDate timeIntervalSinceNow];
    if (v6 + 3600.0 > 0.0) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263EFF910] date];
    uint64_t v8 = v4->_lastXattrValuesFetchDate;
    v4->_lastXattrValuesFetchDate = (NSDate *)v7;
  }
  [(LiveFSFPItemHelper *)v4 ensureFileHandleOrError:0];
  v4->_BOOL isFetchingXattrValues = 1;
  if (!v4->_xattrFetchGroup)
  {
    dispatch_group_t v9 = dispatch_group_create();
    xattrFetchGroup = v4->_xattrFetchGroup;
    v4->_xattrFetchGroup = (OS_dispatch_group *)v9;
  }
  int v11 = 3;
  do
  {
    dispatch_group_enter((dispatch_group_t)v4->_xattrFetchGroup);
    --v11;
  }
  while (v11);
  objc_sync_exit(v4);

  uint64_t v12 = [(LiveFSFPExtensionHelper *)self->_extension conn];
  uint64_t v13 = [v12 remoteObjectProxy];

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  int v19 = 3;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __39__LiveFSFPItemHelper__fetchXattrValues__block_invoke;
  v17[3] = &unk_264934778;
  v17[4] = v4;
  v17[5] = v18;
  [(LiveFSFPItemHelper *)v4 _fetchLastUsedDateWithProxy:v13 completionHandler:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __39__LiveFSFPItemHelper__fetchXattrValues__block_invoke_2;
  v16[3] = &unk_2649347A0;
  v16[4] = v4;
  v16[5] = v18;
  [(LiveFSFPItemHelper *)v4 _fetchTagDataWithProxy:v13 completionHandler:v16];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __39__LiveFSFPItemHelper__fetchXattrValues__block_invoke_3;
  v15[3] = &unk_2649347C8;
  v15[4] = v4;
  v15[5] = v18;
  [(LiveFSFPItemHelper *)v4 _fetchFavoriteRank:v13 completionHandler:v15];
  _Block_object_dispose(v18, 8);

  return 1;
}

void __39__LiveFSFPItemHelper__fetchXattrValues__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 240), a2);
  if (!--*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 208) = 0;
    uint64_t v8 = [MEMORY[0x263EFF910] date];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 216);
    *(void *)(v9 + 216) = v8;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 232));
  objc_sync_exit(v7);
}

void __39__LiveFSFPItemHelper__fetchXattrValues__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 248), a2);
  if (!--*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 208) = 0;
    uint64_t v8 = [MEMORY[0x263EFF910] date];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 216);
    *(void *)(v9 + 216) = v8;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 232));
  objc_sync_exit(v7);
}

void __39__LiveFSFPItemHelper__fetchXattrValues__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 256), a2);
  if (!--*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 208) = 0;
    uint64_t v8 = [MEMORY[0x263EFF910] date];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 216);
    *(void *)(v9 + 216) = v8;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 232));
  objc_sync_exit(v7);
}

- (void)_fetchXattrNamed:(id)a3 proxy:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __63__LiveFSFPItemHelper__fetchXattrNamed_proxy_completionHandler___block_invoke;
  v20[3] = &unk_2649347F0;
  id v10 = v8;
  id v21 = v10;
  uint64_t v22 = self;
  id v11 = v9;
  id v23 = v11;
  uint64_t v12 = [a4 remoteObjectProxyWithErrorHandler:v20];
  fh = self->_fh;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__LiveFSFPItemHelper__fetchXattrNamed_proxy_completionHandler___block_invoke_46;
  v16[3] = &unk_264934818;
  id v17 = v10;
  __int16 v18 = self;
  id v19 = v11;
  id v14 = v11;
  id v15 = v10;
  [v12 xattrOf:fh named:v15 requestID:-1 reply:v16];
}

void __63__LiveFSFPItemHelper__fetchXattrNamed_proxy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__LiveFSFPItemHelper__fetchXattrNamed_proxy_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __63__LiveFSFPItemHelper__fetchXattrNamed_proxy_completionHandler___block_invoke_46(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 != 93 && a2)
  {
    id v7 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:a2];
    id v8 = livefs_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __63__LiveFSFPItemHelper__fetchXattrNamed_proxy_completionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = livefs_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __63__LiveFSFPItemHelper__fetchXattrNamed_proxy_completionHandler___block_invoke_46_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_fetchLastUsedDateWithProxy:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(LiveFSFPItemHelper *)self isDocument])
  {
    uint64_t v8 = *MEMORY[0x263F05330];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__LiveFSFPItemHelper__fetchLastUsedDateWithProxy_completionHandler___block_invoke;
    v9[3] = &unk_264934840;
    id v10 = v7;
    [(LiveFSFPItemHelper *)self _fetchXattrNamed:v8 proxy:v6 completionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __68__LiveFSFPItemHelper__fetchLastUsedDateWithProxy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  objc_msgSend(a2, "fp_lastUsedDate");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)_fetchTagDataWithProxy:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x263F05350];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__LiveFSFPItemHelper__fetchTagDataWithProxy_completionHandler___block_invoke;
  v9[3] = &unk_264934840;
  id v10 = v6;
  id v8 = v6;
  [(LiveFSFPItemHelper *)self _fetchXattrNamed:v7 proxy:a3 completionHandler:v9];
}

uint64_t __63__LiveFSFPItemHelper__fetchTagDataWithProxy_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchFavoriteRank:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(LiveFSFPItemHelper *)self isDirectory]
    && ![(LiveFSFPExtensionHelper *)self->_extension isClusterMaster])
  {
    uint64_t v8 = *MEMORY[0x263F05300];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59__LiveFSFPItemHelper__fetchFavoriteRank_completionHandler___block_invoke;
    v9[3] = &unk_264934840;
    id v10 = v7;
    [(LiveFSFPItemHelper *)self _fetchXattrNamed:v8 proxy:v6 completionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __59__LiveFSFPItemHelper__fetchFavoriteRank_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  objc_msgSend(a2, "fp_favoriteRank");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (NSDate)lastUsedDate
{
  if ([(LiveFSFPItemHelper *)self _fetchXattrValues]) {
    dispatch_group_wait((dispatch_group_t)self->_xattrFetchGroup, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = v3->_lastUsedDate;
  objc_sync_exit(v3);

  return v4;
}

- (NSData)tagData
{
  if ([(LiveFSFPItemHelper *)self _fetchXattrValues]) {
    dispatch_group_wait((dispatch_group_t)self->_xattrFetchGroup, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = v3->_tagData;
  objc_sync_exit(v3);

  return v4;
}

- (NSNumber)favoriteRank
{
  if ([(LiveFSFPItemHelper *)self _fetchXattrValues]) {
    dispatch_group_wait((dispatch_group_t)self->_xattrFetchGroup, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = v3->_favoriteRank;
  objc_sync_exit(v3);

  return v4;
}

- (NSData)versionIdentifier
{
  if (![(LiveFSFPItemHelper *)self refreshAttrsHasAProblem:0]
    && (self->attributes.fa_validmask & 0x800) != 0)
  {
    id v3 = self;
    objc_sync_enter(v3);
    double v14 = (double)v3->attributes.fa_mtime.tv_sec + (double)v3->attributes.fa_mtime.tv_nsec * 0.000000001;
    id v6 = livefs_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(LiveFSFPItemHelper *)v6 lastUsedTime];
    }

    uint64_t v4 = [MEMORY[0x263EFF8F8] dataWithBytes:&v14 length:8];
    objc_sync_exit(v3);
  }
  else
  {
    livefs_std_log();
    id v3 = (LiveFSFPItemHelper *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEBUG)) {
      -[LiveFSFPItemHelper lastUsedTime]();
    }
    uint64_t v4 = 0;
  }

  return (NSData *)v4;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (int64_t)attr_load
{
  return self->_attr_load;
}

- (void)setAttr_load:(int64_t)a3
{
  self->_attr_load = a3;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)fh
{
  return self->_fh;
}

- (LiveFSFPExtensionHelper)extension
{
  return (LiveFSFPExtensionHelper *)objc_getProperty(self, a2, 312, 1);
}

- (void)setExtension:(id)a3
{
}

- (LiveFSFPItemHelper)parent
{
  return (LiveFSFPItemHelper *)objc_getProperty(self, a2, 320, 1);
}

- (void)setParent:(id)a3
{
}

- (LiveFSFPEnumeratorDataContainer)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  return (LiveFSFPEnumeratorDataContainer *)WeakRetained;
}

- (void)setContainer:(id)a3
{
}

- (int)liType
{
  return self->_liType;
}

- (void)setLiType:(int)a3
{
  self->_int liType = a3;
}

- (NSMapTable)itemNameCache
{
  return (NSMapTable *)objc_getProperty(self, a2, 336, 1);
}

- (void)setItemNameCache:(id)a3
{
}

- (unint64_t)inodeNum
{
  return self->_inodeNum;
}

- (void)setInodeNum:(unint64_t)a3
{
  self->_inodeNum = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemNameCache, 0);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_fh, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_favoriteRank, 0);
  objc_storeStrong((id *)&self->_tagData, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_xattrFetchGroup, 0);
  objc_storeStrong((id *)&self->_pendingRenameCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_lastXattrValuesFetchDate, 0);
  objc_storeStrong((id *)&self->_fullPath, 0);
}

- (void)fullPath
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(&dword_22CE49000, v0, OS_LOG_TYPE_ERROR, "Error fixing _fullPath. ID %@ Path %@", v1, 0x16u);
}

- (void)initItemForFH:(os_log_t)log withReference:name:parent:type:attrs:extension:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[LiveFSFPItemHelper initItemForFH:withReference:name:parent:type:attrs:extension:]";
  _os_log_error_impl(&dword_22CE49000, log, OS_LOG_TYPE_ERROR, "%s: type == -1 invalid without attributes", (uint8_t *)&v1, 0xCu);
}

- (void)initItemForFH:withReference:name:parent:type:attrs:extension:.cold.2()
{
  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_22CE49000, v0, OS_LOG_TYPE_FAULT, "Given persistent inode attributes w/o a valid inode number", v1, 2u);
}

- (void)initItemForFH:(uint64_t)a3 withReference:(uint64_t)a4 name:(uint64_t)a5 parent:(uint64_t)a6 type:(uint64_t)a7 attrs:(uint64_t)a8 extension:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_2_17_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_22CE49000, log, OS_LOG_TYPE_FAULT, "Got success from LILookup but some out parameters are null: %@, %@", (uint8_t *)&v3, 0x16u);
}

- (void)refreshAttrsHasAProblem:.cold.1()
{
  *(void *)((char *)&v2 + 4) = "-[LiveFSFPItemHelper refreshAttrsHasAProblem:]";
  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_22CE49000, v0, v1, "%s: %s error: %@", (void)v2, DWORD2(v2));
}

- (void)refreshAttrsHasAProblem:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_22CE49000, v0, OS_LOG_TYPE_DEBUG, "%s starting in ID %@ fh %@", (uint8_t *)v1, 0x20u);
}

- (void)isHidden
{
  os_log_t v1 = [a1 filename];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7_0(&dword_22CE49000, v2, v3, "%s: attribute problem for '%@' (validmask=0x%llx)", v4, v5, v6, v7, 2u);
}

- (void)parentItemIdentifier
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 280);
  uint64_t v5 = *(void **)(a1 + 320);
  uint64_t v6 = [v5 itemIdentifier];
  uint64_t v7 = [*(id *)(a1 + 320) filename];
  int v8 = 136316162;
  uint64_t v9 = "-[LiveFSFPItemHelper parentItemIdentifier]";
  __int16 v10 = 2112;
  uint64_t v11 = v4;
  __int16 v12 = 2112;
  uint64_t v13 = v5;
  __int16 v14 = 2112;
  id v15 = v6;
  __int16 v16 = 2112;
  id v17 = v7;
  _os_log_debug_impl(&dword_22CE49000, a2, OS_LOG_TYPE_DEBUG, "%s: Item %@ parent %@ parent ID %@ parent name %@", (uint8_t *)&v8, 0x34u);
}

- (void)capabilities
{
  os_log_t v1 = [a1 filename];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7_0(&dword_22CE49000, v2, v3, "%s: attribute problem for '%@' (validmask=0x%llx)", v4, v5, v6, v7, 2u);
}

- (void)pathExtension
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 filename];
  int v4 = 134217984;
  uint64_t v5 = [v3 length];
  _os_log_debug_impl(&dword_22CE49000, a2, OS_LOG_TYPE_DEBUG, "start:%lu", (uint8_t *)&v4, 0xCu);
}

- (void)typeIdentifier
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 264);
  uint64_t v3 = *(void *)(a1 + 272);
  int v4 = 136315650;
  uint64_t v5 = "-[LiveFSFPItemHelper typeIdentifier]";
  __int16 v6 = 1024;
  int v7 = v2;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_debug_impl(&dword_22CE49000, a2, OS_LOG_TYPE_DEBUG, "%s starting, type %d name %@", (uint8_t *)&v4, 0x1Cu);
}

- (void)calcNumberOfChildren:.cold.1()
{
  *(void *)((char *)&v2 + 4) = "-[LiveFSFPItemHelper calcNumberOfChildren:]";
  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_22CE49000, v0, v1, "%s: %s error: %@", (void)v2, DWORD2(v2));
}

- (void)calcNumberOfChildren:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 272);
  int v4 = *(_DWORD *)(*(void *)a2 + 24);
  int v5 = 136315650;
  __int16 v6 = "-[LiveFSFPItemHelper calcNumberOfChildren:]";
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_debug_impl(&dword_22CE49000, log, OS_LOG_TYPE_DEBUG, "%s: Item %@ caclulated %d total entries", (uint8_t *)&v5, 0x1Cu);
}

- (void)childItemCount
{
}

- (void)contentModificationDate
{
}

- (void)creationDate
{
}

- (void)lastUsedTime
{
  OUTLINED_FUNCTION_2_0(&dword_22CE49000, a1, a3, "lastUsedTime: returning %f", a5, a6, a7, a8, 0);
}

void __63__LiveFSFPItemHelper__fetchXattrNamed_proxy_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_22CE49000, v0, v1, "error fetching xattr %@ for item %@: %@");
}

void __63__LiveFSFPItemHelper__fetchXattrNamed_proxy_completionHandler___block_invoke_46_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6_0();
  _os_log_debug_impl(&dword_22CE49000, v0, OS_LOG_TYPE_DEBUG, "fetched xattr %@ for item %@", v1, 0x16u);
}

@end