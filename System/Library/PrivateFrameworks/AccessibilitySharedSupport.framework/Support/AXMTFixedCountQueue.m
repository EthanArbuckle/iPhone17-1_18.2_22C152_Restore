@interface AXMTFixedCountQueue
- (AXMTFixedCountQueue)initWithMaxCount:(unint64_t)a3;
- (unint64_t)maxCount;
- (void)enqueueValue:(id)a3;
- (void)setMaxCount:(unint64_t)a3;
@end

@implementation AXMTFixedCountQueue

- (AXMTFixedCountQueue)initWithMaxCount:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXMTFixedCountQueue;
  result = [(AXMTQueue *)&v5 init];
  if (result) {
    result->_maxCount = a3;
  }
  return result;
}

- (void)enqueueValue:(id)a3
{
  id v7 = a3;
  v4 = [(AXMTQueue *)self count];
  if (v4 == (void *)[(AXMTFixedCountQueue *)self maxCount]) {
    id v5 = [(AXMTQueue *)self _dequeue];
  }
  [(AXMTQueue *)self _enqueue:v7];
  v6 = [(AXMTQueue *)self count];
  if (v6 == (void *)[(AXMTFixedCountQueue *)self maxCount]) {
    [(AXMTQueue *)self setFilled:1];
  }
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (void)setMaxCount:(unint64_t)a3
{
  self->_maxCount = a3;
}

@end