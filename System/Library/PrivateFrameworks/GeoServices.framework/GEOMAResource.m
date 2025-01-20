@interface GEOMAResource
+ (BOOL)_fixPermissionsAndRemoveResourceAt:(id)a3 error:(id *)a4;
+ (BOOL)_removeResourceAt:(id)a3 error:(id *)a4;
+ (BOOL)removeResourceAt:(id)a3 error:(id *)a4;
+ (void)onFileAccessQueueAsync:(id)a3;
+ (void)onFileAccessQueueSync:(id)a3;
- (BOOL)isAvailableForUse;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnDisk;
- (BOOL)remove:(id *)a3;
- (GEOMAResource)initWithMobileAsset:(id)a3 info:(id)a4;
- (GEOMAResource)initWithResourceFolder:(id)a3 info:(id)a4;
- (GEOMAResourceInfo)resourceInfo;
- (NSDictionary)attributes;
- (NSString)assetId;
- (NSString)contentVersion;
- (id)_getLocalFileUrl;
- (id)_getPlistURL;
- (id)description;
- (id)getLocalFileUrl;
- (int64_t)compare:(id)a3;
- (int64_t)state;
- (unint64_t)hash;
- (unint64_t)size;
- (void)_relocateOnQueue:(id)a3 completion:(id)a4;
- (void)downloadWithOptions:(id)a3;
- (void)downloadWithOptions:(id)a3 queue:(id)a4 completion:(id)a5;
@end

@implementation GEOMAResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_attributes, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

- (BOOL)isAvailableForUse
{
  return self->_cacheURL != 0;
}

- (GEOMAResource)initWithResourceFolder:(id)a3 info:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)GEOMAResource;
  v9 = [(GEOMAResource *)&v22 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v9->_cacheURL, a3);
  objc_storeStrong((id *)&v10->_info, a4);
  v11 = [(GEOMAResource *)v10 _getPlistURL];
  id v21 = 0;
  v12 = +[NSData dataWithContentsOfURL:v11 options:0 error:&v21];
  id v13 = v21;
  if (!v12)
  {
    v18 = sub_10000966C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478083;
      v24 = v11;
      __int16 v25 = 2112;
      id v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Unable to read plist at %{private}@: %@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  id v20 = 0;
  uint64_t v14 = +[NSPropertyListSerialization propertyListWithData:v12 options:0 format:0 error:&v20];
  id v15 = v20;

  attributes = v10->_attributes;
  v10->_attributes = (NSDictionary *)v14;

  if (!v10->_attributes)
  {
    v18 = sub_10000966C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478083;
      v24 = v11;
      __int16 v25 = 2112;
      id v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Unable to decode plist at %{private}@: %@", buf, 0x16u);
    }
    id v13 = v15;
LABEL_11:

    v17 = 0;
    goto LABEL_12;
  }

LABEL_5:
  v17 = v10;
LABEL_12:

  return v17;
}

- (id)getLocalFileUrl
{
  asset = self->_asset;
  if (asset && ([(MAAsset *)asset state] == (id)2 || [(MAAsset *)self->_asset state] == (id)3))
  {
    v4 = [(GEOMAResource *)self _getLocalFileUrl];
  }
  else
  {
    v4 = self->_cacheURL;
  }

  return v4;
}

- (id)_getPlistURL
{
  v2 = [(GEOMAResource *)self _getLocalFileUrl];
  v3 = [v2 URLByAppendingPathComponent:@".MAAttributes.plist"];

  return v3;
}

- (id)_getLocalFileUrl
{
  if (self->_asset)
  {
    v3 = [(GEOMAResourceInfo *)self->_info baseURL];
    v4 = [(MAAsset *)self->_asset assetId];
    v5 = [v3 URLByAppendingPathComponent:v4 isDirectory:1];
  }
  else
  {
    v5 = self->_cacheURL;
  }

  return v5;
}

+ (void)onFileAccessQueueSync:(id)a3
{
  id v3 = a3;
  v4 = sub_10000A4D0();
  dispatch_sync(v4, v3);
}

- (GEOMAResource)initWithMobileAsset:(id)a3 info:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOMAResource;
  v9 = [(GEOMAResource *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    uint64_t v11 = [(MAAsset *)v10->_asset attributes];
    attributes = v10->_attributes;
    v10->_attributes = (NSDictionary *)v11;

    cacheURL = v10->_cacheURL;
    v10->_cacheURL = 0;

    objc_storeStrong((id *)&v10->_info, a4);
  }

  return v10;
}

