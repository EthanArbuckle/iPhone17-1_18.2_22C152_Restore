@interface FATManager
- (BOOL)isEOFCluster:(unint64_t)a3;
- (BOOL)useCache;
- (FATManager)initWithDevice:(id)a3 info:(id)a4 ops:(id)a5 usingCache:(BOOL)a6;
- (FSBlockDeviceResource)device;
- (FSOperations)fsOps;
- (FileSystemInfo)fsInfo;
- (OS_dispatch_queue)fatQueue;
- (id)syncMetaReadFromFAT:(void *)a3 startingAt:(int64_t)a4;
- (id)syncMetaWriteToFATs:(void *)a3 startingAt:(int64_t)a4;
- (id)updateFATStats;
- (int64_t)getRWOffsetForClusterEntry:(unsigned int)a3;
- (unint64_t)getOffsetForCluster:(unsigned int)a3 inFatBlock:(id)a4;
- (unint64_t)getOffsetForClusterEntry:(unsigned int)a3;
- (unsigned)clustersPerBlock;
- (unsigned)fatSize;
- (unsigned)rwSize;
- (void)allocateClusters:(unsigned int)a3 allowPartial:(BOOL)a4 zeroFill:(BOOL)a5 mustBeContig:(BOOL)a6 replyHandler:(id)a7;
- (void)allocateClusters:(unsigned int)a3 forItem:(id)a4 allowPartial:(BOOL)a5 mustBeContig:(BOOL)a6 zeroFill:(BOOL)a7 replyHandler:(id)a8;
- (void)allocateClusters:(unsigned int)a3 searchFromCluster:(unsigned int)a4 allowPartial:(BOOL)a5 zeroFill:(BOOL)a6 mustBeContig:(BOOL)a7 replyHandler:(id)a8;
- (void)allocateClustersInBlock:(void *)a3 numClusters:(unsigned int)a4 startingAtCluster:(unsigned int)a5 startOffset:(unsigned int)a6 mustBeContig:(BOOL)a7 replyHandler:(id)a8;
- (void)clusterChainLength:(id)a3 replyHandler:(id)a4;
- (void)countFreeClustersInBlock:(id)a3 startingAt:(unsigned int)a4 replyHandler:(id)a5;
- (void)fatIterator:(unsigned int)a3 replyHandler:(id)a4;
- (void)findFreeClustersInBlock:(id)a3 ofLength:(unsigned int)a4 contig:(BOOL)a5 startCluster:(unsigned int)a6 replyHandler:(id)a7;
- (void)findNextFreeCluster:(unsigned int)a3 replyHandler:(id)a4;
- (void)freeClusterFrom:(unsigned int)a3 numClusters:(unsigned int)a4 replyHandler:(id)a5;
- (void)freeClusters:(unsigned int)a3 ofItem:(id)a4 replyHandler:(id)a5;
- (void)getContigClusterChainLengthStartingAt:(unsigned int)a3 replyHandler:(id)a4;
- (void)getDirtyBitValue:(id)a3;
- (void)iterateClusterChainOfItem:(id)a3 replyHandler:(id)a4;
- (void)setDevice:(id)a3;
- (void)setDirtyBitValue:(unsigned __int8)a3 replyHandler:(id)a4;
- (void)setFatQueue:(id)a3;
- (void)setFatSize:(unsigned int)a3;
- (void)setFsInfo:(id)a3;
- (void)setFsOps:(id)a3;
- (void)setRwSize:(unsigned int)a3;
- (void)setUseCache:(BOOL)a3;
@end

@implementation FATManager

- (FATManager)initWithDevice:(id)a3 info:(id)a4 ops:(id)a5 usingCache:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(FATManager *)self device];
  v14 = [v13 BSDName];
  v15 = +[NSString stringWithFormat:@"%@.%s", v14, "fatQueue"];

  [(FATManager *)self setUseCache:v6];
  [(FATManager *)self setDevice:v12];

  [(FATManager *)self setFsInfo:v11];
  [(FATManager *)self setFsOps:v10];

  id v16 = v15;
  dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  [(FATManager *)self setFatQueue:v17];

  v18 = [(FATManager *)self fatQueue];

  if (v18)
  {
    v19 = [(FATManager *)self fsInfo];
    id v20 = [v19 fatSize];

    if ((unint64_t)v20 <= 0x3000)
    {
      v22 = [(FATManager *)self fsInfo];
      -[FATManager setRwSize:](self, "setRwSize:", [v22 fatSize]);
    }
    else
    {
      [(FATManager *)self setRwSize:12288];
    }
    v23 = [(FATManager *)self updateFATStats];

    if (!v23)
    {
      v24 = self;
      goto LABEL_11;
    }
  }
  else
  {
    v21 = fskit_std_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_1000302E8(v21);
    }
  }
  v24 = 0;
