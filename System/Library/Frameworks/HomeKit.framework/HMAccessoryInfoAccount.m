@interface HMAccessoryInfoAccount
- (BOOL)isEqual:(id)a3;
- (BOOL)signedIn;
- (HMAccessoryInfoAccount)initWithProtoData:(id)a3;
- (HMAccessoryInfoAccount)initWithProtoPayload:(id)a3;
- (HMAccessoryInfoAccount)initWithUsername:(id)a3 aaAltDSID:(id)a4 amsAltDSID:(id)a5 signedIn:(BOOL)a6;
- (NSString)aaAltDSID;
- (NSString)amsAltDSID;
- (NSString)username;
- (id)description;
- (id)protoData;
- (id)protoPayload;
- (unint64_t)hash;
@end

@implementation HMAccessoryInfoAccount

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amsAltDSID, 0);
  objc_storeStrong((id *)&self->_aaAltDSID, 0);

  objc_storeStrong((id *)&self->_username, 0);
}

- (BOOL)signedIn
{
  return self->_signedIn;
}

- (NSString)amsAltDSID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)aaAltDSID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)hash
{
  v3 = [(HMAccessoryInfoAccount *)self username];
  uint64_t v4 = [v3 hash];

  v5 = [(HMAccessoryInfoAccount *)self aaAltDSID];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(HMAccessoryInfoAccount *)self amsAltDSID];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMAccessoryInfoAccount *)a3;
  if (self == v4)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6)
    {
      v7 = [(HMAccessoryInfoAccount *)self username];
      unint64_t v8 = [(HMAccessoryInfoAccount *)v6 username];
      if (HMFEqualObjects())
      {
        v9 = [(HMAccessoryInfoAccount *)self aaAltDSID];
        v10 = [(HMAccessoryInfoAccount *)v6 aaAltDSID];
        if (HMFEqualObjects())
        {
          v11 = [(HMAccessoryInfoAccount *)self amsAltDSID];
          v12 = [(HMAccessoryInfoAccount *)v6 amsAltDSID];
          if (HMFEqualObjects())
          {
            BOOL v13 = [(HMAccessoryInfoAccount *)self signedIn];
            BOOL v14 = v13 ^ [(HMAccessoryInfoAccount *)v6 signedIn] ^ 1;
          }
          else
          {
            LOBYTE(v14) = 0;
          }
        }
        else
        {
          LOBYTE(v14) = 0;
        }
      }
      else
      {
        LOBYTE(v14) = 0;
      }
    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }
  return v14;
}

- (HMAccessoryInfoAccount)initWithProtoData:(id)a3
{
  id v4 = a3;
  v5 = [[HMAccessoryInfoProtoAccountInfoEvent alloc] initWithData:v4];

  uint64_t v6 = [(HMAccessoryInfoAccount *)self initWithProtoPayload:v5];
  return v6;
}

- (HMAccessoryInfoAccount)initWithProtoPayload:(id)a3
{
  id v4 = a3;
  v5 = [v4 username];
  uint64_t v6 = [v4 aaAltDSID];
  v7 = [v4 amsAltDSID];
  uint64_t v8 = [v4 signedIn];

  v9 = [(HMAccessoryInfoAccount *)self initWithUsername:v5 aaAltDSID:v6 amsAltDSID:v7 signedIn:v8];
  return v9;
}

- (id)protoData
{
  v2 = [(HMAccessoryInfoAccount *)self protoPayload];
  v3 = [v2 data];

  return v3;
}

- (id)protoPayload
{
  v3 = objc_alloc_init(HMAccessoryInfoProtoAccountInfoEvent);
  id v4 = [(HMAccessoryInfoAccount *)self username];
  [(HMAccessoryInfoProtoAccountInfoEvent *)v3 setUsername:v4];

  v5 = [(HMAccessoryInfoAccount *)self aaAltDSID];
  [(HMAccessoryInfoProtoAccountInfoEvent *)v3 setAaAltDSID:v5];

  uint64_t v6 = [(HMAccessoryInfoAccount *)self amsAltDSID];
  [(HMAccessoryInfoProtoAccountInfoEvent *)v3 setAmsAltDSID:v6];

  [(HMAccessoryInfoProtoAccountInfoEvent *)v3 setSignedIn:[(HMAccessoryInfoAccount *)self signedIn]];

  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HMAccessoryInfoAccount *)self username];
  [(HMAccessoryInfoAccount *)self signedIn];
  uint64_t v6 = HMFBooleanToString();
  v7 = [v3 stringWithFormat:@"<%@: username = %@, signedIn = %@>", v4, v5, v6];

  return v7;
}

- (HMAccessoryInfoAccount)initWithUsername:(id)a3 aaAltDSID:(id)a4 amsAltDSID:(id)a5 signedIn:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMAccessoryInfoAccount;
  BOOL v14 = [(HMAccessoryInfoAccount *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_username, a3);
    objc_storeStrong((id *)&v15->_aaAltDSID, a4);
    objc_storeStrong((id *)&v15->_amsAltDSID, a5);
    v15->_signedIn = a6;
  }

  return v15;
}

@end