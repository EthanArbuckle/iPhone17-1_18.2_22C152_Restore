@interface PHASEServiceSharedEntityDebugInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)sessionSharedRoots;
- (PHASEServiceSharedEntityDebugInfo)initWithCoder:(id)a3;
- (PHASESharedListenerDebugInfo)sharedListener;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSessionSharedRoots:(id)a3;
- (void)setSharedListener:(id)a3;
@end

@implementation PHASEServiceSharedEntityDebugInfo

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(PHASEServiceSharedEntityDebugInfo *)self sharedListener];
  v6 = [v4 sharedListener];
  if ([v5 isEqual:v6])
  {
    v7 = [(PHASEServiceSharedEntityDebugInfo *)self sessionSharedRoots];
    v8 = [v4 sessionSharedRoots];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_sharedListener forKey:@"sharedListener"];
  [v4 encodeObject:self->_sessionSharedRoots forKey:@"sessionSharedRoots"];
}

- (PHASEServiceSharedEntityDebugInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PHASEServiceSharedEntityDebugInfo;
  v5 = [(PHASEServiceSharedEntityDebugInfo *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedListener"];
    sharedListener = v5->_sharedListener;
    v5->_sharedListener = (PHASESharedListenerDebugInfo *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"sessionSharedRoots"];
    sessionSharedRoots = v5->_sessionSharedRoots;
    v5->_sessionSharedRoots = (NSDictionary *)v13;
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
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<PHASEServiceSharedEntityDebugInfo:%p sharedListener=%@, sessionSharedRoots:", self, self->_sharedListener];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_sessionSharedRoots;
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
        uint64_t v9 = [(NSDictionary *)self->_sessionSharedRoots objectForKey:v8];
        [v3 appendFormat:@"\r%@ : %@", v8, v9, (void)v12];
      }
      uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  uint64_t v10 = (void *)[v3 copy];

  return v10;
}

- (void)setSharedListener:(id)a3
{
}

- (void)setSessionSharedRoots:(id)a3
{
  id v6 = a3;
  id v4 = (NSDictionary *)[v6 copy];
  sessionSharedRoots = self->_sessionSharedRoots;
  self->_sessionSharedRoots = v4;
}

- (PHASESharedListenerDebugInfo)sharedListener
{
  return self->_sharedListener;
}

- (NSDictionary)sessionSharedRoots
{
  return self->_sessionSharedRoots;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionSharedRoots, 0);

  objc_storeStrong((id *)&self->_sharedListener, 0);
}

@end