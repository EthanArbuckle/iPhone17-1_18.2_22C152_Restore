@interface _OSLogChunkStore
- (NSString)fileName;
- (_OSLogChunkStore)initWithBytes:(const void *)a3 size:(unint64_t)a4;
- (void)enumerateChunksInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)enumerateChunksUsingBlock:(id)a3;
- (void)setFileName:(id)a3;
@end

@implementation _OSLogChunkStore

- (_OSLogChunkStore)initWithBytes:(const void *)a3 size:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_OSLogChunkStore;
  v6 = [(_OSLogChunkStore *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_ptr = a3;
    v6->_sz = a4;
    fileName = v6->fileName;
    v6->fileName = 0;
  }
  return v7;
}

- (void)setFileName:(id)a3
{
}

- (NSString)fileName
{
  return self->fileName;
}

- (void)enumerateChunksInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  if (location + length > self->_sz)
  {
    qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: enumerateChunksInRange:options:usingBlock: called with range larger than mapped file";
    qword_1E953C318 = location + length;
    __break(1u);
  }
  else
  {
    v8 = (char *)self->_ptr + location;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v14 = __54___OSLogChunkStore_enumerateChunksInRange_usingBlock___block_invoke;
    v15 = &unk_1E5A421D8;
    v16 = self;
    id v9 = v7;
    id v17 = v9;
    objc_super v10 = v13;
    unint64_t v11 = 0;
    do
    {
      if (length - v11 < 0x10) {
        break;
      }
      unint64_t v12 = *(void *)&v8[v11 + 8];
      if (length - v11 - 16 < v12) {
        break;
      }
      if (!((unsigned int (*)(void *))v14)(v10)) {
        break;
      }
      unint64_t v11 = (v11 + v12 + 23) & 0xFFFFFFFFFFFFFFF8;
    }
    while (v11 - 1 < length);
  }
}

- (void)enumerateChunksUsingBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end