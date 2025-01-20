@interface MADProtoAssetOCRAnalysis
+ (id)protoFromPhotosAsset:(id)a3;
- (BOOL)hasCharacterRecognitionData;
- (BOOL)hasMachineReadableCodeData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)characterRecognitionData;
- (NSData)machineReadableCodeData;
- (NSString)assetCloudIdentifier;
- (double)adjustmentVersion;
- (double)assetAdjustmentTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)algorithmVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)persistToPhotosAsset:(id)a3;
- (void)setAdjustmentVersion:(double)a3;
- (void)setAlgorithmVersion:(int)a3;
- (void)setAssetAdjustmentTimestamp:(double)a3;
- (void)setAssetCloudIdentifier:(id)a3;
- (void)setCharacterRecognitionData:(id)a3;
- (void)setMachineReadableCodeData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MADProtoAssetOCRAnalysis

- (BOOL)hasCharacterRecognitionData
{
  return self->_characterRecognitionData != 0;
}

- (BOOL)hasMachineReadableCodeData
{
  return self->_machineReadableCodeData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MADProtoAssetOCRAnalysis;
  v4 = [(MADProtoAssetOCRAnalysis *)&v8 description];
  v5 = [(MADProtoAssetOCRAnalysis *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  assetCloudIdentifier = self->_assetCloudIdentifier;
  if (assetCloudIdentifier) {
    [v3 setObject:assetCloudIdentifier forKey:@"assetCloudIdentifier"];
  }
  v6 = [NSNumber numberWithDouble:self->_assetAdjustmentTimestamp];
  [v4 setObject:v6 forKey:@"assetAdjustmentTimestamp"];

  v7 = [NSNumber numberWithInt:self->_algorithmVersion];
  [v4 setObject:v7 forKey:@"algorithmVersion"];

  objc_super v8 = [NSNumber numberWithDouble:self->_adjustmentVersion];
  [v4 setObject:v8 forKey:@"adjustmentVersion"];

  characterRecognitionData = self->_characterRecognitionData;
  if (characterRecognitionData) {
    [v4 setObject:characterRecognitionData forKey:@"characterRecognitionData"];
  }
  machineReadableCodeData = self->_machineReadableCodeData;
  if (machineReadableCodeData) {
    [v4 setObject:machineReadableCodeData forKey:@"machineReadableCodeData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MADProtoAssetOCRAnalysisReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDoubleField();
  if (self->_characterRecognitionData) {
    PBDataWriterWriteDataField();
  }
  if (self->_machineReadableCodeData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setAssetCloudIdentifier:self->_assetCloudIdentifier];
  id v4 = v5;
  *((void *)v5 + 2) = *(void *)&self->_assetAdjustmentTimestamp;
  *((_DWORD *)v5 + 6) = self->_algorithmVersion;
  *((void *)v5 + 1) = *(void *)&self->_adjustmentVersion;
  if (self->_characterRecognitionData)
  {
    objc_msgSend(v5, "setCharacterRecognitionData:");
    id v4 = v5;
  }
  if (self->_machineReadableCodeData)
  {
    objc_msgSend(v5, "setMachineReadableCodeData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_assetCloudIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  *(double *)(v5 + 16) = self->_assetAdjustmentTimestamp;
  *(_DWORD *)(v5 + 24) = self->_algorithmVersion;
  *(double *)(v5 + 8) = self->_adjustmentVersion;
  uint64_t v8 = [(NSData *)self->_characterRecognitionData copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSData *)self->_machineReadableCodeData copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((assetCloudIdentifier = self->_assetCloudIdentifier, !((unint64_t)assetCloudIdentifier | v4[4]))
     || -[NSString isEqual:](assetCloudIdentifier, "isEqual:"))
    && self->_assetAdjustmentTimestamp == *((double *)v4 + 2)
    && self->_algorithmVersion == *((_DWORD *)v4 + 6)
    && self->_adjustmentVersion == *((double *)v4 + 1)
    && ((characterRecognitionData = self->_characterRecognitionData,
         !((unint64_t)characterRecognitionData | v4[5]))
     || -[NSData isEqual:](characterRecognitionData, "isEqual:")))
  {
    machineReadableCodeData = self->_machineReadableCodeData;
    if ((unint64_t)machineReadableCodeData | v4[6]) {
      char v8 = -[NSData isEqual:](machineReadableCodeData, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_assetCloudIdentifier hash];
  double assetAdjustmentTimestamp = self->_assetAdjustmentTimestamp;
  double v5 = -assetAdjustmentTimestamp;
  if (assetAdjustmentTimestamp >= 0.0) {
    double v5 = self->_assetAdjustmentTimestamp;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  double v8 = fmod(v6, 1.84467441e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabs(v7);
  if (v7 < 0.0) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  uint64_t algorithmVersion = self->_algorithmVersion;
  double adjustmentVersion = self->_adjustmentVersion;
  double v15 = -adjustmentVersion;
  if (adjustmentVersion >= 0.0) {
    double v15 = self->_adjustmentVersion;
  }
  long double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  unint64_t v19 = v18 + (unint64_t)v17;
  double v20 = fabs(v17);
  if (v17 <= 0.0) {
    unint64_t v19 = v18;
  }
  unint64_t v21 = v18 - (unint64_t)v20;
  if (v17 >= 0.0) {
    unint64_t v21 = v19;
  }
  uint64_t v22 = v12 ^ v3 ^ (2654435761 * algorithmVersion) ^ v21;
  uint64_t v23 = [(NSData *)self->_characterRecognitionData hash];
  return v22 ^ v23 ^ [(NSData *)self->_machineReadableCodeData hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[MADProtoAssetOCRAnalysis setAssetCloudIdentifier:](self, "setAssetCloudIdentifier:");
  }
  self->_double assetAdjustmentTimestamp = *((double *)v4 + 2);
  self->_uint64_t algorithmVersion = *((_DWORD *)v4 + 6);
  self->_double adjustmentVersion = *((double *)v4 + 1);
  if (*((void *)v4 + 5)) {
    -[MADProtoAssetOCRAnalysis setCharacterRecognitionData:](self, "setCharacterRecognitionData:");
  }
  if (*((void *)v4 + 6)) {
    -[MADProtoAssetOCRAnalysis setMachineReadableCodeData:](self, "setMachineReadableCodeData:");
  }
}

- (NSString)assetCloudIdentifier
{
  return self->_assetCloudIdentifier;
}

- (void)setAssetCloudIdentifier:(id)a3
{
}

- (double)assetAdjustmentTimestamp
{
  return self->_assetAdjustmentTimestamp;
}

- (void)setAssetAdjustmentTimestamp:(double)a3
{
  self->_double assetAdjustmentTimestamp = a3;
}

- (int)algorithmVersion
{
  return self->_algorithmVersion;
}

- (void)setAlgorithmVersion:(int)a3
{
  self->_uint64_t algorithmVersion = a3;
}

- (double)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (void)setAdjustmentVersion:(double)a3
{
  self->_double adjustmentVersion = a3;
}

- (NSData)characterRecognitionData
{
  return self->_characterRecognitionData;
}

- (void)setCharacterRecognitionData:(id)a3
{
}

- (NSData)machineReadableCodeData
{
  return self->_machineReadableCodeData;
}

- (void)setMachineReadableCodeData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machineReadableCodeData, 0);
  objc_storeStrong((id *)&self->_characterRecognitionData, 0);
  objc_storeStrong((id *)&self->_assetCloudIdentifier, 0);
}

+ (id)protoFromPhotosAsset:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MADProtoAssetOCRAnalysis);
  double v5 = [v3 photoLibrary];
  long double v6 = [v3 localIdentifier];
  id v17 = 0;
  double v7 = objc_msgSend(v5, "mad_cloudIdentifierForLocalIdentifier:error:", v6, &v17);
  id v8 = v17;
  [(MADProtoAssetOCRAnalysis *)v4 setAssetCloudIdentifier:v7];

  unint64_t v9 = [(MADProtoAssetOCRAnalysis *)v4 assetCloudIdentifier];

  if (v9)
  {
    unint64_t v10 = [v3 adjustmentTimestamp];
    [v10 timeIntervalSinceReferenceDate];
    -[MADProtoAssetOCRAnalysis setAssetAdjustmentTimestamp:](v4, "setAssetAdjustmentTimestamp:");

    unint64_t v11 = [v3 characterRecognitionProperties];
    -[MADProtoAssetOCRAnalysis setAlgorithmVersion:](v4, "setAlgorithmVersion:", [v11 algorithmVersion]);
    unint64_t v12 = [v11 adjustmentVersion];
    [v12 timeIntervalSinceReferenceDate];
    -[MADProtoAssetOCRAnalysis setAdjustmentVersion:](v4, "setAdjustmentVersion:");

    v13 = [v11 characterRecognitionData];
    [(MADProtoAssetOCRAnalysis *)v4 setCharacterRecognitionData:v13];

    v14 = [v11 machineReadableCodeData];
    [(MADProtoAssetOCRAnalysis *)v4 setMachineReadableCodeData:v14];

    double v15 = v4;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[MADProtoAssetOCRAnalysis(Photos) protoFromPhotosAsset:](v3, (uint64_t)v8);
    }
    double v15 = 0;
  }

  return v15;
}

- (void)persistToPhotosAsset:(id)a3
{
  id v10 = a3;
  id v4 = [MEMORY[0x1E4F38ED8] changeRequestForAsset:v10];
  double v5 = [(MADProtoAssetOCRAnalysis *)self characterRecognitionData];
  long double v6 = [(MADProtoAssetOCRAnalysis *)self machineReadableCodeData];
  uint64_t v7 = [(MADProtoAssetOCRAnalysis *)self algorithmVersion];
  id v8 = (void *)MEMORY[0x1E4F1C9C8];
  [(MADProtoAssetOCRAnalysis *)self adjustmentVersion];
  unint64_t v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  [v4 setCharacterRecognitionData:v5 machineReadableCodeData:v6 algorithmVersion:v7 adjustmentVersion:v9];

  if (objc_msgSend(v10, "mad_isEligibleForComputeSync")) {
    objc_msgSend(v4, "setLocalAnalysisStage:", objc_msgSend(v10, "mad_analysisStageAfterCompletingAnalysis:", 10));
  }
}

@end