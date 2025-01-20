@interface PDFBlockQueuePair
+ (id)blockQueuePairWithBlock:(id)a3 andQueue:(id)a4;
- (OS_dispatch_queue)queue;
- (PDFBlockQueuePair)initWithBlock:(id)a3 andQueue:(id)a4;
- (id)block;
@end

@implementation PDFBlockQueuePair

+ (id)blockQueuePairWithBlock:(id)a3 andQueue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[PDFBlockQueuePair alloc] initWithBlock:v6 andQueue:v5];

  return v7;
}

- (PDFBlockQueuePair)initWithBlock:(id)a3 andQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDFBlockQueuePair;
  v8 = [(PDFBlockQueuePair *)&v12 init];
  if (v8)
  {
    v9 = _Block_copy(v6);
    id block = v8->_block;
    v8->_id block = v9;

    objc_storeStrong((id *)&v8->_queue, a4);
  }

  return v8;
}

- (id)block
{
  return objc_getProperty(self, a2, 8, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_block, 0);
}

@end