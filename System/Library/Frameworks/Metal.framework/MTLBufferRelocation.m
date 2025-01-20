@interface MTLBufferRelocation
- (MTLBuffer)buffer;
- (MTLBufferRelocation)initWithSymbolName:(id)a3 buffer:(id)a4 offset:(unint64_t)a5;
- (NSString)symbolName;
- (unint64_t)offset;
- (void)dealloc;
@end

@implementation MTLBufferRelocation

- (MTLBufferRelocation)initWithSymbolName:(id)a3 buffer:(id)a4 offset:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MTLBufferRelocation;
  v8 = [(MTLBufferRelocation *)&v10 init];
  if (v8)
  {
    v8->_symbolName = (NSString *)a3;
    v8->_buffer = (MTLBuffer *)a4;
    v8->_offset = a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLBufferRelocation;
  [(MTLBufferRelocation *)&v3 dealloc];
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (unint64_t)offset
{
  return self->_offset;
}

@end