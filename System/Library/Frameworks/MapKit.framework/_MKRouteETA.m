@interface _MKRouteETA
+ (id)routeETAWithDistance:(double)a3 travelTime:(double)a4 transportType:(unint64_t)a5;
+ (id)routeETAWithDistance:(double)a3 travelTime:(double)a4 transportType:(unint64_t)a5 status:(int)a6;
- (double)distance;
- (double)responseTime;
- (double)travelTime;
- (int)status;
- (unint64_t)transportType;
- (void)setDistance:(double)a3;
- (void)setStatus:(int)a3;
- (void)setTransportType:(unint64_t)a3;
- (void)setTravelTime:(double)a3;
@end

@implementation _MKRouteETA

+ (id)routeETAWithDistance:(double)a3 travelTime:(double)a4 transportType:(unint64_t)a5
{
  return (id)[a1 routeETAWithDistance:a5 travelTime:0 transportType:a3 status:a4];
}

+ (id)routeETAWithDistance:(double)a3 travelTime:(double)a4 transportType:(unint64_t)a5 status:(int)a6
{
  v10 = (double *)objc_alloc_init((Class)a1);
  v10[4] = a4;
  *((void *)v10 + 3) = a5;
  v10[2] = a3;
  v10[5] = CFAbsoluteTimeGetCurrent();
  *((_DWORD *)v10 + 2) = a6;

  return v10;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (unint64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(unint64_t)a3
{
  self->_transportType = a3;
}

- (double)travelTime
{
  return self->_travelTime;
}

- (void)setTravelTime:(double)a3
{
  self->_travelTime = a3;
}

- (double)responseTime
{
  return self->_responseTime;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

@end