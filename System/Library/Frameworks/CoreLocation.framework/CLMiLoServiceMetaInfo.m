@interface CLMiLoServiceMetaInfo
+ (BOOL)supportsSecureCoding;
- (CLMiLoServiceMetaInfo)initWithCoder:(id)a3;
- (CLMiLoServiceMetaInfo)initWithNumClustersLearnedInModel:(id)a3 numRecordingTriggersAtCurrentLOI:(id)a4 numInputValidFingerprints:(id)a5 numInputValidFingerprintsLabeled:(id)a6 numInputValidFingerprintsUnlabeled:(id)a7 numFingerprintsBeforePruning:(id)a8 numFingerprintsAfterPruning:(id)a9 numWiFiAccessPoints:(id)a10 numBLESources:(id)a11 numUWBSources:(id)a12;
- (NSNumber)numberOfBLESources;
- (NSNumber)numberOfClustersLearnedInModel;
- (NSNumber)numberOfFingerprintsAfterPruning;
- (NSNumber)numberOfFingerprintsBeforePruning;
- (NSNumber)numberOfInputValidFingerprints;
- (NSNumber)numberOfInputValidFingerprintsLabeled;
- (NSNumber)numberOfInputValidFingerprintsUnLabeled;
- (NSNumber)numberOfRecordingTriggersAtCurrentLocationOfInterest;
- (NSNumber)numberOfUWBSources;
- (NSNumber)numberOfWiFiAccessPoints;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoServiceMetaInfo

