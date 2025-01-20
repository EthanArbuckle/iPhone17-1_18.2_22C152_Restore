@interface _DDUIRapportDevice
- (BOOL)isMine;
- (NSString)accountIdentifier;
- (NSString)description;
- (NSString)identifier;
- (NSString)model;
- (NSString)name;
- (_DDUIRapportDevice)initWithIncomingMessageOptions:(id)a3;
- (_DDUIRapportDevice)initWithRPCompanionLinkDevice:(id)a3;
- (unsigned)deviceType;
- (void)setAccountIdentifier:(id)a3;
- (void)setDeviceType:(unsigned int)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsMine:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
@end

@implementation _DDUIRapportDevice

- (_DDUIRapportDevice)initWithRPCompanionLinkDevice:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_DDUIRapportDevice;
  v5 = [(_DDUIRapportDevice *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 name];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 model];
    model = v5->_model;
    v5->_model = (NSString *)v8;

    v10 = [v4 idsDeviceIdentifier];
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      v12 = [v4 identifier];
    }
    identifier = v5->_identifier;
    v5->_identifier = v12;

    uint64_t v14 = [v4 accountID];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v14;

    v5->_deviceType = DDUIDeviceTypeForModelString(v5->_model);
    v5->_isMine = ([v4 statusFlags] & 0x80000) != 0;
  }

  return v5;
}

- (_DDUIRapportDevice)initWithIncomingMessageOptions:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_DDUIRapportDevice;
  v5 = [(_DDUIRapportDevice *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"senderDeviceName"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F947A8]];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F947B0]];
    model = v5->_model;
    v5->_model = (NSString *)v10;

    v5->_isMine = (CFDictionaryGetInt64() & 0x80000) != 0;
    uint64_t v12 = [v4 objectForKeyedSubscript:@"senderAccountID"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v12;

    v5->_deviceType = DDUIDeviceTypeForModelString(v5->_model);
  }

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = @"YES";
  if (!self->_isMine) {
    v5 = @"NO";
  }
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; name = \"%@\"; model = \"%@\"; identifier = \"%@\"; accountIdentifier = \"%@\"; deviceType = %u; isMine = %@>",
                       v4,
                       self,
                       *(_OWORD *)&self->_name,
                       self->_identifier,
                       self->_accountIdentifier,
                       self->_deviceType,
                       v5);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unsigned int)a3
{
  self->_deviceType = a3;
}

- (BOOL)isMine
{
  return self->_isMine;
}

- (void)setIsMine:(BOOL)a3
{
  self->_isMine = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end