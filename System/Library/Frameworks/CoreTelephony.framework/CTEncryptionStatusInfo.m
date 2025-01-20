@interface CTEncryptionStatusInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTEncryptionStatusInfo)initWithCoder:(id)a3;
- (CTEncryptionStatusInfo)initWithStatus:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation CTEncryptionStatusInfo

- (CTEncryptionStatusInfo)initWithStatus:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CTEncryptionStatusInfo;
  result = [(CTEncryptionStatusInfo *)&v5 init];
  if (result) {
    result->_status = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTEncryptionStatusInfo *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(CTEncryptionStatusInfo *)v4 status];
      BOOL v6 = v5 == [(CTEncryptionStatusInfo *)self status];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStatus:", -[CTEncryptionStatusInfo status](self, "status"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTEncryptionStatusInfo status](self, "status"), @"status");
}

- (CTEncryptionStatusInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTEncryptionStatusInfo;
  uint64_t v5 = [(CTEncryptionStatusInfo *)&v7 init];
  if (v5) {
    v5->_status = [v4 decodeIntegerForKey:@"status"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

@end