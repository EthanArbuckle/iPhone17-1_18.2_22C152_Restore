@interface DESizeWriter
- (DESizeWriter)init;
- (unint64_t)size;
- (void)setSize:(unint64_t)a3;
- (void)writeData:(id)a3;
@end

@implementation DESizeWriter

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)writeData:(id)a3
{
  self->_size += [a3 length];
}

- (DESizeWriter)init
{
  v6.receiver = self;
  v6.super_class = (Class)DESizeWriter;
  v2 = [(DESizeWriter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_size = 0;
    v4 = v2;
  }

  return v3;
}

@end