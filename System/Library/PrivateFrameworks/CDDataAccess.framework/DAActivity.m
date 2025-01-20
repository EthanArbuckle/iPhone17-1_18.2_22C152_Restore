@interface DAActivity
- (DAActivity)initWithAccount:(id)a3;
- (void)dealloc;
@end

@implementation DAActivity

- (void)dealloc
{
  [(DAAccount *)self->_account decrementXpcActivityContinueCount];
  v3.receiver = self;
  v3.super_class = (Class)DAActivity;
  [(DAActivity *)&v3 dealloc];
}

- (DAActivity)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DAActivity;
  v6 = [(DAActivity *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    [(DAAccount *)v7->_account incrementXpcActivityContinueCount];
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end