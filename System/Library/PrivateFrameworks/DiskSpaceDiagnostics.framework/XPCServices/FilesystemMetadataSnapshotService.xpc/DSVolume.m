@interface DSVolume
+ (BOOL)__checkAttributionTagsCapabilityForVolume:(id)a3;
+ (BOOL)__checkDirStatsDataCapabilityForVolume:(id)a3;
+ (BOOL)__checkPurgeableFilesCapabilityForVolume:(id)a3;
+ (BOOL)_isDirectoryPartOfSAFHierarchy:(id)a3;
+ (id)_safeFilenameForListingVolume:(id)a3 pathExtension:(id)a4;
+ (id)_safeStringFromStatFSCString:(const char *)a3;
+ (id)_volumeInfoFromStatFS:(statfs *)a3 count:(int)a4 usedBytesProvider:(id)a5 volumeManager:(id)a6;
+ (void)_getAttributionTagPathsInDirectory:(id)a3 reply:(id)a4;
+ (void)_getDirStatsType:(id)a3 reply:(id)a4;
+ (void)_getPurgeableRecordsInfo:(id)a3 reply:(id)a4;
+ (void)_getSharedExtensInfo:(id)a3 reply:(id)a4;
- (BOOL)hasPurgeableFilesCapability;
- (BOOL)isRootVolume;
- (BOOL)listContentsWithEntryCount:(unint64_t *)a3 andError:(id *)a4;
- (BOOL)shouldCollectDirStatsData;
- (BOOL)shouldListContents;
- (BOOL)supportsAttributionTags;
- (BOOL)supportsPurgeableRecords;
- (BOOL)supportsSharedExtents;
- (DSVolumeManager)_volumeManager;
- (NSMutableSet)__hashes;
- (NSProgress)progress;
- (NSString)_filesystemTypeName;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)mountPoint;
- (NSString)mountedFrom;
- (NSString)safeFilenameForAttributionTagsListing;
- (NSString)safeFilenameForDirStatsDataListing;
- (NSString)safeFilenameForListing;
- (NSString)safeFilenameForPurgeableRecordsListing;
- (NSString)safeFilenameForSharedExtentsListing;
- (id)_initWithStatFS:(statfs *)a3 usedBytesProvider:(id)a4 volumeManager:(id)a5;
- (id)_pathRepresentationForListing:(char *)a3 isDirectory:(BOOL)a4;
- (unint64_t)capacityBytes;
- (unint64_t)freeBytes;
- (unint64_t)usedBytes;
- (unsigned)_flags;
@end

@implementation DSVolume

+ (BOOL)__checkPurgeableFilesCapabilityForVolume:(id)a3
{
  uint64_t v9 = 0;
  id v3 = [a3 mountPoint];
  int v4 = fsctl((const char *)[v3 UTF8String], 0x40084A47uLL, &v9, 0);

  if (!v4) {
    return 1;
  }
  int v5 = *__error();
  return v5 != 2 && v5 != 25 && v5 != 45;
}

+ (BOOL)__checkAttributionTagsCapabilityForVolume:(id)a3
{
  id v3 = a3;
  int v13 = 0;
  id v4 = [v3 mountPoint];
  int v5 = fsctl((const char *)[v4 UTF8String], 0xC0044A75uLL, &v13, 0);

  if (v5)
  {
    v6 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = __error();
      v8 = strerror(*v7);
      id v9 = [v3 mountPoint];
      id v10 = [v9 UTF8String];
      *(_DWORD *)buf = 136315394;
      v15 = v8;
      __int16 v16 = 2080;
      id v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to get attribution tags flags with error (%s) (%s)", buf, 0x16u);
    }
    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = v13 == 1;
  }

  return v11;
}

+ (BOOL)__checkDirStatsDataCapabilityForVolume:(id)a3
{
  id v3 = a3;
  int v14 = 0;
  memset(v13, 0, sizeof(v13));
  objc_msgSend(v3, "mountPoint", 5, 0x20000, 0);
  id v4 = objc_claimAutoreleasedReturnValue();
  int v5 = getattrlist((const char *)[v4 UTF8String], &v12, v13, 0x24uLL, 0);

  if (v5)
  {
    v6 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = __error();
      v8 = strerror(*v7);
      id v9 = [v3 mountPoint];
      id v10 = [v9 UTF8String];
      *(_DWORD *)buf = 136315394;
      __int16 v16 = v8;
      __int16 v17 = 2080;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attrlist failed with error (%s) (%s)", buf, 0x16u);
    }
    LOBYTE(v6) = 0;
  }
  else
  {
    LODWORD(v6) = (BYTE7(v13[0]) >> 2) & 1;
  }

  return (char)v6;
}

+ (id)_volumeInfoFromStatFS:(statfs *)a3 count:(int)a4 usedBytesProvider:(id)a5 volumeManager:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  BOOL v11 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v17[0] = 67109120;
    v17[1] = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Creating DSVolumes for %d statfs entries", (uint8_t *)v17, 8u);
  }

  long long v12 = +[NSMutableArray array];
  if (a3 && a4 >= 1)
  {
    uint64_t v13 = a4;
    do
    {
      id v14 = [[DSVolume alloc] _initWithStatFS:a3 usedBytesProvider:v9 volumeManager:v10];
      [v12 addObject:v14];

      ++a3;
      --v13;
    }
    while (v13);
  }
  id v15 = [v12 copy];

  return v15;
}

+ (id)_safeFilenameForListingVolume:(id)a3 pathExtension:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_10006A778 != -1) {
    dispatch_once(&qword_10006A778, &stru_1000649B0);
  }
  if ([v5 isRootVolume])
  {
    v7 = @"RootVolume";
  }
  else
  {
    v8 = [v5 mountPoint];
    v7 = [v8 stringByTrimmingCharactersInSet:qword_10006A770];
  }
  id v9 = [v5 mountedFrom];
  id v10 = [v9 stringByTrimmingCharactersInSet:qword_10006A770];
  BOOL v11 = +[NSString stringWithFormat:@"%@-%@", v7, v10];

  long long v12 = [v11 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

  if ((unint64_t)[v12 length] >= 0x33)
  {
    uint64_t v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v12 hash]);

    long long v12 = (void *)v13;
  }
  id v14 = +[NSString stringWithFormat:@"%@.%@", v12, v6];

  return v14;
}

