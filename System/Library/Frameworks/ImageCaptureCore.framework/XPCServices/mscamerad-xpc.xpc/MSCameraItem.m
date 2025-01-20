@interface MSCameraItem
- (BOOL)locked;
- (BOOL)protectionStatus;
- (MSCameraItem)initWithFSURL:(id)a3 name:(id)a4 parent:(id)a5 device:(id)a6;
- (MSCameraItem)initWithName:(id)a3 parent:(id)a4 device:(id)a5;
- (MSObjectInfoDataset)info;
- (NSMutableDictionary)metadata;
- (NSString)exifCreationDate;
- (NSString)exifCreationDateTime;
- (NSString)exifModificationDate;
- (NSString)exifModificationDateTime;
- (NSString)mediaItemType;
- (NSString)name;
- (NSString)path;
- (OS_dispatch_source)filesystemChangeSource;
- (id)baseName;
- (id)device;
- (id)filename;
- (id)parent;
- (id)refreshInfo:(id)a3;
- (int)fd;
- (int)filesystemChangeDescriptor;
- (int64_t)compareObjectHandle:(id)a3;
- (timespec)fsCreationTime;
- (timespec)fsModificationTime;
- (unint64_t)captureDate;
- (unint64_t)fileSize;
- (unint64_t)fsSN;
- (unint64_t)ino;
- (unint64_t)modificationDate;
- (unint64_t)objectCompressedSize;
- (unint64_t)parentIndex;
- (unint64_t)size;
- (unint64_t)unsignedIntegerValue;
- (unsigned)objHandle;
- (unsigned)parentObject;
- (unsigned)type;
- (void)cancelSource;
- (void)dealloc;
- (void)refreshAndNotify;
- (void)setCaptureDate:(unint64_t)a3;
- (void)setDevice:(id)a3;
- (void)setExifCreationDate:(id)a3;
- (void)setExifCreationDateTime:(id)a3;
- (void)setExifModificationDate:(id)a3;
- (void)setExifModificationDateTime:(id)a3;
- (void)setFd:(int)a3;
- (void)setFilename:(id)a3;
- (void)setFilesystemChangeDescriptor:(int)a3;
- (void)setFilesystemChangeSource:(id)a3;
- (void)setFsCreationTime:(timespec)a3;
- (void)setFsModificationTime:(timespec)a3;
- (void)setFsSN:(unint64_t)a3;
- (void)setInfo:(id)a3;
- (void)setIno:(unint64_t)a3;
- (void)setMetadata:(id)a3;
- (void)setModificationDate:(unint64_t)a3;
- (void)setObjHandle:(unsigned int)a3;
- (void)setObjectCompressedSize:(unint64_t)a3;
- (void)setParent:(id)a3;
- (void)setParentObject:(unsigned int)a3;
- (void)setPath:(id)a3;
- (void)setProtectionStatus:(BOOL)a3;
- (void)setType:(unsigned int)a3;
@end

@implementation MSCameraItem

- (NSString)name
{
  v2 = [(MSCameraItem *)self info];
  v3 = [v2 filename];

  return (NSString *)v3;
}

- (id)baseName
{
  v2 = [(MSCameraItem *)self name];
  v3 = [v2 stringByDeletingPathExtension];

  return v3;
}

- (unint64_t)size
{
  v2 = [(MSCameraItem *)self info];
  id v3 = [v2 objectCompressedSize];

  return (unint64_t)v3;
}

- (void)cancelSource
{
  filesystemChangeSource = self->_filesystemChangeSource;
  if (filesystemChangeSource)
  {
    dispatch_source_cancel(filesystemChangeSource);
    v4 = self->_filesystemChangeSource;
    self->_filesystemChangeSource = 0;
  }
}

- (void)dealloc
{
  [(MSCameraItem *)self cancelSource];
  v3.receiver = self;
  v3.super_class = (Class)MSCameraItem;
  [(MSCameraItem *)&v3 dealloc];
}

- (unint64_t)unsignedIntegerValue
{
  return [(MSCameraItem *)self objHandle];
}

- (NSString)mediaItemType
{
  return (NSString *)@"item";
}

