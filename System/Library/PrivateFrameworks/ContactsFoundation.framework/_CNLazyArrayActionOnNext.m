@interface _CNLazyArrayActionOnNext
- (_CNLazyArrayActionOnNext)initWithInput:(id)a3 action:(id)a4;
- (id)nextObject;
@end

@implementation _CNLazyArrayActionOnNext

- (_CNLazyArrayActionOnNext)initWithInput:(id)a3 action:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CNLazyArrayActionOnNext;
  v7 = [(_CNLazyArrayOperator *)&v12 initWithInput:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    id action = v7->_action;
    v7->_id action = (id)v8;

    v10 = v7;
  }

  return v7;
}

- (id)nextObject
{
  v3 = [(_CNLazyArrayOperator *)self input];
  v4 = [v3 nextObject];

  if (v4) {
    (*((void (**)(void))self->_action + 2))();
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end