+ (id)_safeStringFromStatFSCString:(const char *)a3
{
  id v4 = +[NSString stringWithCString:a3 encoding:4];
  if (!v4)
  {
    id v5 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100031168();
    }

    id v4 = +[NSString stringWithCString:a3 encoding:4];
    if (!v4) {
      goto LABEL_6;
    }
  }
  if (![(__CFString *)v4 length])
  {
LABEL_6:
    id v6 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000310FC();
    }

    id v4 = @"UNKNOWN";
  }
  v7 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100031078();
  }

  return v4;
}

+ (void)_getAttributionTagPathsInDirectory:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id, uint64_t, void))a4;
  v38[1] = 0;
  v38[2] = 0x80000000000;
  v38[0] = 0xA000000900000005;
  v7 = (unsigned int *)malloc_type_malloc(0x8000uLL, 0x80A2B5F5uLL);
  if (v7)
  {
    v8 = v7;
    id v37 = v5;
    int v9 = open((const char *)[v37 fileSystemRepresentation], 1048832);
    if (v9 < 0)
    {
      v29 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_100031260(v37);
      }

      free(v8);
    }
    else
    {
      id v32 = v5;
      v33 = v8;
      int v34 = v9;
      v35 = v6;
      v36 = 0;
      id v11 = 0;
      *(void *)&long long v10 = 136315394;
      long long v31 = v10;
LABEL_4:
      long long v12 = v33;
      while (1)
      {
        int v13 = getattrlistbulk(v34, v38, v33, 0x8000uLL, 0x20uLL);
        if (v13 == -1) {
          break;
        }
        int v14 = v13;
        if (!v13) {
          goto LABEL_37;
        }
        if (v13 >= 1)
        {
          while (1)
          {
            uint64_t v17 = *v12;
            unsigned int v18 = v12[1];
            unsigned int v19 = v12[5];
            if ((v18 & 0x20000000) == 0) {
              break;
            }
            unsigned int v26 = v12[6];
            if (v26)
            {
              v27 = shared_filesystem_metadata_snapshot_service_log_handle();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                id v16 = [v37 fileSystemRepresentation];
                *(_DWORD *)buf = v31;
                *(void *)&uint8_t buf[4] = v16;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v26;
                _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Error while processing directory %s for attribution tags: %d", buf, 0x12u);
              }

              goto LABEL_26;
            }
            id v15 = (int *)(v12 + 7);
            if (v18) {
              goto LABEL_13;
            }
LABEL_14:
            if ((v18 & 8) != 0 && *v15 == 1 && (v19 & 0x800) != 0)
            {
              uint64_t v24 = *(void *)(v15 + 1);
              if (v24)
              {
                memset(v41, 0, 256);
                *(_OWORD *)&buf[8] = 0u;
                long long v40 = 0u;
                *(void *)buf = v24;
                id v11 = v11;
                if (!fsctl((const char *)[v11 fileSystemRepresentation], 0xC1284A72uLL, buf, 0))
                {
                  uint64_t v25 = +[NSString stringWithUTF8String:v41];

                  v35[2](v35, v11, v25, *(void *)buf);
                  v36 = (void *)v25;
                }
              }
            }
LABEL_26:
            long long v12 = (unsigned int *)((char *)v12 + v17);
            if (!--v14) {
              goto LABEL_4;
            }
          }
          id v15 = (int *)(v12 + 6);
          if ((v18 & 1) == 0) {
            goto LABEL_14;
          }
LABEL_13:
          v20 = v15 + 2;
          v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", (char *)v15 + *v15, v31);
          uint64_t v22 = [v37 stringByAppendingPathComponent:v21];

          id v15 = v20;
          id v11 = (id)v22;
          goto LABEL_14;
        }
      }
      v30 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_1000312EC();
      }

LABEL_37:
      free(v33);
      close(v34);

      id v5 = v32;
      id v6 = v35;
    }
  }
  else
  {
    v28 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1000311D4(v5);
    }
  }
}

+ (BOOL)_isDirectoryPartOfSAFHierarchy:(id)a3
{
  uint64_t v6 = 0;
  id v3 = a3;
  if (fsctl((const char *)[v3 fileSystemRepresentation], 0x40084A25uLL, &v6, 0))
  {
    id v4 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003136C(v3);
    }

    LOBYTE(v4) = 0;
  }
  else
  {
    LODWORD(v4) = (BYTE3(v6) >> 5) & 1;
  }

  return (char)v4;
}

+ (void)_getDirStatsType:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v9 = 0;
  unint64_t v10 = 1;
  id v7 = v5;
  if (fsctl((const char *)objc_msgSend(v7, "fileSystemRepresentation", 0), 0xC1104A71uLL, &v9, 0))
  {
    if (*__error() != 45)
    {
      v8 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000313E8(v7);
      }
    }
    (*((void (**)(id, id, void, void))v6 + 2))(v6, v7, 0, 0);
  }
  else
  {
    (*((void (**)(id, id, uint64_t, unint64_t))v6 + 2))(v6, v7, 1, (v10 >> 2) & 1);
  }
}

+ (void)_getSharedExtensInfo:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = (const char *)[a3 fileSystemRepresentation];
  id v7 = (char *)malloc_type_malloc(0x27100uLL, 0x1000040F6D918ACuLL);
  if (v7)
  {
    v8 = v7;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = v7;
    LODWORD(v20) = 160000;
    uint64_t v9 = v7 + 16;
    while (!fsctl(v6, 0xC0284A7DuLL, &v19, 0))
    {
      if (DWORD1(v20))
      {
        unint64_t v10 = 0;
        uint64_t v11 = DWORD2(v20);
        long long v12 = v9;
        do
        {
          uint64_t v13 = *((void *)v12 - 2);
          uint64_t v14 = *(void *)v12;
          (*((void (**)(id, uint64_t, void, uint64_t, void))v5 + 2))(v5, v13 * v11, *((void *)v12 - 1), *(void *)v12 * v11, *((unsigned int *)v12 + 2));
          *(void *)&long long v19 = v14 + v13;
          ++v10;
          v12 += 32;
        }
        while (v10 < DWORD1(v20));
        if (DWORD1(v20)) {
          continue;
        }
      }
      goto LABEL_15;
    }
    long long v18 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000314F0();
    }

LABEL_15:
    free(v8);
  }
  else
  {
    long long v15 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100031474(v15, v16, v17);
    }
  }
}

