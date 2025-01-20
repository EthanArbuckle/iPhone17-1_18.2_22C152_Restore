@interface MsdosDirItem
- (id)createDotEntriesWithAttrs:(id)a3;
- (id)generateUniqueShortName:(char *)a3 offsetInDir:(unint64_t)a4;
- (id)getAttributes:(id)a3;
- (id)initInVolume:(id)a3 inDir:(id)a4 startingAt:(unsigned int)a5 withData:(id)a6 andName:(id)a7 isRoot:(BOOL)a8;
- (id)markDirEntriesAsDeleted:(id)a3;
- (id)updateDotDirEntryTimes:(id)a3;
- (id)updateModificationTimeOnCreateRemove;
- (id)verifyCookieOffset:(unsigned int)a3;
- (id)writeDirEntriesToDisk:(id)a3 atOffset:(unint64_t)a4 name:(unistr255 *)a5 numberOfEntries:(unsigned int)a6;
- (id)writeDirEntryDataToDisk:(id)a3;
- (unint64_t)getDirBlockSize;
- (unint64_t)getDirSize;
- (unint64_t)getFileID;
- (unsigned)dirEntrySize;
- (unsigned)getGenerationNumberOfName:(unistr255 *)a3;
- (unsigned)maxShortNameIndex;
- (void)createEntrySetForName:(unistr255 *)a3 itemType:(int64_t)a4 firstCluster:(unsigned int)a5 attrs:(id)a6 offsetInDir:(unint64_t)a7 hidden:(BOOL)a8 replyHandler:(id)a9;
- (void)isShortNameUniqueInDir:(char *)a3 replyHandler:(id)a4;
- (void)iterateFromOffset:(unint64_t)a3 options:(unsigned int)a4 replyHandler:(id)a5;
- (void)setMaxShortNameIndex:(unsigned int)a3;
@end

@implementation MsdosDirItem

- (id)initInVolume:(id)a3 inDir:(id)a4 startingAt:(unsigned int)a5 withData:(id)a6 andName:(id)a7 isRoot:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MsdosDirItem;
  id v15 = [(DirItem *)&v21 initInVolume:v14 inDir:a4 startingAt:v11 withData:a6 andName:a7 isRoot:v8];
  if (v15)
  {
    if (!v11)
    {
      v16 = [v14 systemInfo];
      if ([v16 type])
      {
        v17 = [v14 systemInfo];
        unsigned int v18 = [v17 type];

        if (v18 != 1) {
          goto LABEL_8;
        }
      }
      else
      {
      }
      [v15 setNumberOfClusters:1];
    }
LABEL_8:
    [v15 setMaxShortNameIndex:0];
    id v19 = v15;
  }

  return v15;
}

- (unint64_t)getDirBlockSize
{
  unsigned int v3 = [(DirItem *)self isFat1216RootDir];
  v4 = [(FATItem *)self volume];
  v5 = [v4 systemInfo];
  v6 = v5;
  if (v3)
  {
    unsigned int v7 = [v5 rootDirSize];
    BOOL v8 = [(FATItem *)self volume];
    v9 = [v8 systemInfo];
    unint64_t v10 = [v9 bytesPerSector] * v7;
  }
  else
  {
    unint64_t v10 = (unint64_t)[v5 dirBlockSize];
  }

  return v10;
}

- (unint64_t)getDirSize
{
  if ([(DirItem *)self isFat1216RootDir])
  {
    unsigned int v3 = [(FATItem *)self volume];
    v4 = [v3 systemInfo];
    unsigned int v5 = [v4 rootDirSize];
    v6 = [(FATItem *)self volume];
    unsigned int v7 = [v6 systemInfo];
    unsigned int v8 = [v7 bytesPerSector] * v5;
  }
  else
  {
    unsigned int v9 = [(FATItem *)self numberOfClusters];
    unsigned int v3 = [(FATItem *)self volume];
    v4 = [v3 systemInfo];
    unsigned int v8 = [v4 bytesPerCluster] * v9;
  }

  return v8;
}

- (unsigned)dirEntrySize
{
  return 32;
}

