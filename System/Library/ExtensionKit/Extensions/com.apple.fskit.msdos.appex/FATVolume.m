@interface FATVolume
+ (int)GetGMTDiffOffset;
- (BOOL)isChownRestricted;
- (BOOL)isOffsetInMetadataZone:(unint64_t)a3;
- (BOOL)truncatesLongNames;
- (DirItem)rootItem;
- (DirNameCachePool)nameCachePool;
- (FATManager)fatManager;
- (FATVolume)initWithResource:(id)a3 volumeID:(id)a4 volumeName:(id)a5;
- (FSBlockDeviceResource)resource;
- (FSStatFSResult)volumeStatistics;
- (FSVolumeSupportedCapabilities)supportedVolumeCapabilities;
- (FileSystemInfo)systemInfo;
- (ItemCache)itemCache;
- (NSMutableArray)nextAvailableFileID;
- (NSMutableArray)openUnlinkedFiles;
- (NSMutableArray)preAllocatedOpenFiles;
- (id)clearNewDirClustersFrom:(unsigned int)a3 amount:(unsigned int)a4;
- (id)createDirItemWithParent:(id)a3 firstCluster:(unsigned int)a4 dirEntryData:(id)a5 name:(id)a6 isRoot:(BOOL)a7;
- (id)createFATItemWithParent:(id)a3 name:(id)a4 dirEntryData:(id)a5;
- (id)createFileItemWithParent:(id)a3 firstCluster:(unsigned int)a4 dirEntryData:(id)a5 name:(id)a6;
- (id)createSymlinkItemWithParent:(id)a3 firstCluster:(unsigned int)a4 dirEntryData:(id)a5 name:(id)a6 symlinkLength:(unsigned __int16)a7;
- (id)getAttrRequestForNewDirEntry;
- (id)sync;
- (id)verifyFileSize:(unint64_t)a3;
- (id)writeSymlinkClusters:(unsigned int)a3 withContent:(id)a4;
- (int)GetGMTDiffOffset;
- (int64_t)maximumFileSizeInBits;
- (int64_t)maximumLinkCount;
- (int64_t)maximumNameLength;
- (int64_t)maximumXattrSizeInBits;
- (unint64_t)getFileID:(id)a3;
- (unint64_t)getNextAvailableFileID;
- (void)FatMount:(id)a3 replyHandler:(id)a4;
- (void)activateWithOptions:(id)a3 replyHandler:(id)a4;
- (void)adjustCookieIndex:(unsigned int *)a3 dirItem:(id)a4 provideAttributes:(BOOL)a5;
- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(BOOL)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 usingPacker:(id)a8 replyHandler:(id)a9;
- (void)calcNumOfDirEntriesForName:(unistr255 *)a3 replyHandler:(id)a4;
- (void)close:(id)a3 keepingMode:(int)a4 replyHandler:(id)a5;
- (void)createFileNamed:(id)a3 inDirectory:(id)a4 attributes:(id)a5 usingPacker:(id)a6 replyHandler:(id)a7;
- (void)createItemNamed:(id)a3 type:(int64_t)a4 inDirectory:(id)a5 attributes:(id)a6 content:(id)a7 replyHandler:(id)a8;
- (void)createItemNamed:(id)a3 type:(int64_t)a4 inDirectory:(id)a5 attributes:(id)a6 replyHandler:(id)a7;
- (void)createLinkToItem:(id)a3 named:(id)a4 inDirectory:(id)a5 replyHandler:(id)a6;
- (void)createSymbolicLinkNamed:(id)a3 inDirectory:(id)a4 attributes:(id)a5 linkContents:(id)a6 replyHandler:(id)a7;
- (void)deactivateWithOptions:(int64_t)a3 replyHandler:(id)a4;
- (void)endIO:(id)a3 range:(_NSRange)a4 status:(id)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 replyHandler:(id)a8;
- (void)enumerateDirectory:(id)a3 startingAtCookie:(unint64_t)a4 verifier:(unint64_t)a5 providingAttributes:(id)a6 usingPacker:(id)a7 replyHandler:(id)a8;
- (void)getAttributes:(id)a3 ofItem:(id)a4 replyHandler:(id)a5;
- (void)getFreeClustersStats:(unsigned int *)a3 replyHandler:(id)a4;
- (void)isSymLink:(id)a3 replyHandler:(id)a4;
- (void)lookupItemNamed:(id)a3 inDirectory:(id)a4 replyHandler:(id)a5;
- (void)lookupItemNamed:(id)a3 inDirectory:(id)a4 usingPacker:(id)a5 replyHandler:(id)a6;
- (void)mountWithOptions:(id)a3 replyHandler:(id)a4;
- (void)nameToUnistr:(id)a3 flags:(unsigned int)a4 replyHandler:(id)a5;
- (void)open:(id)a3 withMode:(int)a4 replyHandler:(id)a5;
- (void)preallocateSpaceForItem:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 flags:(unsigned int)a6 usingPacker:(id)a7 replyHandler:(id)a8;
- (void)readSymbolicLink:(id)a3 replyHandler:(id)a4;
- (void)reclaimItem:(id)a3 replyHandler:(id)a4;
- (void)removeItem:(id)a3 named:(id)a4 fromDirectory:(id)a5 replyHandler:(id)a6;
- (void)renameItem:(id)a3 inDirectory:(id)a4 named:(id)a5 toNewName:(id)a6 inDirectory:(id)a7 overItem:(id)a8 replyHandler:(id)a9;
- (void)setAttributes:(id)a3 onItem:(id)a4 replyHandler:(id)a5;
- (void)setFatManager:(id)a3;
- (void)setItemCache:(id)a3;
- (void)setNameCachePool:(id)a3;
- (void)setNextAvailableFileID:(id)a3;
- (void)setOpenUnlinkedFiles:(id)a3;
- (void)setPreAllocatedOpenFiles:(id)a3;
- (void)setResource:(id)a3;
- (void)setRootItem:(id)a3;
- (void)setSystemInfo:(id)a3;
- (void)setVolumeLabel:(id)a3 rootDir:(id)a4 replyHandler:(id)a5;
- (void)setVolumeName:(id)a3 replyHandler:(id)a4;
- (void)synchronizeWithFlags:(int64_t)a3 replyHandler:(id)a4;
- (void)unmountWithReplyHandler:(id)a3;
@end

@implementation FATVolume

+ (int)GetGMTDiffOffset
{
  if (calculatedOffset) {
    return gmtOffset;
  }
  time_t v5 = time(0);
  time(0);
  v3 = gmtime(&v5);
  v3->tm_isdst = -1;
  time_t v4 = mktime(v3);
  calculatedOffset = 1;
  return (int)difftime(v5, v4);
}

- (FATVolume)initWithResource:(id)a3 volumeID:(id)a4 volumeName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = +[FSFileName nameWithString:a5];
  v29.receiver = self;
  v29.super_class = (Class)FATVolume;
  v12 = [(FATVolume *)&v29 initWithVolumeID:v10 volumeName:v11];

  if (v12)
  {
    resource = v12->_resource;
    v12->_resource = 0;

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v12->_resource, a3);
    }
    uint64_t v14 = objc_opt_new();
    nameCachePool = v12->_nameCachePool;
    v12->_nameCachePool = (DirNameCachePool *)v14;

    id v16 = objc_alloc((Class)NSMutableArray);
    v17 = +[NSNumber numberWithUnsignedLongLong:-1];
    v18 = (NSMutableArray *)objc_msgSend(v16, "initWithObjects:", v17, 0);
    nextAvailableFileID = v12->_nextAvailableFileID;
    v12->_nextAvailableFileID = v18;

    id v20 = objc_alloc((Class)NSMutableArray);
    v21 = +[NSNumber numberWithUnsignedLongLong:0];
    v22 = (NSMutableArray *)objc_msgSend(v20, "initWithObjects:", v21, 0);
    preAllocatedOpenFiles = v12->_preAllocatedOpenFiles;
    v12->_preAllocatedOpenFiles = v22;

    id v24 = objc_alloc((Class)NSMutableArray);
    v25 = +[NSNumber numberWithUnsignedLongLong:0];
    v26 = (NSMutableArray *)objc_msgSend(v24, "initWithObjects:", v25, 0);
    openUnlinkedFiles = v12->_openUnlinkedFiles;
    v12->_openUnlinkedFiles = v26;
  }
  return v12;
}

- (unint64_t)getFileID:(id)a3
{
  id v4 = a3;
  time_t v5 = [(FATVolume *)self systemInfo];
  unsigned int v6 = [v4 getFirstCluster:v5];

  if (v6) {
    return v6;
  }

  return [(FATVolume *)self getNextAvailableFileID];
}

- (unint64_t)getNextAvailableFileID
{
  v3 = self->_nextAvailableFileID;
  objc_sync_enter(v3);
  id v4 = [(NSMutableArray *)self->_nextAvailableFileID objectAtIndex:0];
  time_t v5 = (char *)[v4 unsignedLongLongValue];

  nextAvailableFileID = self->_nextAvailableFileID;
  if (v5 == (char *)0xFFFFFFFF00000000) {
    +[NSNumber numberWithUnsignedLongLong:-1];
  }
  else {
  v7 = +[NSNumber numberWithUnsignedLongLong:v5 - 1];
  }
  [(NSMutableArray *)nextAvailableFileID replaceObjectAtIndex:0 withObject:v7];

  objc_sync_exit(v3);
  return (unint64_t)v5;
}

- (id)writeSymlinkClusters:(unsigned int)a3 withContent:(id)a4
{
  id v34 = a4;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = sub_10000AFF8;
  v48 = sub_10000B008;
  id v49 = 0;
  unsigned int v6 = [(FATVolume *)self systemInfo];
  unsigned int v7 = [v6 bytesPerSector];
  v8 = [(FATVolume *)self systemInfo];
  unsigned int v9 = [v8 bytesPerSector];
  id v10 = [(FATVolume *)self systemInfo];
  unsigned int v11 = [v10 bytesPerSector];

  int64_t v12 = ((unint64_t)v7 + 1066) / v9 * v11;
  id v13 = [objc_alloc((Class)NSMutableData) initWithLength:v12];
  if (!v13)
  {
    fs_errorForPOSIXError();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  uint64_t v14 = +[SymLinkItem createSymlinkFromContent:v34 inBuffer:v13];
  v15 = (void *)v45[5];
  v45[5] = v14;

  id v16 = (void *)v45[5];
  if (v16)
  {
    id v17 = v16;
LABEL_5:
    id v18 = v17;
    goto LABEL_24;
  }
  uint64_t v33 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  unsigned int v43 = a3;
  v32 = &v51;
  do
  {
    if (v12 < 1) {
      break;
    }
    v19 = [(FATVolume *)self fatManager];
    unsigned __int8 v20 = [v19 isEOFCluster:*((unsigned int *)v41 + 6)];

    if (v20) {
      break;
    }
    v21 = [(FATVolume *)self systemInfo];
    id v22 = [v21 offsetForCluster:*((unsigned int *)v41 + 6)];

    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = 0;
    v23 = [(FATVolume *)self fatManager];
    uint64_t v24 = *((unsigned int *)v41 + 6);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10000B010;
    v35[3] = &unk_10004C7C0;
    v35[4] = self;
    v35[5] = &v44;
    v35[6] = &v36;
    v35[7] = &v40;
    [v23 getContigClusterChainLengthStartingAt:v24 replyHandler:v35];

    if (v45[5])
    {
      v25 = fskit_std_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10002D030(v52, &v53, v25);
      }
    }
    else
    {
      if (v37[3] >= (unint64_t)v12) {
        int64_t v26 = v12;
      }
      else {
        int64_t v26 = v37[3];
      }
      v27 = [(FATVolume *)self resource];
      uint64_t v28 = +[Utilities metaWriteToDevice:from:startingAt:length:](Utilities, "metaWriteToDevice:from:startingAt:length:", v27, (char *)[v13 mutableBytes] + v33, v22, v26);
      objc_super v29 = (void *)v45[5];
      v45[5] = v28;

      if (!v45[5])
      {
        v33 += v26;
        v12 -= v26;
        char v30 = 1;
        goto LABEL_20;
      }
      v25 = fskit_std_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10002CFEC(v50, v32, v25);
      }
    }

    char v30 = 0;
LABEL_20:
    _Block_object_dispose(&v36, 8);
  }
  while ((v30 & 1) != 0);
  id v18 = (id)v45[5];
  _Block_object_dispose(&v40, 8);
