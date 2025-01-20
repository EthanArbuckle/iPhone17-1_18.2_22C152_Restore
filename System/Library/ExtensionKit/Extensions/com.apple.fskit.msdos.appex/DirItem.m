@interface DirItem
- (BOOL)isFat1216RootDir;
- (BOOL)isRoot;
- (DirNameCache)dirNameCache;
- (OS_dispatch_semaphore)sem;
- (id)checkIfEmpty;
- (id)createDotEntriesWithAttrs:(id)a3;
- (id)fillNameCache:(id)a3;
- (id)initInVolume:(id)a3 inDir:(id)a4 startingAt:(unsigned int)a5 withData:(id)a6 andName:(id)a7 isRoot:(BOOL)a8;
- (id)markDirEntriesAsDeleted:(id)a3;
- (id)markDirEntriesAsDeletedAndUpdateMtime:(id)a3;
- (id)updateDotDirEntryTimes:(id)a3;
- (id)updateModificationTimeOnCreateRemove;
- (id)verifyCookieOffset:(unsigned int)a3;
- (id)writeDirEntriesToDisk:(id)a3 atOffset:(unint64_t)a4 name:(unistr255 *)a5 numberOfEntries:(unsigned int)a6;
- (id)writeDirEntryDataToDisk:(id)a3;
- (unint64_t)dirVersion;
- (unint64_t)getDirBlockSize;
- (unint64_t)getDirSize;
- (unint64_t)offsetForNewEntry;
- (unsigned)dirEntrySize;
- (unsigned)maxRADirBlock;
- (unsigned)tableBusyCount;
- (void)createEntrySetForName:(unistr255 *)a3 itemType:(int64_t)a4 firstCluster:(unsigned int)a5 attrs:(id)a6 offsetInDir:(unint64_t)a7 hidden:(BOOL)a8 replyHandler:(id)a9;
- (void)createNewDirEntryNamed:(id)a3 type:(int64_t)a4 attributes:(id)a5 firstDataCluster:(unsigned int)a6 replyHandler:(id)a7;
- (void)findFreeSlots:(unsigned int)a3 useOffsetHint:(BOOL)a4 offsetHint:(unint64_t)a5 replyHandler:(id)a6;
- (void)getDirEntryOffsetByIndex:(unsigned int)a3 replyHandler:(id)a4;
- (void)iterateDirEntriesAtOffset:(unint64_t)a3 numEntries:(unsigned int)a4 shouldWriteToDisk:(BOOL)a5 replyHandler:(id)a6;
- (void)iterateFromOffset:(unint64_t)a3 options:(unsigned int)a4 replyHandler:(id)a5;
- (void)lookupDirEntryNamed:(id)a3 dirNameCache:(id)a4 lookupOffset:(unint64_t *)a5 replyHandler:(id)a6;
- (void)purgeMetaBlocksFromCache:(id)a3;
- (void)setDirNameCache:(id)a3;
- (void)setDirVersion:(unint64_t)a3;
- (void)setIsRoot:(BOOL)a3;
- (void)setMaxRADirBlock:(unsigned int)a3;
- (void)setOffsetForNewEntry:(unint64_t)a3;
- (void)setSem:(id)a3;
- (void)setTableBusyCount:(unsigned int)a3;
@end

@implementation DirItem

- (id)initInVolume:(id)a3 inDir:(id)a4 startingAt:(unsigned int)a5 withData:(id)a6 andName:(id)a7 isRoot:(BOOL)a8
{
  BOOL v8 = a8;
  v13.receiver = self;
  v13.super_class = (Class)DirItem;
  id v9 = -[FATItem initInVolume:inDir:startingAt:withData:andName:isRoot:](&v13, "initInVolume:inDir:startingAt:withData:andName:isRoot:", a3, a4, *(void *)&a5, a6, a7);
  v10 = v9;
  if (v9)
  {
    [v9 setIsRoot:v8];
    [v10 setDirVersion:1];
    [v10 setMaxRADirBlock:0];
    [v10 setOffsetForNewEntry:0];
    dispatch_semaphore_t v11 = dispatch_semaphore_create(1);
    [v10 setSem:v11];
  }
  return v10;
}

