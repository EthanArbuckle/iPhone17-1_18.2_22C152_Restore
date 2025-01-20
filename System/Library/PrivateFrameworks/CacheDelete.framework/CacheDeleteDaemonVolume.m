@interface CacheDeleteDaemonVolume
+ (CacheDeleteDaemonVolume)volumeWithMountpoint:(id)a3;
+ (CacheDeleteDaemonVolume)volumeWithPath:(id)a3;
+ (id)createVolume:(id)a3 isPrimary:(BOOL)a4;
+ (void)invalidateVolumesCache:(id)a3;
- (BOOL)containerTotalSize:(unint64_t *)a3 andFreespace:(unint64_t *)a4;
- (BOOL)hasSnapshotsExcludingRegularExpression:(id)a3;
- (BOOL)hasSnapshotsExcludingTimeMachine;
- (BOOL)hasSnapshotsMatchingRegularExpression:(id)a3;
- (BOOL)isAPFSVolume;
- (BOOL)isSpecialVolume;
- (BOOL)isValid;
- (BOOL)primary;
- (BOOL)validate;
- (BOOL)validated;
- (CacheDeleteDaemonVolume)initWithPath:(id)a3;
- (CacheDeleteDaemonVolume)initWithPath:(id)a3 isPrimary:(BOOL)a4;
- (CacheDeleteDaemonVolume)initWithVolume:(id)a3;
- (NSArray)siblings;
- (NSDictionary)_thresholds;
- (NSUUID)uuid;
- (id)bsdDisk;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)snapshots;
- (id)snapshotsExcludingRegularExpression:(id)a3;
- (id)snapshotsExcludingTimeMachine;
- (id)snapshotsMatchingRegularExpression:(id)a3;
- (id)timeMachineSnapshotRegex;
- (unint64_t)quota;
- (unint64_t)reserve;
- (unsigned)role;
- (void)setIsValid:(BOOL)a3;
- (void)setQuota:(unint64_t)a3;
- (void)setReserve:(unint64_t)a3;
- (void)setValidated:(BOOL)a3;
@end

@implementation CacheDeleteDaemonVolume

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__thresholds, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

void __50__CacheDeleteDaemonVolume_createVolume_isPrimary___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)_MergedGlobals_1_0 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v5)
  {
    id v6 = [v5 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    v9 = CDGetLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v18 = 138412290;
      uint64_t v19 = v10;
      v11 = "CacheDeleteDaemonVolume createVolume: returned cached  CacheDeleteDaemonVolume from %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    v12 = [[CacheDeleteDaemonVolume alloc] initWithPath:*(void *)(a1 + 32) isPrimary:*(unsigned __int8 *)(a1 + 56)];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v15)
    {
      [(id)_MergedGlobals_1_0 setObject:v15 forKeyedSubscript:*(void *)(a1 + 32)];
      v9 = CDGetLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        int v18 = 138412290;
        uint64_t v19 = v16;
        v11 = "CacheDeleteDaemonVolume createVolume: created a CacheDeleteDaemonVolume from %@";
        goto LABEL_7;
      }
    }
    else
    {
      v9 = CDGetLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        int v18 = 138412290;
        uint64_t v19 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "CacheDeleteDaemonVolume createVolume: Unable to create a CacheDeleteDaemonVolume from %@", (uint8_t *)&v18, 0xCu);
      }
    }
  }
}

- (CacheDeleteDaemonVolume)initWithVolume:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CacheDeleteDaemonVolume;
  v5 = [(CacheDeleteDaemonVolume *)&v12 initWithVolume:v4];
  if (v5)
  {
    uint64_t v6 = [v4 uuid];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    v5->_primary = [v4 primary];
    v5->_reserve = (unint64_t)[v4 reserve];
    v5->_quota = (unint64_t)[v4 quota];
    v5->_isAPFSVolume = [v4 isAPFSVolume];
    v5->_role = (unsigned __int16)[v4 role];
    v8 = [v4 _thresholds];
    v9 = (NSDictionary *)[v8 copy];
    thresholds = v5->__thresholds;
    v5->__thresholds = v9;
  }
  return v5;
}