LABEL_24:

  _Block_object_dispose(&v44, 8);

  return v18;
}

- (void)isSymLink:(id)a3 replyHandler:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v40 = v8;
  if ([v8 getValidDataLength] == (id)1067
    && ([(FATVolume *)self systemInfo],
        id v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = [v8 getFirstCluster:v10],
        v10,
        v11))
  {
    int64_t v12 = [(FATVolume *)self systemInfo];
    unint64_t v13 = 1067;
    unsigned int v14 = 0x42B % [v12 bytesPerCluster];
    if (v14)
    {
      id v4 = [(FATVolume *)self systemInfo];
      unsigned int v15 = [v4 bytesPerCluster];
      time_t v5 = [(FATVolume *)self systemInfo];
      unint64_t v13 = v15 - (unint64_t)(0x42B % [v5 bytesPerCluster]) + 1067;
    }
    BOOL v16 = v14 == 0;
    id v17 = [(FATVolume *)self systemInfo];
    unsigned int v18 = [v17 bytesPerCluster];

    if (!v16)
    {
    }
    v19 = [(FATVolume *)self systemInfo];
    unint64_t v20 = 1067;
    if (0x42B % [v19 bytesPerSector])
    {
      v21 = [(FATVolume *)self systemInfo];
      unsigned int v22 = [v21 bytesPerSector];
      v23 = [(FATVolume *)self systemInfo];
      unint64_t v20 = v22 - (unint64_t)(0x42B % [v23 bytesPerSector]) + 1067;
    }
    unint64_t v38 = v13 / v18;

    int v39 = v20;
    id v36 = [objc_alloc((Class)NSMutableData) initWithLength:v20];
    uint64_t v37 = 0;
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2020000000;
    int v62 = 0;
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x3032000000;
    v56 = sub_10000AFF8;
    v57 = sub_10000B008;
    id v58 = 0;
    v35 = &v64;
    while (1)
    {
      uint64_t v24 = [(FATVolume *)self fatManager];
      unsigned __int8 v25 = [v24 isEOFCluster:v11];

      if (v25) {
        break;
      }
      uint64_t v42 = 0;
      unsigned int v43 = &v42;
      uint64_t v44 = 0x2020000000;
      v45 = 0;
      uint64_t v49 = 0;
      v50 = &v49;
      uint64_t v51 = 0x2020000000;
      int v52 = 0;
      int64_t v26 = [(FATVolume *)self fatManager];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10000B718;
      v48[3] = &unk_10004C7E8;
      v48[4] = self;
      v48[5] = &v59;
      v48[6] = &v42;
      v48[7] = &v49;
      v48[8] = &v53;
      [v26 getContigClusterChainLengthStartingAt:v11 replyHandler:v48];

      if (v54[5] || v38 > *((unsigned int *)v60 + 6))
      {
        (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
        char v27 = 0;
      }
      else
      {
        if (v39 < 1) {
          goto LABEL_25;
        }
        uint64_t v28 = v43[3] >= (unint64_t)v39 ? v39 : v43[3];
        objc_super v29 = [(FATVolume *)self resource];
        char v30 = (char *)[v36 mutableBytes];
        v31 = [(FATVolume *)self systemInfo];
        uint64_t v32 = +[Utilities syncMetaReadFromDevice:into:startingAt:length:](Utilities, "syncMetaReadFromDevice:into:startingAt:length:", v29, &v30[v37], [v31 offsetForCluster:v11], v28);
        uint64_t v33 = (void *)v54[5];
        v54[5] = v32;

        v37 += v28;
        v39 -= v28;
        if (v54[5])
        {
          id v34 = fskit_std_log();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            sub_10002D074(v63, v35, v34);
          }

          (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
          char v27 = 0;
        }
        else
        {
LABEL_25:
          id v11 = (id)*((unsigned int *)v50 + 6);
          char v27 = 1;
        }
      }
      _Block_object_dispose(&v49, 8);
      _Block_object_dispose(&v42, 8);
      if ((v27 & 1) == 0) {
        goto LABEL_29;
      }
    }
    if (v38 == *((_DWORD *)v60 + 6))
    {
      uint64_t v42 = 0;
      unsigned int v43 = &v42;
      uint64_t v44 = 0x3032000000;
      v45 = sub_10000AFF8;
      uint64_t v46 = sub_10000B008;
      id v47 = 0;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10000B7C0;
      v41[3] = &unk_10004C810;
      v41[4] = &v53;
      v41[5] = &v42;
      +[SymLinkItem verifyAndGetLink:v36 replyHandler:v41];
      (*((void (**)(id, BOOL, uint64_t))v9 + 2))(v9, v54[5] == 0, v43[5]);
      _Block_object_dispose(&v42, 8);
    }
    else
    {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
LABEL_29:
    _Block_object_dispose(&v53, 8);

    _Block_object_dispose(&v59, 8);
  }
  else
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (id)createFATItemWithParent:(id)a3 name:(id)a4 dirEntryData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v28 = 0;
  objc_super v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v24 = 0;
  unsigned __int8 v25 = &v24;
  uint64_t v26 = 0x2020000000;
  __int16 v27 = 0;
  if ([v10 type] == (id)2)
  {
    id v11 = [(FATVolume *)self systemInfo];
    uint64_t v12 = -[FATVolume createDirItemWithParent:firstCluster:dirEntryData:name:isRoot:](self, "createDirItemWithParent:firstCluster:dirEntryData:name:isRoot:", v8, [v10 getFirstCluster:v11], v10, v9, 0);
LABEL_11:
    v21 = (void *)v12;
    goto LABEL_12;
  }
  if ([v10 type] == (id)1)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000BAA0;
    v23[3] = &unk_10004C838;
    v23[4] = &v28;
    v23[5] = &v24;
    [(FATVolume *)self isSymLink:v10 replyHandler:v23];
    if (*((unsigned char *)v29 + 24))
    {
      id v11 = [(FATVolume *)self systemInfo];
      id v13 = [v10 getFirstCluster:v11];
      [(FATVolume *)self createSymlinkItemWithParent:v8 firstCluster:v13 dirEntryData:v10 name:v9 symlinkLength:*((unsigned __int16 *)v25 + 12)];
    }
    else
    {
      id v11 = [(FATVolume *)self systemInfo];
      -[FATVolume createFileItemWithParent:firstCluster:dirEntryData:name:](self, "createFileItemWithParent:firstCluster:dirEntryData:name:", v8, [v10 getFirstCluster:v11], v10, v9);
    uint64_t v12 = };
    goto LABEL_11;
  }
  id v11 = fskit_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10002D0B8(v11, v14, v15, v16, v17, v18, v19, v20);
  }
  v21 = 0;
LABEL_12:

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v21;
}

- (id)clearNewDirClustersFrom:(unsigned int)a3 amount:(unsigned int)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x3032000000;
  uint64_t v49 = sub_10000AFF8;
  v50 = sub_10000B008;
  id v51 = 0;
  uint64_t v42 = 0;
  unsigned int v43 = &v42;
  uint64_t v44 = 0x2020000000;
  int v45 = 0;
  uint64_t v38 = 0;
  int v39 = &v38;
  uint64_t v40 = 0x2020000000;
  int v41 = 0;
  unsigned int v7 = [(FATVolume *)self systemInfo];
  unint64_t v8 = (unint64_t)[v7 dirBlockSize];

  id v9 = [(FATVolume *)self systemInfo];
  unsigned int v10 = [v9 bytesPerCluster];

  id v11 = +[NSMutableArray array];
  unsigned int v12 = 0;
  unint64_t v13 = v10 / v8;
LABEL_2:
  uint64_t v14 = [(FATVolume *)self systemInfo];
  unsigned int v15 = [v14 isClusterValid:v5];

  if (v15)
  {
    while (1)
    {
      uint64_t v16 = [(FATVolume *)self systemInfo];
      if (![v16 isClusterValid:v5])
      {

LABEL_9:
        unsigned int v22 = [(FATVolume *)self resource];
        uint64_t v23 = +[Utilities syncMetaClearToDevice:v22 rangesToClear:v11];
        uint64_t v24 = (void *)v47[5];
        v47[5] = v23;

        if (!v47[5])
        {
          [v11 removeAllObjects];
          goto LABEL_2;
        }
        unsigned __int8 v25 = fskit_std_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10002D21C();
        }
LABEL_13:

        goto LABEL_14;
      }
      id v17 = [v11 count];

      if ((unint64_t)v17 > 7) {
        goto LABEL_9;
      }
      uint64_t v18 = [(FATVolume *)self fatManager];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10000BEE8;
      v37[3] = &unk_10004C5B8;
      v37[4] = &v46;
      v37[5] = &v38;
      v37[6] = &v42;
      [v18 getContigClusterChainLengthStartingAt:v5 replyHandler:v37];

      if (v47[5])
      {
        unsigned __int8 v25 = fskit_std_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10002D1A8();
        }
        goto LABEL_13;
      }
      v12 += *((_DWORD *)v39 + 6);
      if (v12 > a4) {
        break;
      }
      uint64_t v19 = [(FATVolume *)self systemInfo];
      id v20 = [v19 offsetForCluster:v5];
      v21 = +[FSMetadataBlockRange rangeWithOffset:v20 blockLength:v8 numberOfBlocks:(*((_DWORD *)v39 + 6) * v13)];
      [v11 addObject:v21];

      uint64_t v5 = *((unsigned int *)v43 + 6);
    }
    __int16 v27 = fskit_std_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10002D130(v27, v28, v29, v30, v31, v32, v33, v34);
    }

    fs_errorForPOSIXError();
    id v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_14:
    id v26 = (id)v47[5];
  }
  v35 = v26;

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  return v35;
}

- (id)getAttrRequestForNewDirEntry
{
  id v2 = objc_alloc_init((Class)FSItemGetAttributesRequest);
  [v2 setWantedAttributes:102468];

  return v2;
}

- (BOOL)isChownRestricted
{
  return 0;
}

- (int64_t)maximumFileSizeInBits
{
  return 33;
}

- (int64_t)maximumLinkCount
{
  return 1;
}

- (int64_t)maximumNameLength
{
  return 255;
}

- (BOOL)truncatesLongNames
{
  return 0;
}

- (int64_t)maximumXattrSizeInBits
{
  return 0;
}

