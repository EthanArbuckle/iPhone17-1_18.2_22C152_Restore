@interface VNDetectTextRectanglesRequestConfiguration
- (BOOL)detectDiacritics;
- (BOOL)minimizeFalseDetections;
- (BOOL)reportCharacterBoxes;
- (NSString)additionalCharacters;
- (NSString)textRecognition;
- (VNDetectTextRectanglesRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)algorithm;
- (unint64_t)minimumCharacterPixelHeight;
- (void)setAdditionalCharacters:(id)a3;
- (void)setAlgorithm:(unint64_t)a3;
- (void)setDetectDiacritics:(BOOL)a3;
- (void)setMinimizeFalseDetections:(BOOL)a3;
- (void)setMinimumCharacterPixelHeight:(unint64_t)a3;
- (void)setReportCharacterBoxes:(BOOL)a3;
- (void)setTextRecognition:(id)a3;
@end

@implementation VNDetectTextRectanglesRequestConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalCharacters, 0);

  objc_storeStrong((id *)&self->_textRecognition, 0);
}

- (void)setAdditionalCharacters:(id)a3
{
}

- (NSString)additionalCharacters
{
  return self->_additionalCharacters;
}

- (void)setTextRecognition:(id)a3
{
}

- (NSString)textRecognition
{
  return self->_textRecognition;
}

- (void)setMinimizeFalseDetections:(BOOL)a3
{
  self->_minimizeFalseDetections = a3;
}

- (BOOL)minimizeFalseDetections
{
  return self->_minimizeFalseDetections;
}

- (void)setDetectDiacritics:(BOOL)a3
{
  self->_detectDiacritics = a3;
}

- (BOOL)detectDiacritics
{
  return self->_detectDiacritics;
}

- (void)setMinimumCharacterPixelHeight:(unint64_t)a3
{
  self->_minimumCharacterPixelHeight = a3;
}

- (unint64_t)minimumCharacterPixelHeight
{
  return self->_minimumCharacterPixelHeight;
}

- (void)setAlgorithm:(unint64_t)a3
{
  self->_algorithm = a3;
}

- (unint64_t)algorithm
{
  return self->_algorithm;
}

- (void)setReportCharacterBoxes:(BOOL)a3
{
  self->_reportCharacterBoxes = a3;
}

- (BOOL)reportCharacterBoxes
{
  return self->_reportCharacterBoxes;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNDetectTextRectanglesRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [v4 setReportCharacterBoxes:self->_reportCharacterBoxes];
    [v5 setAlgorithm:self->_algorithm];
    [v5 setMinimumCharacterPixelHeight:self->_minimumCharacterPixelHeight];
    [v5 setDetectDiacritics:self->_detectDiacritics];
    [v5 setMinimizeFalseDetections:self->_minimizeFalseDetections];
    [v5 setTextRecognition:self->_textRecognition];
    [v5 setAdditionalCharacters:self->_additionalCharacters];
  }
  return v5;
}

- (VNDetectTextRectanglesRequestConfiguration)initWithRequestClass:(Class)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNDetectTextRectanglesRequestConfiguration;
  v3 = [(VNImageBasedRequestConfiguration *)&v7 initWithRequestClass:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_reportCharacterBoxes = 0;
    v3->_algorithm = 0;
    v3->_minimumCharacterPixelHeight = 10;
    v3->_detectDiacritics = 1;
    v3->_minimizeFalseDetections = 1;
    textRecognition = v3->_textRecognition;
    v3->_textRecognition = (NSString *)@"VNTextRecognitionOptionNone";
  }
  return v4;
}

@end