- (NSDictionary)_thresholds
{
  return self->__thresholds;
}

- (unint64_t)reserve
{
  return self->_reserve;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unint64_t)quota
{
  return self->_quota;
}

- (BOOL)primary
{
  return self->_primary;
}

- (BOOL)isAPFSVolume
{
  return self->_isAPFSVolume;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CacheDeleteDaemonVolume alloc];
  return [(CacheDeleteDaemonVolume *)v4 initWithVolume:self];
}

- (BOOL)isSpecialVolume
{
  unsigned int v3 = [(CacheDeleteDaemonVolume *)self role];
  if (v3)
  {
    int v4 = [(CacheDeleteDaemonVolume *)self role];
    LOBYTE(v3) = 1;
    if (v4 <= 191)
    {
      if ((v4 > 0x20 || ((1 << v4) & 0x100010112) == 0) && v4 != 128) {
        goto LABEL_19;
      }
    }
    else if (v4 <= 383)
    {
      if (v4 != 192 && v4 != 256 && v4 != 320) {
        goto LABEL_19;
      }
    }
    else if (v4 > 511)
    {
      if (v4 != 512 && v4 != 640) {
        goto LABEL_19;
      }
    }
    else if (v4 != 384 && v4 != 448)
    {
LABEL_19:
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (unsigned)role
{
  return self->_role;
}

- (BOOL)validate
{
  uint64_t v2 = self;
  if (self->_validated)
  {
    LOBYTE(self) = self->_isValid;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CacheDeleteDaemonVolume;
    LODWORD(self) = [(CacheDeleteDaemonVolume *)&v4 validate];
    if (self) {
      LOBYTE(self) = ![(CacheDeleteDaemonVolume *)v2 isSpecialVolume];
    }
    v2->_isValid = (char)self;
    v2->_validated = 1;
  }
  return (char)self;
}

- (BOOL)hasSnapshotsExcludingTimeMachine
{
  uint64_t v2 = self;
  unsigned int v3 = [(CacheDeleteDaemonVolume *)self timeMachineSnapshotRegex];
  LOBYTE(v2) = [(CacheDeleteDaemonVolume *)v2 hasSnapshotsExcludingRegularExpression:v3];

  return (char)v2;
}

- (id)timeMachineSnapshotRegex
{
  return +[NSRegularExpression regularExpressionWithPattern:@"^com\\.apple\\.mobilebackup" options:0 error:0];
}

- (BOOL)hasSnapshotsExcludingRegularExpression:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v5 = [(CacheDeleteDaemonVolume *)self mountPoint];
  uint64_t v6 = (const char *)[v5 fileSystemRepresentation];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __77__CacheDeleteDaemonVolume_Snapshots__hasSnapshotsExcludingRegularExpression___block_invoke;
  v14[3] = &unk_10005D9D8;
  id v7 = v4;
  id v15 = v7;
  uint64_t v16 = self;
  uint64_t v17 = &v18;
  LODWORD(v6) = enumerate_snapshots(v6, v14);

  if (v6)
  {
    v8 = CDGetLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = [(CacheDeleteDaemonVolume *)self mountPoint];
      objc_super v12 = __error();
      uint64_t v13 = strerror(*v12);
      *(_DWORD *)buf = 138412546;
      v23 = v11;
      __int16 v24 = 2080;
      v25 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to enumerate snapshots for volume %@: %s", buf, 0x16u);
    }
  }
  BOOL v9 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __77__CacheDeleteDaemonVolume_Snapshots__hasSnapshotsExcludingRegularExpression___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v5 = +[NSString stringWithUTF8String:a2 + 16];
  if (!objc_msgSend(*(id *)(a1 + 32), "numberOfMatchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length")))
  {
    uint64_t v6 = CDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 40) mountPoint];
      int v8 = 138412546;
      BOOL v9 = v7;
      __int16 v10 = 2112;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "hasSnapshotsExcludingRegularExpression %@: %@", (uint8_t *)&v8, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
}

