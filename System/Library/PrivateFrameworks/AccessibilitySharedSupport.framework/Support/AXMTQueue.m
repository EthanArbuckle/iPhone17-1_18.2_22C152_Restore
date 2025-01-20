@interface AXMTQueue
- (AXEQueueDelegate)delegate;
- (AXMTQueue)init;
- (BOOL)filled;
- (NSArray)values;
- (NSMutableArray)_values;
- (id)_dequeue;
- (unint64_t)count;
- (void)_enqueue:(id)a3;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setFilled:(BOOL)a3;
- (void)set_values:(id)a3;
@end

@implementation AXMTQueue

- (AXMTQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXMTQueue;
  v2 = [(AXMTQueue *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    values = v2->__values;
    v2->__values = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)reset
{
  [(AXMTQueue *)self setFilled:0];
  while ([(AXMTQueue *)self count])
    id v3 = [(AXMTQueue *)self _dequeue];
}

- (NSArray)values
{
  v2 = [(AXMTQueue *)self _values];
  id v3 = +[NSArray arrayWithArray:v2];

  return (NSArray *)v3;
}

- (unint64_t)count
{
  v2 = [(AXMTQueue *)self _values];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (void)_enqueue:(id)a3
{
  id v7 = a3;
  v4 = [(AXMTQueue *)self _values];
  [v4 addObject:v7];

  v5 = [(AXMTQueue *)self delegate];
  objc_super v6 = v5;
  if (v5) {
    [v5 queue:self enqueuedValue:v7];
  }
}

- (id)_dequeue
{
  id v3 = [(AXMTQueue *)self _values];
  v4 = [v3 firstObject];

  v5 = [(AXMTQueue *)self _values];
  [v5 removeObjectAtIndex:0];

  objc_super v6 = [(AXMTQueue *)self delegate];
  id v7 = v6;
  if (v6) {
    [v6 queue:self dequeuedValue:v4];
  }

  return v4;
}

- (BOOL)filled
{
  return self->_filled;
}

- (void)setFilled:(BOOL)a3
{
  self->_filled = a3;
}

- (AXEQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXEQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)_values
{
  return self->__values;
}

- (void)set_values:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__values, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end