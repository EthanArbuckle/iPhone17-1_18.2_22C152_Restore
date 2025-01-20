@interface CacheDeleteVolume
+ (CacheDeleteVolume)volumeWithMountpoint:(id)a3;
+ (CacheDeleteVolume)volumeWithPath:(id)a3;
+ (CacheDeleteVolume)volumeWithUUID:(id)a3;
+ (id)mountPointForUUID:(id)a3;
+ (id)rootVolume;
+ (id)validateVolumeAtPath:(id)a3;
+ (int64_t)stateForPath:(id)a3;
- (BOOL)amountIsRational:(id)a3 freespace:(unint64_t)a4 effective_size:(unint64_t)a5 used:(unint64_t)a6 size:(unint64_t)a7;
- (BOOL)containsPath:(id)a3;
- (BOOL)freespaceIsStale:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualTo:(id)a3;
- (BOOL)isRoot;
- (BOOL)mayContainPurgeableAmount:(id)a3 forService:(id)a4;
- (BOOL)validate;
- (CacheDeleteVolume)initWithPath:(id)a3;
- (CacheDeleteVolume)initWithVolume:(id)a3;
- (NSDictionary)thresholds;
- (NSString)bsdName;
- (NSString)fsType;
- (NSString)mountPoint;
- (id)FSEventsUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)uuid;
- (int)dev;
- (int64_t)state;
- (unint64_t)amountPurged;
- (unint64_t)effective_size;
- (unint64_t)freespace;
- (unint64_t)hash;
- (unint64_t)initialFreespace;
- (unint64_t)size;
- (unint64_t)used;
- (unsigned)block_size;
@end

@implementation CacheDeleteVolume

+ (CacheDeleteVolume)volumeWithPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithPath:v4];

  return (CacheDeleteVolume *)v5;
}

- (int64_t)state
{
  if (![(CacheDeleteVolume *)self validate]) {
    return 0;
  }
  id v3 = [(CacheDeleteVolume *)self mountPoint];
  int64_t v4 = volumeLowDiskState([v3 fileSystemRepresentation]);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bsdName, 0);
  objc_storeStrong((id *)&self->_thresholds, 0);
  objc_storeStrong((id *)&self->_mountPoint, 0);
  objc_storeStrong((id *)&self->_fsType, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CacheDeleteVolume *)self isEqualTo:v4];

  return v5;
}

- (BOOL)isEqualTo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CacheDeleteVolume *)self mountPoint];
  v6 = [v4 mountPoint];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (BOOL)freespaceIsStale:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(CacheDeleteVolume *)self freespace];
  if (v5 <= a3) {
    unint64_t v6 = a3 - v5;
  }
  else {
    unint64_t v6 = v5 - a3;
  }
  unint64_t v7 = [(CacheDeleteVolume *)self freespace];
  if (v7 / 0x14 >= 0x40000000) {
    unint64_t v8 = 0x40000000;
  }
  else {
    unint64_t v8 = v7 / 0x14;
  }
  if (v8 <= 0x9600000) {
    unint64_t v9 = 157286400;
  }
  else {
    unint64_t v9 = v8;
  }
  v10 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 134218496;
    unint64_t v15 = v8;
    __int16 v16 = 2048;
    unint64_t v17 = v9;
    __int16 v18 = 2048;
    unint64_t v19 = v6;
    _os_log_debug_impl(&dword_1A63D1000, v10, OS_LOG_TYPE_DEBUG, "freespaceIsStale ceiling: %llu, freespace_diff_threshold: %llu, freespace_diff: %llu", (uint8_t *)&v14, 0x20u);
  }

  v11 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = "NO";
    if (v6 >= v9) {
      v13 = "YES";
    }
    int v14 = 136315138;
    unint64_t v15 = (unint64_t)v13;
    _os_log_debug_impl(&dword_1A63D1000, v11, OS_LOG_TYPE_DEBUG, "freespaceIsStale: %s", (uint8_t *)&v14, 0xCu);
  }

  return v6 >= v9;
}