- (unint64_t)getDirBlockSize
{
  return 0;
}

- (unint64_t)getDirSize
{
  return 0;
}

- (unsigned)dirEntrySize
{
  return 0;
}

- (id)createDotEntriesWithAttrs:(id)a3
{
  return 0;
}

- (id)updateModificationTimeOnCreateRemove
{
  return 0;
}

- (id)updateDotDirEntryTimes:(id)a3
{
  return 0;
}

- (void)iterateFromOffset:(unint64_t)a3 options:(unsigned int)a4 replyHandler:(id)a5
{
  id v6 = a5;
  fs_errorForPOSIXError();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, uint64_t, void, void, void))a5 + 2))(v6, v7, 4, 0, 0, 0);
}

- (id)writeDirEntriesToDisk:(id)a3 atOffset:(unint64_t)a4 name:(unistr255 *)a5 numberOfEntries:(unsigned int)a6
{
  return (id)fs_errorForPOSIXError();
}

- (id)markDirEntriesAsDeleted:(id)a3
{
  return (id)fs_errorForPOSIXError();
}

- (id)writeDirEntryDataToDisk:(id)a3
{
  return (id)fs_errorForPOSIXError();
}

- (void)createEntrySetForName:(unistr255 *)a3 itemType:(int64_t)a4 firstCluster:(unsigned int)a5 attrs:(id)a6 offsetInDir:(unint64_t)a7 hidden:(BOOL)a8 replyHandler:(id)a9
{
  id v9 = a9;
  fs_errorForPOSIXError();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void))a9 + 2))(v9, v10, 0);
}

- (id)verifyCookieOffset:(unsigned int)a3
{
  return (id)fs_errorForPOSIXError();
}

- (BOOL)isFat1216RootDir
{
  BOOL v3 = [(DirItem *)self isRoot];
  if (v3)
  {
    v4 = [(FATItem *)self volume];
    v5 = [v4 systemInfo];
    unsigned __int8 v6 = [v5 isFAT12Or16];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (void)lookupDirEntryNamed:(id)a3 dirNameCache:(id)a4 lookupOffset:(unint64_t *)a5 replyHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, uint64_t, void))a6;
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x2020000000;
  uint64_t v91 = 0;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x2020000000;
  char v87 = 0;
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x2020000000;
  char v83 = 0;
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x3032000000;
  v77 = sub_100006884;
  v78 = sub_100006894;
  id v79 = 0;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = sub_100006884;
  v72 = sub_100006894;
  id v73 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x22010000000;
  v35 = &unk_100049CD6;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  if (v10)
  {
    objc_super v13 = [(FATItem *)self volume];
    id v14 = v10;
    if (+[Utilities isDotOrDotDot:length:](Utilities, "isDotOrDotDot:length:", [v14 UTF8String], objc_msgSend(v14, "length")))
    {
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v15 = 32;
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10000689C;
    v31[3] = &unk_10004C5E0;
    v31[4] = &v74;
    v31[5] = &v32;
    [v13 nameToUnistr:v14 flags:v15 replyHandler:v31];

    uint64_t v16 = v75[5];
    if (v16) {
      goto LABEL_13;
    }
    CONV_Unistr255ToLowerCase((_WORD *)v33 + 16);
    if (a5)
    {
      unint64_t v17 = *a5;
    }
    else
    {
      if (v11)
      {
        v19 = v33 + 4;
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100006924;
        v26[3] = &unk_10004C608;
        v28 = &v88;
        v29 = &v84;
        id v27 = v11;
        v30 = &v74;
        [v27 lookupDirEntryNamedUtf16:v19 replyHandler:v26];
      }
      unint64_t v17 = 0;
    }
    uint64_t v16 = v75[5];
    if (v16)
    {
LABEL_13:
      v12[2](v12, v16, 0);
      goto LABEL_14;
    }
    if (*((unsigned char *)v85 + 24))
    {
      uint64_t v20 = v89[3];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000069D4;
      v25[3] = &unk_10004C630;
      v25[4] = &v32;
      v25[5] = &v80;
      v25[6] = &v68;
      [(DirItem *)self iterateFromOffset:v20 options:0 replyHandler:v25];
    }
    if (!*((unsigned char *)v81 + 24))
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100006ACC;
      v24[3] = &unk_10004C658;
      v24[4] = &v74;
      v24[5] = &v32;
      v24[6] = &v80;
      v24[7] = &v68;
      v24[8] = a5;
      [(DirItem *)self iterateFromOffset:v17 options:0 replyHandler:v24];
      v21 = v75;
      if (*((unsigned char *)v81 + 24) || v75[5]) {
        goto LABEL_21;
      }
      uint64_t v22 = fs_errorForPOSIXError();
      v23 = (void *)v75[5];
      v75[5] = v22;
    }
    v21 = v75;
LABEL_21:
    v12[2](v12, v21[5], v69[5]);
    goto LABEL_14;
  }
  v18 = fs_errorForPOSIXError();
  v12[2](v12, (uint64_t)v18, 0);

