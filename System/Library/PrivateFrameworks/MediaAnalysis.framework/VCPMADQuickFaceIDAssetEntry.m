@interface VCPMADQuickFaceIDAssetEntry
+ (id)entryWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 andLastAttemptDate:(id)a6;
- (NSArray)detectedFaces;
- (NSDate)currentAttemptDate;
- (NSDate)lastAttemptDate;
- (NSDictionary)detectedPersons;
- (PHAsset)asset;
- (VCPMADQuickFaceIDAssetEntry)initWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 andLastAttemptDate:(id)a6;
- (int)status;
- (unint64_t)previousAttempts;
- (unint64_t)previousStatus;
- (void)setDetectedFaces:(id)a3;
- (void)setDetectedPersons:(id)a3;
- (void)setStatus:(int)a3;
@end

@implementation VCPMADQuickFaceIDAssetEntry

- (VCPMADQuickFaceIDAssetEntry)initWithAsset:(id)a3 previousStatus:(unint64_t)a4 previousAttempts:(unint64_t)a5 andLastAttemptDate:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)VCPMADQuickFaceIDAssetEntry;
  v13 = [(VCPMADQuickFaceIDAssetEntry *)&v18 init];
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

- (NSArray)detectedFaces
{
  return self->_detectedFaces;
}

- (void)setDetectedFaces:(id)a3
{
}

- (NSDictionary)detectedPersons
{
  return self->_detectedPersons;
}

- (void)setDetectedPersons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedPersons, 0);
  objc_storeStrong((id *)&self->_detectedFaces, 0);
  objc_storeStrong((id *)&self->_currentAttemptDate, 0);
  objc_storeStrong((id *)&self->_lastAttemptDate, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end