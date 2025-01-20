@interface VCPMADVisualSearchAssetEntry
+ (id)entryWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 andLastAttemptDate:(id)a6 analysisTypes:(unint64_t)a7;
- (NSData)result;
- (NSDate)currentAttemptDate;
- (NSDate)lastAttemptDate;
- (PHAsset)asset;
- (VCPMADVisualSearchAssetEntry)initWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 andLastAttemptDate:(id)a6 analysisTypes:(unint64_t)a7;
- (float)stickerScore;
- (int)pecVersion;
- (int)status;
- (int)stickerAlgorithmVersion;
- (int)stickerStatus;
- (int)version;
- (int)visualSearchStatus;
- (unint64_t)analysisTypes;
- (unint64_t)previousAttempts;
- (unint64_t)previousStatus;
- (void)setAnalysisTypes:(unint64_t)a3;
- (void)setPecVersion:(int)a3;
- (void)setResult:(id)a3;
- (void)setStatus:(int)a3;
- (void)setStickerAlgorithmVersion:(int)a3;
- (void)setStickerScore:(float)a3;
- (void)setStickerStatus:(int)a3;
- (void)setVersion:(int)a3;
- (void)setVisualSearchStatus:(int)a3;
@end

@implementation VCPMADVisualSearchAssetEntry

- (VCPMADVisualSearchAssetEntry)initWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 andLastAttemptDate:(id)a6 analysisTypes:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)VCPMADVisualSearchAssetEntry;
  v15 = [(VCPMADVisualSearchAssetEntry *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_asset, a3);
    *(void *)&v16->_status = 0;
    v16->_visualSearchStatus = 0;
    v16->_previousStatus = a4;
    v16->_previousAttempts = a5;
    objc_storeStrong((id *)&v16->_lastAttemptDate, a6);
    uint64_t v17 = +[NSDate now];
    currentAttemptDate = v16->_currentAttemptDate;
    v16->_currentAttemptDate = (NSDate *)v17;

    v16->_stickerScore = 0.0;
    v16->_analysisTypes = a7;
    *(void *)&v16->_stickerAlgorithmVersion = 0xFFFFFFFFLL;
  }

  return v16;
}

+ (id)entryWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 andLastAttemptDate:(id)a6 analysisTypes:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = [objc_alloc((Class)objc_opt_class()) initWithAsset:v11 previousStatus:a4 previousAttempts:a5 andLastAttemptDate:v12 analysisTypes:a7];

  return v13;
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

- (int)stickerStatus
{
  return self->_stickerStatus;
}

- (void)setStickerStatus:(int)a3
{
  self->_stickerStatus = a3;
}

- (int)visualSearchStatus
{
  return self->_visualSearchStatus;
}

- (void)setVisualSearchStatus:(int)a3
{
  self->_visualSearchStatus = a3;
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

- (NSData)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (float)stickerScore
{
  return self->_stickerScore;
}

- (void)setStickerScore:(float)a3
{
  self->_stickerScore = a3;
}

- (int)stickerAlgorithmVersion
{
  return self->_stickerAlgorithmVersion;
}

- (void)setStickerAlgorithmVersion:(int)a3
{
  self->_stickerAlgorithmVersion = a3;
}

- (unint64_t)analysisTypes
{
  return self->_analysisTypes;
}

- (void)setAnalysisTypes:(unint64_t)a3
{
  self->_analysisTypes = a3;
}

- (int)pecVersion
{
  return self->_pecVersion;
}

- (void)setPecVersion:(int)a3
{
  self->_pecVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_currentAttemptDate, 0);
  objc_storeStrong((id *)&self->_lastAttemptDate, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end