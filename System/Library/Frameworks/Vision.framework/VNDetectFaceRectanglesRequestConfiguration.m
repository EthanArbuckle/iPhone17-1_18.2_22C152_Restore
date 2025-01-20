@interface VNDetectFaceRectanglesRequestConfiguration
- (BOOL)faceCoreEnhanceEyesAndMouthLocalization;
- (BOOL)faceCoreExtractBlink;
- (BOOL)faceCoreExtractSmile;
- (NSNumber)faceCoreInitialAngle;
- (NSNumber)faceCoreMinFaceSize;
- (NSNumber)faceCoreNumberOfDetectionAngles;
- (NSNumber)precisionRecallThresholdOverride;
- (VNDetectFaceRectanglesRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)faceCoreType;
- (void)setFaceCoreEnhanceEyesAndMouthLocalization:(BOOL)a3;
- (void)setFaceCoreExtractBlink:(BOOL)a3;
- (void)setFaceCoreExtractSmile:(BOOL)a3;
- (void)setFaceCoreInitialAngle:(id)a3;
- (void)setFaceCoreMinFaceSize:(id)a3;
- (void)setFaceCoreNumberOfDetectionAngles:(id)a3;
- (void)setFaceCoreType:(unint64_t)a3;
- (void)setPrecisionRecallThresholdOverride:(id)a3;
@end

@implementation VNDetectFaceRectanglesRequestConfiguration

- (VNDetectFaceRectanglesRequestConfiguration)initWithRequestClass:(Class)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VNDetectFaceRectanglesRequestConfiguration;
  v3 = [(VNImageBasedRequestConfiguration *)&v10 initWithRequestClass:a3];
  v4 = v3;
  if (v3)
  {
    v3->_faceCoreType = 0;
    faceCoreMinFaceSize = v3->_faceCoreMinFaceSize;
    v3->_faceCoreMinFaceSize = 0;

    faceCoreNumberOfDetectionAngles = v4->_faceCoreNumberOfDetectionAngles;
    v4->_faceCoreNumberOfDetectionAngles = 0;

    faceCoreInitialAngle = v4->_faceCoreInitialAngle;
    v4->_faceCoreInitialAngle = 0;

    v4->_faceCoreEnhanceEyesAndMouthLocalization = 0;
    v4->_faceCoreExtractBlink = 0;
    v4->_faceCoreExtractSmile = 0;
    v8 = v4;
  }

  return v4;
}

- (NSNumber)precisionRecallThresholdOverride
{
  return self->_precisionRecallThresholdOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precisionRecallThresholdOverride, 0);
  objc_storeStrong((id *)&self->_faceCoreInitialAngle, 0);
  objc_storeStrong((id *)&self->_faceCoreNumberOfDetectionAngles, 0);

  objc_storeStrong((id *)&self->_faceCoreMinFaceSize, 0);
}

- (void)setPrecisionRecallThresholdOverride:(id)a3
{
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

- (void)setFaceCoreInitialAngle:(id)a3
{
}

- (NSNumber)faceCoreInitialAngle
{
  return self->_faceCoreInitialAngle;
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

- (void)setFaceCoreType:(unint64_t)a3
{
  self->_faceCoreType = a3;
}

- (unint64_t)faceCoreType
{
  return self->_faceCoreType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNDetectFaceRectanglesRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [v4 setFaceCoreType:self->_faceCoreType];
    [v5 setFaceCoreMinFaceSize:self->_faceCoreMinFaceSize];
    [v5 setFaceCoreNumberOfDetectionAngles:self->_faceCoreNumberOfDetectionAngles];
    [v5 setFaceCoreInitialAngle:self->_faceCoreInitialAngle];
    [v5 setFaceCoreEnhanceEyesAndMouthLocalization:self->_faceCoreEnhanceEyesAndMouthLocalization];
    [v5 setFaceCoreExtractBlink:self->_faceCoreExtractBlink];
    [v5 setFaceCoreExtractSmile:self->_faceCoreExtractSmile];
    [v5 setPrecisionRecallThresholdOverride:self->_precisionRecallThresholdOverride];
  }
  return v5;
}

@end