LABEL_11:

  return v24;
}

- (unsigned)clustersPerBlock
{
  v3 = [(FATManager *)self fsInfo];
  unsigned int v4 = [v3 type];

  if (v4 == 1) {
    return [(FATManager *)self rwSize] >> 1;
  }
  if (v4) {
    return [(FATManager *)self rwSize] >> 2;
  }
  return 2 * [(FATManager *)self rwSize] / 3;
}

- (unint64_t)getOffsetForClusterEntry:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [(FATManager *)self fsInfo];
  id v6 = [v5 fatOffset];
  v7 = [(FATManager *)self fsOps];
  unint64_t v8 = (unint64_t)v6 + [v7 fatEntryOffsetForCluster:v3];

  return v8;
}

- (int64_t)getRWOffsetForClusterEntry:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [(FATManager *)self fsOps];
  LODWORD(v3) = [v5 fatEntryOffsetForCluster:v3];

  id v6 = [(FATManager *)self fsInfo];
  id v7 = [v6 fatOffset];
  int64_t v8 = (int64_t)v7 + v3 - v3 % [(FATManager *)self rwSize];

  return v8;
}

- (unint64_t)getOffsetForCluster:(unsigned int)a3 inFatBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  unint64_t v7 = [(FATManager *)self getOffsetForClusterEntry:v4];
  id v8 = [v6 startOffset];

  return v7 - (void)v8;
}

- (id)syncMetaReadFromFAT:(void *)a3 startingAt:(int64_t)a4
{
  unint64_t v7 = a4 + [(FATManager *)self rwSize];
  id v8 = [(FATManager *)self fsInfo];
  v9 = (char *)[v8 fatOffset];
  id v10 = [(FATManager *)self fsInfo];
  id v11 = &v9[(void)[v10 fatSize]];

  if (v7 <= (unint64_t)v11)
  {
    unint64_t v15 = [(FATManager *)self rwSize];
  }
  else
  {
    id v12 = [(FATManager *)self fsInfo];
    v13 = (char *)[v12 fatOffset];
    v14 = [(FATManager *)self fsInfo];
    unint64_t v15 = (unint64_t)&v13[(void)[v14 fatSize] - a4];
  }
  id v16 = [(FATManager *)self device];
  dispatch_queue_t v17 = +[Utilities syncMetaReadFromDevice:v16 into:a3 startingAt:a4 length:v15];

  return v17;
}

