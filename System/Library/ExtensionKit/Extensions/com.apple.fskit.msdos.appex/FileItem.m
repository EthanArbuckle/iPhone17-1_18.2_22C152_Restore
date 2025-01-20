@interface FileItem
- (BOOL)isPreAllocated;
- (NSMutableDictionary)blockmapRequests;
- (id)endIOOfRange:(_NSRange)a3 status:(int)a4 flags:(unsigned int)a5 operationID:(unint64_t)a6;
- (id)getAttributes:(id)a3;
- (id)initInVolume:(id)a3 inDir:(id)a4 startingAt:(unsigned int)a5 withData:(id)a6 andName:(id)a7;
- (id)truncateTo:(unint64_t)a3 allowPartial:(BOOL)a4 mustBeContig:(BOOL)a5;
- (unint64_t)maxFileSize;
- (unint64_t)writeCounter;
- (void)blockmapRange:(_NSRange)a3 startIO:(BOOL)a4 flags:(unsigned int)a5 operationID:(unint64_t)a6 usingBlocks:(id)a7 replyHandler:(id)a8;
- (void)fetchFileExtentsFrom:(unint64_t)a3 to:(unint64_t)a4 usingBlocks:(id)a5 replyHandler:(id)a6;
- (void)preallocate:(unint64_t)a3 allowPartial:(BOOL)a4 mustBeContig:(BOOL)a5 replyHandler:(id)a6;
- (void)setBlockmapRequests:(id)a3;
- (void)setIsPreAllocated:(BOOL)a3;
- (void)setPreAllocated:(BOOL)a3;
- (void)setWriteCounter:(unint64_t)a3;
- (void)updateModificationTime:(id)a3;
- (void)updatePreallocStatus;
@end

@implementation FileItem

- (id)initInVolume:(id)a3 inDir:(id)a4 startingAt:(unsigned int)a5 withData:(id)a6 andName:(id)a7
{
  v11.receiver = self;
  v11.super_class = (Class)FileItem;
  id v7 = [(FATItem *)&v11 initInVolume:a3 inDir:a4 startingAt:*(void *)&a5 withData:a6 andName:a7 isRoot:0];
  v8 = v7;
  if (v7)
  {
    [v7 setIsPreAllocated:0];
    v9 = +[NSMutableDictionary dictionary];
    [v8 setBlockmapRequests:v9];

    [v8 setWriteCounter:0];
  }
  return v8;
}

- (unint64_t)maxFileSize
{
  return 0;
}

- (id)truncateTo:(unint64_t)a3 allowPartial:(BOOL)a4 mustBeContig:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_1000136AC;
  v27 = sub_1000136BC;
  id v28 = 0;
  v9 = [(FATItem *)self volume];
  v10 = [v9 systemInfo];
  unint64_t v11 = [v10 bytesPerCluster];

  if (a3 % v11) {
    uint64_t v12 = v11 - a3 % v11;
  }
  else {
    uint64_t v12 = 0;
  }
  if ([(FileItem *)self maxFileSize] < a3)
  {
    fs_errorForPOSIXError();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  unint64_t v14 = (v12 + a3) / v11;
  if ([(FATItem *)self numberOfClusters] < v14)
  {
    unsigned int v15 = [(FATItem *)self numberOfClusters];
    v16 = [(FATItem *)self volume];
    v17 = [v16 fatManager];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000136C4;
    v22[3] = &unk_10004CC70;
    v22[4] = &v23;
    [v17 allocateClusters:v14 - v15 forItem:self allowPartial:v6 mustBeContig:v5 zeroFill:0 replyHandler:v22];
LABEL_10:

    goto LABEL_11;
  }
  if ([(FATItem *)self numberOfClusters] > v14)
  {
    unsigned int v18 = [(FATItem *)self numberOfClusters];
    v16 = [(FATItem *)self volume];
    v17 = [v16 fatManager];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100013740;
    v21[3] = &unk_10004CAF0;
    v21[4] = &v23;
    [v17 freeClusters:v18 - v14 ofItem:self replyHandler:v21];
    goto LABEL_10;
  }
LABEL_11:
  id v13 = (id)v24[5];
LABEL_12:
  v19 = v13;
  _Block_object_dispose(&v23, 8);

  return v19;
}

