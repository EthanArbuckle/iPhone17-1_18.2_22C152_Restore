@interface EspressoBrickTensorShape
- (int)batch;
- (int)channels;
- (int)height;
- (int)rank;
- (int)sequence;
- (int)width;
- (void)setBatch:(int)a3;
- (void)setChannels:(int)a3;
- (void)setHeight:(int)a3;
- (void)setRank:(int)a3;
- (void)setSequence:(int)a3;
- (void)setWidth:(int)a3;
@end

@implementation EspressoBrickTensorShape

- (void)setRank:(int)a3
{
  self->_rank = a3;
}

- (int)rank
{
  return self->_rank;
}

- (void)setSequence:(int)a3
{
  self->_sequence = a3;
}

- (int)sequence
{
  return self->_sequence;
}

- (void)setBatch:(int)a3
{
  self->_batch = a3;
}

- (int)batch
{
  return self->_batch;
}

- (void)setChannels:(int)a3
{
  self->_channels = a3;
}

- (int)channels
{
  return self->_channels;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

- (int)height
{
  return self->_height;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (int)width
{
  return self->_width;
}

@end