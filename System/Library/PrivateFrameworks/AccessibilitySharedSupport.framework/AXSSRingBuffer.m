@interface AXSSRingBuffer
- (AXSSRingBuffer)init;
- (AXSSRingBuffer)initWithSize:(int64_t)a3;
- (NSLock)lock;
- (NSMutableArray)storage;
- (id)description;
- (id)objectAtIndex:(int64_t)a3;
- (int64_t)addObject:(id)a3;
- (int64_t)currentFilledSize;
- (int64_t)lastEntryIndex;
- (int64_t)size;
- (void)clear;
- (void)setLastEntryIndex:(int64_t)a3;
- (void)setLock:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)setStorage:(id)a3;
@end

@implementation AXSSRingBuffer

- (AXSSRingBuffer)initWithSize:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AXSSRingBuffer;
  v4 = [(AXSSRingBuffer *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_size = a3;
    uint64_t v6 = objc_opt_new();
    storage = v5->_storage;
    v5->_storage = (NSMutableArray *)v6;

    v5->_lastEntryIndex = -1;
    uint64_t v8 = objc_opt_new();
    lock = v5->_lock;
    v5->_lock = (NSLock *)v8;
  }
  return v5;
}

- (AXSSRingBuffer)init
{
  return [(AXSSRingBuffer *)self initWithSize:10];
}

- (int64_t)addObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(AXSSRingBuffer *)self lock];
    [v5 lock];

    int64_t v6 = [(AXSSRingBuffer *)self lastEntryIndex];
    if (v6 + 1 < [(AXSSRingBuffer *)self size]) {
      unint64_t v7 = v6 + 1;
    }
    else {
      unint64_t v7 = 0;
    }
    uint64_t v8 = [(AXSSRingBuffer *)self storage];
    uint64_t v9 = [v8 count];

    v10 = [(AXSSRingBuffer *)self storage];
    objc_super v11 = v10;
    if (v7 == v9)
    {
      [v10 addObject:v4];
    }
    else
    {
      unint64_t v12 = [v10 count];

      if (v7 >= v12)
      {
LABEL_11:
        [(AXSSRingBuffer *)self setLastEntryIndex:v7];
        v13 = [(AXSSRingBuffer *)self lock];
        [v13 unlock];

        goto LABEL_12;
      }
      objc_super v11 = [(AXSSRingBuffer *)self storage];
      [v11 replaceObjectAtIndex:v7 withObject:v4];
    }

    goto LABEL_11;
  }
  unint64_t v7 = -1;
LABEL_12:

  return v7;
}

- (id)objectAtIndex:(int64_t)a3
{
  v5 = [(AXSSRingBuffer *)self lock];
  [v5 lock];

  if (a3 < 0
    || ([(AXSSRingBuffer *)self storage],
        int64_t v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = [v6 count],
        v6,
        v7 <= a3))
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = [(AXSSRingBuffer *)self storage];
    uint64_t v9 = [v8 objectAtIndexedSubscript:a3];
  }
  v10 = [(AXSSRingBuffer *)self lock];
  [v10 unlock];

  return v9;
}

- (int64_t)currentFilledSize
{
  v3 = [(AXSSRingBuffer *)self lock];
  [v3 lock];

  id v4 = [(AXSSRingBuffer *)self storage];
  int64_t v5 = [v4 count];

  int64_t v6 = [(AXSSRingBuffer *)self lock];
  [v6 unlock];

  return v5;
}

- (void)clear
{
  v3 = [(AXSSRingBuffer *)self lock];
  [v3 lock];

  id v4 = objc_opt_new();
  [(AXSSRingBuffer *)self setStorage:v4];

  [(AXSSRingBuffer *)self setLastEntryIndex:-1];
  id v5 = [(AXSSRingBuffer *)self lock];
  [v5 unlock];
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)AXSSRingBuffer;
  v3 = [(AXSSRingBuffer *)&v13 description];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(AXSSRingBuffer *)self lock];
  [v5 lock];

  int64_t v6 = [(AXSSRingBuffer *)self size];
  unint64_t v7 = [(AXSSRingBuffer *)self storage];
  uint64_t v8 = [v7 count];
  int64_t v9 = [(AXSSRingBuffer *)self lastEntryIndex];
  v10 = [(AXSSRingBuffer *)self storage];
  [v4 appendFormat:@"Size:%li filledSize:%li, latestEntry:%li, contents: %@", v6, v8, v9, v10];

  objc_super v11 = [(AXSSRingBuffer *)self lock];
  [v11 unlock];

  return v4;
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (NSMutableArray)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (int64_t)lastEntryIndex
{
  return self->_lastEntryIndex;
}

- (void)setLastEntryIndex:(int64_t)a3
{
  self->_lastEntryIndex = a3;
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_storage, 0);
}

@end