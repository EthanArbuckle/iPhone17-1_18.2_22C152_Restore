@interface _IMDispatchQueueBlock
- (NSString)key;
- (_IMDispatchQueueBlock)initWithBlock:(id)a3 key:(id)a4 priority:(int64_t)a5 fifo:(unint64_t)a6;
- (id)block;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)priority;
- (unint64_t)fifo;
- (void)cancel;
- (void)setBlock:(id)a3;
- (void)setFIFO:(unint64_t)a3;
- (void)setKey:(id)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation _IMDispatchQueueBlock

- (id)description
{
  v4 = NSString;
  v5 = objc_msgSend_block(self, a2, v2);
  v8 = objc_msgSend_key(self, v6, v7);
  uint64_t v11 = objc_msgSend_priority(self, v9, v10);
  uint64_t v14 = objc_msgSend_fifo(self, v12, v13);
  v19.receiver = self;
  v19.super_class = (Class)_IMDispatchQueueBlock;
  v15 = [(_IMDispatchQueueBlock *)&v19 description];
  v17 = objc_msgSend_stringWithFormat_(v4, v16, @"[_IMDispatchQueueBlock block:%@ key:%@ priority:%ld fifo:%ld %@]", v5, v8, v11, v14, v15);

  return v17;
}

- (_IMDispatchQueueBlock)initWithBlock:(id)a3 key:(id)a4 priority:(int64_t)a5 fifo:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_IMDispatchQueueBlock;
  v12 = [(_IMDispatchQueueBlock *)&v19 init];
  uint64_t v14 = v12;
  if (v12)
  {
    objc_msgSend_setBlock_(v12, v13, (uint64_t)v10);
    objc_msgSend_setKey_(v14, v15, (uint64_t)v11);
    objc_msgSend_setPriority_(v14, v16, a5);
    objc_msgSend_setFIFO_(v14, v17, a6);
  }

  return v14;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_priority(self, v5, v6);
  uint64_t v10 = objc_msgSend_priority(v4, v8, v9);
  if (v7 <= v10)
  {
    if (v7 < v10)
    {
      int64_t v13 = 1;
    }
    else
    {
      unint64_t v14 = objc_msgSend_fifo(self, v11, v12);
      unint64_t v17 = objc_msgSend_fifo(v4, v15, v16);
      if (v14 >= v17) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = -1;
      }
      if (v14 > v17) {
        int64_t v13 = 1;
      }
      else {
        int64_t v13 = v18;
      }
    }
  }
  else
  {
    int64_t v13 = -1;
  }

  return v13;
}

- (void)cancel
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (unint64_t)fifo
{
  return self->_fifo;
}

- (void)setFIFO:(unint64_t)a3
{
  self->_fifo = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong(&self->_block, 0);
}

@end