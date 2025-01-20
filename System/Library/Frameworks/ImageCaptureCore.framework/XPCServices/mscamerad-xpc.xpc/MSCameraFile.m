@interface MSCameraFile
- (BOOL)closeMap:(char *)a3 size:(unint64_t)a4;
- (BOOL)closeStream;
- (BOOL)fullMetadata;
- (BOOL)hasMetadata;
- (BOOL)hasThumbnail;
- (BOOL)hasValidInformation:(id)a3;
- (BOOL)imageIOSupported;
- (BOOL)openStream;
- (BOOL)previewThumbnail;
- (BOOL)processMetadata:(id)a3;
- (BOOL)rawImageSupported;
- (BOOL)smallThumbnail;
- (BOOL)updatedBasicMetadata;
- (BOOL)updatedExpensiveMetadata;
- (BOOL)validateReturnDataSize:(unint64_t)a3 forRequestSize:(unint64_t)a4;
- (ICBufferCache)bufferCache;
- (MSCameraFile)initWithFSURL:(id)a3 name:(id)a4 parent:(id)a5 device:(id)a6 fullMetadata:(BOOL)a7;
- (NSMutableDictionary)metadataDict;
- (NSMutableDictionary)subImages;
- (NSString)UTI;
- (NSString)fingerprint;
- (id)createImageDataForMaxPixelSize:(unsigned int)a3;
- (id)createThumbnailUsingOffsets:(id)a3;
- (id)exifThumbOffsets;
- (id)fingerprintWithError:(id *)a3;
- (id)imageData;
- (id)imageThumbnailDataForMaxPixelSize:(unsigned int)a3 rotated:(BOOL *)a4;
- (id)initForReadingOnlyWithName:(id)a3 parent:(id)a4 device:(id)a5;
- (id)mediaItemType;
- (id)movieThumbnailDataForMaxPixelSize:(unsigned int)a3;
- (id)name;
- (id)rawImageValidateSubImage:(id)a3 error:(id *)a4;
- (id)scaleData:(id)a3 maxPixelSize:(unsigned int)a4;
- (id)subImageDictForPixelWidth:(id)a3;
- (id)thumbnailDataForMaxPixelSize:(unsigned int)a3 rotated:(BOOL *)a4;
- (id)thumbnailDataUsingSidecarFiles;
- (int)bitsPerPixel;
- (int)fileOpenCount;
- (int)imageHeight;
- (int)imageOrientation;
- (int)imageWidth;
- (int)thumbWidth;
- (int64_t)compare:(id)a3 against:(id)a4 withContext:(void *)a5;
- (os_unfair_lock_s)fileOpenLock;
- (unint64_t)readStream:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5;
- (unint64_t)size;
- (unsigned)thumbHeight;
- (unsigned)thumbOffset;
- (unsigned)thumbSize;
- (void)addSubImageDict:(id)a3;
- (void)clearDevice;
- (void)createBufferCache;
- (void)dealloc;
- (void)decrementStreamCount;
- (void)destroyBufferCache;
- (void)incrementStreamCount;
- (void)metadataWithOptions:(id)a3 reply:(id)a4;
- (void)rawImageMinimumProperties;
- (void)readDataWithOptions:(id)a3 reply:(id)a4;
- (void)readMap:(unint64_t)a3 offset:(unint64_t)a4;
- (void)setBitsPerPixel:(int)a3;
- (void)setBufferCache:(id)a3;
- (void)setFileOpenCount:(int)a3;
- (void)setFileOpenLock:(os_unfair_lock_s)a3;
- (void)setFingerprint:(id)a3;
- (void)setFullMetadata:(BOOL)a3;
- (void)setHasMetadata:(BOOL)a3;
- (void)setHasThumbnail:(BOOL)a3;
- (void)setImageHeight:(int)a3;
- (void)setImageOrientation:(int)a3;
- (void)setImageWidth:(int)a3;
- (void)setPreviewThumbnail:(BOOL)a3;
- (void)setSizeAndOrientationFromImageProperties:(id)a3;
- (void)setSmallThumbnail:(BOOL)a3;
- (void)setSubImages:(id)a3;
- (void)setThumbHeight:(int)a3;
- (void)setThumbOffset:(int)a3;
- (void)setThumbSize:(int)a3;
- (void)setThumbWidth:(int)a3;
- (void)setUTI:(id)a3;
- (void)setUpdatedBasicMetadata:(BOOL)a3;
- (void)setUpdatedExpensiveMetadata:(BOOL)a3;
- (void)thumbnailDataWithOptions:(id)a3 reply:(id)a4;
- (void)updateBasicMetadata;
@end

@implementation MSCameraFile

- (MSCameraFile)initWithFSURL:(id)a3 name:(id)a4 parent:(id)a5 device:(id)a6 fullMetadata:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  v31.receiver = self;
  v31.super_class = (Class)MSCameraFile;
  v13 = [(MSCameraItem *)&v31 initWithFSURL:a3 name:a4 parent:a5 device:v12];
  v14 = v13;
  if (!v13) {
    goto LABEL_18;
  }
  v13->_fileOpenLock._os_unfair_lock_opaque = 0;
  atomic_store(0, (unsigned int *)&v13->_fileOpenCount);
  v13->_fullMetadata = 1;
  v15 = [(MSCameraFile *)v13 name];
  v16 = [v15 pathExtension];
  v17 = [v16 lowercaseString];

  if (v17)
  {
    v18 = +[UTType typeWithFilenameExtension:v17];
  }
  else
  {
    v18 = 0;
  }
  if (![(MSCameraFile *)v14 rawImageSupported]
    && ![(MSCameraFile *)v14 imageIOSupported])
  {
    if (v18)
    {
      if ([v18 conformsToType:UTTypeMovie])
      {
        v25 = [UTTypeMovie identifier];
        [(MSCameraFile *)v14 setUTI:v25];

        [(MSCameraFile *)v14 setHasThumbnail:1];
        [(MSCameraFile *)v14 setHasMetadata:1];
        [(MSCameraFile *)v14 setFullMetadata:v7];
        uint64_t v20 = 1836019574;
        goto LABEL_8;
      }
      if ([v18 conformsToType:UTTypeAudio])
      {
        v27 = [UTTypeAudio identifier];
        [(MSCameraFile *)v14 setUTI:v27];

        uint64_t v20 = 1635083375;
        goto LABEL_8;
      }
    }
    v28 = [UTTypeData identifier];
    [(MSCameraFile *)v14 setUTI:v28];

    uint64_t v20 = 1869899877;
    goto LABEL_8;
  }
  v19 = [UTTypeImage identifier];
  [(MSCameraFile *)v14 setUTI:v19];

  [(MSCameraFile *)v14 setHasMetadata:1];
  [(MSCameraFile *)v14 setHasThumbnail:1];
  uint64_t v20 = 1768776039;
LABEL_8:
  [(MSCameraItem *)v14 setType:v20];
  v21 = +[NSMutableDictionary dictionary];
  [(MSCameraFile *)v14 setSubImages:v21];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100016E14;
  v29[3] = &unk_100034A78;
  v22 = v14;
  v30 = v22;
  v23 = objc_retainBlock(v29);
  if ([(MSCameraFile *)v22 hasMetadata])
  {
    if ([(MSCameraFile *)v22 rawImageSupported])
    {
      if ([v12 prioritizeSpeed])
      {
        v24 = +[NSBlockOperation blockOperationWithBlock:v23];
        [v12 addInitiatedOperation:v24];
      }
      else
      {
        ((void (*)(void *))v23[2])(v23);
      }
    }
    else
    {
      [(MSCameraFile *)v22 updateBasicMetadata];
    }
  }

LABEL_18:
  return v14;
}

- (id)initForReadingOnlyWithName:(id)a3 parent:(id)a4 device:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)MSCameraFile;
  v5 = [(MSCameraItem *)&v13 initWithName:a3 parent:a4 device:a5];
  v6 = v5;
  if (v5)
  {
    memset(&v12.st_size, 0, 48);
    id v7 = [(MSCameraItem *)v5 path];
    int v8 = lstat((const char *)[v7 UTF8String], &v12);

    if (v8)
    {
      v9 = v6;
      v6 = 0;
    }
    else
    {
      off_t st_size = v12.st_size;
      v9 = [(MSCameraItem *)v6 info];
      [v9 setObjectCompressedSize:st_size];
    }
  }
  return v6;
}

- (id)mediaItemType
{
  return @"file";
}

- (unsigned)thumbSize
{
  v2 = [(MSCameraItem *)self info];
  unsigned int v3 = [v2 thumbCompressedSize];

  return v3;
}

- (void)setThumbSize:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MSCameraItem *)self info];
  [v4 setThumbCompressedSize:v3];
}

- (unsigned)thumbOffset
{
  v2 = [(MSCameraItem *)self info];
  unsigned int v3 = [v2 thumbOffset];

  return v3;
}

- (void)setHasThumbnail:(BOOL)a3
{
  self->_hasThumbnail = a3;
  if (a3)
  {
    if ([(MSCameraFile *)self thumbSize]) {
      return;
    }
    *(void *)&a3 = 1;
  }

  [(MSCameraFile *)self setThumbSize:a3];
}