LABEL_14:
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v88, 8);
}

- (id)fillNameCache:(id)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  unint64_t v17 = sub_100006884;
  v18 = sub_100006894;
  id v19 = 0;
  BOOL v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_100006D94;
  id v11 = &unk_10004C680;
  objc_super v13 = &v14;
  id v4 = a3;
  id v12 = v4;
  [(DirItem *)self iterateFromOffset:0 options:0 replyHandler:&v8];
  v5 = (void *)v15[5];
  if (v5)
  {
    objc_msgSend(v4, "setIsIncomplete:", 1, v8, v9, v10, v11);
    v5 = (void *)v15[5];
  }
  id v6 = v5;

  _Block_object_dispose(&v14, 8);

  return v6;
}

- (void)findFreeSlots:(unsigned int)a3 useOffsetHint:(BOOL)a4 offsetHint:(unint64_t)a5 replyHandler:(id)a6
{
  BOOL v7 = a4;
  id v10 = (void (**)(id, uint64_t, uint64_t, BOOL))a6;
  unint64_t v11 = 0;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = sub_100006884;
  v72 = sub_100006894;
  id v73 = 0;
  uint64_t v64 = 0;
  long long v65 = &v64;
  uint64_t v66 = 0x2020000000;
  int v67 = 0;
  uint64_t v60 = 0;
  long long v61 = &v60;
  uint64_t v62 = 0x2020000000;
  uint64_t v63 = 0;
  uint64_t v56 = 0;
  long long v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 0;
  if (!v7 || (v12 = [(DirItem *)self getDirSize], unint64_t v11 = a5, v12 > a5))
  {
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100007444;
    v54[3] = &unk_10004C6A8;
    v54[4] = &v68;
    v54[5] = &v56;
    v54[6] = &v64;
    v54[7] = &v60;
    unsigned int v55 = a3;
    [(DirItem *)self iterateFromOffset:v11 options:0 replyHandler:v54];
    if (v69[5])
    {
      objc_super v13 = fskit_std_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10002C2A0();
      }

      uint64_t v14 = 0;
      uint64_t v15 = v69[5];
      BOOL v16 = 1;
      goto LABEL_9;
    }
  }
  if (*((_DWORD *)v65 + 6) == a3)
  {
    uint64_t v15 = 0;
    uint64_t v14 = v61[3];
    BOOL v16 = *((unsigned char *)v57 + 24) != 0;
LABEL_9:
    v10[2](v10, v15, v14, v16);
    goto LABEL_10;
  }
  unint64_t v17 = [(FATItem *)self volume];
  v18 = [v17 systemInfo];
  unsigned int v19 = [v18 bytesPerCluster];

  unint64_t v20 = [(DirItem *)self getDirSize];
  if (*((_DWORD *)v65 + 6))
  {
    uint64_t v21 = v61[3];
    unint64_t v22 = (v20 - v21) / [(DirItem *)self dirEntrySize];
    if (v22 >= a3)
    {
      v10[2](v10, 0, v61[3], *((unsigned __int8 *)v57 + 24));
      goto LABEL_10;
    }
  }
  else
  {
    LODWORD(v22) = 0;
  }
  if (![(DirItem *)self isFat1216RootDir])
  {
    unint64_t v32 = v19;
    uint64_t v33 = [(DirItem *)self dirEntrySize] * (a3 - v22);
    uint64_t v50 = 0;
    long long v51 = &v50;
    uint64_t v52 = 0x2020000000;
    int v53 = 0;
    uint64_t v34 = v33 % v19;
    uint64_t v46 = 0;
    long long v47 = &v46;
    if (v34) {
      uint64_t v35 = v19 - v34;
    }
    else {
      uint64_t v35 = 0;
    }
    uint64_t v48 = 0x2020000000;
    int v49 = 0;
    long long v36 = [(FATItem *)self volume];
    long long v37 = [v36 fatManager];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100007594;
    v45[3] = &unk_10004C6D0;
    v45[4] = &v68;
    v45[5] = &v64;
    v45[6] = &v60;
    v45[7] = &v50;
    v45[8] = &v46;
    v45[9] = v20;
    [v37 allocateClusters:(v35 + v33) / v32 forItem:self allowPartial:0 mustBeContig:0 zeroFill:0 replyHandler:v45];

    if (v69[5])
    {
      long long v38 = fskit_std_log();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_10002C22C();
      }
    }
    else
    {
      long long v39 = [(FATItem *)self volume];
      uint64_t v40 = [v39 clearNewDirClustersFrom:*((unsigned int *)v51 + 6) amount:*((unsigned int *)v47 + 6)];
      long long v41 = (void *)v69[5];
      v69[5] = v40;

      if (!v69[5])
      {
        uint64_t v43 = 0;
        uint64_t v42 = v61[3];
        BOOL v44 = *((unsigned char *)v57 + 24) != 0;
        goto LABEL_29;
      }
      long long v38 = fskit_std_log();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_10002C1B8();
      }
    }

    uint64_t v42 = 0;
    uint64_t v43 = v69[5];
    BOOL v44 = 1;
