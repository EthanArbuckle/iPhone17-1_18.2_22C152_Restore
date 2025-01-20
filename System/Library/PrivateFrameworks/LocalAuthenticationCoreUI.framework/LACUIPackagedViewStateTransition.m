@interface LACUIPackagedViewStateTransition
- (LACUIPackagedViewState)fromState;
- (LACUIPackagedViewState)toState;
- (LACUIPackagedViewStateTransition)initWithFromState:(id)a3 toState:(id)a4 completion:(id)a5;
- (void)complete:(BOOL)a3;
- (void)dealloc;
@end

@implementation LACUIPackagedViewStateTransition

- (LACUIPackagedViewStateTransition)initWithFromState:(id)a3 toState:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)LACUIPackagedViewStateTransition;
  v12 = [(LACUIPackagedViewStateTransition *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fromState, a3);
    objc_storeStrong((id *)&v13->_toState, a4);
    uint64_t v14 = [v11 copy];
    id handler = v13->_handler;
    v13->_id handler = (id)v14;
  }
  return v13;
}

- (void)dealloc
{
  [(LACUIPackagedViewStateTransition *)self complete:0];
  v3.receiver = self;
  v3.super_class = (Class)LACUIPackagedViewStateTransition;
  [(LACUIPackagedViewStateTransition *)&v3 dealloc];
}

- (void)complete:(BOOL)a3
{
  id handler = self->_handler;
  if (handler)
  {
    BOOL v5 = a3;
    v7 = (void (**)(id, BOOL))[handler copy];
    id v6 = self->_handler;
    self->_id handler = 0;

    v7[2](v7, v5);
  }
}

- (LACUIPackagedViewState)fromState
{
  return self->_fromState;
}

- (LACUIPackagedViewState)toState
{
  return self->_toState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toState, 0);
  objc_storeStrong((id *)&self->_fromState, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end