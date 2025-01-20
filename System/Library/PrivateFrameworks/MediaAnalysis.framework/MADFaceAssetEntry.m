@interface MADFaceAssetEntry
+ (id)entryWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 andLastAttemptDate:(id)a6;
- (BOOL)isAnalysisCompleteFromComputeSync;
- (MADFaceAssetEntry)initWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 andLastAttemptDate:(id)a6;
- (NSDate)currentAttemptDate;
- (NSDate)lastAttemptDate;
- (NSDictionary)results;
- (NSURL)downloadURL;
- (PHAsset)asset;
- (PHAssetResource)downloadResource;
- (int)status;
- (unint64_t)previousAttempts;
- (unint64_t)previousStatus;
- (void)setDownloadResource:(id)a3;
- (void)setDownloadURL:(id)a3;
- (void)setIsAnalysisCompleteFromComputeSync:(BOOL)a3;
- (void)setResults:(id)a3;
- (void)setStatus:(int)a3;
@end

@implementation MADFaceAssetEntry

- (MADFaceAssetEntry)initWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 andLastAttemptDate:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MADFaceAssetEntry;
  v13 = [(MADFaceAssetEntry *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_asset, a3);
    v14->_status = 0;
    v14->_previousStatus = a4;
    v14->_previousAttempts = a5;
    objc_storeStrong((id *)&v14->_lastAttemptDate, a6);
    uint64_t v15 = +[NSDate now];
    currentAttemptDate = v14->_currentAttemptDate;
    v14->_currentAttemptDate = (NSDate *)v15;
  }
  return v14;
}

+ (id)entryWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 andLastAttemptDate:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = [objc_alloc((Class)objc_opt_class()) initWithAsset:v9 previousStatus:a4 previousAttempts:a5 andLastAttemptDate:v10];

  return v11;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (unint64_t)previousStatus
{
  return self->_previousStatus;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (unint64_t)previousAttempts
{
  return self->_previousAttempts;
}

- (NSDate)lastAttemptDate
{
  return self->_lastAttemptDate;
}

- (NSDate)currentAttemptDate
{
  return self->_currentAttemptDate;
}

- (NSDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (PHAssetResource)downloadResource
{
  return self->_downloadResource;
}

- (void)setDownloadResource:(id)a3
{
}

- (NSURL)downloadURL
{
  return self->_downloadURL;
}

- (void)setDownloadURL:(id)a3
{
}

- (BOOL)isAnalysisCompleteFromComputeSync
{
  return self->_isAnalysisCompleteFromComputeSync;
}

- (void)setIsAnalysisCompleteFromComputeSync:(BOOL)a3
{
  self->_isAnalysisCompleteFromComputeSync = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadURL, 0);
  objc_storeStrong((id *)&self->_downloadResource, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_currentAttemptDate, 0);
  objc_storeStrong((id *)&self->_lastAttemptDate, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end