- (id)createDotEntriesWithAttrs:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100022188;
  v23 = sub_100022198;
  id v24 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000221A0;
  v18[3] = &unk_10004D0A0;
  v18[4] = &v19;
  [(DirItem *)self createNewDirEntryNamed:@"." type:2 attributes:v4 firstDataCluster:[(FATItem *)self firstCluster] replyHandler:v18];
  if (v20[5])
  {
    unsigned int v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100030B1C();
    }

    id v6 = (id)v20[5];
  }
  else
  {
    unsigned int v7 = [(FATItem *)self volume];
    unsigned int v8 = [v7 getAttrRequestForNewDirEntry];

    unsigned int v9 = [(FATItem *)self parentDir];
    unint64_t v10 = [v9 getAttributes:v8];

    uint64_t v11 = [(FATItem *)self parentDir];
    v12 = +[FATItem dynamicCast:v11];
    if ([v12 isRoot])
    {
      id v13 = 0;
    }
    else
    {
      id v14 = [(FATItem *)self parentDir];
      id v13 = [v14 firstCluster];
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100022200;
    v17[3] = &unk_10004D0A0;
    v17[4] = &v19;
    [(DirItem *)self createNewDirEntryNamed:@".." type:2 attributes:v10 firstDataCluster:v13 replyHandler:v17];
    if (v20[5])
    {
      id v15 = fskit_std_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100030AA8();
      }

      id v6 = (id)v20[5];
    }
    else
    {
      id v6 = 0;
    }
  }
  _Block_object_dispose(&v19, 8);

  return v6;
}

- (id)updateModificationTimeOnCreateRemove
{
  unsigned int v3 = [(FATItem *)self volume];
  id v4 = [v3 systemInfo];
  unsigned int v5 = [v4 bytesPerSector];

  id v6 = [[DirBlock alloc] initInDir:self];
  v21[0] = 0;
  v21[1] = 0;
  v20.tv_sec = 0;
  v20.tv_nsec = 0;
  CONV_GetCurrentTime(&v20);
  uint64_t v7 = [v6 readRelativeDirBlockNum:0];
  if (v7)
  {
    unsigned int v8 = (void *)v7;
    [v6 releaseBlock];
    unsigned int v9 = fskit_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100030C04();
    }

    id v10 = v8;
  }
  else
  {
    uint64_t v11 = [MsdosDirEntryData alloc];
    v12 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", [v6 getBytesAtOffset:0], 32);
    id v13 = [(MsdosDirEntryData *)v11 initWithData:v12];

    if ([(DirItem *)self isRoot]
      && (([(MsdosDirEntryData *)v13 getAttrFlags] & 0x3F) == 0xF
       || ([(MsdosDirEntryData *)v13 getAttrFlags] & 8) == 0))
    {
      goto LABEL_13;
    }
    [(MsdosDirEntryData *)v13 getModifyTime:v21];
    if (v21[0] == v20.tv_sec
      || ([(MsdosDirEntryData *)v13 setModifyTime:&v20],
          [(DirEntryData *)v13 data],
          id v14 = objc_claimAutoreleasedReturnValue(),
          id v15 = [v6 setBytes:v14 atOffset:0],
          v14,
          [v6 writeToDiskFromOffset:0 length:v5],
          (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_13:
      [v6 releaseBlock];
      id v10 = 0;
    }
    else
    {
      v17 = (void *)v16;
      unsigned int v18 = fskit_std_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100030B90();
      }

      [v6 releaseBlock];
      id v10 = v17;
    }
  }

  return v10;
}

- (id)updateDotDirEntryTimes:(id)a3
{
  id v4 = a3;
  id v5 = [[DirBlock alloc] initInDir:self];
  uint64_t v6 = objc_msgSend(v5, "readRelativeDirBlockNum:", 0, 0, 0);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    unsigned int v8 = fskit_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100030CEC();
    }

    [v5 releaseBlock];
    id v9 = v7;
  }
  else
  {
    id v10 = [MsdosDirEntryData alloc];
    uint64_t v11 = +[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", [v5 getBytesAtOffset:0], 32);
    v12 = [(MsdosDirEntryData *)v10 initWithData:v11];

    if ([v4 isValid:4096])
    {
      id v21 = [v4 modifyTime];
      uint64_t v22 = v13;
      [(MsdosDirEntryData *)v12 setModifyTime:&v21];
    }
    if ([v4 isValid:0x4000])
    {
      id v21 = [v4 changeTime];
      uint64_t v22 = v14;
      [(MsdosDirEntryData *)v12 setChangeTime:&v21];
    }
    if ([v4 isValid:0x10000])
    {
      id v21 = [v4 birthTime];
      uint64_t v22 = v15;
      [(MsdosDirEntryData *)v12 setBirthTime:&v21];
    }
    uint64_t v16 = [(DirEntryData *)v12 data];
    id v17 = [v5 setBytes:v16 atOffset:0];

    unsigned int v18 = [v5 writeToDisk];
    [v5 releaseBlock];
    if (v18)
    {
      uint64_t v19 = fskit_std_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100030C78();
      }
    }
    id v9 = v18;
  }

  return v9;
}

