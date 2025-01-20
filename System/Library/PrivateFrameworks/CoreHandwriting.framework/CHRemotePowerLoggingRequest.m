@interface CHRemotePowerLoggingRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHRemotePowerLoggingRequest)initWithCoder:(id)a3;
- (CHRemotePowerLoggingRequest)initWithModel:(unint64_t)a3;
- (unint64_t)modelIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setModelIdentifier:(unint64_t)a3;
@end

@implementation CHRemotePowerLoggingRequest

- (CHRemotePowerLoggingRequest)initWithModel:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHRemotePowerLoggingRequest;
  result = [(CHRemotePowerLoggingRequest *)&v5 init];
  if (result) {
    result->_modelIdentifier = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHRemotePowerLoggingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHRemotePowerLoggingRequest;
  v9 = [(CHRemotePowerLoggingRequest *)&v11 init];
  if (v9) {
    v9->_modelIdentifier = (int)objc_msgSend_decodeIntForKey_(v4, v5, @"model", v6, v7, v8);
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  uint64_t v8 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v4, self->_modelIdentifier, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v12, v9, (uint64_t)v8, @"model", v10, v11);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (CHRemotePowerLoggingRequest *)v4;
    uint64_t v11 = v5;
    if (self)
    {
      if (self == v5)
      {
        LOBYTE(self) = 1;
      }
      else
      {
        self = (CHRemotePowerLoggingRequest *)self->_modelIdentifier;
        LOBYTE(self) = self == (CHRemotePowerLoggingRequest *)objc_msgSend_modelIdentifier(v5, v6, v7, v8, v9, v10);
      }
    }

    return (char)self;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)modelIdentifier
{
  return self->_modelIdentifier;
}

- (void)setModelIdentifier:(unint64_t)a3
{
  self->_modelIdentifier = a3;
}

@end