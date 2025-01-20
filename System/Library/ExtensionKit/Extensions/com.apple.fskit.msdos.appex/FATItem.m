@interface FATItem
+ (id)dynamicCast:(id)a3;
- (BOOL)isDeleted;
- (BOOL)shouldUpdateMTimeInSetAttr:(id)a3;
- (DirEntryData)entryData;
- (FATItem)parentDir;
- (FATVolume)volume;
- (NSString)name;
- (id)flushDirEntryData;
- (id)getAttributes:(id)a3;
- (id)initInVolume:(id)a3 inDir:(id)a4 startingAt:(unsigned int)a5 withData:(id)a6 andName:(id)a7 isRoot:(BOOL)a8;
- (id)reclaim;
- (id)setAttributes:(id)a3;
- (unint64_t)getFileID;
- (unsigned)firstCluster;
- (unsigned)firstClusterInLastAllocation;
- (unsigned)firstClusterIndexInLastAllocation;
- (unsigned)lastCluster;
- (unsigned)numberOfClusters;
- (void)purgeMetaBlocksFromCache:(id)a3;
- (void)setDeleted;
- (void)setEntryData:(id)a3;
- (void)setFirstCluster:(unsigned int)a3;
- (void)setFirstClusterInLastAllocation:(unsigned int)a3;
- (void)setFirstClusterIndexInLastAllocation:(unsigned int)a3;
- (void)setIsDeleted:(BOOL)a3;
- (void)setLastCluster:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setNumberOfClusters:(unsigned int)a3;
- (void)setParentDir:(id)a3;
- (void)setVolume:(id)a3;
@end

@implementation FATItem

+ (id)dynamicCast:(id)a3
{
  id v3 = a3;
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)initInVolume:(id)a3 inDir:(id)a4 startingAt:(unsigned int)a5 withData:(id)a6 andName:(id)a7 isRoot:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v31 = a6;
  id v30 = a7;
  uint64_t v42 = 0;
  v43[0] = &v42;
  v43[1] = 0x3032000000;
  v43[2] = sub_1000168D0;
  v43[3] = sub_1000168E0;
  id v44 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  int v41 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  int v37 = 0;
  v33.receiver = self;
  v33.super_class = (Class)FATItem;
  v16 = [(FATItem *)&v33 init];
  v17 = v16;
  if (!v16) {
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v16->_volume, a3);
  v17->_firstCluster = a5;
  objc_storeStrong((id *)&v17->_entryData, a6);
  objc_storeStrong((id *)&v17->_name, a7);
  objc_storeStrong((id *)&v17->_parentDir, a4);
  v17->_isDeleted = 0;
  if (!v17->_firstCluster) {
    goto LABEL_8;
  }
  v18 = [(FATVolume *)v17->_volume fatManager];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000168E8;
  v32[3] = &unk_10004C5B8;
  v32[4] = &v42;
  v32[5] = &v38;
  v32[6] = &v34;
  [v18 clusterChainLength:v17 replyHandler:v32];

  if (!*(void *)(v43[0] + 40))
  {
    v17->_numberOfClusters = *((_DWORD *)v39 + 6);
    v17->_lastCluster = *((_DWORD *)v35 + 6);
LABEL_8:
    v28 = v17;
    v27 = v30;
    v26 = v31;
    goto LABEL_9;
  }
  v19 = fskit_std_log();
  v27 = v30;
  v26 = v31;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10002FBF4((uint64_t)v43, v19, v20, v21, v22, v23, v24, v25);
  }

  v28 = 0;
LABEL_9:
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v28;
}

- (unint64_t)getFileID
{
  id v3 = [(FATItem *)self volume];
  v4 = [(FATItem *)self entryData];
  id v5 = [v3 getFileID:v4];

  return (unint64_t)v5;
}