- (void)blockmapRange:(_NSRange)a3 startIO:(BOOL)a4 flags:(unsigned int)a5 operationID:(unint64_t)a6 usingBlocks:(id)a7 replyHandler:(id)a8
{
  BOOL v64 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v65 = a7;
  v66 = (void (**)(id, void *))a8;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = sub_1000136AC;
  v72 = sub_1000136BC;
  id v73 = 0;
  uint64_t v12 = [(FATItem *)self volume];
  id v13 = [v12 systemInfo];
  unsigned int v14 = [v13 bytesPerCluster];

  unsigned int v15 = fskit_std_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    v75 = "-[FileItem blockmapRange:startIO:flags:operationID:usingBlocks:replyHandler:]";
    __int16 v76 = 2048;
    NSUInteger v77 = location;
    __int16 v78 = 2048;
    NSUInteger v79 = length;
    __int16 v80 = 1024;
    BOOL v81 = v64;
    __int16 v82 = 1024;
    unsigned int v83 = a5;
    __int16 v84 = 2048;
    unint64_t v85 = a6;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s: offset: %llu, length: %llu, startIO: %d, flags: %u, operationID: %llu.\n", buf, 0x36u);
  }

  if ((a5 & 0x200) == 0)
  {
    int v16 = a6 || v64;
    if ((a5 & 0x100) == 0 && v16)
    {
      v17 = fskit_std_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10002F400(v17, v18, v19, v20, v21, v22, v23, v24);
      }
LABEL_28:

      v41 = fs_errorForPOSIXError();
      v66[2](v66, v41);
LABEL_29:

      goto LABEL_30;
    }
  }
  if (length)
  {
    NSUInteger v25 = location + length;
    if (location + length > [(FileItem *)self maxFileSize])
    {
      v17 = fskit_std_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10002F478(v17, v26, v27, v28, v29, v30, v31, v32);
      }
      goto LABEL_28;
    }
    if ((a5 & 0x200) != 0)
    {
      v34 = [(FATItem *)self volume];
      v35 = [v34 fatManager];
      [v35 setDirtyBitValue:1 replyHandler:&stru_10004CC90];
    }
    unsigned int v36 = [(FATItem *)self numberOfClusters];
    v37 = [(FATItem *)self entryData];
    id v62 = [v37 getSize];

    unsigned int v38 = v14;
    unint64_t v39 = v14 * (unint64_t)v36;
    if (location >= v39 && (a5 & 0x200) == 0)
    {
      v17 = fskit_std_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10002F4F0();
      }
      goto LABEL_28;
    }
    if ((a5 & 0x200) != 0)
    {
      id v42 = v62;
      if (v39 < (unint64_t)v62)
      {
        v17 = fskit_std_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10002F564();
        }
        goto LABEL_28;
      }
      if (v25 <= (unint64_t)v62) {
        goto LABEL_33;
      }
      if (v25 > v39)
      {
        uint64_t v49 = [(FileItem *)self truncateTo:location + length allowPartial:1 mustBeContig:0];
        v50 = (void *)v69[5];
        v69[5] = v49;

        if (v69[5])
        {
          v44 = fskit_std_log();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            sub_10002F6D4();
          }
          goto LABEL_35;
        }
        unint64_t v39 = v38 * (unint64_t)[(FATItem *)self numberOfClusters];
        if (v39 <= location)
        {
          v53 = fskit_std_log();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
            sub_10002F65C(v53, v54, v55, v56, v57, v58, v59, v60);
          }

          id v61 = [(FileItem *)self truncateTo:v62 allowPartial:0 mustBeContig:0];
          v41 = fs_errorForPOSIXError();
          v66[2](v66, v41);
          goto LABEL_29;
        }
        if (v39 < v25)
        {
          v51 = fskit_std_log();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
            sub_10002F5D8();
          }

          NSUInteger v25 = v39;
        }
      }
      v52 = [(FATItem *)self entryData];
      [v52 setSize:v25];
    }
    id v42 = v62;