+ (CacheDeleteDaemonVolume)volumeWithMountpoint:(id)a3
{
  id v3 = a3;
  id v4 = +[CacheDeleteDaemonVolume volumeWithPath:v3];
  id v5 = [v4 mountPoint];
  uint64_t v6 = [v5 stringByStandardizingPath];
  id v7 = [v3 stringByStandardizingPath];

  LODWORD(v3) = [v6 isEqualToString:v7];
  if (v3) {
    id v8 = v4;
  }
  else {
    id v8 = 0;
  }

  return (CacheDeleteDaemonVolume *)v8;
}

+ (CacheDeleteDaemonVolume)volumeWithPath:(id)a3
{
  id v3 = a3;
  id v4 = +[CacheDeleteDaemonVolume validateVolumeAtPath:v3];
  if (v4)
  {
    id v5 = +[CacheDeleteDaemonVolume createVolume:v4 isPrimary:1];
  }
  else
  {
    uint64_t v6 = CDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "CacheDeleteDaemonVolume volumeWithPath Unable to validate mount point for: %@", (uint8_t *)&v8, 0xCu);
    }

    id v5 = 0;
  }

  return (CacheDeleteDaemonVolume *)v5;
}

+ (id)createVolume:(id)a3 isPrimary:(BOOL)a4
{
  id v5 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__7;
  char v21 = __Block_byref_object_dispose__7;
  id v22 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__7;
  v15[4] = __Block_byref_object_dispose__7;
  id v16 = 0;
  if (qword_10006A880 != -1) {
    dispatch_once(&qword_10006A880, &__block_literal_global_6);
  }
  uint64_t v6 = qword_10006A888;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __50__CacheDeleteDaemonVolume_createVolume_isPrimary___block_invoke_2;
  v10[3] = &unk_10005DF20;
  id v11 = v5;
  objc_super v12 = v15;
  uint64_t v13 = &v17;
  BOOL v14 = a4;
  id v7 = v5;
  dispatch_sync(v6, v10);
  id v8 = (id)v18[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);

  return v8;
}

- (id)bsdDisk
{
  return 0;
}

- (NSArray)siblings
{
  id v3 = +[NSMutableArray array];
  mach_port_t v4 = kIOMainPortDefault;
  v28 = self;
  id v5 = [(CacheDeleteDaemonVolume *)self bsdName];
  CFDictionaryRef v6 = IOBSDNameMatching(kIOMainPortDefault, 0, (const char *)[v5 UTF8String] + 5);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);

  if (MatchingService)
  {
    id v8 = IORegistryEntryCreateCFProperty(MatchingService, @"BSD Unit", kCFAllocatorDefault, 0);
  }
  else
  {
    id v8 = 0;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  getLocalVolumes();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v31;
    *(void *)&long long v10 = 138412802;
    long long v26 = v10;
    v27 = v8;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v15 = +[CacheDeleteVolume volumeWithMountpoint:](CacheDeleteVolume, "volumeWithMountpoint:", v14, v26);
        id v16 = v15;
        if (v15)
        {
          id v17 = [v15 bsdName];
          CFDictionaryRef v18 = IOBSDNameMatching(v4, 0, (const char *)[v17 UTF8String] + 5);
          io_service_t v19 = IOServiceGetMatchingService(v4, v18);

          if (v19)
          {
            uint64_t v20 = IORegistryEntryCreateCFProperty(v19, @"BSD Unit", kCFAllocatorDefault, 0);
            if ([v8 isEqual:v20])
            {
              char v21 = CDGetLogHandle();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                id v22 = [v16 bsdName];
                [(CacheDeleteDaemonVolume *)v28 bsdName];
                __int16 v24 = v23 = v3;
                *(_DWORD *)buf = v26;
                uint64_t v35 = v14;
                __int16 v36 = 2112;
                v37 = v22;
                __int16 v38 = 2112;
                v39 = v24;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "adding %@ %@ %@", buf, 0x20u);

                id v3 = v23;
                mach_port_t v4 = kIOMainPortDefault;

                id v8 = v27;
              }

              [v3 addObject:v16];
            }
          }
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v11);
  }

  return (NSArray *)v3;
}

