@interface MEDecodedMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MEDecodedMessage)initWithCoder:(id)a3;
- (MEDecodedMessage)initWithData:(NSData *)rawData securityInformation:(MEMessageSecurityInformation *)securityInformation context:(NSData *)context;
- (MEDecodedMessage)initWithData:(NSData *)rawData securityInformation:(MEMessageSecurityInformation *)securityInformation context:(NSData *)context banner:(MEDecodedMessageBanner *)banner;
- (MEDecodedMessageBanner)banner;
- (MEMessageSecurityInformation)securityInformation;
- (NSData)context;
- (NSData)rawData;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MEDecodedMessage

- (MEDecodedMessage)initWithData:(NSData *)rawData securityInformation:(MEMessageSecurityInformation *)securityInformation context:(NSData *)context
{
  return [(MEDecodedMessage *)self initWithData:rawData securityInformation:securityInformation context:context banner:0];
}

- (MEDecodedMessage)initWithData:(NSData *)rawData securityInformation:(MEMessageSecurityInformation *)securityInformation context:(NSData *)context banner:(MEDecodedMessageBanner *)banner
{
  v11 = rawData;
  v12 = securityInformation;
  v13 = context;
  v14 = banner;
  v18.receiver = self;
  v18.super_class = (Class)MEDecodedMessage;
  v15 = [(MEDecodedMessage *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_rawData, rawData);
    objc_storeStrong((id *)&v16->_securityInformation, securityInformation);
    objc_storeStrong((id *)&v16->_context, context);
    objc_storeStrong((id *)&v16->_banner, banner);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEDecodedMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_rawData"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_context"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_banner"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_securityInformation"];
  v9 = [(MEDecodedMessage *)self initWithData:v5 securityInformation:v8 context:v6 banner:v7];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(MEDecodedMessage *)self rawData];
  [v8 encodeObject:v4 forKey:@"EFPropertyKey_rawData"];

  v5 = [(MEDecodedMessage *)self securityInformation];
  [v8 encodeObject:v5 forKey:@"EFPropertyKey_securityInformation"];

  v6 = [(MEDecodedMessage *)self context];
  [v8 encodeObject:v6 forKey:@"EFPropertyKey_context"];

  v7 = [(MEDecodedMessage *)self banner];
  [v8 encodeObject:v7 forKey:@"EFPropertyKey_banner"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  if ([v5 isEqual:objc_opt_class()])
  {
    id v6 = v4;
    v7 = [(MEDecodedMessage *)self rawData];
    id v8 = [v6 rawData];
    if (EFObjectsAreEqual())
    {
      v9 = [(MEDecodedMessage *)self securityInformation];
      v10 = [v6 securityInformation];
      if ([v9 isEqual:v10])
      {
        v16 = [(MEDecodedMessage *)self context];
        v11 = [v6 context];
        if (EFObjectsAreEqual())
        {
          v15 = [(MEDecodedMessage *)self banner];
          v12 = [v6 banner];
          char v13 = EFObjectsAreEqual();
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (NSData)rawData
{
  return self->_rawData;
}

- (MEMessageSecurityInformation)securityInformation
{
  return self->_securityInformation;
}

- (NSData)context
{
  return self->_context;
}

- (MEDecodedMessageBanner)banner
{
  return self->_banner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_banner, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_securityInformation, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
}

@end