LABEL_33:
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_100013F30;
    v67[3] = &unk_10004CAF0;
    v67[4] = &v68;
    -[FileItem fetchFileExtentsFrom:to:usingBlocks:replyHandler:](self, "fetchFileExtentsFrom:to:usingBlocks:replyHandler:", location, v39, v65, v67, v62);
    if (!v69[5])
    {
      v45 = 0;
      if ((a5 & 0x200) != 0 && v64)
      {
        v46 = [(FileItem *)self blockmapRequests];
        v47 = [[BlockmapRequest alloc] initWithOriginalSize:v42];
        v48 = +[NSNumber numberWithUnsignedLong:a6];
        [v46 setObject:v47 forKey:v48];

        [(FileItem *)self setWriteCounter:(char *)[(FileItem *)self writeCounter] + 1];
        v45 = 0;
      }
      goto LABEL_43;
    }
    id v43 = [(FileItem *)self truncateTo:v42 allowPartial:0 mustBeContig:0];
    v44 = [(FATItem *)self entryData];
    [v44 setSize:v42];
LABEL_35:

    v45 = (void *)v69[5];
LABEL_43:
    v66[2](v66, v45);
    goto LABEL_30;
  }
  v33 = fskit_std_log();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v75 = "-[FileItem blockmapRange:startIO:flags:operationID:usingBlocks:replyHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s: Requested NSUInteger length = 0. Exit with SUCCESS and numOfExtentsFetched = 0.", buf, 0xCu);
  }

  v66[2](v66, 0);
LABEL_30:
  _Block_object_dispose(&v68, 8);
}

- (id)endIOOfRange:(_NSRange)a3 status:(int)a4 flags:(unsigned int)a5 operationID:(unint64_t)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v12 = [(FATItem *)self volume];
  id v13 = [v12 systemInfo];
  unsigned int v14 = [v13 bytesPerCluster];

  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  unsigned int v15 = fskit_std_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    v51 = "-[FileItem endIOOfRange:status:flags:operationID:]";
    __int16 v52 = 2048;
    NSUInteger v53 = location;
    __int16 v54 = 2048;
    NSUInteger v55 = length;
    __int16 v56 = 1024;
    int v57 = a4;
    __int16 v58 = 1024;
    unsigned int v59 = a5;
    __int16 v60 = 2048;
    unint64_t v61 = a6;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s: offset: %lu, length: %lu, status: %d, flags: %u, operationID: %llu.", buf, 0x36u);
  }

  if ((a5 & 0x100) != 0)
  {
    v17 = fskit_std_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10002F9A0(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_8;
  }
  if ((a5 & 0x1000) != 0)
  {
    [(FileItem *)self setWriteCounter:(char *)[(FileItem *)self writeCounter] - 1];
    uint64_t v26 = [(FileItem *)self blockmapRequests];
    uint64_t v27 = +[NSNumber numberWithUnsignedLong:a6];
    int v16 = [v26 objectForKey:v27];

    if (v16) {
      goto LABEL_10;
    }
    v17 = fskit_std_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_10002F920();
    }
LABEL_8:

    NSUInteger v25 = fs_errorForPOSIXError();
    goto LABEL_27;
  }
  int v16 = 0;
