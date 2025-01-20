@interface GEOLunarEvent
- (BOOL)isAboveHorizon;
- (NSDate)date;
- (double)altitude;
- (double)bearing;
- (int64_t)type;
@end

@implementation GEOLunarEvent

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

- (NSDate)date
{
  return self->_date;
}

- (double)bearing
{
  return self->_bearing;
}

- (double)altitude
{
  return self->_altitude;
}

- (BOOL)isAboveHorizon
{
  return self->_isAboveHorizon;
}

@end