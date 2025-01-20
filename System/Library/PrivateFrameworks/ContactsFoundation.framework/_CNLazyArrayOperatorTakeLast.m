@interface _CNLazyArrayOperatorTakeLast
- (_CNLazyArrayOperatorTakeLast)initWithInput:(id)a3 limit:(unint64_t)a4;
- (id)nextObject;
- (void)fillBuffer;
@end

@implementation _CNLazyArrayOperatorTakeLast

- (_CNLazyArrayOperatorTakeLast)initWithInput:(id)a3 limit:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_CNLazyArrayOperatorTakeLast;
  v5 = [(_CNLazyArrayOperator *)&v10 initWithInput:a3];
  if (v5)
  {
    uint64_t v6 = +[CNQueue boundedQueueWithCapacity:a4];
    buffer = v5->_buffer;
    v5->_buffer = (CNQueue *)v6;

    v5->_haveFilledBuffer = 0;
    v8 = v5;
  }

  return v5;
}

- (id)nextObject
{
  if (!self->_haveFilledBuffer) {
    [(_CNLazyArrayOperatorTakeLast *)self fillBuffer];
  }
  buffer = self->_buffer;

  return [(CNQueue *)buffer dequeue];
}

- (void)fillBuffer
{
  if (!self->_haveFilledBuffer)
  {
    self->_haveFilledBuffer = 1;
    v3 = [(_CNLazyArrayOperator *)self input];
    v4 = [v3 nextObject];

    if (v4)
    {
      do
      {
        [(CNQueue *)self->_buffer enqueue:v4];
        v5 = [(_CNLazyArrayOperator *)self input];
        uint64_t v6 = [v5 nextObject];

        v4 = (void *)v6;
      }
      while (v6);
    }
  }
}

- (void).cxx_destruct
{
}

@end