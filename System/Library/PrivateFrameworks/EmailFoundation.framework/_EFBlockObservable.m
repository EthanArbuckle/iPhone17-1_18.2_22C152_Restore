@interface _EFBlockObservable
- (_EFBlockObservable)initWithBlock:(id)a3;
- (id)subscribe:(id)a3;
@end

@implementation _EFBlockObservable

- (void).cxx_destruct
{
}

- (id)subscribe:(id)a3
{
  v3 = (*((void (**)(void))self->_block + 2))();
  return v3;
}

- (_EFBlockObservable)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EFBlockObservable;
  v5 = [(_EFBlockObservable *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id block = v5->_block;
    v5->_id block = v6;
  }
  return v5;
}

@end