- (id)syncMetaWriteToFATs:(void *)a3 startingAt:(int64_t)a4
{
  unint64_t v7 = a4 + [(FATManager *)self rwSize];
  id v8 = [(FATManager *)self fsInfo];
  v9 = (char *)[v8 fatOffset];
  id v10 = [(FATManager *)self fsInfo];
  id v11 = &v9[(void)[v10 fatSize]];

  if (v7 <= (unint64_t)v11)
  {
    unint64_t v15 = [(FATManager *)self rwSize];
  }
  else
  {
    id v12 = [(FATManager *)self fsInfo];
    v13 = (char *)[v12 fatOffset];
    v14 = [(FATManager *)self fsInfo];
    unint64_t v15 = (unint64_t)&v13[(void)[v14 fatSize] - a4];
  }
  id v16 = [(FATManager *)self fsInfo];
  unsigned int v17 = [v16 numOfFATs];

  if (v17)
  {
    unint64_t v18 = 0;
    v19 = 0;
    do
    {
      id v20 = [(FATManager *)self device];
      v21 = [(FATManager *)self fsInfo];
      v22 = +[Utilities metaWriteToDevice:from:startingAt:length:](Utilities, "metaWriteToDevice:from:startingAt:length:", v20, a3, a4 + (void)[v21 fatSize] * v18, v15);

      ++v18;
      v23 = [(FATManager *)self fsInfo];
      LODWORD(v21) = [v23 numOfFATs];

      v19 = v22;
    }
    while (v18 < v21);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)updateFATStats
{
  uint64_t v3 = [FATBlock alloc];
  uint64_t v4 = [(FATManager *)self fsInfo];
  v5 = -[FATBlock initWithOffset:andLength:](v3, "initWithOffset:andLength:", [v4 fatOffset], -[FATManager rwSize](self, "rwSize"));

  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  int v54 = 0;
  id v6 = [(FATManager *)self fsInfo];
  unint64_t v7 = (char *)[v6 fatOffset];

  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  int v50 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  char v46 = 1;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = sub_100019628;
  v43 = sub_100019638;
  id v44 = 0;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100019640;
  v38[3] = &unk_10004CDA0;
  v38[4] = self;
  v38[5] = &v39;
  [(FATManager *)self getDirtyBitValue:v38];
  unsigned int v8 = 0;
  while (1)
  {
    v9 = [(FATManager *)self fsInfo];
    id v10 = (char *)[v9 fatOffset];
    id v11 = [(FATManager *)self fsInfo];
    LOBYTE(v10) = v7 > &v10[(void)[v11 fatSize]];

    if (v10) {
      break;
    }
    id v12 = [(FATBlock *)v5 data];
    uint64_t v13 = -[FATManager syncMetaReadFromFAT:startingAt:](self, "syncMetaReadFromFAT:startingAt:", [v12 mutableBytes], v7);
    v14 = (void *)v40[5];
    v40[5] = v13;

    unint64_t v15 = (void *)v40[5];
    if (v15) {
      goto LABEL_19;
    }
    [(FATBlock *)v5 setStartOffset:v7];
    v37[0] = _NSConcreteStackBlock;
    if (v8) {
      uint64_t v16 = v8;
    }
    else {
      uint64_t v16 = 2;
    }
    v37[1] = 3221225472;
    v37[2] = sub_1000196C0;
    v37[3] = &unk_10004CDC8;
    v37[4] = &v47;
    v37[5] = v45;
    v37[6] = &v51;
    [(FATManager *)self countFreeClustersInBlock:v5 startingAt:v16 replyHandler:v37];
    v8 += [(FATManager *)self clustersPerBlock];
    v7 += [(FATManager *)self rwSize];
  }
  unsigned int v17 = [(FATManager *)self fsInfo];
  if ([v17 freeClusters])
  {
    unint64_t v18 = [(FATManager *)self fsInfo];
    id v19 = [v18 freeClusters];
    BOOL v20 = v19 == (id)*((unsigned int *)v48 + 6);

    if (v20) {
      goto LABEL_13;
    }
    unsigned int v17 = fskit_std_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v31 = *((_DWORD *)v48 + 6);
      v32 = [(FATManager *)self fsInfo];
      id v33 = [v32 freeClusters];
      *(_DWORD *)buf = 136315650;
      v56 = "-[FATManager updateFATStats]";
      __int16 v57 = 1024;
      int v58 = v31;
      __int16 v59 = 2048;
      id v60 = v33;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s: counted free clusters number (%u) is not equal to the number read in boot (%llu) - updating", buf, 0x1Cu);
    }
  }

LABEL_13:
  uint64_t v21 = *((unsigned int *)v48 + 6);
  v22 = [(FATManager *)self fsInfo];
  [v22 setFreeClusters:v21];

  v23 = [(FATManager *)self fsInfo];
  if (![v23 firstFreeCluster])
  {
LABEL_17:

    goto LABEL_18;
  }
  v24 = [(FATManager *)self fsInfo];
  unsigned int v25 = [v24 firstFreeCluster];
  BOOL v26 = v25 == *((_DWORD *)v52 + 6);

  if (!v26)
  {
    v23 = fskit_std_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      int v34 = *((_DWORD *)v52 + 6);
      v35 = [(FATManager *)self fsInfo];
      unsigned int v36 = [v35 firstFreeCluster];
      *(_DWORD *)buf = 136315650;
      v56 = "-[FATManager updateFATStats]";
      __int16 v57 = 1024;
      int v58 = v34;
      __int16 v59 = 1024;
      LODWORD(v60) = v36;
      _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%s: first free cluster found (%u) is not equal to the one read in boot (%u) - updating", buf, 0x18u);
    }
    goto LABEL_17;
  }
LABEL_18:
  uint64_t v27 = *((unsigned int *)v52 + 6);
  v28 = [(FATManager *)self fsInfo];
  [v28 setFirstFreeCluster:v27];

  unint64_t v15 = (void *)v40[5];
LABEL_19:
  id v29 = v15;
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v29;
}