LABEL_29:
    v10[2](v10, v43, v42, v44);
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v50, 8);
    goto LABEL_10;
  }
  v23 = fskit_std_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_10002C140(v23, v24, v25, v26, v27, v28, v29, v30);
  }

  v31 = fs_errorForPOSIXError();
  v10[2](v10, (uint64_t)v31, 0, 1);

LABEL_10:
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
}

- (void)createNewDirEntryNamed:(id)a3 type:(int64_t)a4 attributes:(id)a5 firstDataCluster:(unsigned int)a6 replyHandler:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a5;
  uint64_t v14 = (void (**)(id, uint64_t, void))a7;
  uint64_t v107 = 0;
  v108 = &v107;
  uint64_t v109 = 0x3032000000;
  v110 = sub_100006884;
  v111 = sub_100006894;
  id v112 = 0;
  unsigned __int8 v15 = [v13 isValid:4];
  if (a4 == 2) {
    char v16 = 1;
  }
  else {
    char v16 = v15;
  }
  if (v16)
  {
    if (!v8
      || ([(FATItem *)self volume],
          unint64_t v17 = objc_claimAutoreleasedReturnValue(),
          [v17 systemInfo],
          v18 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v19 = [v18 isClusterValid:v8],
          v18,
          v17,
          (v19 & 1) != 0))
    {
      uint64_t v71 = 0;
      v72 = &v71;
      uint64_t v73 = 0x22010000000;
      uint64_t v74 = &unk_100049CD6;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      unint64_t v20 = [(FATItem *)self volume];
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_100007DEC;
      v70[3] = &unk_10004C5E0;
      v70[4] = &v107;
      v70[5] = &v71;
      [v20 nameToUnistr:v12 flags:0 replyHandler:v70];

      if (v108[5])
      {
        uint64_t v21 = fskit_std_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_10002C4F0();
        }

        v14[2](v14, v108[5], 0);
        goto LABEL_33;
      }
      uint64_t v66 = 0;
      int v67 = &v66;
      uint64_t v68 = 0x2020000000;
      int v69 = 0;
      v31 = [(FATItem *)self volume];
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_100007E74;
      v65[3] = &unk_10004C6F8;
      v65[4] = &v107;
      v65[5] = &v66;
      memcpy(__dst, v72 + 4, sizeof(__dst));
      [v31 calcNumOfDirEntriesForName:__dst replyHandler:v65];

      if (v108[5])
      {
        unint64_t v32 = fskit_std_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_10002C47C();
        }

        v14[2](v14, v108[5], 0);
        goto LABEL_32;
      }
      uint64_t v60 = 0;
      long long v61 = &v60;
      uint64_t v62 = 0x2020000000;
      uint64_t v63 = 0;
      uint64_t v56 = 0;
      long long v57 = &v56;
      uint64_t v58 = 0x2020000000;
      char v59 = 0;
      uint64_t v33 = *((unsigned int *)v67 + 6);
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_100007EF0;
      v55[3] = &unk_10004C720;
      v55[4] = &v107;
      v55[5] = &v60;
      v55[6] = &v56;
      [(DirItem *)self findFreeSlots:v33 useOffsetHint:1 offsetHint:[(DirItem *)self offsetForNewEntry] replyHandler:v55];
      uint64_t v34 = v108[5];
      if (v34)
      {
        v14[2](v14, v34, 0);
LABEL_31:
        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v60, 8);
