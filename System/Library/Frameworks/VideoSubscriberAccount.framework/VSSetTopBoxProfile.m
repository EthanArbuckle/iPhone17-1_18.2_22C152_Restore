@interface VSSetTopBoxProfile
- (BOOL)isDeveloper;
- (NSDate)activationTime;
- (NSString)providerID;
- (NSString)userToken;
- (VSSetTopBoxProfile)initWithProviderID:(id)a3 userToken:(id)a4 activationTime:(id)a5 isDeveloper:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setActivationTime:(id)a3;
- (void)setIsDeveloper:(BOOL)a3;
- (void)setProviderID:(id)a3;
- (void)setUserToken:(id)a3;
@end

@implementation VSSetTopBoxProfile

- (VSSetTopBoxProfile)initWithProviderID:(id)a3 userToken:(id)a4 activationTime:(id)a5 isDeveloper:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VSSetTopBoxProfile;
  v14 = [(VSSetTopBoxProfile *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_providerID, a3);
    objc_storeStrong((id *)&v15->_userToken, a4);
    objc_storeStrong((id *)&v15->_activationTime, a5);
    v15->_isDeveloper = a6;
  }

  return v15;
}

- (id)description
{
  v3 = NSString;
  v4 = [(VSSetTopBoxProfile *)self providerID];
  v5 = [(VSSetTopBoxProfile *)self userToken];
  v6 = [(VSSetTopBoxProfile *)self activationTime];
  objc_msgSend(v3, "stringWithFormat:", @"<VSSetTopBoxProfile %p; providerID=%@, userToken=%@, activationTime=%@ isDeveloper=%lu>",
    self,
    v4,
    v5,
    v6,
  v7 = [(VSSetTopBoxProfile *)self isDeveloper]);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(VSSetTopBoxProfile);
  v5 = [(VSSetTopBoxProfile *)self providerID];
  uint64_t v6 = [v5 copy];
  providerID = v4->_providerID;
  v4->_providerID = (NSString *)v6;

  v8 = [(VSSetTopBoxProfile *)self userToken];
  uint64_t v9 = [v8 copy];
  userToken = v4->_userToken;
  v4->_userToken = (NSString *)v9;

  id v11 = [(VSSetTopBoxProfile *)self activationTime];
  uint64_t v12 = [v11 copy];
  activationTime = v4->_activationTime;
  v4->_activationTime = (NSDate *)v12;

  v4->_isDeveloper = [(VSSetTopBoxProfile *)self isDeveloper];
  return v4;
}

- (NSString)providerID
{
  return self->_providerID;
}

- (void)setProviderID:(id)a3
{
}

- (NSString)userToken
{
  return self->_userToken;
}

- (void)setUserToken:(id)a3
{
}

- (NSDate)activationTime
{
  return self->_activationTime;
}

- (void)setActivationTime:(id)a3
{
}

- (BOOL)isDeveloper
{
  return self->_isDeveloper;
}

- (void)setIsDeveloper:(BOOL)a3
{
  self->_isDeveloper = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationTime, 0);
  objc_storeStrong((id *)&self->_userToken, 0);

  objc_storeStrong((id *)&self->_providerID, 0);
}

@end