- (void)createItemNamed:(id)a3 type:(int64_t)a4 inDirectory:(id)a5 attributes:(id)a6 replyHandler:(id)a7
{
  id v12 = a7;
  unint64_t v13 = (void (**)(void, void, void, void))v12;
  if ((unint64_t)(a4 - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000C120;
    v16[3] = &unk_10004C860;
    id v17 = v12;
    [(FATVolume *)self createItemNamed:a3 type:a4 inDirectory:a5 attributes:a6 content:0 replyHandler:v16];
    unsigned int v15 = v17;
  }
  else
  {
    uint64_t v14 = fskit_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002D290();
    }

    unsigned int v15 = fs_errorForPOSIXError();
    ((void (**)(void, void, void, void *))v13)[2](v13, 0, 0, v15);
  }
}

- (void)createItemNamed:(id)a3 type:(int64_t)a4 inDirectory:(id)a5 attributes:(id)a6 content:(id)a7 replyHandler:(id)a8
{
  id v13 = a3;
  id v14 = a5;
  id v98 = a6;
  id v97 = a7;
  id v15 = a8;
  uint64_t v142 = 0;
  v143[0] = &v142;
  v143[1] = 0x3032000000;
  v143[2] = sub_10000AFF8;
  v143[3] = sub_10000B008;
  id v144 = 0;
  uint64_t v136 = 0;
  v137 = &v136;
  uint64_t v138 = 0x3032000000;
  v139 = sub_10000AFF8;
  v140 = sub_10000B008;
  id v141 = 0;
  uint64_t v132 = 0;
  v133 = &v132;
  uint64_t v134 = 0x2020000000;
  int v135 = 0;
  uint64_t v128 = 0;
  v129 = &v128;
  uint64_t v130 = 0x2020000000;
  int v131 = 0;
  uint64_t v124 = 0;
  v125 = &v124;
  uint64_t v126 = 0x2020000000;
  uint64_t v127 = 0;
  uint64_t v16 = [(FATVolume *)self systemInfo];
  unsigned int v17 = [v16 bytesPerCluster];

  if (!v13) {
    goto LABEL_4;
  }
  uint64_t v18 = [v13 data];
  id v19 = [v18 length];

  if (!v19) {
    goto LABEL_4;
  }
  id v20 = [v13 data];
  id v21 = [v20 bytes];
  unsigned int v22 = [v13 data];
  LODWORD(v21) = +[Utilities isDotOrDotDot:length:](Utilities, "isDotOrDotDot:length:", v21, [v22 length]);

  if (v21)
  {
LABEL_4:
    uint64_t v23 = fs_errorForPOSIXError();
    (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0, 0, v23);
    goto LABEL_20;
  }
  uint64_t v24 = +[FATItem dynamicCast:v14];
  uint64_t v23 = v24;
  if (!v24)
  {
    id v26 = fskit_std_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10002D304(v26, v27, v28, v29, v30, v31, v32, v33);
    }
    goto LABEL_18;
  }
  if ([v24 isDeleted])
  {
    unsigned __int8 v25 = fs_errorForPOSIXError();
    (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0, 0, v25);
LABEL_19:

    goto LABEL_20;
  }
  BOOL v94 = a4 == 1;
  if ((a4 | 2) == 3 && ([v98 isValid:4] & 1) == 0)
  {
    id v26 = fskit_std_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10002D8F8(v26, v34, v35, v36, v37, v38, v39, v40);
    }
LABEL_18:

    unsigned __int8 v25 = fs_errorForPOSIXError();
    (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0, 0, v25);
    goto LABEL_19;
  }
  if ([v98 isValid:64]) {
    unint64_t v93 = (unint64_t)[v98 size];
  }
  else {
    unint64_t v93 = 0;
  }
  if (a4 == 1)
  {
    uint64_t v41 = [(FATVolume *)self verifyFileSize:v93];
    uint64_t v42 = *(void **)(v143[0] + 40);
    *(void *)(v143[0] + 40) = v41;

    if (*(void *)(v143[0] + 40))
    {
      unsigned int v43 = fskit_std_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_10002D884();
      }

      (*((void (**)(id, void, void, void))v15 + 2))(v15, 0, 0, *(void *)(v143[0] + 40));
      goto LABEL_20;
    }
  }
  uint64_t v44 = [(FATVolume *)self fatManager];
  [v44 setDirtyBitValue:1 replyHandler:&stru_10004C8A0];

  uint64_t v118 = 0;
  v119 = &v118;
  uint64_t v120 = 0x3032000000;
  v121 = sub_10000AFF8;
  v122 = sub_10000B008;
  id v123 = 0;
  uint64_t v114 = 0;
  v115 = &v114;
  uint64_t v116 = 0x2020000000;
  char v117 = 0;
  int v45 = [(FATVolume *)self nameCachePool];
  v113[0] = _NSConcreteStackBlock;
  v113[1] = 3221225472;
  v113[2] = sub_10000CFA8;
  v113[3] = &unk_10004C8C8;
  v113[4] = &v118;
  v113[5] = &v114;
  [v45 getNameCacheForDir:v23 cachedOnly:0 replyHandler:v113];

  if (v119[5])
  {
    if (*((unsigned char *)v115 + 24))
    {
      uint64_t v46 = objc_msgSend(v23, "fillNameCache:");
      id v47 = *(void **)(v143[0] + 40);
      *(void *)(v143[0] + 40) = v46;

      if (*(void *)(v143[0] + 40))
      {
        uint64_t v48 = fskit_std_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_10002D810();
        }

        uint64_t v49 = *(void **)(v143[0] + 40);
        *(void *)(v143[0] + 40) = 0;
      }
    }
  }
  uint64_t v109 = 0;
  v110 = &v109;
  uint64_t v111 = 0x2020000000;
  char v112 = 0;
  v50 = objc_msgSend(v13, "string", v143);
  uint64_t v51 = v119[5];
  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472;
  v108[2] = sub_10000D050;
  v108[3] = &unk_10004C748;
  v108[4] = &v109;
  v108[5] = &v142;
  [v23 lookupDirEntryNamed:v50 dirNameCache:v51 lookupOffset:0 replyHandler:v108];

  if (*((unsigned char *)v110 + 24))
  {
    int v52 = fskit_std_log();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
      sub_10002D790();
    }

    uint64_t v53 = fs_errorForPOSIXError();
    v54 = *(NSObject **)(v143[0] + 40);
    *(void *)(v143[0] + 40) = v53;
    goto LABEL_65;
  }
  if (*(void *)(v143[0] + 40))
  {
    v54 = fskit_std_log();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      sub_10002D71C();
    }
    goto LABEL_65;
  }
  if (a4 == 2)
  {
    unint64_t v55 = 1;
    BOOL v94 = 1;
  }
  else
  {
    if (a4 == 1)
    {
      if (v93 % v17) {
        unint64_t v56 = v17 - v93 % v17;
      }
      else {
        unint64_t v56 = 0;
      }
      unint64_t v57 = v56 + v93;
    }
    else
    {
      if (a4 != 3) {
        goto LABEL_63;
      }
      unint64_t v57 = 1067;
      uint64_t v58 = 0x42B % v17;
      if (v58) {
        unint64_t v57 = v17 - v58 + 1067;
      }
    }
    unint64_t v55 = v57 / v17;
    if (!v55)
    {
LABEL_58:
      if (a4 != 3) {
        goto LABEL_63;
      }
      uint64_t v63 = *((unsigned int *)v133 + 6);
      int v64 = [v97 data];
      uint64_t v65 = [(FATVolume *)self writeSymlinkClusters:v63 withContent:v64];
      v66 = *(void **)(v143[0] + 40);
      *(void *)(v143[0] + 40) = v65;

      if (!*(void *)(v143[0] + 40)) {
        goto LABEL_63;
      }
      int v62 = fskit_std_log();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
        sub_10002D634();
      }
      goto LABEL_62;
    }
  }
  uint64_t v59 = [(FATVolume *)self fatManager];
  v106[0] = _NSConcreteStackBlock;
  v106[1] = 3221225472;
  v106[2] = sub_10000D0EC;
  v106[3] = &unk_10004C8F0;
  int v107 = v55;
  v106[4] = &v142;
  v106[5] = &v132;
  v106[6] = &v128;
  [v59 allocateClusters:v55 allowPartial:0 zeroFill:v94 mustBeContig:0 replyHandler:v106];

  if (*(void *)(v143[0] + 40))
  {
    v54 = fskit_std_log();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      sub_10002D6A8();
    }
    goto LABEL_65;
  }
  if (a4 != 2) {
    goto LABEL_58;
  }
  uint64_t v60 = [(FATVolume *)self clearNewDirClustersFrom:*((unsigned int *)v133 + 6) amount:*((unsigned int *)v129 + 6)];
  uint64_t v61 = *(void **)(v143[0] + 40);
  *(void *)(v143[0] + 40) = v60;

  if (*(void *)(v143[0] + 40))
  {
    int v62 = fskit_std_log();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_10002D5C0();
    }
LABEL_62:
  }
LABEL_63:
  if (!*(void *)(v143[0] + 40))
  {
    v68 = [v13 string];
    uint64_t v69 = *((unsigned int *)v133 + 6);
    v105[0] = _NSConcreteStackBlock;
    v105[1] = 3221225472;
    v105[2] = sub_10000D1CC;
    v105[3] = &unk_10004C918;
    v105[4] = &v142;
    v105[5] = &v124;
    [v23 createNewDirEntryNamed:v68 type:a4 attributes:v98 firstDataCluster:v69 replyHandler:v105];

    if (!*(void *)(v143[0] + 40)) {
      goto LABEL_73;
    }
    v70 = fskit_std_log();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      sub_10002D54C();
    }

    if (!*(void *)(v143[0] + 40))
    {
LABEL_73:
      v71 = [v13 string];
      v72 = v125 + 3;
      v100[0] = _NSConcreteStackBlock;
      v100[1] = 3221225472;
      v100[2] = sub_10000D248;
      v100[3] = &unk_10004C940;
      v103 = &v142;
      v104 = &v136;
      v100[4] = self;
      id v73 = v23;
      id v101 = v73;
      id v95 = v13;
      id v102 = v95;
      [v73 lookupDirEntryNamed:v71 dirNameCache:0 lookupOffset:v72 replyHandler:v100];

      if (*(void *)(v143[0] + 40))
      {
        v74 = fskit_std_log();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
          sub_10002D4D8();
        }
      }
      uint64_t v75 = *(void *)(v143[0] + 40);
      if (a4 == 2 && !v75)
      {
        v76 = +[FATItem dynamicCast:v137[5]];
        uint64_t v77 = [v76 createDotEntriesWithAttrs:v98];
        v78 = *(void **)(v143[0] + 40);
        *(void *)(v143[0] + 40) = v77;

        if (*(void *)(v143[0] + 40))
        {
          v79 = fskit_std_log();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
            sub_10002D464();
          }
        }
        uint64_t v75 = *(void *)(v143[0] + 40);
      }
      if (!v75)
      {
        uint64_t v80 = [v73 updateModificationTimeOnCreateRemove];
        v81 = *(void **)(v143[0] + 40);
        *(void *)(v143[0] + 40) = v80;

        if (*(void *)(v143[0] + 40))
        {
          v82 = fskit_std_log();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
            sub_10002D3F0();
          }
        }
        v83 = (void *)v119[5];
        if (v83)
        {
          id v84 = [v95 data];
          id v85 = [v84 bytes];
          v86 = [v95 data];
          id v87 = [v86 length];
          uint64_t v88 = [v83 insertDirEntryNamed:v85 ofLength:v87 offsetInDir:v125[3]];
          v89 = *(void **)(v143[0] + 40);
          *(void *)(v143[0] + 40) = v88;

          if (*(void *)(v143[0] + 40))
          {
            v90 = fskit_std_log();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
              sub_10002D37C();
            }

            [(id)v119[5] setIsIncomplete:1];
          }
        }
        uint64_t v91 = v137[5];
        if (v91)
        {
          itemCache = self->_itemCache;
          v99[0] = _NSConcreteStackBlock;
          v99[1] = 3221225472;
          v99[2] = sub_10000D368;
          v99[3] = &unk_10004C988;
          v99[4] = &v142;
          v99[5] = &v136;
          [(ItemCache *)itemCache insertItem:v91 replyHandler:v99];
        }
        goto LABEL_66;
      }
    }
  }
  v54 = [(FATVolume *)self fatManager];
  [v54 freeClusterFrom:*((unsigned int *)v133 + 6) numClusters:*((unsigned int *)v129 + 6) replyHandler:&stru_10004C960];