- (NSString)assetId
{
  asset = self->_asset;
  if (asset) {
    [(MAAsset *)asset assetId];
  }
  else {
  v4 = [(NSURL *)self->_cacheURL lastPathComponent];
  }

  return (NSString *)v4;
}

- (BOOL)isOnDisk
{
  unint64_t v2 = [(GEOMAResource *)self state];
  return (v2 < 7) & (0x6Cu >> v2);
}

- (int64_t)state
{
  if (self->_cacheURL) {
    return 2;
  }
  asset = self->_asset;
  if (asset) {
    return (int64_t)[(MAAsset *)asset state];
  }
  else {
    return 1;
  }
}

- (unint64_t)size
{
  unint64_t v2 = [(GEOMAResource *)self attributes];
  id v3 = [v2 objectForKeyedSubscript:@"_UnarchivedSize"];
  id v4 = [v3 unsignedLongLongValue];

  return (unint64_t)v4;
}

- (NSString)contentVersion
{
  unint64_t v2 = [(GEOMAResource *)self attributes];
  id v3 = [v2 objectForKeyedSubscript:@"_ContentVersion"];

  return (NSString *)v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(GEOMAResource *)self contentVersion];
  v6 = [v4 contentVersion];
  int64_t v7 = (int64_t)[v5 compare:v6];

  if (!v7)
  {
    id v8 = [(GEOMAResource *)self state];
    if (v8 == [v4 state])
    {
      int64_t v7 = 0;
      goto LABEL_15;
    }
    if ((id)[(GEOMAResource *)self state] == (id)2) {
      goto LABEL_14;
    }
    if ([v4 state] == (id)2) {
      goto LABEL_12;
    }
    if ((id)[(GEOMAResource *)self state] == (id)3) {
      goto LABEL_14;
    }
    if ([v4 state] == (id)3) {
      goto LABEL_12;
    }
    if ((id)[(GEOMAResource *)self state] == (id)5) {
      goto LABEL_14;
    }
    if ([v4 state] == (id)5)
    {
LABEL_12:
      int64_t v7 = -1;
      goto LABEL_15;
    }
    if ((id)[(GEOMAResource *)self state] == (id)6) {
      goto LABEL_14;
    }
    if ([v4 state] == (id)6) {
      goto LABEL_12;
    }
    if ((id)[(GEOMAResource *)self state] == (id)4)
    {
LABEL_14:
      int64_t v7 = 1;
      goto LABEL_15;
    }
    if ([v4 state] == (id)4) {
      int64_t v7 = -1;
    }
    else {
      int64_t v7 = 0;
    }
  }
LABEL_15:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(GEOMAResource *)self assetId];
    v6 = [v4 assetId];
    unsigned __int8 v7 = [v5 isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v2 = [(GEOMAResource *)self assetId];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (void)downloadWithOptions:(id)a3
{
}

- (void)downloadWithOptions:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  global_queue = a4;
  id v10 = a5;
  if (!global_queue)
  {
    qos_class_self();
    global_queue = geo_get_global_queue();
  }
  asset = self->_asset;
  if (asset)
  {
    unint64_t v12 = (unint64_t)[(MAAsset *)asset state];
    if (v12 > 6) {
      goto LABEL_13;
    }
    if (((1 << v12) & 0x6C) != 0)
    {
      id v13 = sub_10000966C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Found installed copy, relocating it", buf, 2u);
      }

      uint64_t v14 = sub_10000A4D0();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000238C8;
      block[3] = &unk_100071ED0;
      block[4] = self;
      v24 = global_queue;
      id v25 = v10;
      dispatch_async(v14, block);

      objc_super v15 = v24;
      goto LABEL_20;
    }
    if (v12 != 4 || v10)
    {
LABEL_13:
      v16 = sub_10000966C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Requesting download of asset", buf, 2u);
      }

      v17 = self->_asset;
      v18 = v8;
      if (!v8)
      {
        v18 = [(GEOMAResourceInfo *)self->_info downloadOptions];
      }
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000238D8;
      v20[3] = &unk_100071F20;
      v20[4] = self;
      id v21 = global_queue;
      id v22 = v10;
      [(MAAsset *)v17 startDownload:v18 completionWithError:v20];
      if (!v8) {

      }
      objc_super v15 = v21;
      goto LABEL_20;
    }
    v19 = sub_10000966C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "MA is already downloading this for us", buf, 2u);
    }
  }
  else if (v10)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000238B0;
    v27[3] = &unk_1000714E0;
    v28 = v10;
    dispatch_async(global_queue, v27);
    objc_super v15 = v28;
