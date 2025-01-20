@interface ASDRegisterListenerOptions
+ (BOOL)supportsSecureCoding;
- (ASDRegisterListenerOptions)initWithCoder:(id)a3;
- (NSString)clientID;
- (NSXPCConnection)endpoint;
- (void)encodeWithCoder:(id)a3;
- (void)setClientID:(id)a3;
- (void)setEndpoint:(id)a3;
@end

@implementation ASDRegisterListenerOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASDRegisterListenerOptions *)self clientID];
  [v4 encodeObject:v5 forKey:@"clientID"];

  id v6 = [(ASDRegisterListenerOptions *)self endpoint];
  [v4 encodeObject:v6 forKey:@"endpoint"];
}

- (ASDRegisterListenerOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDRegisterListenerOptions;
  v5 = [(ASDRegisterListenerOptions *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientID"];
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpoint"];
    if (v8)
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v8];
      endpoint = v5->_endpoint;
      v5->_endpoint = (NSXPCConnection *)v9;
    }
  }

  return v5;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (NSXPCConnection)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end