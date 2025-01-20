@interface _BPSReduceInner
- (_BPSReduceInner)initWithDownstream:(id)a3 initial:(id)a4 reduce:(id)a5;
- (id)receiveNewValue:(id)a3;
- (id)reduce;
@end

@implementation _BPSReduceInner

- (_BPSReduceInner)initWithDownstream:(id)a3 initial:(id)a4 reduce:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_BPSReduceInner;
  v9 = [(BPSReduceProducer *)&v13 initWithDownstream:a3 initial:a4 reduce:v8];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id reduce = v9->_reduce;
    v9->_id reduce = (id)v10;
  }
  return v9;
}

- (id)receiveNewValue:(id)a3
{
  id v4 = a3;
  v5 = [(_BPSReduceInner *)self reduce];
  v6 = [(BPSReduceProducer *)self result];
  v7 = ((void (**)(void, void *, id))v5)[2](v5, v6, v4);

  [(BPSReduceProducer *)self setResult:v7];
  id v8 = [BPSPartialCompletion alloc];
  v9 = [(BPSReduceProducer *)self result];
  uint64_t v10 = [(BPSPartialCompletion *)v8 initWithState:1 value:v9 error:0];

  return v10;
}

- (id)reduce
{
  return self->_reduce;
}

- (void).cxx_destruct
{
}

@end