- (void)iterateFromOffset:(unint64_t)a3 options:(unsigned int)a4 replyHandler:(id)a5
{
  id v7 = a5;
  if ([(MsdosDirItem *)self getDirSize] <= a3)
  {
    uint64_t v16 = fs_errorForPOSIXError();
    (*((void (**)(id, void *, uint64_t, void, void, void))v7 + 2))(v7, v16, 4, 0, 0, 0);
  }
  else
  {
    id v8 = [[DirBlock alloc] initInDir:self];
    id v9 = [(FATItem *)self volume];
    id v10 = [v9 systemInfo];
    unsigned int v11 = [v10 bytesPerCluster];

    unint64_t v12 = [(MsdosDirItem *)self getDirBlockSize];
    v72[0] = 0;
    v72[1] = v72;
    v72[2] = 0x2020000000;
    v72[3] = 0;
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x2020000000;
    v71[3] = a3;
    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x3032000000;
    v69[3] = sub_100022188;
    v69[4] = sub_100022198;
    v70 = objc_alloc_init(MsdosLongNameContext);
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x3032000000;
    v67[3] = sub_100022188;
    v67[4] = sub_100022198;
    v68 = objc_alloc_init(MsdosDirEntryData);
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x22010000000;
    v34[3] = &unk_100049CD6;
    long long v35 = 0u;
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
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    char v33 = 0;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    unsigned __int8 v31 = 0;
    unsigned __int8 v31 = [(DirItem *)self isFat1216RootDir];
    uint64_t v13 = [(FATItem *)self volume];
    uint64_t v14 = [v13 fatManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100022AC0;
    v17[3] = &unk_10004D0C8;
    timespec v20 = v30;
    id v21 = v72;
    id v19 = v7;
    v17[4] = self;
    uint64_t v28 = v11;
    unint64_t v29 = v12;
    unint64_t v27 = a3 / v11;
    uint64_t v22 = v71;
    id v15 = v8;
    id v18 = v15;
    v23 = v69;
    id v24 = v32;
    v25 = v67;
    v26 = v34;
    [v14 iterateClusterChainOfItem:self replyHandler:v17];

    [v15 releaseBlock];
    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v32, 8);
    _Block_object_dispose(v34, 8);
    _Block_object_dispose(v67, 8);

    _Block_object_dispose(v69, 8);
    _Block_object_dispose(v71, 8);
    _Block_object_dispose(v72, 8);
  }
}

- (id)generateUniqueShortName:(char *)a3 offsetInDir:(unint64_t)a4
{
  uint64_t v6 = (a4 >> 5) % 0xF4240;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100022188;
  id v19 = sub_100022198;
  id v20 = 0;
  unsigned int v7 = v6 + 1000000;
  while (1)
  {
    int v8 = msdosfs_apply_generation_to_short_name((uint64_t)a3, v6 % 0xF4240);
    if (v8)
    {
      id v10 = fskit_std_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v26 = "-[MsdosDirItem generateUniqueShortName:offsetInDir:]";
        __int16 v27 = 1024;
        int v28 = v6;
        __int16 v29 = 2080;
        v30 = a3;
        __int16 v31 = 1024;
        int v32 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Couldn't apply generation number (%d) to short name (%s). error = %d.", buf, 0x22u);
      }
      goto LABEL_11;
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100023530;
    v14[3] = &unk_10004D0F0;
    v14[4] = &v15;
    v14[5] = &v21;
    [(MsdosDirItem *)self isShortNameUniqueInDir:a3 replyHandler:v14];
    id v9 = (void *)v16[5];
    if (v9) {
      goto LABEL_15;
    }
    if (*((unsigned char *)v22 + 24)) {
      break;
    }
    uint64_t v6 = (v6 + 1);
    if (v6 >= v7)
    {
      id v10 = fskit_std_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100030DE4(v10);
      }
LABEL_11:

      fs_errorForPOSIXError();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  if (v6 > [(MsdosDirItem *)self maxShortNameIndex]) {
    [(MsdosDirItem *)self setMaxShortNameIndex:v6];
  }
  id v9 = (void *)v16[5];
LABEL_15:
  id v11 = v9;
LABEL_16:
  unint64_t v12 = v11;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);

  return v12;
}

