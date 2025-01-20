@interface TSSubscriptionPUKUnlockAction
- (NSString)pin1;
- (NSString)puk;
- (id)copyByApplyingPIN1:(id)a3;
- (id)copyByApplyingPUK:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)actionSubtype;
- (int64_t)actionType;
@end

@implementation TSSubscriptionPUKUnlockAction

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TSSubscriptionPUKUnlockAction;
  v5 = -[TSSubscriptionAction copyWithZone:](&v11, "copyWithZone:");
  id v6 = [(NSString *)self->_puk copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSString *)self->_pin1 copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  return v5;
}

- (id)copyByApplyingPUK:(id)a3
{
  id v4 = a3;
  v5 = [(TSSubscriptionPUKUnlockAction *)self copy];
  id v6 = [v4 copy];

  v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

- (id)copyByApplyingPIN1:(id)a3
{
  id v4 = a3;
  v5 = [(TSSubscriptionPUKUnlockAction *)self copy];
  id v6 = [v4 copy];

  v7 = (void *)v5[4];
  v5[4] = v6;

  return v5;
}

- (int64_t)actionType
{
  return 3;
}

- (int64_t)actionSubtype
{
  v3 = [(TSSubscriptionPUKUnlockAction *)self pin1];
  id v4 = [v3 length];

  if (v4) {
    return 3;
  }
  id v6 = [(TSSubscriptionPUKUnlockAction *)self puk];
  id v7 = [v6 length];

  if (v7) {
    return 2;
  }
  else {
    return 1;
  }
}

- (NSString)puk
{
  return self->_puk;
}

- (NSString)pin1
{
  return self->_pin1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pin1, 0);

  objc_storeStrong((id *)&self->_puk, 0);
}

@end