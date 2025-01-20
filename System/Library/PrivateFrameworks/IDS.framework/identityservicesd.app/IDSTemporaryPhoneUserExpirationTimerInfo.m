@interface IDSTemporaryPhoneUserExpirationTimerInfo
+ (int64_t)phaseForExpirationDate:(id)a3;
- (IDSTemporaryPhoneUser)user;
- (IDSTemporaryPhoneUserExpirationTimerInfo)initWithUser:(id)a3;
- (IDSTemporaryPhoneUserExpirationTimerInfo)initWithUser:(id)a3 expirationPhase:(int64_t)a4;
- (double)expirationInterval;
- (int64_t)expirationPhase;
@end

@implementation IDSTemporaryPhoneUserExpirationTimerInfo

- (IDSTemporaryPhoneUserExpirationTimerInfo)initWithUser:(id)a3
{
  id v4 = a3;
  v5 = [v4 expirationDate];
  v6 = [(IDSTemporaryPhoneUserExpirationTimerInfo *)self initWithUser:v4 expirationPhase:+[IDSTemporaryPhoneUserExpirationTimerInfo phaseForExpirationDate:v5]];

  return v6;
}

- (IDSTemporaryPhoneUserExpirationTimerInfo)initWithUser:(id)a3 expirationPhase:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSTemporaryPhoneUserExpirationTimerInfo;
  v8 = [(IDSTemporaryPhoneUserExpirationTimerInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_user, a3);
    v9->_expirationPhase = a4;
  }

  return v9;
}

- (double)expirationInterval
{
  if ([(IDSTemporaryPhoneUserExpirationTimerInfo *)self expirationPhase])
  {
    v3 = [(IDSTemporaryPhoneUserExpirationTimerInfo *)self user];
    id v4 = [v3 expirationDate];
    [v4 timeIntervalSinceNow];
    double v6 = v7;
  }
  else
  {
    v3 = [(IDSTemporaryPhoneUserExpirationTimerInfo *)self user];
    id v4 = [v3 expirationDate];
    [v4 timeIntervalSinceNow];
    double v6 = v5 + -432000.0;
  }

  return v6;
}

+ (int64_t)phaseForExpirationDate:(id)a3
{
  [a3 timeIntervalSinceNow];
  return v3 <= 432000.0;
}

- (IDSTemporaryPhoneUser)user
{
  return (IDSTemporaryPhoneUser *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)expirationPhase
{
  return self->_expirationPhase;
}

- (void).cxx_destruct
{
}

@end