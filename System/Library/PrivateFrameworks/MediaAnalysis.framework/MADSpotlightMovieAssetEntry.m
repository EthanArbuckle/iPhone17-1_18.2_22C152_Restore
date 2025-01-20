@interface MADSpotlightMovieAssetEntry
+ (id)entryWithAsset:(id)a3;
- (MADManagedSpotlightEntry)asset;
- (MADSpotlightMovieAssetEntry)initWithAsset:(id)a3;
- (NSArray)summarizedEmbeddings;
- (NSData)timeRangeResults;
- (NSData)timerangeEmbeddings;
- (NSSet)actionClassifications;
- (NSSet)nsfwClassifications;
- (NSSet)sceneClassifications;
- (int)consumeSandboxExtension;
- (int)status;
- (unint64_t)embeddingVersion;
- (unint64_t)mediaAnalysisVersion;
- (unint64_t)previousStatus;
- (void)dealloc;
- (void)setActionClassifications:(id)a3;
- (void)setEmbeddingVersion:(unint64_t)a3;
- (void)setMediaAnalysisVersion:(unint64_t)a3;
- (void)setNsfwClassifications:(id)a3;
- (void)setPreviousStatus:(unint64_t)a3;
- (void)setSceneClassifications:(id)a3;
- (void)setStatus:(int)a3;
- (void)setSummarizedEmbeddings:(id)a3;
- (void)setTimeRangeResults:(id)a3;
- (void)setTimerangeEmbeddings:(id)a3;
@end

@implementation MADSpotlightMovieAssetEntry

- (MADSpotlightMovieAssetEntry)initWithAsset:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADSpotlightMovieAssetEntry;
  v6 = [(MADSpotlightMovieAssetEntry *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    v7->_previousStatus = (int)[v5 status];
    v7->_status = 0;
    v7->_sandboxHandle = -1;
  }

  return v7;
}

+ (id)entryWithAsset:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithAsset:v3];

  return v4;
}

- (void)dealloc
{
  if ((self->_sandboxHandle & 0x8000000000000000) == 0) {
    sandbox_extension_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)MADSpotlightMovieAssetEntry;
  [(MADSpotlightMovieAssetEntry *)&v3 dealloc];
}

- (int)consumeSandboxExtension
{
  if ((self->_sandboxHandle & 0x8000000000000000) == 0) {
    return 0;
  }
  id v3 = [(MADManagedSpotlightEntry *)self->_asset sandboxToken];
  [v3 UTF8String];
  self->_sandboxHandle = sandbox_extension_consume();

  if ((self->_sandboxHandle & 0x8000000000000000) == 0) {
    return 0;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v5, v6))
    {
      v7 = [(MADManagedSpotlightEntry *)self->_asset uniqueIdentifier];
      int v8 = 138412290;
      objc_super v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[%@] Failed to consume sandbox extension", (uint8_t *)&v8, 0xCu);
    }
  }
  return -18;
}

- (MADManagedSpotlightEntry)asset
{
  return self->_asset;
}

- (unint64_t)previousStatus
{
  return self->_previousStatus;
}

- (void)setPreviousStatus:(unint64_t)a3
{
  self->_previousStatus = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (unint64_t)mediaAnalysisVersion
{
  return self->_mediaAnalysisVersion;
}

- (void)setMediaAnalysisVersion:(unint64_t)a3
{
  self->_mediaAnalysisVersion = a3;
}

- (NSSet)nsfwClassifications
{
  return self->_nsfwClassifications;
}

- (void)setNsfwClassifications:(id)a3
{
}

- (NSSet)sceneClassifications
{
  return self->_sceneClassifications;
}

- (void)setSceneClassifications:(id)a3
{
}

- (NSSet)actionClassifications
{
  return self->_actionClassifications;
}

- (void)setActionClassifications:(id)a3
{
}

- (NSArray)summarizedEmbeddings
{
  return self->_summarizedEmbeddings;
}

- (void)setSummarizedEmbeddings:(id)a3
{
}

- (NSData)timerangeEmbeddings
{
  return self->_timerangeEmbeddings;
}

- (void)setTimerangeEmbeddings:(id)a3
{
}

- (unint64_t)embeddingVersion
{
  return self->_embeddingVersion;
}

- (void)setEmbeddingVersion:(unint64_t)a3
{
  self->_embeddingVersion = a3;
}

- (NSData)timeRangeResults
{
  return self->_timeRangeResults;
}

- (void)setTimeRangeResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRangeResults, 0);
  objc_storeStrong((id *)&self->_timerangeEmbeddings, 0);
  objc_storeStrong((id *)&self->_summarizedEmbeddings, 0);
  objc_storeStrong((id *)&self->_actionClassifications, 0);
  objc_storeStrong((id *)&self->_sceneClassifications, 0);
  objc_storeStrong((id *)&self->_nsfwClassifications, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end