- (id)description
{
  v21 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v20 = NSStringFromClass(v3);
  unint64_t v19 = [(CacheDeleteVolume *)self mountPoint];
  id v4 = [(CacheDeleteVolume *)self bsdName];
  unint64_t v5 = [(CacheDeleteVolume *)self fsType];
  BOOL v6 = [(CacheDeleteVolume *)self validate];
  unint64_t v7 = ", INVALID ";
  if (v6) {
    unint64_t v7 = "";
  }
  __int16 v18 = v7;
  unint64_t v8 = [(CacheDeleteVolume *)self freespace];
  unint64_t v9 = humanReadableNumber([(CacheDeleteVolume *)self freespace]);
  unint64_t v10 = [(CacheDeleteVolume *)self initialFreespace];
  v11 = humanReadableNumber([(CacheDeleteVolume *)self initialFreespace]);
  unint64_t v12 = [(CacheDeleteVolume *)self used];
  v13 = humanReadableNumber([(CacheDeleteVolume *)self used]);
  unint64_t v14 = [(CacheDeleteVolume *)self size];
  unint64_t v15 = humanReadableNumber([(CacheDeleteVolume *)self size]);
  __int16 v16 = [v21 stringWithFormat:@"<%@> at: %@ [%@ : %@] %sfreespace: %llu (%@), initialFreespace: %llu (%@), used: %llu (%@), total size: %llu (%@)", v20, v19, v4, v5, v18, v8, v9, v10, v11, v12, v13, v14, v15];

  return v16;
}

- (CacheDeleteVolume)initWithVolume:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CacheDeleteVolume;
  unint64_t v5 = [(CacheDeleteVolume *)&v19 init];
  if (v5)
  {
    v5->_isRoot = [v4 isRoot];
    BOOL v6 = [v4 fsType];
    uint64_t v7 = [v6 copy];
    fsType = v5->_fsType;
    v5->_fsType = (NSString *)v7;

    unint64_t v9 = [v4 mountPoint];
    uint64_t v10 = [v9 copy];
    mountPoint = v5->_mountPoint;
    v5->_mountPoint = (NSString *)v10;

    v5->_initialFreespace = [v4 freespace];
    unint64_t v12 = [v4 thresholds];
    uint64_t v13 = [v12 copy];
    thresholds = v5->_thresholds;
    v5->_thresholds = (NSDictionary *)v13;

    unint64_t v15 = [v4 bsdName];
    uint64_t v16 = [v15 copy];
    bsdName = v5->_bsdName;
    v5->_bsdName = (NSString *)v16;

    v5->_dev = [v4 dev];
    v5->_block_size = objc_msgSend(v4, "block_size");
  }

  return v5;
}

- (NSString)fsType
{
  return self->_fsType;
}

- (unsigned)block_size
{
  return self->_block_size;
}

- (unint64_t)used
{
  if (![(CacheDeleteVolume *)self validate]) {
    return 0;
  }
  id v3 = [(CacheDeleteVolume *)self mountPoint];
  unint64_t v4 = volumeUsed((const char *)[v3 fileSystemRepresentation]);

  return v4;
}

- (unint64_t)size
{
  if (![(CacheDeleteVolume *)self validate]) {
    return 0;
  }
  id v3 = [(CacheDeleteVolume *)self mountPoint];
  uint64_t v4 = volumeSize((const char *)[v3 fileSystemRepresentation]);

  return v4;
}

- (unint64_t)initialFreespace
{
  return self->_initialFreespace;
}

- (NSString)bsdName
{
  return self->_bsdName;
}

+ (CacheDeleteVolume)volumeWithMountpoint:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)[objc_alloc((Class)a1) initWithPath:v4];
  BOOL v6 = [v5 mountPoint];
  uint64_t v7 = [v6 stringByStandardizingPath];
  unint64_t v8 = [v4 stringByStandardizingPath];

  LODWORD(v4) = [v7 isEqualToString:v8];
  if (v4) {
    id v9 = v5;
  }
  else {
    id v9 = 0;
  }

  return (CacheDeleteVolume *)v9;
}

- (unint64_t)freespace
{
  id v3 = (void *)MEMORY[0x1AD0BA160](self, a2);
  if ([(CacheDeleteVolume *)self validate])
  {
    id v4 = [(CacheDeleteVolume *)self mountPoint];
    uint64_t v5 = volumeFreespace((const char *)[v4 fileSystemRepresentation]);
  }
  else
  {
    BOOL v6 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v8 = 0;
      _os_log_error_impl(&dword_1A63D1000, v6, OS_LOG_TYPE_ERROR, "CacheDeleteVolume validate failed. Returning 0 free space", v8, 2u);
    }

    uint64_t v5 = 0;
  }
  return v5;
}

