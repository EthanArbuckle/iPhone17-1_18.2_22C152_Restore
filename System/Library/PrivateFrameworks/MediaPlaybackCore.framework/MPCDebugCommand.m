@interface MPCDebugCommand
- (MPCDebugCommand)initWithMediaRemoteCommandType:(unsigned int)a3;
- (NSArray)supportedSubsystems;
- (NSDictionary)subsystemRevisions;
- (id)_mediaRemoteCommandInfoOptions;
- (void)setSubsystemRevisions:(id)a3;
- (void)setSupportedSubsystems:(id)a3;
@end

@implementation MPCDebugCommand

void __49__MPCDebugCommand__mediaRemoteCommandInfoOptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = *MEMORY[0x263F549F0];
  v10[0] = a3;
  v5 = NSDictionary;
  id v6 = a3;
  id v7 = a2;
  v8 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
}

- (void)setSupportedSubsystems:(id)a3
{
  v8 = (NSArray *)a3;
  v4 = self->_supportedSubsystems;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSArray *)[(NSArray *)v8 copy];
      supportedSubsystems = self->_supportedSubsystems;
      self->_supportedSubsystems = v6;

      [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
    }
  }
}

- (void)setSubsystemRevisions:(id)a3
{
  v8 = (NSDictionary *)a3;
  v4 = self->_subsystemRevisions;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      subsystemRevisions = self->_subsystemRevisions;
      self->_subsystemRevisions = v6;

      [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
    }
  }
}

- (id)_mediaRemoteCommandInfoOptions
{
  v17[2] = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSDictionary count](self->_subsystemRevisions, "count"));
  subsystemRevisions = self->_subsystemRevisions;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __49__MPCDebugCommand__mediaRemoteCommandInfoOptions__block_invoke;
  v14 = &unk_2643C41D0;
  id v15 = v3;
  id v5 = v3;
  [(NSDictionary *)subsystemRevisions enumerateKeysAndObjectsUsingBlock:&v11];
  supportedSubsystems = self->_supportedSubsystems;
  if (!supportedSubsystems) {
    supportedSubsystems = (NSArray *)MEMORY[0x263EFFA68];
  }
  uint64_t v7 = *MEMORY[0x263F54A78];
  v16[0] = *MEMORY[0x263F54A80];
  v16[1] = v7;
  id v8 = (id)MEMORY[0x263EFFA78];
  if (v5) {
    id v8 = v5;
  }
  v17[0] = supportedSubsystems;
  v17[1] = v8;
  uint64_t v9 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2, v11, v12, v13, v14);

  return v9;
}

- (MPCDebugCommand)initWithMediaRemoteCommandType:(unsigned int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MPCDebugCommand;
  v3 = [(MPRemoteCommand *)&v8 initWithMediaRemoteCommandType:*(void *)&a3];
  v4 = v3;
  if (v3)
  {
    supportedSubsystems = v3->_supportedSubsystems;
    v3->_supportedSubsystems = (NSArray *)MEMORY[0x263EFFA68];

    subsystemRevisions = v4->_subsystemRevisions;
    v4->_subsystemRevisions = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsystemRevisions, 0);

  objc_storeStrong((id *)&self->_supportedSubsystems, 0);
}

- (NSDictionary)subsystemRevisions
{
  return self->_subsystemRevisions;
}

- (NSArray)supportedSubsystems
{
  return self->_supportedSubsystems;
}

@end