- (id)snapshots
{
  id v3 = objc_opt_new();
  id v4 = [(CacheDeleteDaemonVolume *)self mountPoint];
  id v5 = (const char *)[v4 fileSystemRepresentation];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __47__CacheDeleteDaemonVolume_Snapshots__snapshots__block_invoke;
  v12[3] = &unk_10005D960;
  id v6 = v3;
  id v13 = v6;
  LODWORD(v5) = enumerate_snapshots(v5, v12);

  if (v5)
  {
    id v7 = CDGetLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = [(CacheDeleteDaemonVolume *)self mountPoint];
      long long v10 = __error();
      id v11 = strerror(*v10);
      *(_DWORD *)buf = 138412546;
      id v15 = v9;
      __int16 v16 = 2080;
      id v17 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to enumerate snapshots for volume %@: %s", buf, 0x16u);
    }
  }

  return v6;
}

void __47__CacheDeleteDaemonVolume_Snapshots__snapshots__block_invoke(uint64_t a1, void *a2)
{
  id v6 = +[NSString stringWithUTF8String:a2 + 2];
  id v4 = *(void **)(a1 + 32);
  id v5 = [[CacheDeleteSnapshotInfo alloc] initWithName:v6 uid:*a2];
  [v4 addObject:v5];
}

- (BOOL)hasSnapshotsMatchingRegularExpression:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  id v5 = [(CacheDeleteDaemonVolume *)self mountPoint];
  id v6 = (const char *)[v5 fileSystemRepresentation];
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  __int16 v16 = __76__CacheDeleteDaemonVolume_Snapshots__hasSnapshotsMatchingRegularExpression___block_invoke;
  id v17 = &unk_10005D988;
  id v7 = v4;
  id v18 = v7;
  io_service_t v19 = &v20;
  LODWORD(v6) = enumerate_snapshots(v6, &v14);

  if (v6)
  {
    id v8 = CDGetLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v11 = [(CacheDeleteDaemonVolume *)self mountPoint];
      uint64_t v12 = __error();
      id v13 = strerror(*v12);
      *(_DWORD *)buf = 138412546;
      v25 = v11;
      __int16 v26 = 2080;
      v27 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to enumerate shapshots for volume %@: %s", buf, 0x16u);
    }
  }
  BOOL v9 = *((unsigned char *)v21 + 24) != 0;

  _Block_object_dispose(&v20, 8);
  return v9;
}

void __76__CacheDeleteDaemonVolume_Snapshots__hasSnapshotsMatchingRegularExpression___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v5 = +[NSString stringWithUTF8String:a2 + 16];
  if (objc_msgSend(*(id *)(a1 + 32), "numberOfMatchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length")))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (id)snapshotsMatchingRegularExpression:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(CacheDeleteDaemonVolume *)self mountPoint];
  id v7 = (const char *)[v6 fileSystemRepresentation];
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  io_service_t v19 = __73__CacheDeleteDaemonVolume_Snapshots__snapshotsMatchingRegularExpression___block_invoke;
  uint64_t v20 = &unk_10005D9B0;
  id v21 = v4;
  id v8 = v5;
  id v22 = v8;
  id v9 = v4;
  LODWORD(v7) = enumerate_snapshots(v7, &v17);

  if (v7)
  {
    long long v10 = CDGetLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [(CacheDeleteDaemonVolume *)self mountPoint];
      uint64_t v15 = __error();
      __int16 v16 = strerror(*v15);
      *(_DWORD *)buf = 138412546;
      __int16 v24 = v14;
      __int16 v25 = 2080;
      __int16 v26 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to enumerate snapshots for volume %@: %s", buf, 0x16u);
    }
  }
  id v11 = v22;
  id v12 = v8;

  return v12;
}

