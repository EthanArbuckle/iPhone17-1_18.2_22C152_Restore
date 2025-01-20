@interface NTKCaliforniaStyleTransitionHandler
- (CGAffineTransform)transformForMarkerAtIndex:(SEL)a3 markerType:(unint64_t)a4;
- (CGPoint)centerPoint;
- (CGPoint)fadeInHourMarkersCenterPoints;
- (CGPoint)fadeOutHourMarkersCenterPoints;
- (CGPoint)positionForMarkerAtIndex:(unint64_t)a3 markerType:(unint64_t)a4;
- (CLKDevice)device;
- (NTKCaliforniaStyleTransitionHandler)initWithDevice:(id)a3;
- (double)animationDurationForHourMarkerAtIndex:(unint64_t)a3 markerType:(unint64_t)a4;
- (double)animationProgressForHourMarkerAtIndex:(unint64_t)a3 markerType:(unint64_t)a4;
- (double)animationStartTimeForMarkerAtIndex:(unint64_t)a3 markerType:(unint64_t)a4;
- (double)fraction;
- (double)opacityForMarkerAtIndex:(unint64_t)a3 markerType:(unint64_t)a4;
- (unint64_t)dial;
- (unint64_t)hourMarkersCount;
- (void)setCenterPoint:(CGPoint)a3;
- (void)setDevice:(id)a3;
- (void)setDial:(unint64_t)a3;
- (void)setFadeInHourMarkersCenterPoints:(CGPoint *)a3;
- (void)setFadeOutHourMarkersCenterPoints:(CGPoint *)a3;
- (void)setFraction:(double)a3;
- (void)setHourMarkersCount:(unint64_t)a3;
@end

@implementation NTKCaliforniaStyleTransitionHandler

- (NTKCaliforniaStyleTransitionHandler)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKCaliforniaStyleTransitionHandler;
  v6 = [(NTKCaliforniaStyleTransitionHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (double)opacityForMarkerAtIndex:(unint64_t)a3 markerType:(unint64_t)a4
{
  [(NTKCaliforniaStyleTransitionHandler *)self animationProgressForHourMarkerAtIndex:a3 markerType:a4];
  CLKCompressFraction();

  CLKInterpolateBetweenFloatsClipped();
  return result;
}

- (CGPoint)positionForMarkerAtIndex:(unint64_t)a3 markerType:(unint64_t)a4
{
  -[NTKCaliforniaStyleTransitionHandler animationProgressForHourMarkerAtIndex:markerType:](self, "animationProgressForHourMarkerAtIndex:markerType:");
  if (a4) {
    [(NTKCaliforniaStyleTransitionHandler *)self fadeInHourMarkersCenterPoints];
  }
  else {
    [(NTKCaliforniaStyleTransitionHandler *)self fadeOutHourMarkersCenterPoints];
  }
  [(NTKCaliforniaStyleTransitionHandler *)self centerPoint];
  CLKInterpolateBetweenFloatsClipped();
  double v7 = v6;
  [(NTKCaliforniaStyleTransitionHandler *)self centerPoint];
  CLKInterpolateBetweenFloatsClipped();
  double v9 = v8;
  double v10 = v7;
  result.y = v9;
  result.x = v10;
  return result;
}

- (CGAffineTransform)transformForMarkerAtIndex:(SEL)a3 markerType:(unint64_t)a4
{
  [(NTKCaliforniaStyleTransitionHandler *)self animationProgressForHourMarkerAtIndex:a4 markerType:a5];
  CLKInterpolateBetweenFloatsClipped();

  return CGAffineTransformMakeScale(retstr, v6, v6);
}

- (double)animationProgressForHourMarkerAtIndex:(unint64_t)a3 markerType:(unint64_t)a4
{
  -[NTKCaliforniaStyleTransitionHandler animationStartTimeForMarkerAtIndex:markerType:](self, "animationStartTimeForMarkerAtIndex:markerType:");
  double v8 = v7;
  [(NTKCaliforniaStyleTransitionHandler *)self animationDurationForHourMarkerAtIndex:a3 markerType:a4];
  double v10 = v8 + v9;
  if (v10 <= 1.0) {
    double v11 = v10;
  }
  else {
    double v11 = 1.0;
  }
  [(NTKCaliforniaStyleTransitionHandler *)self fraction];
  double v13 = 0.0;
  if (v12 >= v8)
  {
    double v13 = 1.0;
    if (v12 <= v11)
    {
      CLKMapFractionIntoRange();
      double v13 = v14;
    }
  }
  double result = 1.0 - v13;
  if (a4) {
    return v13;
  }
  return result;
}

- (double)animationStartTimeForMarkerAtIndex:(unint64_t)a3 markerType:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = a3 - 2;
    if (a3 <= 0xB) {
      unint64_t v4 = a3;
    }
    double v5 = (double)(v4 + 79);
    if (a3 <= 2) {
      double v5 = (double)(a3 + 50);
    }
  }
  else
  {
    double v5 = 100.0
       / (double)(4 * [(NTKCaliforniaStyleTransitionHandler *)self hourMarkersCount])
       * (double)a3;
  }
  return v5 / 100.0;
}

- (double)animationDurationForHourMarkerAtIndex:(unint64_t)a3 markerType:(unint64_t)a4
{
  unint64_t v4 = (double *)((char *)&unk_17410 + 8 * (a3 < 3));
  if (!a4) {
    unint64_t v4 = (double *)((char *)&unk_17400 + 8 * (a3 > 8));
  }
  return *v4 / 100.0;
}

- (double)fraction
{
  return self->_fraction;
}

- (void)setFraction:(double)a3
{
  self->_fraction = a3;
}

- (unint64_t)dial
{
  return self->_dial;
}

- (void)setDial:(unint64_t)a3
{
  self->_dial = a3;
}

- (CGPoint)centerPoint
{
  double x = self->_centerPoint.x;
  double y = self->_centerPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenterPoint:(CGPoint)a3
{
  self->_centerPoint = a3;
}

- (CGPoint)fadeOutHourMarkersCenterPoints
{
  return self->_fadeOutHourMarkersCenterPoints;
}

- (void)setFadeOutHourMarkersCenterPoints:(CGPoint *)a3
{
  self->_fadeOutHourMarkersCenterPoints = a3;
}

- (CGPoint)fadeInHourMarkersCenterPoints
{
  return self->_fadeInHourMarkersCenterPoints;
}

- (void)setFadeInHourMarkersCenterPoints:(CGPoint *)a3
{
  self->_fadeInHourMarkersCenterPoints = a3;
}

- (unint64_t)hourMarkersCount
{
  return self->_hourMarkersCount;
}

- (void)setHourMarkersCount:(unint64_t)a3
{
  self->_hourMarkersCount = a3;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end