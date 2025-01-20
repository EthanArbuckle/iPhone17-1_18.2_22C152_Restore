@interface ArraySlice
- (ArraySlice)initWithArray:(id)a3 offset:(unint64_t)a4 count:(unint64_t)a5;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
@end

@implementation ArraySlice

- (ArraySlice)initWithArray:(id)a3 offset:(unint64_t)a4 count:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ArraySlice;
  v10 = [(ArraySlice *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_array, a3);
    v11->_offset = a4;
    v11->_count = a5;
  }

  return v11;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t count = self->_count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = [NSString stringWithFormat:@"Attempt to index beyond end of array. Count of items is %lu, index is %lu", count, a3];
    id v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];

    [v9 raise];
  }
  array = self->_array;
  unint64_t v11 = self->_offset + a3;
  return [(NSArray *)array objectAtIndexedSubscript:v11];
}

- (void).cxx_destruct
{
}

@end