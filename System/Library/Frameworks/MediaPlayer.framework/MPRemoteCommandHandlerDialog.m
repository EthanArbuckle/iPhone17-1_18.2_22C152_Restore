@interface MPRemoteCommandHandlerDialog
+ (id)dialogWithTitle:(id)a3 message:(id)a4;
- (MPRemoteCommandHandlerDialog)initWithMediaRemoteType:(id)a3;
- (MRSendCommandHandlerDialog)mediaRemoteType;
- (NSArray)actions;
- (NSString)localizedMessage;
- (NSString)localizedTitle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)addAction:(id)a3;
- (void)setLocalizedMessage:(id)a3;
- (void)setLocalizedTitle:(id)a3;
@end

@implementation MPRemoteCommandHandlerDialog

- (void).cxx_destruct
{
}

- (MRSendCommandHandlerDialog)mediaRemoteType
{
  return self->_mediaRemoteType;
}

- (NSArray)actions
{
  v2 = [(MPRemoteCommandHandlerDialog *)self mediaRemoteType];
  v3 = [v2 actions];
  v4 = objc_msgSend(v3, "msv_map:", &__block_literal_global_33593);

  return (NSArray *)v4;
}

MPRemoteCommandHandlerDialogAction *__39__MPRemoteCommandHandlerDialog_actions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MPRemoteCommandHandlerDialogAction alloc] initWithMediaRemoteType:v2];

  return v3;
}

- (void)setLocalizedMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(MPRemoteCommandHandlerDialog *)self mediaRemoteType];
  [v5 setLocalizedMessage:v4];
}

- (NSString)localizedMessage
{
  id v2 = [(MPRemoteCommandHandlerDialog *)self mediaRemoteType];
  v3 = [v2 localizedMessage];

  return (NSString *)v3;
}

- (void)setLocalizedTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(MPRemoteCommandHandlerDialog *)self mediaRemoteType];
  [v5 setLocalizedTitle:v4];
}

- (NSString)localizedTitle
{
  id v2 = [(MPRemoteCommandHandlerDialog *)self mediaRemoteType];
  v3 = [v2 localizedTitle];

  return (NSString *)v3;
}

- (void)addAction:(id)a3
{
  id v16 = a3;
  uint64_t v4 = [v16 type];
  id v5 = [v16 event];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F770E0];
    v7 = [v16 event];
    v8 = [v7 command];
    uint64_t v9 = [v8 mediaRemoteCommandType];
    v10 = [v16 event];
    v11 = [v10 mediaRemoteOptions];
    id v5 = [v6 eventWithCommand:v9 options:v11];
  }
  if (v4 != 2) {
    uint64_t v4 = v4 == 1;
  }
  v12 = (void *)MEMORY[0x1E4F770D8];
  v13 = [v16 title];
  v14 = [v12 actionWithTitle:v13 type:v4 commandEvent:v5];

  v15 = [(MPRemoteCommandHandlerDialog *)self mediaRemoteType];
  [v15 addAction:v14];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(MPRemoteCommandHandlerDialog *)self mediaRemoteType];
  id v5 = (void *)[v4 copyWithZone:a3];

  v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithMediaRemoteType:", v5);
  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MPRemoteCommandHandlerDialog *)self localizedTitle];
  v6 = [(MPRemoteCommandHandlerDialog *)self localizedMessage];
  v7 = [(MPRemoteCommandHandlerDialog *)self actions];
  v8 = [v3 stringWithFormat:@"<%@: %p title=\"%@\" message=\"%@\" actions=%@>", v4, self, v5, v6, v7];

  return v8;
}

- (MPRemoteCommandHandlerDialog)initWithMediaRemoteType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPRemoteCommandHandlerDialog;
  v6 = [(MPRemoteCommandHandlerDialog *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaRemoteType, a3);
  }

  return v7;
}

+ (id)dialogWithTitle:(id)a3 message:(id)a4
{
  id v5 = [MEMORY[0x1E4F770D0] dialogWithTitle:a3 message:a4];
  v6 = (void *)[objc_alloc((Class)a1) initWithMediaRemoteType:v5];

  return v6;
}

@end