+ (void)_getPurgeableRecordsInfo:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = (const char *)[a3 fileSystemRepresentation];
  id v7 = (char *)malloc_type_malloc(0x8000uLL, 0x1000040FA0F61DDuLL);
  if (v7)
  {
    v8 = v7;
    v14[1] = 0;
    long long v16 = 0u;
    long long v15 = 0u;
    v14[2] = 512;
    uint64_t v17 = v7;
    v14[0] = 6;
    uint64_t v9 = v7 + 24;
    while (!fsctl(v6, 0xC0404A83uLL, v14, 0))
    {
      if (*((void *)&v16 + 1))
      {
        unint64_t v10 = 0;
        uint64_t v11 = v9;
        do
        {
          (*((void (**)(id, void, void, void, void))v5 + 2))(v5, *(v11 - 3), *(v11 - 2), *v11, v11[3]);
          ++v10;
          v11 += 8;
        }
        while (*((void *)&v16 + 1) > v10);
      }
      if (!(void)v16) {
        goto LABEL_15;
      }
    }
    uint64_t v13 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000315F0();
    }

LABEL_15:
    free(v8);
  }
  else
  {
    long long v12 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100031570(v12);
    }
  }
}

- (BOOL)shouldListContents
{
  unsigned int v3 = [(DSVolume *)self _flags];
  LODWORD(v4) = (v3 >> 12) & 1;
  if ((v3 & 0x1000) == 0)
  {
    id v5 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000316E8();
    }
  }
  if (([(DSVolume *)self _flags] & 0x40000000) != 0)
  {
    id v4 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100031670();
    }

    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (id)_pathRepresentationForListing:(char *)a3 isDirectory:(BOOL)a4
{
  if (!a3) {
    goto LABEL_6;
  }
  BOOL v4 = a4;
  size_t v7 = strlen(a3);
  if (!v7) {
    goto LABEL_6;
  }
  if (v7 != 1)
  {
    if (a3[v7 - 1] != 47)
    {
      BOOL v8 = 1;
      goto LABEL_8;
    }
LABEL_6:
    id v9 = 0;
    goto LABEL_28;
  }
  BOOL v8 = strcmp(a3, "/") != 0;
LABEL_8:
  unint64_t v10 = [(DSVolume *)self _volumeManager];
  uint64_t v11 = [v10 _snapshotRequest];
  long long v12 = [v11 snapshotFileManager];

  if ([v12 shouldHashVolumeListings])
  {
    uint64_t v13 = +[NSURL fileURLWithFileSystemRepresentation:a3 isDirectory:0 relativeToURL:0];
    uint64_t v14 = v13;
    if (v13)
    {
      long long v15 = [v13 path];
      if (v4)
      {
        long long v16 = &stru_1000656E0;
      }
      else
      {
        long long v16 = [v14 lastPathComponent];
        long long v18 = [v14 URLByDeletingLastPathComponent];
        uint64_t v19 = [v18 path];

        long long v15 = (void *)v19;
      }
      id v20 = [v15 hash];
      long long v21 = +[NSNumber numberWithUnsignedInteger:v20];
      long long v22 = [(DSVolume *)self __hashes];
      unsigned __int8 v23 = [v22 containsObject:v21];

      if ((v23 & 1) == 0)
      {
        long long v24 = [(DSVolume *)self __hashes];
        [v24 addObject:v21];

        long long v25 = (FILE *)[v12 sharedDirectoriesMapFile];
        long long v26 = (const char *)[v15 UTF8String];
        v27 = "";
        if (v8) {
          v27 = "/";
        }
        if (fprintf(v25, "%lu\t%s%s\n", v20, v26, v27) == -1)
        {
          __error();
          if ((byte_10006A780 & 1) == 0)
          {
            byte_10006A780 = 1;
            v28 = shared_filesystem_metadata_snapshot_service_log_handle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
              sub_1000302A4();
            }
          }
        }
      }
      id v9 = +[NSString stringWithFormat:@"<%lu>%@", v20, v16];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    uint64_t v17 = "";
    if (v8 && v4) {
      uint64_t v17 = "/";
    }
    id v9 = +[NSString stringWithFormat:@"%s%s", a3, v17];
  }

LABEL_28:

  return v9;
}