- (void)countFreeClustersInBlock:(id)a3 startingAt:(unsigned int)a4 replyHandler:(id)a5
{
  unint64_t v6 = *(void *)&a4;
  id v24 = a3;
  v23 = (void (**)(id, uint64_t, uint64_t, uint64_t))a5;
  unint64_t v8 = [(FATManager *)self getOffsetForClusterEntry:v6];
  unint64_t v9 = v8 - (void)[v24 startOffset];
  id v10 = [v24 data];
  unsigned int v25 = (char *)[v10 mutableBytes];

  id v11 = [(FATManager *)self fsOps];
  unsigned int v12 = [v11 numBytesPerClusterInFat];

  uint64_t v13 = [(FATManager *)self fsInfo];
  id v14 = [v13 maxValidCluster];

  uint64_t v15 = 0;
  uint64_t v16 = 1;
  if (v9 >= [(FATManager *)self rwSize])
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = 0;
    if ((unint64_t)v14 >= v6)
    {
      LODWORD(v17) = 0;
      LODWORD(v15) = 0;
      do
      {
        unint64_t v18 = [(FATManager *)self fsOps];
        unsigned int v19 = [v18 getNextClusterFromEntryForCluster:v6 entry:&v25[v9]];

        if (v19 | v15) {
          uint64_t v15 = v15;
        }
        else {
          uint64_t v15 = v6;
        }
        BOOL v20 = v19 == 0;
        BOOL v21 = v19 == 0;
        if (v20) {
          uint64_t v17 = (v17 + 1);
        }
        else {
          uint64_t v17 = v17;
        }
        unint64_t v6 = (v6 + 1);
        if (v12)
        {
          v9 += v12;
        }
        else
        {
          unint64_t v22 = [(FATManager *)self getOffsetForClusterEntry:v6];
          unint64_t v9 = v22 - (void)[v24 startOffset];
        }
        uint64_t v16 = v21 & v16;
      }
      while (v9 < [(FATManager *)self rwSize] && (unint64_t)v14 >= v6);
    }
  }
  v23[2](v23, v17, v15, v16);
}

- (void)findFreeClustersInBlock:(id)a3 ofLength:(unsigned int)a4 contig:(BOOL)a5 startCluster:(unsigned int)a6 replyHandler:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v10 = *(void *)&a4;
  id v30 = a3;
  id v12 = a7;
  if (v8)
  {
    unint64_t v13 = [(FATManager *)self getOffsetForClusterEntry:v8];
    if (v13 < (unint64_t)[v30 startOffset]
      || (id v14 = [v30 startOffset], v13 > (unint64_t)v14 + -[FATManager rwSize](self, "rwSize")))
    {
LABEL_4:
      (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
      goto LABEL_21;
    }
  }
  else
  {
    unsigned int v15 = [v30 startOffset];
    uint64_t v16 = [(FATManager *)self fsInfo];
    unsigned int v17 = v15 - [v16 fatOffset];
    unsigned int v18 = [(FATManager *)self clustersPerBlock] * v17;
    unsigned int v19 = [(FATManager *)self rwSize];

    if (v19 <= v18) {
      uint64_t v8 = v18 / v19;
    }
    else {
      uint64_t v8 = 2;
    }
  }
  unint64_t v20 = [(FATManager *)self getOffsetForClusterEntry:v8];
  unint64_t v21 = v20 - (void)[v30 startOffset];
  if (v21 >= [(FATManager *)self rwSize])
  {
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v23 = v8;
    do
    {
      id v24 = [(FATManager *)self fsInfo];
      id v25 = [v24 maxValidCluster];

      if ((unint64_t)v25 < v23) {
        break;
      }
      id v26 = [v30 data];
      uint64_t v27 = (char *)[v26 mutableBytes] + v21;

      v28 = [(FATManager *)self fsOps];
      LODWORD(v27) = [v28 getNextClusterFromEntryForCluster:v23 entry:v27];

      if (v27)
      {
        if (a5) {
          goto LABEL_4;
        }
        if (v22) {
          break;
        }
        uint64_t v8 = (v23 + 1);
        uint64_t v23 = v8;
      }
      else
      {
        uint64_t v22 = (v22 + 1);
        if (v22 == v10)
        {
          (*((void (**)(id, uint64_t, uint64_t))v12 + 2))(v12, v8, v10);
          goto LABEL_21;
        }
        uint64_t v23 = (v23 + 1);
      }
      unint64_t v29 = [(FATManager *)self getOffsetForClusterEntry:v23];
      unint64_t v21 = v29 - (void)[v30 startOffset];
    }
    while (v21 < [(FATManager *)self rwSize]);
  }
  (*((void (**)(id, uint64_t, uint64_t))v12 + 2))(v12, v8, v22);
LABEL_21:
}