- (CLMiLoServiceMetaInfo)initWithNumClustersLearnedInModel:(id)a3 numRecordingTriggersAtCurrentLOI:(id)a4 numInputValidFingerprints:(id)a5 numInputValidFingerprintsLabeled:(id)a6 numInputValidFingerprintsUnlabeled:(id)a7 numFingerprintsBeforePruning:(id)a8 numFingerprintsAfterPruning:(id)a9 numWiFiAccessPoints:(id)a10 numBLESources:(id)a11 numUWBSources:(id)a12
{
  v20.receiver = self;
  v20.super_class = (Class)CLMiLoServiceMetaInfo;
  v18 = [(CLMiLoServiceMetaInfo *)&v20 init];
  if (v18)
  {
    v18->_numberOfClustersLearnedInModel = (NSNumber *)[a3 copy];
    v18->_numberOfRecordingTriggersAtCurrentLocationOfInterest = (NSNumber *)[a4 copy];
    v18->_numberOfInputValidFingerprints = (NSNumber *)[a5 copy];
    v18->_numberOfInputValidFingerprintsLabeled = (NSNumber *)[a6 copy];
    v18->_numberOfInputValidFingerprintsUnLabeled = (NSNumber *)[a7 copy];
    v18->_numberOfFingerprintsBeforePruning = (NSNumber *)[a8 copy];
    v18->_numberOfFingerprintsAfterPruning = (NSNumber *)[a9 copy];
    v18->_numberOfWiFiAccessPoints = (NSNumber *)[a10 copy];
    v18->_numberOfBLESources = (NSNumber *)[a11 copy];
    v18->_numberOfUWBSources = (NSNumber *)[a12 copy];
  }
  return v18;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLMiLoServiceMetaInfo;
  [(CLMiLoServiceMetaInfo *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithNumClustersLearnedInModel:numRecordingTriggersAtCurrentLOI:numInputValidFingerprints:numInputValidFingerprintsLabeled:numInputValidFingerprintsUnlabeled:numFingerprintsBeforePruning:numFingerprintsAfterPruning:numWiFiAccessPoints:numBLESources:numUWBSources:", self->_numberOfClustersLearnedInModel, self->_numberOfRecordingTriggersAtCurrentLocationOfInterest, self->_numberOfInputValidFingerprints, self->_numberOfInputValidFingerprintsLabeled, self->_numberOfInputValidFingerprintsUnLabeled, self->_numberOfFingerprintsBeforePruning, self->_numberOfFingerprintsAfterPruning, self->_numberOfWiFiAccessPoints, self->_numberOfBLESources, self->_numberOfUWBSources);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoServiceMetaInfo)initWithCoder:(id)a3
{
  uint64_t v13 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyNumberOfClustersInModel"];
  uint64_t v4 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyNumberOfRecordingTriggersAtCurrentLocationOfInterest"];
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyNumberOfInputValidFingerprints"];
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyNumberOfInputValidFingerprintsLabeled"];
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyNumberOfInputValidFingerprintsUnLabeled"];
  uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyNumberOfFingerprintsBeforePruning"];
  uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyNumberOfFingerprintsAfterPruning"];
  uint64_t v10 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyNumberOfWiFiAccessPoints"];
  uint64_t v11 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyNumberOfBLESources"];
  return -[CLMiLoServiceMetaInfo initWithNumClustersLearnedInModel:numRecordingTriggersAtCurrentLOI:numInputValidFingerprints:numInputValidFingerprintsLabeled:numInputValidFingerprintsUnlabeled:numFingerprintsBeforePruning:numFingerprintsAfterPruning:numWiFiAccessPoints:numBLESources:numUWBSources:](self, "initWithNumClustersLearnedInModel:numRecordingTriggersAtCurrentLOI:numInputValidFingerprints:numInputValidFingerprintsLabeled:numInputValidFingerprintsUnlabeled:numFingerprintsBeforePruning:numFingerprintsAfterPruning:numWiFiAccessPoints:numBLESources:numUWBSources:", v13, v4, v5, v6, v7, v8, v9, v10, v11, [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyNumberOfUWBSources"]);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_numberOfClustersLearnedInModel forKey:@"kCLMiLoConnectionCodingKeyNumberOfClustersInModel"];
  [a3 encodeObject:self->_numberOfRecordingTriggersAtCurrentLocationOfInterest forKey:@"kCLMiLoConnectionCodingKeyNumberOfRecordingTriggersAtCurrentLocationOfInterest"];
  [a3 encodeObject:self->_numberOfInputValidFingerprints forKey:@"kCLMiLoConnectionCodingKeyNumberOfInputValidFingerprints"];
  [a3 encodeObject:self->_numberOfInputValidFingerprintsLabeled forKey:@"kCLMiLoConnectionCodingKeyNumberOfInputValidFingerprintsLabeled"];
  [a3 encodeObject:self->_numberOfInputValidFingerprintsUnLabeled forKey:@"kCLMiLoConnectionCodingKeyNumberOfInputValidFingerprintsUnLabeled"];
  [a3 encodeObject:self->_numberOfFingerprintsBeforePruning forKey:@"kCLMiLoConnectionCodingKeyNumberOfFingerprintsBeforePruning"];
  [a3 encodeObject:self->_numberOfFingerprintsAfterPruning forKey:@"kCLMiLoConnectionCodingKeyNumberOfFingerprintsAfterPruning"];
  [a3 encodeObject:self->_numberOfWiFiAccessPoints forKey:@"kCLMiLoConnectionCodingKeyNumberOfWiFiAccessPoints"];
  [a3 encodeObject:self->_numberOfBLESources forKey:@"kCLMiLoConnectionCodingKeyNumberOfBLESources"];
  numberOfUWBSources = self->_numberOfUWBSources;

  [a3 encodeObject:numberOfUWBSources forKey:@"kCLMiLoConnectionCodingKeyNumberOfUWBSources"];
}

- (NSNumber)numberOfClustersLearnedInModel
{
  return self->_numberOfClustersLearnedInModel;
}

- (NSNumber)numberOfRecordingTriggersAtCurrentLocationOfInterest
{
  return self->_numberOfRecordingTriggersAtCurrentLocationOfInterest;
}

- (NSNumber)numberOfInputValidFingerprints
{
  return self->_numberOfInputValidFingerprints;
}

- (NSNumber)numberOfInputValidFingerprintsLabeled
{
  return self->_numberOfInputValidFingerprintsLabeled;
}

- (NSNumber)numberOfInputValidFingerprintsUnLabeled
{
  return self->_numberOfInputValidFingerprintsUnLabeled;
}

- (NSNumber)numberOfFingerprintsBeforePruning
{
  return self->_numberOfFingerprintsBeforePruning;
}

- (NSNumber)numberOfFingerprintsAfterPruning
{
  return self->_numberOfFingerprintsAfterPruning;
}

- (NSNumber)numberOfWiFiAccessPoints
{
  return self->_numberOfWiFiAccessPoints;
}

- (NSNumber)numberOfBLESources
{
  return self->_numberOfBLESources;
}

- (NSNumber)numberOfUWBSources
{
  return self->_numberOfUWBSources;
}

@end