@interface _OSLogChunkMemory
- (_OSLogChunkMemory)initWithBytes:(const void *)a3 size:(unint64_t)a4 deallocator:(id)a5;
- (void)dealloc;
@end

@implementation _OSLogChunkMemory

- (void)dealloc
{
  (*((void (**)(void))self->_deallocator + 2))();
  v3.receiver = self;
  v3.super_class = (Class)_OSLogChunkMemory;
  [(_OSLogChunkMemory *)&v3 dealloc];
}

- (_OSLogChunkMemory)initWithBytes:(const void *)a3 size:(unint64_t)a4 deallocator:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_OSLogChunkMemory;
  v9 = [(_OSLogChunkStore *)&v13 initWithBytes:a3 size:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id deallocator = v9->_deallocator;
    v9->_id deallocator = (id)v10;
  }
  return v9;
}

- (void).cxx_destruct
{
}

@end