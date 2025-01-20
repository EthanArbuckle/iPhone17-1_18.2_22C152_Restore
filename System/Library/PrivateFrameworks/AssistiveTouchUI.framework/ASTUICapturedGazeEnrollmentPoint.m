@interface ASTUICapturedGazeEnrollmentPoint
- (CGPoint)groundTruthPoint;
- (CGPoint)predictedPoint;
- (NSString)positionName;
- (void)setGroundTruthPoint:(CGPoint)a3;
- (void)setPositionName:(id)a3;
- (void)setPredictedPoint:(CGPoint)a3;
@end

@implementation ASTUICapturedGazeEnrollmentPoint

- (CGPoint)groundTruthPoint
{
  double x = self->_groundTruthPoint.x;
  double y = self->_groundTruthPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setGroundTruthPoint:(CGPoint)a3
{
  self->_groundTruthPoint = a3;
}

- (CGPoint)predictedPoint
{
  double x = self->_predictedPoint.x;
  double y = self->_predictedPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPredictedPoint:(CGPoint)a3
{
  self->_predictedPoint = a3;
}

- (NSString)positionName
{
  return self->_positionName;
}

- (void)setPositionName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end