LABEL_65:

LABEL_66:
  if (v119[5])
  {
    v67 = [(FATVolume *)self nameCachePool];
    [v67 doneWithNameCacheForDir:v23];
  }
  (*((void (**)(id, uint64_t, void, void))v15 + 2))(v15, v137[5], 0, *(void *)(v143[0] + 40));
  _Block_object_dispose(&v109, 8);
  _Block_object_dispose(&v114, 8);
  _Block_object_dispose(&v118, 8);

LABEL_20:
  _Block_object_dispose(&v124, 8);
  _Block_object_dispose(&v128, 8);
  _Block_object_dispose(&v132, 8);
  _Block_object_dispose(&v136, 8);

  _Block_object_dispose(&v142, 8);
}

- (void)createFileNamed:(id)a3 inDirectory:(id)a4 attributes:(id)a5 usingPacker:(id)a6 replyHandler:(id)a7
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000D4B4;
  v12[3] = &unk_10004C860;
  id v13 = a7;
  id v11 = v13;
  [(FATVolume *)self createItemNamed:a3 type:1 inDirectory:a4 attributes:a5 replyHandler:v12];
}

- (void)createLinkToItem:(id)a3 named:(id)a4 inDirectory:(id)a5 replyHandler:(id)a6
{
  id v7 = a6;
  fs_errorForPOSIXError();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a6 + 2))(v7, 0, v8);
}

- (void)createSymbolicLinkNamed:(id)a3 inDirectory:(id)a4 attributes:(id)a5 linkContents:(id)a6 replyHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v15)
  {
    unsigned int v17 = [v15 data];
    if ([v17 length])
    {
      uint64_t v18 = [v15 data];
      id v19 = [v18 length];

      if ((unint64_t)v19 < 0x401)
      {
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10000D6D8;
        v29[3] = &unk_10004C860;
        id v30 = v16;
        [(FATVolume *)self createItemNamed:v12 type:3 inDirectory:v13 attributes:v14 content:v15 replyHandler:v29];
        id v20 = v30;
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  id v21 = fskit_std_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_10002DB68(v21, v22, v23, v24, v25, v26, v27, v28);
  }

  id v20 = fs_errorForPOSIXError();
  (*((void (**)(id, void, void, void *))v16 + 2))(v16, 0, 0, v20);
LABEL_9:
}

- (void)adjustCookieIndex:(unsigned int *)a3 dirItem:(id)a4 provideAttributes:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  if ([v7 isRoot] && !v5 && *a3 >= 2) {
    *a3 -= 2;
  }
  unsigned __int8 v8 = [v7 isRoot];

  if ((v8 & 1) == 0 && v5) {
    *a3 += 2;
  }
}

- (void)enumerateDirectory:(id)a3 startingAtCookie:(unint64_t)a4 verifier:(unint64_t)a5 providingAttributes:(id)a6 usingPacker:(id)a7 replyHandler:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = +[FATItem dynamicCast:v14];
  id v19 = v18;
  if (v18)
  {
    if ([v18 isDeleted])
    {
      (*((void (**)(id, void, void))v17 + 2))(v17, 0, 0);
      goto LABEL_38;
    }
    uint64_t v145 = 0;
    v146 = &v145;
    uint64_t v147 = 0x2020000000;
    char v148 = 0;
    uint64_t v141 = 0;
    uint64_t v142 = &v141;
    uint64_t v143 = 0x2020000000;
    char v144 = 0;
    uint64_t v135 = 0;
    uint64_t v136 = &v135;
    uint64_t v137 = 0x3032000000;
    uint64_t v138 = sub_10000AFF8;
    v139 = sub_10000B008;
    id v140 = 0;
    uint64_t v131 = 0;
    uint64_t v132 = &v131;
    uint64_t v133 = 0x2020000000;
    int v134 = a4;
    uint64_t v127 = 0;
    uint64_t v128 = &v127;
    uint64_t v129 = 0x2020000000;
    int v130 = HIDWORD(a4);
    uint64_t v123 = 0;
    uint64_t v124 = &v123;
    uint64_t v125 = 0x2020000000;
    int v126 = 0;
    unsigned int v29 = [v19 isRoot];
    id v30 = v132;
    if (!v15 && ((v29 ^ 1) & 1) == 0)
    {
      int v31 = *((_DWORD *)v132 + 6);
      if ((v31 | 2) == 2)
      {
        int v32 = 0;
        *((unsigned char *)v146 + 24) = v31 == 0;
        *((unsigned char *)v142 + 24) = 1;
      }
      else
      {
        int v32 = v31 - 4;
      }
      *((_DWORD *)v30 + 6) = v32;
      *((_DWORD *)v124 + 6) = 4;
    }
    unsigned int v33 = *((_DWORD *)v30 + 6);
    if (v33 % [v19 dirEntrySize])
    {
      uint64_t v34 = fskit_std_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
        sub_10002DD48(buf, *((_DWORD *)v132 + 6), (int)[v19 dirEntrySize], v34);
      }

      uint64_t v35 = fs_errorForPOSIXError();
      uint64_t v36 = (void *)v136[5];
      v136[5] = v35;
    }
    if ([v19 dirVersion] == (id)a5 || *((unsigned char *)v146 + 24) || *((unsigned char *)v142 + 24))
    {
      if (v136[5])
      {
        uint64_t v37 = fskit_std_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          sub_10002DC58(v37, v38, v39, v40, v41, v42, v43, v44);
        }

        uint64_t v45 = +[NSError errorWithDomain:FSVolumeErrorDomain code:1 userInfo:0];
        uint64_t v46 = (void *)v136[5];
        v136[5] = v45;
      }
    }
    else
    {
      uint64_t v61 = v136;
      int v62 = (void *)v136[5];
      if (v62)
      {
        id v63 = v62;
        int v64 = (void *)v61[5];
        v61[5] = (uint64_t)v63;
      }
      else
      {
        uint64_t v65 = [v19 verifyCookieOffset:*((unsigned int *)v132 + 6)];
        int v64 = (void *)v136[5];
        v136[5] = v65;
      }

      if (v136[5])
      {
        uint64_t v109 = 0;
        v110 = &v109;
        uint64_t v111 = 0x2020000000;
        LOBYTE(v112) = 0;
        v66 = fskit_std_log();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
          sub_10002DCD0(v66, v67, v68, v69, v70, v71, v72, v73);
        }

        [(FATVolume *)self adjustCookieIndex:v128 + 3 dirItem:v19 provideAttributes:v15 != 0];
        uint64_t v74 = *((unsigned int *)v128 + 6);
        v115[0] = _NSConcreteStackBlock;
        v115[1] = 3221225472;
        v115[2] = sub_10000E110;
        v115[3] = &unk_10004C9B0;
        char v117 = &v135;
        uint64_t v118 = &v131;
        v119 = &v109;
        id v75 = v19;
        BOOL v122 = v15 != 0;
        id v116 = v75;
        uint64_t v120 = &v145;
        v121 = &v141;
        [v75 getDirEntryOffsetByIndex:v74 replyHandler:v115];
        if (v136[5] || *((unsigned char *)v110 + 24))
        {
          (*((void (**)(id, void))v17 + 2))(v17, 0);

          _Block_object_dispose(&v109, 8);
LABEL_37:
          _Block_object_dispose(&v123, 8);
          _Block_object_dispose(&v127, 8);
          _Block_object_dispose(&v131, 8);
          _Block_object_dispose(&v135, 8);

          _Block_object_dispose(&v141, 8);
          _Block_object_dispose(&v145, 8);
          goto LABEL_38;
        }

        _Block_object_dispose(&v109, 8);
      }
    }
    if (v136[5])
    {
      (*((void (**)(id, void))v17 + 2))(v17, 0);
    }
    else
    {
      uint64_t v109 = 0;
      v110 = &v109;
      uint64_t v111 = 0x3032000000;
      char v112 = sub_10000AFF8;
      v113 = sub_10000B008;
      id v114 = 0;
      uint64_t v103 = 0;
      v104 = &v103;
      uint64_t v105 = 0x3032000000;
      v106 = sub_10000AFF8;
      int v107 = sub_10000B008;
      id v108 = 0;
      uint64_t v99 = 0;
      v100 = &v99;
      uint64_t v101 = 0x2020000000;
      uint64_t v102 = 0;
      uint64_t v95 = 0;
      v96 = &v95;
      uint64_t v97 = 0x2020000000;
      uint64_t v98 = 0;
      if (*((unsigned char *)v146 + 24)
        && (++*((_DWORD *)v128 + 6),
            +[FSFileName nameWithCString:"."],
            id v47 = objc_claimAutoreleasedReturnValue(),
            id v48 = [v19 getFileID],
            int v49 = (*((uint64_t (**)(id, void *, uint64_t, id, unint64_t, void, void))v16 + 2))(v16, v47, 2, v48, ((unint64_t)*((unsigned int *)v128 + 6) << 32) | 2, 0, 0), v47, v49))
      {
        id v50 = [v19 dirVersion];
        (*((void (**)(id, id, uint64_t))v17 + 2))(v17, v50, v136[5]);
      }
      else
      {
        if (*((unsigned char *)v142 + 24))
        {
          id v51 = [objc_alloc((Class)NSString) initWithUTF8String:".."];
          int v52 = (void *)v110[5];
          v110[5] = (uint64_t)v51;

          v100[3] = 2;
          if ([v19 isRoot])
          {
            unint64_t v53 = [(FATVolume *)self getNextAvailableFileID];
            v96[3] = v53;
          }
          else
          {
            v54 = [v19 parentDir];
            id v55 = [v54 getFileID];
            v96[3] = (uint64_t)v55;
          }
        }
        v93[0] = 0;
        v93[1] = v93;
        v93[2] = 0x3032000000;
        v93[3] = sub_10000AFF8;
        v93[4] = sub_10000B008;
        id v94 = +[NSMutableData dataWithLength:766];
        uint64_t v56 = *((unsigned int *)v132 + 6);
        v76 = _NSConcreteStackBlock;
        uint64_t v77 = 3221225472;
        v78 = sub_10000E1E4;
        v79 = &unk_10004CA00;
        id v84 = &v135;
        id v85 = &v109;
        v86 = &v123;
        id v87 = &v127;
        id v57 = v16;
        uint64_t v88 = &v99;
        v89 = &v95;
        v90 = &v103;
        uint64_t v91 = v93;
        BOOL v92 = v15 != 0;
        id v83 = v57;
        uint64_t v80 = self;
        id v58 = v19;
        id v81 = v58;
        id v82 = v15;
        [v58 iterateFromOffset:v56 options:0 replyHandler:&v76];
        if (v110[5])
        {
          uint64_t v59 = +[FSFileName nameWithString:](FSFileName, "nameWithString:", v76, v77, v78, v79, v80, v81);
          (*((void (**)(id, void *, uint64_t, uint64_t, void, uint64_t, uint64_t))v57 + 2))(v57, v59, v100[3], v96[3], 0, v104[5], 1);
        }
        id v60 = objc_msgSend(v58, "dirVersion", v76, v77, v78, v79);
        (*((void (**)(id, id, uint64_t))v17 + 2))(v17, v60, v136[5]);

        _Block_object_dispose(v93, 8);
      }
      _Block_object_dispose(&v95, 8);
      _Block_object_dispose(&v99, 8);
      _Block_object_dispose(&v103, 8);

      _Block_object_dispose(&v109, 8);
    }
    goto LABEL_37;
  }
  id v20 = fskit_std_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_10002DBE0(v20, v21, v22, v23, v24, v25, v26, v27);
  }

  uint64_t v28 = fs_errorForPOSIXError();
  (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v28);

