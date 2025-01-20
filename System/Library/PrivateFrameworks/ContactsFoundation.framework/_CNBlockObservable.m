@interface _CNBlockObservable
- (_CNBlockObservable)initWithBlock:(id)a3;
- (id)subscribe:(id)a3;
@end

@implementation _CNBlockObservable

- (void).cxx_destruct
{
}

- (_CNBlockObservable)initWithBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNBlockObservable;
  v5 = [(_CNBlockObservable *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (id)subscribe:(id)a3
{
  return (id)(*((uint64_t (**)(void))self->_block + 2))();
}

@end