- (void)createEntrySetForName:(unistr255 *)a3 itemType:(int64_t)a4 firstCluster:(unsigned int)a5 attrs:(id)a6 offsetInDir:(unint64_t)a7 hidden:(BOOL)a8 replyHandler:(id)a9
{
  BOOL v9 = a8;
  uint64_t v11 = *(void *)&a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, void *, void))a9;
  uint64_t v17 = objc_alloc_init(MsdosDirEntryData);
  unsigned __int8 v37 = 0;
  memset(v43, 32, 11);
  if (msdosfs_unicode_to_dos_name(a3->var1, a3->var0, v43, &v37) == 3)
  {
    unsigned int v18 = [(MsdosDirItem *)self maxShortNameIndex];
    if (v18 - 1 > 0xF423E)
    {
      uint64_t v23 = [(MsdosDirItem *)self generateUniqueShortName:v43 offsetInDir:a7];

      if (v23)
      {
        uint64_t v22 = fskit_std_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_100030EDC(v22);
        }
        goto LABEL_10;
      }
    }
    else
    {
      unsigned int v19 = v18;
      int v20 = msdosfs_apply_generation_to_short_name((uint64_t)v43, v18);
      if (v20)
      {
        int v21 = v20;
        uint64_t v22 = fskit_std_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "-[MsdosDirItem createEntrySetForName:itemType:firstCluster:attrs:offsetInDir:hidden:replyHandler:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v19;
          __int16 v39 = 2080;
          long long v40 = v43;
          __int16 v41 = 1024;
          int v42 = v21;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: Couldn't apply generation number (%d) to short name (%s). error = %d.", buf, 0x22u);
        }
LABEL_10:

        char v24 = fs_errorForPOSIXError();
        v16[2](v16, v24, 0);

        goto LABEL_31;
      }
      [(MsdosDirItem *)self setMaxShortNameIndex:[(MsdosDirItem *)self maxShortNameIndex] + 1];
    }
  }
  [(MsdosDirEntryData *)v17 setLowerCaseFlags:v37];
  [(MsdosDirEntryData *)v17 setName:v43];
  v25 = [(FATItem *)self volume];
  v26 = [v25 systemInfo];
  [(MsdosDirEntryData *)v17 setFirstCluster:v11 fileSystemInfo:v26];

  if (v9) {
    int v27 = 2;
  }
  else {
    int v27 = 0;
  }
  if (a4 == 3)
  {
    uint64_t v29 = v27 | 0x20u;
    uint64_t v28 = 1067;
  }
  else if (a4 == 2)
  {
    uint64_t v28 = 0;
    uint64_t v29 = v27 | 0x10u;
  }
  else
  {
    uint64_t v29 = v27 | 0x20u;
    if ([v15 isValid:64]) {
      uint64_t v28 = [v15 size];
    }
    else {
      uint64_t v28 = 0;
    }
  }
  [(MsdosDirEntryData *)v17 setSize:v28];
  [(MsdosDirEntryData *)v17 setAttrFlags:v29];
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  p_tp = &__tp;
  CONV_GetCurrentTime(&__tp);
  if ([v15 isValid:0x10000])
  {
    *(void *)buf = [v15 birthTime];
    *(void *)&buf[8] = v31;
    p_tp = (timespec *)buf;
  }
  [(MsdosDirEntryData *)v17 setBirthTime:p_tp];
  if ([v15 isValid:4096])
  {
    *(void *)buf = [v15 modifyTime];
    *(void *)&buf[8] = v32;
    char v33 = (timespec *)buf;
  }
  else
  {
    char v33 = &__tp;
  }
  [(MsdosDirEntryData *)v17 setModifyTime:v33];
  if ([v15 isValid:0x8000])
  {
    *(void *)buf = [v15 accessTime];
    *(void *)&buf[8] = v34;
    long long v35 = (timespec *)buf;
  }
  else
  {
    long long v35 = &__tp;
  }
  [(MsdosDirEntryData *)v17 setAccessTime:v35];
  ((void (**)(id, void *, MsdosDirEntryData *))v16)[2](v16, 0, v17);
