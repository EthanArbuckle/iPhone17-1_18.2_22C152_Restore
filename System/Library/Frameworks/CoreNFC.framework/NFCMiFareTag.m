@interface NFCMiFareTag
- (NFCMiFareTag)initWithSession:(id)a3 tag:(id)a4 startupConfig:(int64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)mifareFamily;
- (void)sendMiFareCommand:(id)a3 completionHandler:(id)a4;
- (void)sendMiFareISO7816Command:(id)a3 completionHandler:(id)a4;
- (void)setMifareFamily:(unint64_t)a3;
@end

@implementation NFCMiFareTag

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NFCMiFareTag;
  return [(NFCTag *)&v4 copyWithZone:a3];
}

- (NFCMiFareTag)initWithSession:(id)a3 tag:(id)a4 startupConfig:(int64_t)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NFCMiFareTag;
  v9 = [(NFCTag *)&v13 initWithSession:a3 tag:v8 startupConfig:a5];
  if (v9)
  {
    uint64_t v10 = [v8 type] - 14;
    if (v10 >= 3) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10 + 2;
    }
    v9->_mifareFamily = v11;
  }

  return v9;
}

- (void)sendMiFareCommand:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _os_activity_create(&dword_2214B8000, "NFCMiFareTag sendMiFareCommand:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__NFCMiFareTag_sendMiFareCommand_completionHandler___block_invoke;
  v10[3] = &unk_2645B42E0;
  id v11 = v6;
  id v9 = v6;
  [(NFCTag *)self _transceiveWithData:v7 completionHandler:v10];
}

uint64_t __52__NFCMiFareTag_sendMiFareCommand_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendMiFareISO7816Command:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_2214B8000, "NFCMiFareTag sendMiFareISO7816Command:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  if (self->_mifareFamily - 3 >= 2)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __59__NFCMiFareTag_sendMiFareISO7816Command_completionHandler___block_invoke;
    v10[3] = &unk_2645B4308;
    id v11 = v7;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v10];
    id v9 = v11;
  }
  else
  {
    id v9 = [v6 asData];
    [(NFCTag *)self _sendAPDU:v9 completionHandler:v7];
  }
}

void __59__NFCMiFareTag_sendMiFareISO7816Command_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)objc_opt_new();
  v2 = +[NFCError errorWithCode:1];
  (*(void (**)(uint64_t, id, void, void, void *))(v1 + 16))(v1, v3, 0, 0, v2);
}

- (unint64_t)mifareFamily
{
  return self->_mifareFamily;
}

- (void)setMifareFamily:(unint64_t)a3
{
  self->_mifareFamily = a3;
}

@end