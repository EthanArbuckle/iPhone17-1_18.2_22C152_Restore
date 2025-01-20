@interface DSFilesystemMetadataSnapshotService
+ (id)_validateOptions:(id)a3 error:(id *)a4;
- (id)generateFilesystemMetadataSnapshotWithOptions:(id)a3 reply:(id)a4;
@end

@implementation DSFilesystemMetadataSnapshotService

+ (id)_validateOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v84 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Validating options: %{public}@", buf, 0xCu);
  }

  if (a4) {
    *a4 = 0;
  }
  v7 = +[NSMutableDictionary dictionary];
  if (!v5)
  {
    v8 = @"FilesystemMetadatSnapshotOptionShouldHashVolumeListings";
LABEL_36:
    v35 = [v7 objectForKeyedSubscript:v8];

    if (v35)
    {
      if (!v7) {
        goto LABEL_42;
      }
    }
    else
    {
      [v7 setObject:&__kCFBooleanFalse forKeyedSubscript:v8];
      if (!v7) {
        goto LABEL_42;
      }
    }
    if ([v7 count])
    {
      id v36 = [v7 copy];
      goto LABEL_43;
    }
LABEL_42:
    id v36 = 0;
LABEL_43:
    v9 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v84 = v36;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Validated options: %{public}@", buf, 0xCu);
    }
    goto LABEL_62;
  }
  v8 = @"FilesystemMetadatSnapshotOptionShouldHashVolumeListings";
  if (![v5 count]) {
    goto LABEL_36;
  }
  v61 = a4;
  v62 = v7;
  v82[0] = @"FilesystemMetadatSnapshotOptionMountPointsAllowListArray";
  v82[1] = @"FilesystemMetadatSnapshotOptionShouldHashVolumeListings";
  v9 = +[NSArray arrayWithObjects:v82 count:2];
  v10 = [v5 allKeys];
  v11 = +[NSSet setWithArray:v10];

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v12 = v11;
  id v13 = [(__CFString *)v12 countByEnumeratingWithState:&v68 objects:v81 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v69;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v69 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v68 + 1) + 8 * i);
        if (([v9 containsObject:v17] & 1) == 0)
        {
          v20 = +[NSString stringWithFormat:@"Unsupported snapshot option key '%@'", v17];
          id v37 = objc_alloc((Class)NSError);
          NSErrorUserInfoKey v79 = NSLocalizedDescriptionKey;
          v80 = v20;
          v38 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
          id v39 = [v37 initWithDomain:@"com.apple.FilesystemMetadataSnapshot" code:65541 userInfo:v38];

          v40 = shared_filesystem_metadata_snapshot_service_log_handle();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
            sub_1000306C8();
          }

          v7 = v62;
          if (v61) {
            id *v61 = v39;
          }
          v18 = v12;
          goto LABEL_61;
        }
      }
      id v14 = [(__CFString *)v12 countByEnumeratingWithState:&v68 objects:v81 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  v18 = @"FilesystemMetadatSnapshotOptionMountPointsAllowListArray";
  uint64_t v19 = objc_opt_class();
  v20 = [v5 objectForKeyedSubscript:v18];
  if (v20)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Unexpected type for snapshot option key %@; unexpected type %@, expected %@",
        v18,
        objc_opt_class(),
      uint64_t v41 = v19);
      id v42 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v74 = NSLocalizedDescriptionKey;
      uint64_t v75 = v41;
      v43 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      id v44 = [v42 initWithDomain:@"com.apple.FilesystemMetadataSnapshot" code:65541 userInfo:v43];

      v45 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_1000306C8();
      }

      v7 = v62;
      if (v61) {
        id *v61 = v44;
      }
      id v39 = (id)v41;
LABEL_60:

LABEL_61:
      id v36 = 0;
      goto LABEL_62;
    }
    v57 = v18;
    v21 = +[NSMutableArray array];
    uint64_t v63 = objc_opt_class();
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v58 = v20;
    id v22 = v20;
    id v23 = [v22 countByEnumeratingWithState:&v64 objects:v78 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v65;
      id v60 = v22;
      while (2)
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v65 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v64 + 1) + 8 * (void)j);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v59 = v21;
            v18 = v57;
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Unexpected type for array element for snapshot option key %@; unexpected type %@, expected %@",
              v57,
              objc_opt_class(),
            v46 = v63);
            id v47 = objc_alloc((Class)NSError);
            NSErrorUserInfoKey v76 = NSLocalizedDescriptionKey;
            v77 = v46;
            v48 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
            id v49 = [v47 initWithDomain:@"com.apple.FilesystemMetadataSnapshot" code:65541 userInfo:v48];

            v50 = shared_filesystem_metadata_snapshot_service_log_handle();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
              sub_1000306C8();
            }

            v20 = v58;
            id v39 = v59;
            if (v61) {
              id *v61 = v49;
            }

            v7 = v62;
            id v44 = v60;
            goto LABEL_60;
          }
          id v28 = v27;
          if ((unint64_t)[v28 length] >= 2
            && [v28 hasSuffix:@"/"])
          {
            objc_msgSend(v28, "substringToIndex:", (char *)objc_msgSend(v28, "length") - 1);
            v29 = v8;
            id v30 = v5;
            uint64_t v32 = v31 = v21;

            id v28 = (id)v32;
            v21 = v31;
            id v5 = v30;
            v8 = v29;
            id v22 = v60;
          }
          [v21 addObject:v28];
        }
        id v24 = [v22 countByEnumeratingWithState:&v64 objects:v78 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }

    v18 = v57;
    if ([v21 count]) {
      [v62 setObject:v21 forKeyedSubscript:v57];
    }

    v20 = v58;
  }

  v8 = v8;
  uint64_t v33 = objc_opt_class();
  v34 = [v5 objectForKeyedSubscript:v8];
  if (!v34)
  {
LABEL_34:

    v7 = v62;
    goto LABEL_36;
  }
  if (objc_opt_isKindOfClass())
  {
    [v62 setObject:v34 forKeyedSubscript:v8];
    goto LABEL_34;
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Unexpected type for snapshot option key %@; unexpected type %@, expected %@",
    v8,
    objc_opt_class(),
  v52 = v33);
  id v53 = objc_alloc((Class)NSError);
  NSErrorUserInfoKey v72 = NSLocalizedDescriptionKey;
  v73 = v52;
  v54 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
  id v55 = [v53 initWithDomain:@"com.apple.FilesystemMetadataSnapshot" code:65541 userInfo:v54];

  v56 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
    sub_1000306C8();
  }

  if (v61) {
    id *v61 = v55;
  }

  id v36 = 0;
  v7 = v62;
LABEL_62:

  return v36;
}

- (id)generateFilesystemMetadataSnapshotWithOptions:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(id, void, id))a4;
  id v6 = a3;
  v7 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Validating options", buf, 2u);
  }

  id v21 = 0;
  v8 = [(id)objc_opt_class() _validateOptions:v6 error:&v21];

  id v9 = v21;
  if (v9)
  {
    v10 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100030774(v10);
    }

    v5[2](v5, 0, v9);
  }
  v11 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Creating snapshot request", buf, 2u);
  }

  v12 = [[DSSnapshotRequest alloc] initWithOptions:v8];
  id v13 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100030730(v13);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A144;
  block[3] = &unk_1000647D8;
  uint64_t v19 = v12;
  id v20 = v5;
  id v14 = v5;
  uint64_t v15 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v16 = [(DSSnapshotRequest *)v15 progress];

  return v16;
}

@end