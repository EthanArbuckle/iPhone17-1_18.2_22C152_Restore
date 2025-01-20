@interface ExportedMessageChannel
- (ExportedMessageChannel)initWithMessageChannel:(id)a3;
- (void)onCallRemoteAU:(id)a3 reply:(id)a4;
@end

@implementation ExportedMessageChannel

- (void).cxx_destruct
{
}

- (void)onCallRemoteAU:(id)a3 reply:(id)a4
{
  id v12 = a3;
  v6 = (void (**)(id, void, void *))a4;
  p_messageChannel = &self->_messageChannel;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageChannel);
  if (WeakRetained
    && (id v9 = objc_loadWeakRetained((id *)p_messageChannel),
        [v9 callHostBlock],
        v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(),
        v9,
        v10))
  {
    v11 = ((void (**)(void, id))v10)[2](v10, v12);
    v6[2](v6, 0, v11);
  }
  else
  {

    v6[2](v6, 0, 0);
  }
}

- (ExportedMessageChannel)initWithMessageChannel:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ExportedMessageChannel;
  v5 = [(ExportedMessageChannel *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_messageChannel, v4);
  }

  return v6;
}

@end