@interface BPSZipMany
- (BOOL)completed;
- (BPSZipMany)initWithPublishers:(id)a3;
- (NSArray)publishers;
- (NSMutableArray)buffer;
- (id)_tryConstructResultArray;
- (id)nextEvent;
- (unint64_t)bufferResultCount;
- (unint64_t)currentPublisher;
- (void)_resetBuffer;
- (void)reset;
- (void)setBuffer:(id)a3;
- (void)setBufferResultCount:(unint64_t)a3;
- (void)setCurrentPublisher:(unint64_t)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSZipMany

- (BPSZipMany)initWithPublishers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BPSZipMany;
  v6 = [(BPSZipMany *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_publishers, a3);
    v7->_currentPublisher = 0;
    [(BPSZipMany *)v7 _resetBuffer];
  }

  return v7;
}

- (void)subscribe:(id)a3
{
  id v11 = a3;
  v4 = [(BPSZipMany *)self publishers];
  uint64_t v5 = [v4 count];

  v6 = [(_BPSAbstractZip *)[_BPSZipManyInner alloc] initWithDownstream:v11 upstreamCount:v5];
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      v8 = [(BPSZipMany *)self publishers];
      objc_super v9 = [v8 objectAtIndexedSubscript:i];
      v10 = [[_BPSAbstractZipSide alloc] initWithIndex:i zip:v6];
      [v9 subscribe:v10];
    }
  }
}

- (void)_resetBuffer
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v4 = [(BPSZipMany *)self publishers];
  uint64_t v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));
  [(BPSZipMany *)self setBuffer:v5];

  [(BPSZipMany *)self setBufferResultCount:0];
  v6 = [(BPSZipMany *)self publishers];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      objc_super v9 = [(BPSZipMany *)self buffer];
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v9 addObject:v10];

      ++v8;
      id v11 = [(BPSZipMany *)self publishers];
      unint64_t v12 = [v11 count];
    }
    while (v8 < v12);
  }
}

- (id)_tryConstructResultArray
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(BPSZipMany *)self bufferResultCount];
  v4 = [(BPSZipMany *)self publishers];
  uint64_t v5 = [v4 count];

  if (v3 == v5)
  {
    v6 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v7 = [(BPSZipMany *)self buffer];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          unint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v13 = [MEMORY[0x1E4F1CA98] null];
          char v14 = [v12 isEqual:v13];

          if (v14)
          {

            id v15 = 0;
            goto LABEL_13;
          }
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    [(BPSZipMany *)self _resetBuffer];
    id v15 = v6;
LABEL_13:
  }
  else
  {
    id v15 = 0;
  }
  return v15;
}

- (id)nextEvent
{
  unint64_t v3 = [(BPSZipMany *)self publishers];
  [v3 count];

  unint64_t v4 = 0;
  do
  {
    unint64_t v5 = [(BPSZipMany *)self currentPublisher];
    unint64_t v6 = [(BPSZipMany *)self currentPublisher] + 1;
    uint64_t v7 = [(BPSZipMany *)self publishers];
    -[BPSZipMany setCurrentPublisher:](self, "setCurrentPublisher:", v6 % [v7 count]);

    uint64_t v8 = [(BPSZipMany *)self publishers];
    uint64_t v9 = [v8 objectAtIndexedSubscript:v5];

    uint64_t v10 = [(BPSZipMany *)self buffer];
    id v11 = [v10 objectAtIndexedSubscript:v5];
    unint64_t v12 = [MEMORY[0x1E4F1CA98] null];
    int v13 = [v11 isEqual:v12];

    if (v13)
    {
      char v14 = [v9 nextEvent];
      if (v14)
      {
        id v15 = [(BPSZipMany *)self buffer];
        [v15 setObject:v14 atIndexedSubscript:v5];

        [(BPSZipMany *)self setBufferResultCount:[(BPSZipMany *)self bufferResultCount] + 1];
      }
    }
    v16 = [(BPSZipMany *)self _tryConstructResultArray];

    if (v16) {
      break;
    }
    ++v4;
    long long v17 = [(BPSZipMany *)self publishers];
    unint64_t v18 = [v17 count];
  }
  while (v4 <= v18);
  return v16;
}

- (void)reset
{
  [(BPSZipMany *)self setCurrentPublisher:0];
  [(BPSZipMany *)self _resetBuffer];
  v3.receiver = self;
  v3.super_class = (Class)BPSZipMany;
  [(BPSPublisher *)&v3 reset];
}

- (BOOL)completed
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(BPSZipMany *)self publishers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) completed])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSArray)publishers
{
  return self->_publishers;
}

- (unint64_t)currentPublisher
{
  return self->_currentPublisher;
}

- (void)setCurrentPublisher:(unint64_t)a3
{
  self->_currentPublisher = a3;
}

- (unint64_t)bufferResultCount
{
  return self->_bufferResultCount;
}

- (void)setBufferResultCount:(unint64_t)a3
{
  self->_bufferResultCount = a3;
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
  objc_storeStrong((id *)&self->_publishers, 0);
}

@end