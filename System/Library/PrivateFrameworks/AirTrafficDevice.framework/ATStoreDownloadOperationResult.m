@interface ATStoreDownloadOperationResult
- (BOOL)cancelAllRemaining;
- (BOOL)isHLSDownload;
- (ICRequestContext)requestContext;
- (ICStoreMediaResponseItem)storeMediaResponseItem;
- (NSData)resumeData;
- (NSDictionary)assetClientParams;
- (NSString)downloadFilePath;
- (id)description;
- (void)setAssetClientParams:(id)a3;
- (void)setCancelAllRemaining:(BOOL)a3;
- (void)setDownloadFilePath:(id)a3;
- (void)setIsHLSDownload:(BOOL)a3;
- (void)setRequestContext:(id)a3;
- (void)setResumeData:(id)a3;
- (void)setStoreMediaResponseItem:(id)a3;
@end

@implementation ATStoreDownloadOperationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetClientParams, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_storeMediaResponseItem, 0);
  objc_storeStrong((id *)&self->_resumeData, 0);

  objc_storeStrong((id *)&self->_downloadFilePath, 0);
}

- (void)setAssetClientParams:(id)a3
{
}

- (NSDictionary)assetClientParams
{
  return self->_assetClientParams;
}

- (void)setIsHLSDownload:(BOOL)a3
{
  self->_isHLSDownload = a3;
}

- (BOOL)isHLSDownload
{
  return self->_isHLSDownload;
}

- (void)setRequestContext:(id)a3
{
}

- (ICRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setStoreMediaResponseItem:(id)a3
{
}

- (ICStoreMediaResponseItem)storeMediaResponseItem
{
  return self->_storeMediaResponseItem;
}

- (void)setResumeData:(id)a3
{
}

- (NSData)resumeData
{
  return self->_resumeData;
}

- (void)setDownloadFilePath:(id)a3
{
}

- (NSString)downloadFilePath
{
  return self->_downloadFilePath;
}

- (void)setCancelAllRemaining:(BOOL)a3
{
  self->_cancelAllRemaining = a3;
}

- (BOOL)cancelAllRemaining
{
  return self->_cancelAllRemaining;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)ATStoreDownloadOperationResult;
  v4 = [(ATStoreDownloadOperationResult *)&v7 description];
  v5 = [v3 stringWithFormat:@"<%@ [cancelRemaining=%d, hasResumeData=%d, path=%@]>", v4, self->_cancelAllRemaining, self->_resumeData != 0, self->_downloadFilePath];

  return v5;
}

@end