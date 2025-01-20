@interface MPCPlayerCommandRequest
- (MPCMediaRemoteController)controller;
- (MPCPlayerCommandRequest)initWithMediaRemoteCommand:(unsigned int)a3 options:(id)a4 controller:(id)a5 label:(id)a6;
- (MPCPlayerCommandRequest)initWithMediaRemoteCommand:(unsigned int)a3 options:(id)a4 playerPath:(id)a5 label:(id)a6;
- (MPCPlayerPath)playerPath;
- (NSDictionary)options;
- (NSDictionary)userInitiatedOptions;
- (NSString)label;
- (NSString)originalLabel;
- (id)description;
- (id)statusTransformer;
- (unsigned)command;
- (void)setCommandOptionValue:(id)a3 forKey:(id)a4;
- (void)setLabel:(id)a3;
- (void)setStatusTransformer:(id)a3;
- (void)setUserInitiatedOptions:(id)a3;
@end

@implementation MPCPlayerCommandRequest

- (MPCPlayerCommandRequest)initWithMediaRemoteCommand:(unsigned int)a3 options:(id)a4 controller:(id)a5 label:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  v14 = [v11 resolvedPlayerPath];
  v15 = [(MPCPlayerCommandRequest *)self initWithMediaRemoteCommand:v9 options:v13 playerPath:v14 label:v12];

  if (v15) {
    objc_storeStrong((id *)&v15->_controller, a5);
  }

  return v15;
}

- (MPCPlayerCommandRequest)initWithMediaRemoteCommand:(unsigned int)a3 options:(id)a4 playerPath:(id)a5 label:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MPCPlayerCommandRequest;
  id v13 = [(MPCPlayerCommandRequest *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_command = a3;
    uint64_t v15 = [v10 copy];
    options = v14->_options;
    v14->_options = (NSDictionary *)v15;

    uint64_t v17 = [v11 copy];
    playerPath = v14->_playerPath;
    v14->_playerPath = (MPCPlayerPath *)v17;

    uint64_t v19 = [v12 copy];
    label = v14->_label;
    v14->_label = (NSString *)v19;

    objc_storeStrong((id *)&v14->_originalLabel, v14->_label);
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusTransformer, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_userInitiatedOptions, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_originalLabel, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (void)setStatusTransformer:(id)a3
{
}

- (id)statusTransformer
{
  return self->_statusTransformer;
}

- (MPCPlayerPath)playerPath
{
  return self->_playerPath;
}

- (MPCMediaRemoteController)controller
{
  return self->_controller;
}

- (void)setUserInitiatedOptions:(id)a3
{
}

- (NSDictionary)userInitiatedOptions
{
  return self->_userInitiatedOptions;
}

- (NSDictionary)options
{
  return self->_options;
}

- (unsigned)command
{
  return self->_command;
}

- (NSString)originalLabel
{
  return self->_originalLabel;
}

- (NSString)label
{
  return self->_label;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = (void *)MRMediaRemoteCopyCommandDescription();
  v6 = [v3 stringWithFormat:@"<%@: %p command=%@>", v4, self, v5];

  return v6;
}

- (void)setLabel:(id)a3
{
  uint64_t v9 = (NSString *)a3;
  if (!v9) {
    uint64_t v9 = self->_originalLabel;
  }
  uint64_t v4 = self->_label;
  if (v9 == v4)
  {

    goto LABEL_7;
  }
  v5 = v9;
  int v6 = [(NSString *)v5 isEqual:v4];

  if (v6)
  {
LABEL_7:
    v7 = (NSString *)[(NSString *)v9 copy];
    label = self->_label;
    self->_label = v7;
  }
}

- (void)setCommandOptionValue:(id)a3 forKey:(id)a4
{
  options = self->_options;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[(NSDictionary *)options mutableCopy];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
  }
  id v14 = v11;

  [v14 setObject:v8 forKeyedSubscript:v7];
  id v12 = (NSDictionary *)[v14 copy];
  id v13 = self->_options;
  self->_options = v12;
}

@end