LABEL_32:
        _Block_object_dispose(&v66, 8);
LABEL_33:
        _Block_object_dispose(&v71, 8);
        goto LABEL_34;
      }
      BOOL v35 = *(unsigned __int8 *)[v12 UTF8String] == 46;
      uint64_t v49 = 0;
      uint64_t v50 = &v49;
      uint64_t v51 = 0x3032000000;
      uint64_t v52 = sub_100006884;
      int v53 = sub_100006894;
      id v54 = 0;
      uint64_t v36 = v61[3];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100007F7C;
      v48[3] = &unk_10004C748;
      v48[4] = &v107;
      v48[5] = &v49;
      memcpy(__dst, v72 + 4, sizeof(__dst));
      [(DirItem *)self createEntrySetForName:__dst itemType:a4 firstCluster:v8 attrs:v13 offsetInDir:v36 hidden:v35 replyHandler:v48];
      if (v108[5])
      {
        long long v37 = fskit_std_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          sub_10002C408();
        }
      }
      else
      {
        uint64_t v38 = v50[5];
        uint64_t v39 = v61[3];
        uint64_t v40 = *((unsigned int *)v67 + 6);
        memcpy(__dst, v72 + 4, sizeof(__dst));
        uint64_t v41 = [(DirItem *)self writeDirEntriesToDisk:v38 atOffset:v39 name:__dst numberOfEntries:v40];
        uint64_t v42 = (void *)v108[5];
        v108[5] = v41;

        if (!v108[5])
        {
          if (*((unsigned char *)v57 + 24))
          {
            uint64_t v45 = 0;
          }
          else
          {
            uint64_t v46 = v61[3];
            int v47 = *((_DWORD *)v67 + 6);
            uint64_t v45 = v46 + [(DirItem *)self dirEntrySize] * v47;
          }
          [(DirItem *)self setOffsetForNewEntry:v45];
          [(DirItem *)self setDirVersion:(char *)[(DirItem *)self dirVersion] + 1];
          uint64_t v44 = 0;
          uint64_t v43 = v61[3];
          goto LABEL_30;
        }
        long long v37 = fskit_std_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          sub_10002C394();
        }
      }

      uint64_t v43 = 0;
      uint64_t v44 = v108[5];
LABEL_30:
      v14[2](v14, v44, v43);
      _Block_object_dispose(&v49, 8);

      goto LABEL_31;
    }
    unint64_t v22 = fskit_std_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10002C564(v8, v22);
    }
  }
  else
  {
    unint64_t v22 = fskit_std_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10002C5F0(v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }

  uint64_t v30 = fs_errorForPOSIXError();
  v14[2](v14, (uint64_t)v30, 0);

LABEL_34:
  _Block_object_dispose(&v107, 8);
}

