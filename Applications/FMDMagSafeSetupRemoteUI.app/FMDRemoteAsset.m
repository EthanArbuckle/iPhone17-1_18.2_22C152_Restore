@interface FMDRemoteAsset
- (FMDRemoteAsset)initWithAccessoryType:(id)a3 style:(id)a4 type:(unint64_t)a5;
- (NSString)accessoryType;
- (NSString)rawAccessoryType;
- (NSString)style;
- (id)assetStorageLocation;
- (id)assetURL;
- (id)getStoredAssetLocation;
- (id)name;
- (unint64_t)assetType;
- (void)fetchAssetWithCompletion:(id)a3;
- (void)setAccessoryType:(id)a3;
- (void)setAssetType:(unint64_t)a3;
- (void)setRawAccessoryType:(id)a3;
- (void)setStyle:(id)a3;
@end

@implementation FMDRemoteAsset

- (FMDRemoteAsset)initWithAccessoryType:(id)a3 style:(id)a4 type:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)FMDRemoteAsset;
  v11 = [(FMDRemoteAsset *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_rawAccessoryType, a3);
    v13 = +[NSString stringWithFormat:@"MFI4.0v1_%@", v12->_rawAccessoryType];
    uint64_t v14 = +[FMDExtHelper _computehash:v13];
    accessoryType = v12->_accessoryType;
    v12->_accessoryType = (NSString *)v14;

    objc_storeStrong((id *)&v12->_style, a4);
    v12->_assetType = a5;
  }

  return v12;
}

- (id)name
{
  switch([(FMDRemoteAsset *)self assetType])
  {
    case 0uLL:
      v3 = [(FMDRemoteAsset *)self rawAccessoryType];
      v4 = [(FMDRemoteAsset *)self style];
      +[NSString stringWithFormat:@"Magsafe/%@/%@/pairing-video__3x.mov", v3, v4];
      goto LABEL_7;
    case 1uLL:
      v3 = [(FMDRemoteAsset *)self rawAccessoryType];
      v4 = [(FMDRemoteAsset *)self style];
      +[NSString stringWithFormat:@"Magsafe/%@/%@/pairing-video-adjustments__3x.plist", v3, v4];
      goto LABEL_7;
    case 2uLL:
      v3 = [(FMDRemoteAsset *)self rawAccessoryType];
      v4 = [(FMDRemoteAsset *)self style];
      +[NSString stringWithFormat:@"Magsafe/%@/%@/online-sourcelist__3x.png", v3, v4];
      goto LABEL_7;
    case 3uLL:
      v3 = [(FMDRemoteAsset *)self rawAccessoryType];
      v4 = [(FMDRemoteAsset *)self style];
      +[NSString stringWithFormat:@"Magsafe/%@/%@/online-nolocation_ipad__3x.png", v3, v4];
      v5 = LABEL_7:;

      break;
    default:
      v5 = 0;
      break;
  }

  return v5;
}

- (id)assetURL
{
  v2 = [(FMDRemoteAsset *)self name];
  v3 = +[NSString stringWithFormat:@"https://statici.icloud.com/fmipmobile/deviceImages-9.0/Accessory/%@", v2];

  v4 = +[NSURL URLWithString:v3];

  return v4;
}

- (id)assetStorageLocation
{
  v2 = [(FMDRemoteAsset *)self name];
  v3 = +[NSString stringWithFormat:@"/var/mobile/Library/Caches/com.apple.icloud.findmydeviced/Assets/%@", v2];

  return v3;
}

- (void)fetchAssetWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  v5 = [(FMDRemoteAsset *)self assetStorageLocation];
  v6 = +[NSFileManager defaultManager];
  v7 = sub_100003338();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMDRemoteAsset: file location = %@", buf, 0xCu);
  }

  if ([v6 fileExistsAtPath:v5])
  {
    if ([(FMDRemoteAsset *)self assetType]
      || (v8 = objc_opt_new(),
          unsigned int v9 = [v8 isValidVideoAtFilePath:v5],
          v8,
          v9))
    {
      v4[2](v4, v5, 0);
      goto LABEL_17;
    }
    id v10 = sub_100003338();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMDRemoteAsset: Removing invalid cached asset.", buf, 2u);
    }

    id v37 = 0;
    [v6 removeItemAtPath:v5 error:&v37];
    id v11 = v37;
    if (v11)
    {
      v12 = sub_100003338();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10001E8AC((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  v19 = [(FMDRemoteAsset *)self assetURL];
  v20 = [FMDRemoteAssetValidator alloc];
  v21 = objc_opt_new();
  v22 = [(FMDRemoteAssetValidator *)v20 initWithRequestURL:v19 mimeTypeProvider:v21];

  v23 = +[NSURLSession sharedSession];
  v28 = _NSConcreteStackBlock;
  uint64_t v29 = 3221225472;
  v30 = sub_1000047BC;
  v31 = &unk_1000346D8;
  v32 = v22;
  v36 = v4;
  id v33 = v19;
  id v34 = v5;
  id v35 = v6;
  id v24 = v19;
  v25 = v22;
  v26 = [v23 downloadTaskWithURL:v24 completionHandler:&v28];

  v27 = sub_100003338();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "FMDRemoteAsset: task resumed", buf, 2u);
  }

  [v26 resume:v28, v29, v30, v31];
LABEL_17:
}

- (id)getStoredAssetLocation
{
  v2 = [(FMDRemoteAsset *)self assetStorageLocation];
  v3 = +[NSFileManager defaultManager];
  v4 = sub_100003338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDRemoteAsset: file location = %@", (uint8_t *)&v7, 0xCu);
  }

  if ([v3 fileExistsAtPath:v2]) {
    id v5 = v2;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (NSString)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(id)a3
{
}

- (NSString)rawAccessoryType
{
  return self->_rawAccessoryType;
}

- (void)setRawAccessoryType:(id)a3
{
}

- (NSString)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (unint64_t)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(unint64_t)a3
{
  self->_assetType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_rawAccessoryType, 0);

  objc_storeStrong((id *)&self->_accessoryType, 0);
}

@end