- (BOOL)hasThumbnail
{
  return self->_hasThumbnail;
}

- (void)setThumbOffset:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MSCameraItem *)self info];
  [v4 setThumbOffset:v3];
}

- (int)thumbWidth
{
  v2 = [(MSCameraItem *)self info];
  int v3 = [v2 thumbPixWidth];

  return v3;
}

- (void)setThumbWidth:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MSCameraItem *)self info];
  [v4 setThumbPixWidth:v3];
}

- (unsigned)thumbHeight
{
  v2 = [(MSCameraItem *)self info];
  unsigned int v3 = [v2 thumbPixHeight];

  return v3;
}

- (void)setThumbHeight:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MSCameraItem *)self info];
  [v4 setThumbPixHeight:v3];
}

- (void)setImageHeight:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MSCameraItem *)self info];
  [v4 setImagePixHeight:v3];
}

- (void)setImageWidth:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MSCameraItem *)self info];
  [v4 setImagePixWidth:v3];
}

- (void)setImageOrientation:(int)a3
{
  unsigned __int16 v3 = a3;
  id v4 = [(MSCameraItem *)self info];
  [v4 setImageOrientation:v3];
}

- (int)imageHeight
{
  v2 = [(MSCameraItem *)self info];
  int v3 = [v2 imagePixHeight];

  return v3;
}

- (int)imageWidth
{
  v2 = [(MSCameraItem *)self info];
  int v3 = [v2 imagePixWidth];

  return v3;
}

- (int)imageOrientation
{
  v2 = [(MSCameraItem *)self info];
  int v3 = [v2 imageOrientation];

  return v3;
}

- (id)name
{
  v2 = [(MSCameraItem *)self info];
  int v3 = [v2 filename];

  return v3;
}

- (unint64_t)size
{
  v2 = [(MSCameraItem *)self info];
  id v3 = [v2 objectCompressedSize];

  return (unint64_t)v3;
}

- (void)decrementStreamCount
{
}

- (void)incrementStreamCount
{
}

- (void)clearDevice
{
}

- (void)dealloc
{
  [(MSCameraItem *)self cancelSource];
  [(MSCameraFile *)self clearDevice];
  bufferCache = self->_bufferCache;
  self->_bufferCache = 0;

  v4.receiver = self;
  v4.super_class = (Class)MSCameraFile;
  [(MSCameraItem *)&v4 dealloc];
}

- (BOOL)openStream
{
  id v3 = [(MSCameraItem *)self device];
  unsigned __int8 v4 = [v3 beingEjected];

  if (v4) {
    return 0;
  }
  p_fileOpenLock = &self->_fileOpenLock;
  os_unfair_lock_lock(&self->_fileOpenLock);
  id v7 = [(MSCameraItem *)self path];
  int v8 = (const char *)[v7 UTF8String];

  uint64_t v9 = [(MSCameraItem *)self fd];
  if (v9 || (uint64_t v9 = open(v8, 0, v9, 0), v9))
  {
    [(MSCameraItem *)self setFd:v9];
    [(MSCameraFile *)self incrementStreamCount];
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }
  os_unfair_lock_unlock(p_fileOpenLock);
  return v5;
}

- (BOOL)closeStream
{
  id v3 = [(MSCameraItem *)self device];
  unsigned __int8 v4 = [v3 beingEjected];

  if (v4) {
    return 0;
  }
  p_fileOpenLock = &self->_fileOpenLock;
  os_unfair_lock_lock(&self->_fileOpenLock);
  [(MSCameraFile *)self decrementStreamCount];
  unsigned int v7 = atomic_load((unsigned int *)&self->_fileOpenCount);
  if (v7 || ![(MSCameraItem *)self fd])
  {
    BOOL v5 = 0;
  }
  else
  {
    close([(MSCameraItem *)self fd]);
    [(MSCameraItem *)self setFd:0];
    BOOL v5 = 1;
  }
  os_unfair_lock_unlock(p_fileOpenLock);
  return v5;
}

- (void)readMap:(unint64_t)a3 offset:(unint64_t)a4
{
  result = mmap(0, a3, 1, 16385, [(MSCameraItem *)self fd], a4);
  if (result == (void *)-1) {
    return 0;
  }
  return result;
}

- (BOOL)closeMap:(char *)a3 size:(unint64_t)a4
{
  v6 = [(MSCameraItem *)self device];
  unsigned __int8 v7 = [v6 beingEjected];
  if (a3) {
    char v8 = v7;
  }
  else {
    char v8 = 1;
  }

  if ((v8 & 1) == 0) {
    munmap(a3, a4);
  }
  return v8 ^ 1;
}

- (void)createBufferCache
{
  bufferCache = self->_bufferCache;
  if (bufferCache)
  {
    [(ICBufferCache *)bufferCache stopReading];
    unsigned __int8 v4 = self->_bufferCache;
    self->_bufferCache = 0;
  }
  BOOL v5 = [[ICBufferCache alloc] initWithFile:self];
  v6 = self->_bufferCache;
  self->_bufferCache = v5;

  unsigned __int8 v7 = self->_bufferCache;
  if (v7)
  {
    [(ICBufferCache *)v7 startReading];
  }
}

- (void)destroyBufferCache
{
  bufferCache = self->_bufferCache;
  if (bufferCache)
  {
    [(ICBufferCache *)bufferCache stopReading];
    unsigned __int8 v4 = self->_bufferCache;
    self->_bufferCache = 0;
  }
}

- (unint64_t)readStream:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5
{
  uint64_t v9 = [(MSCameraItem *)self device];
  unsigned __int8 v10 = [v9 beingEjected];

  if (v10) {
    return 0;
  }
  unsigned int v11 = [(MSCameraItem *)self fd];
  if (!v11) {
    return 0;
  }
  int v12 = v11;
  if (a5 + a4 > [(MSCameraFile *)self size]) {
    a4 = [(MSCameraFile *)self size] - a5;
  }

  return pread(v12, a3, a4, a5);
}

