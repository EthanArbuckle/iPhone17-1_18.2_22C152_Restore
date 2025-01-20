@interface _CNLazyArrayGeneratorSource
- (_CNLazyArrayGeneratorSource)initWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6;
- (id)nextObject;
@end

@implementation _CNLazyArrayGeneratorSource

- (_CNLazyArrayGeneratorSource)initWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)_CNLazyArrayGeneratorSource;
  v15 = [(_CNLazyArrayGeneratorSource *)&v25 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong(&v15->_state, a3);
    uint64_t v17 = [v12 copy];
    id condition = v16->_condition;
    v16->_id condition = (id)v17;

    uint64_t v19 = [v13 copy];
    id nextState = v16->_nextState;
    v16->_id nextState = (id)v19;

    uint64_t v21 = [v14 copy];
    id resultFromState = v16->_resultFromState;
    v16->_id resultFromState = (id)v21;

    v16->_firstTime = 1;
    v23 = v16;
  }

  return v16;
}

- (id)nextObject
{
  if (self->_firstTime)
  {
    self->_firstTime = 0;
    if ((*((uint64_t (**)(void))self->_condition + 2))())
    {
LABEL_3:
      v3 = (*((void (**)(void))self->_resultFromState + 2))();
      goto LABEL_6;
    }
  }
  else
  {
    v4 = (*((void (**)(void))self->_nextState + 2))();
    id state = self->_state;
    self->_id state = v4;

    if ((*((unsigned int (**)(void))self->_condition + 2))()) {
      goto LABEL_3;
    }
  }
  v3 = 0;
LABEL_6:

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultFromState, 0);
  objc_storeStrong(&self->_nextState, 0);
  objc_storeStrong(&self->_condition, 0);

  objc_storeStrong(&self->_state, 0);
}

@end