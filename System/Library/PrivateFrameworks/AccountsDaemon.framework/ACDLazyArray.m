@interface ACDLazyArray
- (ACDLazyArray)init;
- (ACDLazyArray)initWithCoder:(id)a3;
- (ACDLazyArray)initWithInitializer:(id)a3;
- (ACDLazyArray)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
@end

@implementation ACDLazyArray

- (ACDLazyArray)init
{
  return [(ACDLazyArray *)self initWithInitializer:0];
}

- (ACDLazyArray)initWithInitializer:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACDLazyArray;
  v5 = [(ACDLazyArray *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v5->_initializationLock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 copy];
    id initializationBlock = v6->_initializationBlock;
    v6->_id initializationBlock = (id)v7;

    underlyingArray = v6->_underlyingArray;
    v6->_underlyingArray = 0;
  }
  return v6;
}

- (ACDLazyArray)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ACDLazyArray;
  v3 = [(ACDLazyArray *)&v8 initWithCoder:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_initializationLock._os_unfair_lock_opaque = 0;
    id initializationBlock = v3->_initializationBlock;
    v3->_id initializationBlock = 0;

    underlyingArray = v4->_underlyingArray;
    v4->_underlyingArray = 0;
  }
  return v4;
}

- (ACDLazyArray)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  return 0;
}

- (unint64_t)count
{
  _ACDLazyArrayInitializeIfNecessary(self);
  underlyingArray = self->_underlyingArray;

  return [(NSArray *)underlyingArray count];
}

- (id)objectAtIndex:(unint64_t)a3
{
  _ACDLazyArrayInitializeIfNecessary(self);
  underlyingArray = self->_underlyingArray;

  return [(NSArray *)underlyingArray objectAtIndex:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingArray, 0);

  objc_storeStrong(&self->_initializationBlock, 0);
}

@end