- (MSCameraItem)initWithFSURL:(id)a3 name:(id)a4 parent:(id)a5 device:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)MSCameraItem;
  v14 = [(MSCameraItem *)&v35 init];
  v15 = v14;
  if (v14)
  {
    id v31 = v11;
    v32 = v12;
    [(MSCameraItem *)v14 setDevice:v13];
    v16 = objc_alloc_init(MSObjectInfoDataset);
    [(MSCameraItem *)v15 setInfo:v16];

    v36[0] = NSURLNameKey;
    v36[1] = NSURLFileSizeKey;
    v36[2] = NSURLCreationDateKey;
    v36[3] = NSURLContentModificationDateKey;
    v36[4] = NSURLIsWritableKey;
    v17 = +[NSArray arrayWithObjects:v36 count:5];
    uint64_t v34 = 0;
    v18 = [v10 resourceValuesForKeys:v17 error:&v34];
    uint64_t v19 = v34;

    if (v19)
    {
      v20 = v15;
      v15 = 0;
      id v11 = v31;
    }
    else
    {
      v20 = [v18 objectForKeyedSubscript:NSURLCreationDateKey];
      [v20 timeIntervalSince1970];
      [(MSCameraItem *)v15 setCaptureDate:(unint64_t)v21];
      v30 = [v18 objectForKeyedSubscript:NSURLContentModificationDateKey];
      [v30 timeIntervalSince1970];
      [(MSCameraItem *)v15 setModificationDate:(unint64_t)v22];
      v23 = [v18 objectForKeyedSubscript:NSURLFileSizeKey];
      -[MSCameraItem setObjectCompressedSize:](v15, "setObjectCompressedSize:", [v23 unsignedLongLongValue]);
      v24 = [v18 objectForKeyedSubscript:NSURLIsWritableKey];
      -[MSCameraItem setProtectionStatus:](v15, "setProtectionStatus:", [v24 BOOLValue] ^ 1);
      atomic_fetch_add(dword_1000446F8, 1u);
      -[MSCameraItem setObjHandle:](v15, "setObjHandle:");
      [(MSCameraItem *)v15 setFilename:v31];
      -[MSCameraItem setParentObject:](v15, "setParentObject:", [v32 objHandle]);
      v25 = [v10 path];
      [(MSCameraItem *)v15 setPath:v25];

      memset(&v33, 0, sizeof(v33));
      id v26 = [v10 path];
      int v27 = lstat((const char *)[v26 UTF8String], &v33);

      id v11 = v31;
      if (v27) {
        __darwin_ino64_t st_ino = 0;
      }
      else {
        __darwin_ino64_t st_ino = v33.st_ino;
      }
      [(MSCameraItem *)v15 setIno:st_ino];
    }
    id v12 = v32;
  }

  return v15;
}

- (MSCameraItem)initWithName:(id)a3 parent:(id)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MSCameraItem;
  id v11 = [(MSCameraItem *)&v25 init];
  id v12 = v11;
  if (v11)
  {
    id v13 = [(MSCameraItem *)v11 info];
    [v13 setFilename:v8];

    id v14 = [v9 objHandle];
    v15 = [(MSCameraItem *)v12 info];
    [v15 setParentObject:v14];

    [(MSCameraItem *)v12 setDevice:v10];
    memset(&v24.st_size, 0, 48);
    v16 = objc_msgSend(v9, "path", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    v17 = [(MSCameraItem *)v12 info];
    v18 = [v17 filename];
    uint64_t v19 = [v16 stringByAppendingString:v18];
    [(MSCameraItem *)v12 setPath:v19];

    id v20 = [(MSCameraItem *)v12 path];
    LODWORD(v17) = lstat((const char *)[v20 UTF8String], &v24);

    if (v17)
    {
      double v21 = v12;
      id v12 = 0;
    }
    else
    {
      off_t st_size = v24.st_size;
      double v21 = [(MSCameraItem *)v12 info];
      [v21 setObjectCompressedSize:st_size];
    }
  }
  return v12;
}

