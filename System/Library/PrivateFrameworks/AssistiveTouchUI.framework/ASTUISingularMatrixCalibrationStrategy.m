@interface ASTUISingularMatrixCalibrationStrategy
- (ASTUISingularMatrixCalibrationStrategy)init;
- (CGPoint)calibratedGazePointForGazePoint:(CGPoint)a3;
- (id)calibratedArrayForGazePoint:(CGPoint)a3;
- (id)learnCalibrationForPoints:(id)a3;
- (void)captureGazeEnrollmentPoint:(id)a3;
- (void)learnCalibration;
- (void)reset;
@end

@implementation ASTUISingularMatrixCalibrationStrategy

- (ASTUISingularMatrixCalibrationStrategy)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASTUISingularMatrixCalibrationStrategy;
  v2 = [(ASTUISingularMatrixCalibrationStrategy *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    store = v2->_store;
    v2->_store = (ASTUIGazeEnrollmentStore *)v3;
  }
  return v2;
}

- (void)captureGazeEnrollmentPoint:(id)a3
{
  store = self->_store;
  id v4 = a3;
  [v4 groundTruthPoint];
  double v6 = v5;
  double v8 = v7;
  [v4 predictedPoint];
  double v10 = v9;
  double v12 = v11;

  -[ASTUIGazeEnrollmentStore saveEnrollmentPoint:withGazePoint:](store, "saveEnrollmentPoint:withGazePoint:", v6, v8, v10, v12);
}

- (void)learnCalibration
{
  uint64_t v3 = [(ASTUIGazeEnrollmentStore *)self->_store enrollmentPointToGazePointDict];
  id v4 = [(ASTUISingularMatrixCalibrationStrategy *)self learnCalibrationForPoints:v3];

  [(ASTUIGazeEnrollmentStore *)self->_store saveCalibratedArray:v4];
}

- (void)reset
{
}

- (id)calibratedArrayForGazePoint:(CGPoint)a3
{
  return [(ASTUIGazeEnrollmentStore *)self->_store calibratedArray];
}

- (CGPoint)calibratedGazePointForGazePoint:(CGPoint)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASTUISingularMatrixCalibrationStrategy;
  -[ASTUILinearMatrixCalibrationStrategy calibratedGazePointForGazePoint:](&v5, sel_calibratedGazePointForGazePoint_, a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)learnCalibrationForPoints:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASTUISingularMatrixCalibrationStrategy;
  double v3 = [(ASTUILinearMatrixCalibrationStrategy *)&v5 learnCalibrationForPoints:a3];
  return v3;
}

- (void).cxx_destruct
{
}

@end