- (id)thumbnailDataUsingSidecarFiles
{
  id v3 = [(MSCameraFile *)self name];
  unsigned __int8 v4 = [v3 stringByDeletingPathExtension];
  BOOL v5 = [v4 stringByAppendingPathExtension:@"THM"];

  v6 = [MSCameraFile alloc];
  unsigned __int8 v7 = [(MSCameraItem *)self parent];
  char v8 = [(MSCameraItem *)self device];
  id v9 = [(MSCameraFile *)v6 initForReadingOnlyWithName:v5 parent:v7 device:v8];

  if (v9 && [v9 openStream])
  {
    id v10 = [v9 size];
    id v11 = [objc_alloc((Class)NSMutableData) initWithLength:v10];
    id v12 = objc_msgSend(v9, "readStream:size:offset:", objc_msgSend(v11, "mutableBytes"), v10, 0);
    id v13 = 0;
    if (v11 && v12 == v10) {
      id v13 = v11;
    }
    [v9 closeStream];

    if (v13)
    {
      __ICOSLogCreate();
      id v14 = [(MSCameraFile *)self name];
      v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"  ✓             [%12s] thumbnail using sidecar file", [v14 UTF8String]);

      uint64_t v16 = __ICLogTypeEnabled(2);
      v17 = _gICOSLog;
      if (v16)
      {
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v20 = v15;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEBUG))
      {
        sub_100024EDC((uint64_t)v15, v17);
      }
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)createThumbnailUsingOffsets:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 objectForKeyedSubscript:@"JPEGLength"];
  id v6 = [v5 intValue];

  unsigned __int8 v7 = [v4 objectForKeyedSubscript:@"JPEGOffset"];

  id v8 = [v7 intValue];
  dispatch_data_t v9 = 0;
  if (v6 && v8)
  {
    __ICOSLogCreate();
    id v10 = [(MSCameraFile *)self name];
    if ((unint64_t)[v10 length] >= 0x15)
    {
      id v11 = objc_msgSend(v10, "substringWithRange:", 0, 18);
      uint64_t v12 = [v11 stringByAppendingString:@".."];

      id v10 = (void *)v12;
    }
    id v13 = +[NSString stringWithFormat:@"[subImage] %10s: [%7db @ %9d]", "using", v6, v8];
    id v14 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v10;
      uint64_t v16 = v14;
      *(_DWORD *)buf = 136446466;
      id v37 = [v15 UTF8String];
      __int16 v38 = 2114;
      v39 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    if (![(MSCameraFile *)self openStream])
    {
      dispatch_data_t v9 = 0;
      goto LABEL_25;
    }
    if ([(MSCameraItem *)self fileSize] >= (v8 + v6))
    {
      v17 = (unsigned __int8 *)mmap(0, v6, 3, 4097, -1, 0);
      size_t v18 = [(MSCameraFile *)self readStream:v17 size:v6 offset:v8];
      dispatch_data_t v9 = 0;
      if (![(MSCameraFile *)self validateReturnDataSize:v18 forRequestSize:v6])
      {
LABEL_24:
        [(MSCameraFile *)self closeStream];
        goto LABEL_25;
      }
      if (*v17 == 255 && v17[1] == 216)
      {
        __ICOSLogCreate();
        v19 = [(MSCameraFile *)self name];
        if ((unint64_t)[v19 length] >= 0x15)
        {
          uint64_t v20 = objc_msgSend(v19, "substringWithRange:", 0, 18);
          uint64_t v21 = [v20 stringByAppendingString:@".."];

          v19 = (void *)v21;
        }
        v22 = +[NSString stringWithFormat:@"[subImage] %10s: [%7db @ %9d]", "validated", v6, v8];
        v23 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = v19;
          v25 = v23;
          id v26 = [v24 UTF8String];
          *(_DWORD *)buf = 136446466;
          id v37 = v26;
          __int16 v38 = 2114;
          v39 = v22;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
        dispatch_data_t v9 = dispatch_data_create(v17, v18, 0, _dispatch_data_destructor_munmap);
        goto LABEL_24;
      }
      __ICOSLogCreate();
      v27 = [(MSCameraFile *)self name];
      if ((unint64_t)[v27 length] >= 0x15)
      {
        v28 = objc_msgSend(v27, "substringWithRange:", 0, 18);
        uint64_t v29 = [v28 stringByAppendingString:@".."];

        v27 = (void *)v29;
      }
      v30 = +[NSString stringWithFormat:@"[subImage] %10s: [%7db @ %9d]", "invalid", v6, v8];
      objc_super v31 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = v27;
        v33 = v31;
        id v34 = [v32 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v37 = v34;
        __int16 v38 = 2114;
        v39 = v30;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    dispatch_data_t v9 = 0;
    goto LABEL_24;
  }
LABEL_25:

  return v9;
}

- (void)rawImageMinimumProperties
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  dword_10004484C = 0;
  *(float *)&dword_10004484C = (float)mach_absolute_time();
  v47 = +[NSMutableDictionary dictionary];
  id v3 = [(MSCameraItem *)self path];
  CFURLRef v4 = +[NSURL fileURLWithPath:v3];

  BOOL v5 = CGImageSourceCreateWithURL(v4, 0);
  CFDictionaryRef v6 = CGImageSourceCopyProperties(v5, 0);
  CFDictionaryRef v7 = v6;
  if (v6)
  {
    id v8 = [(__CFDictionary *)v6 objectForKeyedSubscript:@"{raw}"];
    dispatch_data_t v9 = [v8 objectForKeyedSubscript:@"Thumbnails"];

    id v10 = [(__CFDictionary *)v7 objectForKeyedSubscript:@"{raw}"];
    id v11 = [v10 objectForKeyedSubscript:@"CropSize"];

    uint64_t v12 = [(__CFDictionary *)v7 objectForKeyedSubscript:@"{raw}"];
    id v13 = [v12 objectForKeyedSubscript:@"Orientation"];

    if (![(MSCameraFile *)self imageHeight] && ![(MSCameraFile *)self imageWidth] && v11)
    {
      id v14 = [v11 objectForKeyedSubscript:@"Height"];
      -[MSCameraFile setImageHeight:](self, "setImageHeight:", [v14 intValue]);

      [v11 objectForKeyedSubscript:@"Width"];
      v45 = v13;
      uint64_t v16 = v15 = v11;
      -[MSCameraFile setImageWidth:](self, "setImageWidth:", [v16 intValue]);

      id v11 = v15;
      v17 = [v15 objectForKeyedSubscript:@"Width"];
      [v47 setObject:v17 forKeyedSubscript:@"PixelWidth"];

      size_t v18 = [v15 objectForKeyedSubscript:@"Height"];
      id v13 = v45;
      [v47 setObject:v18 forKeyedSubscript:@"PixelHeight"];
    }
    if (![(MSCameraFile *)self imageOrientation] && v13)
    {
      -[MSCameraFile setImageOrientation:](self, "setImageOrientation:", [v13 intValue]);
      [v47 setObject:v13 forKeyedSubscript:@"Orientation"];
    }
    if (v9)
    {
      CFURLRef v44 = v4;
      v46 = v13;
      v42 = v5;
      CFDictionaryRef v43 = v7;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v19 = v9;
      id v20 = [v19 countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v50;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v50 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v49 + 1) + 8 * i);
            uint64_t v48 = 0;
            v25 = [(MSCameraFile *)self rawImageValidateSubImage:v24 error:&v48];
            id v26 = v25;
            if (v25)
            {
              v27 = [v25 objectForKeyedSubscript:@"JPEGOffset"];

              if (v27)
              {
                if (![(MSCameraFile *)self imageOrientation])
                {
                  v28 = [v26 objectForKeyedSubscript:@"Orientation"];

                  if (v28)
                  {
                    uint64_t v29 = [v26 objectForKeyedSubscript:@"Orientation"];
                    -[MSCameraFile setImageOrientation:](self, "setImageOrientation:", [v29 intValue]);

                    v30 = [v26 objectForKeyedSubscript:@"Orientation"];
                    [v47 setObject:v30 forKeyedSubscript:kCGImagePropertyTIFFOrientation];
                  }
                }
                [(MSCameraFile *)self addSubImageDict:v26];
              }
            }
          }
          id v21 = [v19 countByEnumeratingWithState:&v49 objects:v58 count:16];
        }
        while (v21);
      }

      CFDictionaryRef v7 = v43;
      CFURLRef v4 = v44;
      BOOL v5 = v42;
      id v13 = v46;
    }
  }
  [(MSCameraFile *)self setSizeAndOrientationFromImageProperties:v47];
  if (v5) {
    CFRelease(v5);
  }
  float v31 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10004484C) * (float)info.numer)
              / (float)info.denom)
      / 1000000.0;
  __ICOSLogCreate();
  id v32 = [(MSCameraFile *)self name];
  if ((unint64_t)[v32 length] >= 0x15)
  {
    v33 = objc_msgSend(v32, "substringWithRange:", 0, 18);
    uint64_t v34 = [v33 stringByAppendingString:@".."];

    id v32 = (void *)v34;
  }
  if (v31 <= 300.0) {
    CFStringRef v35 = @"𝚫";
  }
  else {
    CFStringRef v35 = @"⊗";
  }
  v36 = +[NSString stringWithFormat:@"rawImageMinimumProperties"];
  id v37 = +[NSString stringWithFormat:@"%@[%4.0f ms] %@", v35, v31, v36];

  __int16 v38 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v39 = v32;
    v40 = v38;
    id v41 = [v39 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v55 = v41;
    __int16 v56 = 2114;
    v57 = v37;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  dword_100044848 = LODWORD(v31);
}

- (BOOL)hasValidInformation:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 caseInsensitiveCompare:@"wav"]
    && [v3 caseInsensitiveCompare:@"aif"]
    && [v3 caseInsensitiveCompare:@"3fr"]
    && [v3 caseInsensitiveCompare:@"erf"]
    && [v3 caseInsensitiveCompare:@"iiq"]
    && [v3 caseInsensitiveCompare:@"raw"]
    && [v3 caseInsensitiveCompare:@"tif"]
    && [v3 caseInsensitiveCompare:@"fff"]
    && [v3 caseInsensitiveCompare:@"dng"];

  return v4;
}

- (void)thumbnailDataWithOptions:(id)a3 reply:(id)a4
{
  CFDictionaryRef v6 = (void (**)(id, void *))a4;
  id v7 = a3;
  id v8 = [(MSCameraItem *)self device];
  [v8 holdPowerAssertion];

  dispatch_data_t v9 = [v7 objectForKeyedSubscript:@"kCGImageSourceThumbnailMaxPixelSize"];

  id v10 = +[NSMutableDictionary dictionary];
  [(MSCameraFile *)self updateBasicMetadata];
  id v11 = [(MSCameraItem *)self metadata];

  if (!v11)
  {
    uint64_t v12 = [(MSCameraFile *)self metadataDict];
    id v13 = [v12 mutableCopy];

    if (v13) {
      [(MSCameraItem *)self setMetadata:v13];
    }
  }
  id v14 = [(MSCameraItem *)self metadata];

  if (v14)
  {
    id v15 = [(MSCameraItem *)self metadata];
    [v10 setObject:v15 forKeyedSubscript:@"metadata"];
  }
  if ([(MSCameraFile *)self imageOrientation])
  {
    uint64_t v16 = +[NSNumber numberWithInt:[(MSCameraFile *)self imageOrientation]];
    if (v16)
    {
      v17 = (void *)v16;
      size_t v18 = [(MSCameraItem *)self metadata];
      id v19 = [v18 objectForKeyedSubscript:kCGImagePropertyOrientation];

      if (v19)
      {
        [v10 setObject:v19 forKeyedSubscript:kCGImagePropertyOrientation];
      }
    }
  }
  char v22 = 0;
  id v20 = -[MSCameraFile thumbnailDataForMaxPixelSize:rotated:](self, "thumbnailDataForMaxPixelSize:rotated:", [v9 unsignedIntegerValue], &v22);
  if (v20) {
    [v10 setObject:v20 forKeyedSubscript:@"thumb"];
  }
  if (v22) {
    [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:@"ICThumbnailRotated"];
  }
  v6[2](v6, v10);
  id v21 = [(MSCameraItem *)self device];
  [v21 releasePowerAssertion];
}

