@interface SymLinkItem
+ (id)createSymlinkFromContent:(id)a3 inBuffer:(id)a4;
+ (void)verifyAndGetLink:(id)a3 replyHandler:(id)a4;
- (id)getAttributes:(id)a3;
- (id)initInVolume:(id)a3 inDir:(id)a4 startingAt:(unsigned int)a5 withData:(id)a6 andName:(id)a7;
- (unsigned)symlinkLength;
- (void)purgeMetaBlocksFromCache:(id)a3;
- (void)setSymlinkLength:(unsigned __int16)a3;
@end

@implementation SymLinkItem

- (id)initInVolume:(id)a3 inDir:(id)a4 startingAt:(unsigned int)a5 withData:(id)a6 andName:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)SymLinkItem;
  return [(FATItem *)&v8 initInVolume:a3 inDir:a4 startingAt:*(void *)&a5 withData:a6 andName:a7 isRoot:0];
}

+ (id)createSymlinkFromContent:(id)a3 inBuffer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSString) initWithData:v6 encoding:4];

  if (v7)
  {
    objc_super v8 = (char *)[v5 mutableBytes];
    *(_DWORD *)objc_super v8 = 1836667736;
    v8[4] = 10;
    id v9 = v7;
    size_t v10 = strlen((const char *)[v9 UTF8String]);
    snprintf(v8 + 5, 5uLL, "%04u\n", v10);
    id v11 = v9;
    +[Utilities getMD5Digest:forData:length:](Utilities, "getMD5Digest:forData:length:", 32, [v11 UTF8String], v10);
    id v12 = objc_claimAutoreleasedReturnValue();
    v13 = [v12 bytes];
    long long v14 = v13[1];
    *(_OWORD *)(v8 + 10) = *v13;
    *(_OWORD *)(v8 + 26) = v14;
    v8[42] = 10;
    memcpy(v8 + 43, [v11 UTF8String], v10);
    if (v10 <= 0x3FF) {
      v8[v10 + 43] = 10;
    }
    if ((v10 + 1) <= 0x3FF) {
      memset(&v8[(v10 + 1) + 43], 32, (1023 - v10));
    }

    v15 = 0;
  }
  else
  {
    v15 = fs_errorForPOSIXError();
  }

  return v15;
}

+ (void)verifyAndGetLink:(id)a3 replyHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v13 = v5;
  id v7 = (const char *)[v13 mutableBytes];
  if (!strncmp(v7, "XSym\n", 5uLL))
  {
    LODWORD(v9) = 0;
    uint64_t v10 = 5;
    while (1)
    {
      int v11 = v7[v10];
      if ((v11 - 48) > 9) {
        break;
      }
      ++v10;
      uint64_t v9 = (v11 + 10 * v9 - 48);
      if (v10 == 9)
      {
        if (v9 >= 0x401) {
          break;
        }
        id v8 = +[Utilities getMD5Digest:32 forData:v7 + 43 length:v9];
        if (!strncmp((const char *)[v8 bytes], v7 + 10, 0x20uLL))
        {
          if (v9 == 1024)
          {
            [v13 increaseLengthBy:1];
            id v7 = (const char *)[v13 mutableBytes];
          }
          v7[v9 + 43] = 0;
          id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
          v6[2](v6, 0, v12);
        }
        else
        {
          id v12 = fs_errorForPOSIXError();
          ((void (**)(id, void *, void *))v6)[2](v6, v12, 0);
        }

        goto LABEL_3;
      }
    }
  }
  fs_errorForPOSIXError();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, id, void *))v6)[2](v6, v8, 0);
LABEL_3:
}

