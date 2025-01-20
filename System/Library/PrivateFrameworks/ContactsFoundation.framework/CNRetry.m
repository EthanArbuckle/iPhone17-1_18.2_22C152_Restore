@interface CNRetry
- (CNRetry)init;
- (CNRetry)initWithDelegate:(id)a3;
- (CNRetryDelegate)delegate;
- (id)performAndWait:(id)a3;
@end

@implementation CNRetry

- (CNRetry)init
{
  return [(CNRetry *)self initWithDelegate:0];
}

- (CNRetry)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNRetry;
  v5 = [(CNRetry *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (id)performAndWait:(id)a3
{
  id v4 = (void (**)(void))a3;
  v5 = [(CNRetry *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(CNRetry *)self delegate];
    uint64_t v8 = [v7 maximumNumberOfAttemptsForRetry:self];

    uint64_t v47 = v8;
    if (v8 < 1)
    {
LABEL_3:
      objc_super v9 = +[CNFoundationError errorWithCode:12 userInfo:0];
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v47 = 3;
  }
  objc_super v9 = 0;
  uint64_t v11 = 1;
  do
  {
    v12 = [(CNRetry *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      v14 = [(CNRetry *)self delegate];
      [v14 retry:self willBeginAttempt:v11];
    }
    char v15 = 1;
    v10 = v4[2](v4);
    if ([v10 isSuccess])
    {
      v16 = [(CNRetry *)self delegate];
      char v17 = objc_opt_respondsToSelector();

      if (v17)
      {
        v18 = [(CNRetry *)self delegate];
        v19 = [v10 value];
        [v18 retry:self didSucceedWithResult:v19];
      }
      goto LABEL_28;
    }
    v20 = [v10 error];
    uint64_t v21 = +[CNFoundationError errorWithCode:12 underlyingError:v20];

    v22 = [(CNRetry *)self delegate];
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      v24 = [(CNRetry *)self delegate];
      v25 = [v10 error];
      char v26 = [v24 retry:self shouldContinueAfterError:v25 onAttempt:v11];

      char v15 = v26;
    }
    v27 = [(CNRetry *)self delegate];
    char v28 = objc_opt_respondsToSelector();

    double v29 = 0.0;
    if (v28)
    {
      v30 = [(CNRetry *)self delegate];
      v31 = [v10 error];
      [v30 retry:self delayAfterError:v31 onAttempt:v11];
      double v29 = v32;
    }
    objc_super v9 = (void *)v21;
    if (v29 != 0.0)
    {
      v33 = [(CNRetry *)self delegate];
      char v34 = objc_opt_respondsToSelector();

      if (v34)
      {
        v35 = [(CNRetry *)self delegate];
        [v35 retry:self willDelayFor:v11 afterAttempt:v29];
      }
      v36 = +[CNEnvironmentBase currentEnvironment];
      uint64_t v37 = [v36 schedulerProvider];
      v38 = [(id)v37 immediateScheduler];
      id v39 = (id)[v38 afterDelay:&__block_literal_global_21 performBlock:v29];

      v40 = [(CNRetry *)self delegate];
      LOBYTE(v37) = objc_opt_respondsToSelector();

      if (v37)
      {
        v41 = [(CNRetry *)self delegate];
        [v41 retry:self didDelayFor:v11 afterAttempt:v29];
      }
    }
    v42 = [(CNRetry *)self delegate];
    char v43 = objc_opt_respondsToSelector();

    if (v43)
    {
      v44 = [(CNRetry *)self delegate];
      [v44 retry:self didCompleteAttempt:v11];
    }
    if (v11 < v47) {
      char v45 = v15;
    }
    else {
      char v45 = 0;
    }
    ++v11;
  }
  while ((v45 & 1) != 0);
  if (!v9) {
    goto LABEL_3;
  }
LABEL_4:
  v10 = +[CNResult failureWithError:v9];
LABEL_28:

  return v10;
}

- (CNRetryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNRetryDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end