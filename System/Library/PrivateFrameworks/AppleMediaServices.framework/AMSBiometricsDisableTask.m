@interface AMSBiometricsDisableTask
- (ACAccount)account;
- (AMSBiometricsDisableTask)initWithAccount:(id)a3;
- (id)perform;
@end

@implementation AMSBiometricsDisableTask

- (AMSBiometricsDisableTask)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSBiometricsDisableTask;
  v6 = [(AMSTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)perform
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__AMSBiometricsDisableTask_perform__block_invoke;
  v4[3] = &unk_1E559EDC0;
  v4[4] = self;
  v2 = [(AMSTask *)self performBinaryTaskWithBlock:v4];
  return v2;
}

uint64_t __35__AMSBiometricsDisableTask_perform__block_invoke(uint64_t a1, void *a2)
{
  v3 = [*(id *)(a1 + 32) account];
  v4 = +[AMSBiometrics disableForAccount:v3];
  id v9 = 0;
  uint64_t v5 = [v4 resultWithError:&v9];
  id v6 = v9;

  id v7 = v6;
  *a2 = v7;
  return v5;
}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
}

@end