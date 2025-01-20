@interface DSVolumeManager
+ (id)_filterVolumes:(id)a3 usingAllowList:(id)a4;
- (BOOL)_discoverVolumesUsingStatFSProvider:(id)a3 usedBytesProvider:(id)a4 error:(id *)a5;
- (BOOL)discoverVolumesWithError:(id *)a3;
- (DSSnapshotRequest)_snapshotRequest;
- (NSArray)_allVolumes;
- (NSArray)volumesForSnapshotting;
- (NSDictionary)allVolumesInfoDict;
- (id)__stockStatFSProvider;
- (id)__stockUsedBytesProvider;
- (id)initForSnapshotRequest:(id)a3;
@end

@implementation DSVolumeManager

+ (id)_filterVolumes:(id)a3 usingAllowList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v25;
    *(void *)&long long v10 = 138543618;
    long long v23 = v10;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (!objc_msgSend(v14, "shouldListContents", v23, (void)v24)
          || v6
          && [v6 count]
          && ([v14 mountPoint],
              v15 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v16 = [v6 containsObject:v15],
              v15,
              (v16 & 1) == 0))
        {
          v18 = shared_filesystem_metadata_snapshot_service_log_handle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v19 = [v14 _flags];
            *(_DWORD *)buf = v23;
            v29 = v14;
            __int16 v30 = 1024;
            unsigned int v31 = v19;
            _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Skipping volume %{public}@ (flags: %u)", buf, 0x12u);
          }
        }
        else
        {
          v17 = shared_filesystem_metadata_snapshot_service_log_handle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v20 = [v14 _flags];
            *(_DWORD *)buf = v23;
            v29 = v14;
            __int16 v30 = 1024;
            unsigned int v31 = v20;
            _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Including volume %{public}@ (flags: %u)", buf, 0x12u);
          }

          [v7 addObject:v14];
        }
      }
      id v11 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v11);
  }

  id v21 = [v7 copy];

  return v21;
}

- (id)__stockStatFSProvider
{
  if (qword_10006A7B8 != -1) {
    dispatch_once(&qword_10006A7B8, &stru_100064A78);
  }
  id v2 = objc_retainBlock((id)qword_10006A7B0);

  return v2;
}

- (id)__stockUsedBytesProvider
{
  if (qword_10006A7C8 != -1) {
    dispatch_once(&qword_10006A7C8, &stru_100064AD8);
  }
  id v2 = objc_retainBlock((id)qword_10006A7C0);

  return v2;
}

- (NSDictionary)allVolumesInfoDict
{
  id v2 = self;
  allVolumesInfoDict = self->_allVolumesInfoDict;
  if (!allVolumesInfoDict)
  {
    id v23 = objc_alloc_init((Class)NSMutableDictionary);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = [(DSVolumeManager *)v2 _allVolumes];
    id v24 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v24)
    {
      uint64_t v22 = *(void *)v34;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(obj);
          }
          id v5 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v6 = [(DSVolumeManager *)v2 volumesForSnapshotting];
          id v7 = [v6 containsObject:v5];

          v39[0] = @"PurgeableRecordsFilename";
          v32 = [v5 safeFilenameForPurgeableRecordsListing];
          v40[0] = v32;
          v39[1] = @"SharedExtentsFilename";
          unsigned int v31 = [v5 safeFilenameForSharedExtentsListing];
          v40[1] = v31;
          v39[2] = @"DirStatsDataFilename";
          __int16 v30 = [v5 safeFilenameForDirStatsDataListing];
          v40[2] = v30;
          v39[3] = @"AttributionTagFilename";
          v29 = [v5 safeFilenameForAttributionTagsListing];
          v40[3] = v29;
          v39[4] = @"FSListingFilename";
          v28 = [v5 safeFilenameForListing];
          v40[4] = v28;
          v39[5] = @"MountedFrom";
          long long v27 = [v5 mountedFrom];
          v40[5] = v27;
          v39[6] = @"MountPoint";
          long long v26 = [v5 mountPoint];
          v40[6] = v26;
          v39[7] = @"FSTypeName";
          long long v25 = [v5 _filesystemTypeName];
          v40[7] = v25;
          v39[8] = @"IsRootVolume";
          id v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isRootVolume]);
          v40[8] = v8;
          v39[9] = @"FSFlags";
          id v9 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v5 _flags]);
          v40[9] = v9;
          v39[10] = @"HasFSListing";
          long long v10 = +[NSNumber numberWithBool:v7];
          v40[10] = v10;
          v39[11] = @"CapacityBytes";
          id v11 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v5 capacityBytes]);
          v40[11] = v11;
          v39[12] = @"UsedBytes";
          uint64_t v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v5 usedBytes]);
          v40[12] = v12;
          v39[13] = @"FreeBytes";
          v13 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v5 freeBytes]);
          v40[13] = v13;
          +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:14];
          v15 = v14 = v2;
          unsigned __int8 v16 = [v5 mountPoint];
          [v23 setObject:v15 forKeyedSubscript:v16];

          id v2 = v14;
        }
        id v24 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v24);
    }

    CFStringRef v37 = @"Volumes";
    id v17 = [v23 copy];
    id v38 = v17;
    uint64_t v18 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    unsigned int v19 = v2->_allVolumesInfoDict;
    v2->_allVolumesInfoDict = (NSDictionary *)v18;

    allVolumesInfoDict = v2->_allVolumesInfoDict;
  }

  return allVolumesInfoDict;
}

