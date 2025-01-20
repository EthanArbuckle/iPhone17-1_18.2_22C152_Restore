@interface BLArtworkHelper
+ (id)writeArtworkDownloadID:(id)a3 artworkURL:(id)a4 error:(id *)a5;
@end

@implementation BLArtworkHelper

+ (id)writeArtworkDownloadID:(id)a3 artworkURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_100026288;
  v47 = sub_100026298;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_100026288;
  v41 = sub_100026298;
  id v42 = 0;
  if (v8 && [v7 length])
  {
    v9 = +[BLDownloadManager downloadDirectoryForDownloadID:v7];
    v10 = [v9 URLByAppendingPathComponent:off_1001C7638];

    if (v10)
    {
      v11 = BLBookInstallLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [v10 path];
        *(_DWORD *)buf = 138543874;
        id v50 = v7;
        __int16 v51 = 2112;
        id v52 = v8;
        __int16 v53 = 2112;
        v54 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Artwork-Helper]: Downloading Artwork from URL %@ to %@", buf, 0x20u);
      }
      dispatch_group_t v13 = dispatch_group_create();
      id v14 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v8];
      [v14 setCachePolicy:1];
      v15 = +[NSURLSessionConfiguration defaultSessionConfiguration];
      v16 = +[NSURLSession sessionWithConfiguration:v15];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000262A0;
      v31[3] = &unk_1001A1BD8;
      id v32 = v7;
      v35 = &v37;
      id v33 = v10;
      v36 = &v43;
      v17 = v13;
      v34 = v17;
      v18 = [v16 downloadTaskWithRequest:v14 completionHandler:v31];
      if (v18)
      {
        dispatch_group_enter(v17);
        [v18 resume];
        dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
      }
      else
      {
        uint64_t v23 = sub_10004B6AC(0, @"Failed to create download task", 0);
        v24 = (void *)v38[5];
        v38[5] = v23;
      }
      if (v38[5])
      {
        v25 = BLBookInstallLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = (void *)v38[5];
          *(_DWORD *)buf = 138412290;
          id v50 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[Artwork-Helper]: Error encountered retrieving iTunesArtwork.  %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v21 = BLBookInstallLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "[Artwork-Helper]: error ... could not get a localFileURL", buf, 2u);
      }

      uint64_t v22 = sub_10004B6AC(24, 0, @"Could not produce a local downloads directory.");
      v17 = v38[5];
      v38[5] = v22;
    }
  }
  else
  {
    uint64_t v19 = sub_10004B6AC(24, 0, @"Unknown artwork URL or download ID.");
    v20 = (void *)v38[5];
    v38[5] = v19;
  }
  if (a5)
  {
    v27 = (void *)v38[5];
    if (v27) {
      *a5 = v27;
    }
  }
  id v28 = (id)v44[5];
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);

  return v28;
}

@end