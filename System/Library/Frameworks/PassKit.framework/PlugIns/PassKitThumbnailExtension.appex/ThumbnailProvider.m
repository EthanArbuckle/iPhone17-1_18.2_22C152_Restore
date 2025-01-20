@interface ThumbnailProvider
- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation ThumbnailProvider

- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 maximumSize];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  v11 = [v5 fileURL];
  v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Generating thumbnail for file URL: %@", buf, 0xCu);
  }

  v14 = +[NSData dataWithContentsOfURL:v11];
  id v22 = 0;
  id v15 = +[PKPass createWithData:v14 warnings:0 error:&v22];
  id v16 = v22;
  if (v15)
  {
    [v15 loadContentSync];
    [v15 loadImageSetSync:0 preheat:1];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000396C;
    block[3] = &unk_100004128;
    id v18 = v15;
    uint64_t v20 = v8;
    uint64_t v21 = v10;
    id v19 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Could not generate thumbnail for invalid pass. Error: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, id))v6 + 2))(v6, 0, v16);
  }
}

@end