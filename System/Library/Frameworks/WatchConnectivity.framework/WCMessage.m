@interface WCMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)isDictionaryMessage;
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (NSString)identifier;
- (NSString)pairingID;
- (WCMessage)initWithCoder:(id)a3;
- (WCMessage)initWithPairingID:(id)a3 identifier:(id)a4 data:(id)a5 dictionaryMessage:(BOOL)a6;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WCMessage

- (WCMessage)initWithPairingID:(id)a3 identifier:(id)a4 data:(id)a5 dictionaryMessage:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WCMessage;
  v13 = [(WCMessage *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    pairingID = v13->_pairingID;
    v13->_pairingID = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    data = v13->_data;
    v13->_data = (NSData *)v18;

    v13->_dictionaryMessage = a6;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  pairingID = self->_pairingID;
  id v5 = a3;
  [v5 encodeObject:pairingID forKey:@"pairingID"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_data forKey:@"data"];
  [v5 encodeBool:self->_dictionaryMessage forKey:@"dictionaryMessage"];
}

- (WCMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WCMessage;
  id v5 = [(WCMessage *)&v16 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingID"];
    uint64_t v7 = [v6 copy];
    pairingID = v5->_pairingID;
    v5->_pairingID = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    uint64_t v10 = [v9 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    uint64_t v13 = [v12 copy];
    data = v5->_data;
    v5->_data = (NSData *)v13;

    v5->_dictionaryMessage = [v4 decodeBoolForKey:@"dictionaryMessage"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(WCMessage *)self pairingID];
  uint64_t v7 = [(WCMessage *)self identifier];
  v8 = [(WCMessage *)self data];
  uint64_t v9 = [v8 length];
  BOOL v10 = [(WCMessage *)self isDictionaryMessage];
  id v11 = "NO";
  if (v10) {
    id v11 = "YES";
  }
  id v12 = [v3 stringWithFormat:@"<%@: %p, pairingID: %@, identifier: %@, dataLength: %lu, dictionaryMessage: %s>", v5, self, v6, v7, v9, v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WCMessage *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(WCMessage *)self pairingID];
      uint64_t v7 = [(WCMessage *)v5 pairingID];
      if ([v6 isEqual:v7])
      {
        v8 = [(WCMessage *)self identifier];
        uint64_t v9 = [(WCMessage *)v5 identifier];
        char v10 = [v8 isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(WCMessage *)self pairingID];
  uint64_t v4 = [v3 hash];
  id v5 = [(WCMessage *)self identifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)pairingID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isDictionaryMessage
{
  return self->_dictionaryMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_pairingID, 0);
}

@end