@interface MFBaseFilterDataConsumer
+ (id)filterWithConsumer:(id)a3;
+ (id)filterWithConsumers:(id)a3;
- (BOOL)isSerialAppend;
- (MFBaseFilterDataConsumer)initWithConsumer:(id)a3;
- (MFBaseFilterDataConsumer)initWithConsumers:(id)a3;
- (NSArray)consumers;
- (int64_t)appendData:(id)a3;
- (void)done;
- (void)setSerialAppend:(BOOL)a3;
@end

@implementation MFBaseFilterDataConsumer

- (int64_t)appendData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (!self->_serialAppend)
  {
    uint64_t v15 = [(NSMutableArray *)self->_consumers count];
    if (v15 < 1)
    {
      int64_t v8 = 0;
      goto LABEL_27;
    }
    int64_t v8 = 0;
    uint64_t v16 = v15 + 1;
    while (1)
    {
      v10 = [(NSMutableArray *)self->_consumers objectAtIndex:v16 - 2];
      uint64_t v17 = [v10 appendData:v4];
      int64_t v18 = v17;
      if (v17)
      {
        if (v17 < 0)
        {
          [(NSMutableArray *)self->_consumers removeObjectAtIndex:v16 - 2];
          int64_t v8 = v18;
LABEL_26:

          goto LABEL_27;
        }
      }
      else
      {
        [v10 done];
        [(NSMutableArray *)self->_consumers removeObjectAtIndex:v16 - 2];
      }
      if (!v8) {
        int64_t v8 = [v4 length];
      }

      if ((unint64_t)--v16 <= 1) {
        goto LABEL_27;
      }
    }
  }
  uint64_t v6 = v5;
  uint64_t v7 = [v4 bytes];
  int64_t v8 = 0;
  while ([(NSMutableArray *)self->_consumers count] && v6 != v8)
  {
    v10 = [(NSMutableArray *)self->_consumers objectAtIndex:0];
    uint64_t v11 = v6 - v8;
    v12 = [[MFData alloc] initWithBytesNoCopy:v7 + v8 length:v6 - v8 freeWhenDone:0];
    uint64_t v13 = [v10 appendData:v12];
    int64_t v14 = v13;
    if (v13)
    {
      if (v13 < 0)
      {
        [(NSMutableArray *)self->_consumers removeObjectAtIndex:0];
        int64_t v8 = v14;
LABEL_24:

        goto LABEL_26;
      }
      v8 += v13;
      if (v13 < v11) {
        goto LABEL_24;
      }
    }
    else
    {
      [v10 done];
      [(NSMutableArray *)self->_consumers removeObjectAtIndex:0];
    }
  }
LABEL_27:

  return v8;
}

- (MFBaseFilterDataConsumer)initWithConsumers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFBaseFilterDataConsumer *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    consumers = v5->_consumers;
    v5->_consumers = (NSMutableArray *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

+ (id)filterWithConsumers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithConsumers:v4];

  return v5;
}

+ (id)filterWithConsumer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithConsumer:v4];

  return v5;
}

- (MFBaseFilterDataConsumer)initWithConsumer:(id)a3
{
  id v7 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:&v7 count:1];
  uint64_t v5 = [(MFBaseFilterDataConsumer *)self initWithConsumers:v4];

  return v5;
}

- (void)done
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = self->_consumers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v8 != v5) {
        objc_enumerationMutation(v3);
      }
      objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6), "done", (void)v7);
      if (self->_serialAppend) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)isSerialAppend
{
  return self->_serialAppend;
}

- (void)setSerialAppend:(BOOL)a3
{
  self->_serialAppend = a3;
}

- (NSArray)consumers
{
  return &self->_consumers->super;
}

@end