- (void)readDataWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v55 = a4;
  id v7 = [(MSCameraItem *)self device];
  [v7 holdPowerAssertion];

  id v8 = +[NSMutableDictionary dictionary];
  int64_t v9 = [(MSCameraFile *)self size];
  id v10 = [v6 objectForKeyedSubscript:@"ICReadOffset"];
  if (v10)
  {
    id v11 = [v6 objectForKeyedSubscript:@"ICReadOffset"];
    id v12 = [v11 unsignedLongLongValue];
  }
  else
  {
    id v12 = 0;
  }

  id v13 = [v6 objectForKeyedSubscript:@"ICReadLength"];
  if (v13)
  {
    id v14 = [v6 objectForKeyedSubscript:@"ICReadLength"];
    int64_t v15 = (int64_t)[v14 unsignedLongLongValue];
  }
  else
  {
    int64_t v15 = [(MSCameraFile *)self size];
  }

  uint64_t v16 = [v6 objectForKeyedSubscript:@"ICReadBufferStreamOpen"];
  if (v16)
  {
    v17 = [v6 objectForKeyedSubscript:@"ICReadBufferStreamOpen"];
    unsigned int v18 = [v17 BOOLValue];
  }
  else
  {
    unsigned int v18 = 0;
  }

  uint64_t v19 = [v6 objectForKeyedSubscript:@"ICReadBufferStreamClose"];
  if (v19)
  {
    id v20 = (void *)v19;
    id v21 = [v6 objectForKeyedSubscript:@"ICReadBufferStreamClose"];
    unsigned int v22 = [v21 BOOLValue];

    if (v18)
    {
      char v23 = v22 ^ 1;
      goto LABEL_15;
    }
    if (v22)
    {
LABEL_22:
      __ICOSLogCreate();
      float v31 = [(MSCameraFile *)self name];
      if ((unint64_t)[v31 length] >= 0x15)
      {
        id v32 = objc_msgSend(v31, "substringWithRange:", 0, 18);
        uint64_t v33 = [v32 stringByAppendingString:@".."];

        float v31 = (void *)v33;
      }
      uint64_t v34 = +[NSString stringWithFormat:@"ICReadBufferStreamClose: %llu", [(MSCameraFile *)self size]];
      CFStringRef v35 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = v31;
        id v37 = v35;
        id v38 = [v36 UTF8String];
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = v38;
        __int16 v57 = 2114;
        v58 = v34;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      [(MSCameraFile *)self closeStream];
      [(MSCameraFile *)self destroyBufferCache];
LABEL_27:
      uint64_t v39 = 0;
LABEL_50:
      uint64_t v48 = (void (**)(void, void))v55;
      goto LABEL_51;
    }
  }
  else if (v18)
  {
    char v23 = 1;
LABEL_15:
    __ICOSLogCreate();
    uint64_t v24 = [(MSCameraFile *)self name];
    if ((unint64_t)[v24 length] >= 0x15)
    {
      v25 = objc_msgSend(v24, "substringWithRange:", 0, 18);
      uint64_t v26 = [v25 stringByAppendingString:@".."];

      uint64_t v24 = (void *)v26;
    }
    v27 = +[NSString stringWithFormat:@"ICReadBufferStreamOpen: %llu", [(MSCameraFile *)self size]];
    v28 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = v24;
      v30 = v28;
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = [v29 UTF8String];
      __int16 v57 = 2114;
      v58 = v27;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    [(MSCameraFile *)self openStream];
    [(MSCameraFile *)self createBufferCache];
    if (v23) {
      goto LABEL_27;
    }
    goto LABEL_22;
  }
  BOOL v42 = v15 >= 1 && (uint64_t)v12 <= v9 && (uint64_t)v12 >= 0 && (uint64_t)v12 + v15 <= v9;
  uint64_t v43 = -21449;
  if (v42) {
    uint64_t v43 = 0;
  }
  if (v15 <= 52428800) {
    uint64_t v39 = v43;
  }
  else {
    uint64_t v39 = -21446;
  }
  *(void *)buf = 0;
  if (!v15 || v39 || ![(MSCameraFile *)self openStream])
  {
    [v8 addEntriesFromDictionary:v6];
    goto LABEL_50;
  }
  CFURLRef v44 = [(MSCameraFile *)self bufferCache];

  if (v44)
  {
    id v45 = [(MSCameraFile *)self bufferCache];
    id v46 = [v45 consumeBufferAtOffset:v12 sized:buf];

    size_t v47 = *(void *)buf;
    if (*(void *)buf > 0x200000uLL)
    {
      size_t v47 = 0;
      *(void *)buf = 0;
    }
  }
  else
  {
    id v46 = mmap(0, v15, 3, 4097, -1, 0);
    size_t v47 = [(MSCameraFile *)self readStream:v46 size:v15 offset:v12];
    *(void *)buf = v47;
  }
  uint64_t v48 = (void (**)(void, void))v55;
  dispatch_data_t v50 = dispatch_data_create(v46, v47, 0, _dispatch_data_destructor_munmap);
  v54 = [(MSCameraFile *)self bufferCache];
  [v54 setConsumedOffset:v12];

  [(MSCameraFile *)self closeStream];
  [v8 addEntriesFromDictionary:v6];
  if (v50)
  {
    [v8 setObject:v50 forKeyedSubscript:@"ICReadData"];
    uint64_t v39 = 0;
    goto LABEL_52;
  }
  uint64_t v39 = 0;
LABEL_51:
  long long v49 = +[NSData data];
  [v8 setObject:v49 forKeyedSubscript:@"ICReadData"];

  dispatch_data_t v50 = 0;
LABEL_52:
  [v8 setObject:&off_100039230 forKeyedSubscript:@"ICBufferOffset"];
  long long v51 = +[NSNumber numberWithUnsignedInteger:[v50 length]];
  [v8 setObject:v51 forKeyedSubscript:@"ICBytesRead"];

  long long v52 = +[NSNumber numberWithInteger:v39];
  [v8 setObject:v52 forKeyedSubscript:@"errCode"];

  ((void (**)(void, void *))v48)[2](v48, v8);
  v53 = [(MSCameraItem *)self device];
  [v53 releasePowerAssertion];
}

- (void)metadataWithOptions:(id)a3 reply:(id)a4
{
  BOOL v5 = (void (**)(id, void *))a4;
  id v6 = [(MSCameraItem *)self device];
  [v6 holdPowerAssertion];

  [(MSCameraFile *)self updateBasicMetadata];
  id v7 = [(MSCameraItem *)self metadata];

  if (!v7)
  {
    id v8 = [(MSCameraFile *)self metadataDict];
    id v9 = [v8 mutableCopy];

    if (v9) {
      [(MSCameraItem *)self setMetadata:v9];
    }
  }
  id v10 = [(MSCameraItem *)self metadata];
  v5[2](v5, v10);

  id v11 = [(MSCameraItem *)self device];
  [v11 releasePowerAssertion];
}

- (void)updateBasicMetadata
{
  if (![(MSCameraFile *)self updatedBasicMetadata])
  {
    id v3 = [(MSCameraFile *)self name];
    BOOL v4 = [v3 pathExtension];
    id v12 = [v4 lowercaseString];

    if ([(MSCameraItem *)self type] == 1768776039)
    {
      if ([(MSCameraFile *)self rawImageSupported])
      {
        [(MSCameraFile *)self setHasThumbnail:1];
        [(MSCameraFile *)self setUpdatedBasicMetadata:1];
      }
      else if (([v12 isEqualToString:@"jpg"] & 1) != 0 {
             || ([v12 isEqualToString:@"heic"] & 1) != 0
      }
             || [v12 isEqualToString:@"jpeg"])
      {
        id v8 = [(MSCameraItem *)self path];
        [v8 UTF8String];
        id v9 = (void *)CGCopyBasicPropertiesOfImageAtPath();

        if (v9 && (unint64_t)[v9 count] >= 3)
        {
          [(MSCameraFile *)self setSizeAndOrientationFromImageProperties:v9];
          [(MSCameraFile *)self setHasThumbnail:[(MSCameraFile *)self thumbSize] != 0];
        }
        else
        {
          id v10 = [(MSCameraFile *)self metadataDict];
        }
      }
      else
      {
        id v11 = [(MSCameraFile *)self metadataDict];
        [(MSCameraFile *)self setHasThumbnail:1];
      }
    }
    else if ([(MSCameraItem *)self type] == 1836019574)
    {
      id v5 = [(MSCameraFile *)self metadataDict];
      id v6 = [(MSCameraItem *)self metadata];
      id v7 = [v6 mutableCopy];

      [(MSCameraFile *)self setSizeAndOrientationFromImageProperties:v7];
      [(MSCameraItem *)self setMetadata:v7];
      [(MSCameraFile *)self setHasThumbnail:1];
    }
    [(MSCameraFile *)self setUpdatedBasicMetadata:1];
  }
}