- (BOOL)validate
{
  id v3 = (void *)MEMORY[0x1AD0BA160](self, a2);
  BOOL v9 = [(CacheDeleteVolume *)self isRoot];
  id v4 = [(CacheDeleteVolume *)self mountPoint];
  uint64_t v5 = _validateVolume();

  char v6 = 0;
  if (![(CacheDeleteVolume *)self dev])
  {
    if (v9 == [(CacheDeleteVolume *)self isRoot])
    {
      uint64_t v7 = [(CacheDeleteVolume *)self mountPoint];
      char v6 = [v5 isEqualToString:v7];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (NSString)mountPoint
{
  return self->_mountPoint;
}

- (BOOL)isRoot
{
  return self->_isRoot;
}

- (int)dev
{
  return self->_dev;
}

- (CacheDeleteVolume)initWithPath:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CacheDeleteVolume;
  v22 = 0;
  uint64_t v5 = [(CacheDeleteVolume *)&v21 init];
  if (!v5)
  {
LABEL_17:
    uint64_t v5 = v5;
    unint64_t v17 = v5;
    goto LABEL_18;
  }
  if (v4)
  {
    memset(v24, 0, sizeof(v24));
    char v6 = mapVolume(v4, 0);
    uint64_t v7 = _validateVolume();
    mountPoint = v5->_mountPoint;
    v5->_mountPoint = (NSString *)v7;

    if (v5->_mountPoint)
    {
      if (v22)
      {
        uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:");
        fsType = v5->_fsType;
        v5->_fsType = (NSString *)v9;
      }
      uint64_t v11 = [NSString stringWithUTF8String:v24];
      bsdName = v5->_bsdName;
      v5->_bsdName = (NSString *)v11;

      uint64_t v13 = [(NSString *)v5->_mountPoint UTF8String];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v26 = 0x3032000000;
      v27 = __Block_byref_object_copy__3;
      v28 = __Block_byref_object_dispose__3;
      id v29 = 0;
      if (qword_1EB30C4A0 != -1)
      {
        uint64_t v20 = v13;
        dispatch_once(&qword_1EB30C4A0, &__block_literal_global_5);
        uint64_t v13 = v20;
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __cdVolumeThresholdsForMountPoint_block_invoke_2;
      block[3] = &unk_1E5C519C8;
      block[4] = &buf;
      block[5] = v13;
      dispatch_sync((dispatch_queue_t)qword_1EB30C498, block);
      unint64_t v14 = (NSDictionary *)*(id *)(*((void *)&buf + 1) + 40);
      _Block_object_dispose(&buf, 8);

      thresholds = v5->_thresholds;
      v5->_thresholds = v14;

      v5->_initialFreespace = volumeFreespace([(NSString *)v5->_mountPoint fileSystemRepresentation]);
    }
    else
    {
      __int16 v18 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v4;
        _os_log_debug_impl(&dword_1A63D1000, v18, OS_LOG_TYPE_DEBUG, "unable to validate volume: %@", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v5 = 0;
    }
    if (v22) {
      free(v22);
    }
    goto LABEL_17;
  }
  uint64_t v16 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_1A63D1000, v16, OS_LOG_TYPE_ERROR, "path is NIL", (uint8_t *)&buf, 2u);
  }

  unint64_t v17 = 0;
LABEL_18:

  return v17;
}

+ (id)validateVolumeAtPath:(id)a3
{
  if (a3)
  {
    id v3 = mapVolume(a3, 0);
    id v4 = _validateVolume();
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)uuid
{
  v2 = [(CacheDeleteVolume *)self mountPoint];
  id v3 = mapVolume(v2, 0);

  id v4 = v3;
  uint64_t v5 = VolUUID((const char *)[v4 UTF8String]);

  return v5;
}

- (id)FSEventsUUID
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFUUIDRef v3 = FSEventsCopyUUIDForDevice([(CacheDeleteVolume *)self dev]);
  if (!v3)
  {
    char v6 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v10 = [(CacheDeleteVolume *)self mountPoint];
      int v13 = 136315138;
      uint64_t v14 = [v10 UTF8String];
      _os_log_error_impl(&dword_1A63D1000, v6, OS_LOG_TYPE_ERROR, "Unable to get FSEvents UUID for %s", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_11;
  }
  CFUUIDRef v4 = v3;
  CFStringRef v5 = CFUUIDCreateString(0, v3);
  if (!v5)
  {
    uint64_t v11 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      uint64_t v14 = (uint64_t)v4;
      _os_log_error_impl(&dword_1A63D1000, v11, OS_LOG_TYPE_ERROR, "CFUUIDCreateString failed for: %@", (uint8_t *)&v13, 0xCu);
    }

    CFRelease(v4);
    char v6 = 0;
LABEL_11:
    uint64_t v9 = 0;
    goto LABEL_12;
  }
  char v6 = v5;
  CFRelease(v4);
  uint64_t v7 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = [(CacheDeleteVolume *)self mountPoint];
    int v13 = 138412546;
    uint64_t v14 = (uint64_t)v6;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1A63D1000, v7, OS_LOG_TYPE_DEFAULT, "CacheDeleteVolume FSEventsUUID: %@ for %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
LABEL_12:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CFUUIDRef v4 = [CacheDeleteVolume alloc];
  return [(CacheDeleteVolume *)v4 initWithVolume:self];
}

- (unint64_t)amountPurged
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (![(CacheDeleteVolume *)self validate]) {
    goto LABEL_6;
  }
  id v3 = [(CacheDeleteVolume *)self mountPoint];
  uint64_t v4 = volumeFreespace((const char *)[v3 fileSystemRepresentation]);

  CFStringRef v5 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134218240;
    unint64_t v10 = [(CacheDeleteVolume *)self initialFreespace];
    __int16 v11 = 2048;
    uint64_t v12 = v4;
    _os_log_debug_impl(&dword_1A63D1000, v5, OS_LOG_TYPE_DEBUG, "begin_freespace: %llu, cur_freespace: %llu", (uint8_t *)&v9, 0x16u);
  }

  if (v4 > [(CacheDeleteVolume *)self initialFreespace]) {
    unint64_t v6 = v4 - [(CacheDeleteVolume *)self initialFreespace];
  }
  else {
LABEL_6:
  }
    unint64_t v6 = 0;
  uint64_t v7 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134217984;
    unint64_t v10 = v6;
    _os_log_debug_impl(&dword_1A63D1000, v7, OS_LOG_TYPE_DEBUG, "result: %llu", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (unint64_t)effective_size
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(CacheDeleteVolume *)self validate])
  {
    unint64_t v3 = [(CacheDeleteVolume *)self size];
    unint64_t v4 = volumeUsed("/");
    CFStringRef v5 = [(CacheDeleteVolume *)self mountPoint];
    unint64_t v6 = disk();

    uint64_t v7 = disk();
    if ([v6 isEqualToString:v7]
      && (unint64_t v8 = [(CacheDeleteVolume *)self size], v8 == volumeSize("/")))
    {
      if (v3 <= v4)
      {
        uint64_t v14 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          __int16 v15 = humanReadableNumber(v4);
          mountPoint = self->_mountPoint;
          uint64_t v17 = humanReadableNumber(v3);
          int v18 = 134218754;
          unint64_t v19 = v4;
          __int16 v20 = 2112;
          objc_super v21 = v15;
          __int16 v22 = 2112;
          v23 = mountPoint;
          __int16 v24 = 2112;
          v25 = v17;
          _os_log_error_impl(&dword_1A63D1000, v14, OS_LOG_TYPE_ERROR, "CacheDeleteVolume effective_size: systemVolume used amount is greater than this volume's size. System used amount: %llu (%@), this volume: %@ : %@", (uint8_t *)&v18, 0x2Au);
        }
        effective_size_volume_effective_size = 0;
      }
      else
      {
        effective_size_volume_effective_size = v3 - v4;
        int v9 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v10 = [(CacheDeleteVolume *)self mountPoint];
          __int16 v11 = humanReadableNumber(v3);
          humanReadableNumber(effective_size_volume_effective_size);
          uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue();
          int v18 = 138412802;
          unint64_t v19 = (unint64_t)v10;
          __int16 v20 = 2112;
          objc_super v21 = v11;
          __int16 v22 = 2112;
          v23 = v12;
          _os_log_impl(&dword_1A63D1000, v9, OS_LOG_TYPE_DEFAULT, "CacheDeleteVolume effective_size: %@ container size: %@, effective size: %@", (uint8_t *)&v18, 0x20u);
        }
      }
    }
    else
    {
      effective_size_volume_effective_size = v3;
    }
  }
  return effective_size_volume_effective_size;
}

