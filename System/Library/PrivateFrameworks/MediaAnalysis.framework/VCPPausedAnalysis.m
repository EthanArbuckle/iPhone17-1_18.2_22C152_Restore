@interface VCPPausedAnalysis
+ (id)filepathForPhotoLibrary:(id)a3;
+ (id)pausedAnalysis:(id)a3 forAsset:(id)a4;
+ (id)persistedPausedAnalysisFromPhotoLibrary:(id)a3;
- (NSDictionary)analysis;
- (PHAsset)asset;
- (VCPPausedAnalysis)initWithAnalysis:(id)a3 forAsset:(id)a4;
- (VCPPausedAnalysis)initWithFileFromPhotoLibrary:(id)a3;
- (int)persist;
@end

@implementation VCPPausedAnalysis

+ (id)filepathForPhotoLibrary:(id)a3
{
  v3 = objc_msgSend(a3, "vcp_mediaAnalysisDirectory");
  v4 = [v3 stringByAppendingPathComponent:@"paused.plist"];

  return v4;
}

- (VCPPausedAnalysis)initWithFileFromPhotoLibrary:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() filepathForPhotoLibrary:v4];
  v6 = +[NSFileManager defaultManager];
  if ([v6 fileExistsAtPath:v5])
  {
    v19.receiver = self;
    v19.super_class = (Class)VCPPausedAnalysis;
    self = [(VCPPausedAnalysis *)&v19 init];
    if (self)
    {
      v7 = +[NSDictionary dictionaryWithContentsOfFile:v5];
      [v6 removeItemAtPath:v5 error:0];
      if (v7
        && ([v7 objectForKey:@"pausedAnalysis"],
            v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue(),
            analysis = self->_analysis,
            self->_analysis = v8,
            analysis,
            self->_analysis)
        && ([v7 objectForKey:@"localIdentifier"],
            (v10 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v11 = +[PHAsset vcp_fetchOptionsForLibrary:v4 forTaskID:1];
        v20 = v10;
        v12 = +[NSArray arrayWithObjects:&v20 count:1];
        v13 = +[PHAsset fetchAssetsWithLocalIdentifiers:v12 options:v11];

        if ([v13 count] == (id)1)
        {
          v14 = [v13 objectAtIndexedSubscript:0];
          asset = self->_asset;
          self->_asset = v14;

          v16 = self;
        }
        else
        {
          v16 = 0;
        }
      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      v16 = 0;
    }
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)persistedPausedAnalysisFromPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithFileFromPhotoLibrary:v3];

  return v4;
}

- (VCPPausedAnalysis)initWithAnalysis:(id)a3 forAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VCPPausedAnalysis;
  v9 = [(VCPPausedAnalysis *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a4);
    objc_storeStrong((id *)&v10->_analysis, a3);
  }

  return v10;
}

+ (id)pausedAnalysis:(id)a3 forAsset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithAnalysis:v5 forAsset:v6];

  return v7;
}

- (int)persist
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v3, v4))
    {
      id v5 = [(PHAsset *)self->_asset localIdentifier];
      *(_DWORD *)buf = 138412290;
      v26 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "  [%@] Persisting paused analysis", buf, 0xCu);
    }
  }
  id v6 = objc_opt_class();
  id v7 = [(PHAsset *)self->_asset photoLibrary];
  id v8 = [v6 filepathForPhotoLibrary:v7];

  v9 = +[NSFileManager defaultManager];
  if ([v9 fileExistsAtPath:v8] && (int)MediaAnalysisLogLevel() >= 4)
  {
    v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v10, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "  Overwriting existing paused analysis", buf, 2u);
    }
  }
  NSFileAttributeKey v23 = NSFileProtectionKey;
  NSFileProtectionType v24 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  objc_super v12 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  v13 = [(PHAsset *)self->_asset localIdentifier];
  v21[1] = @"pausedAnalysis";
  v22[0] = v13;
  v22[1] = self->_analysis;
  v14 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

  v15 = +[NSPropertyListSerialization dataWithPropertyList:v14 format:200 options:0 error:0];
  if (v15)
  {
    if ([v9 createFileAtPath:v8 contents:v15 attributes:v12])
    {
      int v16 = 0;
      goto LABEL_19;
    }
    int v16 = -20;
  }
  else
  {
    int v16 = -18;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v17 = VCPLogInstance();
    os_log_type_t v18 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v17, v18))
    {
      objc_super v19 = [(PHAsset *)self->_asset localIdentifier];
      *(_DWORD *)buf = 138412290;
      v26 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "  [%@] Failed to persist paused analysis", buf, 0xCu);
    }
  }
LABEL_19:

  return v16;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (NSDictionary)analysis
{
  return self->_analysis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end