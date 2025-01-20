@interface CTPlanTransferAttributes
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSecuredFlow;
- (CTPlanTransferAttributes)init;
- (CTPlanTransferAttributes)initWithCoder:(id)a3;
- (CTPlanTransferAttributes)initWithTransferCapability:(unint64_t)a3 transferStatus:(unint64_t)a4 isSecuredFlow:(BOOL)a5 transferEndpoint:(id)a6;
- (NSString)transferEndpoint;
- (id)description;
- (unint64_t)transferCapability;
- (unint64_t)transferStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setIsSecuredFlow:(BOOL)a3;
- (void)setTransferCapability:(unint64_t)a3;
- (void)setTransferEndpoint:(id)a3;
- (void)setTransferStatus:(unint64_t)a3;
@end

@implementation CTPlanTransferAttributes

- (CTPlanTransferAttributes)init
{
  v3.receiver = self;
  v3.super_class = (Class)CTPlanTransferAttributes;
  result = [(CTPlanTransferAttributes *)&v3 init];
  if (result)
  {
    result->_isSecuredFlow = 0;
    result->_transferCapability = 0;
    result->_transferStatus = 0;
  }
  return result;
}

- (CTPlanTransferAttributes)initWithTransferCapability:(unint64_t)a3 transferStatus:(unint64_t)a4 isSecuredFlow:(BOOL)a5 transferEndpoint:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CTPlanTransferAttributes;
  v11 = [(CTPlanTransferAttributes *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_transferCapability = a3;
    v11->_transferStatus = a4;
    v11->_isSecuredFlow = a5;
    uint64_t v13 = [v10 copy];
    transferEndpoint = v12->_transferEndpoint;
    v12->_transferEndpoint = (NSString *)v13;
  }
  return v12;
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" transferCapability=%s", CTPlanTransferCapabilityAsString(-[CTPlanTransferAttributes transferCapability](self, "transferCapability")));
  objc_msgSend(v3, "appendFormat:", @" transferStatus=%s", CTPlanTransferStatusAsString(-[CTPlanTransferAttributes transferStatus](self, "transferStatus")));
  objc_msgSend(v3, "appendFormat:", @" isSecuredFlow=%d", self->_isSecuredFlow);
  [v3 appendFormat:@" transferEndpoint=%@", self->_transferEndpoint];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTPlanTransferAttributes *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (unint64_t v5 = [(CTPlanTransferAttributes *)self transferCapability],
          v5 == [(CTPlanTransferAttributes *)v4 transferCapability])
      && (unint64_t v6 = [(CTPlanTransferAttributes *)self transferStatus],
          v6 == [(CTPlanTransferAttributes *)v4 transferStatus])
      && (BOOL v7 = [(CTPlanTransferAttributes *)self isSecuredFlow],
          v7 == [(CTPlanTransferAttributes *)v4 isSecuredFlow]))
    {
      id v10 = [(CTPlanTransferAttributes *)self transferEndpoint];
      v11 = [(CTPlanTransferAttributes *)v4 transferEndpoint];
      if (v10 == v11)
      {
        char v8 = 1;
      }
      else
      {
        v12 = [(CTPlanTransferAttributes *)self transferEndpoint];
        uint64_t v13 = [(CTPlanTransferAttributes *)v4 transferEndpoint];
        char v8 = [v12 isEqualToString:v13];
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTPlanTransferAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTPlanTransferAttributes;
  unint64_t v5 = [(CTPlanTransferAttributes *)&v9 init];
  if (v5)
  {
    v5->_transferCapability = [v4 decodeIntegerForKey:@"transferCapability"];
    v5->_transferStatus = [v4 decodeIntegerForKey:@"transferStatus"];
    v5->_isSecuredFlow = [v4 decodeBoolForKey:@"isSecuredFlow"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferEndpoint"];
    transferEndpoint = v5->_transferEndpoint;
    v5->_transferEndpoint = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t transferCapability = self->_transferCapability;
  id v5 = a3;
  [v5 encodeInteger:transferCapability forKey:@"transferCapability"];
  [v5 encodeInteger:self->_transferStatus forKey:@"transferStatus"];
  [v5 encodeBool:self->_isSecuredFlow forKey:@"isSecuredFlow"];
  [v5 encodeObject:self->_transferEndpoint forKey:@"transferEndpoint"];
}

- (unint64_t)transferCapability
{
  return self->_transferCapability;
}

- (void)setTransferCapability:(unint64_t)a3
{
  self->_unint64_t transferCapability = a3;
}

- (unint64_t)transferStatus
{
  return self->_transferStatus;
}

- (void)setTransferStatus:(unint64_t)a3
{
  self->_transferStatus = a3;
}

- (BOOL)isSecuredFlow
{
  return self->_isSecuredFlow;
}

- (void)setIsSecuredFlow:(BOOL)a3
{
  self->_isSecuredFlow = a3;
}

- (NSString)transferEndpoint
{
  return self->_transferEndpoint;
}

- (void)setTransferEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end