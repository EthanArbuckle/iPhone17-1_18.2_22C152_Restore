@interface NEVPNProtocolPPTP
+ (BOOL)supportsSecureCoding;
- (NEVPNProtocolPPTP)init;
- (NEVPNProtocolPPTP)initWithCoder:(id)a3;
- (__SCNetworkInterface)createInterface;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int64_t)encryptionLevel;
- (void)encodeWithCoder:(id)a3;
- (void)setEncryptionLevel:(int64_t)a3;
@end

@implementation NEVPNProtocolPPTP

- (void)setEncryptionLevel:(int64_t)a3
{
  self->_encryptionLevel = a3;
}

- (int64_t)encryptionLevel
{
  return self->_encryptionLevel;
}

- (__SCNetworkInterface)createInterface
{
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_ERROR, "Creating PPTP interface failed, protocol is no longer supported", v4, 2u);
  }

  return 0;
}

- (id)initFromLegacyDictionary:(id)a3
{
  return 0;
}

- (id)copyLegacyDictionary
{
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_ERROR, "PPTP is not supported", v4, 2u);
  }

  return 0;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
  v11.receiver = self;
  v11.super_class = (Class)NEVPNProtocolPPTP;
  v8 = [(NEVPNProtocolPPP *)&v11 descriptionWithIndent:v5 options:a4];
  v9 = (void *)[v7 initWithString:v8];

  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NEVPNProtocolPPTP encryptionLevel](self, "encryptionLevel"), @"encryptionLevel", v5, a4);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NEVPNProtocolPPTP;
  id v4 = [(NEVPNProtocolPPP *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setEncryptionLevel:", -[NEVPNProtocolPPTP encryptionLevel](self, "encryptionLevel"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NEVPNProtocolPPTP;
  id v4 = a3;
  [(NEVPNProtocolPPP *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolPPTP encryptionLevel](self, "encryptionLevel", v5.receiver, v5.super_class), @"EncryptionLevel");
}

- (NEVPNProtocolPPTP)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NEVPNProtocolPPTP;
  objc_super v5 = [(NEVPNProtocolPPP *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_encryptionLevel = (int)[v4 decodeInt32ForKey:@"EncryptionLevel"];
  }

  return v5;
}

- (NEVPNProtocolPPTP)init
{
  v3.receiver = self;
  v3.super_class = (Class)NEVPNProtocolPPTP;
  result = [(NEVPNProtocolPPP *)&v3 initWithType:3];
  if (result) {
    result->_encryptionLevel = 2;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end