- (void)allocateClustersInBlock:(void *)a3 numClusters:(unsigned int)a4 startingAtCluster:(unsigned int)a5 startOffset:(unsigned int)a6 mustBeContig:(BOOL)a7 replyHandler:(id)a8
{
  uint64_t v9 = *(void *)&a5;
  id v13 = a8;
  uint64_t v14 = (v9 + 1);
  int64_t v15 = [(FATManager *)self getRWOffsetForClusterEntry:v9];
  uint64_t v16 = (char *)a3 + [(FATManager *)self getOffsetForClusterEntry:v9] - a6;
  if (!a4)
  {
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    LODWORD(v18) = v9;
    goto LABEL_6;
  }
  id v50 = v13;
  unsigned int v17 = [(FATManager *)self fsInfo];
  if ((unint64_t)[v17 maxValidCluster] < v9)
  {
    unsigned int v51 = 0;
    uint64_t v18 = 0;
    int v19 = v9;
LABEL_4:
    uint64_t v20 = v18;

    LODWORD(v18) = v19;
    id v13 = v50;
    uint64_t v21 = v51;
LABEL_6:
    if (v18 != v9 || v21)
    {
      uint64_t v18 = v20;
    }
    else
    {
      id v22 = v13;
      int64_t v23 = [(FATManager *)self getRWOffsetForClusterEntry:v9];
      int64_t v24 = v23 + [(FATManager *)self rwSize];
      int64_t v25 = [(FATManager *)self getRWOffsetForClusterEntry:v14];
      uint64_t v21 = 0;
      BOOL v26 = v24 == v25;
      id v13 = v22;
      if (v26) {
        uint64_t v18 = v9;
      }
      else {
        uint64_t v18 = v20;
      }
    }
    goto LABEL_25;
  }
  v48 = (void *)v15;
  uint64_t v49 = v16;
  unsigned int v46 = 0;
  unsigned int v47 = a4;
  unsigned int v27 = 0;
  unsigned int v51 = 0;
  uint64_t v28 = v9;
  while (2)
  {
    uint64_t v18 = v28;
    if ((void *)[(FATManager *)self getRWOffsetForClusterEntry:v28] != v48)
    {
      int v19 = v18;
      uint64_t v16 = v49;
      uint64_t v18 = v46;
      goto LABEL_4;
    }
    unsigned int v29 = [(FATManager *)self rwSize];

    if (v27 >= v29)
    {
      uint64_t v16 = v49;
      id v13 = v50;
      uint64_t v21 = v51;
      uint64_t v20 = v46;
      goto LABEL_6;
    }
    id v30 = [(FATManager *)self fsOps];
    uint64_t v16 = v49;
    unsigned int v31 = [v30 getNextClusterFromEntryForCluster:v18 entry:v49];

    if (!v31)
    {
      uint64_t v14 = (v18 + 1);
      unsigned int v32 = [(FATManager *)self getOffsetForClusterEntry:v14];
      if (v51 + 1 == v47)
      {
        id v44 = [(FATManager *)self fsOps];
        v45 = [(FATManager *)self fsInfo];
        objc_msgSend(v44, "setFatEntryForCluster:entry:withValue:", v18, v49, objc_msgSend(v45, "FATMask"));

        uint64_t v21 = v47;
        id v13 = v50;
LABEL_25:
        (*((void (**)(id, void, uint64_t, uint64_t, char *))v13 + 2))(v13, 0, v21, v18, v16);
        goto LABEL_26;
      }
      ++v51;
      while (1)
      {
        unsigned int v27 = v32 - a6;
        if (v32 - a6 >= [(FATManager *)self rwSize]
          || ([(FATManager *)self fsInfo],
              id v33 = objc_claimAutoreleasedReturnValue(),
              id v34 = [v33 maxValidCluster],
              v33,
              (unint64_t)v34 < v14))
        {
          v40 = [(FATManager *)self fsOps];
          uint64_t v41 = [(FATManager *)self fsInfo];
          uint64_t v16 = v49;
          objc_msgSend(v40, "setFatEntryForCluster:entry:withValue:", v18, v49, objc_msgSend(v41, "FATMask"));

          id v13 = v50;
          uint64_t v21 = v51;
          goto LABEL_25;
        }
        uint64_t v16 = (char *)a3 + v27;
        v35 = [(FATManager *)self fsOps];
        unsigned int v36 = [v35 getNextClusterFromEntryForCluster:v14 entry:v16];

        if (!v36) {
          break;
        }
        uint64_t v14 = (v14 + 1);
        unsigned int v32 = [(FATManager *)self getOffsetForClusterEntry:v14];
      }
      v37 = [(FATManager *)self fsOps];
      v38 = [(FATManager *)self fsInfo];
      objc_msgSend(v37, "setFatEntryForCluster:entry:withValue:", v18, v49, objc_msgSend(v38, "FATMask") & v14);

      unsigned int v17 = [(FATManager *)self fsInfo];
      id v39 = [v17 maxValidCluster];
      unsigned int v46 = v18;
      uint64_t v49 = (char *)a3 + v27;
      uint64_t v28 = v14;
      int v19 = v14;
      if ((unint64_t)v39 >= v14) {
        continue;
      }
      goto LABEL_4;
    }
    break;
  }
  v42 = fskit_std_log();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
    sub_10003032C();
  }

  v43 = fs_errorForPOSIXError();
  (*((void (**)(id, void *, void, void, void))v50 + 2))(v50, v43, 0, 0, 0);

  id v13 = v50;
