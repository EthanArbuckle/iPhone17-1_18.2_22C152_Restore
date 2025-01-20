@interface HAP2CoAPIOThreadQueueEntry
- (id)initWithConsumer:(void *)a3 operationType:(void *)a4 sessionBlock:(void *)a5 timeout:(double)a6 activity:;
- (int64_t)compare:(id)a3;
@end

@implementation HAP2CoAPIOThreadQueueEntry

- (id)initWithConsumer:(void *)a3 operationType:(void *)a4 sessionBlock:(void *)a5 timeout:(double)a6 activity:
{
  id v12 = a2;
  id v13 = a4;
  id v14 = a5;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)HAP2CoAPIOThreadQueueEntry;
    v15 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = v15;
    if (v15)
    {
      objc_storeStrong(v15 + 1, a2);
      a1[2] = a3;
      uint64_t v16 = MEMORY[0x1D944E2D0](v13);
      id v17 = a1[3];
      a1[3] = (id)v16;

      *((double *)a1 + 4) = a6;
      objc_storeStrong(a1 + 5, a5);
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong(&self->_sessionBlock, 0);

  objc_storeStrong((id *)&self->_consumer, 0);
}

- (int64_t)compare:(id)a3
{
  v4 = (double *)a3;
  double v5 = 0.0;
  double timeout = 0.0;
  if (self) {
    double timeout = self->_timeout;
  }
  if (v4) {
    double v5 = v4[4];
  }
  if (timeout >= v5) {
    int64_t v7 = 1;
  }
  else {
    int64_t v7 = -1;
  }

  return v7;
}

@end