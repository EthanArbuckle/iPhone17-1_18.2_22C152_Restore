@interface DirBlock
- (DirItem)dir;
- (NSMutableData)data;
- (id)initInDir:(id)a3;
- (id)readDirBlockNum:(unint64_t)a3;
- (id)readRelativeDirBlockNum:(unsigned int)a3;
- (id)setBytes:(id)a3 atOffset:(unint64_t)a4;
- (id)writeToDisk;
- (id)writeToDiskFromOffset:(unint64_t)a3 length:(unint64_t)a4;
- (unint64_t)offsetInVolume;
- (unint64_t)size;
- (void)getBytesAtOffset:(unint64_t)a3;
- (void)releaseBlock;
- (void)setData:(id)a3;
- (void)setDir:(id)a3;
- (void)setOffsetInVolume:(unint64_t)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation DirBlock

- (id)initInDir:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DirBlock;
  v5 = [(DirBlock *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(DirBlock *)v5 setDir:v4];
    [(DirBlock *)v6 setOffsetInVolume:0];
    -[DirBlock setSize:](v6, "setSize:", [v4 getDirBlockSize]);
    v7 = +[NSMutableData dataWithLength:[(DirBlock *)v6 size]];
    [(DirBlock *)v6 setData:v7];

    v8 = [(DirBlock *)v6 dir];
    v9 = [v8 sem];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  }
  return v6;
}

- (void)releaseBlock
{
  id v3 = [(DirBlock *)self dir];
  v2 = [v3 sem];
  dispatch_semaphore_signal(v2);
}

- (id)readDirBlockNum:(unint64_t)a3
{
  v5 = [(DirBlock *)self dir];
  unsigned int v6 = [v5 isFat1216RootDir];

  v7 = [(DirBlock *)self dir];
  v8 = [v7 volume];
  v9 = [v8 systemInfo];
  v10 = v9;
  if (v6)
  {
    unsigned int v11 = [v9 rootSector];
    v12 = [(DirBlock *)self dir];
    v13 = [v12 volume];
    v14 = [v13 systemInfo];
    unint64_t v15 = [v14 bytesPerSector] * v11;
  }
  else
  {
    unint64_t v15 = (unint64_t)[v9 offsetForDirBlock:a3];
  }

  v16 = [(DirBlock *)self dir];
  v17 = [v16 volume];
  v18 = [v17 resource];
  id v19 = [(DirBlock *)self data];
  v20 = +[Utilities syncMetaReadFromDevice:into:startingAt:length:](Utilities, "syncMetaReadFromDevice:into:startingAt:length:", v18, [v19 mutableBytes], v15, -[DirBlock size](self, "size"));

  if (!v20) {
    [(DirBlock *)self setOffsetInVolume:v15];
  }

  return v20;
}