LABEL_10:
  uint64_t v28 = [(FATItem *)self volume];
  uint64_t v29 = [v28 fatManager];
  [v29 setDirtyBitValue:1 replyHandler:&stru_10004CCB0];

  unint64_t v30 = location + length;
  if (a4) {
    goto LABEL_11;
  }
  if (v30 > v14 * (unint64_t)[(FATItem *)self numberOfClusters])
  {
    unsigned int v36 = fskit_std_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_10002F838();
    }

    NSUInteger v25 = fs_errorForPOSIXError();
    goto LABEL_26;
  }
  if (v16 && v30 > (unint64_t)[v16 originalFileSize]) {
    *((unsigned char *)v47 + 24) = 1;
  }
  unsigned int v38 = [(FATItem *)self entryData];
  BOOL v39 = v30 > (unint64_t)[v38 getSize];

  if (v39)
  {
    v40 = [(FATItem *)self entryData];
    [v40 setSize:v30];

    *((unsigned char *)v47 + 24) = 1;
  }
  v41 = [(FATItem *)self entryData];
  BOOL v42 = v30 > (unint64_t)[v41 getValidDataLength];

  if (v42)
  {
    id v43 = [(FATItem *)self entryData];
    [v43 setValidDataLength:v30];

    *((unsigned char *)v47 + 24) = 1;
  }
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100014540;
  v45[3] = &unk_10004CCD8;
  v45[4] = &v46;
  [(FileItem *)self updateModificationTime:v45];
  [(FileItem *)self updatePreallocStatus];
  if (!*((unsigned char *)v47 + 24) || [(FATItem *)self isDeleted])
  {
LABEL_11:
    NSUInteger v25 = 0;
  }
  else
  {
    NSUInteger v25 = [(FATItem *)self flushDirEntryData];
    if (v25)
    {
      v44 = fskit_std_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        sub_10002F8AC();
      }
    }
  }
  if (v25) {
    BOOL v31 = 0;
  }
  else {
    BOOL v31 = a4 == 0;
  }
  if (!v31 && v16)
  {
    if (v30 > (unint64_t)[v16 originalFileSize]
      && ![(FileItem *)self writeCounter])
    {
      id v32 = -[FileItem truncateTo:allowPartial:mustBeContig:](self, "truncateTo:allowPartial:mustBeContig:", [v16 originalFileSize], 0, 0);
      v33 = [(FATItem *)self entryData];
      objc_msgSend(v33, "setSize:", objc_msgSend(v16, "originalFileSize"));
    }
    goto LABEL_21;
  }
  if (v16)
  {
LABEL_21:
    v34 = [(FileItem *)self blockmapRequests];
    v35 = +[NSNumber numberWithUnsignedLong:a6];
    [v34 removeObjectForKey:v35];
  }
LABEL_26:

LABEL_27:
  _Block_object_dispose(&v46, 8);

  return v25;
}

