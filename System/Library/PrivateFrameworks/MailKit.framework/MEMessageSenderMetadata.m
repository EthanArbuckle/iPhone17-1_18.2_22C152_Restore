@interface MEMessageSenderMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isContact;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrimarySender;
- (BOOL)isUnsubscribeHeaderPresent;
- (BOOL)isVIP;
- (MEMessageSenderMetadata)initWithCoder:(id)a3;
- (MEMessageSenderMetadata)initWithSenderEmailAddress:(id)a3 isVIP:(BOOL)a4 isContact:(BOOL)a5 isUnsubscribeHeaderPresent:(BOOL)a6 isPrimarySender:(BOOL)a7;
- (NSString)senderEmailAddress;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MEMessageSenderMetadata

- (MEMessageSenderMetadata)initWithSenderEmailAddress:(id)a3 isVIP:(BOOL)a4 isContact:(BOOL)a5 isUnsubscribeHeaderPresent:(BOOL)a6 isPrimarySender:(BOOL)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MEMessageSenderMetadata;
  v14 = [(MEMessageSenderMetadata *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_senderEmailAddress, a3);
    v15->_isVIP = a4;
    v15->_isContact = a5;
    v15->_isUnsubscribeHeaderPresent = a6;
    v15->_isPrimarySender = a7;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[MEMessageSenderMetadata isVIP](self, "isVIP"), @"EFPropertyKey_isVIP");
  objc_msgSend(v5, "encodeBool:forKey:", -[MEMessageSenderMetadata isContact](self, "isContact"), @"EFPropertyKey_isContact");
  objc_msgSend(v5, "encodeBool:forKey:", -[MEMessageSenderMetadata isUnsubscribeHeaderPresent](self, "isUnsubscribeHeaderPresent"), @"EFPropertyKey_isUnsubscribeHeaderPresent");
  v4 = [(MEMessageSenderMetadata *)self senderEmailAddress];
  [v5 encodeObject:v4 forKey:@"EFPropertyKey_senderEmailAddress"];

  objc_msgSend(v5, "encodeBool:forKey:", -[MEMessageSenderMetadata isPrimarySender](self, "isPrimarySender"), @"EFPropertyKey_isPrimarySender");
}

- (MEMessageSenderMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"EFPropertyKey_isVIP"];
  self->_isVIP = v5;
  uint64_t v6 = [v4 decodeBoolForKey:@"EFPropertyKey_isContact"];
  self->_isContact = v6;
  uint64_t v7 = [v4 decodeBoolForKey:@"EFPropertyKey_isUnsubscribeHeaderPresent"];
  self->_isUnsubscribeHeaderPresent = v7;
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_senderEmailAddress"];
  uint64_t v9 = [v4 decodeBoolForKey:@"EFPropertyKey_isPrimarySender"];
  self->_isPrimarySender = v9;
  v10 = [(MEMessageSenderMetadata *)self initWithSenderEmailAddress:v8 isVIP:v5 isContact:v6 isUnsubscribeHeaderPresent:v7 isPrimarySender:v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if ([v5 isEqual:objc_opt_class()])
  {
    id v6 = v4;
    uint64_t v7 = [(MEMessageSenderMetadata *)self senderEmailAddress];
    v8 = [v6 senderEmailAddress];
    if ([v7 isEqual:v8]
      && (int v9 = -[MEMessageSenderMetadata isVIP](self, "isVIP"), v9 == [v6 isVIP])
      && (int v10 = [(MEMessageSenderMetadata *)self isContact],
          v10 == [v6 isContact])
      && (int v11 = [(MEMessageSenderMetadata *)self isUnsubscribeHeaderPresent],
          v11 == [v6 isUnsubscribeHeaderPresent]))
    {
      BOOL v14 = [(MEMessageSenderMetadata *)self isPrimarySender];
      int v12 = v14 ^ [v6 isPrimarySender] ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(MEMessageSenderMetadata *)self senderEmailAddress];
  uint64_t v4 = [v3 hash];

  uint64_t v5 = 33 * (33 * v4 + [(MEMessageSenderMetadata *)self isVIP]);
  uint64_t v6 = 33 * (v5 + [(MEMessageSenderMetadata *)self isContact]);
  uint64_t v7 = 33 * (v6 + [(MEMessageSenderMetadata *)self isUnsubscribeHeaderPresent]);
  return v7 + [(MEMessageSenderMetadata *)self isPrimarySender] + 39135393;
}

- (NSString)senderEmailAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isVIP
{
  return self->_isVIP;
}

- (BOOL)isContact
{
  return self->_isContact;
}

- (BOOL)isUnsubscribeHeaderPresent
{
  return self->_isUnsubscribeHeaderPresent;
}

- (BOOL)isPrimarySender
{
  return self->_isPrimarySender;
}

- (void).cxx_destruct
{
}

@end