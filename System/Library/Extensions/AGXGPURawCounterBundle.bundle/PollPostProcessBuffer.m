@interface PollPostProcessBuffer
- (NSMutableData)dstBuffer;
- (PollPostProcessBuffer)init;
- (unsigned)srcBufferPrevOffset;
- (unsigned)srcBufferPrevSize;
- (void)dealloc;
- (void)reset;
- (void)setSrcBufferPrevOffset:(unsigned int)a3;
- (void)setSrcBufferPrevSize:(unsigned int)a3;
@end

@implementation PollPostProcessBuffer

- (NSMutableData)dstBuffer
{
  return self->_dstBuffer;
}

- (void)setSrcBufferPrevSize:(unsigned int)a3
{
  self->_srcBufferPrevSize = a3;
}

- (unsigned)srcBufferPrevSize
{
  return self->_srcBufferPrevSize;
}

- (void)setSrcBufferPrevOffset:(unsigned int)a3
{
  self->_srcBufferPrevOffset = a3;
}

- (unsigned)srcBufferPrevOffset
{
  return self->_srcBufferPrevOffset;
}

- (void)reset
{
  *(void *)&self->_srcBufferPrevOffset = 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PollPostProcessBuffer;
  [(PollPostProcessBuffer *)&v3 dealloc];
}

- (PollPostProcessBuffer)init
{
  v5.receiver = self;
  v5.super_class = (Class)PollPostProcessBuffer;
  v2 = [(PollPostProcessBuffer *)&v5 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFF990]) initWithLength:0x100000];
    v2->_dstBuffer = (NSMutableData *)v3;
    if (v3)
    {
      [(PollPostProcessBuffer *)v2 reset];
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

@end