- (BOOL)imageIOSupported
{
  if (qword_100044808 != -1) {
    dispatch_once(&qword_100044808, &stru_100034BF0);
  }
  id v3 = [(MSCameraFile *)self name];
  BOOL v4 = [v3 pathExtension];
  id v5 = [v4 lowercaseString];

  LOBYTE(v3) = [(id)qword_100044838 containsObject:v5];
  return (char)v3;
}

- (BOOL)rawImageSupported
{
  if (qword_100044810 != -1) {
    dispatch_once(&qword_100044810, &stru_100034C10);
  }
  id v3 = [(MSCameraFile *)self name];
  BOOL v4 = [v3 pathExtension];
  id v5 = [v4 lowercaseString];

  if ([(MSCameraFile *)self hasValidInformation:v5]) {
    unsigned __int8 v6 = [(id)qword_100044840 containsObject:v5];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)setSizeAndOrientationFromImageProperties:(id)a3
{
  id v13 = 0;
  id v14 = 0;
  id v12 = 0;
  sub_10001317C(a3, &v14, &v13, &v12);
  id v10 = v14;
  id v4 = v13;
  id v5 = v12;
  -[MSCameraFile setImageOrientation:](self, "setImageOrientation:", [v10 intValue]);
  int v6 = [(MSCameraFile *)self imageOrientation];
  BOOL v7 = v6 <= 4;
  if (v6 <= 4) {
    id v8 = v4;
  }
  else {
    id v8 = v5;
  }
  if (v7) {
    id v9 = v5;
  }
  else {
    id v9 = v4;
  }
  -[MSCameraFile setImageWidth:](self, "setImageWidth:", objc_msgSend(v8, "intValue", v10));
  -[MSCameraFile setImageHeight:](self, "setImageHeight:", [v9 intValue]);
}

- (BOOL)processMetadata:(id)a3
{
  id v4 = a3;
  if ([(MSCameraFile *)self updatedExpensiveMetadata])
  {
    BOOL v5 = 1;
    goto LABEL_56;
  }
  id v6 = [v4 mutableCopy];
  BOOL v5 = v4 != 0;
  if (!v4)
  {
    __ICOSLogCreate();
    id v12 = [(MSCameraFile *)self name];
    if ((unint64_t)[v12 length] >= 0x15)
    {
      v17 = objc_msgSend(v12, "substringWithRange:", 0, 18);
      uint64_t v18 = [v17 stringByAppendingString:@".."];

      id v12 = (id)v18;
    }
    id v13 = +[NSString stringWithFormat:@"Missing Metadata"];
    uint64_t v19 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v12;
      id v20 = v19;
      *(_DWORD *)buf = 136446466;
      id v46 = [v12 UTF8String];
      __int16 v47 = 2114;
      uint64_t v48 = v13;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    goto LABEL_53;
  }
  [(MSCameraFile *)self setSizeAndOrientationFromImageProperties:v4];
  BOOL v7 = +[NSNumber numberWithInt:[(MSCameraFile *)self imageHeight]];
  [v6 setObject:v7 forKeyedSubscript:kCGImagePropertyPixelHeight];

  id v8 = +[NSNumber numberWithInt:[(MSCameraFile *)self imageWidth]];
  [v6 setObject:v8 forKeyedSubscript:kCGImagePropertyPixelWidth];

  id v9 = +[NSNumber numberWithInt:[(MSCameraFile *)self imageOrientation]];
  [v6 setObject:v9 forKeyedSubscript:kCGImagePropertyOrientation];

  id v10 = [v6 objectForKeyedSubscript:kCGImagePropertyExifPixelXDimension];

  if (v10) {
    [v6 removeObjectForKey:kCGImagePropertyExifPixelXDimension];
  }
  id v11 = [v6 objectForKeyedSubscript:kCGImagePropertyExifPixelYDimension];

  if (v11) {
    [v6 removeObjectForKey:kCGImagePropertyExifPixelYDimension];
  }
  id v12 = [v4 objectForKeyedSubscript:kCGImagePropertyExifDictionary];
  id v13 = [v4 objectForKeyedSubscript:kCGImagePropertyTIFFDictionary];
  if (v12)
  {
    id v14 = [v12 objectForKeyedSubscript:kCGImagePropertyExifDateTimeOriginal];
    if (v14)
    {
LABEL_20:
      [(MSCameraItem *)self setExifCreationDateTime:v14];
LABEL_21:
      id v21 = [v12 objectForKeyedSubscript:kCGImagePropertyExifDateTimeDigitized];

      if (v21)
      {
        [(MSCameraItem *)self setExifModificationDateTime:v21];
        goto LABEL_31;
      }
      goto LABEL_23;
    }
  }
  if (v13)
  {
    CFStringRef v15 = kCGImagePropertyTIFFDateTime;
    uint64_t v16 = [v13 objectForKeyedSubscript:kCGImagePropertyTIFFDateTime];
    if (v16)
    {
      id v14 = (void *)v16;
      [(MSCameraItem *)self setExifCreationDateTime:v16];
      if (!v12) {
        goto LABEL_25;
      }
      goto LABEL_21;
    }
  }
  if (v12)
  {
    id v14 = [v12 objectForKeyedSubscript:kCGImagePropertyTIFFDateTime];
    if (!v14) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_23:
  if (!v13) {
    goto LABEL_28;
  }
  id v14 = 0;
  CFStringRef v15 = kCGImagePropertyTIFFDateTime;
LABEL_25:
  id v21 = [v13 objectForKeyedSubscript:v15];

  if (v21)
  {
    [(MSCameraItem *)self setExifModificationDateTime:v21];
    if (!v12) {
      goto LABEL_44;
    }
    goto LABEL_31;
  }
LABEL_28:
  if (!v12)
  {
    id v21 = 0;
    goto LABEL_44;
  }
  id v21 = [v12 objectForKeyedSubscript:kCGImagePropertyTIFFDateTime];
  if (v21) {
    [(MSCameraItem *)self setExifCreationDateTime:v21];
  }
LABEL_31:
  unsigned int v22 = [v12 objectForKeyedSubscript:@"ThumbnailOffset"];
  id v23 = [v22 intValue];
  if (v23)
  {
    id v24 = v23;
    v25 = [v12 objectForKeyedSubscript:@"ThumbnailSize"];
    id v26 = [v25 intValue];

    if (v26) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  v27 = [v12 objectForKeyedSubscript:@"JPEGOffset"];
  id v28 = [v27 intValue];
  if (!v28)
  {
LABEL_42:

    goto LABEL_44;
  }
  id v24 = v28;
  id v29 = [v12 objectForKeyedSubscript:@"JPEGLength"];
  id v26 = [v29 intValue];

  if (v26)
  {
LABEL_37:
    [(MSCameraFile *)self setThumbOffset:v24];
    [(MSCameraFile *)self setThumbSize:v26];
    uint64_t v30 = [v12 objectForKeyedSubscript:@"ThumbnailWidth"];
    if (!v30) {
      goto LABEL_44;
    }
    float v31 = (void *)v30;
    id v32 = [v12 objectForKeyedSubscript:@"ThumbnailHeight"];

    if (!v32) {
      goto LABEL_44;
    }
    v27 = +[NSMutableDictionary dictionary];
    uint64_t v33 = +[NSNumber numberWithInt:v24];
    [v27 setObject:v33 forKeyedSubscript:@"JPEGOffset"];

    uint64_t v34 = +[NSNumber numberWithInt:v26];
    [v27 setObject:v34 forKeyedSubscript:@"JPEGLength"];

    CFStringRef v35 = [v12 objectForKeyedSubscript:@"ThumbnailWidth"];
    [v27 setObject:v35 forKeyedSubscript:@"ImageWidth"];

    id v36 = [v12 objectForKeyedSubscript:@"ThumbnailHeight"];
    [v27 setObject:v36 forKeyedSubscript:@"ImageHeight"];

    uint64_t v44 = 0;
    id v37 = [(MSCameraFile *)self rawImageValidateSubImage:v27 error:&v44];
    if (v37) {
      [(MSCameraFile *)self addSubImageDict:v37];
    }

    goto LABEL_42;
  }
LABEL_44:
  id v38 = [(MSCameraItem *)self exifModificationDateTime];
  uint64_t v39 = v38;
  if (v38)
  {
    v40 = sub_1000132D4(v38);
    if (v40) {
      [(MSCameraItem *)self setExifModificationDate:v40];
    }
  }
  else
  {
    v40 = 0;
  }
  id v41 = [(MSCameraItem *)self exifCreationDateTime];

  if (v41)
  {
    uint64_t v42 = sub_1000132D4(v41);

    if (v42)
    {
      [(MSCameraItem *)self setExifCreationDate:v42];
      v40 = (void *)v42;
    }
    else
    {
      v40 = 0;
    }
  }
  [(MSCameraItem *)self setMetadata:v6];
  [(MSCameraFile *)self setUpdatedExpensiveMetadata:1];

  BOOL v5 = v4 != 0;
LABEL_53:

  if (![(MSCameraFile *)self updatedExpensiveMetadata])
  {
    [(MSCameraFile *)self setHasMetadata:0];
    [(MSCameraFile *)self setUpdatedExpensiveMetadata:1];
  }

LABEL_56:
  return v5;
}

- (id)rawImageValidateSubImage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    id v15 = 0;
    goto LABEL_27;
  }
  BOOL v7 = +[NSMutableDictionary dictionaryWithDictionary:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 objectForKeyedSubscript:@"ImageWidth"];
    int v10 = [v9 intValue];

    if (!v10)
    {
      id v11 = [v8 objectForKeyedSubscript:@"Width"];
      int v10 = [v11 intValue];

      if (v10)
      {
        id v12 = [v8 objectForKeyedSubscript:@"Width"];
        [v8 setObject:v12 forKeyedSubscript:@"ImageWidth"];
      }
    }
    id v13 = [v8 objectForKeyedSubscript:@"ImageHeight"];
    unsigned int v14 = [v13 intValue];

    if (v14)
    {
      if (!v10)
      {
LABEL_16:
        if (a4)
        {
          +[NSError errorWithDomain:@"com.apple.imagecapture" code:-2 userInfo:0];
          id v15 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v15 = 0;
        }
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v16 = [v8 objectForKeyedSubscript:@"Height"];
      unsigned int v17 = [v16 intValue];

      if (!v17) {
        goto LABEL_16;
      }
      uint64_t v18 = [v8 objectForKeyedSubscript:@"Height"];
      [v8 setObject:v18 forKeyedSubscript:@"ImageHeight"];

      if (!v10) {
        goto LABEL_16;
      }
    }
    uint64_t v19 = [v6 objectForKeyedSubscript:@"JPEGLength"];
    id v20 = [v19 intValue];

    id v21 = [v6 objectForKeyedSubscript:@"JPEGOffset"];
    id v22 = [v21 intValue];

    if (v20 && v22)
    {
      if (v10 == 160)
      {
        [(MSCameraFile *)self setThumbOffset:v22];
        [(MSCameraFile *)self setThumbSize:v20];
        [(MSCameraFile *)self setSmallThumbnail:1];
        [v8 setObject:@"smallThumbnail" forKeyedSubscript:@"imageType"];
      }
      else if (v10 < 1400)
      {
        if (v10 <= 1024)
        {
          [v8 setObject:@"ptpSubThumbnailImage" forKeyedSubscript:@"imageType"];
          [(MSCameraFile *)self setSmallThumbnail:1];
        }
      }
      else
      {
        [v8 setObject:@"previewImage" forKeyedSubscript:@"imageType"];
        [(MSCameraFile *)self setPreviewThumbnail:1];
      }
    }
    else if (a4)
    {
      *a4 = +[NSError errorWithDomain:@"com.apple.imagecapture" code:-4 userInfo:0];
    }
  }
  id v15 = v8;
LABEL_26:

LABEL_27:

  return v15;
}

- (NSMutableDictionary)subImages
{
  return self->_subImages;
}

- (void)addSubImageDict:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"ImageWidth"];
  if (v5)
  {
    id v6 = (void *)v5;
    subImages = self->_subImages;
    id v8 = [v4 objectForKeyedSubscript:@"ImageWidth"];
    id v9 = [(NSMutableDictionary *)subImages objectForKeyedSubscript:v8];

    if (!v9)
    {
      int v10 = self->_subImages;
      id v11 = [v4 objectForKeyedSubscript:@"ImageWidth"];
      [(NSMutableDictionary *)v10 setObject:v4 forKeyedSubscript:v11];

      __ICOSLogCreate();
      id v12 = [(MSCameraFile *)self name];
      if ((unint64_t)[v12 length] >= 0x15)
      {
        id v13 = objc_msgSend(v12, "substringWithRange:", 0, 18);
        uint64_t v14 = [v13 stringByAppendingString:@".."];

        id v12 = (void *)v14;
      }
      id v15 = [v4 objectForKeyedSubscript:@"ImageWidth"];
      id v16 = [v15 intValue];
      unsigned int v17 = [v4 objectForKeyedSubscript:@"ImageHeight"];
      uint64_t v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[subImage] %10s: [%7d x %9d]", "adding", v16, [v17 intValue]);

      uint64_t v19 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = v12;
        id v21 = v19;
        *(_DWORD *)buf = 136446466;
        id v23 = [v20 UTF8String];
        __int16 v24 = 2114;
        v25 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
  }
}

