@interface CMAWatchOrientation
- (double)timestamp;
- (int)crown;
- (int)wrist;
- (void)setCrown:(int)a3;
- (void)setTimestamp:(double)a3;
- (void)setWrist:(int)a3;
@end

@implementation CMAWatchOrientation

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (int)wrist
{
  return self->_wrist;
}

- (void)setWrist:(int)a3
{
  self->_wrist = a3;
}

- (int)crown
{
  return self->_crown;
}

- (void)setCrown:(int)a3
{
  self->_crown = a3;
}

@end