- (BOOL)listContentsWithEntryCount:(unint64_t *)a3 andError:(id *)a4
{
  BOOL v4 = a4;
  if (a4) {
    *a4 = 0;
  }
  id v6 = self;
  if (![(DSVolume *)v6 shouldListContents])
  {
    id v9 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      buf.st_dev = 138412290;
      *(void *)&buf.int st_mode = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Skipping listing files for volume %@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_14;
  }
  v159 = a3;
  unsigned int v168 = [(DSVolume *)v6 hasPurgeableFilesCapability];
  size_t v7 = [(DSVolume *)v6 _volumeManager];
  BOOL v8 = [v7 _snapshotRequest];
  id v9 = [v8 snapshotFileManager];

  unint64_t v10 = (FILE *)[v9 sharedLogFile];
  uint64_t v11 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    buf.st_dev = 138412290;
    *(void *)&buf.int st_mode = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Listing files for volume %@", (uint8_t *)&buf, 0xCu);
  }

  if (qword_10006A768 != -1) {
    dispatch_once(&qword_10006A768, &stru_100064990);
  }
  double v12 = *(double *)&qword_10006A760;
  uint64_t v13 = [(DSVolume *)v6 safeFilenameForListing];
  uint64_t v14 = (FILE *)[v9 createFileForWritingWithName:v13 error:v4];

  if (!v14) {
    goto LABEL_122;
  }
  if (v6->_supportsAttributionTags)
  {
    long long v15 = [(DSVolume *)v6 safeFilenameForAttributionTagsListing];
    long long v16 = (FILE *)[v9 createFileForWritingWithName:v15 error:v4];

    v163 = v16;
    if (!v16)
    {
LABEL_122:
      LOBYTE(v17) = 0;
      goto LABEL_123;
    }
  }
  else
  {
    long long v18 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [(DSVolume *)v6 mountPoint];
      id v20 = [v19 UTF8String];
      buf.st_dev = 136315138;
      *(void *)&buf.int st_mode = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Attribution tags is not supported/enabled on volume %s", (uint8_t *)&buf, 0xCu);
    }
    v163 = 0;
  }
  if (v6->_shouldCollectDirStatsData)
  {
    long long v21 = [(DSVolume *)v6 safeFilenameForDirStatsDataListing];
    long long v22 = (FILE *)[v9 createFileForWritingWithName:v21 error:v4];

    v162 = v22;
    if (!v22) {
      goto LABEL_122;
    }
  }
  else
  {
    v162 = 0;
  }
  v185 = 0;
  uint64_t v186 = 0;
  id v23 = [(DSVolume *)v6 mountPoint];
  v185 = (char *)[v23 fileSystemRepresentation];
  uint64_t v186 = 0;

  v170 = fts_open(&v185, 80, 0);
  if (!v170)
  {
    uint64_t v49 = *__error();
    id v50 = [(DSVolume *)v6 mountPoint];
    v51 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Error opening volume at %s: %d (%s)", [v50 fileSystemRepresentation], v49, strerror(v49));

    uint64_t v17 = v51;
    if (fprintf(v10, "%s\n", (const char *)[(FILE *)v17 UTF8String]) == -1)
    {
      __error();
      if ((byte_10006A781 & 1) == 0)
      {
        byte_10006A781 = 1;
        v52 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    v53 = v9;
    v54 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      sub_100030228(v17);
    }

    if (v4)
    {
      v55 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v49 userInfo:0];
      v183[0] = NSUnderlyingErrorKey;
      v183[1] = NSLocalizedDescriptionKey;
      v184[0] = v55;
      v184[1] = v17;
      v56 = +[NSDictionary dictionaryWithObjects:v184 forKeys:v183 count:2];
      *BOOL v4 = +[NSError errorWithDomain:@"com.apple.FilesystemMetadataSnapshot" code:65544 userInfo:v56];
    }
    LOBYTE(v17) = 0;
    id v9 = v53;
    goto LABEL_123;
  }
  if (fprintf(v14, "%s\t%s\n", "Version:", "1008") == -1)
  {
    __error();
    if ((byte_10006A782 & 1) == 0)
    {
      byte_10006A782 = 1;
      long long v24 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  unsigned int v25 = [v9 shouldHashVolumeListings];
  long long v26 = "NO";
  if (v25) {
    long long v26 = "YES";
  }
  if (fprintf(v14, "%s\t%s\n", "Hashed:", v26) == -1)
  {
    __error();
    if ((byte_10006A783 & 1) == 0)
    {
      byte_10006A783 = 1;
      v27 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  if (fprintf(v14, "%s\t%lld\n", "Total:", [(DSVolume *)v6 capacityBytes]) == -1)
  {
    __error();
    if ((byte_10006A784 & 1) == 0)
    {
      byte_10006A784 = 1;
      v28 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  if (fprintf(v14, "%s\t%lld\n", "Used:", [(DSVolume *)v6 usedBytes]) == -1)
  {
    __error();
    if ((byte_10006A785 & 1) == 0)
    {
      byte_10006A785 = 1;
      v29 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  if (fprintf(v14, "%s\t%lld\n", "Free:", [(DSVolume *)v6 freeBytes]) == -1)
  {
    __error();
    if ((byte_10006A786 & 1) == 0)
    {
      byte_10006A786 = 1;
      v30 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  if (fprintf(v14, "------------------------------------------------------------------------------------------------\n") == -1)
  {
    __error();
    if ((byte_10006A787 & 1) == 0)
    {
      byte_10006A787 = 1;
      long long v31 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  if (fprintf(v14, "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n", "Size-On-Disk", "File-Size", "Compression", "FS-Purgeable-Flags", "mtime", "Mode", "UID", "GID", "Path") == -1)
  {
    __error();
    if ((byte_10006A788 & 1) == 0)
    {
      byte_10006A788 = 1;
      id v32 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  if (fprintf(v14, "------------------------------------------------------------------------------------------------\n") == -1)
  {
    __error();
    if ((byte_10006A789 & 1) == 0)
    {
      byte_10006A789 = 1;
      v33 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  if (fprintf(v14, "<BEGIN>\n") == -1)
  {
    __error();
    if ((byte_10006A78A & 1) == 0)
    {
      byte_10006A78A = 1;
      int v34 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  if (v6->_supportsAttributionTags)
  {
    if (fprintf(v163, "------------------------------------------------------------------------------------------------\n") == -1)
    {
      __error();
      if ((byte_10006A78B & 1) == 0)
      {
        byte_10006A78B = 1;
        v35 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    if (fprintf(v163, "%s\t%s\t%s\n", "Tag-Owner", "Tag-Hash", "Path") == -1)
    {
      __error();
      if ((byte_10006A78C & 1) == 0)
      {
        byte_10006A78C = 1;
        v36 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    if (fprintf(v163, "------------------------------------------------------------------------------------------------\n") == -1)
    {
      __error();
      if ((byte_10006A78D & 1) == 0)
      {
        byte_10006A78D = 1;
        id v37 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    if (fprintf(v163, "<BEGIN>\n") == -1)
    {
      __error();
      if ((byte_10006A78E & 1) == 0)
      {
        byte_10006A78E = 1;
        v38 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
  }
  if (v6->_shouldCollectDirStatsData)
  {
    if (fprintf(v162, "------------------------------------------------------------------------------------------------\n") == -1)
    {
      __error();
      if ((byte_10006A78F & 1) == 0)
      {
        byte_10006A78F = 1;
        v39 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    if (fprintf(v162, "%s\t%s\n", "Path", "SAFDirStats") == -1)
    {
      __error();
      if ((byte_10006A790 & 1) == 0)
      {
        byte_10006A790 = 1;
        long long v40 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    if (fprintf(v162, "------------------------------------------------------------------------------------------------\n") == -1)
    {
      __error();
      if ((byte_10006A791 & 1) == 0)
      {
        byte_10006A791 = 1;
        v41 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    if (fprintf(v162, "<BEGIN>\n") == -1)
    {
      __error();
      if ((byte_10006A792 & 1) == 0)
      {
        byte_10006A792 = 1;
        v42 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
  }
  memset(&buf, 0, sizeof(buf));
  if (!fstatat(-2, v185, &buf, 544))
  {
    v157 = v9;
    v57 = fts_read(v170);
    v166 = v14;
    if (v57)
    {
      v58 = v57;
      unint64_t v161 = 0;
      uint64_t v169 = 0;
      uint64_t v158 = 0;
      double v59 = 1000.0 / v12;
      v160 = v4;
      while (1)
      {
        unsigned int fts_info = v58->fts_info;
        if (fts_info <= 0xD)
        {
          if (((1 << fts_info) & 0x490) != 0)
          {
            v63 = v60;
            int v64 = *__error();
            fts_path = v58->fts_path;
            v66 = strerror(v64);
            if (fprintf(v10, "Error reading file at %s: %d (%s)\n", fts_path, v64, v66) == -1)
            {
              v67 = __error();
              if ((byte_10006A794 & 1) == 0)
              {
                int v68 = *v67;
                byte_10006A794 = 1;
                v69 = shared_filesystem_metadata_snapshot_service_log_handle();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)v178 = 67109120;
                  LODWORD(v179) = v68;
                  _os_log_fault_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_FAULT, "Failed to write to file: %{darwin.errno}d", v178, 8u);
                }
              }
            }
            v70 = shared_filesystem_metadata_snapshot_service_log_handle();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              v123 = v58->fts_path;
              v124 = strerror(v64);
              *(_DWORD *)v178 = 136315650;
              unint64_t v179 = (unint64_t)v123;
              __int16 v180 = 1024;
              *(_DWORD *)v181 = v64;
              *(_WORD *)&v181[4] = 2080;
              *(void *)&v181[6] = v124;
              _os_log_error_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "Error reading file at %s: %d (%s)", v178, 0x1Cu);
            }

            v60 = v63;
          }
          else
          {
            if (((1 << fts_info) & 0x3100) != 0)
            {
              context = v60;
              uint64_t v62 = 0;
              goto LABEL_155;
            }
            if (fts_info == 1)
            {
              context = v60;
              v71 = +[NSString stringWithUTF8String:v58->fts_path];
              if (v6->_supportsAttributionTags
                && !+[DSVolume _isDirectoryPartOfSAFHierarchy:v71])
              {
                v175[0] = _NSConcreteStackBlock;
                v175[1] = 3221225472;
                v175[2] = sub_100012CAC;
                v175[3] = &unk_1000649F0;
                v175[4] = v6;
                v175[5] = v10;
                v175[6] = v163;
                +[DSVolume _getAttributionTagPathsInDirectory:v71 reply:v175];
              }
              if (v6->_shouldCollectDirStatsData)
              {
                v174[0] = _NSConcreteStackBlock;
                v174[1] = 3221225472;
                v174[2] = sub_100012F30;
                v174[3] = &unk_100064A18;
                v174[4] = v6;
                v174[5] = v58;
                v174[6] = v10;
                v174[7] = v162;
                +[DSVolume _getDirStatsType:v71 reply:v174];
              }

              uint64_t v62 = 1;
LABEL_155:
              v72 = v58->fts_path;
              v73 = &off_1000649D8;
              v74 = "/System/Library/Caches/com.apple.factorydata";
              while (strcmp(v74, v72))
              {
                v75 = *v73++;
                v74 = v75;
                if (!v75) {
                  goto LABEL_167;
                }
              }
              if (fprintf(v10, "Skipping descendents of blocklisted directory at %s\n", v72) == -1)
              {
                v76 = __error();
                if ((byte_10006A79A & 1) == 0)
                {
                  int v77 = *v76;
                  byte_10006A79A = 1;
                  v78 = shared_filesystem_metadata_snapshot_service_log_handle();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)v178 = 67109120;
                    LODWORD(v179) = v77;
                    _os_log_fault_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_FAULT, "Failed to write to file: %{darwin.errno}d", v178, 8u);
                  }
                }
              }
              v79 = shared_filesystem_metadata_snapshot_service_log_handle();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
              {
                v80 = v58->fts_path;
                *(_DWORD *)v178 = 136315138;
                unint64_t v179 = (unint64_t)v80;
                _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Skipping descendents of blocklisted directory at %s", v178, 0xCu);
              }

              fts_set(v170, v58, 4);
LABEL_167:
              fts_statp = v58->fts_statp;
              blkcnt_t st_blocks = fts_statp->st_blocks;
              off_t st_size = fts_statp->st_size;
              if (v62) {
                int v164 = 0;
              }
              else {
                int v164 = (LOBYTE(fts_statp->st_flags) >> 5) & 1;
              }
              uint64_t v173 = 0;
              if (v168 && v58->fts_info == 8 && fsctl(v58->fts_path, 0x40084A47uLL, &v173, 0))
              {
                int v83 = *__error();
                v84 = v58->fts_path;
                v85 = strerror(v83);
                if (fprintf(v10, "Error getting purgeable flags for file at %s: %d (%s)\n", v84, v83, v85) == -1)
                {
                  v86 = __error();
                  if ((byte_10006A79B & 1) == 0)
                  {
                    int v87 = *v86;
                    byte_10006A79B = 1;
                    v88 = shared_filesystem_metadata_snapshot_service_log_handle();
                    if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)v178 = 67109120;
                      LODWORD(v179) = v87;
                      _os_log_fault_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_FAULT, "Failed to write to file: %{darwin.errno}d", v178, 8u);
                    }
                  }
                }
                v89 = shared_filesystem_metadata_snapshot_service_log_handle();
                if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                {
                  v126 = v58->fts_path;
                  v127 = strerror(v83);
                  *(_DWORD *)v178 = 136315650;
                  unint64_t v179 = (unint64_t)v126;
                  __int16 v180 = 1024;
                  *(_DWORD *)v181 = v83;
                  *(_WORD *)&v181[4] = 2080;
                  *(void *)&v181[6] = v127;
                  _os_log_error_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "Error getting purgeable flags for file at %s: %d (%s)", v178, 0x1Cu);
                }

                uint64_t v173 = -1;
              }
              v90 = v10;
              blkcnt_t v91 = st_blocks << 9;
              v92 = v58->fts_statp;
              __darwin_time_t tv_sec = v92->st_mtimespec.tv_sec;
              int st_mode = v92->st_mode;
              uid_t st_uid = v92->st_uid;
              gid_t st_gid = v92->st_gid;
              v97 = [(DSVolume *)v6 _pathRepresentationForListing:v58->fts_path isDirectory:v62];
              v98 = v97;
              if (v97)
              {
                uint64_t v99 = v173;
                v156 = (const char *)[v97 UTF8String];
                uint64_t v155 = v99;
                if (v164) {
                  uint64_t v100 = 99;
                }
                else {
                  uint64_t v100 = 45;
                }
                BOOL v4 = v160;
                uint64_t v101 = v169;
                if (fprintf(v166, "%llu\t%llu\t%c\t%llu\t%ld\t%u\t%u\t%u\t%s\n", v91, st_size, v100, v155, tv_sec, st_mode, st_uid, st_gid, v156) == -1)
                {
                  v102 = __error();
                  if ((byte_10006A79D & 1) == 0)
                  {
                    int v103 = *v102;
                    byte_10006A79D = 1;
                    v104 = shared_filesystem_metadata_snapshot_service_log_handle();
                    if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)v178 = 67109120;
                      LODWORD(v179) = v103;
                      _os_log_fault_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_FAULT, "Failed to write to file: %{darwin.errno}d", v178, 8u);
                    }
                  }
                }
                ++v161;
                unint64_t v10 = v90;
                uint64_t v14 = v166;
              }
              else
              {
                unint64_t v10 = v90;
                int v105 = fprintf(v90, "Error getting hashed path for %s (isDir: %d)\n", v58->fts_path, v62);
                uint64_t v14 = v166;
                if (v105 == -1)
                {
                  v106 = __error();
                  if ((byte_10006A79C & 1) == 0)
                  {
                    int v107 = *v106;
                    byte_10006A79C = 1;
                    v108 = shared_filesystem_metadata_snapshot_service_log_handle();
                    if (os_log_type_enabled(v108, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)v178 = 67109120;
                      LODWORD(v179) = v107;
                      _os_log_fault_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_FAULT, "Failed to write to file: %{darwin.errno}d", v178, 8u);
                    }
                  }
                }
                v109 = shared_filesystem_metadata_snapshot_service_log_handle();
                if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
                {
                  v125 = v58->fts_path;
                  *(_DWORD *)v178 = 136315394;
                  unint64_t v179 = (unint64_t)v125;
                  __int16 v180 = 1024;
                  *(_DWORD *)v181 = v62;
                  _os_log_error_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "Error getting hashed path for %s (isDir: %d)", v178, 0x12u);
                }

                BOOL v4 = v160;
                uint64_t v101 = v169;
              }
              uint64_t v110 = v91 + v101;
              v111 = [(DSVolume *)v6 progress];
              [v111 fractionCompleted];
              double v113 = v112;

              uint64_t v169 = v110;
              if (v113 < 1.0 && v110 >= 10485760)
              {
                uint64_t v114 = mach_absolute_time();
                if (v59 <= (double)(v114 - v158))
                {
                  uint64_t v115 = v114;
                  v116 = [(DSVolume *)v6 progress];
                  v117 = (char *)[v116 completedUnitCount] + v169;

                  v118 = [(DSVolume *)v6 progress];
                  v119 = (char *)[v118 totalUnitCount];

                  if ((uint64_t)v117 >= (uint64_t)v119) {
                    v120 = v119;
                  }
                  else {
                    v120 = v117;
                  }
                  v121 = [(DSVolume *)v6 progress];
                  [v121 setCompletedUnitCount:v120];

                  v122 = shared_filesystem_metadata_snapshot_service_log_handle();
                  if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG)) {
                    sub_1000317E4(v176, v6, &v177, v122);
                  }

                  uint64_t v169 = 0;
                  uint64_t v158 = v115;
                  BOOL v4 = v160;
                }
              }

              v60 = context;
            }
          }
        }
        v58 = fts_read(v170);
        if (!v58) {
          goto LABEL_212;
        }
      }
    }
    unint64_t v161 = 0;
LABEL_212:
    fts_close(v170);
    id v9 = v157;
    if (fprintf(v14, "<END>\n") == -1)
    {
      __error();
      if ((byte_10006A79E & 1) == 0)
      {
        byte_10006A79E = 1;
        v128 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v128, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    if (v6->_supportsAttributionTags && fprintf(v163, "<END>\n") == -1)
    {
      __error();
      if ((byte_10006A79F & 1) == 0)
      {
        byte_10006A79F = 1;
        v129 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v129, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    if (v6->_shouldCollectDirStatsData && fprintf(v162, "<END>\n") == -1)
    {
      __error();
      if ((byte_10006A7A0 & 1) == 0)
      {
        byte_10006A7A0 = 1;
        v130 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v130, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    if (v6->_supportsSharedExtents)
    {
      v131 = [(DSVolume *)v6 safeFilenameForSharedExtentsListing];
      uint64_t v17 = (FILE *)[v157 createFileForWritingWithName:v131 error:v4];

      if (!v17) {
        goto LABEL_123;
      }
      if (fprintf(v17, "------------------------------------------------------------------------------------------------\n") == -1)
      {
        __error();
        if ((byte_10006A7A1 & 1) == 0)
        {
          byte_10006A7A1 = 1;
          v132 = shared_filesystem_metadata_snapshot_service_log_handle();
          if (os_log_type_enabled(v132, OS_LOG_TYPE_FAULT)) {
            sub_1000302A4();
          }
        }
      }
      if (fprintf(v17, "%s\t%s\t%s\t%s\n", "Physical-Block-Number", "Owning-Obj-Id", "Size", "Reference-Count") == -1)
      {
        __error();
        if ((byte_10006A7A2 & 1) == 0)
        {
          byte_10006A7A2 = 1;
          v133 = shared_filesystem_metadata_snapshot_service_log_handle();
          if (os_log_type_enabled(v133, OS_LOG_TYPE_FAULT)) {
            sub_1000302A4();
          }
        }
      }
      if (fprintf(v17, "------------------------------------------------------------------------------------------------\n") == -1)
      {
        __error();
        if ((byte_10006A7A3 & 1) == 0)
        {
          byte_10006A7A3 = 1;
          v134 = shared_filesystem_metadata_snapshot_service_log_handle();
          if (os_log_type_enabled(v134, OS_LOG_TYPE_FAULT)) {
            sub_1000302A4();
          }
        }
      }
      if (fprintf(v17, "<BEGIN>\n") == -1)
      {
        __error();
        if ((byte_10006A7A4 & 1) == 0)
        {
          byte_10006A7A4 = 1;
          v135 = shared_filesystem_metadata_snapshot_service_log_handle();
          if (os_log_type_enabled(v135, OS_LOG_TYPE_FAULT)) {
            sub_1000302A4();
          }
        }
      }
      v136 = [(DSVolume *)v6 mountPoint];
      v172[0] = _NSConcreteStackBlock;
      v172[1] = 3221225472;
      v172[2] = sub_1000130B8;
      v172[3] = &unk_100064A38;
      v172[4] = v17;
      +[DSVolume _getSharedExtensInfo:v136 reply:v172];

      if (fprintf(v17, "<END>\n") == -1)
      {
        __error();
        if ((byte_10006A7A6 & 1) == 0)
        {
          byte_10006A7A6 = 1;
          v137 = shared_filesystem_metadata_snapshot_service_log_handle();
          if (os_log_type_enabled(v137, OS_LOG_TYPE_FAULT)) {
            sub_1000302A4();
          }
        }
      }
    }
    if (v6->_supportsPurgeableRecords)
    {
      v138 = [(DSVolume *)v6 safeFilenameForPurgeableRecordsListing];
      uint64_t v17 = (FILE *)[v157 createFileForWritingWithName:v138 error:v4];

      if (!v17) {
        goto LABEL_123;
      }
      if (fprintf(v17, "------------------------------------------------------------------------------------------------\n") == -1)
      {
        __error();
        if ((byte_10006A7A7 & 1) == 0)
        {
          byte_10006A7A7 = 1;
          v139 = shared_filesystem_metadata_snapshot_service_log_handle();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_FAULT)) {
            sub_1000302A4();
          }
        }
      }
      if (fprintf(v17, "%s\t%s\t%s\t%s\n", "Inode-Number", "Purgeable-Flags", "Last-Access-Time", "Purgeable-Size") == -1)
      {
        __error();
        if ((byte_10006A7A8 & 1) == 0)
        {
          byte_10006A7A8 = 1;
          v140 = shared_filesystem_metadata_snapshot_service_log_handle();
          if (os_log_type_enabled(v140, OS_LOG_TYPE_FAULT)) {
            sub_1000302A4();
          }
        }
      }
      if (fprintf(v17, "------------------------------------------------------------------------------------------------\n") == -1)
      {
        __error();
        if ((byte_10006A7A9 & 1) == 0)
        {
          byte_10006A7A9 = 1;
          v141 = shared_filesystem_metadata_snapshot_service_log_handle();
          if (os_log_type_enabled(v141, OS_LOG_TYPE_FAULT)) {
            sub_1000302A4();
          }
        }
      }
      if (fprintf(v17, "<BEGIN>\n") == -1)
      {
        __error();
        if ((byte_10006A7AA & 1) == 0)
        {
          byte_10006A7AA = 1;
          v142 = shared_filesystem_metadata_snapshot_service_log_handle();
          if (os_log_type_enabled(v142, OS_LOG_TYPE_FAULT)) {
            sub_1000302A4();
          }
        }
      }
      v143 = [(DSVolume *)v6 mountPoint];
      v171[0] = _NSConcreteStackBlock;
      v171[1] = 3221225472;
      v171[2] = sub_100013144;
      v171[3] = &unk_100064A58;
      v171[4] = v17;
      +[DSVolume _getPurgeableRecordsInfo:v143 reply:v171];

      uint64_t v14 = v166;
      if (fprintf(v17, "<END>\n") == -1)
      {
        __error();
        if ((byte_10006A7AC & 1) == 0)
        {
          byte_10006A7AC = 1;
          v144 = shared_filesystem_metadata_snapshot_service_log_handle();
          if (os_log_type_enabled(v144, OS_LOG_TYPE_FAULT)) {
            sub_1000302A4();
          }
        }
      }
    }
    fflush(v14);
    v145 = [(DSVolume *)v6 progress];
    id v146 = [v145 totalUnitCount];
    v147 = [(DSVolume *)v6 progress];
    [v147 setCompletedUnitCount:v146];

    v148 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v148, OS_LOG_TYPE_DEBUG)) {
      sub_100031760(v6);
    }

    id v149 = [(DSVolume *)v6 description];
    int v150 = fprintf(v10, "Done listing contents (%llu entries) for %s\n", v161, (const char *)[v149 UTF8String]);

    if (v150 == -1)
    {
      __error();
      if ((byte_10006A7AD & 1) == 0)
      {
        byte_10006A7AD = 1;
        v151 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v151, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    v152 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
    {
      id v153 = [(DSVolume *)v6 description];
      id v154 = [v153 UTF8String];
      *(_DWORD *)v178 = 134218242;
      unint64_t v179 = v161;
      __int16 v180 = 2080;
      *(void *)v181 = v154;
      _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_DEFAULT, "Done listing contents (%llu entries) for %s", v178, 0x16u);
    }
    if (v159) {
      unint64_t *v159 = v161;
    }
LABEL_14:
    LOBYTE(v17) = 1;
    goto LABEL_123;
  }
  v43 = __error();
  uint64_t v17 = (FILE *)*v43;
  v44 = v185;
  v45 = strerror(*v43);
  if (fprintf(v10, "fstatat() failed for [parent] file at %s/..: %d (%s)\n", v44, v17, v45) == -1)
  {
    __error();
    if ((byte_10006A793 & 1) == 0)
    {
      byte_10006A793 = 1;
      v46 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  v47 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
    sub_10003185C((uint64_t *)&v185, (int)v17, v47);
  }

  if (!v4) {
    goto LABEL_122;
  }
  +[NSError errorWithDomain:NSPOSIXErrorDomain code:v17 userInfo:0];
  LOBYTE(v17) = 0;
  *BOOL v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_123:

  return (char)v17;
}

- (NSString)debugDescription
{
  unsigned int v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  id v5 = (void *)v4;
  if (self->_isRootVolume) {
    CFStringRef v6 = @" [RootVolume]";
  }
  else {
    CFStringRef v6 = &stru_1000656E0;
  }
  size_t v7 = +[NSString stringWithFormat:@"<%@: %p> %@ (%@)%@", v4, self, self->_mountPoint, self->_mountedFrom, v6];

  return (NSString *)v7;
}

- (NSString)description
{
  unsigned int v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  id v5 = (void *)v4;
  if (self->_isRootVolume) {
    CFStringRef v6 = @" [RootVolume]";
  }
  else {
    CFStringRef v6 = &stru_1000656E0;
  }
  size_t v7 = +[NSString stringWithFormat:@"<%@> %@ (%@)%@", v4, self->_mountPoint, self->_mountedFrom, v6];

  return (NSString *)v7;
}

- (id)_initWithStatFS:(statfs *)a3 usedBytesProvider:(id)a4 volumeManager:(id)a5
{
  BOOL v8 = (uint64_t (**)(id, statfs *))a4;
  id v9 = a5;
  if (v9)
  {
    v35.receiver = self;
    v35.super_class = (Class)DSVolume;
    unint64_t v10 = [(DSVolume *)&v35 init];
    if (v10)
    {
      uint64_t v11 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)stat buf = 136446466;
        f_mntonname = a3->f_mntonname;
        __int16 v38 = 2082;
        f_mntfromname = a3->f_mntfromname;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Creating DSVolume for %{public}s (%{public}s)", buf, 0x16u);
      }

      objc_storeWeak((id *)&v10->__volumeManager, v9);
      uint64_t v12 = [(id)objc_opt_class() _safeStringFromStatFSCString:a3->f_mntonname];
      mountPoint = v10->_mountPoint;
      v10->_mountPoint = (NSString *)v12;

      uint64_t v14 = [(id)objc_opt_class() _safeStringFromStatFSCString:a3->f_mntfromname];
      mountedFrom = v10->_mountedFrom;
      v10->_mountedFrom = (NSString *)v14;

      uint64_t v16 = [(id)objc_opt_class() _safeStringFromStatFSCString:a3->f_fstypename];
      filesystemTypeName = v10->__filesystemTypeName;
      v10->__filesystemTypeName = (NSString *)v16;

      uint64_t f_bsize = a3->f_bsize;
      v10->_capacityBytes = a3->f_blocks * f_bsize;
      v10->_freeBytes = a3->f_bavail * f_bsize;
      v10->_usedBytes = v8[2](v8, a3);
      v10->__flags = a3->f_flags;
      if ((a3->f_flags & 0x4000) != 0) {
        v10->_isRootVolume = 1;
      }
      id v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      hashes = v10->___hashes;
      v10->___hashes = v19;

      uint64_t v21 = +[NSProgress progressWithTotalUnitCount:v10->_usedBytes];
      progress = v10->_progress;
      v10->_progress = (NSProgress *)v21;

      uint64_t v23 = [(id)objc_opt_class() _safeFilenameForListingVolume:v10 pathExtension:@"fslisting"];
      safeFilenameForListing = v10->_safeFilenameForListing;
      v10->_safeFilenameForListing = (NSString *)v23;

      uint64_t v25 = [(id)objc_opt_class() _safeFilenameForListingVolume:v10 pathExtension:@"attrstaglisting"];
      safeFilenameForAttributionTagsListing = v10->_safeFilenameForAttributionTagsListing;
      v10->_safeFilenameForAttributionTagsListing = (NSString *)v25;

      uint64_t v27 = [(id)objc_opt_class() _safeFilenameForListingVolume:v10 pathExtension:@"dirstatsdatalisting"];
      safeFilenameForDirStatsDataListing = v10->_safeFilenameForDirStatsDataListing;
      v10->_safeFilenameForDirStatsDataListing = (NSString *)v27;

      uint64_t v29 = [(id)objc_opt_class() _safeFilenameForListingVolume:v10 pathExtension:@"sharedextentslisting"];
      safeFilenameForSharedExtentsListing = v10->_safeFilenameForSharedExtentsListing;
      v10->_safeFilenameForSharedExtentsListing = (NSString *)v29;

      uint64_t v31 = [(id)objc_opt_class() _safeFilenameForListingVolume:v10 pathExtension:@"purgeablerecordslisting"];
      safeFilenameForPurgeableRecordsListing = v10->_safeFilenameForPurgeableRecordsListing;
      v10->_safeFilenameForPurgeableRecordsListing = (NSString *)v31;

      v10->_hasPurgeableFilesCapability = objc_msgSend((id)objc_opt_class(), "__checkPurgeableFilesCapabilityForVolume:", v10);
      v10->_supportsAttributionTags = objc_msgSend((id)objc_opt_class(), "__checkAttributionTagsCapabilityForVolume:", v10);
      v10->_shouldCollectDirStatsData = objc_msgSend((id)objc_opt_class(), "__checkDirStatsDataCapabilityForVolume:", v10);
      v10->_supportsSharedExtents = objc_msgSend((id)objc_opt_class(), "__checkDirStatsDataCapabilityForVolume:", v10);
      v10->_supportsPurgeableRecords = objc_msgSend((id)objc_opt_class(), "__checkDirStatsDataCapabilityForVolume:", v10);
    }
    self = v10;
    v33 = self;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (NSString)mountPoint
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)mountedFrom
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isRootVolume
{
  return self->_isRootVolume;
}

- (BOOL)hasPurgeableFilesCapability
{
  return self->_hasPurgeableFilesCapability;
}

- (BOOL)supportsAttributionTags
{
  return self->_supportsAttributionTags;
}

- (BOOL)shouldCollectDirStatsData
{
  return self->_shouldCollectDirStatsData;
}

- (BOOL)supportsSharedExtents
{
  return self->_supportsSharedExtents;
}

- (BOOL)supportsPurgeableRecords
{
  return self->_supportsPurgeableRecords;
}

- (unint64_t)capacityBytes
{
  return self->_capacityBytes;
}

- (unint64_t)freeBytes
{
  return self->_freeBytes;
}

- (unint64_t)usedBytes
{
  return self->_usedBytes;
}

- (NSString)safeFilenameForListing
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)safeFilenameForAttributionTagsListing
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)safeFilenameForDirStatsDataListing
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)safeFilenameForSharedExtentsListing
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)safeFilenameForPurgeableRecordsListing
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 104, 1);
}

- (NSMutableSet)__hashes
{
  return (NSMutableSet *)objc_getProperty(self, a2, 112, 1);
}

- (DSVolumeManager)_volumeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__volumeManager);

  return (DSVolumeManager *)WeakRetained;
}

- (NSString)_filesystemTypeName
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (unsigned)_flags
{
  return self->__flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__filesystemTypeName, 0);
  objc_destroyWeak((id *)&self->__volumeManager);
  objc_storeStrong((id *)&self->___hashes, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_safeFilenameForPurgeableRecordsListing, 0);
  objc_storeStrong((id *)&self->_safeFilenameForSharedExtentsListing, 0);
  objc_storeStrong((id *)&self->_safeFilenameForDirStatsDataListing, 0);
  objc_storeStrong((id *)&self->_safeFilenameForAttributionTagsListing, 0);
  objc_storeStrong((id *)&self->_safeFilenameForListing, 0);
  objc_storeStrong((id *)&self->_mountedFrom, 0);

  objc_storeStrong((id *)&self->_mountPoint, 0);
}

@end