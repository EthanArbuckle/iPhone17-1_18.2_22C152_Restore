@interface WFSendRecipient
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)address;
- (NSString)name;
- (WFSendRecipient)initWithCoder:(id)a3;
- (WFSendRecipient)initWithName:(id)a3 address:(id)a4;
- (id)recipientContentItem;
- (int64_t)contactType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(id)a3;
- (void)setName:(id)a3;
@end

@implementation WFSendRecipient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setAddress:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFSendRecipient *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  id v6 = [(WFSendRecipient *)self address];
  [v4 encodeObject:v6 forKey:@"address"];
}

- (WFSendRecipient)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"address"];

  v7 = [(WFSendRecipient *)self initWithName:v5 address:v6];
  return v7;
}

- (id)recipientContentItem
{
  int64_t v3 = [(WFSendRecipient *)self contactType];
  switch(v3)
  {
    case 2:
      v8 = (void *)MEMORY[0x263F337C8];
      id v6 = [(WFSendRecipient *)self address];
      v9 = [(WFSendRecipient *)self name];
      v10 = [v8 itemWithObject:v6 named:v9];
LABEL_8:

      goto LABEL_10;
    case 1:
      id v4 = (void *)MEMORY[0x263F337C8];
      v11 = (void *)MEMORY[0x263F33860];
      id v6 = [(WFSendRecipient *)self address];
      uint64_t v7 = [v11 addressWithEmailAddress:v6];
      goto LABEL_7;
    case 0:
      id v4 = (void *)MEMORY[0x263F337C8];
      v5 = (void *)MEMORY[0x263F33928];
      id v6 = [(WFSendRecipient *)self address];
      uint64_t v7 = [v5 phoneNumberWithPhoneNumberString:v6];
LABEL_7:
      v9 = (void *)v7;
      v12 = [(WFSendRecipient *)self name];
      v10 = [v4 itemWithObject:v9 named:v12];

      goto LABEL_8;
  }
  v10 = 0;
LABEL_10:
  return v10;
}

- (int64_t)contactType
{
  v2 = (void *)MEMORY[0x263F33780];
  int64_t v3 = [(WFSendRecipient *)self address];
  int64_t v4 = [v2 predictedTypeForHandleValue:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFSendRecipient *)self name];
      id v6 = [v4 name];
      id v7 = v5;
      id v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {
      }
      else
      {
        LOBYTE(v10) = 0;
        v11 = v8;
        id v12 = v7;
        if (!v7 || !v8)
        {
LABEL_16:

LABEL_17:
          goto LABEL_18;
        }
        int v10 = [v7 isEqualToString:v8];

        if (!v10) {
          goto LABEL_17;
        }
      }
      v13 = [(WFSendRecipient *)self address];
      v14 = [v4 address];
      id v12 = v13;
      id v15 = v14;
      v11 = v15;
      if (v12 == v15)
      {
        LOBYTE(v10) = 1;
      }
      else
      {
        LOBYTE(v10) = 0;
        if (v12 && v15) {
          LOBYTE(v10) = [v12 isEqualToString:v15];
        }
      }

      goto LABEL_16;
    }
  }
  LOBYTE(v10) = 0;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return v3 ^ [(NSString *)self->_address hash] ^ 0x12399832;
}

- (WFSendRecipient)initWithName:(id)a3 address:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WFSendRecipient;
  id v8 = [(WFSendRecipient *)&v18 init];
  if (v8)
  {
    v9 = [MEMORY[0x263F089C0] controlCharacterSet];
    int v10 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    [v9 formUnionWithCharacterSet:v10];

    v11 = [MEMORY[0x263F08708] nonBaseCharacterSet];
    [v9 formUnionWithCharacterSet:v11];

    uint64_t v12 = [v6 stringByTrimmingCharactersInSet:v9];
    name = v8->_name;
    v8->_name = (NSString *)v12;

    uint64_t v14 = [v7 stringByTrimmingCharactersInSet:v9];
    address = v8->_address;
    v8->_address = (NSString *)v14;

    v16 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end