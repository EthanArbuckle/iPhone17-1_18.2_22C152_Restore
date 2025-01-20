@interface MEEncodedOutgoingMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEncrypted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSigned;
- (MEEncodedOutgoingMessage)initWithCoder:(id)a3;
- (MEEncodedOutgoingMessage)initWithRawData:(NSData *)rawData isSigned:(BOOL)isSigned isEncrypted:(BOOL)isEncrypted;
- (NSData)rawData;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MEEncodedOutgoingMessage

- (MEEncodedOutgoingMessage)initWithRawData:(NSData *)rawData isSigned:(BOOL)isSigned isEncrypted:(BOOL)isEncrypted
{
  v9 = rawData;
  v13.receiver = self;
  v13.super_class = (Class)MEEncodedOutgoingMessage;
  v10 = [(MEEncodedOutgoingMessage *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_isSigned = isSigned;
    v10->_isEncrypted = isEncrypted;
    objc_storeStrong((id *)&v10->_rawData, rawData);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEEncodedOutgoingMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"EFPropertyKey_isSigned"];
  uint64_t v6 = [v4 decodeBoolForKey:@"EFPropertyKey_isEncrypted"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_rawData"];
  v8 = [(MEEncodedOutgoingMessage *)self initWithRawData:v7 isSigned:v5 isEncrypted:v6];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[MEEncodedOutgoingMessage isSigned](self, "isSigned"), @"EFPropertyKey_isSigned");
  objc_msgSend(v5, "encodeBool:forKey:", -[MEEncodedOutgoingMessage isEncrypted](self, "isEncrypted"), @"EFPropertyKey_isEncrypted");
  id v4 = [(MEEncodedOutgoingMessage *)self rawData];
  [v5 encodeObject:v4 forKey:@"EFPropertyKey_rawData"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MEEncodedOutgoingMessage *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL v6 = [(MEEncodedOutgoingMessage *)self isSigned];
      if (v6 == [(MEEncodedOutgoingMessage *)v5 isSigned]
        && (BOOL v7 = [(MEEncodedOutgoingMessage *)self isEncrypted],
            v7 == [(MEEncodedOutgoingMessage *)v5 isEncrypted]))
      {
        v9 = [(MEEncodedOutgoingMessage *)self rawData];
        v10 = [(MEEncodedOutgoingMessage *)v5 rawData];
        char v8 = [v9 isEqual:v10];
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (NSData)rawData
{
  return self->_rawData;
}

- (BOOL)isSigned
{
  return self->_isSigned;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (void).cxx_destruct
{
}

@end