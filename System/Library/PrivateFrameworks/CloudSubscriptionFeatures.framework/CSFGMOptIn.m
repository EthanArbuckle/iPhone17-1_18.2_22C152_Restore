@interface CSFGMOptIn
- (BOOL)isOptedIn;
- (CSFGMOptIn)init;
- (CSFGMOptIn)initWithOptInProvider:(id)a3;
- (_TtP25CloudSubscriptionFeatures15GMOptInProtocol_)gmOptIn;
- (void)setGmOptIn:(id)a3;
- (void)setIsOptedIn:(BOOL)a3;
@end

@implementation CSFGMOptIn

- (CSFGMOptIn)init
{
  v3 = +[GMOptIn shared];
  v4 = [(CSFGMOptIn *)self initWithOptInProvider:v3];

  return v4;
}

- (CSFGMOptIn)initWithOptInProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSFGMOptIn;
  v5 = [(CSFGMOptIn *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CSFGMOptIn *)v5 setGmOptIn:v4];
  }

  return v6;
}

- (BOOL)isOptedIn
{
  v2 = [(CSFGMOptIn *)self gmOptIn];
  char v3 = [v2 isOptedIn];

  return v3;
}

- (void)setIsOptedIn:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CSFGMOptIn *)self gmOptIn];
  [v4 setIsOptedIn:v3];
}

- (_TtP25CloudSubscriptionFeatures15GMOptInProtocol_)gmOptIn
{
  return self->_gmOptIn;
}

- (void)setGmOptIn:(id)a3
{
}

- (void).cxx_destruct
{
}

@end