LABEL_26:
}

- (void)allocateClusters:(unsigned int)a3 searchFromCluster:(unsigned int)a4 allowPartial:(BOOL)a5 zeroFill:(BOOL)a6 mustBeContig:(BOOL)a7 replyHandler:(id)a8
{
  id v13 = a8;
  uint64_t v14 = [(FATManager *)self fatQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001A008;
  v16[3] = &unk_10004CE68;
  BOOL v20 = a5;
  v16[4] = self;
  id v17 = v13;
  unsigned int v18 = a3;
  unsigned int v19 = a4;
  BOOL v21 = a7;
  id v15 = v13;
  dispatch_barrier_sync(v14, v16);
}

- (void)allocateClusters:(unsigned int)a3 allowPartial:(BOOL)a4 zeroFill:(BOOL)a5 mustBeContig:(BOOL)a6 replyHandler:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  id v13 = v12;
  if (v10)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001AD54;
    v14[3] = &unk_10004CE90;
    id v15 = v12;
    [(FATManager *)self allocateClusters:v10 searchFromCluster:0 allowPartial:v9 zeroFill:v8 mustBeContig:v7 replyHandler:v14];
  }
  else
  {
    (*((void (**)(id, void, void, void, void))v12 + 2))(v12, 0, 0, 0, 0);
  }
}

- (void)allocateClusters:(unsigned int)a3 forItem:(id)a4 allowPartial:(BOOL)a5 mustBeContig:(BOOL)a6 zeroFill:(BOOL)a7 replyHandler:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  uint64_t v12 = *(void *)&a3;
  id v14 = a4;
  id v15 = a8;
  id v16 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", -[FATManager rwSize](self, "rwSize"));
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_100019628;
  v26[4] = sub_100019638;
  id v27 = 0;
  if (v12)
  {
    if ([v14 numberOfClusters])
    {
      unsigned int v17 = [v14 lastCluster];
      unsigned int v18 = [(FATManager *)self fsInfo];
      if ([v18 maxValidCluster] == (id)v17) {
        uint64_t v19 = 0;
      }
      else {
        uint64_t v19 = [v14 lastCluster] + 1;
      }
    }
    else
    {
      uint64_t v19 = 0;
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001AF88;
    v20[3] = &unk_10004CEB8;
    id v21 = v14;
    id v22 = self;
    int64_t v25 = v26;
    id v23 = v16;
    id v24 = v15;
    [(FATManager *)self allocateClusters:v12 searchFromCluster:v19 allowPartial:v11 zeroFill:v9 mustBeContig:v10 replyHandler:v20];
  }
  else
  {
    (*((void (**)(id, void, void, void, void))v15 + 2))(v15, 0, 0, 0, 0);
  }
  _Block_object_dispose(v26, 8);
}

- (void)freeClusters:(unsigned int)a3 ofItem:(id)a4 replyHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [(FATManager *)self fatQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001B298;
  v13[3] = &unk_10004CEE0;
  v13[4] = self;
  id v14 = v8;
  unsigned int v16 = a3;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_barrier_sync(v10, v13);
}

