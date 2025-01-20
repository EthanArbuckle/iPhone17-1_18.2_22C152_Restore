@interface _MPCPlayerActionAtQueueEndCommand
- (NSArray)supportedActions;
- (id)setQueueEndAction:(int64_t)a3;
- (int64_t)actionAtQueueEnd;
- (void)setActionAtQueueEnd:(int64_t)a3;
- (void)setSupportedActions:(id)a3;
@end

@implementation _MPCPlayerActionAtQueueEndCommand

- (void).cxx_destruct
{
}

- (void)setSupportedActions:(id)a3
{
}

- (NSArray)supportedActions
{
  return self->_supportedActions;
}

- (void)setActionAtQueueEnd:(int64_t)a3
{
  self->_actionAtQueueEnd = a3;
}

- (int64_t)actionAtQueueEnd
{
  return self->_actionAtQueueEnd;
}

- (id)setQueueEndAction:(int64_t)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  supportedActions = self->_supportedActions;
  v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  LODWORD(supportedActions) = [(NSArray *)supportedActions containsObject:v6];

  if (supportedActions)
  {
    v7 = [(_MPCPlayerCommand *)self response];
    v8 = [MPCPlayerCommandRequest alloc];
    uint64_t v19 = *MEMORY[0x263F54D48];
    v9 = [NSNumber numberWithInteger:a3];
    v20[0] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v11 = [v7 controller];
    v12 = [v7 request];
    v13 = [v12 label];
    v14 = [(MPCPlayerCommandRequest *)v8 initWithMediaRemoteCommand:135 options:v10 controller:v11 label:v13];

    uint64_t v17 = *MEMORY[0x263F54A10];
    uint64_t v18 = MEMORY[0x263EFFA88];
    v15 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    [(MPCPlayerCommandRequest *)v14 setUserInitiatedOptions:v15];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end