- (void)iterateDirEntriesAtOffset:(unint64_t)a3 numEntries:(unsigned int)a4 shouldWriteToDisk:(BOOL)a5 replyHandler:(id)a6
{
  uint64_t v9 = (void (**)(id, void *, void))a6;
  unint64_t v10 = [(DirItem *)self getDirBlockSize];
  id v11 = [[DirBlock alloc] initInDir:self];
  id v12 = v11;
  if (!v11)
  {
    char v16 = fs_errorForPOSIXError();
    v9[2](v9, v16, 0);

    goto LABEL_18;
  }
  uint64_t v13 = [v11 readRelativeDirBlockNum:a3 / v10];
  if (!v13)
  {
    unint64_t v29 = a3 / v10;
    if (!a4)
    {
LABEL_17:
      [v12 releaseBlock];
      goto LABEL_18;
    }
    while (1)
    {
      ((void (**)(id, void *, id))v9)[2](v9, 0, [v12 getBytesAtOffset:a3 % v10]);
      a3 += [(DirItem *)self dirEntrySize];
      unint64_t v17 = a3 % v10;
      if (a4 == 1 || !v17)
      {
        v18 = [(FATItem *)self volume];
        unsigned int v19 = objc_msgSend(v18, "isOffsetInMetadataZone:", objc_msgSend(v12, "offsetInVolume"));

        if (v19)
        {
          uint64_t v23 = v12;
          uint64_t v24 = fskit_std_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            sub_10002C668(v23, v24);
          }

          uint64_t v25 = fs_errorForPOSIXError();
          v9[2](v9, v25, 0);

          id v12 = v23;
          goto LABEL_18;
        }
        unint64_t v20 = v12;
        uint64_t v21 = [v12 writeToDisk];
        if (v21)
        {
          uint64_t v14 = (void *)v21;
          uint64_t v26 = fskit_std_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            sub_10002C77C();
          }

          id v12 = v20;
          uint64_t v27 = v20;
          goto LABEL_28;
        }
        if (a4 != 1 && !v17)
        {
          LODWORD(v29) = v29 + 1;
          uint64_t v22 = objc_msgSend(v12, "readRelativeDirBlockNum:");
          if (v22)
          {
            uint64_t v14 = (void *)v22;
            uint64_t v28 = fskit_std_log();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              sub_10002C708();
            }

            uint64_t v27 = v12;
LABEL_28:
            [v27 releaseBlock];
            v9[2](v9, v14, 0);
            goto LABEL_6;
          }
        }
      }
      if (!--a4) {
        goto LABEL_17;
      }
    }
  }
  uint64_t v14 = (void *)v13;
  unsigned __int8 v15 = fskit_std_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10002C7F0();
  }

  [v12 releaseBlock];
  v9[2](v9, v14, 0);
LABEL_6:

LABEL_18:
}

- (id)markDirEntriesAsDeletedAndUpdateMtime:(id)a3
{
  id v4 = [(DirItem *)self markDirEntriesAsDeleted:a3];
  if (v4)
  {
    v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002C8D8(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    id v13 = v4;
  }
  else
  {
    [(DirItem *)self setOffsetForNewEntry:0];
    uint64_t v14 = [(DirItem *)self updateModificationTimeOnCreateRemove];
    if (v14)
    {
      unsigned __int8 v15 = (void *)v14;
      char v16 = fskit_std_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10002C864();
      }
    }
  }

  return v4;
}

