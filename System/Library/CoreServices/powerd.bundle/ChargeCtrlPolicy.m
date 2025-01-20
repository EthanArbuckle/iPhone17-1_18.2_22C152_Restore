@interface ChargeCtrlPolicy
- (BOOL)drain;
- (BOOL)noChargeToFull;
- (BOOL)terminated;
- (ChargeCtrlPolicy)initWithCoder:(id)a3;
- (ChargeCtrlPolicy)initWithSocLimit:(unint64_t)a3 andDrain:(BOOL)a4 andNoChargeToFull:(BOOL)a5 andOwner:(unint64_t)a6;
- (NSString)reason;
- (NSUUID)token;
- (id)description;
- (unint64_t)owner;
- (unint64_t)socLimit;
- (void)encodeWithCoder:(id)a3;
- (void)setDrain:(BOOL)a3;
- (void)setNoChargeToFull:(BOOL)a3;
- (void)setOwner:(unint64_t)a3;
- (void)setReason:(id)a3;
- (void)setSocLimit:(unint64_t)a3;
- (void)setTerminated:(BOOL)a3;
@end

@implementation ChargeCtrlPolicy

- (ChargeCtrlPolicy)initWithSocLimit:(unint64_t)a3 andDrain:(BOOL)a4 andNoChargeToFull:(BOOL)a5 andOwner:(unint64_t)a6
{
  v16.receiver = self;
  v16.super_class = (Class)ChargeCtrlPolicy;
  v10 = [(ChargeCtrlPolicy *)&v16 init];
  v11 = v10;
  if (v10)
  {
    v10->_drain = a4;
    v10->_noChargeToFull = a5;
    v10->_socLimit = a3;
    v10->_owner = a6;
    v10->_terminated = 0;
    uint64_t v12 = +[NSUUID UUID];
    token = v11->_token;
    v11->_token = (NSUUID *)v12;

    v14 = v11;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[ChargeCtrlPolicy terminated](self, "terminated"), @"terminated");
  objc_msgSend(v4, "encodeBool:forKey:", -[ChargeCtrlPolicy drain](self, "drain"), @"drain");
  objc_msgSend(v4, "encodeBool:forKey:", -[ChargeCtrlPolicy noChargeToFull](self, "noChargeToFull"), @"noChargeToFull");
  objc_msgSend(v4, "encodeInt64:forKey:", -[ChargeCtrlPolicy socLimit](self, "socLimit"), @"soclimit");
  objc_msgSend(v4, "encodeInt64:forKey:", -[ChargeCtrlPolicy owner](self, "owner"), @"owner");
  v5 = [(ChargeCtrlPolicy *)self reason];
  [v4 encodeObject:v5 forKey:@"reason"];

  id v6 = [(ChargeCtrlPolicy *)self token];
  [v4 encodeObject:v6 forKey:@"token"];
}

- (ChargeCtrlPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ChargeCtrlPolicy;
  v5 = [(ChargeCtrlPolicy *)&v12 init];
  if (v5)
  {
    v5->_terminated = [v4 decodeBoolForKey:@"terminated"];
    v5->_drain = [v4 decodeBoolForKey:@"drain"];
    v5->_noChargeToFull = [v4 decodeBoolForKey:@"noChargeToFull"];
    v5->_socLimit = (unint64_t)[v4 decodeInt64ForKey:@"soclimit"];
    v5->_owner = (unint64_t)[v4 decodeInt64ForKey:@"owner"];
    uint64_t v6 = [v4 decodeObjectForKey:@"reason"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"token"];
    token = v5->_token;
    v5->_token = (NSUUID *)v8;

    v10 = v5;
  }

  return v5;
}

- (id)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"{\n    Owner: %lu\n    SocLimit: %lu\n    Drain: %u\n    NoChargeToFull: %u\n    Terminated: %u\n    Reason: %@\n}\n", self->_owner, self->_socLimit, self->_drain, self->_noChargeToFull, self->_terminated, self->_reason];

  return v2;
}

- (BOOL)terminated
{
  return self->_terminated;
}

- (void)setTerminated:(BOOL)a3
{
  self->_terminated = a3;
}

- (BOOL)drain
{
  return self->_drain;
}

- (void)setDrain:(BOOL)a3
{
  self->_drain = a3;
}

- (BOOL)noChargeToFull
{
  return self->_noChargeToFull;
}

- (void)setNoChargeToFull:(BOOL)a3
{
  self->_noChargeToFull = a3;
}

- (unint64_t)socLimit
{
  return self->_socLimit;
}

- (void)setSocLimit:(unint64_t)a3
{
  self->_socLimit = a3;
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReason:(id)a3
{
}

- (unint64_t)owner
{
  return self->_owner;
}

- (void)setOwner:(unint64_t)a3
{
  self->_owner = a3;
}

- (NSUUID)token
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_reason, 0);
}

@end