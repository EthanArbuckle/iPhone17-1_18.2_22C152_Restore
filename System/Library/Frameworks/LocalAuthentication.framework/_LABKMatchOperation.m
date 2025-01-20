@interface _LABKMatchOperation
- (BKMatchOperationDelegate)delegate;
- (void)matchOperation:(id)a3 failedWithReason:(int64_t)a4;
- (void)matchOperation:(id)a3 matchedWithResult:(id)a4;
- (void)matchOperation:(id)a3 presenceDetectedInLockout:(int64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation _LABKMatchOperation

- (BKMatchOperationDelegate)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)_LABKMatchOperation;
  v2 = [(_LABKOperation *)&v4 delegate];

  return (BKMatchOperationDelegate *)v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = NSStringFromSelector(sel_biometricMethodResult);
  int v14 = [v10 isEqualToString:v13];

  if (v14)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70___LABKMatchOperation_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v16[3] = &unk_1E63C5618;
    v16[4] = self;
    [(_LABKOperation *)self dispatchDelegateSelector:sel_matchOperation_matchedWithResult_ block:v16];
  }
  v15.receiver = self;
  v15.super_class = (Class)_LABKMatchOperation;
  [(_LABKOperation *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
}

- (void)matchOperation:(id)a3 matchedWithResult:(id)a4
{
  id v10 = a4;
  id v7 = a3;
  +[_LABKLog logClass:objc_opt_class(), a2, @"%@,%@", v7, v10 selector message];

  v8 = [(_LABKMatchOperation *)self delegate];
  LOBYTE(a2) = objc_opt_respondsToSelector();

  if (a2)
  {
    v9 = [(_LABKMatchOperation *)self delegate];
    [v9 matchOperation:self matchedWithResult:v10];
  }
}

- (void)matchOperation:(id)a3 presenceDetectedInLockout:(int64_t)a4
{
  id v7 = a3;
  +[_LABKLog logClass:objc_opt_class(), a2, @"%@,%d", v7, a4 selector message];

  v8 = [(_LABKMatchOperation *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(_LABKMatchOperation *)self delegate];
    [v10 matchOperation:self presenceDetectedInLockout:a4];
  }
}

- (void)matchOperation:(id)a3 failedWithReason:(int64_t)a4
{
  id v7 = a3;
  +[_LABKLog logClass:objc_opt_class(), a2, @"%@,%d", v7, a4 selector message];

  v8 = [(_LABKMatchOperation *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(_LABKMatchOperation *)self delegate];
    [v10 matchOperation:self failedWithReason:a4];
  }
}

@end