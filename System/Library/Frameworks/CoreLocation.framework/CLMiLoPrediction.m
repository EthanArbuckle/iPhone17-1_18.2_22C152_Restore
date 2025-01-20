@interface CLMiLoPrediction
+ (BOOL)supportsSecureCoding;
- (CLMiLoFingerprintMetaInfo)localizationFingerprintMetaInfo;
- (CLMiLoPrediction)initWithCoder:(id)a3;
- (CLMiLoPrediction)initWithPlacePredictions:(id)a3 locationSimilarityList:(id)a4 closeDeviceList:(id)a5 error:(id)a6 requestIdentifier:(id)a7 predictionTime:(id)a8 confidence:(unint64_t)a9 placeConfidenceReasons:(id)a10 localizationFingerprintMetaInfo:(id)a11;
- (CLMiLoPredictionCloseDeviceList)closeDeviceList;
- (CLMiLoServicePredictionLocationSimilarityList)locationSimilarityList;
- (NSArray)placeConfidenceReasons;
- (NSArray)placePredictions;
- (NSDate)predictionTime;
- (NSError)error;
- (NSUUID)requestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)confidence;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoPrediction

- (CLMiLoPrediction)initWithPlacePredictions:(id)a3 locationSimilarityList:(id)a4 closeDeviceList:(id)a5 error:(id)a6 requestIdentifier:(id)a7 predictionTime:(id)a8 confidence:(unint64_t)a9 placeConfidenceReasons:(id)a10 localizationFingerprintMetaInfo:(id)a11
{
  v19.receiver = self;
  v19.super_class = (Class)CLMiLoPrediction;
  v17 = [(CLMiLoPrediction *)&v19 init];
  if (v17)
  {
    v17->_placePredictions = (NSArray *)a3;
    v17->_locationSimilarityList = (CLMiLoServicePredictionLocationSimilarityList *)a4;
    v17->_closeDeviceList = (CLMiLoPredictionCloseDeviceList *)a5;
    v17->_error = (NSError *)a6;
    v17->_requestIdentifier = (NSUUID *)a7;
    v17->_predictionTime = (NSDate *)a8;
    v17->_confidence = a9;
    v17->_placeConfidenceReasons = (NSArray *)a10;
    v17->_localizationFingerprintMetaInfo = (CLMiLoFingerprintMetaInfo *)a11;
  }
  return v17;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLMiLoPrediction;
  [(CLMiLoPrediction *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPlacePredictions:locationSimilarityList:closeDeviceList:error:requestIdentifier:predictionTime:confidence:placeConfidenceReasons:localizationFingerprintMetaInfo:", self->_placePredictions, self->_locationSimilarityList, self->_closeDeviceList, self->_error, self->_requestIdentifier, self->_predictionTime, self->_confidence, self->_placeConfidenceReasons, self->_localizationFingerprintMetaInfo);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoPrediction)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0), @"kCLMiLoConnectionCodingKeyPredictionPlacePredictions");
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyPredictionLocationSimilarityList"];
  uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyPredictionCloseDeviceList"];
  uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyPredictionError"];
  uint64_t v10 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyPredictionRequestIdentifier"];
  uint64_t v11 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyPredictionTime"];
  uint64_t v12 = [a3 decodeIntegerForKey:@"kCLMiLoConnectionCodingKeyPlaceConfidenceEnum"];
  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0), @"kCLMiLoConnectionCodingKeyPlaceConfidenceReasons");
  return -[CLMiLoPrediction initWithPlacePredictions:locationSimilarityList:closeDeviceList:error:requestIdentifier:predictionTime:confidence:placeConfidenceReasons:localizationFingerprintMetaInfo:](self, "initWithPlacePredictions:locationSimilarityList:closeDeviceList:error:requestIdentifier:predictionTime:confidence:placeConfidenceReasons:localizationFingerprintMetaInfo:", v6, v7, v8, v9, v10, v11, v12, v15, [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyLocalizationFingerprintMetaInfo"]);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_placePredictions forKey:@"kCLMiLoConnectionCodingKeyPredictionPlacePredictions"];
  [a3 encodeObject:self->_locationSimilarityList forKey:@"kCLMiLoConnectionCodingKeyPredictionLocationSimilarityList"];
  [a3 encodeObject:self->_closeDeviceList forKey:@"kCLMiLoConnectionCodingKeyPredictionCloseDeviceList"];
  [a3 encodeObject:self->_error forKey:@"kCLMiLoConnectionCodingKeyPredictionError"];
  [a3 encodeObject:self->_requestIdentifier forKey:@"kCLMiLoConnectionCodingKeyPredictionRequestIdentifier"];
  [a3 encodeObject:self->_predictionTime forKey:@"kCLMiLoConnectionCodingKeyPredictionTime"];
  [a3 encodeInteger:self->_confidence forKey:@"kCLMiLoConnectionCodingKeyPlaceConfidenceEnum"];
  [a3 encodeObject:self->_placeConfidenceReasons forKey:@"kCLMiLoConnectionCodingKeyPlaceConfidenceReasons"];
  localizationFingerprintMetaInfo = self->_localizationFingerprintMetaInfo;

  [a3 encodeObject:localizationFingerprintMetaInfo forKey:@"kCLMiLoConnectionCodingKeyLocalizationFingerprintMetaInfo"];
}

- (NSArray)placePredictions
{
  return self->_placePredictions;
}

- (CLMiLoServicePredictionLocationSimilarityList)locationSimilarityList
{
  return self->_locationSimilarityList;
}

- (CLMiLoPredictionCloseDeviceList)closeDeviceList
{
  return self->_closeDeviceList;
}

- (NSError)error
{
  return self->_error;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSDate)predictionTime
{
  return self->_predictionTime;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (NSArray)placeConfidenceReasons
{
  return self->_placeConfidenceReasons;
}

- (CLMiLoFingerprintMetaInfo)localizationFingerprintMetaInfo
{
  return self->_localizationFingerprintMetaInfo;
}

@end