@interface ARReplayMovieDataWrapper
- (double)timestamp;
- (id)data;
- (void)setData:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ARReplayMovieDataWrapper

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (id)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end