@interface FIFOQueue
- (FIFOQueue)init;
- (FIFOQueue)initWithArray:(id)a3;
- (id)dequeueBlock;
- (id)firstBlock;
- (unint64_t)count;
- (unsigned)resetSequence;
- (void)dequeueAllBlocks;
- (void)enqueueArray:(id)a3;
- (void)enqueueBlock:(id)a3;
@end

@implementation FIFOQueue

- (FIFOQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)FIFOQueue;
  v2 = [(FIFOQueue *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    queue = v2->_queue;
    v2->_queue = (NSMutableArray *)v3;
  }
  return v2;
}

- (FIFOQueue)initWithArray:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FIFOQueue;
  v5 = [(FIFOQueue *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[NSMutableArray arrayWithArray:v4];
    queue = v5->_queue;
    v5->_queue = (NSMutableArray *)v6;
  }
  return v5;
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_queue count];
}

- (id)firstBlock
{
  return [(NSMutableArray *)self->_queue lastObject];
}

- (id)dequeueBlock
{
  uint64_t v3 = [(NSMutableArray *)self->_queue lastObject];
  [(NSMutableArray *)self->_queue removeLastObject];

  return v3;
}

- (void)enqueueBlock:(id)a3
{
}

- (void)enqueueArray:(id)a3
{
}

- (void)dequeueAllBlocks
{
}

- (unsigned)resetSequence
{
  v2 = self;
  uint64_t v3 = (char *)[(NSMutableArray *)self->_queue count];
  int v4 = 0;
  if ([(NSMutableArray *)v2->_queue count])
  {
    v5 = v3 - 1;
    unint64_t v6 = 1;
    v7 = &selRef_handleIBlock_ackBlock_queue_resultData_;
    do
    {
      v8 = [(NSMutableArray *)v2->_queue objectAtIndexedSubscript:v5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v21 = v4 + 1;
        v20 = v7 + 373;
        char v19 = v4;
        objc_super v9 = v2;
        v10 = v7;
        v11 = v5;
        id v12 = v8;
        id v13 = [v12 nodeAddressByte];
        id v14 = [v12 moreData];
        v15 = [v12 informationField];
        id v16 = [v12 redundancyCodeType];

        v5 = v11;
        v7 = v10;
        v2 = v9;
        v17 = [v20 informationBlockWithNad:v13 sequence:v19 & 1 moreData:v14 informationField:v15 redundancyCode:v16];
        [(NSMutableArray *)v2->_queue setObject:v17 atIndexedSubscript:v5];

        int v4 = v21;
      }

      ++v6;
    }
    while (v6 <= (unint64_t)[(NSMutableArray *)v2->_queue count]);
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end