- (void)refreshAndNotify
{
  objc_super v3 = +[NSMutableDictionary dictionary];
  id v4 = [(MSCameraItem *)self refreshInfo:v3];
  if ([v3 count])
  {
    CFStringRef v13 = @"ICObjectInfoUpdate";
    v5 = +[NSNumber numberWithUnsignedInt:[(MSCameraItem *)self objHandle]];
    id v11 = v5;
    id v12 = v3;
    v6 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v14 = v6;
    v7 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

    id v8 = [(MSCameraItem *)self device];
    id v9 = [(MSCameraItem *)self device];
    id v10 = [v9 allConnections];
    [v8 sendUpdatedItemsNotification:v7 toConnections:v10];
  }
}

- (id)refreshInfo:(id)a3
{
  id v4 = a3;
  v5 = [(MSCameraItem *)self path];
  v6 = +[NSURL fileURLWithPath:v5];

  v77[0] = NSURLFileSizeKey;
  v77[1] = NSURLCreationDateKey;
  v77[2] = NSURLContentModificationDateKey;
  v7 = +[NSArray arrayWithObjects:v77 count:3];
  id v72 = 0;
  id v8 = [v6 resourceValuesForKeys:v7 error:&v72];
  id v9 = v72;

  if (v9)
  {
    [(MSCameraItem *)self type];
  }
  else
  {
    id v10 = [v8 objectForKeyedSubscript:NSURLCreationDateKey];
    unint64_t v11 = [(MSCameraItem *)self captureDate];
    v66 = v10;
    [v10 timeIntervalSince1970];
    if (v11 != (unint64_t)v12)
    {
      __ICOSLogCreate();
      CFStringRef v13 = [(MSCameraItem *)self name];
      if ((unint64_t)[v13 length] >= 0x15)
      {
        id v14 = objc_msgSend(v13, "substringWithRange:", 0, 18);
        uint64_t v15 = [v14 stringByAppendingString:@".."];

        CFStringRef v13 = (void *)v15;
      }
      unint64_t v16 = [(MSCameraItem *)self captureDate];
      [v66 timeIntervalSince1970];
      v18 = +[NSString stringWithFormat:@"refreshInfo: creation date %llu -> %llu", v16, (unint64_t)v17];
      uint64_t v19 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = v13;
        double v21 = v19;
        id v22 = [v20 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v74 = v22;
        __int16 v75 = 2114;
        v76 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      [v66 timeIntervalSince1970];
      [(MSCameraItem *)self setCaptureDate:(unint64_t)v23];
      if (v4)
      {
        stat v24 = +[NSNumber numberWithUnsignedLongLong:[(MSCameraItem *)self captureDate]];
        [v4 setObject:v24 forKeyedSubscript:@"ICCaptureDate"];
      }
    }
    objc_super v25 = [v8 objectForKeyedSubscript:NSURLContentModificationDateKey];
    unint64_t v26 = [(MSCameraItem *)self modificationDate];
    [v25 timeIntervalSince1970];
    if (v26 != (unint64_t)v27)
    {
      __ICOSLogCreate();
      v28 = [(MSCameraItem *)self name];
      if ((unint64_t)[v28 length] >= 0x15)
      {
        v29 = objc_msgSend(v28, "substringWithRange:", 0, 18);
        uint64_t v30 = [v29 stringByAppendingString:@".."];

        v28 = (void *)v30;
      }
      unint64_t v31 = [(MSCameraItem *)self modificationDate];
      [v25 timeIntervalSince1970];
      stat v33 = +[NSString stringWithFormat:@"refreshInfo: modification date %llu -> %llu", v31, (unint64_t)v32];
      uint64_t v34 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v35 = v28;
        v36 = v34;
        id v37 = [v35 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v74 = v37;
        __int16 v75 = 2114;
        v76 = v33;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      [v25 timeIntervalSince1970];
      [(MSCameraItem *)self setModificationDate:(unint64_t)v38];
      if (v4)
      {
        v39 = +[NSNumber numberWithUnsignedLongLong:[(MSCameraItem *)self modificationDate]];
        [v4 setObject:v39 forKeyedSubscript:@"ICModificationDate"];
      }
    }
    v64 = v6;
    v65 = v4;
    v40 = [v8 objectForKeyedSubscript:NSURLFileSizeKey];
    unint64_t v41 = [(MSCameraItem *)self objectCompressedSize];
    id v42 = [v40 unsignedLongLongValue];
    if ((id)v41 != v42)
    {
      __ICOSLogCreate();
      v43 = [(MSCameraItem *)self name];
      if ((unint64_t)[v43 length] >= 0x15)
      {
        v44 = objc_msgSend(v43, "substringWithRange:", 0, 18);
        uint64_t v45 = [v44 stringByAppendingString:@".."];

        v43 = (void *)v45;
      }
      v46 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"refreshInfo: file size %llu -> %llu", -[MSCameraItem objectCompressedSize](self, "objectCompressedSize"), [v40 unsignedLongLongValue]);
      v47 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v48 = v8;
        v49 = v25;
        id v50 = v43;
        v51 = v47;
        v52 = v50;
        objc_super v25 = v49;
        id v8 = v48;
        id v53 = [v52 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v74 = v53;
        __int16 v75 = 2114;
        v76 = v46;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      -[MSCameraItem setObjectCompressedSize:](self, "setObjectCompressedSize:", [v40 unsignedLongLongValue]);
      if (v65)
      {
        v54 = +[NSNumber numberWithUnsignedLongLong:[(MSCameraItem *)self objectCompressedSize]];
        [v65 setObject:v54 forKeyedSubscript:@"ICFileSize"];
      }
    }

    unsigned int v55 = [(MSCameraItem *)self type];
    id v9 = 0;
    id v4 = v65;
    v6 = v64;
    if ((id)v41 != v42 && v55 == 1836019574)
    {
      dispatch_semaphore_t v56 = dispatch_semaphore_create(0);
      id v57 = objc_alloc_init((Class)NSMutableArray);
      id v58 = objc_alloc((Class)AVURLAsset);
      v59 = [(MSCameraItem *)self path];
      v60 = +[NSURL fileURLWithPath:v59];
      id v61 = [v58 initWithURL:v60 options:0];

      [v57 addObject:@"duration"];
      if (v61)
      {
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472;
        v67[2] = sub_10001607C;
        v67[3] = &unk_100034BD0;
        id v68 = v61;
        v69 = self;
        id v70 = v65;
        v71 = v56;
        [v68 loadValuesAsynchronouslyForKeys:v57 completionHandler:v67];
      }
      dispatch_semaphore_wait(v56, 0xFFFFFFFFFFFFFFFFLL);

      id v9 = 0;
    }
  }
  v62 = [(MSCameraItem *)self info];

  return v62;
}

- (unint64_t)fileSize
{
  v2 = [(MSCameraItem *)self info];
  id v3 = [v2 objectCompressedSize];

  return (unint64_t)v3;
}

- (unsigned)objHandle
{
  v2 = [(MSCameraItem *)self info];
  unsigned int v3 = [v2 objectHandle];

  return v3;
}

- (void)setObjHandle:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MSCameraItem *)self info];
  [v4 setObjectHandle:v3];
}

