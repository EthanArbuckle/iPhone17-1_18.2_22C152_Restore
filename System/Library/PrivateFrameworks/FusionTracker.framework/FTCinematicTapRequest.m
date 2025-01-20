@interface FTCinematicTapRequest
- (CGPoint)tapPoint;
- (FTCinematicTapRequest)init;
- (NSDictionary)metadata;
- (int64_t)trackId;
- (void)setMetadata:(id)a3;
- (void)setTapPoint:(CGPoint)a3;
- (void)setTrackId:(int64_t)a3;
@end

@implementation FTCinematicTapRequest

- (FTCinematicTapRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTCinematicTapRequest;
  v2 = [(FTCinematicTapRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    -[FTCinematicTapRequest setTapPoint:](v2, "setTapPoint:", -1.0, -1.0);
    [(FTCinematicTapRequest *)v3 setTrackId:-1];
    v4 = v3;
  }

  return v3;
}

- (CGPoint)tapPoint
{
  double x = self->_tapPoint.x;
  double y = self->_tapPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTapPoint:(CGPoint)a3
{
  self->_tapPoint = a3;
}

- (int64_t)trackId
{
  return self->_trackId;
}

- (void)setTrackId:(int64_t)a3
{
  self->_trackId = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end