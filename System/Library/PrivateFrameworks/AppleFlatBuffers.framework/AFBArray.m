@interface AFBArray
- (AFBArray)initWithBufRef:(id)a3 count:(unint64_t)a4 objectAtIndex:(id)a5;
- (AFBArray)initWithCoder:(id)a3;
- (AFBArray)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
@end

@implementation AFBArray

- (unint64_t)count
{
  return self->_count;
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (self->_count <= a3)
  {
    id v8 = [NSString alloc];
    v9 = NSStringFromSelector(a2);
    uint64_t v10 = [v8 initWithFormat:@"%@ index %tu out of range for array of size %tu", v9, a3, self->_count];

    id v11 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] reason:v10 userInfo:0];
    objc_exception_throw(v11);
  }
  v3 = (uint64_t (*)(void))*((void *)self->_objectAtIndex + 2);
  return (id)v3();
}

- (AFBArray)initWithBufRef:(id)a3 count:(unint64_t)a4 objectAtIndex:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AFBArray;
  id v11 = [(AFBArray *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bufRef, a3);
    v12->_count = a4;
    uint64_t v13 = MEMORY[0x230F71680](v10);
    id objectAtIndex = v12->_objectAtIndex;
    v12->_id objectAtIndex = (id)v13;
  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_objectAtIndex, 0);
  objc_storeStrong((id *)&self->_bufRef, 0);
}

- (AFBArray)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v5 = (AFBArray *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithObjects:a3 count:a4];

  return v5;
}

- (AFBArray)initWithCoder:(id)a3
{
  result = (AFBArray *)a3;
  __break(1u);
  return result;
}

@end