@interface DKFocusObservation
- (BOOL)userFocusStrong;
- (CGRect)rect;
- (DKFocusObservation)initWithIdentifier:(int64_t)a3 rect:(CGRect)a4 userFocusStrong:(BOOL)a5 detectionType:(unint64_t)a6;
- (int64_t)identifier;
- (unint64_t)detectionType;
- (void)setDetectionType:(unint64_t)a3;
- (void)setIdentifier:(int64_t)a3;
- (void)setRect:(CGRect)a3;
- (void)setUserFocusStrong:(BOOL)a3;
@end

@implementation DKFocusObservation

- (DKFocusObservation)initWithIdentifier:(int64_t)a3 rect:(CGRect)a4 userFocusStrong:(BOOL)a5 detectionType:(unint64_t)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)DKFocusObservation;
  result = [(DKFocusObservation *)&v14 init];
  if (result)
  {
    result->_rect.origin.CGFloat x = x;
    result->_rect.origin.CGFloat y = y;
    result->_rect.size.CGFloat width = width;
    result->_rect.size.CGFloat height = height;
    result->_userFocusStrong = a5;
    result->_identifier = a3;
    result->_detectionType = a6;
  }
  return result;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (BOOL)userFocusStrong
{
  return self->_userFocusStrong;
}

- (void)setUserFocusStrong:(BOOL)a3
{
  self->_userFocusStrong = a3;
}

- (unint64_t)detectionType
{
  return self->_detectionType;
}

- (void)setDetectionType:(unint64_t)a3
{
  self->_detectionType = a3;
}

@end