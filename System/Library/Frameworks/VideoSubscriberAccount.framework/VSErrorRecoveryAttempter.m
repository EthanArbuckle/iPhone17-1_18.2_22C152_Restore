@interface VSErrorRecoveryAttempter
- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4;
- (NSArray)options;
- (NSOperationQueue)recoveryAttemptingQueue;
- (VSErrorRecoveryAttempter)init;
- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 delegate:(id)a5 didRecoverSelector:(SEL)a6 contextInfo:(void *)a7;
- (void)setOptions:(id)a3;
- (void)setRecoveryAttemptingQueue:(id)a3;
@end

@implementation VSErrorRecoveryAttempter

- (VSErrorRecoveryAttempter)init
{
  v8.receiver = self;
  v8.super_class = (Class)VSErrorRecoveryAttempter;
  v2 = [(VSErrorRecoveryAttempter *)&v8 init];
  v3 = v2;
  if (v2)
  {
    options = v2->_options;
    v2->_options = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v5 = [MEMORY[0x1E4F28F08] mainQueue];
    recoveryAttemptingQueue = v3->_recoveryAttemptingQueue;
    v3->_recoveryAttemptingQueue = (NSOperationQueue *)v5;
  }
  return v3;
}

- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 delegate:(id)a5 didRecoverSelector:(SEL)a6 contextInfo:(void *)a7
{
  id v12 = a3;
  id v13 = a5;
  v14 = [(VSErrorRecoveryAttempter *)self recoveryAttemptingQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __105__VSErrorRecoveryAttempter_attemptRecoveryFromError_optionIndex_delegate_didRecoverSelector_contextInfo___block_invoke;
  v17[3] = &unk_1E6BD4220;
  v17[4] = self;
  id v18 = v12;
  id v19 = v13;
  unint64_t v20 = a4;
  SEL v21 = a6;
  v22 = a7;
  id v15 = v13;
  id v16 = v12;
  [v14 addOperationWithBlock:v17];
}

id __105__VSErrorRecoveryAttempter_attemptRecoveryFromError_optionIndex_delegate_didRecoverSelector_contextInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) attemptRecoveryFromError:*(void *)(a1 + 40) optionIndex:*(void *)(a1 + 56)];
  id result = *(id *)(a1 + 48);
  if (result)
  {
    v4 = *(const char **)(a1 + 64);
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 72);
      return objc_msgSend(result, v4, v2, v5);
    }
  }
  return result;
}

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(VSErrorRecoveryAttempter *)self options];
  objc_super v8 = [v7 objectAtIndex:a4];

  uint64_t v9 = [v8 attemptHandler];
  v10 = (void *)v9;
  if (v9) {
    char v11 = (*(uint64_t (**)(uint64_t, id))(v9 + 16))(v9, v6);
  }
  else {
    char v11 = 1;
  }

  return v11;
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSOperationQueue)recoveryAttemptingQueue
{
  return self->_recoveryAttemptingQueue;
}

- (void)setRecoveryAttemptingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryAttemptingQueue, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end