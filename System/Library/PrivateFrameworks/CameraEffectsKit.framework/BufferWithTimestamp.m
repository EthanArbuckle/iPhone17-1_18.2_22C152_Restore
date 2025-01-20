@interface BufferWithTimestamp
- (BufferWithTimestamp)initWithBuffer:(__CVBuffer *)a3 timstamp:(double)a4;
- (__CVBuffer)pixelBuffer;
- (double)timestamp;
@end

@implementation BufferWithTimestamp

- (BufferWithTimestamp)initWithBuffer:(__CVBuffer *)a3 timstamp:(double)a4
{
  self->_timestamp = a4;
  self->_pixelBuffer = a3;
  return self;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

@end