- (id)subImageDictForPixelWidth:(id)a3
{
  id v4 = a3;
  __ICOSLogCreate();
  uint64_t v5 = [(MSCameraFile *)self name];
  if ((unint64_t)[v5 length] >= 0x15)
  {
    id v6 = objc_msgSend(v5, "substringWithRange:", 0, 18);
    uint64_t v7 = [v6 stringByAppendingString:@".."];

    uint64_t v5 = (void *)v7;
  }
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[subImage] %10s: [%7d]", "searching", [v4 intValue]);
  id v9 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v5;
    id v11 = v9;
    *(_DWORD *)buf = 136446466;
    id v47 = [v10 UTF8String];
    __int16 v48 = 2114;
    long long v49 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v12 = [(NSMutableDictionary *)self->_subImages allKeys];
  id v13 = [v12 sortedArrayUsingSelector:"compare:"];

  id v14 = [v13 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v42;
LABEL_7:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v42 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void **)(*((void *)&v41 + 1) + 8 * v17);
      int v19 = [v4 intValue];
      if (v19 <= (int)[v18 intValue]) {
        break;
      }
      if (v15 == (id)++v17)
      {
        id v15 = [v13 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v15) {
          goto LABEL_7;
        }
        goto LABEL_13;
      }
    }
    id v20 = [(NSMutableDictionary *)self->_subImages objectForKeyedSubscript:v18];
    __ICOSLogCreate();
    id v21 = [(MSCameraFile *)self name];
    if ((unint64_t)[v21 length] >= 0x15)
    {
      id v22 = objc_msgSend(v21, "substringWithRange:", 0, 18);
      uint64_t v23 = [v22 stringByAppendingString:@".."];

      id v21 = (void *)v23;
    }
    __int16 v24 = [v20 objectForKeyedSubscript:@"ImageWidth"];
    id v25 = [v24 intValue];
    id v26 = [v20 objectForKeyedSubscript:@"ImageHeight"];
    v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[subImage] %10s: [%7d x %9d]", "found", v25, [v26 intValue]);

    id v28 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = v21;
      uint64_t v30 = v28;
      id v31 = [v29 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v47 = v31;
      __int16 v48 = 2114;
      long long v49 = v27;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    if (v20) {
      goto LABEL_24;
    }
  }
  else
  {
LABEL_13:
  }
  __ICOSLogCreate();
  id v32 = [(MSCameraFile *)self name];
  if ((unint64_t)[v32 length] >= 0x15)
  {
    uint64_t v33 = objc_msgSend(v32, "substringWithRange:", 0, 18);
    uint64_t v34 = [v33 stringByAppendingString:@".."];

    id v32 = (void *)v34;
  }
  CFStringRef v35 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[subImage] %10s: [%7d]", "none", [v4 intValue]);
  id v36 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v37 = v32;
    id v38 = v36;
    id v39 = [v37 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v47 = v39;
    __int16 v48 = 2114;
    long long v49 = v35;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  id v20 = 0;
LABEL_24:

  return v20;
}

