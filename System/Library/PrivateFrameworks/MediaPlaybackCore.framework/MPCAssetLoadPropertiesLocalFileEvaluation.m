@interface MPCAssetLoadPropertiesLocalFileEvaluation
- (BOOL)fileIsCached;
- (BOOL)fileIsDownloaded;
- (BOOL)fileIsHLS;
- (BOOL)fileIsValid;
- (BOOL)fileMatchesRequiredFileFormat;
- (BOOL)fileMatchesRequiredQuality;
- (BOOL)fileShouldBeUpdated;
- (MPCAssetLoadPropertiesLocalFileEvaluation)initWithFileAsset:(id)a3;
- (MPModelFileAsset)fileAsset;
- (NSString)filePath;
- (id)description;
- (id)humanDescription;
- (int64_t)HLSContentPolicy;
- (int64_t)expectedAssetType;
- (int64_t)expectedQualityType;
- (int64_t)fileAssetType;
- (int64_t)fileQualityType;
- (int64_t)recommendation;
- (int64_t)status;
- (void)setExpectedAssetType:(int64_t)a3;
- (void)setExpectedQualityType:(int64_t)a3;
- (void)setFileAssetType:(int64_t)a3;
- (void)setFileIsCached:(BOOL)a3;
- (void)setFileIsDownloaded:(BOOL)a3;
- (void)setFileIsHLS:(BOOL)a3;
- (void)setFileMatchesRequiredFileFormat:(BOOL)a3;
- (void)setFileMatchesRequiredQuality:(BOOL)a3;
- (void)setFilePath:(id)a3;
- (void)setFileQualityType:(int64_t)a3;
- (void)setHLSContentPolicy:(int64_t)a3;
- (void)setRecommendation:(int64_t)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation MPCAssetLoadPropertiesLocalFileEvaluation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);

  objc_storeStrong((id *)&self->_fileAsset, 0);
}

- (void)setHLSContentPolicy:(int64_t)a3
{
  self->_HLSContentPolicy = a3;
}

- (int64_t)HLSContentPolicy
{
  return self->_HLSContentPolicy;
}