LABEL_20:
  }
}

- (void)_relocateOnQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1000240DC;
  v51[3] = &unk_100071F48;
  id v42 = a4;
  id v53 = v42;
  id v41 = v6;
  id v52 = v41;
  unsigned __int8 v7 = objc_retainBlock(v51);
  uint64_t v8 = [(MAAsset *)self->_asset getLocalUrl];
  v9 = [(GEOMAResource *)self _getLocalFileUrl];
  id v10 = +[NSFileManager defaultManager];
  uint64_t v11 = [v9 path];
  unint64_t v12 = [v11 stringByDeletingLastPathComponent];
  unsigned __int8 v13 = [v10 fileExistsAtPath:v12];

  if ((v13 & 1) == 0)
  {
    NSFileAttributeKey v56 = NSFilePosixPermissions;
    v57 = &off_100077418;
    id v14 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    objc_super v15 = +[NSFileManager defaultManager];
    v16 = [v9 URLByDeletingLastPathComponent];
    id v50 = 0;
    unsigned __int8 v17 = [v15 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:v14 error:&v50];
    id v18 = v50;

    if ((v17 & 1) == 0)
    {
      v39 = sub_10000966C();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v55 = v18;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Unable to create directory for asset: %@", buf, 0xCu);
      }

      ((void (*)(void *, uint64_t, id))v7[2])(v7, 7, v18);
      goto LABEL_22;
    }
  }
  v19 = +[NSFileManager defaultManager];
  id v20 = [v9 path];
  unsigned int v21 = [v19 fileExistsAtPath:v20];

  if (!v21) {
    goto LABEL_9;
  }
  id v22 = sub_10000966C();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Found existing copy at destination, will remove it", buf, 2u);
  }

  id v49 = 0;
  unsigned __int8 v23 = [(id)objc_opt_class() _removeResourceAt:v9 error:&v49];
  id v24 = v49;
  id v14 = v24;
  if ((v23 & 1) == 0)
  {
    ((void (*)(void *, uint64_t, id))v7[2])(v7, 7, v24);
LABEL_22:
    id v26 = (void *)v8;
    goto LABEL_31;
  }

LABEL_9:
  id v25 = +[NSFileManager defaultManager];
  id v48 = 0;
  id v26 = (void *)v8;
  unsigned __int8 v27 = [v25 copyItemAtURL:v8 toURL:v9 error:&v48];
  id v14 = v48;

  if (v27)
  {
    v28 = [(GEOMAResource *)self attributes];
    id v47 = 0;
    v29 = +[NSPropertyListSerialization dataWithPropertyList:v28 format:200 options:0 error:&v47];
    id v30 = v47;

    if (v29)
    {
      v31 = [(GEOMAResource *)self _getPlistURL];
      id v46 = v30;
      unsigned __int8 v32 = [v29 writeToURL:v31 options:0x10000000 error:&v46];
      id v33 = v46;

      v34 = sub_10000966C();
      v35 = v34;
      if (v32)
      {
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Asseet relocation successful", buf, 2u);
        }

        objc_storeStrong((id *)&self->_cacheURL, v9);
        asset = self->_asset;
        self->_asset = 0;
        v37 = asset;

        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_100024188;
        v43[3] = &unk_100071F70;
        v44 = v7;
        uint64_t v45 = 0;
        [(MAAsset *)v37 purgeWithError:v43];
      }
      else
      {
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v55 = v33;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Unable write info plist: %@", buf, 0xCu);
        }

        [(id)objc_opt_class() _removeResourceAt:v9 error:0];
        ((void (*)(void *, uint64_t, id))v7[2])(v7, 7, v33);
      }

      id v30 = v33;
    }
    else
    {
      v40 = sub_10000966C();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v55 = v30;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Unable create info plist: %@", buf, 0xCu);
      }

      [(id)objc_opt_class() _removeResourceAt:v9 error:0];
      ((void (*)(void *, uint64_t, id))v7[2])(v7, 7, v30);
    }
  }
  else
  {
    v38 = sub_10000966C();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v55 = v14;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Unable to copy resource into place: %@", buf, 0xCu);
    }

    [(id)objc_opt_class() _removeResourceAt:v9 error:0];
    ((void (*)(void *, uint64_t, id))v7[2])(v7, 7, v14);
  }