- (unsigned)parentObject
{
  v2 = [(MSCameraItem *)self info];
  unsigned int v3 = [v2 parentObject];

  return v3;
}

- (void)setParentObject:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MSCameraItem *)self info];
  [v4 setParentObject:v3];
}

- (unint64_t)objectCompressedSize
{
  v2 = [(MSCameraItem *)self info];
  id v3 = [v2 objectCompressedSize];

  return (unint64_t)v3;
}

- (void)setObjectCompressedSize:(unint64_t)a3
{
  id v4 = [(MSCameraItem *)self info];
  [v4 setObjectCompressedSize:a3];
}

- (void)setProtectionStatus:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MSCameraItem *)self info];
  [v4 setProtectionStatus:v3];
}

- (BOOL)protectionStatus
{
  v2 = [(MSCameraItem *)self info];
  BOOL v3 = [v2 protectionStatus] != 0;

  return v3;
}

- (void)setFilename:(id)a3
{
  id v4 = a3;
  id v5 = [(MSCameraItem *)self info];
  [v5 setFilename:v4];
}

- (id)filename
{
  v2 = [(MSCameraItem *)self info];
  BOOL v3 = [v2 filename];

  return v3;
}

- (unint64_t)captureDate
{
  v2 = [(MSCameraItem *)self info];
  id v3 = objc_msgSend(v2, "captureDate_tvsec");

  return (unint64_t)v3;
}