- (NSMutableDictionary)metadataDict
{
  id v3 = [(MSCameraItem *)self metadata];
  if (v3 || ![(MSCameraFile *)self hasMetadata])
  {

    goto LABEL_8;
  }
  if ([(MSCameraFile *)self updatedExpensiveMetadata])
  {
LABEL_8:
    id v15 = [(MSCameraItem *)self metadata];
    goto LABEL_9;
  }
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  if ([(MSCameraItem *)self type] == 1768776039)
  {
    uint64_t v5 = [(MSCameraFile *)self name];
    id v6 = [v5 pathExtension];
    uint64_t TypeWithExtension = CGImageSourceGetTypeWithExtension();

    v41[0] = kCGImageSourceShouldCache;
    v41[1] = kCGImageSourceTypeIdentifierHint;
    v42[0] = &__kCFBooleanFalse;
    v42[1] = TypeWithExtension;
    CFDictionaryRef v8 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
    id v9 = [(MSCameraItem *)self path];
    CFURLRef v10 = +[NSURL fileURLWithPath:v9];

    id v11 = CGImageSourceCreateWithURL(v10, 0);
    *(void *)mach_timebase_info info = 0;
    mach_timebase_info((mach_timebase_info_t)info);
    dword_10004484C = 0;
    *(float *)&dword_10004484C = (float)mach_absolute_time();
    CFDictionaryRef v12 = CGImageSourceCopyPropertiesAtIndex(v11, 0, v8);
    if (v12)
    {
      CFDictionaryRef v13 = v12;
      unsigned __int8 v14 = [(MSCameraFile *)self processMetadata:v12];
      CFRelease(v13);
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
    if (v11) {
      CFRelease(v11);
    }
    if ((v14 & 1) == 0)
    {
      [(MSCameraFile *)self setHasMetadata:0];
      goto LABEL_26;
    }
    id v20 = [(MSCameraItem *)self metadata];
    [v4 addEntriesFromDictionary:v20];
LABEL_24:

LABEL_26:
    goto LABEL_27;
  }
  if ([(MSCameraItem *)self type] == 1836019574)
  {
    CFDictionaryRef v8 = (const __CFDictionary *)dispatch_semaphore_create(0);
    CFURLRef v10 = (const __CFURL *)objc_alloc_init((Class)NSMutableArray);
    id v17 = objc_alloc((Class)AVURLAsset);
    uint64_t v18 = [(MSCameraItem *)self path];
    int v19 = +[NSURL fileURLWithPath:v18];
    id v20 = [v17 initWithURL:v19 options:0];

    if ([(MSCameraFile *)self fullMetadata]) {
      [(__CFURL *)v10 addObject:@"duration"];
    }
    [(__CFURL *)v10 addObject:@"tracks"];
    id v21 = [(MSCameraItem *)self metadata];
    id v22 = [v21 objectForKeyedSubscript:kCGImagePropertyOrientation];

    if (!v22)
    {
      id v23 = [v20 videoOrientation];
      [(MSCameraFile *)self setImageOrientation:v23];
      __int16 v24 = +[NSNumber numberWithUnsignedInt:v23];
      [v4 setObject:v24 forKeyedSubscript:kCGImagePropertyOrientation];
    }
    if (v20)
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10001AB80;
      v34[3] = &unk_100034BD0;
      v34[4] = self;
      id v35 = v20;
      id v36 = v4;
      id v25 = v8;
      id v37 = v25;
      [v35 loadValuesAsynchronouslyForKeys:v10 completionHandler:v34];
      dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
    }
    goto LABEL_24;
  }
LABEL_27:
  [(MSCameraItem *)self setMetadata:v4];
  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    id v26 = [(MSCameraFile *)self name];
    if ((unint64_t)[v26 length] >= 0x15)
    {
      v27 = objc_msgSend(v26, "substringWithRange:", 0, 18);
      uint64_t v28 = [v27 stringByAppendingString:@".."];

      id v26 = (void *)v28;
    }
    id v29 = +[NSString stringWithFormat:@"AVAsset: metadata: %@", v4];
    uint64_t v30 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = v26;
      id v32 = v30;
      id v33 = [v31 UTF8String];
      *(_DWORD *)mach_timebase_info info = 136446466;
      *(void *)&info[4] = v33;
      __int16 v39 = 2114;
      v40 = v29;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", info, 0x16u);
    }
  }
  id v15 = [(MSCameraItem *)self metadata];

LABEL_9:

  return (NSMutableDictionary *)v15;
}

- (int64_t)compare:(id)a3 against:(id)a4 withContext:(void *)a5
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 objHandle];
  if (v8 >= [v7 objHandle])
  {
    unsigned int v10 = [v6 objHandle];
    int64_t v9 = v10 > [v7 objHandle];
  }
  else
  {
    int64_t v9 = -1;
  }

  return v9;
}

- (id)thumbnailDataForMaxPixelSize:(unsigned int)a3 rotated:(BOOL *)a4
{
  uint64_t v5 = *(void *)&a3;
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  dword_10004484C = 0;
  *(float *)&dword_10004484C = (float)mach_absolute_time();
  if ([(MSCameraItem *)self type] == 1768776039)
  {
    id v7 = [(MSCameraFile *)self imageThumbnailDataForMaxPixelSize:v5 rotated:a4];
  }
  else
  {
    id v7 = [(MSCameraFile *)self movieThumbnailDataForMaxPixelSize:v5];
    *a4 = 1;
  }
  float v8 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10004484C) * (float)info.numer)
             / (float)info.denom)
     / 1000000.0;
  __ICOSLogCreate();
  int64_t v9 = [(MSCameraFile *)self name];
  if ((unint64_t)[v9 length] >= 0x15)
  {
    unsigned int v10 = objc_msgSend(v9, "substringWithRange:", 0, 18);
    uint64_t v11 = [v10 stringByAppendingString:@".."];

    int64_t v9 = (void *)v11;
  }
  if (v8 <= 300.0) {
    CFStringRef v12 = @"𝚫";
  }
  else {
    CFStringRef v12 = @"⊗";
  }
  CFDictionaryRef v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[subImage] %10s: [%7lu]", "response", [v7 length]);
  unsigned __int8 v14 = +[NSString stringWithFormat:@"%@[%4.0f ms] %@", v12, v8, v13];

  id v15 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v9;
    id v17 = v15;
    id v18 = [v16 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v22 = v18;
    __int16 v23 = 2114;
    __int16 v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  dword_100044848 = LODWORD(v8);

  return v7;
}

- (id)exifThumbOffsets
{
  if ([(MSCameraFile *)self thumbSize]
    && [(MSCameraFile *)self thumbHeight]
    && [(MSCameraFile *)self thumbOffset]
    && [(MSCameraFile *)self thumbWidth])
  {
    id v3 = +[NSMutableDictionary dictionary];
    id v4 = +[NSNumber numberWithUnsignedInt:[(MSCameraFile *)self thumbSize]];
    [v3 setObject:v4 forKeyedSubscript:@"ThumbnailSize"];

    uint64_t v5 = +[NSNumber numberWithUnsignedInt:[(MSCameraFile *)self thumbOffset]];
    [v3 setObject:v5 forKeyedSubscript:@"ThumbnailOffset"];

    id v6 = +[NSNumber numberWithInt:[(MSCameraFile *)self thumbWidth]];
    [v3 setObject:v6 forKeyedSubscript:@"ThumbnailWidth"];

    id v7 = +[NSNumber numberWithUnsignedInt:[(MSCameraFile *)self thumbHeight]];
    [v3 setObject:v7 forKeyedSubscript:@"ThumbnailHeight"];
  }
  return 0;
}

