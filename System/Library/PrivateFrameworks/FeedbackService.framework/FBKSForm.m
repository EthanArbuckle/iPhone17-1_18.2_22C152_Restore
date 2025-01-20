@interface FBKSForm
- (FBKSForm)initWithIdentifier:(id)a3;
- (FBKSForm_FrameworkPrivateName)swiftObject;
- (NSString)identifier;
- (int64_t)authenticationMethod;
- (void)prefill:(id)a3 answer:(id)a4;
- (void)setAuthenticationMethod:(int64_t)a3;
- (void)setSwiftObject:(id)a3;
@end

@implementation FBKSForm

- (FBKSForm)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBKSForm;
  v5 = [(FBKSForm *)&v9 init];
  if (v5)
  {
    v6 = [[FBKSForm_FrameworkPrivateName alloc] initWithIdentifier:v4];
    swiftObject = v5->_swiftObject;
    v5->_swiftObject = v6;
  }
  return v5;
}

- (NSString)identifier
{
  v2 = [(FBKSForm *)self swiftObject];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (void)setAuthenticationMethod:(int64_t)a3
{
  v5 = [(FBKSForm *)self swiftObject];
  [v5 setAuthenticationMethod:a3];

  self->_authenticationMethod = a3;
}

- (void)prefill:(id)a3 answer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FBKSForm *)self swiftObject];
  [v8 prefillWithQuestion:v7 answer:v6];
}

- (int64_t)authenticationMethod
{
  return self->_authenticationMethod;
}

- (FBKSForm_FrameworkPrivateName)swiftObject
{
  return self->_swiftObject;
}

- (void)setSwiftObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end