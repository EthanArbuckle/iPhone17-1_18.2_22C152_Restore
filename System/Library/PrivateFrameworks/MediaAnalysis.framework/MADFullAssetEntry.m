@interface MADFullAssetEntry
+ (id)entryWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 lastAttemptDate:(id)a6 analysisTypes:(unint64_t)a7 imageOnlyAnalysis:(BOOL)a8 existingAnalysis:(id)a9 isAnalysisFromComputeSync:(BOOL)a10 downloadResource:(id)a11 needDownload:(BOOL)a12 acceptableResources:(id)a13 previousErrorCode:(unint64_t)a14 previousErrorLine:(unint64_t)a15;
- (BOOL)isAnalysisFromComputeSync;
- (BOOL)needDownload;
- (MADFullAssetEntry)initWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 lastAttemptDate:(id)a6 analysisTypes:(unint64_t)a7 imageOnlyAnalysis:(BOOL)a8 existingAnalysis:(id)a9 isAnalysisFromComputeSync:(BOOL)a10 downloadResource:(id)a11 needDownload:(BOOL)a12 acceptableResources:(id)a13 previousErrorCode:(unint64_t)a14 previousErrorLine:(unint64_t)a15;
- (NSArray)acceptableResources;
- (NSData)downloadedData;
- (NSDate)currentAttemptDate;
- (NSDate)lastAttemptDate;
- (NSDictionary)analysisResults;
- (NSDictionary)existingAnalysis;
- (PHAsset)asset;
- (PHAssetResource)downloadResource;
- (double)processingInterval;
- (int)status;
- (int)version;
- (unint64_t)analysisTypes;
- (unint64_t)errorCode;
- (unint64_t)errorLine;
- (unint64_t)previousAttempts;
- (unint64_t)previousErrorCode;
- (unint64_t)previousErrorLine;
- (unint64_t)previousStatus;
- (void)setAcceptableResources:(id)a3;
- (void)setAnalysisResults:(id)a3;
- (void)setAnalysisTypes:(unint64_t)a3;
- (void)setDownloadResource:(id)a3;
- (void)setDownloadedData:(id)a3;
- (void)setErrorCode:(unint64_t)a3;
- (void)setErrorLine:(unint64_t)a3;
- (void)setExistingAnalysis:(id)a3;
- (void)setIsAnalysisFromComputeSync:(BOOL)a3;
- (void)setNeedDownload:(BOOL)a3;
- (void)setProcessingInterval:(double)a3;
- (void)setStatus:(int)a3;
- (void)setVersion:(int)a3;
@end

@implementation MADFullAssetEntry

- (MADFullAssetEntry)initWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 lastAttemptDate:(id)a6 analysisTypes:(unint64_t)a7 imageOnlyAnalysis:(BOOL)a8 existingAnalysis:(id)a9 isAnalysisFromComputeSync:(BOOL)a10 downloadResource:(id)a11 needDownload:(BOOL)a12 acceptableResources:(id)a13 previousErrorCode:(unint64_t)a14 previousErrorLine:(unint64_t)a15
{
  id v31 = a3;
  id v30 = a6;
  id v29 = a9;
  id v28 = a11;
  id v20 = a13;
  v32.receiver = self;
  v32.super_class = (Class)MADFullAssetEntry;
  v21 = [(MADFullAssetEntry *)&v32 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_asset, a3);
    v22->_status = 0;
    v22->_previousStatus = a4;
    v22->_previousAttempts = a5;
    objc_storeStrong((id *)&v22->_lastAttemptDate, a6);
    objc_storeStrong((id *)&v22->_downloadResource, a11);
    v22->_analysisTypes = a7;
    objc_storeStrong((id *)&v22->_existingAnalysis, a9);
    v22->_isAnalysisFromComputeSync = a10;
    uint64_t v23 = +[NSDate now];
    currentAttemptDate = v22->_currentAttemptDate;
    v22->_currentAttemptDate = (NSDate *)v23;

    v22->_needDownload = a12;
    downloadedData = v22->_downloadedData;
    v22->_downloadedData = 0;

    objc_storeStrong((id *)&v22->_acceptableResources, a13);
    v22->_previousErrorCode = a14;
    v22->_errorCode = 0;
    v22->_previousErrorLine = a15;
    v22->_errorLine = 0;
  }

  return v22;
}

