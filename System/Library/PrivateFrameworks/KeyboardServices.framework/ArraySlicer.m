@interface ArraySlicer
- (ArraySlicer)initWithArray:(id)a3 sliceSize:(unint64_t)a4;
- (id)consumed;
- (id)nextSlice;
- (id)unconsumed;
- (unint64_t)remaining;
@end

@implementation ArraySlicer

- (ArraySlicer)initWithArray:(id)a3 sliceSize:(unint64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ArraySlicer;
  v8 = [(ArraySlicer *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_array, a3);
    uint64_t v10 = [v7 count];
    v9->_sliceSize = a4;
    v9->_count = v10;
  }

  return v9;
}

- (unint64_t)remaining
{
  int64_t v2 = self->_count - self->_offset;
  return v2 & ~(v2 >> 63);
}

- (id)nextSlice
{
  unint64_t count = self->_count;
  unint64_t offset = self->_offset;
  BOOL v4 = count >= offset;
  unint64_t v5 = count - offset;
  if (v5 != 0 && v4)
  {
    if (self->_sliceSize >= v5) {
      unint64_t sliceSize = v5;
    }
    else {
      unint64_t sliceSize = self->_sliceSize;
    }
    v8 = [[ArraySlice alloc] initWithArray:self->_array offset:self->_offset count:sliceSize];
    self->_offset += sliceSize;
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)consumed
{
  if (self->_offset) {
    int64_t v2 = [[ArraySlice alloc] initWithArray:self->_array offset:0 count:self->_offset];
  }
  else {
    int64_t v2 = 0;
  }
  return v2;
}

- (id)unconsumed
{
  unint64_t count = self->_count;
  unint64_t offset = self->_offset;
  if (count <= offset) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [[ArraySlice alloc] initWithArray:self->_array offset:self->_offset count:count - offset];
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end