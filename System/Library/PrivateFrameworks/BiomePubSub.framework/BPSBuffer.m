@interface BPSBuffer
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BOOL)canStoreInternalStateInBookmark;
- (BPSBuffer)initWithUpstream:(id)a3 size:(unint64_t)a4 prefetch:(unint64_t)a5 whenFull:(unint64_t)a6;
- (BPSBuffer)initWithUpstream:(id)a3 size:(unint64_t)a4 prefetch:(unint64_t)a5 whenFull:(unint64_t)a6 values:(id)a7;
- (BPSPublisher)upstream;
- (NSMutableArray)buffer;
- (NSMutableArray)values;
- (id)bookmarkableUpstreams;
- (id)nextEvent;
- (id)upstreamPublishers;
- (id)validateBookmark:(id)a3;
- (unint64_t)prefetch;
- (unint64_t)size;
- (unint64_t)whenFull;
- (void)addToBuffer:(id)a3;
- (void)reset;
- (void)setBuffer:(id)a3;
- (void)setValues:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSBuffer

- (BPSBuffer)initWithUpstream:(id)a3 size:(unint64_t)a4 prefetch:(unint64_t)a5 whenFull:(unint64_t)a6
{
  return [(BPSBuffer *)self initWithUpstream:a3 size:a4 prefetch:a5 whenFull:a6 values:0];
}

- (BPSBuffer)initWithUpstream:(id)a3 size:(unint64_t)a4 prefetch:(unint64_t)a5 whenFull:(unint64_t)a6 values:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BPSBuffer;
  v15 = [(BPSBuffer *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_upstream, a3);
    v16->_size = a4;
    v16->_prefetch = a5;
    v16->_whenFull = a6;
    objc_storeStrong((id *)&v16->_values, a7);
    uint64_t v17 = objc_opt_new();
    buffer = v16->_buffer;
    v16->_buffer = (NSMutableArray *)v17;
  }
  return v16;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  v5 = [[BPSBufferInner alloc] initWithDownstream:v4 size:self->_size prefetch:self->_prefetch whenFull:self->_whenFull];

  [(BPSPublisher *)self->_upstream subscribe:v5];
}

- (id)upstreamPublishers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSBuffer *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)nextEvent
{
  unint64_t prefetch = self->_prefetch;
  if (prefetch == 1)
  {
    v9 = [(BPSBuffer *)self upstream];
    v10 = [v9 nextEvent];

    if (v10)
    {
      do
      {
        [(BPSBuffer *)self addToBuffer:v10];
        v11 = [(BPSBuffer *)self upstream];
        uint64_t v12 = [v11 nextEvent];

        v10 = (void *)v12;
      }
      while (v12);
    }
  }
  else
  {
    if (prefetch) {
      goto LABEL_10;
    }
    while (1)
    {
      id v4 = [(BPSBuffer *)self buffer];
      unint64_t v5 = [v4 count];
      unint64_t v6 = [(BPSBuffer *)self size];

      if (v5 >= v6) {
        break;
      }
      v7 = [(BPSBuffer *)self upstream];
      v8 = [v7 nextEvent];

      if (!v8) {
        break;
      }
      [(BPSBuffer *)self addToBuffer:v8];
    }
  }
  id v13 = [(BPSBuffer *)self buffer];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    v15 = [(BPSBuffer *)self buffer];
    v16 = [v15 objectAtIndex:0];

    uint64_t v17 = [(BPSBuffer *)self buffer];
    [v17 removeObjectAtIndex:0];

    goto LABEL_11;
  }
LABEL_10:
  v16 = 0;
LABEL_11:
  return v16;
}

- (void)addToBuffer:(id)a3
{
  id v13 = a3;
  unint64_t whenFull = self->_whenFull;
  if (whenFull != 1)
  {
    if (whenFull) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  unint64_t v5 = [(BPSBuffer *)self buffer];
  unint64_t v6 = [v5 count];
  if (v6 >= [(BPSBuffer *)self size])
  {
    v7 = [(BPSBuffer *)self buffer];
    uint64_t v8 = [v7 count];

    if (!v8) {
      goto LABEL_8;
    }
    unint64_t v5 = [(BPSBuffer *)self buffer];
    [v5 removeObjectAtIndex:0];
  }

LABEL_8:
  v9 = [(BPSBuffer *)self buffer];
  unint64_t v10 = [v9 count];
  unint64_t v11 = [(BPSBuffer *)self size];

  if (v10 < v11)
  {
    uint64_t v12 = [(BPSBuffer *)self buffer];
    [v12 addObject:v13];
  }
LABEL_10:
}

- (void)reset
{
  v3 = objc_opt_new();
  [(BPSBuffer *)self setBuffer:v3];

  v4.receiver = self;
  v4.super_class = (Class)BPSBuffer;
  [(BPSPublisher *)&v4 reset];
}

- (id)validateBookmark:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v4 = 0;
  }
  else
  {
    id v5 = [NSString alloc];
    uint64_t v6 = objc_opt_class();
    v7 = (void *)[v5 initWithFormat:@"%@ expected bookmark of class %@, but received %@", v6, objc_opt_class(), v3];
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = v7;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    objc_super v4 = [v8 errorWithDomain:@"BiomePubSubError" code:2 userInfo:v9];
  }
  return v4;
}

- (id)bookmarkableUpstreams
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_upstream;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_super v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:a1 file:@"BPSBuffer.m" lineNumber:472 description:@"bookmark for Buffer should be a buffer object"];
    }
  }
  id v12 = v9;
  id v13 = [BPSBuffer alloc];
  uint64_t v14 = [v12 upstream];
  uint64_t v15 = [v12 size];
  uint64_t v16 = [v12 prefetch];
  uint64_t v17 = [v12 whenFull];

  v18 = [(BPSBuffer *)v13 initWithUpstream:v14 size:v15 prefetch:v16 whenFull:v17 values:v11];
  return v18;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)prefetch
{
  return self->_prefetch;
}

- (unint64_t)whenFull
{
  return self->_whenFull;
}

- (NSMutableArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (NSMutableArray)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

@end