LABEL_38:
}

- (void)getAttributes:(id)a3 ofItem:(id)a4 replyHandler:(id)a5
{
  id v7 = a3;
  unsigned __int8 v8 = (void (**)(id, void *, void))a5;
  id v9 = +[FATItem dynamicCast:a4];
  unsigned int v10 = v9;
  if (v9)
  {
    id v11 = [v9 getAttributes:v7];
    v8[2](v8, v11, 0);
  }
  else
  {
    id v12 = fskit_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002DE44(v12, v13, v14, v15, v16, v17, v18, v19);
    }

    id v11 = fs_errorForPOSIXError();
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v11);
  }
}

- (void)lookupItemNamed:(id)a3 inDirectory:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v71 = 0;
  uint64_t v72 = &v71;
  uint64_t v73 = 0x3032000000;
  uint64_t v74 = sub_10000AFF8;
  id v75 = sub_10000B008;
  id v76 = 0;
  if (v8)
  {
    id v11 = +[FATItem dynamicCast:v9];
    if (!v11)
    {
      uint64_t v21 = fskit_std_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10002DF34(v21, v22, v23, v24, v25, v26, v27, v28);
      }

      unsigned int v29 = fs_errorForPOSIXError();
      (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v29);
      goto LABEL_15;
    }
    id v12 = [v8 string];

    if (!v12) {
      goto LABEL_14;
    }
    if ([v11 isDeleted]) {
      goto LABEL_14;
    }
    id v30 = [v8 data];
    id v31 = [v30 bytes];
    int v32 = [v8 data];
    unsigned int v33 = +[Utilities isDotOrDotDot:length:](Utilities, "isDotOrDotDot:length:", v31, [v32 length]);

    if (v33)
    {
LABEL_14:
      unsigned int v29 = fs_errorForPOSIXError();
      (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v29);
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x3032000000;
    uint64_t v68 = sub_10000AFF8;
    uint64_t v69 = sub_10000B008;
    id v70 = 0;
    uint64_t v61 = 0;
    int v62 = &v61;
    uint64_t v63 = 0x2020000000;
    char v64 = 0;
    uint64_t v34 = [(FATVolume *)self nameCachePool];
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_10000EC74;
    v60[3] = &unk_10004C8C8;
    v60[4] = &v65;
    v60[5] = &v61;
    [v34 getNameCacheForDir:v11 cachedOnly:0 replyHandler:v60];

    if (v66[5])
    {
      if (*((unsigned char *)v62 + 24))
      {
        uint64_t v35 = objc_msgSend(v11, "fillNameCache:");
        uint64_t v36 = (void *)v72[5];
        v72[5] = v35;

        if (v72[5])
        {
          uint64_t v37 = fskit_std_log();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            sub_10002DFAC();
          }

          uint64_t v38 = (void *)v72[5];
          v72[5] = 0;
        }
      }
    }
    uint64_t v54 = 0;
    id v55 = &v54;
    uint64_t v56 = 0x3032000000;
    id v57 = sub_10000AFF8;
    id v58 = sub_10000B008;
    id v59 = 0;
    uint64_t v39 = [v8 string];
    uint64_t v40 = v66[5];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10000ED1C;
    v49[3] = &unk_10004C940;
    int v52 = &v71;
    unint64_t v53 = &v54;
    v49[4] = self;
    id v11 = v11;
    id v50 = v11;
    id v51 = v8;
    [v11 lookupDirEntryNamed:v39 dirNameCache:v40 lookupOffset:0 replyHandler:v49];

    if (v66[5])
    {
      uint64_t v41 = [(FATVolume *)self nameCachePool];
      [v41 doneWithNameCacheForDir:v11];
    }
    uint64_t v42 = v55[5];
    if (v42)
    {
      itemCache = self->_itemCache;
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10000EDE4;
      v48[3] = &unk_10004C988;
      v48[4] = &v71;
      v48[5] = &v54;
      [(ItemCache *)itemCache insertItem:v42 replyHandler:v48];
      uint64_t v44 = v55[5];
      uint64_t v45 = v72;
      if (v44)
      {
LABEL_32:
        (*((void (**)(id, uint64_t, void, uint64_t))v10 + 2))(v10, v44, 0, v45[5]);

        _Block_object_dispose(&v54, 8);
        _Block_object_dispose(&v61, 8);
        _Block_object_dispose(&v65, 8);

        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v45 = v72;
    }
    if (v45[5])
    {
      uint64_t v44 = 0;
    }
    else
    {
      uint64_t v46 = fs_errorForPOSIXError();
      id v47 = (void *)v72[5];
      v72[5] = v46;

      uint64_t v44 = v55[5];
      uint64_t v45 = v72;
    }
    goto LABEL_32;
  }
  uint64_t v13 = fskit_std_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10002DEBC(v13, v14, v15, v16, v17, v18, v19, v20);
  }

  fs_errorForPOSIXError();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v11);
LABEL_16:

  _Block_object_dispose(&v71, 8);
}

- (void)lookupItemNamed:(id)a3 inDirectory:(id)a4 usingPacker:(id)a5 replyHandler:(id)a6
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000EF64;
  v13[3] = &unk_10004CA50;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v10 = v16;
  id v11 = v14;
  id v12 = v15;
  [(FATVolume *)self lookupItemNamed:v11 inDirectory:a4 replyHandler:v13];
}

- (FSStatFSResult)volumeStatistics
{
  id v3 = objc_alloc((Class)FSStatFSResult);
  id v4 = [(FATVolume *)self systemInfo];
  BOOL v5 = [v4 fsTypeName];
  id v6 = [v3 initWithFSTypeName:v5];

  id v7 = [(FATVolume *)self systemInfo];
  objc_msgSend(v6, "setBlockSize:", objc_msgSend(v7, "bytesPerCluster"));

  [v6 setIoSize:0x8000];
  id v8 = [(FATVolume *)self systemInfo];
  objc_msgSend(v6, "setTotalBlocks:", objc_msgSend(v8, "maxValidCluster"));

  id v9 = [(FATVolume *)self systemInfo];
  objc_msgSend(v6, "setAvailableBlocks:", objc_msgSend(v9, "freeClusters"));

  id v10 = [(FATVolume *)self systemInfo];
  objc_msgSend(v6, "setFreeBlocks:", objc_msgSend(v10, "freeClusters"));

  id v11 = [(FATVolume *)self systemInfo];
  id v12 = [v11 maxValidCluster];
  uint64_t v13 = [(FATVolume *)self systemInfo];
  objc_msgSend(v6, "setUsedBlocks:", v12 - (unsigned char *)objc_msgSend(v13, "freeClusters"));

  [v6 setTotalFiles:0];
  [v6 setFreeFiles:0];
  id v14 = [(FATVolume *)self systemInfo];
  id v15 = [v14 fsSubTypeNum];
  objc_msgSend(v6, "setFileSystemSubType:", (int)objc_msgSend(v15, "intValue"));

  return (FSStatFSResult *)v6;
}

- (FSVolumeSupportedCapabilities)supportedVolumeCapabilities
{
  id v2 = objc_opt_new();
  [v2 setSupportsSymbolicLinks:1];
  [v2 setCaseSensitivity:2];
  [v2 setSupportsHiddenFiles:1];
  [v2 setDoesNotSupportRootTimes:1];
  [v2 setDoesNotSupportSettingFilePermissions:1];

  return (FSVolumeSupportedCapabilities *)v2;
}

- (void)readSymbolicLink:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = +[FATItem dynamicCast:v6];
  if (v8)
  {
    id v9 = [(FATVolume *)self systemInfo];
    unint64_t v10 = [v9 bytesPerSector] + 1066;
    id v11 = [(FATVolume *)self systemInfo];
    unint64_t v12 = v10 / [v11 bytesPerSector];
    uint64_t v13 = [(FATVolume *)self systemInfo];
    unint64_t v14 = v12 * [v13 bytesPerSector];

    id v15 = [objc_alloc((Class)NSMutableData) initWithLength:v14];
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x2020000000;
    int v49 = v14;
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x2020000000;
    v47[3] = 0;
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2020000000;
    v46[3] = 0;
    uint64_t v40 = 0;
    uint64_t v41 = &v40;
    uint64_t v42 = 0x3032000000;
    uint64_t v43 = sub_10000AFF8;
    uint64_t v44 = sub_10000B008;
    id v45 = 0;
    id v16 = [(FATVolume *)self fatManager];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10000F6EC;
    v34[3] = &unk_10004CA78;
    uint64_t v36 = &v40;
    uint64_t v37 = v46;
    v34[4] = self;
    uint64_t v38 = v48;
    id v17 = v15;
    id v35 = v17;
    uint64_t v39 = v47;
    [v16 iterateClusterChainOfItem:v6 replyHandler:v34];

    uint64_t v28 = 0;
    unsigned int v29 = &v28;
    uint64_t v30 = 0x3032000000;
    id v31 = sub_10000AFF8;
    int v32 = sub_10000B008;
    id v33 = 0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000F888;
    v27[3] = &unk_10004C810;
    v27[4] = &v40;
    v27[5] = &v28;
    +[SymLinkItem verifyAndGetLink:v17 replyHandler:v27];
    uint64_t v18 = +[FSFileName nameWithString:v29[5]];
    v7[2](v7, v18, v41[5]);

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v40, 8);

    _Block_object_dispose(v46, 8);
    _Block_object_dispose(v47, 8);
    _Block_object_dispose(v48, 8);
  }
  else
  {
    uint64_t v19 = fskit_std_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10002E124(v19, v20, v21, v22, v23, v24, v25, v26);
    }

    fs_errorForPOSIXError();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, id))v7)[2](v7, 0, v17);
  }
}

