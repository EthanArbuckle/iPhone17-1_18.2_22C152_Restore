@interface VNTrackLegacyFaceCoreObjectRequest
+ (id)privateRevisionsSet;
+ (id)publicRevisionsSet;
+ (id)trackerTypeForRequestRevision:(unint64_t)a3 error:(id *)a4;
+ (unint64_t)defaultRevision;
+ (unsigned)frameCVPixelBufferFormatForRequestRevision:(unint64_t)a3;
- (BOOL)faceCoreEnhanceEyesAndMouthLocalization;
- (BOOL)faceCoreExtractBlink;
- (BOOL)faceCoreExtractSmile;
- (NSNumber)faceCoreMinFaceSize;
- (NSNumber)faceCoreNumberOfDetectionAngles;
- (VNTrackLegacyFaceCoreObjectRequest)initWithDetectedObjectObservation:(id)a3;
- (float)faceCoreKalmanFilter;
- (void)populateDetectorProcessingOptions:(id)a3 session:(id)a4;
- (void)setFaceCoreEnhanceEyesAndMouthLocalization:(BOOL)a3;
- (void)setFaceCoreExtractBlink:(BOOL)a3;
- (void)setFaceCoreExtractSmile:(BOOL)a3;
- (void)setFaceCoreKalmanFilter:(float)a3;
- (void)setFaceCoreMinFaceSize:(id)a3;
- (void)setFaceCoreNumberOfDetectionAngles:(id)a3;
@end

@implementation VNTrackLegacyFaceCoreObjectRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCoreNumberOfDetectionAngles, 0);

  objc_storeStrong((id *)&self->_faceCoreMinFaceSize, 0);
}

- (void)setFaceCoreKalmanFilter:(float)a3
{
  self->_faceCoreKalmanFilter = a3;
}

- (float)faceCoreKalmanFilter
{
  return self->_faceCoreKalmanFilter;
}

- (void)setFaceCoreExtractSmile:(BOOL)a3
{
  self->_faceCoreExtractSmile = a3;
}

- (BOOL)faceCoreExtractSmile
{
  return self->_faceCoreExtractSmile;
}

- (void)setFaceCoreExtractBlink:(BOOL)a3
{
  self->_faceCoreExtractBlink = a3;
}

- (BOOL)faceCoreExtractBlink
{
  return self->_faceCoreExtractBlink;
}

- (void)setFaceCoreEnhanceEyesAndMouthLocalization:(BOOL)a3
{
  self->_faceCoreEnhanceEyesAndMouthLocalization = a3;
}

- (BOOL)faceCoreEnhanceEyesAndMouthLocalization
{
  return self->_faceCoreEnhanceEyesAndMouthLocalization;
}

- (void)setFaceCoreNumberOfDetectionAngles:(id)a3
{
}

- (NSNumber)faceCoreNumberOfDetectionAngles
{
  return self->_faceCoreNumberOfDetectionAngles;
}

- (void)setFaceCoreMinFaceSize:(id)a3
{
}

- (NSNumber)faceCoreMinFaceSize
{
  return self->_faceCoreMinFaceSize;
}

- (void)populateDetectorProcessingOptions:(id)a3 session:(id)a4
{
  id v12 = a3;
  v5 = [(VNTrackLegacyFaceCoreObjectRequest *)self faceCoreMinFaceSize];
  [v12 setObject:v5 forKeyedSubscript:@"VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_MinFaceSize"];

  v6 = [(VNTrackLegacyFaceCoreObjectRequest *)self faceCoreNumberOfDetectionAngles];
  [v12 setObject:v6 forKeyedSubscript:@"VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_NumberOfDetectionAngles"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[VNTrackLegacyFaceCoreObjectRequest faceCoreEnhanceEyesAndMouthLocalization](self, "faceCoreEnhanceEyesAndMouthLocalization"));
  [v12 setObject:v7 forKeyedSubscript:@"VNTrackObjectPrivateRevisionLegacyCoreProcessOption_EnhanceEyesAndMouthLocalization"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[VNTrackLegacyFaceCoreObjectRequest faceCoreExtractBlink](self, "faceCoreExtractBlink"));
  [v12 setObject:v8 forKeyedSubscript:@"VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_ExtractBlink"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[VNTrackLegacyFaceCoreObjectRequest faceCoreExtractSmile](self, "faceCoreExtractSmile"));
  [v12 setObject:v9 forKeyedSubscript:@"VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_ExtractSmile"];

  v10 = NSNumber;
  [(VNTrackLegacyFaceCoreObjectRequest *)self faceCoreKalmanFilter];
  v11 = objc_msgSend(v10, "numberWithFloat:");
  [v12 setObject:v11 forKeyedSubscript:@"VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_KalmanFilter"];
}

- (VNTrackLegacyFaceCoreObjectRequest)initWithDetectedObjectObservation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNTrackLegacyFaceCoreObjectRequest;
  result = [(VNTrackObjectRequest *)&v4 initWithDetectedObjectObservation:a3];
  if (result) {
    result->_faceCoreKalmanFilter = 0.5;
  }
  return result;
}

+ (unsigned)frameCVPixelBufferFormatForRequestRevision:(unint64_t)a3
{
  return 1111970369;
}

+ (id)trackerTypeForRequestRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 3737841664)
  {
    objc_super v4 = @"VNObjectTrackerRevisionLegacyFaceCoreType";
    v5 = @"VNObjectTrackerRevisionLegacyFaceCoreType";
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequestClass:](VNError, "errorForUnsupportedRevision:ofRequestClass:");
    objc_super v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

+ (id)privateRevisionsSet
{
  if (+[VNTrackLegacyFaceCoreObjectRequest privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNTrackLegacyFaceCoreObjectRequest privateRevisionsSet]::onceToken, &__block_literal_global_22571);
  }
  v2 = (void *)+[VNTrackLegacyFaceCoreObjectRequest privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

uint64_t __57__VNTrackLegacyFaceCoreObjectRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  +[VNTrackLegacyFaceCoreObjectRequest privateRevisionsSet]::ourPrivateRevisions = VNRequestPrivateRevisionsSet(0xDECAF000uLL, a2, a3, a4, a5, a6, a7, a8, 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)publicRevisionsSet
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D60]);

  return v2;
}

+ (unint64_t)defaultRevision
{
  return 3737841664;
}

@end