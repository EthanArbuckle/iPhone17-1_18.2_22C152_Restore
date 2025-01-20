@interface _EXSceneSessionConnectionRequest
+ (BOOL)supportsSecureCoding;
- (NSUUID)identifier;
- (NSXPCListenerEndpoint)hostEndpoint;
- (_EXSceneSessionConnectionRequest)init;
- (_EXSceneSessionConnectionRequest)initWithCoder:(id)a3;
- (_EXSceneSessionParameters)parameters;
- (void)encodeWithCoder:(id)a3;
- (void)setHostEndpoint:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation _EXSceneSessionConnectionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXSceneSessionConnectionRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)_EXSceneSessionConnectionRequest;
  return [(_EXSceneSessionConnectionRequest *)&v3 init];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  hostEndpoint = self->_hostEndpoint;
  if (hostEndpoint) {
    [v5 encodeObject:hostEndpoint forKey:@"hostEndpoint"];
  }
  [v5 encodeObject:self->_parameters forKey:@"parameters"];
}

- (_EXSceneSessionConnectionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_EXSceneSessionConnectionRequest;
  id v5 = [(_EXSceneSessionConnectionRequest *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hostEndpoint"];
    hostEndpoint = v5->_hostEndpoint;
    v5->_hostEndpoint = (NSXPCListenerEndpoint *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameters"];
    parameters = v5->_parameters;
    v5->_parameters = (_EXSceneSessionParameters *)v10;
  }
  return v5;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSXPCListenerEndpoint)hostEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHostEndpoint:(id)a3
{
}

- (_EXSceneSessionParameters)parameters
{
  return (_EXSceneSessionParameters *)objc_getProperty(self, a2, 24, 1);
}

- (void)setParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_hostEndpoint, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end