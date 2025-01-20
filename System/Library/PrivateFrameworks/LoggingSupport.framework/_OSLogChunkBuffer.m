@interface _OSLogChunkBuffer
- (_OSLogChunkBuffer)initWithChunk:(tracev3_chunk_s *)a3 subchunk:(catalog_subchunk_s *)a4;
- (const)data;
- (unint64_t)size;
- (void)dealloc;
@end

@implementation _OSLogChunkBuffer

- (const)data
{
  return self->_data;
}

- (_OSLogChunkBuffer)initWithChunk:(tracev3_chunk_s *)a3 subchunk:(catalog_subchunk_s *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)_OSLogChunkBuffer;
  v6 = [(_OSLogChunkBuffer *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v8 = ($1B88CC5DF7FEF0EEA1185E68A64601DE *)_tracev3_chunk_decompress((uint64_t)a3, (uint64_t)a4, 0, &v6->_sz);
    v7->_data = (const char *)v8;
    if (!v8)
    {
      v9 = 0;
      goto LABEL_6;
    }
    v7->_allocated = v8 != &a3->var1;
  }
  v9 = v7;
LABEL_6:

  return v9;
}

- (unint64_t)size
{
  return self->_sz;
}

- (void)dealloc
{
  if (self->_allocated) {
    free((void *)self->_data);
  }
  v3.receiver = self;
  v3.super_class = (Class)_OSLogChunkBuffer;
  [(_OSLogChunkBuffer *)&v3 dealloc];
}

@end