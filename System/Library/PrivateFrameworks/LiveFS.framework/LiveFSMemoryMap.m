@interface LiveFSMemoryMap
+ (id)newWithPort:(unsigned int)a3 address:(unint64_t)a4 andSize:(unint64_t)a5;
- (LiveFSMemoryMap)initWithPort:(unsigned int)a3 address:(unint64_t)a4 andSize:(unint64_t)a5;
- (unint64_t)address;
- (unint64_t)size;
- (unsigned)port;
- (void)dealloc;
- (void)setPort:(unsigned int)a3;
@end

@implementation LiveFSMemoryMap

- (LiveFSMemoryMap)initWithPort:(unsigned int)a3 address:(unint64_t)a4 andSize:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)LiveFSMemoryMap;
  result = [(LiveFSMemoryMap *)&v9 init];
  if (result)
  {
    result->_port = a3;
    result->_address = a4;
    result->_size = a5;
  }
  return result;
}

+ (id)newWithPort:(unsigned int)a3 address:(unint64_t)a4 andSize:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  v8 = [LiveFSMemoryMap alloc];

  return [(LiveFSMemoryMap *)v8 initWithPort:v7 address:a4 andSize:a5];
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_23AB0B000, a2, OS_LOG_TYPE_DEBUG, "LiveFSMemoryMap: dealloc: error %d", (uint8_t *)v2, 8u);
}

- (unint64_t)address
{
  return self->_address;
}

- (unint64_t)size
{
  return self->_size;
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned int)a3
{
  self->_port = a3;
}

@end