- (void)freeClusterFrom:(unsigned int)a3 numClusters:(unsigned int)a4 replyHandler:(id)a5
{
  id v8 = a5;
  id v9 = [(FATManager *)self fatQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BC04;
  block[3] = &unk_10004CF08;
  unsigned int v13 = a3;
  unsigned int v14 = a4;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_barrier_sync(v9, block);
}

- (void)fatIterator:(unsigned int)a3 replyHandler:(id)a4
{
  id v4 = *(id *)&a3;
  unint64_t v6 = (void (**)(id, void *, id, uint64_t, void))a4;
  BOOL v7 = [[FATBlock alloc] initWithOffset:0 andLength:[(FATManager *)self rwSize]];
  uint64_t v8 = 1;
  id v9 = v4;
  do
  {
LABEL_2:
    int64_t v10 = [(FATManager *)self getRWOffsetForClusterEntry:v4];
    [(FATBlock *)v7 setStartOffset:[(FATManager *)self getRWOffsetForClusterEntry:v4]];
    id v11 = [(FATBlock *)v7 data];
    id v12 = -[FATManager syncMetaReadFromFAT:startingAt:](self, "syncMetaReadFromFAT:startingAt:", [v11 mutableBytes], v10);

    if (v12)
    {
      v6[2](v6, v12, v9, v8, 0);

      goto LABEL_17;
    }
    unint64_t v13 = [(FATManager *)self getOffsetForCluster:v4 inFatBlock:v7];
  }
  while (v13 >= [(FATManager *)self rwSize]);
  id v14 = v4;
  while (1)
  {
    id v15 = [(FATBlock *)v7 data];
    unsigned int v16 = (char *)[v15 mutableBytes] + v13;

    unsigned int v17 = [(FATManager *)self fsOps];
    id v4 = [v17 getNextClusterFromEntryForCluster:v14 entry:v16];

    if (!v4) {
      break;
    }
    if ([(FATManager *)self isEOFCluster:v4])
    {
      ((void (**)(id, void *, id, uint64_t, id))v6)[2](v6, 0, v9, v8, v4);
      goto LABEL_17;
    }
    if (v14 + 1 == v4)
    {
      uint64_t v8 = (v8 + 1);
    }
    else
    {
      if (((unsigned int (*)(id, void, id, uint64_t, id))v6[2])(v6, 0, v9, v8, v4)) {
        goto LABEL_17;
      }
      uint64_t v8 = 1;
      id v9 = v4;
    }
    unint64_t v13 = [(FATManager *)self getOffsetForCluster:v4 inFatBlock:v7];
    id v14 = v4;
    if (v13 >= [(FATManager *)self rwSize]) {
      goto LABEL_2;
    }
  }
  unsigned int v18 = fskit_std_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_100030634();
  }

  uint64_t v19 = fs_errorForPOSIXError();
  v6[2](v6, v19, 0, 0, 0);

LABEL_17:
}

- (void)getContigClusterChainLengthStartingAt:(unsigned int)a3 replyHandler:(id)a4
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001C2AC;
  v11[3] = &unk_10004CF58;
  unsigned int v13 = a3;
  v11[4] = self;
  id v12 = a4;
  id v5 = v12;
  unint64_t v6 = objc_retainBlock(v11);
  label = dispatch_queue_get_label(0);
  uint64_t v8 = [(FATManager *)self fatQueue];
  id v9 = dispatch_queue_get_label(v8);
  LODWORD(label) = strcmp(label, v9);

  if (label)
  {
    int64_t v10 = [(FATManager *)self fatQueue];
    dispatch_sync(v10, v6);
  }
  else
  {
    ((void (*)(void *))v6[2])(v6);
  }
}

- (void)clusterChainLength:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001C4B0;
  v14[3] = &unk_10004CFA8;
  unsigned int v16 = self;
  id v17 = a4;
  id v15 = v6;
  id v7 = v17;
  id v8 = v6;
  id v9 = objc_retainBlock(v14);
  label = dispatch_queue_get_label(0);
  id v11 = [(FATManager *)self fatQueue];
  id v12 = dispatch_queue_get_label(v11);
  LODWORD(label) = strcmp(label, v12);

  if (label)
  {
    unsigned int v13 = [(FATManager *)self fatQueue];
    dispatch_sync(v13, v9);
  }
  else
  {
    ((void (*)(void *))v9[2])(v9);
  }
}