- (id)imageThumbnailDataForMaxPixelSize:(unsigned int)a3 rotated:(BOOL *)a4
{
  uint64_t v5 = *(void *)&a3;
  __ICOSLogCreate();
  id v7 = [(MSCameraFile *)self name];
  if ((unint64_t)[v7 length] >= 0x15)
  {
    float v8 = objc_msgSend(v7, "substringWithRange:", 0, 18);
    uint64_t v9 = [v8 stringByAppendingString:@".."];

    id v7 = (void *)v9;
  }
  unsigned int v10 = +[NSString stringWithFormat:@"[subImage] %10s: [%7d]", "request", v5];
  uint64_t v11 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v7;
    CFDictionaryRef v13 = v11;
    *(_DWORD *)buf = 136446466;
    id v42 = [v12 UTF8String];
    __int16 v43 = 2114;
    long long v44 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  unsigned __int8 v14 = +[NSNumber numberWithUnsignedInt:v5];
  id v15 = [(MSCameraFile *)self subImageDictForPixelWidth:v14];

  if (v15)
  {
    id v16 = [(MSCameraFile *)self createThumbnailUsingOffsets:v15];
    id v17 = [v15 objectForKeyedSubscript:@"Width"];
    if ([v17 intValue] != v5)
    {
      id v18 = [v15 objectForKeyedSubscript:@"Height"];
      unsigned int v19 = [v18 intValue];

      if (v19 == v5) {
        goto LABEL_14;
      }
      __ICOSLogCreate();
      id v20 = [(MSCameraFile *)self name];
      v40 = a4;
      if ((unint64_t)[v20 length] >= 0x15)
      {
        id v21 = objc_msgSend(v20, "substringWithRange:", 0, 18);
        uint64_t v22 = [v21 stringByAppendingString:@".."];

        id v20 = (void *)v22;
      }
      __int16 v23 = [v15 objectForKeyedSubscript:@"Width"];
      id v24 = [v23 intValue];
      id v25 = [v15 objectForKeyedSubscript:@"Height"];
      id v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[subImage] %10s: [%7d x %7d] -> [%7d]", "scale", v24, [v25 intValue], v5);

      v27 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = v20;
        id v29 = v27;
        id v30 = [v28 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v42 = v30;
        __int16 v43 = 2114;
        long long v44 = v26;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      [(MSCameraFile *)self scaleData:v16 maxPixelSize:v5];
      id v16 = v17 = v16;
      a4 = v40;
    }

LABEL_14:
    if (v16) {
      goto LABEL_20;
    }
  }
  __ICOSLogCreate();
  id v31 = [(MSCameraFile *)self name];
  if ((unint64_t)[v31 length] >= 0x15)
  {
    id v32 = objc_msgSend(v31, "substringWithRange:", 0, 18);
    uint64_t v33 = [v32 stringByAppendingString:@".."];

    id v31 = (void *)v33;
  }
  uint64_t v34 = +[NSString stringWithFormat:@"[subImage] %10s: [%7d]", "decode full", v5];
  id v35 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v36 = v31;
    id v37 = v35;
    id v38 = [v36 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v42 = v38;
    __int16 v43 = 2114;
    long long v44 = v34;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  id v16 = [(MSCameraFile *)self createImageDataForMaxPixelSize:v5];
  *a4 = 1;
LABEL_20:

  return v16;
}

- (id)scaleData:(id)a3 maxPixelSize:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  CGImageSourceRef v5 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  if (v5)
  {
    id v6 = v5;
    Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
    float v8 = [UTTypeJPEG identifier];
    uint64_t v9 = CGImageDestinationCreateWithData(Mutable, v8, 1uLL, 0);

    if (v9)
    {
      unsigned int v10 = +[NSMutableDictionary dictionary];
      uint64_t v11 = +[NSNumber numberWithUnsignedInt:v4];
      [v10 setObject:v11 forKeyedSubscript:kCGImageDestinationImageMaxPixelSize];

      [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:kCGImageSourceCreateThumbnailWithTransform];
      CGImageDestinationAddImageFromSource(v9, v6, 0, (CFDictionaryRef)v10);
      if (!CGImageDestinationFinalize(v9))
      {

        Mutable = 0;
      }
      CFRelease(v9);
    }
    CFRelease(v6);
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

- (id)createImageDataForMaxPixelSize:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  CGImageSourceRef v5 = [(MSCameraFile *)self name];
  id v6 = [v5 pathExtension];
  id v7 = [v6 lowercaseString];

  if ([(MSCameraFile *)self imageWidth] < v3
    && [(MSCameraFile *)self imageHeight] < v3
    && (([v7 isEqualToString:@"jpg"] & 1) != 0
     || [v7 isEqualToString:@"jpeg"]))
  {
    float v8 = [(MSCameraItem *)self path];
    CFURLRef v9 = +[NSURL fileURLWithPath:v8];

    Mutable = (__CFData *)[objc_alloc((Class)NSData) initWithContentsOfURL:v9];
  }
  else
  {
    uint64_t v11 = [(MSCameraItem *)self path];
    CFURLRef v9 = +[NSURL fileURLWithPath:v11];

    CGImageSourceRef v12 = CGImageSourceCreateWithURL(v9, 0);
    if (v12)
    {
      CFDictionaryRef v13 = v12;
      Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
      unsigned __int8 v14 = [UTTypeJPEG identifier];
      id v15 = CGImageDestinationCreateWithData(Mutable, v14, 1uLL, 0);

      if (v15)
      {
        id v16 = +[NSMutableDictionary dictionary];
        id v17 = +[NSNumber numberWithUnsignedInt:v3];
        [v16 setObject:v17 forKeyedSubscript:kCGImageDestinationImageMaxPixelSize];

        [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:kCGImageSourceCreateThumbnailWithTransform];
        CGImageDestinationAddImageFromSource(v15, v13, 0, (CFDictionaryRef)v16);
        if (!CGImageDestinationFinalize(v15))
        {

          Mutable = 0;
        }
        CFRelease(v15);
      }
      CFRelease(v13);
    }
    else
    {
      Mutable = 0;
    }
  }

  return Mutable;
}

- (id)movieThumbnailDataForMaxPixelSize:(unsigned int)a3
{
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  id v5 = objc_alloc((Class)AVURLAsset);
  id v6 = [(MSCameraItem *)self path];
  id v7 = +[NSURL fileURLWithPath:v6];
  id v8 = [v5 initWithURL:v7 options:0];

  if (v8)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    id v10 = [objc_alloc((Class)AVAssetImageGenerator) initWithAsset:v8];
    objc_msgSend(v10, "setMaximumSize:", (double)a3, (double)a3);
    [v10 setAppliesPreferredTrackTransform:1];
    long long v29 = *(_OWORD *)&kCMTimeZero.value;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    uint64_t v11 = +[NSValue valueWithCMTime:&v29];
    *(void *)&long long v29 = 0;
    *((void *)&v29 + 1) = &v29;
    CMTimeEpoch epoch = 0x3032000000;
    id v31 = sub_10001C358;
    id v32 = sub_10001C384;
    id v33 = 0;
    id v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    __int16 v23 = sub_10001C38C;
    id v24 = &unk_100034C38;
    v27 = &v34;
    id v28 = &v29;
    id v25 = self;
    CGImageSourceRef v12 = v9;
    id v26 = v12;
    CFDictionaryRef v13 = objc_retainBlock(&v21);
    id v14 = objc_msgSend(v13, "copy", v21, v22, v23, v24, v25);
    id v15 = *(void **)(*((void *)&v29 + 1) + 40);
    *(void *)(*((void *)&v29 + 1) + 40) = v14;

    id v38 = v11;
    id v16 = +[NSArray arrayWithObjects:&v38 count:1];
    [v10 generateCGImagesAsynchronouslyForTimes:v16 completionHandler:*(void *)(*((void *)&v29 + 1) + 40)];

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    _Block_object_dispose(&v29, 8);
  }
  if (v35[3])
  {
    Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
    id v18 = [UTTypeJPEG identifier];
    unsigned int v19 = CGImageDestinationCreateWithData(Mutable, v18, 1uLL, 0);

    if (v19)
    {
      CGImageDestinationAddImage(v19, (CGImageRef)v35[3], 0);
      if (!CGImageDestinationFinalize(v19))
      {

        Mutable = 0;
      }
      CFRelease(v19);
    }
    else
    {

      Mutable = 0;
    }
    CFRelease((CFTypeRef)v35[3]);
  }
  else
  {
    Mutable = 0;
  }

  _Block_object_dispose(&v34, 8);

  return Mutable;
}

- (id)imageData
{
  uint64_t v3 = [(MSCameraItem *)self info];
  unsigned int v4 = [v3 objectCompressedSize];

  id v5 = malloc_type_malloc(v4, 0x34E4634DuLL);
  if (v4) {
    unint64_t v6 = [(MSCameraFile *)self readStream:v5 size:v4 offset:0];
  }
  else {
    unint64_t v6 = 0;
  }
  id v7 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v5 length:v6 freeWhenDone:1];
  if (![v7 length])
  {

    id v7 = 0;
  }

  return v7;
}

- (BOOL)validateReturnDataSize:(unint64_t)a3 forRequestSize:(unint64_t)a4
{
  return a3 && a3 != 0x7FFFFFFFFFFFFFFFLL && a3 == a4;
}

- (id)fingerprintWithError:(id *)a3
{
  id v5 = [(MSCameraFile *)self fingerprint];

  if (!v5)
  {
    unint64_t v6 = objc_alloc_init(ICCameraFileFingerprint);
    id v7 = [(MSCameraItem *)self path];
    id v8 = +[NSURL URLWithString:v7];
    dispatch_semaphore_t v9 = [(ICCameraFileFingerprint *)v6 fingerprintForFileAtURL:v8 error:a3];
    [(MSCameraFile *)self setFingerprint:v9];
  }

  return [(MSCameraFile *)self fingerprint];
}

- (NSString)fingerprint
{
  return self->_fingerprint;
}

- (void)setFingerprint:(id)a3
{
}

- (ICBufferCache)bufferCache
{
  return self->_bufferCache;
}

- (void)setBufferCache:(id)a3
{
}

- (os_unfair_lock_s)fileOpenLock
{
  return self->_fileOpenLock;
}

- (void)setFileOpenLock:(os_unfair_lock_s)a3
{
  self->_fileOpenLock = a3;
}

- (int)fileOpenCount
{
  return self->_fileOpenCount;
}

- (void)setFileOpenCount:(int)a3
{
  self->_fileOpenCount = a3;
}

- (NSString)UTI
{
  return self->_UTI;
}

- (void)setUTI:(id)a3
{
}

- (void)setSubImages:(id)a3
{
}

- (int)bitsPerPixel
{
  return self->_bitsPerPixel;
}

- (void)setBitsPerPixel:(int)a3
{
  self->_bitsPerPixel = a3;
}

- (BOOL)updatedBasicMetadata
{
  return self->_updatedBasicMetadata;
}

- (void)setUpdatedBasicMetadata:(BOOL)a3
{
  self->_updatedBasicMetadata = a3;
}

- (BOOL)updatedExpensiveMetadata
{
  return self->_updatedExpensiveMetadata;
}

- (void)setUpdatedExpensiveMetadata:(BOOL)a3
{
  self->_updatedExpensiveMetadata = a3;
}

- (BOOL)previewThumbnail
{
  return self->_previewThumbnail;
}

- (void)setPreviewThumbnail:(BOOL)a3
{
  self->_previewThumbnail = a3;
}

- (BOOL)smallThumbnail
{
  return self->_smallThumbnail;
}

- (void)setSmallThumbnail:(BOOL)a3
{
  self->_smallThumbnail = a3;
}

- (BOOL)hasMetadata
{
  return self->_hasMetadata;
}

- (void)setHasMetadata:(BOOL)a3
{
  self->_hasMetadata = a3;
}

- (BOOL)fullMetadata
{
  return self->_fullMetadata;
}

- (void)setFullMetadata:(BOOL)a3
{
  self->_fullMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subImages, 0);
  objc_storeStrong((id *)&self->_UTI, 0);
  objc_storeStrong((id *)&self->_bufferCache, 0);

  objc_storeStrong((id *)&self->_fingerprint, 0);
}

@end