- (void)setDeleted
{
  if (![(FATItem *)self isDeleted])
  {
    id v3 = [(FATItem *)self volume];
    v4 = [v3 openUnlinkedFiles];

    objc_sync_enter(v4);
    id v5 = [(FATItem *)self volume];
    v6 = [v5 openUnlinkedFiles];
    v7 = [v6 objectAtIndex:0];
    v8 = (char *)[v7 unsignedLongLongValue];

    v9 = [(FATItem *)self volume];
    v10 = [v9 openUnlinkedFiles];
    v11 = +[NSNumber numberWithUnsignedLongLong:v8 + 1];
    [v10 replaceObjectAtIndex:0 withObject:v11];

    objc_sync_exit(v4);
    [(FATItem *)self setIsDeleted:1];
  }
}

- (void)setFirstCluster:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_firstCluster = a3;
  id v7 = [(FATItem *)self entryData];
  id v5 = [(FATItem *)self volume];
  v6 = [v5 systemInfo];
  [v7 setFirstCluster:v3 fileSystemInfo:v6];
}

- (id)getAttributes:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)FSItemAttributes);
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  if ([v4 isAttributeWanted:8])
  {
    v6 = [(FATItem *)self entryData];
    if (v6)
    {
      id v7 = [(FATItem *)self entryData];
      objc_msgSend(v5, "setType:", objc_msgSend(v7, "type"));
    }
    else
    {
      [v5 setType:0];
    }
  }
  if ([v4 isAttributeWanted:4]) {
    [v5 setMode:448];
  }
  if ([v4 isAttributeWanted:16]) {
    [v5 setLinkCount:1];
  }
  unsigned int v8 = [(FATItem *)self numberOfClusters];
  v9 = [(FATItem *)self volume];
  v10 = [v9 systemInfo];
  unint64_t v11 = [v10 bytesPerCluster] * (unint64_t)v8;

  if ([v4 isAttributeWanted:128]) {
    [v5 setAllocSize:v11];
  }
  uint64_t v12 = [(FATItem *)self entryData];
  if (v12)
  {
    v13 = (void *)v12;
    unsigned int v14 = [v4 isAttributeWanted:64];

    if (v14)
    {
      id v15 = [(FATItem *)self entryData];
      id v16 = [v15 type];

      if (v16 == (id)2)
      {
        [v5 setSize:v11];
      }
      else
      {
        v17 = [(FATItem *)self entryData];
        id v18 = [v17 type];

        if (v18 == (id)1)
        {
          v19 = [(FATItem *)self entryData];
          objc_msgSend(v5, "setSize:", objc_msgSend(v19, "getValidDataLength"));
        }
      }
    }
  }
  if ([v4 isAttributeWanted:256]) {
    objc_msgSend(v5, "setFileID:", -[FATItem getFileID](self, "getFileID"));
  }
  if ([v4 isAttributeWanted:512])
  {
    uint64_t v20 = [(FATItem *)self parentDir];

    if (v20)
    {
      uint64_t v21 = [(FATItem *)self parentDir];
      objc_msgSend(v5, "setParentID:", objc_msgSend(v21, "getFileID"));
    }
    else
    {
      uint64_t v22 = +[FATItem dynamicCast:self];
      uint64_t v21 = v22;
      if (v22)
      {
        if ([v22 isRoot])
        {
          uint64_t v23 = [(FATItem *)self volume];
          objc_msgSend(v5, "setParentID:", -[NSObject getNextAvailableFileID](v23, "getNextAvailableFileID"));
        }
        else
        {
          uint64_t v23 = fskit_std_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
            sub_10002FD00(v23);
          }
        }
      }
      else
      {
        uint64_t v23 = fskit_std_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          sub_10002FC7C(v23);
        }
      }
    }
  }
  if ([v4 isAttributeWanted:32])
  {
    uint64_t v24 = [(FATItem *)self entryData];
    objc_msgSend(v5, "setFlags:", objc_msgSend(v24, "bsdFlags"));
  }
  [v5 setInhibitKernelOffloadedIO:0];
  if ([v4 isAttributeWanted:0x8000])
  {
    uint64_t v25 = [(FATItem *)self entryData];

    if (v25)
    {
      v26 = [(FATItem *)self entryData];
      [v26 getAccessTime:&v34];

      objc_msgSend(v5, "setAccessTime:", v34, v35);
    }
  }
  if ([v4 isAttributeWanted:4096])
  {
    v27 = [(FATItem *)self entryData];

    if (v27)
    {
      v28 = [(FATItem *)self entryData];
      [v28 getModifyTime:&v34];

      objc_msgSend(v5, "setModifyTime:", v34, v35);
    }
  }
  if ([v4 isAttributeWanted:0x4000])
  {
    v29 = [(FATItem *)self entryData];

    if (v29)
    {
      id v30 = [(FATItem *)self entryData];
      [v30 getChangeTime:&v34];

      objc_msgSend(v5, "setChangeTime:", v34, v35);
    }
  }
  if ([v4 isAttributeWanted:0x10000])
  {
    id v31 = [(FATItem *)self entryData];

    if (v31)
    {
      v32 = [(FATItem *)self entryData];
      [v32 getBirthTime:&v34];

      objc_msgSend(v5, "setBirthTime:", v34, v35);
    }
  }

  return v5;
}