- (void)iterateClusterChainOfItem:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FATManager *)self fatQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C7B4;
  block[3] = &unk_10004CFA8;
  unsigned int v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)getDirtyBitValue:(id)a3
{
  id v4 = a3;
  id v5 = [(FATManager *)self fatQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001C9AC;
  v7[3] = &unk_10004CFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)setDirtyBitValue:(unsigned __int8)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(FATManager *)self fatQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CC14;
  block[3] = &unk_10004CFF8;
  void block[4] = self;
  id v10 = v6;
  unsigned __int8 v11 = a3;
  id v8 = v6;
  dispatch_barrier_sync(v7, block);
}

- (BOOL)isEOFCluster:(unint64_t)a3
{
  id v5 = [(FATManager *)self fsInfo];
  if (((unint64_t)[v5 FATMask] & 0xFFFFFFF8) <= a3)
  {
    id v7 = [(FATManager *)self fsInfo];
    BOOL v6 = [v7 FATMask] >= a3;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)findNextFreeCluster:(unsigned int)a3 replyHandler:(id)a4
{
  id v6 = a4;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  unsigned int v26 = a3;
  id v7 = [[FATBlock alloc] initWithOffset:0 andLength:[(FATManager *)self rwSize]];
  id v21 = v6;
  id v8 = [(FATManager *)self getRWOffsetForClusterEntry:*((unsigned int *)v24 + 6)];
  char v9 = 0;
  while (1)
  {
    [(FATBlock *)v7 setStartOffset:[(FATManager *)self getRWOffsetForClusterEntry:*((unsigned int *)v24 + 6)]];
    id v10 = [(FATBlock *)v7 data];
    unsigned __int8 v11 = -[FATManager syncMetaReadFromFAT:startingAt:](self, "syncMetaReadFromFAT:startingAt:", [v10 mutableBytes], -[FATBlock startOffset](v7, "startOffset"));

    if (v11)
    {
      uint64_t v19 = v21;
      (*((void (**)(id, void *, void, void))v21 + 2))(v21, v11, 0, 0);
      goto LABEL_10;
    }
    uint64_t v12 = *((unsigned int *)v24 + 6);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001D240;
    v22[3] = &unk_10004D020;
    v22[4] = &v23;
    v22[5] = &v27;
    [(FATManager *)self findFreeClustersInBlock:v7 ofLength:1 contig:0 startCluster:v12 replyHandler:v22];
    if (*((_DWORD *)v28 + 6))
    {
      uint64_t v19 = v21;
      (*((void (**)(id, void, void))v21 + 2))(v21, 0, *((unsigned int *)v24 + 6));
      goto LABEL_10;
    }
    if (v8 == (id)[(FATBlock *)v7 startOffset] && (v9 & 1) != 0) {
      break;
    }
    unsigned int v13 = *((_DWORD *)v24 + 6);
    unsigned int v14 = [(FATManager *)self clustersPerBlock];
    *((_DWORD *)v24 + 6) += v13 / v14 * v14 - v13;
    unsigned int v15 = [(FATManager *)self clustersPerBlock];
    unint64_t v16 = *((_DWORD *)v24 + 6) + v15;
    *((_DWORD *)v24 + 6) = v16;
    id v17 = [(FATManager *)self fsInfo];
    id v18 = [v17 maxValidCluster];

    if ((unint64_t)v18 < v16)
    {
      *((_DWORD *)v24 + 6) = 2;
      char v9 = 1;
    }
  }
  fs_errorForPOSIXError();
  BOOL v20 = v19 = v21;
  (*((void (**)(id, void *, void, void))v21 + 2))(v21, v20, 0, 0);

LABEL_10:
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

- (FSBlockDeviceResource)device
{
  return (FSBlockDeviceResource *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDevice:(id)a3
{
}

- (OS_dispatch_queue)fatQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFatQueue:(id)a3
{
}

- (FileSystemInfo)fsInfo
{
  return (FileSystemInfo *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFsInfo:(id)a3
{
}

- (FSOperations)fsOps
{
  return (FSOperations *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFsOps:(id)a3
{
}

- (unsigned)fatSize
{
  return self->_fatSize;
}

- (void)setFatSize:(unsigned int)a3
{
  self->_fatSize = a3;
}

- (unsigned)rwSize
{
  return self->_rwSize;
}

- (void)setRwSize:(unsigned int)a3
{
  self->_rwSize = a3;
}

- (BOOL)useCache
{
  return self->_useCache;
}

- (void)setUseCache:(BOOL)a3
{
  self->_useCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fsOps, 0);
  objc_storeStrong((id *)&self->_fsInfo, 0);
  objc_storeStrong((id *)&self->_fatQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end