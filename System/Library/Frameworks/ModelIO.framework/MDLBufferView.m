@interface MDLBufferView
- (MDLBufferView)initWithBytesNoCopy:(const void *)a3 length:(unint64_t)a4 offset:(unint64_t)a5 regionIndex:(int64_t)a6 allocator:(id)a7;
- (const)data;
- (unint64_t)length;
@end

@implementation MDLBufferView

- (const)data
{
  return (char *)self->_data + self->_offset;
}

- (unint64_t)length
{
  return self->_length;
}

- (MDLBufferView)initWithBytesNoCopy:(const void *)a3 length:(unint64_t)a4 offset:(unint64_t)a5 regionIndex:(int64_t)a6 allocator:(id)a7
{
  id v13 = a7;
  v18.receiver = self;
  v18.super_class = (Class)MDLBufferView;
  v14 = [(MDLBufferView *)&v18 init];
  v15 = v14;
  if (v14)
  {
    v14->_writable = 0;
    objc_storeStrong((id *)&v14->_allocator, a7);
    v15->_data = a3;
    v15->_length = a4;
    v15->_offset = a5;
    v15->_regionIndex = a6;
    v16 = v15;
  }

  return v15;
}

- (void).cxx_destruct
{
}

@end