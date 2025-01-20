@interface NSSearchPathEnumerator
- (NSSearchPathEnumerator)initWithDirectory:(unint64_t)a3 domains:(unint64_t)a4;
- (id)nextObject;
@end

@implementation NSSearchPathEnumerator

- (id)nextObject
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id result = (id)__CFGetNextSearchPathEnumeration();
  self->state = (int64_t)result;
  if (result) {
    return [+[NSFileManager defaultManager] stringWithFileSystemRepresentation:__s length:strlen(__s)];
  }
  return result;
}

- (NSSearchPathEnumerator)initWithDirectory:(unint64_t)a3 domains:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)NSSearchPathEnumerator;
  v6 = [(NSSearchPathEnumerator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->directory = a3;
    v6->domainMask = a4;
    v6->state = __CFStartSearchPathEnumeration();
  }
  return v7;
}

@end