- (BOOL)amountIsRational:(id)a3 freespace:(unint64_t)a4 effective_size:(unint64_t)a5 used:(unint64_t)a6 size:(unint64_t)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if ([v12 unsignedLongLongValue] + a4 >= a5 || objc_msgSend(v12, "unsignedLongLongValue") >= a6)
  {
    uint64_t v14 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [(CacheDeleteVolume *)self mountPoint];
      uint64_t v24 = [v12 unsignedLongLongValue];
      uint64_t v17 = humanReadableNumber([v12 unsignedLongLongValue]);
      v23 = humanReadableNumber(a4);
      unint64_t v22 = [v12 unsignedLongLongValue] + a4;
      int v18 = humanReadableNumber([v12 unsignedLongLongValue] + a4);
      objc_super v21 = humanReadableNumber(a5);
      __int16 v20 = humanReadableNumber(a7);
      unint64_t v19 = humanReadableNumber(a6);
      *(_DWORD *)long long buf = 138415362;
      uint64_t v26 = v16;
      __int16 v27 = 2048;
      uint64_t v28 = v24;
      __int16 v29 = 2112;
      uint64_t v30 = v17;
      __int16 v31 = 2048;
      unint64_t v32 = a4;
      __int16 v33 = 2112;
      v34 = v23;
      __int16 v35 = 2048;
      unint64_t v36 = v22;
      __int16 v37 = 2112;
      v38 = v18;
      __int16 v39 = 2048;
      unint64_t v40 = a5;
      __int16 v41 = 2112;
      v42 = v21;
      __int16 v43 = 2048;
      unint64_t v44 = a7;
      __int16 v45 = 2112;
      v46 = v20;
      __int16 v47 = 2048;
      unint64_t v48 = a6;
      __int16 v49 = 2112;
      v50 = v19;
      _os_log_error_impl(&dword_1A63D1000, v14, OS_LOG_TYPE_ERROR, "Volume: %@ : Irrational amount: %llu (%@), plus freespace %llu (%@) = %llu (%@) > self.effective_size: %llu (%@), real size: %llu, (%@), amount used: %llu (%@)", buf, 0x84u);
    }
    BOOL v13 = 0;
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

