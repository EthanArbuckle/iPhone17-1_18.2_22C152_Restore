@interface SCNBufferBinding
- (NSString)name;
- (id)block;
- (int64_t)frequency;
- (void)dealloc;
- (void)setBlock:(id)a3;
- (void)setFrequency:(int64_t)a3;
- (void)setName:(id)a3;
@end

@implementation SCNBufferBinding

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNBufferBinding;
  [(SCNBufferBinding *)&v3 dealloc];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(int64_t)a3
{
  self->_frequency = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

@end