@interface IOKIterator
- (BOOL)isValid;
- (IOKIterator)initWithIterator:(unsigned int)a3;
- (IOKIterator)initWithIterator:(unsigned int)a3 enumerationBlock:(id)a4;
- (id)nextObject;
- (void)enumerate;
- (void)enumerateWithBlock:(id)a3;
- (void)reset;
@end

@implementation IOKIterator

- (IOKIterator)initWithIterator:(unsigned int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IOKIterator;
  return [(IOKObject *)&v4 initWithIOObject:*(void *)&a3];
}

- (void)enumerateWithBlock:(id)a3
{
  v7 = (void (**)(id, void *))a3;
  uint64_t v4 = [(IOKIterator *)self nextObject];
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v7[2](v7, v5);
      uint64_t v6 = [(IOKIterator *)self nextObject];

      v5 = (void *)v6;
    }
    while (v6);
  }
}

- (id)nextObject
{
  uint64_t v2 = IOIteratorNext([(IOKObject *)self object]);
  if (v2)
  {
    io_object_t v3 = v2;
    uint64_t v4 = objc_msgSend(objc_alloc(+[IOKObject classForRegistryEntry:](IOKObject, "classForRegistryEntry:", v2)), "initWithIOObject:", v2);
    IOObjectRelease(v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
}

- (IOKIterator)initWithIterator:(unsigned int)a3 enumerationBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = [(IOKIterator *)self initWithIterator:v4];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    id enumerationBlock = v7->_enumerationBlock;
    v7->_id enumerationBlock = (id)v8;
  }
  return v7;
}

- (void)reset
{
  [(IOKObject *)self object];

  JUMPOUT(0x223C6B360);
}

- (BOOL)isValid
{
  return IOIteratorIsValid([(IOKObject *)self object]) != 0;
}

- (void)enumerate
{
  id enumerationBlock = self->_enumerationBlock;
  if (!enumerationBlock)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"To use -enumerate you must initialise with the initWithIterator:enumerationBlock: method."];
    id enumerationBlock = self->_enumerationBlock;
  }

  [(IOKIterator *)self enumerateWithBlock:enumerationBlock];
}

@end