- (void)reclaimItem:(id)a3 replyHandler:(id)a4
{
  BOOL v5 = (void (**)(id, uint64_t))a4;
  id v6 = +[FATItem dynamicCast:a3];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 reclaim];
  }
  else
  {
    id v9 = fskit_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002E19C(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v8 = fs_errorForPOSIXError();
  }
  id v17 = (void *)v8;
  v5[2](v5, v8);
}

- (void)removeItem:(id)a3 named:(id)a4 fromDirectory:(id)a5 replyHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void *))a6;
  uint64_t v14 = +[FATItem dynamicCast:v10];
  uint64_t v15 = +[FATItem dynamicCast:v12];
  uint64_t v80 = 0;
  id v81 = &v80;
  uint64_t v82 = 0x3032000000;
  id v83 = sub_10000AFF8;
  id v84 = sub_10000B008;
  id v85 = 0;
  uint64_t v69 = (void *)v15;
  if (!v14)
  {
    uint64_t v20 = fskit_std_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10002E214(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_14;
  }
  if (!v15)
  {
    uint64_t v20 = fskit_std_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10002E28C(v20, v28, v29, v30, v31, v32, v33, v34);
    }
    goto LABEL_14;
  }
  if (!v11)
  {
    uint64_t v20 = fskit_std_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10002E304(v20, v35, v36, v37, v38, v39, v40, v41);
    }
    goto LABEL_14;
  }
  uint64_t v68 = self;
  id v16 = [v11 data];
  id v17 = [v16 bytes];
  uint64_t v18 = [v11 data];
  LODWORD(v17) = +[Utilities isDotOrDotDot:length:](Utilities, "isDotOrDotDot:length:", v17, [v18 length]);

  if (v17)
  {
    uint64_t v19 = fs_errorForPOSIXError();
    v13[2](v13, v19);
LABEL_15:

    uint64_t v42 = 0;
    goto LABEL_16;
  }
  if ([v14 isDeleted])
  {
    v13[2](v13, 0);
    uint64_t v42 = 0;
    goto LABEL_16;
  }
  uint64_t v43 = [v14 entryData];
  id v44 = [v43 type];

  if (v44 == (id)2)
  {
    id v45 = +[FATItem dynamicCast:v14];
    uint64_t v42 = v45;
    if (v45)
    {
      uint64_t v46 = [v45 checkIfEmpty];
      id v47 = (void *)v81[5];
      v81[5] = v46;

      if (v81[5])
      {
        ((void (*)(void (**)(id, void *)))v13[2])(v13);
        goto LABEL_16;
      }
      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472;
      v78[2] = sub_100010068;
      v78[3] = &unk_10004CAA0;
      v79 = v13;
      [v42 purgeMetaBlocksFromCache:v78];

      goto LABEL_24;
    }
    uint64_t v20 = fskit_std_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10002E214(v20, v58, v59, v60, v61, v62, v63, v64);
    }
LABEL_14:

    uint64_t v19 = fs_errorForPOSIXError();
    v13[2](v13, v19);
    goto LABEL_15;
  }
  uint64_t v42 = 0;
LABEL_24:
  uint64_t v48 = [v69 markDirEntriesAsDeletedAndUpdateMtime:v14];
  int v49 = (void *)v81[5];
  v81[5] = v48;

  if (v81[5])
  {
    ((void (*)(void (**)(id, void *)))v13[2])(v13);
  }
  else
  {
    uint64_t v72 = 0;
    uint64_t v73 = &v72;
    uint64_t v74 = 0x3032000000;
    id v75 = sub_10000AFF8;
    id v76 = sub_10000B008;
    id v77 = 0;
    id v50 = [(FATVolume *)v68 nameCachePool];
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_1000100E0;
    v71[3] = &unk_10004CAC8;
    v71[4] = &v72;
    [v50 getNameCacheForDir:v69 cachedOnly:1 replyHandler:v71];

    id v51 = (void *)v73[5];
    if (v51)
    {
      id v52 = [v11 data];
      id v66 = [v52 bytes];
      uint64_t v67 = [v11 data];
      id v65 = [v67 length];
      unint64_t v53 = [v14 entryData];
      objc_msgSend(v51, "removeDirEntryNamed:ofLength:offsetInDir:", v66, v65, objc_msgSend(v53, "firstEntryOffsetInDir"));

      uint64_t v54 = [(FATVolume *)v68 nameCachePool];
      [v54 doneWithNameCacheForDir:v69];
    }
    id v55 = [(FATVolume *)v68 itemCache];
    [v55 removeItem:v14];

    objc_msgSend(v69, "setDirVersion:", (char *)objc_msgSend(v69, "dirVersion") + 1);
    if (v44 == (id)2)
    {
      uint64_t v56 = [v69 volume];
      id v57 = [v56 fatManager];
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_1000100F4;
      v70[3] = &unk_10004CAF0;
      v70[4] = &v80;
      objc_msgSend(v57, "freeClusters:ofItem:replyHandler:", objc_msgSend(v42, "numberOfClusters"), v42, v70);
    }
    [v14 setDeleted];
    v13[2](v13, (void *)v81[5]);
    _Block_object_dispose(&v72, 8);
  }
LABEL_16:
  _Block_object_dispose(&v80, 8);
}

- (void)renameItem:(id)a3 inDirectory:(id)a4 named:(id)a5 toNewName:(id)a6 inDirectory:(id)a7 overItem:(id)a8 replyHandler:(id)a9
{
  id v164 = a3;
  id v165 = a4;
  id v15 = a5;
  id v16 = a6;
  id v163 = a7;
  id v162 = a8;
  id v17 = (void (**)(id, void, void *))a9;
  uint64_t v214 = 0;
  v215 = &v214;
  uint64_t v216 = 0x2020000000;
  uint64_t v217 = 0;
  uint64_t v208 = 0;
  v209 = &v208;
  uint64_t v210 = 0x3032000000;
  v211 = sub_10000AFF8;
  v212 = sub_10000B008;
  id v213 = 0;
  uint64_t v202 = 0;
  v203 = &v202;
  uint64_t v204 = 0x3032000000;
  v205 = sub_10000AFF8;
  v206 = sub_10000B008;
  id v207 = 0;
  uint64_t v196 = 0;
  v197 = &v196;
  uint64_t v198 = 0x3032000000;
  v199 = sub_10000AFF8;
  v200 = sub_10000B008;
  id v201 = 0;
  uint64_t v190 = 0;
  v191 = &v190;
  uint64_t v192 = 0x3032000000;
  v193 = sub_10000AFF8;
  v194 = sub_10000B008;
  id v195 = 0;
  if (!v16 || !v15 || !v164 || !v165 || !v163) {
    goto LABEL_9;
  }
  v161 = self;
  id v18 = [v15 data];
  id v19 = [v18 bytes];
  uint64_t v20 = [v15 data];
  if (+[Utilities isDotOrDotDot:length:](Utilities, "isDotOrDotDot:length:", v19, [v20 length]))
  {

LABEL_9:
    uint64_t v24 = fskit_std_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10002E3FC(v24, v25, v26, v27, v28, v29, v30, v31);
    }

    uint64_t v32 = fs_errorForPOSIXError();
    v17[2](v17, 0, v32);
    goto LABEL_12;
  }
  id v21 = [v16 data];
  id v22 = [v21 bytes];
  uint64_t v23 = [v16 data];
  LODWORD(v22) = +[Utilities isDotOrDotDot:length:](Utilities, "isDotOrDotDot:length:", v22, [v23 length]);

  if (v22) {
    goto LABEL_9;
  }
  if (v165 != v163
    || ([v15 string],
        uint64_t v33 = objc_claimAutoreleasedReturnValue(),
        [v16 string],
        uint64_t v34 = objc_claimAutoreleasedReturnValue(),
        unsigned int v35 = [v33 isEqualToString:v34],
        v34,
        v33,
        !v35))
  {
    id v44 = +[FATItem dynamicCast:v164];
    uint64_t v32 = v44;
    if (!v44 || [v44 isDeleted])
    {
      id v45 = fs_errorForPOSIXError();
      v17[2](v17, 0, v45);
LABEL_30:

LABEL_12:
      goto LABEL_13;
    }
    uint64_t v46 = +[FATItem dynamicCast:v165];
    id v45 = v46;
    if (!v46 || [v46 isDeleted])
    {
      id v47 = fs_errorForPOSIXError();
      v17[2](v17, 0, v47);
LABEL_29:

      goto LABEL_30;
    }
    v160 = +[FATItem dynamicCast:v163];
    if (!v160) {
      goto LABEL_27;
    }
    if ([v160 isDeleted]) {
      goto LABEL_27;
    }
    v158 = [v32 name];
    v156 = [v158 lowercaseString];
    int v49 = [v15 string];
    id v50 = [v49 lowercaseString];
    unsigned __int8 v51 = [v156 isEqualToString:v50];

    if ((v51 & 1) == 0)
    {
LABEL_27:
      uint64_t v48 = fs_errorForPOSIXError();
      v17[2](v17, 0, v48);
LABEL_28:

      id v47 = v160;
      goto LABEL_29;
    }
    v159 = [v32 entryData];
    if ([v159 type] == (id)2)
    {
      id v52 = [v160 parentDir];
      uint64_t v53 = +[FATItem dynamicCast:v52];

      if (v53)
      {
        uint64_t v54 = (void *)v53;
        while (1)
        {
          id v55 = v54;
          unsigned int v56 = [v54 firstCluster];
          if (v56 == [v32 firstCluster]) {
            break;
          }
          id v57 = [v55 parentDir];
          uint64_t v58 = +[FATItem dynamicCast:v57];

          uint64_t v54 = (void *)v58;
          if (!v58) {
            goto LABEL_37;
          }
        }
        v89 = fskit_std_log();
        uint64_t v71 = v55;
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
          sub_10002E9F4(v89, v90, v91, v92, v93, v94, v95, v96);
        }

        uint64_t v97 = fs_errorForPOSIXError();
        v17[2](v17, 0, v97);
        goto LABEL_95;
      }
    }