LABEL_31:
}

- (id)writeDirEntriesToDisk:(id)a3 atOffset:(unint64_t)a4 name:(unistr255 *)a5 numberOfEntries:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  int var0 = a5->var0;
  if ((var0 - 1) > 1 || a5->var1[0] != 46 || var0 != 1 && a5->var1[1] != 46) {
    CONV_ConvertToFSM(a5);
  }
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  CONV_GetCurrentTime(&__tp);
  [v10 setModifyTime:&__tp];
  char v12 = msdosfs_winChksum((char *)[v10 getName]);
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  int v27 = sub_100022188;
  uint64_t v28 = sub_100022198;
  id v29 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  int v23 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100023B60;
  v16[3] = &unk_10004D118;
  unsigned int v18 = &v24;
  unsigned int v19 = v22;
  int v20 = v6;
  memcpy(v21, a5, 0x200uLL);
  v21[512] = v12;
  id v13 = v10;
  id v17 = v13;
  [(DirItem *)self iterateDirEntriesAtOffset:a4 numEntries:v6 shouldWriteToDisk:1 replyHandler:v16];
  id v14 = (id)v25[5];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  return v14;
}

- (id)writeDirEntryDataToDisk:(id)a3
{
  id v4 = +[DirEntryData dynamicCast:a3];
  id v5 = [[DirBlock alloc] initInDir:self];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v5, "readDirBlockNum:", objc_msgSend(v4, "dosDirEntryDirBlockNum"));
    if (v6)
    {
      unsigned int v7 = (void *)v6;
      int v8 = fskit_std_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100030FD4(v4, (uint64_t)v7, v8);
      }
    }
    else
    {
      BOOL v9 = objc_msgSend(v5, "getBytesAtOffset:", objc_msgSend(v4, "dosDirEntryOffsetInDirBlock"));
      id v10 = [v4 data];
      uint64_t v11 = [v10 bytes];
      long long v12 = v11[1];
      _OWORD *v9 = *v11;
      v9[1] = v12;

      unsigned int v7 = [v5 writeToDisk];
    }
    [v5 releaseBlock];
  }
  else
  {
    unsigned int v7 = fs_errorForPOSIXError();
  }

  return v7;
}

