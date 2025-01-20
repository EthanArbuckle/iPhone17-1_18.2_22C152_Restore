@interface XRFrameActivityBlockAgent
- (BOOL)yieldNow;
- (XRFrameActivityBlockAgent)init;
- (XRFrameActivityBlockAgent)initWithBlock:(id)a3;
- (id)agentDiagnosticsName;
- (id)operationRepresentation;
- (void)dealloc;
- (void)executeStopOnItinerary:(id)a3;
- (void)setYieldNow:(BOOL *)a3;
@end

@implementation XRFrameActivityBlockAgent

- (XRFrameActivityBlockAgent)initWithBlock:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)XRFrameActivityBlockAgent;
  v9 = [(XRFrameActivityBlockAgent *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v4 v5:v6 v7:v8];
    id block = v9->_block;
    v9->_id block = (id)v10;
  }
  return v9;
}

- (XRFrameActivityBlockAgent)init
{
  return (XRFrameActivityBlockAgent *)[[XRFrameActivityBlockAgent alloc] initWithBlock:a2 queue:v2 completion:v3];
}

- (void)dealloc
{
  p_opPtr = &self->_opPtr;
  unint64_t v4 = -1;
  atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_opPtr, &v4, v4);
  if (v4 != -1)
  {
    do
    {
      if (v4)
      {
        if (v4 == -1) {
          sub_23459C294();
        }
      }
      unint64_t v5 = v4;
      atomic_compare_exchange_strong((atomic_ullong *volatile)p_opPtr, &v5, 0xFFFFFFFFFFFFFFFFLL);
      BOOL v6 = v5 == v4;
      unint64_t v4 = v5;
    }
    while (!v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)XRFrameActivityBlockAgent;
  [(XRFrameActivityBlockAgent *)&v7 dealloc];
}

- (id)agentDiagnosticsName
{
  return @"Frame Activity Block";
}

- (void)executeStopOnItinerary:(id)a3
{
  id v4 = a3;
  [self performSelector:v5 withObject:v6 withObject:v7 withObject:v8];
  objc_super v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v13 == @"Activating")
  {
    if ([self movementType:v9 with:v10 with:v11 with:v12] == 1)
    {
      v28.receiver = self;
      v28.super_class = (Class)XRFrameActivityBlockAgent;
      [(XRMobileAgent *)&v28 executeStopOnItinerary:v4];
    }
    if (atomic_load_explicit((atomic_uchar *volatile)self->_yieldNow, memory_order_acquire))
    {
      [v4 setFoo:v14 bar:v15 baz:v16 qux:v17];
    }
    else
    {
      (*((void (**)(void))self->_block + 2))();
      v21 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_opPtr, (unint64_t *)&v21, 0xFFFFFFFFFFFFFFFFLL);
      if (v21)
      {
        if (v21 == (void *)-1) {
          __assert_rtn("-[XRFrameActivityBlockAgent executeStopOnItinerary:]", "XRFrameActivityBlockAgent.m", 81, "current != FINISHED_OPERATION");
        }
        id v22 = v21;
        [v22 v23:v24 v25:v26];
      }
      [v4 finishedWithMode:v18 mode:v19 mode:v20];
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)XRFrameActivityBlockAgent;
    [(XRMobileAgent *)&v27 executeStopOnItinerary:v4];
  }
}

- (id)operationRepresentation
{
  uint64_t v3 = objc_opt_new();
  id v8 = v3;
  v9 = 0;
  atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_opPtr, (unint64_t *)&v9, (unint64_t)v3);
  if (v9)
  {
    if (v9 == (void *)-1)
    {
      [v3 v4:v5 v6:v7];
    }
    else
    {
      id v10 = v9;

      id v8 = v10;
    }
  }
  else
  {
    id v8 = v3;
  }

  return v8;
}

- (BOOL)yieldNow
{
  return self->_yieldNow;
}

- (void)setYieldNow:(BOOL *)a3
{
  self->_yieldNow = a3;
}

- (void).cxx_destruct
{
}

@end