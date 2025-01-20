@interface MPCPlayerCommandDialogAction
- (MPCPlayerCommandDialogAction)initWithMPAction:(id)a3 request:(id)a4;
- (NSString)localizedTitle;
- (id)commandRequest;
- (id)description;
- (int64_t)type;
@end

@implementation MPCPlayerCommandDialogAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

- (id)commandRequest
{
  v3 = [(MPRemoteCommandHandlerDialogAction *)self->_action event];

  if (v3)
  {
    v4 = [MPCPlayerCommandRequest alloc];
    v5 = [(MPRemoteCommandHandlerDialogAction *)self->_action event];
    uint64_t v6 = [v5 mediaRemoteCommandType];
    v7 = [(MPRemoteCommandHandlerDialogAction *)self->_action event];
    v8 = [v7 mediaRemoteOptions];
    v9 = NSString;
    controller = self->_controller;
    v11 = [(MPRemoteCommandHandlerDialogAction *)self->_action title];
    v12 = [v9 stringWithFormat:@"DialogAction:%@", v11];
    v13 = [(MPCPlayerCommandRequest *)v4 initWithMediaRemoteCommand:v6 options:v8 controller:controller label:v12];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)localizedTitle
{
  return (NSString *)[(MPRemoteCommandHandlerDialogAction *)self->_action title];
}

- (int64_t)type
{
  int64_t result = [(MPRemoteCommandHandlerDialogAction *)self->_action type];
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MPRemoteCommandHandlerDialogAction *)self->_action title];
  [(MPRemoteCommandHandlerDialogAction *)self->_action type];
  uint64_t v6 = NSStringFromMPRemoteCommandHandlerDialogActionType();
  v7 = [(MPCPlayerCommandDialogAction *)self commandRequest];
  v8 = [v3 stringWithFormat:@"<%@: %p title=\"%@\" type=%@ commandRequest=%@>", v4, self, v5, v6, v7];

  return v8;
}

- (MPCPlayerCommandDialogAction)initWithMPAction:(id)a3 request:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPCPlayerCommandDialogAction;
  v9 = [(MPCPlayerCommandDialogAction *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_action, a3);
    uint64_t v11 = [v8 controller];
    controller = v10->_controller;
    v10->_controller = (MPCMediaRemoteController *)v11;
  }
  return v10;
}

@end