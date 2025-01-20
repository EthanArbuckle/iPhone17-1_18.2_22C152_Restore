@interface AMSMutableLazyPromise
- (AMSMutableLazyPromise)initWithBlock:(id)a3;
- (AMSMutableLazyPromise)initWithTimeout:(double)a3 block:(id)a4;
- (BOOL)cancel;
- (BOOL)finishWithError:(id)a3;
- (BOOL)finishWithPromise:(id)a3;
- (BOOL)finishWithResult:(id)a3;
- (BOOL)finishWithResult:(id)a3 error:(id)a4;
@end

@implementation AMSMutableLazyPromise

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  return +[AMSMutablePromise finishPromise:self withResult:a3 error:a4];
}

- (BOOL)finishWithResult:(id)a3
{
  return [(AMSMutableLazyPromise *)self finishWithResult:a3 error:0];
}

- (BOOL)finishWithPromise:(id)a3
{
  return +[AMSMutablePromise finishPromise:self withPromise:a3];
}

- (AMSMutableLazyPromise)initWithBlock:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMSMutableLazyPromise;
  return [(AMSLazyPromise *)&v4 initWithBlock:a3];
}

- (AMSMutableLazyPromise)initWithTimeout:(double)a3 block:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AMSMutableLazyPromise;
  return [(AMSLazyPromise *)&v5 initWithTimeout:a4 block:a3];
}

- (BOOL)cancel
{
  return +[AMSMutablePromise cancelPromise:self];
}

- (BOOL)finishWithError:(id)a3
{
  return [(AMSMutableLazyPromise *)self finishWithResult:0 error:a3];
}

@end