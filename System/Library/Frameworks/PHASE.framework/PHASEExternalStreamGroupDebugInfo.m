@interface PHASEExternalStreamGroupDebugInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isControlled;
- (BOOL)isControllerPaused;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)streams;
- (PHASEExternalStreamGroupDebugInfo)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setControlled:(BOOL)a3;
- (void)setControllerPaused:(BOOL)a3;
- (void)setStreams:(id)a3;
@end

@implementation PHASEExternalStreamGroupDebugInfo

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v5 = [(PHASEExternalStreamGroupDebugInfo *)self isControlled];
  if (v5 == [v4 isControlled]
    && (int v6 = [(PHASEExternalStreamGroupDebugInfo *)self isControllerPaused],
        v6 == [v4 isControllerPaused]))
  {
    v8 = [(PHASEExternalStreamGroupDebugInfo *)self streams];
    v9 = [v4 streams];
    char v7 = [v8 isEqualToDictionary:v9];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeBool:self->_controlled forKey:@"controlled"];
  [v4 encodeBool:self->_controllerPaused forKey:@"controllerPaused"];
  [v4 encodeObject:self->_streams forKey:@"streams"];
}

- (PHASEExternalStreamGroupDebugInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PHASEExternalStreamGroupDebugInfo;
  int v5 = [(PHASEExternalStreamGroupDebugInfo *)&v14 init];
  if (v5)
  {
    v5->_controlled = [v4 decodeBoolForKey:@"controlled"];
    v5->_controllerPaused = [v4 decodeBoolForKey:@"controllerPaused"];
    int v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"streams"];
    streams = v5->_streams;
    v5->_streams = (NSDictionary *)v11;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<PHASEExternalStreamGroupDebugInfo:%p, isControlled=%d, isControllerPaused=%d, streams:", self, self->_controlled, self->_controllerPaused];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_streams;
  uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = [(NSDictionary *)self->_streams objectForKey:v8];
        [v3 appendFormat:@"\r%@ : %@", v8, v9];
      }
      uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  v10 = (void *)[v3 copy];

  return v10;
}

- (void)setControlled:(BOOL)a3
{
  self->_controlled = a3;
}

- (void)setControllerPaused:(BOOL)a3
{
  self->_controllerPaused = a3;
}

- (void)setStreams:(id)a3
{
  id v6 = a3;
  id v4 = (NSDictionary *)[v6 copy];
  streams = self->_streams;
  self->_streams = v4;
}

- (BOOL)isControlled
{
  return self->_controlled;
}

- (BOOL)isControllerPaused
{
  return self->_controllerPaused;
}

- (NSDictionary)streams
{
  return self->_streams;
}

- (void).cxx_destruct
{
}

@end