- (void)purgeMetaBlocksFromCache:(id)a3
{
  id v49 = a3;
  v4 = [(FATItem *)self entryData];
  id v5 = [v4 getValidDataLength];
  id v6 = [(FATItem *)self volume];
  id v7 = [v6 systemInfo];
  unint64_t v8 = (unint64_t)v5 + [v7 bytesPerSector] - 1;
  uint64_t v9 = [(FATItem *)self volume];
  uint64_t v10 = [v9 systemInfo];
  unint64_t v11 = v8 / [v10 bytesPerSector];
  id v12 = [(FATItem *)self volume];
  id v13 = [v12 systemInfo];
  unsigned int v14 = [v13 bytesPerSector] * v11;

  v15 = +[NSMutableArray array];
  uint64_t v16 = [(FATItem *)self firstCluster];
  unsigned int v17 = 0;
  v50 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  int v62 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  int v58 = 0;
  while (2)
  {
    if (v14
      && ([(FATItem *)self volume],
          v18 = objc_claimAutoreleasedReturnValue(),
          [v18 systemInfo],
          v19 = objc_claimAutoreleasedReturnValue(),
          unsigned int v20 = [v19 isClusterValid:v16],
          v19,
          v18,
          v20))
    {
      while (1)
      {
        id v21 = [(FATItem *)self volume];
        v22 = [v21 systemInfo];
        if (![v22 isClusterValid:v16])
        {

          goto LABEL_14;
        }
        id v23 = [v15 count];

        if ((unint64_t)v23 > 7) {
          goto LABEL_15;
        }
        v24 = [(FATItem *)self volume];
        v25 = [v24 fatManager];
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_100018714;
        v51[3] = &unk_10004C798;
        id v26 = v49;
        id v52 = v26;
        v53 = &v59;
        v54 = &v55;
        [v25 getContigClusterChainLengthStartingAt:v16 replyHandler:v51];

        v17 += *((_DWORD *)v60 + 6);
        if (v17 > [(FATItem *)self numberOfClusters])
        {
          v40 = fskit_std_log();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
            sub_100030188(v40, v41, v42, v43, v44, v45, v46, v47);
          }

          (*((void (**)(id, void))v26 + 2))(v26, 0);
          v39 = 0;
          goto LABEL_25;
        }
        v27 = [(FATItem *)self volume];
        v28 = [v27 systemInfo];
        unsigned int v29 = [v28 bytesPerCluster];
        int v30 = *((_DWORD *)v60 + 6);

        v31 = [(FATItem *)self volume];
        v32 = [v31 systemInfo];
        id v33 = [v32 offsetForCluster:v16];
        uint64_t v34 = v30 * v29 >= v14 ? v14 : v30 * v29;
        v35 = +[FSMetadataBlockRange rangeWithOffset:v33 blockLength:v34 numberOfBlocks:1];

        unsigned int v36 = [v35 blockLength];
        [v15 addObject:v35];
        v14 -= v36;
        if (!v14) {
          break;
        }
        uint64_t v16 = *((unsigned int *)v56 + 6);

        v50 = v35;
      }
      id v21 = v52;
      v50 = v35;
LABEL_14:

LABEL_15:
      v37 = [(FATItem *)self volume];
      v38 = [v37 resource];
      v39 = +[Utilities syncMetaPurgeToDevice:v38 rangesToPurge:v15];

      if (!v39)
      {
        [v15 removeAllObjects];
        continue;
      }
      v48 = fskit_std_log();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        sub_100030200();
      }
    }
    else
    {
      v39 = 0;
    }
    break;
  }
  (*((void (**)(id, void *))v49 + 2))(v49, v39);
LABEL_25:

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
}

- (id)getAttributes:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SymLinkItem;
  id v5 = [(FATItem *)&v7 getAttributes:v4];
  if ([v4 isAttributeWanted:8]) {
    [v5 setType:3];
  }
  if ([v4 isAttributeWanted:64]) {
    objc_msgSend(v5, "setSize:", -[SymLinkItem symlinkLength](self, "symlinkLength"));
  }

  return v5;
}

- (unsigned)symlinkLength
{
  return self->_symlinkLength;
}

- (void)setSymlinkLength:(unsigned __int16)a3
{
  self->_symlinkLength = a3;
}

@end