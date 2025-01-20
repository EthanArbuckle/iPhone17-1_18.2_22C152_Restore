@interface _EXSceneSessionConnectionResponse
+ (BOOL)supportsSecureCoding;
- (NSXPCListenerEndpoint)sceneEndpoint;
- (_EXSceneSessionConnectionResponse)init;
- (_EXSceneSessionConnectionResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSceneEndpoint:(id)a3;
@end

@implementation _EXSceneSessionConnectionResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXSceneSessionConnectionResponse)init
{
  v3.receiver = self;
  v3.super_class = (Class)_EXSceneSessionConnectionResponse;
  return [(_EXSceneSessionConnectionResponse *)&v3 init];
}

- (_EXSceneSessionConnectionResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EXSceneSessionConnectionResponse;
  v5 = [(_EXSceneSessionConnectionResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scenenEndpoint"];
    sceneEndpoint = v5->_sceneEndpoint;
    v5->_sceneEndpoint = (NSXPCListenerEndpoint *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSXPCListenerEndpoint)sceneEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSceneEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end