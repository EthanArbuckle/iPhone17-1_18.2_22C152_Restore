@interface APSCourierUserTokenStorage
- (APSCourierUserTokenStorage)initWithUser:(id)a3;
- (APSUser)user;
- (id)tokenForEnvironment:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation APSCourierUserTokenStorage

- (APSCourierUserTokenStorage)initWithUser:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APSCourierUserTokenStorage;
  v6 = [(APSCourierUserTokenStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_user, a3);
  }

  return v7;
}

- (id)tokenForEnvironment:(id)a3
{
  return 0;
}

- (APSUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
}

- (void).cxx_destruct
{
}

@end