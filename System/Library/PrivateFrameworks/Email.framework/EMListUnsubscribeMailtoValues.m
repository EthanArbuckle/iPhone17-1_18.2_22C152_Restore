@interface EMListUnsubscribeMailtoValues
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EDReceivingAccount)account;
- (EMListUnsubscribeMailtoValues)initWithAddresss:(id)a3 subject:(id)a4 body:(id)a5 account:(id)a6;
- (EMListUnsubscribeMailtoValues)initWithCoder:(id)a3;
- (NSString)address;
- (NSString)body;
- (NSString)subject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMListUnsubscribeMailtoValues

- (EMListUnsubscribeMailtoValues)initWithAddresss:(id)a3 subject:(id)a4 body:(id)a5 account:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)EMListUnsubscribeMailtoValues;
  v14 = [(EMListUnsubscribeMailtoValues *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    address = v14->_address;
    v14->_address = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    subject = v14->_subject;
    v14->_subject = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    body = v14->_body;
    v14->_body = (NSString *)v19;

    objc_storeStrong((id *)&v14->_account, a6);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EDReceivingAccount)account
{
  if (self->_accountIdentifier)
  {
    +[EMListUnsubscribeCommand _accountWithIdentifier:](EMListUnsubscribeCommand, "_accountWithIdentifier:");
    v3 = (EDReceivingAccount *)objc_claimAutoreleasedReturnValue();
    account = self->_account;
    self->_account = v3;

    accountIdentifier = self->_accountIdentifier;
    self->_accountIdentifier = 0;
  }
  v6 = self->_account;
  return v6;
}

- (EMListUnsubscribeMailtoValues)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EMListUnsubscribeMailtoValues;
  v5 = [(EMListUnsubscribeMailtoValues *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_address"];
    address = v5->_address;
    v5->_address = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_subject"];
    subject = v5->_subject;
    v5->_subject = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_body"];
    body = v5->_body;
    v5->_body = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_account.identifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(EMListUnsubscribeMailtoValues *)self address];
  [v9 encodeObject:v4 forKey:@"EFPropertyKey_address"];

  v5 = [(EMListUnsubscribeMailtoValues *)self subject];
  [v9 encodeObject:v5 forKey:@"EFPropertyKey_subject"];

  uint64_t v6 = [(EMListUnsubscribeMailtoValues *)self body];
  [v9 encodeObject:v6 forKey:@"EFPropertyKey_body"];

  v7 = [(EMListUnsubscribeMailtoValues *)self account];
  uint64_t v8 = [v7 identifier];
  [v9 encodeObject:v8 forKey:@"EFPropertyKey_account.identifier"];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_address hash];
  NSUInteger v4 = [(NSString *)self->_subject hash];
  NSUInteger v5 = [(NSString *)self->_body hash];
  uint64_t v6 = [(EDReceivingAccount *)self->_account identifier];
  unint64_t v7 = (11 * v4) ^ (37 * v3) ^ v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 address];
    if (EFObjectsAreEqual())
    {
      unint64_t v7 = [v5 subject];
      if (EFObjectsAreEqual())
      {
        uint64_t v8 = [v5 body];
        if (EFObjectsAreEqual())
        {
          id v9 = [(EMListUnsubscribeMailtoValues *)self account];
          uint64_t v10 = [v9 identifier];
          id v11 = [v5 account];
          uint64_t v12 = [v11 identifier];
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

- (NSString)address
{
  return self->_address;
}

- (NSString)subject
{
  return self->_subject;
}

- (NSString)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end