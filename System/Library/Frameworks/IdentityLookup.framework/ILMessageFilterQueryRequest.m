@interface ILMessageFilterQueryRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (ILMessageFilterQueryRequest)initWithCoder:(id)a3;
- (ILMessageFilterQueryRequest)initWithExtensionIdentifier:(id)a3;
- (NSString)extensionIdentifier;
- (NSString)messageBody;
- (NSString)receiverISOCountryCode;
- (NSString)sender;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMessageBody:(id)a3;
- (void)setReceiverISOCountryCode:(id)a3;
- (void)setSender:(id)a3;
@end

@implementation ILMessageFilterQueryRequest

- (ILMessageFilterQueryRequest)initWithExtensionIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ILMessageFilterQueryRequest;
  v5 = [(ILMessageFilterQueryRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    extensionIdentifier = v5->_extensionIdentifier;
    v5->_extensionIdentifier = (NSString *)v6;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ILMessageFilterQueryRequest *)self extensionIdentifier];
  uint64_t v6 = [(ILMessageFilterQueryRequest *)self sender];
  v7 = [v3 stringWithFormat:@"<%@ %p extensionIdentifier=%@ sender=%@>", v4, self, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(ILMessageFilterQueryRequest *)self isEqualToRequest:v4];

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ILMessageFilterQueryRequest *)self extensionIdentifier];
  uint64_t v6 = [v4 extensionIdentifier];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(ILMessageFilterQueryRequest *)self sender];
    v8 = [v4 sender];
    if (v8)
    {
      if ([v7 isEqualToString:v8]) {
        goto LABEL_4;
      }
    }
    else if (!v7)
    {
LABEL_4:
      objc_super v9 = [(ILMessageFilterQueryRequest *)self messageBody];
      v10 = [v4 messageBody];
      if (v10)
      {
        if ([v9 isEqualToString:v10])
        {
LABEL_6:
          uint64_t v11 = [(ILMessageFilterQueryRequest *)self receiverISOCountryCode];
          uint64_t v12 = [v4 receiverISOCountryCode];
          char v13 = (v11 | v12) == 0;
          if (v12) {
            char v13 = [(id)v11 isEqualToString:v12];
          }

          goto LABEL_14;
        }
      }
      else if (!v9)
      {
        goto LABEL_6;
      }
      char v13 = 0;
LABEL_14:

      goto LABEL_15;
    }
    char v13 = 0;
LABEL_15:

    goto LABEL_16;
  }
  char v13 = 0;
LABEL_16:

  return v13;
}

- (unint64_t)hash
{
  v3 = [(ILMessageFilterQueryRequest *)self extensionIdentifier];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(ILMessageFilterQueryRequest *)self sender];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(ILMessageFilterQueryRequest *)self messageBody];
  uint64_t v8 = [v7 hash];
  objc_super v9 = [(ILMessageFilterQueryRequest *)self receiverISOCountryCode];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILMessageFilterQueryRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_extensionIdentifier);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = [(ILMessageFilterQueryRequest *)self initWithExtensionIdentifier:v7];
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    unint64_t v10 = NSStringFromSelector(sel_sender);
    uint64_t v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    sender = v8->_sender;
    v8->_sender = (NSString *)v11;

    uint64_t v13 = objc_opt_class();
    v14 = NSStringFromSelector(sel_messageBody);
    uint64_t v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
    messageBody = v8->_messageBody;
    v8->_messageBody = (NSString *)v15;

    uint64_t v17 = objc_opt_class();
    v18 = NSStringFromSelector(sel_receiverISOCountryCode);
    uint64_t v19 = [v4 decodeObjectOfClass:v17 forKey:v18];
    receiverISOCountryCode = v8->_receiverISOCountryCode;
    v8->_receiverISOCountryCode = (NSString *)v19;
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ILMessageFilterQueryRequest *)self extensionIdentifier];
  uint64_t v6 = NSStringFromSelector(sel_extensionIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(ILMessageFilterQueryRequest *)self sender];
  uint64_t v8 = NSStringFromSelector(sel_sender);
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(ILMessageFilterQueryRequest *)self messageBody];
  unint64_t v10 = NSStringFromSelector(sel_messageBody);
  [v4 encodeObject:v9 forKey:v10];

  id v12 = [(ILMessageFilterQueryRequest *)self receiverISOCountryCode];
  uint64_t v11 = NSStringFromSelector(sel_receiverISOCountryCode);
  [v4 encodeObject:v12 forKey:v11];
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (NSString)messageBody
{
  return self->_messageBody;
}

- (void)setMessageBody:(id)a3
{
}

- (NSString)receiverISOCountryCode
{
  return self->_receiverISOCountryCode;
}

- (void)setReceiverISOCountryCode:(id)a3
{
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_receiverISOCountryCode, 0);
  objc_storeStrong((id *)&self->_messageBody, 0);

  objc_storeStrong((id *)&self->_sender, 0);
}

@end