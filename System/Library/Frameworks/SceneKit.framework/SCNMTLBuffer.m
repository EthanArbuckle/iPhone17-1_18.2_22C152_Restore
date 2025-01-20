@interface SCNMTLBuffer
- (MTLBuffer)buffer;
- (id)dataSource;
- (int64_t)decrementUsedCount;
- (int64_t)usedCount;
- (unint64_t)offset;
- (void)contents;
- (void)dealloc;
- (void)incrementUsedCount;
- (void)setBuffer:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setOffset:(unint64_t)a3;
- (void)setUsedCount:(int64_t)a3;
@end

@implementation SCNMTLBuffer

- (unint64_t)offset
{
  return self->_offset;
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (void)setBuffer:(id)a3
{
}

- (void)setUsedCount:(int64_t)a3
{
  self->_usedCount = a3;
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = a3;
}

- (void)incrementUsedCount
{
  int64_t v3 = [(SCNMTLBuffer *)self usedCount] + 1;

  [(SCNMTLBuffer *)self setUsedCount:v3];
}

- (int64_t)usedCount
{
  return self->_usedCount;
}

- (void)contents
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLBuffer;
  [(SCNMTLBuffer *)&v3 dealloc];
}

- (int64_t)decrementUsedCount
{
  [(SCNMTLBuffer *)self setUsedCount:[(SCNMTLBuffer *)self usedCount] - 1];

  return [(SCNMTLBuffer *)self usedCount];
}

- (id)dataSource
{
  return self->_dataSource;
}

@end