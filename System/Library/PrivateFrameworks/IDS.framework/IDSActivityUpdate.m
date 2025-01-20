@interface IDSActivityUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)isDeviceOnline;
- (IDSActivityUpdate)initWithCoder:(id)a3;
- (IDSActivityUpdate)initWithSubActivity:(id)a3 pushToken:(id)a4 serverTimestamp:(unint64_t)a5 clientContext:(id)a6 isDeviceOnline:(BOOL)a7;
- (IDSDevice)matchingDevice;
- (NSArray)URIs;
- (NSData)clientContext;
- (NSData)pushToken;
- (NSString)subActivity;
- (id)description;
- (unint64_t)serverTimestamp;
- (void)encodeWithCoder:(id)a3;
- (void)setIsDeviceOnline:(BOOL)a3;
- (void)setMatchingDevice:(id)a3;
- (void)setURIs:(id)a3;
@end

@implementation IDSActivityUpdate

- (IDSActivityUpdate)initWithSubActivity:(id)a3 pushToken:(id)a4 serverTimestamp:(unint64_t)a5 clientContext:(id)a6 isDeviceOnline:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  if (v13 && [v13 length])
  {
    v20.receiver = self;
    v20.super_class = (Class)IDSActivityUpdate;
    v16 = [(IDSActivityUpdate *)&v20 init];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_subActivity, a3);
      objc_storeStrong((id *)&v17->_pushToken, a4);
      objc_storeStrong((id *)&v17->_clientContext, a6);
      v17->_serverTimestamp = a5;
      v17->_isDeviceOnline = a7;
    }
    self = v17;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; subActivity: %@; pushToken: %@; serverTimestamp: %llu; clientContext: %@>",
               objc_opt_class(),
               self,
               self->_subActivity,
               self->_pushToken,
               self->_serverTimestamp,
               self->_clientContext);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  subActivity = self->_subActivity;
  id v5 = a3;
  [v5 encodeObject:subActivity forKey:@"subactivity"];
  [v5 encodeInt64:self->_serverTimestamp forKey:@"servertimestamp"];
  [v5 encodeObject:self->_pushToken forKey:@"pushtoken"];
  [v5 encodeObject:self->_clientContext forKey:@"clientcontext"];
  [v5 encodeBool:self->_isDeviceOnline forKey:@"online"];
}

- (IDSActivityUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subactivity"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"servertimestamp"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pushtoken"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientcontext"];
  uint64_t v9 = [v4 decodeBoolForKey:@"online"];

  v10 = [(IDSActivityUpdate *)self initWithSubActivity:v5 pushToken:v7 serverTimestamp:v6 clientContext:v8 isDeviceOnline:v9];
  return v10;
}

- (NSString)subActivity
{
  return self->_subActivity;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (unint64_t)serverTimestamp
{
  return self->_serverTimestamp;
}

- (BOOL)isDeviceOnline
{
  return self->_isDeviceOnline;
}

- (void)setIsDeviceOnline:(BOOL)a3
{
  self->_isDeviceOnline = a3;
}

- (NSData)clientContext
{
  return self->_clientContext;
}

- (IDSDevice)matchingDevice
{
  return self->_matchingDevice;
}

- (void)setMatchingDevice:(id)a3
{
}

- (NSArray)URIs
{
  return self->_URIs;
}

- (void)setURIs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URIs, 0);
  objc_storeStrong((id *)&self->_matchingDevice, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);

  objc_storeStrong((id *)&self->_subActivity, 0);
}

@end