- (id)readRelativeDirBlockNum:(unsigned int)a3
{
  uint64_t v43 = 0;
  v44[0] = &v43;
  v44[1] = 0x3032000000;
  v44[2] = sub_100005D58;
  v44[3] = sub_100005D68;
  id v45 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  int v42 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  int v38 = 0;
  id v4 = [(DirBlock *)self dir];
  id v5 = [v4 firstCluster];

  unsigned int v6 = [(DirBlock *)self dir];
  v7 = [v6 volume];
  v8 = [v7 systemInfo];
  unint64_t v9 = (unint64_t)[v8 dirBlockSize];

  v10 = [(DirBlock *)self dir];
  uint64_t v11 = [v10 volume];
  v12 = [(id)v11 systemInfo];
  unsigned int v13 = [v12 bytesPerCluster];

  v14 = [(DirBlock *)self dir];
  LOBYTE(v11) = [v14 isFat1216RootDir];

  if (v11)
  {
    uint64_t v15 = 0;
LABEL_3:
    id v16 = [(DirBlock *)self readDirBlockNum:v15];
  }
  else
  {
    unsigned int v17 = 0;
    unint64_t v18 = v13 / v9;
    while (1)
    {
      id v19 = [(DirBlock *)self dir];
      v20 = [v19 volume];
      v21 = [v20 systemInfo];
      unsigned int v22 = [v21 isClusterValid:v5];

      if (!v22) {
        goto LABEL_15;
      }
      v23 = [(DirBlock *)self dir];
      v24 = [v23 volume];
      v25 = [v24 fatManager];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100005D70;
      v34[3] = &unk_10004C5B8;
      v34[4] = &v43;
      v34[5] = &v35;
      v34[6] = &v39;
      [v25 getContigClusterChainLengthStartingAt:v5 replyHandler:v34];

      if (*(void *)(v44[0] + 40)) {
        break;
      }
      if (a3 >= v17)
      {
        unsigned int v26 = *((_DWORD *)v36 + 6);
        if (v18 * (unint64_t)v26 + v17 > a3)
        {
          uint64_t v15 = a3 - v17 + v5 * v18;
          if (v15) {
            goto LABEL_3;
          }
LABEL_15:
          v28 = fskit_std_log();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
            v31 = [(DirBlock *)self dir];
            id v32 = [v31 getDirSize];
            *(_DWORD *)buf = 136315650;
            v47 = "-[DirBlock readRelativeDirBlockNum:]";
            __int16 v48 = 1024;
            unsigned int v49 = a3;
            __int16 v50 = 2048;
            id v51 = v32;
            _os_log_fault_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "%s: Couldn't find dir block index %u. Dir Size = %llu.", buf, 0x1Cu);
          }
          fs_errorForPOSIXError();
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
      }
      else
      {
        unsigned int v26 = *((_DWORD *)v36 + 6);
      }
      v17 += v26 * v18;
      id v5 = (id)*((unsigned int *)v40 + 6);
    }
    v27 = fskit_std_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10002BD8C((uint64_t)v44, v27);
    }

    id v16 = *(id *)(v44[0] + 40);
  }
LABEL_18:
  v29 = v16;
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

  return v29;
}

- (void)getBytesAtOffset:(unint64_t)a3
{
  if ([(DirBlock *)self size] <= a3)
  {
    v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002BE20(self, a3, v7);
    }

    return 0;
  }
  else
  {
    id v5 = [(DirBlock *)self data];
    unsigned int v6 = (char *)[v5 bytes] + a3;
  }
  return v6;
}

- (id)setBytes:(id)a3 atOffset:(unint64_t)a4
{
  id v6 = a3;
  v7 = (char *)[v6 length] + a4;
  if (v7 <= (char *)[(DirBlock *)self size])
  {
    id v9 = [(DirBlock *)self data];
    v10 = (char *)[v9 mutableBytes] + a4;
    id v11 = v6;
    memcpy(v10, [v11 bytes], (size_t)objc_msgSend(v11, "length"));

    v8 = 0;
  }
  else
  {
    v8 = fs_errorForPOSIXError();
  }

  return v8;
}

- (id)writeToDisk
{
  id v3 = [(DirBlock *)self dir];
  id v4 = [v3 volume];
  id v5 = [v4 resource];
  id v6 = [(DirBlock *)self data];
  v7 = +[Utilities metaWriteToDevice:from:startingAt:length:](Utilities, "metaWriteToDevice:from:startingAt:length:", v5, [v6 bytes], -[DirBlock offsetInVolume](self, "offsetInVolume"), -[DirBlock size](self, "size"));

  return v7;
}

- (id)writeToDiskFromOffset:(unint64_t)a3 length:(unint64_t)a4
{
  if (a4 + a3 <= [(DirBlock *)self size]) {
    [(DirBlock *)self writeToDisk];
  }
  else {
  id v5 = fs_errorForPOSIXError();
  }

  return v5;
}

- (unint64_t)offsetInVolume
{
  return self->_offsetInVolume;
}

- (void)setOffsetInVolume:(unint64_t)a3
{
  self->_offsetInVolume = a3;
}

- (DirItem)dir
{
  return (DirItem *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDir:(id)a3
{
}

- (NSMutableData)data
{
  return (NSMutableData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setData:(id)a3
{
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_dir, 0);
}

@end