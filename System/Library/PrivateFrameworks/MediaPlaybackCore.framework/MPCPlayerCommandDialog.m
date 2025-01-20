@interface MPCPlayerCommandDialog
- (MPCPlayerCommandDialog)initWithMPDialog:(id)a3 request:(id)a4;
- (NSArray)actions;
- (NSString)localizedMessage;
- (NSString)localizedTitle;
- (id)description;
@end

@implementation MPCPlayerCommandDialog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);

  objc_storeStrong((id *)&self->_dialog, 0);
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSString)localizedMessage
{
  return (NSString *)[(MPRemoteCommandHandlerDialog *)self->_dialog localizedMessage];
}

- (NSString)localizedTitle
{
  return (NSString *)[(MPRemoteCommandHandlerDialog *)self->_dialog localizedTitle];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MPCPlayerCommandDialog *)self localizedTitle];
  v6 = [(MPCPlayerCommandDialog *)self localizedMessage];
  v7 = [(MPCPlayerCommandDialog *)self actions];
  v8 = [v3 stringWithFormat:@"<%@: %p title=\"%@\" message=\"%@\" actions=%@>", v4, self, v5, v6, v7];

  return v8;
}

- (MPCPlayerCommandDialog)initWithMPDialog:(id)a3 request:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MPCPlayerCommandDialog;
  v9 = [(MPCPlayerCommandDialog *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dialog, a3);
    v11 = [(MPRemoteCommandHandlerDialog *)v10->_dialog actions];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __51__MPCPlayerCommandDialog_initWithMPDialog_request___block_invoke;
    v15[3] = &unk_2643C0C18;
    id v16 = v8;
    uint64_t v12 = objc_msgSend(v11, "msv_map:", v15);
    actions = v10->_actions;
    v10->_actions = (NSArray *)v12;
  }
  return v10;
}

MPCPlayerCommandDialogAction *__51__MPCPlayerCommandDialog_initWithMPDialog_request___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[MPCPlayerCommandDialogAction alloc] initWithMPAction:v3 request:*(void *)(a1 + 32)];

  return v4;
}

@end