- (void)setFilePath:(id)a3
{
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setExpectedQualityType:(int64_t)a3
{
  self->_expectedQualityType = a3;
}

- (int64_t)expectedQualityType
{
  return self->_expectedQualityType;
}

- (void)setFileQualityType:(int64_t)a3
{
  self->_fileQualityType = a3;
}

- (int64_t)fileQualityType
{
  return self->_fileQualityType;
}

- (void)setExpectedAssetType:(int64_t)a3
{
  self->_expectedAssetType = a3;
}

- (int64_t)expectedAssetType
{
  return self->_expectedAssetType;
}

- (void)setFileAssetType:(int64_t)a3
{
  self->_fileAssetType = a3;
}

- (int64_t)fileAssetType
{
  return self->_fileAssetType;
}

- (void)setFileIsHLS:(BOOL)a3
{
  self->_fileIsHLS = a3;
}

- (BOOL)fileIsHLS
{
  return self->_fileIsHLS;
}

- (void)setFileIsCached:(BOOL)a3
{
  self->_fileIsCached = a3;
}

- (BOOL)fileIsCached
{
  return self->_fileIsCached;
}

- (void)setFileIsDownloaded:(BOOL)a3
{
  self->_fileIsDownloaded = a3;
}

- (BOOL)fileIsDownloaded
{
  return self->_fileIsDownloaded;
}

- (void)setFileMatchesRequiredQuality:(BOOL)a3
{
  self->_fileMatchesRequiredQuality = a3;
}

- (BOOL)fileMatchesRequiredQuality
{
  return self->_fileMatchesRequiredQuality;
}

- (void)setFileMatchesRequiredFileFormat:(BOOL)a3
{
  self->_fileMatchesRequiredFileFormat = a3;
}

- (BOOL)fileMatchesRequiredFileFormat
{
  return self->_fileMatchesRequiredFileFormat;
}

- (void)setRecommendation:(int64_t)a3
{
  self->_recommendation = a3;
}

- (int64_t)recommendation
{
  return self->_recommendation;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (MPModelFileAsset)fileAsset
{
  return self->_fileAsset;
}

- (BOOL)fileShouldBeUpdated
{
  if ([(MPCAssetLoadPropertiesLocalFileEvaluation *)self status] == 3
    && [(MPCAssetLoadPropertiesLocalFileEvaluation *)self fileIsDownloaded])
  {
    return 0;
  }
  if (![(MPCAssetLoadPropertiesLocalFileEvaluation *)self fileIsValid]) {
    return 1;
  }
  if ([(MPCAssetLoadPropertiesLocalFileEvaluation *)self fileIsHLS]
    && ![(MPCAssetLoadPropertiesLocalFileEvaluation *)self fileMatchesRequiredFileFormat]&& [(MPCAssetLoadPropertiesLocalFileEvaluation *)self fileMatchesRequiredQuality])
  {
    return 0;
  }
  if ([(MPCAssetLoadPropertiesLocalFileEvaluation *)self fileMatchesRequiredFileFormat]) {
    return ![(MPCAssetLoadPropertiesLocalFileEvaluation *)self fileMatchesRequiredQuality];
  }
  else {
    return 1;
  }
}

- (BOOL)fileIsValid
{
  return [(MPCAssetLoadPropertiesLocalFileEvaluation *)self status] == 1;
}

- (id)humanDescription
{
  v3 = objc_opt_new();
  unint64_t v4 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)self status] - 2;
  if (v4 <= 5) {
    [v3 addObject:off_2643C03C0[v4]];
  }
  if ([(MPCAssetLoadPropertiesLocalFileEvaluation *)self fileIsDownloaded]) {
    [v3 addObject:@"downloaded"];
  }
  if ([(MPCAssetLoadPropertiesLocalFileEvaluation *)self fileIsCached]) {
    [v3 addObject:@"cached"];
  }
  if ([(MPCAssetLoadPropertiesLocalFileEvaluation *)self fileIsHLS]) {
    v5 = @"HLS format";
  }
  else {
    v5 = @"CRABS format";
  }
  [v3 addObject:v5];
  v6 = NSString;
  int64_t v7 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)self fileQualityType];
  if (v7 == 1) {
    v8 = @"Low";
  }
  else {
    v8 = @"Unknown";
  }
  if (v7 == 2) {
    v8 = @"High";
  }
  v9 = [v6 stringWithFormat:@"%@ quality", v8];
  [v3 addObject:v9];

  v10 = NSString;
  int64_t v11 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)self fileAssetType];
  if ((unint64_t)(v11 - 1) > 4) {
    v12 = @"Unspecified";
  }
  else {
    v12 = off_2643C0410[v11 - 1];
  }
  v13 = [v10 stringWithFormat:@"%@ audio", v12];
  [v3 addObject:v13];

  v14 = NSString;
  v15 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)self filePath];
  v16 = [v14 stringWithFormat:@"[url: %@]", v15];
  [v3 addObject:v16];

  v17 = NSString;
  unint64_t v18 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)self HLSContentPolicy];
  if (v18 > 3) {
    v19 = @"Unspecified";
  }
  else {
    v19 = off_2643C03F0[v18];
  }
  v20 = [v17 stringWithFormat:@"[HLSContentPolicy: %@]", v19];
  [v3 addObject:v20];

  v21 = NSString;
  v22 = [v3 componentsJoinedByString:@", "];
  v23 = [v21 stringWithFormat:@"File: %@", v22];

  [v3 removeAllObjects];
  v24 = NSString;
  int64_t v25 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)self expectedQualityType];
  if (v25 == 1) {
    v26 = @"Low";
  }
  else {
    v26 = @"Unknown";
  }
  if (v25 == 2) {
    v26 = @"High";
  }
  v27 = [v24 stringWithFormat:@"%@ quality", v26];
  [v3 addObject:v27];

  v28 = NSString;
  int64_t v29 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)self expectedAssetType];
  if ((unint64_t)(v29 - 1) > 4) {
    v30 = @"Unspecified";
  }
  else {
    v30 = off_2643C0410[v29 - 1];
  }
  v31 = [v28 stringWithFormat:@"%@ audio", v30];
  [v3 addObject:v31];

  v32 = NSString;
  v33 = [v3 componentsJoinedByString:@", "];
  v34 = [v32 stringWithFormat:@"Expectation: %@", v33];

  [v3 removeAllObjects];
  if ([(MPCAssetLoadPropertiesLocalFileEvaluation *)self fileMatchesRequiredFileFormat]) {
    v35 = @"file format ✅";
  }
  else {
    v35 = @"file format ❌";
  }
  [v3 addObject:v35];
  if ([(MPCAssetLoadPropertiesLocalFileEvaluation *)self fileMatchesRequiredQuality]) {
    v36 = @"quality/audio ✅";
  }
  else {
    v36 = @"quality/audio ❌";
  }
  [v3 addObject:v36];
  unint64_t v37 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)self recommendation] - 1;
  if (v37 <= 2) {
    [v3 addObject:off_2643C0438[v37]];
  }
  v38 = [v3 componentsJoinedByString:@", "];
  v39 = [NSString stringWithFormat:@"%@ - %@ -> %@", v23, v34, v38];

  return v39;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)self humanDescription];
  v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (MPCAssetLoadPropertiesLocalFileEvaluation)initWithFileAsset:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCAssetLoadPropertiesLocalFileEvaluation;
  v5 = [(MPCAssetLoadPropertiesLocalFileEvaluation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    fileAsset = v5->_fileAsset;
    v5->_fileAsset = (MPModelFileAsset *)v6;
  }
  return v5;
}

@end