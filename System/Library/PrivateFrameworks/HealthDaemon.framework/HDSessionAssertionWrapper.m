@interface HDSessionAssertionWrapper
- (BOOL)taken;
- (HDSessionAssertionWrapper)initWithCreateAndTakeBlock:(id)a3;
- (id)createAndTakeBlock;
- (void)dealloc;
@end

@implementation HDSessionAssertionWrapper

- (HDSessionAssertionWrapper)initWithCreateAndTakeBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSessionAssertionWrapper;
  v5 = [(HDSessionAssertionWrapper *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id createAndTakeBlock = v5->_createAndTakeBlock;
    v5->_id createAndTakeBlock = v6;
  }
  return v5;
}

- (void)dealloc
{
  [(HDAssertion *)self->_currentAssertion invalidate];
  currentAssertion = self->_currentAssertion;
  self->_currentAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)HDSessionAssertionWrapper;
  [(HDSessionAssertionWrapper *)&v4 dealloc];
}

- (BOOL)taken
{
  return [(HDAssertion *)self->_currentAssertion state] == 2;
}

- (id)createAndTakeBlock
{
  return self->_createAndTakeBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_createAndTakeBlock, 0);

  objc_storeStrong((id *)&self->_currentAssertion, 0);
}

@end