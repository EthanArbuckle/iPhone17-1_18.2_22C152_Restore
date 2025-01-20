@interface _CSStore2DataContainer
+ (id)new;
- (_CSStore2DataContainer)init;
- (_CSStore2DataContainer)initWithBytesNoCopy:(Data *)a3 length:(unsigned int)a4;
- (void)dealloc;
@end

@implementation _CSStore2DataContainer

- (_CSStore2DataContainer)initWithBytesNoCopy:(Data *)a3 length:(unsigned int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_CSStore2DataContainer;
  result = [(_CSStore2DataContainer *)&v9 init];
  if (result)
  {
    result->p = a3;
    unsigned int v7 = *MEMORY[0x1E4F14B00];
    unsigned int v8 = a4 + *MEMORY[0x1E4F14B00] - 1;
    if (v8 != v8 % *MEMORY[0x1E4F14B00]) {
      v7 *= v8 / v7;
    }
    result->pAllocatedLength = v7;
  }
  return result;
}

- (void)dealloc
{
  p = self->p;
  if (p) {
    CSStore2::VM::Deallocate((CSStore2::VM *)p, (void *)self->pAllocatedLength);
  }
  v4.receiver = self;
  v4.super_class = (Class)_CSStore2DataContainer;
  [(_CSStore2DataContainer *)&v4 dealloc];
}

- (_CSStore2DataContainer)init
{
}

+ (id)new
{
}

@end