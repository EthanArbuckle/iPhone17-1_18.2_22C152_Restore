@interface IDSKTState
+ (BOOL)supportsSecureCoding;
- (BOOL)containsAccountKey;
- (BOOL)containsDeviceSignature;
- (IDSKTState)initWithCoder:(id)a3;
- (IDSKTState)initWithUserID:(id)a3 registrationStatus:(int)a4 containsAccountKey:(BOOL)a5 containsDeviceSignature:(BOOL)a6 optedIn:(unint64_t)a7;
- (NSString)userID;
- (int)status;
- (unint64_t)optedIn;
- (void)encodeWithCoder:(id)a3;
- (void)setContainsAccountKey:(BOOL)a3;
- (void)setContainsDeviceSignature:(BOOL)a3;
- (void)setOptedIn:(unint64_t)a3;
- (void)setStatus:(int)a3;
- (void)setUserID:(id)a3;
@end

@implementation IDSKTState

- (IDSKTState)initWithUserID:(id)a3 registrationStatus:(int)a4 containsAccountKey:(BOOL)a5 containsDeviceSignature:(BOOL)a6 optedIn:(unint64_t)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSKTState;
  v14 = [(IDSKTState *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_userID, a3);
    v15->_status = a4;
    v15->_containsAccountKey = a5;
    v15->_containsDeviceSignature = a6;
    v15->_optedIn = a7;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  userID = self->_userID;
  id v5 = a3;
  [v5 encodeObject:userID forKey:@"userID"];
  [v5 encodeInt32:self->_status forKey:@"status"];
  [v5 encodeBool:self->_containsAccountKey forKey:@"accountKey"];
  [v5 encodeBool:self->_containsDeviceSignature forKey:@"deviceSignature"];
  [v5 encodeInteger:self->_optedIn forKey:@"optedIn"];
}

- (IDSKTState)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userID"];
  uint64_t v6 = [v4 decodeInt32ForKey:@"status"];
  uint64_t v7 = [v4 decodeBoolForKey:@"accountKey"];
  uint64_t v8 = [v4 decodeBoolForKey:@"accountKey"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"optedIn"];

  v10 = [(IDSKTState *)self initWithUserID:v5 registrationStatus:v6 containsAccountKey:v7 containsDeviceSignature:v8 optedIn:v9];
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)userID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUserID:(id)a3
{
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (BOOL)containsAccountKey
{
  return self->_containsAccountKey;
}

- (void)setContainsAccountKey:(BOOL)a3
{
  self->_containsAccountKey = a3;
}

- (BOOL)containsDeviceSignature
{
  return self->_containsDeviceSignature;
}

- (void)setContainsDeviceSignature:(BOOL)a3
{
  self->_containsDeviceSignature = a3;
}

- (unint64_t)optedIn
{
  return self->_optedIn;
}

- (void)setOptedIn:(unint64_t)a3
{
  self->_optedIn = a3;
}

- (void).cxx_destruct
{
}

@end