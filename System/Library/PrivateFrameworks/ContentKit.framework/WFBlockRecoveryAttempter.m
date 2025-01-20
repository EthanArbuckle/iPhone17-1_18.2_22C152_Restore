@interface WFBlockRecoveryAttempter
- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4;
- (WFBlockRecoveryAttempter)initWithHandlerBlock:(id)a3;
- (id)handlerBlock;
- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 userInterface:(id)a5 completionHandler:(id)a6;
- (void)setHandlerBlock:(id)a3;
@end

@implementation WFBlockRecoveryAttempter

- (void).cxx_destruct
{
}

- (void)setHandlerBlock:(id)a3
{
}

- (id)handlerBlock
{
  return self->_handlerBlock;
}

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  return 1;
}

- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 userInterface:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = [(WFBlockRecoveryAttempter *)self handlerBlock];
  v13[2](v13, v12, a4, v11, v10);
}

- (WFBlockRecoveryAttempter)initWithHandlerBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFBlockRecoveryAttempter;
  v5 = [(WFBlockRecoveryAttempter *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id handlerBlock = v5->_handlerBlock;
    v5->_id handlerBlock = (id)v6;

    v8 = v5;
  }

  return v5;
}

@end