- (id)checkIfEmpty
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_100006884;
  uint64_t v9 = sub_100006894;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000084D0;
  v4[3] = &unk_10004C770;
  v4[4] = &v5;
  [(DirItem *)self iterateFromOffset:0 options:0 replyHandler:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)getDirEntryOffsetByIndex:(unsigned int)a3 replyHandler:(id)a4
{
  uint64_t v6 = (void (**)(id, uint64_t, uint64_t, BOOL))a4;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v14 = 0;
  unsigned __int8 v15 = &v14;
  uint64_t v16 = 0x3032000000;
  unint64_t v17 = sub_100006884;
  v18 = sub_100006894;
  id v19 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  int v13 = 0;
  if (a3)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100008844;
    v10[3] = &unk_10004C6A8;
    v10[4] = &v14;
    v10[5] = v12;
    unsigned int v11 = a3;
    v10[6] = &v20;
    v10[7] = &v24;
    [(DirItem *)self iterateFromOffset:0 options:0 replyHandler:v10];
    uint64_t v7 = v15[5];
    uint64_t v8 = v21[3];
    BOOL v9 = *((unsigned char *)v25 + 24) != 0;
  }
  else
  {
    BOOL v9 = 0;
    uint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  v6[2](v6, v7, v8, v9);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

- (void)purgeMetaBlocksFromCache:(id)a3
{
  id v38 = a3;
  id v4 = +[NSMutableArray array];
  uint64_t v5 = [(FATItem *)self volume];
  uint64_t v6 = [v5 systemInfo];
  unint64_t v7 = [v6 bytesPerCluster];

  uint64_t v8 = [(FATItem *)self volume];
  BOOL v9 = [v8 systemInfo];
  unint64_t v10 = (unint64_t)[v9 dirBlockSize];

  uint64_t v11 = [(FATItem *)self firstCluster];
  unsigned int v12 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x2020000000;
  int v50 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  int v46 = 0;
  while (2)
  {
    int v13 = [(FATItem *)self volume];
    uint64_t v14 = [v13 systemInfo];
    unsigned int v15 = [v14 isClusterValid:v11];

    if (v15)
    {
      while (1)
      {
        uint64_t v16 = [(FATItem *)self volume];
        unint64_t v17 = [v16 systemInfo];
        if (![v17 isClusterValid:v11]) {
          break;
        }
        id v18 = [v4 count];

        if ((unint64_t)v18 > 7) {
          goto LABEL_8;
        }
        id v19 = [(FATItem *)self volume];
        uint64_t v20 = [v19 fatManager];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_100008D30;
        v39[3] = &unk_10004C798;
        id v21 = v38;
        id v40 = v21;
        uint64_t v41 = &v47;
        uint64_t v42 = &v43;
        [v20 getContigClusterChainLengthStartingAt:v11 replyHandler:v39];

        v12 += *((_DWORD *)v48 + 6);
        if (v12 > [(FATItem *)self numberOfClusters])
        {
          unint64_t v29 = fskit_std_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_10002CA64(v29, v30, v31, v32, v33, v34, v35, v36);
          }

          (*((void (**)(id, void))v21 + 2))(v21, 0);
          uint64_t v28 = 0;
          goto LABEL_13;
        }
        uint64_t v22 = [(FATItem *)self volume];
        uint64_t v23 = [v22 systemInfo];
        id v24 = [v23 offsetForCluster:v11];
        uint64_t v25 = +[FSMetadataBlockRange rangeWithOffset:v24 blockLength:v10 numberOfBlocks:*((_DWORD *)v48 + 6) * (v7 / v10)];
        [v4 addObject:v25];

        uint64_t v11 = *((unsigned int *)v44 + 6);
      }

LABEL_8:
      uint64_t v26 = [(FATItem *)self volume];
      char v27 = [v26 resource];
      uint64_t v28 = +[Utilities syncMetaPurgeToDevice:v27 rangesToPurge:v4];

      if (!v28)
      {
        [v4 removeAllObjects];
        continue;
      }
      long long v37 = fskit_std_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_10002CADC();
      }
    }
    else
    {
      uint64_t v28 = 0;
    }
    break;
  }
  (*((void (**)(id, void *))v38 + 2))(v38, v28);
LABEL_13:

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
}

- (BOOL)isRoot
{
  return self->_isRoot;
}

- (void)setIsRoot:(BOOL)a3
{
  self->_isRoot = a3;
}

- (unint64_t)dirVersion
{
  return self->_dirVersion;
}

- (void)setDirVersion:(unint64_t)a3
{
  self->_dirVersion = a3;
}

- (DirNameCache)dirNameCache
{
  return (DirNameCache *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDirNameCache:(id)a3
{
}

- (unsigned)tableBusyCount
{
  return self->_tableBusyCount;
}

- (void)setTableBusyCount:(unsigned int)a3
{
  self->_tableBusyCount = a3;
}

- (unsigned)maxRADirBlock
{
  return self->_maxRADirBlock;
}

- (void)setMaxRADirBlock:(unsigned int)a3
{
  self->_maxRADirBlock = a3;
}

- (unint64_t)offsetForNewEntry
{
  return self->_offsetForNewEntry;
}

- (void)setOffsetForNewEntry:(unint64_t)a3
{
  self->_offsetForNewEntry = a3;
}

- (OS_dispatch_semaphore)sem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sem, 0);

  objc_storeStrong((id *)&self->_dirNameCache, 0);
}

@end