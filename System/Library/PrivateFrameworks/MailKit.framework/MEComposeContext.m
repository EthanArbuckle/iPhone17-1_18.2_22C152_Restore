@interface MEComposeContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEncrypted;
- (BOOL)isSigned;
- (BOOL)shouldEncrypt;
- (BOOL)shouldSign;
- (MEComposeContext)initWithAction:(int64_t)a3 originalMessage:(id)a4 shouldSign:(BOOL)a5 isSigned:(BOOL)a6 shouldEncrypt:(BOOL)a7 isEncrypted:(BOOL)a8;
- (MEComposeContext)initWithCoder:(id)a3;
- (MEComposeUserAction)action;
- (MEMessage)originalMessage;
- (NSUUID)contextID;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setContextID:(id)a3;
- (void)setIsEncrypted:(BOOL)a3;
- (void)setIsSigned:(BOOL)a3;
- (void)setOriginalMessage:(id)a3;
- (void)setShouldEncrypt:(BOOL)a3;
- (void)setShouldSign:(BOOL)a3;
@end

@implementation MEComposeContext

- (MEComposeContext)initWithAction:(int64_t)a3 originalMessage:(id)a4 shouldSign:(BOOL)a5 isSigned:(BOOL)a6 shouldEncrypt:(BOOL)a7 isEncrypted:(BOOL)a8
{
  id v15 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MEComposeContext;
  v16 = [(MEComposeContext *)&v20 init];
  if (v16)
  {
    uint64_t v17 = [MEMORY[0x263F08C38] UUID];
    contextID = v16->_contextID;
    v16->_contextID = (NSUUID *)v17;

    v16->_action = a3;
    objc_storeStrong((id *)&v16->_originalMessage, a4);
    v16->_shouldSign = a5;
    v16->_isSigned = a6;
    v16->_shouldEncrypt = a7;
    v16->_isEncrypted = a8;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(MEComposeContext *)self contextID];
  [v6 encodeObject:v4 forKey:@"EFPropertyKey_contextID"];

  v5 = [(MEComposeContext *)self originalMessage];
  [v6 encodeObject:v5 forKey:@"EFPropertyKey_originalMessage"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[MEComposeContext action](self, "action"), @"EFPropertyKey_action");
  objc_msgSend(v6, "encodeBool:forKey:", -[MEComposeContext isEncrypted](self, "isEncrypted"), @"EFPropertyKey_isEncrypted");
  objc_msgSend(v6, "encodeBool:forKey:", -[MEComposeContext shouldEncrypt](self, "shouldEncrypt"), @"EFPropertyKey_shouldEncrypt");
  objc_msgSend(v6, "encodeBool:forKey:", -[MEComposeContext isSigned](self, "isSigned"), @"EFPropertyKey_isSigned");
  objc_msgSend(v6, "encodeBool:forKey:", -[MEComposeContext shouldSign](self, "shouldSign"), @"EFPropertyKey_shouldSign");
}

- (MEComposeContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MEComposeContext;
  v5 = [(MEComposeContext *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_contextID"];
    contextID = v5->_contextID;
    v5->_contextID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_originalMessage"];
    originalMessage = v5->_originalMessage;
    v5->_originalMessage = (MEMessage *)v8;

    v5->_action = [v4 decodeIntegerForKey:@"EFPropertyKey_action"];
    v5->_isEncrypted = [v4 decodeBoolForKey:@"EFPropertyKey_isEncrypted"];
    v5->_shouldEncrypt = [v4 decodeBoolForKey:@"EFPropertyKey_shouldEncrypt"];
    v5->_isSigned = [v4 decodeBoolForKey:@"EFPropertyKey_isSigned"];
    v5->_shouldSign = [v4 decodeBoolForKey:@"EFPropertyKey_shouldSign"];
  }

  return v5;
}

- (NSUUID)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
}

- (MEMessage)originalMessage
{
  return self->_originalMessage;
}

- (void)setOriginalMessage:(id)a3
{
}

- (MEComposeUserAction)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (void)setIsEncrypted:(BOOL)a3
{
  self->_isEncrypted = a3;
}

- (BOOL)shouldEncrypt
{
  return self->_shouldEncrypt;
}

- (void)setShouldEncrypt:(BOOL)a3
{
  self->_shouldEncrypt = a3;
}

- (BOOL)isSigned
{
  return self->_isSigned;
}

- (void)setIsSigned:(BOOL)a3
{
  self->_isSigned = a3;
}

- (BOOL)shouldSign
{
  return self->_shouldSign;
}

- (void)setShouldSign:(BOOL)a3
{
  self->_shouldSign = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalMessage, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
}

@end