- (void)fetchFileExtentsFrom:(unint64_t)a3 to:(unint64_t)a4 usingBlocks:(id)a5 replyHandler:(id)a6
{
  v47 = (uint64_t (**)(id, void *, void, unint64_t, char *, unint64_t))a5;
  v8 = (void (**)(void))a6;
  uint64_t v58 = 0;
  v59[0] = &v58;
  v59[1] = 0x3032000000;
  v59[2] = sub_1000136AC;
  v59[3] = sub_1000136BC;
  id v60 = 0;
  uint64_t v54 = 0;
  NSUInteger v55 = &v54;
  uint64_t v56 = 0x2020000000;
  int v57 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  int v53 = 0;
  v9 = [(FATItem *)self volume];
  v10 = [v9 systemInfo];
  unsigned int v11 = [v10 bytesPerCluster];

  uint64_t v12 = [(FATItem *)self volume];
  id v13 = [v12 systemInfo];
  unsigned int v14 = [v13 bytesPerSector];

  unint64_t v46 = v11;
  unint64_t v15 = a3 / v11;
  if (v15 >= [(FATItem *)self firstClusterIndexInLastAllocation]
    && (LODWORD(v16) = [(FATItem *)self firstClusterIndexInLastAllocation],
        v16))
  {
    uint64_t v17 = [(FATItem *)self firstClusterInLastAllocation];
    unint64_t v16 = v16;
  }
  else
  {
    uint64_t v17 = [(FATItem *)self firstCluster];
    unint64_t v16 = 0;
  }
  v45 = v8;
  char v18 = 0;
  BOOL v42 = v59;
  unint64_t v44 = v14;
  unsigned int v43 = 0xFFFFFFFF / v14;
  while (1)
  {
    uint64_t v19 = [(FATItem *)self volume];
    uint64_t v20 = [v19 systemInfo];
    unsigned int v21 = [v20 isClusterValid:v17];

    if (!v21) {
      break;
    }
    uint64_t v22 = [(FATItem *)self volume];
    uint64_t v23 = [v22 fatManager];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100014A74;
    v49[3] = &unk_10004C5B8;
    v49[4] = &v58;
    v49[5] = &v50;
    v49[6] = &v54;
    [v23 getContigClusterChainLengthStartingAt:v17 replyHandler:v49];

    if (*(void *)(v59[0] + 40))
    {
      BOOL v39 = fskit_std_log();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_10002FB00();
      }
      goto LABEL_27;
    }
    if (v18)
    {
LABEL_13:
      NSUInteger v25 = [(FATItem *)self volume];
      uint64_t v26 = [v25 systemInfo];
      uint64_t v27 = (char *)[v26 offsetForCluster:v17];

      uint64_t v28 = [(FATItem *)self volume];
      unint64_t v29 = a3 % v46;
      unint64_t v30 = &v27[a3 % v46];
      LODWORD(v27) = [v28 isOffsetInMetadataZone:v30];

      if (v27)
      {
        v40 = fskit_std_log();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          sub_10002FA8C();
        }

        uint64_t v41 = fs_errorForPOSIXError();
        BOOL v39 = *(NSObject **)(v59[0] + 40);
        *(void *)(v59[0] + 40) = v41;
LABEL_27:

        break;
      }
      unint64_t v31 = *((unsigned int *)v51 + 6) * (unint64_t)v46 - v29;
      if (v31 % v44) {
        uint64_t v32 = v44 - v31 % v44;
      }
      else {
        uint64_t v32 = 0;
      }
      unint64_t v33 = v31 + v32;
      if (v33 >= ((0xFFFFFFFF - v43 * (unint64_t)v44) ^ 0xFFFFFFFF)) {
        unint64_t v34 = (0xFFFFFFFF - v43 * (unint64_t)v44) ^ 0xFFFFFFFF;
      }
      else {
        unint64_t v34 = v33;
      }
      v35 = [(FATItem *)self volume];
      unsigned int v36 = [v35 resource];
      char v37 = v47[2](v47, v36, 0, a3, v30, v34);

      if (v37) {
        break;
      }
      unint64_t v38 = (v34 + v29) / v46;
      if (v38 >= *((unsigned int *)v51 + 6)) {
        uint64_t v17 = *((unsigned int *)v55 + 6);
      }
      else {
        uint64_t v17 = (v17 + v38);
      }
      a3 += v34;
      char v18 = 1;
    }
    else
    {
      uint64_t v24 = *((unsigned int *)v51 + 6);
      if (v15 >= v16 && v16 + v24 > v15)
      {
        LODWORD(v17) = v17 + v15 - v16;
        *((_DWORD *)v51 + 6) = v24 - (v15 - v16);
        goto LABEL_13;
      }
      char v18 = 0;
      uint64_t v17 = *((unsigned int *)v55 + 6);
      v16 += v24;
    }
  }
  v45[2](v45);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);
}

- (void)updateModificationTime:(id)a3
{
  v4 = (void (**)(id, BOOL))a3;
  v10[0] = 0;
  v10[1] = 0;
  v9.__darwin_time_t tv_sec = 0;
  v9.tv_nsec = 0;
  CONV_GetCurrentTime(&v9);
  BOOL v5 = [(FATItem *)self entryData];
  [v5 getModifyTime:v10];

  uint64_t v6 = v10[0];
  __darwin_time_t tv_sec = v9.tv_sec;
  if (v10[0] != v9.tv_sec)
  {
    v8 = [(FATItem *)self entryData];
    [v8 setModifyTime:&v9];
  }
  v4[2](v4, v6 != tv_sec);
}

