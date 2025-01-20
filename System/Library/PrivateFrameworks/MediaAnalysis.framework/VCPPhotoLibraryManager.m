@interface VCPPhotoLibraryManager
+ (id)sharedManager;
- (VCPPhotoLibraryManager)init;
- (VCPPhotoLibraryManager)initWithPhotoLibraryPaths:(id)a3;
- (id)allPhotoLibraries;
- (id)photoLibraryWithURL:(id)a3;
- (void)dealloc;
- (void)persistPhotoLibraries;
@end

@implementation VCPPhotoLibraryManager

- (VCPPhotoLibraryManager)init
{
  return 0;
}

- (VCPPhotoLibraryManager)initWithPhotoLibraryPaths:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VCPPhotoLibraryManager;
  v5 = [(VCPPhotoLibraryManager *)&v17 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediaanalysisd.VCPPhotoLibraryManager", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = +[NSMutableDictionary dictionary];
    openPhotoLibraries = v5->_openPhotoLibraries;
    v5->_openPhotoLibraries = (NSMutableDictionary *)v8;

    uint64_t v10 = +[NSMutableArray arrayWithArray:v4];
    knownPhotoLibraries = v5->_knownPhotoLibraries;
    v5->_knownPhotoLibraries = (NSMutableArray *)v10;

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10010E7D8;
    v15[3] = &unk_10021E210;
    v16 = v5;
    v13 = objc_retainBlock(v15);
    ((void (*)(void *, uint64_t, const __CFString *))v13[2])(v13, 1, @"System");
    ((void (*)(void *, uint64_t, const __CFString *))v13[2])(v13, 3, @"Syndication");
  }

  return v5;
}

+ (id)sharedManager
{
  if (qword_100252750 != -1) {
    dispatch_once(&qword_100252750, &stru_10021E230);
  }
  v2 = (void *)qword_100252748;
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)VCPPhotoLibraryManager;
  [(VCPPhotoLibraryManager *)&v2 dealloc];
}

- (id)allPhotoLibraries
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10010EC24;
  uint64_t v10 = sub_10010EC34;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10010EC3C;
  v5[3] = &unk_10021E298;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)persistPhotoLibraries
{
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v3, v4))
    {
      knownPhotoLibraries = self->_knownPhotoLibraries;
      int v9 = 138412290;
      uint64_t v10 = knownPhotoLibraries;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Persisting Photo Library paths %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v6 = +[NSUserDefaults standardUserDefaults];
  [v6 setObject:self->_knownPhotoLibraries forKey:@"PhotoLibraries"];
  if (([v6 synchronize] & 1) == 0 && (int)MediaAnalysisLogLevel() >= 4)
  {
    v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v7, v8))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Failed to persist known Photo Libraries", (uint8_t *)&v9, 2u);
    }
  }
}

- (id)photoLibraryWithURL:(id)a3
{
  id v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v5, v6))
    {
      v7 = [v4 path];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Request for photo library at path %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (v4)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x3032000000;
    v19 = sub_10010EC24;
    v20 = sub_10010EC34;
    id v21 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010F334;
    block[3] = &unk_10021E2C0;
    v15 = self;
    p_long long buf = &buf;
    id v14 = v4;
    dispatch_sync(queue, block);
    id v9 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      uint64_t v10 = VCPLogInstance();
      os_log_type_t v11 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v10, v11))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Photo Library requested with nil URL", (uint8_t *)&buf, 2u);
      }
    }
    id v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownPhotoLibraries, 0);
  objc_storeStrong((id *)&self->_openPhotoLibraries, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end