void __73__CacheDeleteDaemonVolume_Snapshots__snapshotsMatchingRegularExpression___block_invoke(uint64_t a1, void *a2)
{
  id v6 = +[NSString stringWithUTF8String:a2 + 2];
  if (objc_msgSend(*(id *)(a1 + 32), "numberOfMatchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")))
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = [[CacheDeleteSnapshotInfo alloc] initWithName:v6 uid:*a2];
    [v4 addObject:v5];
  }
}

- (id)snapshotsExcludingRegularExpression:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(CacheDeleteDaemonVolume *)self mountPoint];
  id v7 = (const char *)[v6 fileSystemRepresentation];
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  io_service_t v19 = __74__CacheDeleteDaemonVolume_Snapshots__snapshotsExcludingRegularExpression___block_invoke;
  uint64_t v20 = &unk_10005D9B0;
  id v21 = v4;
  id v8 = v5;
  id v22 = v8;
  id v9 = v4;
  LODWORD(v7) = enumerate_snapshots(v7, &v17);

  if (v7)
  {
    long long v10 = CDGetLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [(CacheDeleteDaemonVolume *)self mountPoint];
      uint64_t v15 = __error();
      __int16 v16 = strerror(*v15);
      *(_DWORD *)buf = 138412546;
      __int16 v24 = v14;
      __int16 v25 = 2080;
      __int16 v26 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to enumerate snapshots for volume %@: %s", buf, 0x16u);
    }
  }
  id v11 = v22;
  id v12 = v8;

  return v12;
}

void __74__CacheDeleteDaemonVolume_Snapshots__snapshotsExcludingRegularExpression___block_invoke(uint64_t a1, void *a2)
{
  id v6 = +[NSString stringWithUTF8String:a2 + 2];
  if (!objc_msgSend(*(id *)(a1 + 32), "numberOfMatchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")))
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = [[CacheDeleteSnapshotInfo alloc] initWithName:v6 uid:*a2];
    [v4 addObject:v5];
  }
}

- (id)snapshotsExcludingTimeMachine
{
  id v3 = [(CacheDeleteDaemonVolume *)self timeMachineSnapshotRegex];
  id v4 = [(CacheDeleteDaemonVolume *)self snapshotsExcludingRegularExpression:v3];

  return v4;
}

- (CacheDeleteDaemonVolume)initWithPath:(id)a3 isPrimary:(BOOL)a4
{
  v20.receiver = self;
  v20.super_class = (Class)CacheDeleteDaemonVolume;
  id v5 = [(CacheDeleteDaemonVolume *)&v20 initWithPath:a3];
  id v6 = v5;
  if (v5)
  {
    id v7 = [(CacheDeleteDaemonVolume *)v5 fsType];

    if (v7)
    {
      id v8 = [(CacheDeleteDaemonVolume *)v6 fsType];
      v6->_isAPFSVolume = strcmp((const char *)[v8 UTF8String], "apfs") == 0;
    }
    else
    {
      v6->_isAPFSVolume = 1;
    }
    uint64_t v9 = [(CacheDeleteDaemonVolume *)v6 bsdName];
    if (v9)
    {
      long long v10 = (void *)v9;
      id v11 = [(CacheDeleteDaemonVolume *)v6 bsdName];
      [v11 UTF8String];
      int v12 = APFSVolumeRole();

      if (v12) {
        v6->_role = 0;
      }
    }
    id v13 = [(CacheDeleteDaemonVolume *)v6 mountPoint];
    [v13 UTF8String];
    uint64_t v14 = VolUUID();
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v14;

    v6->_primary = a4;
    id v16 = [(CacheDeleteDaemonVolume *)v6 mountPoint];
    [v16 UTF8String];
    uint64_t v17 = thresholdsForMountPoint();
    thresholds = v6->__thresholds;
    v6->__thresholds = (NSDictionary *)v17;

    v6->_validated = 0;
  }
  return v6;
}