LABEL_37:
    uint64_t v59 = [(FATVolume *)v161 fatManager];
    [v59 setDirtyBitValue:1 replyHandler:&stru_10004CB10];

    v155 = [(FATVolume *)v161 getAttrRequestForNewDirEntry];
    v157 = [v32 getAttributes:v155];
    uint64_t v184 = 0;
    v185 = &v184;
    uint64_t v186 = 0x3032000000;
    v187 = sub_10000AFF8;
    v188 = sub_10000B008;
    id v189 = 0;
    uint64_t v178 = 0;
    v179 = &v178;
    uint64_t v180 = 0x3032000000;
    v181 = sub_10000AFF8;
    v182 = sub_10000B008;
    id v183 = 0;
    uint64_t v60 = [(FATVolume *)v161 nameCachePool];
    v177[0] = _NSConcreteStackBlock;
    v177[1] = 3221225472;
    v177[2] = sub_1000114F0;
    v177[3] = &unk_10004CAC8;
    v177[4] = &v178;
    [v60 getNameCacheForDir:v160 cachedOnly:1 replyHandler:v177];

    if (v164 != v162)
    {
      if (v162)
      {
        uint64_t v61 = +[FATItem dynamicCast:](FATItem, "dynamicCast:");
        uint64_t v62 = (void *)v203[5];
        v203[5] = v61;

        uint64_t v63 = (void *)v203[5];
        if (!v63 || [v63 isDeleted])
        {
          uint64_t v64 = fs_errorForPOSIXError();
          id v65 = (void *)v209[5];
          v209[5] = v64;

LABEL_83:
          uint64_t v74 = 0;
          uint64_t v97 = 0;
          uint64_t v71 = 0;
LABEL_92:
          if (v179[5])
          {
            BOOL v122 = [(FATVolume *)v161 nameCachePool];
            [v122 doneWithNameCacheForDir:v160];
          }
          v17[2](v17, 0, (void *)v209[5]);
          _Block_object_dispose(&v178, 8);

          _Block_object_dispose(&v184, 8);
LABEL_95:

          uint64_t v48 = v159;
          goto LABEL_28;
        }
      }
      else
      {
        id v66 = [v16 string];
        uint64_t v67 = v179[5];
        v172[0] = _NSConcreteStackBlock;
        v172[1] = 3221225472;
        v172[2] = sub_100011504;
        v172[3] = &unk_10004C940;
        v175 = &v208;
        v176 = &v202;
        v172[4] = v161;
        id v173 = v160;
        id v174 = v16;
        [v173 lookupDirEntryNamed:v66 dirNameCache:v67 lookupOffset:0 replyHandler:v172];

        uint64_t v68 = (void *)v209[5];
        if (v68)
        {
          if ([v68 code] != (id)2)
          {
            id v108 = fskit_std_log();
            if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR)) {
              sub_10002E980();
            }

            goto LABEL_83;
          }
          uint64_t v69 = (void *)v209[5];
          v209[5] = 0;
        }
      }
    }
    id v70 = (void *)v203[5];
    if (!v70)
    {
      uint64_t v74 = 0;
      uint64_t v71 = 0;
      goto LABEL_55;
    }
    uint64_t v71 = [v70 entryData];
    id v72 = [v159 type];
    if (v72 != [v71 type])
    {
      if ([v159 type] == (id)2)
      {
        id v81 = fskit_std_log();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
          sub_10002E890(v81, v82, v83, v84, v85, v86, v87, v88);
        }
        goto LABEL_90;
      }
      if ([v71 type] == (id)2)
      {
        id v81 = fskit_std_log();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
          sub_10002E908(v81, v101, v102, v103, v104, v105, v106, v107);
        }
        goto LABEL_90;
      }
    }
    if ([v71 type] != (id)2)
    {
      uint64_t v74 = 0;
LABEL_65:
      objc_msgSend(v160, "setDirVersion:", (char *)objc_msgSend(v160, "dirVersion") + 1);
      uint64_t v98 = [v160 markDirEntriesAsDeletedAndUpdateMtime:v203[5]];
      uint64_t v99 = (void *)v209[5];
      v209[5] = v98;

      if (v209[5])
      {
        id v77 = fskit_std_log();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
          sub_10002E7A8();
        }
        goto LABEL_75;
      }
      [(ItemCache *)v161->_itemCache removeItem:v203[5]];
      v150 = (void *)v179[5];
      if (v150)
      {
        id v109 = [v16 data];
        id v147 = [v109 bytes];
        v153 = [v16 data];
        id v110 = [v153 length];
        uint64_t v111 = [(id)v203[5] entryData];
        objc_msgSend(v150, "removeDirEntryNamed:ofLength:offsetInDir:", v147, v110, objc_msgSend(v111, "firstEntryOffsetInDir"));
      }
      char v112 = (void *)v203[5];
      if (v162)
      {
        [v112 setDeleted];
      }
      else if ([v112 firstCluster])
      {
        uint64_t v141 = [v160 volume];
        uint64_t v142 = [v141 fatManager];
        id v143 = [(id)v203[5] numberOfClusters];
        uint64_t v144 = v203[5];
        v171[0] = _NSConcreteStackBlock;
        v171[1] = 3221225472;
        v171[2] = sub_1000115CC;
        v171[3] = &unk_10004CAF0;
        v171[4] = &v208;
        [v142 freeClusters:v143 ofItem:v144 replyHandler:v171];

        if (v209[5])
        {
          id v77 = fskit_std_log();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
            sub_10002E734();
          }
          goto LABEL_75;
        }
      }
LABEL_55:
      v78 = +[FATItem dynamicCast:v164];

      v79 = [v16 string];
      if (v78) {
        uint64_t v80 = 3;
      }
      else {
        uint64_t v80 = (uint64_t)[v159 type];
      }
      v170[0] = _NSConcreteStackBlock;
      v170[1] = 3221225472;
      v170[2] = sub_1000115DC;
      v170[3] = &unk_10004C918;
      v170[4] = &v208;
      v170[5] = &v214;
      objc_msgSend(v160, "createNewDirEntryNamed:type:attributes:firstDataCluster:replyHandler:", v79, v80, v157, objc_msgSend(v32, "firstCluster"), v170);

      if (v209[5])
      {
        id v77 = fskit_std_log();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
          sub_10002E648();
        }
      }
      else
      {
        [(ItemCache *)v161->_itemCache removeItem:v32];
        v100 = [v16 string];
        v169[0] = _NSConcreteStackBlock;
        v169[1] = 3221225472;
        v169[2] = sub_100011658;
        v169[3] = &unk_10004C748;
        v169[4] = &v208;
        v169[5] = &v196;
        [v160 lookupDirEntryNamed:v100 dirNameCache:0 lookupOffset:v215 + 3 replyHandler:v169];

        if (!v209[5])
        {
          uint64_t v123 = [v16 string];
          [v32 setName:v123];

          [v32 setParentDir:v160];
          v151 = (void *)v179[5];
          if (v151)
          {
            id v148 = [v16 data];
            id v124 = [v148 bytes];
            uint64_t v125 = [v16 data];
            id v126 = [v125 length];
            id v127 = objc_msgSend(v151, "insertDirEntryNamed:ofLength:offsetInDir:", v124, v126, objc_msgSend((id)v197[5], "firstEntryOffsetInDir"));

            uint64_t v128 = [(FATVolume *)v161 nameCachePool];
            [v128 doneWithNameCacheForDir:v160];

            uint64_t v129 = (void *)v179[5];
            v179[5] = 0;
          }
          int v130 = [(FATVolume *)v161 nameCachePool];
          v168[0] = _NSConcreteStackBlock;
          v168[1] = 3221225472;
          v168[2] = sub_1000116E8;
          v168[3] = &unk_10004CAC8;
          v168[4] = &v184;
          [v130 getNameCacheForDir:v45 cachedOnly:1 replyHandler:v168];

          uint64_t v131 = [v45 markDirEntriesAsDeletedAndUpdateMtime:v32];
          uint64_t v132 = (void *)v209[5];
          v209[5] = v131;

          if (v209[5])
          {
            uint64_t v133 = fskit_std_log();
            if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR)) {
              sub_10002E560();
            }
          }
          v149 = (void *)v185[5];
          if (v149)
          {
            id v146 = [v15 data];
            id v134 = [v146 bytes];
            v152 = [v15 data];
            id v135 = [v152 length];
            uint64_t v136 = [v32 entryData];
            objc_msgSend(v149, "removeDirEntryNamed:ofLength:offsetInDir:", v134, v135, objc_msgSend(v136, "firstEntryOffsetInDir"));

            uint64_t v137 = [(FATVolume *)v161 nameCachePool];
            [v137 doneWithNameCacheForDir:v45];
          }
          [v32 setEntryData:v197[5]];
          itemCache = v161->_itemCache;
          v167[0] = _NSConcreteStackBlock;
          v167[1] = 3221225472;
          v167[2] = sub_1000116FC;
          v167[3] = &unk_10004CB38;
          v167[4] = &v208;
          [(ItemCache *)itemCache insertItem:v32 replyHandler:v167];
          id v139 = [v159 type];
          uint64_t v97 = 0;
          if (v165 != v163 && v139 == (id)2)
          {
            uint64_t v97 = +[FATItem dynamicCast:v32];
            v166[0] = _NSConcreteStackBlock;
            v166[1] = 3221225472;
            v166[2] = sub_10001175C;
            v166[3] = &unk_10004C748;
            v166[4] = &v208;
            v166[5] = &v190;
            [v97 lookupDirEntryNamed:@".." dirNameCache:0 lookupOffset:0 replyHandler:v166];
            if (v209[5])
            {
              id v140 = fskit_std_log();
              if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR)) {
                sub_10002E4EC();
              }
            }
            else
            {
              v154 = (void *)v191[5];
              id v145 = [v160 firstCluster];
              id v140 = [(FATVolume *)v161 systemInfo];
              [v154 setFirstCluster:v145 fileSystemInfo:v140];
            }
          }
          objc_msgSend(v45, "setDirVersion:", (char *)objc_msgSend(v45, "dirVersion") + 1);
          goto LABEL_92;
        }
        id v77 = fskit_std_log();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
          sub_10002E5D4();
        }
      }
      goto LABEL_75;
    }
    uint64_t v73 = +[FATItem dynamicCast:v203[5]];
    uint64_t v74 = v73;
    if (v73)
    {
      uint64_t v75 = [v73 checkIfEmpty];
      id v76 = (void *)v209[5];
      v209[5] = v75;

      if (v209[5])
      {
        id v77 = fskit_std_log();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
          sub_10002E81C();
        }
LABEL_75:

LABEL_91:
        uint64_t v97 = 0;
        goto LABEL_92;
      }
      goto LABEL_65;
    }
    id v81 = fskit_std_log();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
      sub_10002E6BC(v81, v113, v114, v115, v116, v117, v118, v119);
    }
LABEL_90:

    uint64_t v120 = fs_errorForPOSIXError();
    v121 = (void *)v209[5];
    v209[5] = v120;

    uint64_t v74 = 0;
    goto LABEL_91;
  }
  uint64_t v36 = fskit_std_log();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
    sub_10002E474(v36, v37, v38, v39, v40, v41, v42, v43);
  }

  v17[2](v17, 0, 0);
LABEL_13:
  _Block_object_dispose(&v190, 8);

  _Block_object_dispose(&v196, 8);
  _Block_object_dispose(&v202, 8);

  _Block_object_dispose(&v208, 8);
  _Block_object_dispose(&v214, 8);
}

- (void)setAttributes:(id)a3 onItem:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *, void))a5;
  id v10 = a4;
  id v11 = objc_alloc_init((Class)FSItemGetAttributesRequest);
  id v12 = +[FATItem dynamicCast:v10];

  if (!v12)
  {
    uint64_t v13 = fskit_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002EAE0(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  if (+[Utilities containsReadOnlyAttributes:v8])
  {
    uint64_t v21 = fs_errorForPOSIXError();
  }
  else
  {
    id v22 = [(FATVolume *)self fatManager];
    [v22 setDirtyBitValue:1 replyHandler:&stru_10004CB58];

    uint64_t v21 = [v12 setAttributes:v8];
    if (!v21)
    {
      [v11 setWantedAttributes:119807];
      uint64_t v23 = [v12 getAttributes:v11];
      v9[2](v9, v23, 0);
      goto LABEL_9;
    }
  }
  uint64_t v23 = (void *)v21;
  v9[2](v9, 0, v21);
LABEL_9:
}

- (void)synchronizeWithFlags:(int64_t)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(FATVolume *)self sync];
  if (v7)
  {
    id v8 = fskit_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002EC74();
    }
  }
  id v9 = [(FATVolume *)self preAllocatedOpenFiles];
  id v10 = [v9 objectAtIndex:0];
  if ([v10 unsignedLongLongValue])
  {

LABEL_7:
    goto LABEL_9;
  }
  id v11 = [(FATVolume *)self openUnlinkedFiles];
  id v12 = [v11 objectAtIndex:0];
  id v13 = [v12 unsignedLongLongValue];

  if (!v13)
  {
    uint64_t v18 = [(FATVolume *)self fatManager];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100011BAC;
    v19[3] = &unk_10004CAA0;
    id v20 = v6;
    [v18 setDirtyBitValue:0 replyHandler:v19];

    id v9 = v20;
    goto LABEL_7;
  }