- (void)setCaptureDate:(unint64_t)a3
{
  id v4 = [(MSCameraItem *)self info];
  objc_msgSend(v4, "setCaptureDate_tvsec:", a3);
}

- (unint64_t)modificationDate
{
  v2 = [(MSCameraItem *)self info];
  id v3 = objc_msgSend(v2, "modificationDate_tvsec");

  return (unint64_t)v3;
}

- (void)setModificationDate:(unint64_t)a3
{
  id v4 = [(MSCameraItem *)self info];
  objc_msgSend(v4, "setModificationDate_tvsec:", a3);
}

- (int64_t)compareObjectHandle:(id)a3
{
  unsigned int v4 = [a3 objHandle];
  if (v4 == [(MSCameraItem *)self objHandle]) {
    return 0;
  }
  if (v4 > [(MSCameraItem *)self objHandle]) {
    return -1;
  }
  return 1;
}

- (BOOL)locked
{
  id v3 = [(MSCameraItem *)self device];
  unsigned int v4 = [v3 cameraDictionary];
  id v5 = [v4 objectForKeyedSubscript:@"ICDeviceLocked"];
  if ([v5 BOOLValue])
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = [(MSCameraItem *)self info];
    BOOL v6 = [v7 protectionStatus] == 1;
  }
  return v6;
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (unint64_t)fsSN
{
  return self->_fsSN;
}

- (void)setFsSN:(unint64_t)a3
{
  self->_fsSN = a3;
}

- (unint64_t)ino
{
  return self->_ino;
}

- (void)setIno:(unint64_t)a3
{
  self->_ino = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (id)parent
{
  id WeakRetained = objc_loadWeakRetained(&self->_parent);

  return WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (MSObjectInfoDataset)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (id)device
{
  id WeakRetained = objc_loadWeakRetained(&self->_device);

  return WeakRetained;
}

- (void)setDevice:(id)a3
{
}

- (unint64_t)parentIndex
{
  return self->_parentIndex;
}

- (NSMutableDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (OS_dispatch_source)filesystemChangeSource
{
  return self->_filesystemChangeSource;
}

- (void)setFilesystemChangeSource:(id)a3
{
}

- (int)filesystemChangeDescriptor
{
  return self->_filesystemChangeDescriptor;
}

- (void)setFilesystemChangeDescriptor:(int)a3
{
  self->_filesystemChangeDescriptor = a3;
}

- (NSString)exifCreationDateTime
{
  return self->_exifCreationDateTime;
}

- (void)setExifCreationDateTime:(id)a3
{
}

- (NSString)exifModificationDateTime
{
  return self->_exifModificationDateTime;
}

- (void)setExifModificationDateTime:(id)a3
{
}

- (NSString)exifModificationDate
{
  return self->_exifModificationDate;
}

- (void)setExifModificationDate:(id)a3
{
}

- (NSString)exifCreationDate
{
  return self->_exifCreationDate;
}

- (void)setExifCreationDate:(id)a3
{
}

- (timespec)fsCreationTime
{
  uint64_t tv_nsec = self->_fsCreationTime.tv_nsec;
  __darwin_time_t tv_sec = self->_fsCreationTime.tv_sec;
  result.uint64_t tv_nsec = tv_nsec;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (void)setFsCreationTime:(timespec)a3
{
  self->_fsCreationTime = a3;
}

- (timespec)fsModificationTime
{
  uint64_t tv_nsec = self->_fsModificationTime.tv_nsec;
  __darwin_time_t tv_sec = self->_fsModificationTime.tv_sec;
  result.uint64_t tv_nsec = tv_nsec;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (void)setFsModificationTime:(timespec)a3
{
  self->_fsModificationTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exifCreationDate, 0);
  objc_storeStrong((id *)&self->_exifModificationDate, 0);
  objc_storeStrong((id *)&self->_exifModificationDateTime, 0);
  objc_storeStrong((id *)&self->_exifCreationDateTime, 0);
  objc_storeStrong((id *)&self->_filesystemChangeSource, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak(&self->_device);
  objc_destroyWeak(&self->_parent);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_info, 0);
}

@end