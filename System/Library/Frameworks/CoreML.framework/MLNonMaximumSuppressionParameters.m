@interface MLNonMaximumSuppressionParameters
- (BOOL)perClass;
- (NSArray)labelNames;
- (NSString)confidenceInputFeatureName;
- (NSString)confidenceOutputFeatureName;
- (NSString)confidenceThresholdInputFeatureName;
- (NSString)coordinatesInputFeatureName;
- (NSString)coordinatesOutputFeatureName;
- (NSString)iouThresholdInputFeatureName;
- (double)confidenceThreshold;
- (double)iouThreshold;
- (id)objectBoundingBoxOutputDescription;
- (int)suppressionMethod;
- (int64_t)maxBoxes;
- (unint64_t)minBoxes;
- (unint64_t)numClasses;
- (void)setConfidenceInputFeatureName:(id)a3;
- (void)setConfidenceOutputFeatureName:(id)a3;
- (void)setConfidenceThreshold:(double)a3;
- (void)setConfidenceThresholdInputFeatureName:(id)a3;
- (void)setCoordinatesInputFeatureName:(id)a3;
- (void)setCoordinatesOutputFeatureName:(id)a3;
- (void)setIouThreshold:(double)a3;
- (void)setIouThresholdInputFeatureName:(id)a3;
- (void)setLabelNames:(id)a3;
- (void)setMaxBoxes:(int64_t)a3;
- (void)setMinBoxes:(unint64_t)a3;
- (void)setNumClasses:(unint64_t)a3;
- (void)setPerClass:(BOOL)a3;
- (void)setSuppressionMethod:(int)a3;
@end

@implementation MLNonMaximumSuppressionParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelNames, 0);
  objc_storeStrong((id *)&self->_coordinatesOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_confidenceOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_confidenceThresholdInputFeatureName, 0);
  objc_storeStrong((id *)&self->_iouThresholdInputFeatureName, 0);
  objc_storeStrong((id *)&self->_coordinatesInputFeatureName, 0);

  objc_storeStrong((id *)&self->_confidenceInputFeatureName, 0);
}

- (void)setLabelNames:(id)a3
{
}

- (NSArray)labelNames
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCoordinatesOutputFeatureName:(id)a3
{
}

- (NSString)coordinatesOutputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setConfidenceOutputFeatureName:(id)a3
{
}

- (NSString)confidenceOutputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConfidenceThresholdInputFeatureName:(id)a3
{
}

- (NSString)confidenceThresholdInputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setIouThresholdInputFeatureName:(id)a3
{
}

- (NSString)iouThresholdInputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCoordinatesInputFeatureName:(id)a3
{
}

- (NSString)coordinatesInputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConfidenceInputFeatureName:(id)a3
{
}

- (NSString)confidenceInputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPerClass:(BOOL)a3
{
  self->_perClass = a3;
}

- (BOOL)perClass
{
  return self->_perClass;
}

- (void)setNumClasses:(unint64_t)a3
{
  self->_numClasses = a3;
}

- (unint64_t)numClasses
{
  return self->_numClasses;
}

- (void)setMaxBoxes:(int64_t)a3
{
  self->_maxBoxes = a3;
}

- (int64_t)maxBoxes
{
  return self->_maxBoxes;
}

- (void)setMinBoxes:(unint64_t)a3
{
  self->_minBoxes = a3;
}

- (unint64_t)minBoxes
{
  return self->_minBoxes;
}

- (void)setConfidenceThreshold:(double)a3
{
  self->_confidenceThreshold = a3;
}

- (double)confidenceThreshold
{
  return self->_confidenceThreshold;
}

- (void)setIouThreshold:(double)a3
{
  self->_iouThreshold = a3;
}

- (double)iouThreshold
{
  return self->_iouThreshold;
}

- (void)setSuppressionMethod:(int)a3
{
  self->_suppressionMethod = a3;
}

- (int)suppressionMethod
{
  return self->_suppressionMethod;
}

- (id)objectBoundingBoxOutputDescription
{
  v3 = objc_alloc_init(MLObjectBoundingBoxOutputDescription);
  v4 = [(MLNonMaximumSuppressionParameters *)self labelNames];
  [(MLObjectBoundingBoxOutputDescription *)v3 setLabelNames:v4];

  v5 = [(MLNonMaximumSuppressionParameters *)self confidenceOutputFeatureName];
  [(MLObjectBoundingBoxOutputDescription *)v3 setConfidenceFeatureName:v5];

  v6 = [(MLNonMaximumSuppressionParameters *)self coordinatesOutputFeatureName];
  [(MLObjectBoundingBoxOutputDescription *)v3 setCoordinatesFeatureName:v6];

  [(MLObjectBoundingBoxOutputDescription *)v3 setFormat:0];

  return v3;
}

@end