LABEL_9:
  uint64_t v14 = [(FATVolume *)self resource];
  uint64_t v15 = v14;
  if ((a3 & 2) != 0) {
    [v14 asynchronousMetadataFlush];
  }
  else {
  uint64_t v16 = [v14 metadataFlush];
  }

  if (v16)
  {
    uint64_t v17 = fskit_std_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10002EBD0(v16, a3, v17);
    }
  }
  (*((void (**)(id, void *))v6 + 2))(v6, v16);
}

- (void)activateWithOptions:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10002ED60(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100011CF0;
  v27[3] = &unk_10004CB80;
  id v16 = v6;
  id v28 = v16;
  [(FATVolume *)self FatMount:v7 replyHandler:v27];

  uint64_t v17 = [[ItemCache alloc] initWithVolume:self];
  itemCache = self->_itemCache;
  self->_itemCache = v17;

  uint64_t v19 = fskit_std_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_10002ECE8(v19, v20, v21, v22, v23, v24, v25, v26);
  }
}

- (void)deactivateWithOptions:(int64_t)a3 replyHandler:(id)a4
{
  BOOL v5 = (void (**)(id, void))a4;
  id v6 = fskit_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10002EE58(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_10000AFF8;
  uint64_t v20 = sub_10000B008;
  id v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100011E84;
  v15[3] = &unk_10004CAF0;
  v15[4] = &v16;
  [(FATVolume *)self synchronizeWithFlags:1 replyHandler:v15];
  if (!v17[5]) {
    [(FATVolume *)self unmountWithReplyHandler:&stru_10004CBC0];
  }
  uint64_t v14 = fskit_std_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10002EDD8();
  }

  v5[2](v5, 0);
  _Block_object_dispose(&v16, 8);
}

- (void)mountWithOptions:(id)a3 replyHandler:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100011F64;
  v9[3] = &unk_10004CB80;
  id v10 = a4;
  id v6 = v10;
  [(FATVolume *)self FatMount:a3 replyHandler:v9];
  uint64_t v7 = [[ItemCache alloc] initWithVolume:self];
  itemCache = self->_itemCache;
  self->_itemCache = v7;
}

- (void)unmountWithReplyHandler:(id)a3
{
  BOOL v5 = (void (**)(void))a3;
  id v4 = [(FATVolume *)self fatManager];
  [v4 getDirtyBitValue:&stru_10004CC00];

  v5[2]();
}

- (void)close:(id)a3 keepingMode:(int)a4 replyHandler:(id)a5
{
  id v6 = a5;
  fs_errorForPOSIXError();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);
}

- (void)open:(id)a3 withMode:(int)a4 replyHandler:(id)a5
{
  id v6 = a5;
  fs_errorForPOSIXError();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);
}

- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(BOOL)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 usingPacker:(id)a8 replyHandler:(id)a9
{
  uint64_t v10 = *(void *)&a6;
  BOOL v11 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v14 = a3;
  id v15 = a8;
  uint64_t v16 = (void (**)(id, void))a9;
  uint64_t v17 = +[FATItem dynamicCast:v14];
  uint64_t v18 = v17;
  if (v17)
  {
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = sub_10000AFF8;
    uint64_t v33 = sub_10000B008;
    id v34 = 0;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100012334;
    v28[3] = &unk_10004CAF0;
    v28[4] = &v29;
    objc_msgSend(v17, "blockmapRange:startIO:flags:operationID:usingBlocks:replyHandler:", location, length, v11, v10, a7, v15, v28);
    v16[2](v16, v30[5]);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    uint64_t v19 = fskit_std_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10002EFDC(v19, v20, v21, v22, v23, v24, v25, v26);
    }

    uint64_t v27 = fs_errorForPOSIXError();
    ((void (**)(id, void *))v16)[2](v16, v27);
  }
}

- (void)endIO:(id)a3 range:(_NSRange)a4 status:(id)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 replyHandler:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v13 = a5;
  id v14 = (void (**)(id, uint64_t))a8;
  id v15 = +[FATItem dynamicCast:a3];
  if (v15)
  {
    if (v13) {
      id v16 = [v13 code];
    }
    else {
      id v16 = 0;
    }
    uint64_t v25 = objc_msgSend(v15, "endIOOfRange:status:flags:operationID:", location, length, v16, v9, a7);
  }
  else
  {
    uint64_t v17 = fskit_std_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10002F0C8(v17, v18, v19, v20, v21, v22, v23, v24);
    }

    uint64_t v25 = fs_errorForPOSIXError();
  }
  uint64_t v26 = (void *)v25;
  v14[2](v14, v25);
}

- (id)createDirItemWithParent:(id)a3 firstCluster:(unsigned int)a4 dirEntryData:(id)a5 name:(id)a6 isRoot:(BOOL)a7
{
  return 0;
}

- (id)createFileItemWithParent:(id)a3 firstCluster:(unsigned int)a4 dirEntryData:(id)a5 name:(id)a6
{
  return 0;
}

- (id)createSymlinkItemWithParent:(id)a3 firstCluster:(unsigned int)a4 dirEntryData:(id)a5 name:(id)a6 symlinkLength:(unsigned __int16)a7
{
  return 0;
}

- (void)FatMount:(id)a3 replyHandler:(id)a4
{
  id v5 = a4;
  fs_errorForPOSIXError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
}

- (void)getFreeClustersStats:(unsigned int *)a3 replyHandler:(id)a4
{
  id v5 = a4;
  fs_errorForPOSIXError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (void)calcNumOfDirEntriesForName:(unistr255 *)a3 replyHandler:(id)a4
{
  id v5 = a4;
  fs_errorForPOSIXError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void))a4 + 2))(v5, v6, 0);
}

- (void)nameToUnistr:(id)a3 flags:(unsigned int)a4 replyHandler:(id)a5
{
  memset(v8, 0, sizeof(v8));
  id v6 = a5;
  id v7 = fs_errorForPOSIXError();
  (*((void (**)(id, void *, _OWORD *))a5 + 2))(v6, v7, v8);
}

- (id)verifyFileSize:(unint64_t)a3
{
  return (id)fs_errorForPOSIXError();
}

- (BOOL)isOffsetInMetadataZone:(unint64_t)a3
{
  return 0;
}

- (id)sync
{
  return (id)fs_errorForPOSIXError();
}

- (void)setVolumeLabel:(id)a3 rootDir:(id)a4 replyHandler:(id)a5
{
  id v6 = a5;
  fs_errorForPOSIXError();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a5 + 2))(v6, 0, v7);
}

- (void)setVolumeName:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_10000AFF8;
  uint64_t v21 = sub_10000B008;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_10000AFF8;
  id v15 = sub_10000B008;
  id v16 = 0;
  uint64_t v8 = [v6 data];
  uint64_t v9 = [(FATVolume *)self rootItem];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100012918;
  v10[3] = &unk_10004CC28;
  v10[4] = &v11;
  v10[5] = &v17;
  [(FATVolume *)self setVolumeLabel:v8 rootDir:v9 replyHandler:v10];

  if (v12[5]) {
    v7[2](v7, 0);
  }
  else {
    v7[2](v7, v18[5]);
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
}

- (void)preallocateSpaceForItem:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 flags:(unsigned int)a6 usingPacker:(id)a7 replyHandler:(id)a8
{
  char v10 = a6;
  id v14 = a3;
  id v15 = a7;
  id v16 = (void (**)(id, void, void *))a8;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = sub_10000AFF8;
  int v49 = sub_10000B008;
  id v50 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  uint64_t v17 = +[FATItem dynamicCast:v14];
  if (!v17)
  {
    uint64_t v18 = fskit_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10002F140(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_12;
  }
  if ((v10 & 0x20) != 0)
  {
    uint64_t v18 = fskit_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10002F22C(v18, v26, v27, v28, v29, v30, v31, v32);
    }
    goto LABEL_12;
  }
  if (a4)
  {
    uint64_t v18 = fskit_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10002F1B8();
    }
LABEL_12:

    uint64_t v33 = fs_errorForPOSIXError();
    v16[2](v16, 0, v33);

    goto LABEL_13;
  }
  id v34 = [(FATVolume *)self fatManager];
  [v34 setDirtyBitValue:1 replyHandler:&stru_10004CC48];

  unsigned int v35 = [v17 numberOfClusters];
  uint64_t v36 = [(FATVolume *)self systemInfo];
  unsigned int v37 = [v36 bytesPerCluster];

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100012DA4;
  v40[3] = &unk_10004C918;
  v40[4] = &v45;
  v40[5] = &v41;
  [v17 preallocate:a5 allowPartial:(v10 & 4) == 0 mustBeContig:0 replyHandler:v40];
  uint64_t v38 = (void *)v46[5];
  if (!v38)
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100012E04;
    v39[3] = &unk_10004CAF0;
    v39[4] = &v45;
    [v17 fetchFileExtentsFrom:v37 * v35 to:v37 * v35 + a5 usingBlocks:v15 replyHandler:v39];
    uint64_t v38 = (void *)v46[5];
  }
  v16[2](v16, v42[3], v38);
LABEL_13:

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
}

- (FSBlockDeviceResource)resource
{
  return (FSBlockDeviceResource *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResource:(id)a3
{
}

- (DirNameCachePool)nameCachePool
{
  return (DirNameCachePool *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNameCachePool:(id)a3
{
}

- (FileSystemInfo)systemInfo
{
  return (FileSystemInfo *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSystemInfo:(id)a3
{
}

- (FATManager)fatManager
{
  return (FATManager *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFatManager:(id)a3
{
}

- (ItemCache)itemCache
{
  return (ItemCache *)objc_getProperty(self, a2, 48, 1);
}

- (void)setItemCache:(id)a3
{
}

- (DirItem)rootItem
{
  return (DirItem *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRootItem:(id)a3
{
}

- (int)GetGMTDiffOffset
{
  return self->_gmtDiffOffset;
}

- (NSMutableArray)preAllocatedOpenFiles
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPreAllocatedOpenFiles:(id)a3
{
}

- (NSMutableArray)nextAvailableFileID
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNextAvailableFileID:(id)a3
{
}

- (NSMutableArray)openUnlinkedFiles
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOpenUnlinkedFiles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openUnlinkedFiles, 0);
  objc_storeStrong((id *)&self->_nextAvailableFileID, 0);
  objc_storeStrong((id *)&self->_preAllocatedOpenFiles, 0);
  objc_storeStrong((id *)&self->_rootItem, 0);
  objc_storeStrong((id *)&self->_itemCache, 0);
  objc_storeStrong((id *)&self->_fatManager, 0);
  objc_storeStrong((id *)&self->_systemInfo, 0);
  objc_storeStrong((id *)&self->_nameCachePool, 0);

  objc_storeStrong((id *)&self->_resource, 0);
}

@end