- (BOOL)shouldUpdateMTimeInSetAttr:(id)a3
{
  id v3 = a3;
  if ([v3 isValid:64]) {
    unsigned int v4 = [v3 isValid:4096] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)setAttributes:(id)a3
{
  id v4 = a3;
  id v5 = +[FATItem dynamicCast:self];
  v6 = [(FATItem *)self entryData];
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  if (v5
    && [v5 isRoot]
    && ([v5 entryData], id v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    id v16 = 0;
  }
  else
  {
    [v6 setArchiveBit];
    unsigned int v8 = [v4 isValid:64];
    if (v8)
    {
      v9 = +[FATItem dynamicCast:self];
      if (!v9)
      {
        id v16 = fs_errorForPOSIXError();
LABEL_14:

        goto LABEL_44;
      }
      unsigned int v10 = [(FATItem *)self numberOfClusters];
      unint64_t v11 = [(FATItem *)self volume];
      uint64_t v12 = [v11 systemInfo];
      unint64_t v13 = [v12 bytesPerCluster] * v10;

      if ((unint64_t)[v4 size] > v13
        || (id v14 = [v4 size], v14 < objc_msgSend(v6, "getSize")))
      {
        uint64_t v15 = objc_msgSend(v9, "truncateTo:allowPartial:mustBeContig:", objc_msgSend(v4, "size"), 0, 0);
        if (v15)
        {
          id v16 = (void *)v15;
          v17 = fskit_std_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_10002FD84(v4, v17);
          }

          goto LABEL_14;
        }
      }
      objc_msgSend(v6, "setSize:", objc_msgSend(v4, "size"));
      objc_msgSend(v6, "setValidDataLength:", objc_msgSend(v4, "size"));
      if ([v9 isPreAllocated])
      {
        unint64_t v19 = (unint64_t)[v6 getSize];
        uint64_t v20 = [(FATItem *)self volume];
        uint64_t v21 = [v20 systemInfo];
        unint64_t v22 = v19 % [v21 bytesPerCluster];
        unint64_t v23 = (unint64_t)[v6 getSize];
        v43 = v21;
        id v44 = v20;
        unint64_t v42 = v22;
        if (v22)
        {
          int v41 = [(FATItem *)self volume];
          uint64_t v40 = [v41 systemInfo];
          unsigned int v24 = [v40 bytesPerCluster];
          unint64_t v25 = (unint64_t)[v6 getSize];
          v39 = [(FATItem *)self volume];
          uint64_t v38 = [v39 systemInfo];
          unsigned int v26 = [v38 bytesPerCluster];
          v23 += v24 + v25 / v26 * v26 - v25;
        }
        v27 = [(FATItem *)self volume];
        v28 = [v27 systemInfo];
        unint64_t v29 = v23 / [v28 bytesPerCluster];
        uint64_t v30 = [v9 numberOfClusters];

        if (v42)
        {
        }
        if (v29 == v30) {
          [v9 setPreAllocated:0];
        }
      }

      uint64_t v18 = 64;
    }
    else
    {
      uint64_t v18 = 0;
    }
    unsigned __int8 v31 = [(FATItem *)self isDeleted];
    if (!v5
      || (v31 & 1) != 0
      || ([v5 isRoot] & 1) != 0
      || ([v4 isValid:0x8000] & 1) == 0
      && ([v4 isValid:4096] & 1) == 0
      && ![v4 isValid:0x10000]
      || ([v5 updateDotDirEntryTimes:v4], (id v16 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if ([v4 isValid:0x8000])
      {
        __tp.tv_sec = (__darwin_time_t)[v4 accessTime];
        __tp.tv_nsec = v32;
        [v6 setAccessTime:&__tp];
        v18 |= 0x8000uLL;
        unsigned int v8 = 1;
      }
      if ([v4 isValid:4096])
      {
        __tp.tv_sec = (__darwin_time_t)[v4 modifyTime];
        __tp.tv_nsec = v33;
        [v6 setModifyTime:&__tp];
        v18 |= 0x1000uLL;
        unsigned int v8 = 1;
      }
      if ([v4 isValid:0x10000])
      {
        __tp.tv_sec = (__darwin_time_t)[v4 birthTime];
        __tp.tv_nsec = v34;
        [v6 setBirthTime:&__tp];
        v18 |= 0x10000uLL;
        unsigned int v8 = 1;
      }
      if ([v4 isValid:32])
      {
        id v16 = objc_msgSend(v6, "setBsdFlags:", objc_msgSend(v4, "flags"));
        unsigned int v8 = 1;
      }
      else
      {
        id v16 = 0;
      }
      [v4 setConsumedAttributes:v18];
      unsigned int v35 = [(FATItem *)self shouldUpdateMTimeInSetAttr:v4];
      if (v8 && v35)
      {
        clock_gettime(_CLOCK_REALTIME, &__tp);
        [v6 setModifyTime:&__tp];
      }
      id v36 = [(FATItem *)self flushDirEntryData];
    }
  }
LABEL_44:

  return v16;
}

- (id)flushDirEntryData
{
  id v3 = +[FATItem dynamicCast:self];
  if ([(FATItem *)self isDeleted])
  {
    id v4 = 0;
    goto LABEL_7;
  }
  id v5 = [(FATItem *)self parentDir];
  id v6 = +[FATItem dynamicCast:v5];

  if (v6) {
    goto LABEL_6;
  }
  if ([v3 isRoot])
  {
    id v6 = v3;
LABEL_6:
    id v7 = [(FATItem *)self entryData];
    id v4 = [v6 writeDirEntryDataToDisk:v7];

    goto LABEL_7;
  }
  v9 = fskit_std_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10002FE24(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  id v4 = fs_errorForPOSIXError();
LABEL_7:

  return v4;
}

- (id)reclaim
{
  id v4 = +[FATItem dynamicCast:self];
  if ([(FATItem *)self isDeleted])
  {
    if (self->_numberOfClusters)
    {
      if (v4) {
        [v4 purgeMetaBlocksFromCache:&stru_10004CCF8];
      }
      id v5 = [(FATItem *)self volume];
      id v6 = [v5 fatManager];
      [v6 setDirtyBitValue:1 replyHandler:&stru_10004CD18];

      id v7 = [(FATItem *)self volume];
      unsigned int v8 = [v7 fatManager];
      objc_msgSend(v8, "freeClusters:ofItem:replyHandler:", -[FATItem numberOfClusters](self, "numberOfClusters"), self, &stru_10004CD38);
    }
    v9 = [(FATItem *)self volume];
    uint64_t v10 = [v9 openUnlinkedFiles];

    objc_sync_enter(v10);
    uint64_t v11 = [(FATItem *)self volume];
    uint64_t v12 = [v11 openUnlinkedFiles];
    uint64_t v13 = [v12 objectAtIndex:0];
    uint64_t v14 = (char *)[v13 unsignedLongLongValue];

    if (v14)
    {
      uint64_t v15 = [(FATItem *)self volume];
      uint64_t v16 = [v15 openUnlinkedFiles];
      v17 = +[NSNumber numberWithUnsignedLongLong:v14 - 1];
      [v16 replaceObjectAtIndex:0 withObject:v17];
    }
    else
    {
      uint64_t v15 = fskit_std_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10002FE9C(v15, v18, v19, v20, v21, v22, v23, v24);
      }
    }

    objc_sync_exit(v10);
  }
  unint64_t v25 = +[FATItem dynamicCast:self];
  unsigned int v26 = v25;
  if (v25 && [v25 isPreAllocated])
  {
    v53 = v4;
    v52 = [v26 entryData];
    unint64_t v27 = (unint64_t)[v52 getSize];
    v51 = [(FATItem *)self volume];
    v28 = [v51 systemInfo];
    unint64_t v29 = v27 % [v28 bytesPerCluster];
    uint64_t v30 = [v26 entryData];
    unint64_t v31 = (unint64_t)[v30 getSize];
    if (v29)
    {
      v50 = [(FATItem *)self volume];
      v49 = [v50 systemInfo];
      unsigned int v32 = [v49 bytesPerCluster];
      v48 = [v26 entryData];
      unint64_t v33 = (unint64_t)[v48 getSize];
      unint64_t v27 = [(FATItem *)self volume];
      v2 = [(id)v27 systemInfo];
      unsigned int v34 = [v2 bytesPerCluster];
      v31 += v32 + v33 / v34 * v34 - v33;
    }
    unsigned int v35 = [(FATItem *)self volume];
    id v36 = [v35 systemInfo];
    unint64_t v37 = v31 / [v36 bytesPerCluster];

    if (v29)
    {
    }
    unsigned int v38 = [v26 numberOfClusters];
    id v4 = v53;
    if (v37 < v38)
    {
      unsigned int v39 = v38;
      uint64_t v40 = [(FATItem *)self volume];
      int v41 = [v40 fatManager];
      [v41 setDirtyBitValue:1 replyHandler:&stru_10004CD58];

      unint64_t v42 = [(FATItem *)self volume];
      v43 = [v42 fatManager];
      [v43 freeClusters:v39 - v37 ofItem:v26 replyHandler:&stru_10004CD78];

      [v26 setPreAllocated:0];
    }
  }
  id v44 = +[FATItem dynamicCast:self];
  if (v44)
  {
    v45 = [(FATItem *)self volume];
    v46 = [v45 nameCachePool];
    [v46 removeNameCacheForDir:v44];
  }
  return 0;
}

- (void)purgeMetaBlocksFromCache:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = +[FATItem dynamicCast:self];

  if (v5)
  {
    id v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100030110(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  uint64_t v14 = fs_errorForPOSIXError();
  v4[2](v4, v14);
}

- (FATVolume)volume
{
  return (FATVolume *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVolume:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setName:(id)a3
{
}

- (BOOL)isDeleted
{
  return self->_isDeleted;
}

- (void)setIsDeleted:(BOOL)a3
{
  self->_isDeleted = a3;
}

- (FATItem)parentDir
{
  return (FATItem *)objc_getProperty(self, a2, 48, 1);
}

- (void)setParentDir:(id)a3
{
}

- (unsigned)firstCluster
{
  return self->_firstCluster;
}

- (unsigned)firstClusterInLastAllocation
{
  return self->_firstClusterInLastAllocation;
}

- (void)setFirstClusterInLastAllocation:(unsigned int)a3
{
  self->_firstClusterInLastAllocation = a3;
}

- (unsigned)firstClusterIndexInLastAllocation
{
  return self->_firstClusterIndexInLastAllocation;
}

- (void)setFirstClusterIndexInLastAllocation:(unsigned int)a3
{
  self->_firstClusterIndexInLastAllocation = a3;
}

- (unsigned)lastCluster
{
  return self->_lastCluster;
}

- (void)setLastCluster:(unsigned int)a3
{
  self->_lastCluster = a3;
}

- (unsigned)numberOfClusters
{
  return self->_numberOfClusters;
}

- (void)setNumberOfClusters:(unsigned int)a3
{
  self->_numberOfClusters = a3;
}

- (DirEntryData)entryData
{
  return (DirEntryData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEntryData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryData, 0);
  objc_storeStrong((id *)&self->_parentDir, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_volume, 0);
}

@end