LABEL_31:
}

- (BOOL)remove:(id *)a3
{
  v5 = objc_opt_class();
  id v6 = [(GEOMAResource *)self getLocalFileUrl];
  LOBYTE(a3) = [v5 removeResourceAt:v6 error:a3];

  return (char)a3;
}

+ (BOOL)removeResourceAt:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = sub_10000A4D0();
  dispatch_assert_queue_not_V2(v7);

  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_100024370;
  unsigned int v21 = sub_100024380;
  id v22 = 0;
  uint64_t v8 = sub_10000A4D0();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100024388;
  v12[3] = &unk_100071F98;
  id v14 = &v23;
  id v16 = a1;
  id v9 = v6;
  id v13 = v9;
  objc_super v15 = &v17;
  dispatch_sync(v8, v12);

  if (a4) {
    *a4 = (id) v18[5];
  }
  char v10 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

+ (BOOL)_removeResourceAt:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = +[NSFileManager defaultManager];
  id v14 = 0;
  unsigned __int8 v8 = [v7 removeItemAtURL:v6 error:&v14];
  id v9 = v14;

  if ((v8 & 1) == 0)
  {
    char v10 = [v9 domain];
    if ([v10 isEqual:NSCocoaErrorDomain])
    {
      id v11 = [v9 code];

      if (v11 == (id)513)
      {
        unsigned __int8 v8 = [a1 _fixPermissionsAndRemoveResourceAt:v6 error:a4];
        goto LABEL_11;
      }
    }
    else
    {
    }
    unint64_t v12 = sub_10000966C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = a1;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to delete resource %@: %@", buf, 0x16u);
    }
  }
  if (a4) {
    *a4 = v9;
  }
LABEL_11:

  return v8;
}

+ (BOOL)_fixPermissionsAndRemoveResourceAt:(id)a3 error:(id *)a4
{
  id v6 = a3;
  NSFileAttributeKey v25 = NSFilePosixPermissions;
  char v26 = &off_100077418;
  unsigned __int8 v7 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  unsigned __int8 v8 = +[NSFileManager defaultManager];
  id v9 = [v6 path];
  id v20 = 0;
  unsigned __int8 v10 = [v8 setAttributes:v7 ofItemAtPath:v9 error:&v20];
  id v11 = v20;

  if (v10)
  {
    unint64_t v12 = +[NSFileManager defaultManager];
    id v19 = v11;
    unsigned __int8 v13 = [v12 removeItemAtURL:v6 error:&v19];
    id v14 = v19;

    if (v13)
    {
      BOOL v15 = 1;
      id v11 = v14;
      if (!a4) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    id v11 = v14;
  }
  else
  {
    id v16 = sub_10000966C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unable to fix permissions: %@", buf, 0xCu);
    }
  }
  __int16 v17 = sub_10000966C();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = a1;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Unable to delete resource %@: %@", buf, 0x16u);
  }

  BOOL v15 = 0;
  if (a4) {
LABEL_12:
  }
    *a4 = v11;
LABEL_13:

  return v15;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(GEOMAResource *)self assetId];
  id v6 = [(GEOMAResource *)self contentVersion];
  int64_t v7 = [(GEOMAResource *)self state];
  if ((unint64_t)(v7 - 1) > 5) {
    CFStringRef v8 = @"unknown";
  }
  else {
    CFStringRef v8 = off_100071FD8[v7 - 1];
  }
  id v9 = +[NSString stringWithFormat:@"<%@ %p - id: %@ ver: %@ state: %@>", v4, self, v5, v6, v8];

  return v9;
}

+ (void)onFileAccessQueueAsync:(id)a3
{
  id v3 = a3;
  id v4 = sub_10000A4D0();
  dispatch_async(v4, v3);
}

- (GEOMAResourceInfo)resourceInfo
{
  return (GEOMAResourceInfo *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

@end