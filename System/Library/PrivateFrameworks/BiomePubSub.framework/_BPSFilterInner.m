@interface _BPSFilterInner
- (_BPSFilterInner)initWithDownstream:(id)a3 isIncluded:(id)a4;
- (id)isIncluded;
- (id)receiveNewValue:(id)a3;
@end

@implementation _BPSFilterInner

- (_BPSFilterInner)initWithDownstream:(id)a3 isIncluded:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_BPSFilterInner;
  v7 = [(BPSFilterProducer *)&v11 initWithDownstream:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    id isIncluded = v7->_isIncluded;
    v7->_id isIncluded = (id)v8;
  }
  return v7;
}

- (id)receiveNewValue:(id)a3
{
  id v4 = a3;
  v5 = [(_BPSFilterInner *)self isIncluded];
  int v6 = ((uint64_t (**)(void, id))v5)[2](v5, v4);

  if (v6) {
    id v7 = v4;
  }
  else {
    id v7 = 0;
  }
  uint64_t v8 = [[BPSPartialCompletion alloc] initWithState:1 value:v7 error:0];

  return v8;
}

- (id)isIncluded
{
  return self->_isIncluded;
}

- (void).cxx_destruct
{
}

@end