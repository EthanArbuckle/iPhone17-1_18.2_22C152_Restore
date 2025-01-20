@interface _PFEncodedArray
+ (Class)classForKeyedUnarchiver;
- (Class)classForCoder;
- (_PFEncodedArray)init;
- (const)_values;
- (id)description;
- (id)mutableCopy;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)_replaceObject:(id)a3 atIndex:(unint64_t)a4;
- (void)dealloc;
@end

@implementation _PFEncodedArray

- (unint64_t)count
{
  return self->_count;
}

- (const)_values
{
  return (const void **)&self[1].super.super.isa;
}

- (void)dealloc
{
  if (self->_count)
  {
    unint64_t v3 = 0;
    do

    while (v3 < self->_count);
  }
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)*((void *)&self[1].super.super.isa + a3);
}

- (_PFEncodedArray)init
{
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"You're doing it wrong" reason:@"Skanky class can only be used skankily." userInfo:0]);
}

- (id)description
{
  id v2 = [(_PFEncodedArray *)self copy];

  return v2;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (id)mutableCopy
{
  unint64_t v3 = self + 1;
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t count = self->_count;

  return (id)[v4 initWithObjects:v3 count:count];
}

- (void)_replaceObject:(id)a3 atIndex:(unint64_t)a4
{
  id v7 = a3;
  v8 = (id *)(&self->super.super.isa + a4);

  v8[3] = a3;
}

@end