- (void)updatePreallocStatus
{
  v3 = [(FATItem *)self volume];
  v4 = [v3 systemInfo];
  unint64_t v5 = [v4 bytesPerCluster];

  uint64_t v6 = [(FATItem *)self entryData];
  unint64_t v7 = (unint64_t)[v6 getSize] % v5;
  v8 = [(FATItem *)self entryData];
  unint64_t v9 = (unint64_t)[v8 getSize];
  if (v7)
  {
    v10 = [(FATItem *)self entryData];
    unint64_t v11 = (unint64_t)[v10 getSize];
    v9 += v5 + v11 / v5 * v5 - v11;
  }
  BOOL v12 = [(FATItem *)self numberOfClusters] != (v9 / v5);

  [(FileItem *)self setPreAllocated:v12];
}

- (void)setPreAllocated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(FileItem *)self isPreAllocated] != a3)
  {
    unint64_t v5 = [(FATItem *)self volume];
    uint64_t v6 = [v5 preAllocatedOpenFiles];

    objc_sync_enter(v6);
    unint64_t v7 = [(FATItem *)self volume];
    v8 = [v7 preAllocatedOpenFiles];
    unint64_t v9 = [v8 objectAtIndex:0];
    v10 = (char *)[v9 unsignedLongLongValue];

    if (v3) {
      unint64_t v11 = v10 + 1;
    }
    else {
      unint64_t v11 = v10 - 1;
    }
    if (v10 || v3)
    {
      BOOL v12 = [(FATItem *)self volume];
      uint64_t v20 = [v12 preAllocatedOpenFiles];
      unsigned int v21 = +[NSNumber numberWithUnsignedLongLong:v11];
      [v20 replaceObjectAtIndex:0 withObject:v21];
    }
    else
    {
      BOOL v12 = fskit_std_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10002FB7C(v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }

    [(FileItem *)self setIsPreAllocated:v3];
    objc_sync_exit(v6);
  }
}

- (void)preallocate:(unint64_t)a3 allowPartial:(BOOL)a4 mustBeContig:(BOOL)a5 replyHandler:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  uint64_t v18 = (void (**)(id, void *, void))a6;
  v10 = [(FATItem *)self volume];
  unint64_t v11 = [v10 systemInfo];
  unsigned int v12 = [v11 bytesPerCluster];

  unsigned int v13 = [(FATItem *)self numberOfClusters];
  unint64_t v14 = a3 + v13 * (unint64_t)v12;
  unsigned int v15 = [(FATItem *)self numberOfClusters];
  if (HIDWORD(v14))
  {
    uint64_t v16 = fs_errorForPOSIXError();
    v18[2](v18, v16, 0);
  }
  else if (v15 == ((v12 + v14 - 1) / v12))
  {
    v18[2](v18, 0, 0);
  }
  else
  {
    uint64_t v17 = [(FileItem *)self truncateTo:v14 allowPartial:v7 mustBeContig:v6];
    if (!v17) {
      [(FileItem *)self updatePreallocStatus];
    }
    v18[2](v18, v17, ([(FATItem *)self numberOfClusters] - (unint64_t)v13) * v12);
  }
}

- (id)getAttributes:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FileItem;
  BOOL v3 = [(FATItem *)&v5 getAttributes:a3];
  [v3 setInhibitKernelOffloadedIO:0];

  return v3;
}

- (BOOL)isPreAllocated
{
  return self->_isPreAllocated;
}

- (void)setIsPreAllocated:(BOOL)a3
{
  self->_isPreAllocated = a3;
}

- (unint64_t)writeCounter
{
  return self->_writeCounter;
}

- (void)setWriteCounter:(unint64_t)a3
{
  self->_writeCounter = a3;
}

- (NSMutableDictionary)blockmapRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBlockmapRequests:(id)a3
{
}

- (void).cxx_destruct
{
}

@end