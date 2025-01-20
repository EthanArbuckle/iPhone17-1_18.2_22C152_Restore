@interface CSLPRFIconFetchTask
- (CSLPRFIconFetchTask)init;
- (id)completion;
- (void)completeWithImage:(id)a3 error:(id)a4;
- (void)invalidate;
- (void)setCompletion:(id)a3;
@end

@implementation CSLPRFIconFetchTask

- (void).cxx_destruct
{
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)invalidate
{
  id v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3072 userInfo:0];
  [(CSLPRFIconFetchTask *)self completeWithImage:0 error:v3];
}

- (void)completeWithImage:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  v7 = [(CSLPRFIconFetchTask *)self completion];
  [(CSLPRFIconFetchTask *)self setCompletion:0];
  os_unfair_lock_unlock(&self->_lock);
  if (v7) {
    ((void (**)(void, id, id))v7)[2](v7, v8, v6);
  }
}

- (CSLPRFIconFetchTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSLPRFIconFetchTask;
  result = [(CSLPRFIconFetchTask *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

@end