+ (CacheDeleteVolume)volumeWithUUID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    unint64_t v4 = getLocalVolumes();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = +[CacheDeleteVolume volumeWithMountpoint:](CacheDeleteVolume, "volumeWithMountpoint:", *(void *)(*((void *)&v15 + 1) + 8 * v8), (void)v15);
        unint64_t v10 = v9;
        if (v9)
        {
          __int16 v11 = [v9 uuid];
          id v12 = [v11 UUIDString];
          char v13 = [v12 isEqualToString:v3];

          if (v13) {
            break;
          }
        }

        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      unint64_t v10 = 0;
    }
  }
  else
  {
    unint64_t v10 = 0;
  }

  return (CacheDeleteVolume *)v10;
}

+ (id)mountPointForUUID:(id)a3
{
  id v3 = +[CacheDeleteVolume volumeWithUUID:a3];
  unint64_t v4 = [v3 mountPoint];

  return v4;
}

+ (id)rootVolume
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__CacheDeleteVolume_rootVolume__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB30C490 != -1) {
    dispatch_once(&qword_1EB30C490, block);
  }
  v2 = (void *)_MergedGlobals_5;
  return v2;
}

void __31__CacheDeleteVolume_rootVolume__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  getRootVolume();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 volumeWithMountpoint:v4];
  id v3 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = v2;
}

+ (int64_t)stateForPath:(id)a3
{
  id v3 = +[CacheDeleteVolume validateVolumeAtPath:a3];
  id v4 = v3;
  if (v3) {
    int64_t v5 = volumeLowDiskState([v3 fileSystemRepresentation]);
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)containsPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = volRootFromPath((char *)[v4 UTF8String], v18);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(CacheDeleteVolume *)self mountPoint];
    uint64_t v8 = [NSString stringWithUTF8String:v6];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    uint64_t v7 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [v4 UTF8String];
      id v12 = __error();
      char v13 = strerror(*v12);
      int v14 = 136315394;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      long long v17 = v13;
      _os_log_error_impl(&dword_1A63D1000, v7, OS_LOG_TYPE_ERROR, "Unable to get mount point for %s : %s", (uint8_t *)&v14, 0x16u);
    }
    char v9 = 0;
  }

  return v9;
}

- (BOOL)mayContainPurgeableAmount:(id)a3 forService:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(CacheDeleteVolume *)self size];
  if ([v6 longLongValue] < 0 || v8 && objc_msgSend(v6, "unsignedLongLongValue") > v8)
  {
    char v9 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67110146;
      int v15 = 0;
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 2048;
      unint64_t v19 = v8;
      __int16 v20 = 2112;
      id v21 = v7;
      __int16 v22 = 2112;
      v23 = self;
      _os_log_error_impl(&dword_1A63D1000, v9, OS_LOG_TYPE_ERROR, "Received implausible purgeable amount. Returning: (%d) passed: (%@), volume max: (%llu), service ID: (%@), volume: (%@)", buf, 0x30u);
    }

    BOOL v10 = [(CacheDeleteVolume *)self isRoot];
    BOOL v11 = 0;
    if (v7 && v10)
    {
      id v12 = [NSString stringWithFormat:@"Service (%@) has reported (%@) purgeable for a root volume (%@) with max size (%llu)", v7, v6, self, v8];
      CDSimulateCrash(195890387, v12);

      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v2 = [(CacheDeleteVolume *)self mountPoint];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSDictionary)thresholds
{
  return self->_thresholds;
}

@end