- (CacheDeleteDaemonVolume)initWithPath:(id)a3
{
  return [(CacheDeleteDaemonVolume *)self initWithPath:a3 isPrimary:1];
}

void __50__CacheDeleteDaemonVolume_createVolume_isPrimary___block_invoke(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.cache_delete.volumes", 0);
  uint64_t v2 = (void *)qword_10006A888;
  qword_10006A888 = (uint64_t)v1;

  _MergedGlobals_1_0 = objc_opt_new();
  _objc_release_x1();
}

+ (void)invalidateVolumesCache:(id)a3
{
  id v3 = a3;
  id v4 = CDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CacheDeleteDaemonVolume invalidateVolumesCache  UUID %@", buf, 0xCu);
  }

  if (_MergedGlobals_1_0)
  {
    id v5 = qword_10006A888;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __50__CacheDeleteDaemonVolume_invalidateVolumesCache___block_invoke;
    block[3] = &unk_10005CD00;
    id v7 = v3;
    dispatch_sync(v5, block);
  }
}

void __50__CacheDeleteDaemonVolume_invalidateVolumesCache___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v2 = [(id)_MergedGlobals_1_0 allValues];
    id v3 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v18;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v18 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v8 = CDGetLogHandle();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            id v9 = [v7 uuid];
            *(_DWORD *)buf = 138412290;
            id v22 = v9;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CacheDeleteDaemonVolume invalidateVolumesCache %@", buf, 0xCu);
          }
          long long v10 = [v7 uuid];
          unsigned int v11 = [v10 isEqual:*(void *)(a1 + 32)];

          if (v11)
          {
            int v12 = CDGetLogHandle();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              id v13 = [v7 mountPoint];
              *(_DWORD *)buf = 138412290;
              id v22 = v13;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CacheDeleteDaemonVolume invalidateVolumesCache removing %@", buf, 0xCu);
            }
            uint64_t v14 = (void *)_MergedGlobals_1_0;
            uint64_t v15 = [v7 mountPoint];
            [v14 removeObjectForKey:v15];
          }
        }
        id v4 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v4);
    }
  }
  else
  {
    id v16 = CDGetLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CacheDeleteDaemonVolume invalidateVolumesCache invalid UUID", buf, 2u);
    }

    [(id)_MergedGlobals_1_0 removeAllObjects];
  }
}

- (BOOL)containerTotalSize:(unint64_t *)a3 andFreespace:(unint64_t *)a4
{
  [@"disk0s1" UTF8String];
  int SpaceInfo = APFSContainerGetSpaceInfo();
  if (SpaceInfo)
  {
    uint64_t v5 = CDGetLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "-[CacheDeleteDaemonVolume containerTotalSize:andFreespace:]";
      __int16 v9 = 1024;
      int v10 = SpaceInfo;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s : Failed to get container info - err: [%d]", (uint8_t *)&v7, 0x12u);
    }
  }
  return SpaceInfo == 0;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CacheDeleteDaemonVolume;
  uint64_t v2 = [(CacheDeleteDaemonVolume *)&v4 description];
  return v2;
}

- (void)setReserve:(unint64_t)a3
{
  self->_reserve = a3;
}

- (void)setQuota:(unint64_t)a3
{
  self->_quota = a3;
}

- (BOOL)validated
{
  return self->_validated;
}

- (void)setValidated:(BOOL)a3
{
  self->_validated = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

@end