- (BOOL)_discoverVolumesUsingStatFSProvider:(id)a3 usedBytesProvider:(id)a4 error:(id *)a5
{
  id v8 = (uint64_t (**)(id, uint8_t *, _DWORD *, id *))a3;
  id v9 = a4;
  long long v10 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Discovering volumes", buf, 2u);
  }

  if (!v8)
  {
    v28 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_100031BA0(v28, v29, v30);
    }

    NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
    CFStringRef v46 = @"StatFS provider cannot be nil";
    unsigned int v31 = &v46;
    v32 = &v45;
    goto LABEL_23;
  }
  if (!v9)
  {
    long long v33 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_100031C1C(v33, v34, v35);
    }

    NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
    CFStringRef v44 = @"Used bytes provider cannot be nil";
    unsigned int v31 = &v44;
    v32 = &v43;
LABEL_23:
    long long v36 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v32 count:1];
    id v13 = +[NSError errorWithDomain:@"com.apple.FilesystemMetadataSnapshot" code:65540 userInfo:v36];

    if (a5)
    {
      id v13 = v13;
      BOOL v14 = 0;
      *a5 = v13;
    }
    else
    {
      BOOL v14 = 0;
    }
    goto LABEL_32;
  }
  *(void *)buf = 0;
  unsigned int v39 = 0;
  id v38 = 0;
  char v12 = v8[2](v8, buf, &v39, &v38);
  id v13 = v38;
  if (v13) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = v12;
  }
  v15 = shared_filesystem_metadata_snapshot_service_log_handle();
  unsigned __int8 v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v41 = 67109120;
      unsigned int v42 = v39;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Found %d volumes", v41, 8u);
    }

    uint64_t v18 = +[DSVolume _volumeInfoFromStatFS:*(void *)buf count:v39 usedBytesProvider:v9 volumeManager:self];
    allVolumes = self->__allVolumes;
    self->__allVolumes = v18;

    if (*(void *)buf) {
      free(*(void **)buf);
    }
    unsigned int v20 = [(DSVolumeManager *)self _snapshotRequest];
    id v21 = [v20 options];
    uint64_t v22 = [v21 objectForKeyedSubscript:@"FilesystemMetadatSnapshotOptionMountPointsAllowListArray"];

    id v23 = objc_opt_class();
    id v24 = [(DSVolumeManager *)self _allVolumes];
    long long v25 = [v23 _filterVolumes:v24 usingAllowList:v22];
    volumesForSnapshotting = self->_volumesForSnapshotting;
    self->_volumesForSnapshotting = v25;

    long long v27 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_100031C98(self);
    }

    if (a5) {
      *a5 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100031A98(v13);
    }

    if (a5) {
      *a5 = v13;
    }
    if (*(void *)buf) {
      free(*(void **)buf);
    }
  }
LABEL_32:

  return v14;
}

- (BOOL)discoverVolumesWithError:(id *)a3
{
  id v5 = [(DSVolumeManager *)self __stockStatFSProvider];
  id v6 = [(DSVolumeManager *)self __stockUsedBytesProvider];
  LOBYTE(a3) = [(DSVolumeManager *)self _discoverVolumesUsingStatFSProvider:v5 usedBytesProvider:v6 error:a3];

  return (char)a3;
}

- (id)initForSnapshotRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)DSVolumeManager;
    id v5 = [(DSVolumeManager *)&v9 init];
    id v6 = v5;
    if (v5) {
      objc_storeWeak((id *)&v5->__snapshotRequest, v4);
    }
    self = v6;
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSArray)volumesForSnapshotting
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (DSSnapshotRequest)_snapshotRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__snapshotRequest);

  return (DSSnapshotRequest *)WeakRetained;
}

- (NSArray)_allVolumes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__allVolumes, 0);
  objc_destroyWeak((id *)&self->__snapshotRequest);
  objc_storeStrong((id *)&self->_volumesForSnapshotting, 0);

  objc_storeStrong((id *)&self->_allVolumesInfoDict, 0);
}

@end