- (id)markDirEntriesAsDeleted:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100022188;
  id v15 = sub_100022198;
  id v16 = 0;
  id v5 = [v4 entryData];
  id v6 = [v5 firstEntryOffsetInDir];
  unsigned int v7 = [v4 entryData];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100023F30;
  v10[3] = &unk_10004D140;
  v10[4] = &v11;
  -[DirItem iterateDirEntriesAtOffset:numEntries:shouldWriteToDisk:replyHandler:](self, "iterateDirEntriesAtOffset:numEntries:shouldWriteToDisk:replyHandler:", v6, [v7 numberOfDirEntries], 1, v10);

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)verifyCookieOffset:(unsigned int)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100022188;
  uint64_t v11 = sub_100022198;
  id v12 = 0;
  if (a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000240DC;
    v5[3] = &unk_10004D168;
    v5[4] = &v7;
    unsigned int v6 = a3;
    [(DirItem *)self iterateDirEntriesAtOffset:a3 numEntries:1 shouldWriteToDisk:0 replyHandler:v5];
    id v3 = (id)v8[5];
  }
  else
  {
    id v3 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (id)getAttributes:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MsdosDirItem;
  id v5 = [(FATItem *)&v19 getAttributes:v4];
  if ([v4 isAttributeWanted:8]) {
    [v5 setType:2];
  }
  if ([(DirItem *)self isRoot]) {
    [v5 setSupportsLimitedXAttrs:1];
  }
  if ([(DirItem *)self isFat1216RootDir])
  {
    if ([v4 isAttributeWanted:128])
    {
      unsigned int v6 = [(FATItem *)self volume];
      uint64_t v7 = [v6 systemInfo];
      objc_msgSend(v5, "setAllocSize:", objc_msgSend(v7, "rootDirBytes"));
    }
    if ([v4 isAttributeWanted:512]) {
      objc_msgSend(v5, "setParentID:", -[MsdosDirItem getFileID](self, "getFileID"));
    }
    if ([v4 isAttributeWanted:64])
    {
      id v8 = [(FATItem *)self volume];
      uint64_t v9 = [v8 systemInfo];
      objc_msgSend(v5, "setSize:", objc_msgSend(v9, "rootDirBytes"));
    }
    if (([v4 isAttributeWanted:0x8000] & 1) != 0
      || ([v4 isAttributeWanted:4096] & 1) != 0
      || ([v4 isAttributeWanted:0x4000] & 1) != 0
      || [v4 isAttributeWanted:0x10000])
    {
      id v10 = [(FATItem *)self entryData];

      if (!v10)
      {
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        msdosfs_dos2unixtime(33, 0, 0, &v17);
        if ([v4 isAttributeWanted:0x8000]) {
          objc_msgSend(v5, "setAccessTime:", v17, v18);
        }
        if ([v4 isAttributeWanted:4096]) {
          objc_msgSend(v5, "setModifyTime:", v17, v18);
        }
        if ([v4 isAttributeWanted:0x4000]) {
          objc_msgSend(v5, "setChangeTime:", v17, v18);
        }
        if ([v4 isAttributeWanted:0x10000]) {
          objc_msgSend(v5, "setBirthTime:", v17, v18);
        }
      }
    }
  }
  else if (![(FATItem *)self isDeleted])
  {
    id v11 = [[DirBlock alloc] initInDir:self];
    id v12 = [v11 readRelativeDirBlockNum:0];
    uint64_t v13 = [MsdosDirEntryData alloc];
    id v14 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", [v11 getBytesAtOffset:0], 32);
    id v15 = [(MsdosDirEntryData *)v13 initWithData:v14];

    uint64_t v17 = 0;
    uint64_t v18 = 0;
    if ([v4 isAttributeWanted:0x8000])
    {
      [(MsdosDirEntryData *)v15 getAccessTime:&v17];
      objc_msgSend(v5, "setAccessTime:", v17, v18);
    }
    if ([v4 isAttributeWanted:4096])
    {
      [(MsdosDirEntryData *)v15 getModifyTime:&v17];
      objc_msgSend(v5, "setModifyTime:", v17, v18);
    }
    if ([v4 isAttributeWanted:0x4000])
    {
      [(MsdosDirEntryData *)v15 getChangeTime:&v17];
      objc_msgSend(v5, "setChangeTime:", v17, v18);
    }
    if ([v4 isAttributeWanted:0x10000])
    {
      [(MsdosDirEntryData *)v15 getBirthTime:&v17];
      objc_msgSend(v5, "setBirthTime:", v17, v18);
    }
    [v11 releaseBlock];
  }

  return v5;
}

- (unint64_t)getFileID
{
  if ([(DirItem *)self isFat1216RootDir]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)MsdosDirItem;
  return [(FATItem *)&v4 getFileID];
}

- (unsigned)getGenerationNumberOfName:(unistr255 *)a3
{
  unint64_t var0 = a3->var0;
  if (!a3->var0) {
    return 0;
  }
  do
  {
    unint64_t v4 = var0 - 1;
    if (var0 < 2) {
      break;
    }
    int v5 = *(&a3->var0 + var0--);
  }
  while (v5 != 126);
  if (v4) {
    return strtol((const char *)a3->var1 + v4, 0, 10);
  }
  else {
    return 0;
  }
}

- (void)isShortNameUniqueInDir:(char *)a3 replyHandler:(id)a4
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_100022188;
  id v29 = sub_100022198;
  id v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  uint64_t v9 = sub_10002483C;
  id v10 = &unk_10004D190;
  uint64_t v13 = &v25;
  id v14 = &v17;
  id v11 = self;
  id v15 = &v21;
  id v16 = a3;
  id v5 = a4;
  id v12 = v5;
  [(MsdosDirItem *)v11 iterateFromOffset:0 options:0 replyHandler:&v7];
  if (![(MsdosDirItem *)self maxShortNameIndex]) {
    [(MsdosDirItem *)self setMaxShortNameIndex:*((unsigned int *)v18 + 6)];
  }
  if (v26[5])
  {
    unsigned int v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000311E8();
    }

    (*((void (**)(id, uint64_t, void))v5 + 2))(v5, v26[5], 0);
  }
  (*((void (**)(id, void, BOOL))v5 + 2))(v5, 0, *((unsigned char *)v22 + 24) == 0);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

- (unsigned)maxShortNameIndex
{
  return self->_maxShortNameIndex;
}

- (void)setMaxShortNameIndex:(unsigned int)a3
{
  self->_maxShortNameIndex = a3;
}

@end