+ (id)entryWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 lastAttemptDate:(id)a6 analysisTypes:(unint64_t)a7 imageOnlyAnalysis:(BOOL)a8 existingAnalysis:(id)a9 isAnalysisFromComputeSync:(BOOL)a10 downloadResource:(id)a11 needDownload:(BOOL)a12 acceptableResources:(id)a13 previousErrorCode:(unint64_t)a14 previousErrorLine:(unint64_t)a15
{
  BOOL v28 = a8;
  id v16 = a3;
  id v17 = a6;
  id v18 = a9;
  id v19 = a11;
  id v20 = a13;
  LOBYTE(v24) = a12;
  LOBYTE(v23) = a10;
  id v21 = [objc_alloc((Class)objc_opt_class()) initWithAsset:v16 previousStatus:a4 previousAttempts:a5 lastAttemptDate:v17 analysisTypes:a7 imageOnlyAnalysis:v28 existingAnalysis:v18 isAnalysisFromComputeSync:v23 downloadResource:v19 needDownload:v24 acceptableResources:v20 previousErrorCode:a14 previousErrorLine:a15];

  return v21;
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

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (unint64_t)analysisTypes
{
  return self->_analysisTypes;
}

- (void)setAnalysisTypes:(unint64_t)a3
{
  self->_analysisTypes = a3;
}

- (NSDictionary)existingAnalysis
{
  return self->_existingAnalysis;
}

- (void)setExistingAnalysis:(id)a3
{
}

- (BOOL)isAnalysisFromComputeSync
{
  return self->_isAnalysisFromComputeSync;
}

- (void)setIsAnalysisFromComputeSync:(BOOL)a3
{
  self->_isAnalysisFromComputeSync = a3;
}

- (NSDictionary)analysisResults
{
  return self->_analysisResults;
}

- (void)setAnalysisResults:(id)a3
{
}

- (BOOL)needDownload
{
  return self->_needDownload;
}

- (void)setNeedDownload:(BOOL)a3
{
  self->_needDownload = a3;
}

- (PHAssetResource)downloadResource
{
  return self->_downloadResource;
}

- (void)setDownloadResource:(id)a3
{
}

- (NSData)downloadedData
{
  return self->_downloadedData;
}

- (void)setDownloadedData:(id)a3
{
}

- (NSArray)acceptableResources
{
  return self->_acceptableResources;
}

- (void)setAcceptableResources:(id)a3
{
}

- (double)processingInterval
{
  return self->_processingInterval;
}

- (void)setProcessingInterval:(double)a3
{
  self->_processingInterval = a3;
}

- (unint64_t)previousErrorCode
{
  return self->_previousErrorCode;
}

- (unint64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(unint64_t)a3
{
  self->_errorCode = a3;
}

- (unint64_t)previousErrorLine
{
  return self->_previousErrorLine;
}

- (unint64_t)errorLine
{
  return self->_errorLine;
}

- (void)setErrorLine:(unint64_t)a3
{
  self->_errorLine = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptableResources, 0);
  objc_storeStrong((id *)&self->_downloadedData, 0);
  objc_storeStrong((id *)&self->_downloadResource, 0);
  objc_storeStrong((id *)&self->_analysisResults, 0);
  objc_storeStrong((id *)&self->_existingAnalysis, 0);
  objc_storeStrong((id *)&self->_currentAttemptDate, 0);
  objc_storeStrong((id *)&self->_lastAttemptDate, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end