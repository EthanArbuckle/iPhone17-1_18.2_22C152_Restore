@interface MSPStorageTip
- (MSPStorageTip)initWithTitle:(id)a3 message:(id)a4 expectedSize:(int64_t)a5 enablementAction:(id)a6;
- (NSString)message;
- (NSString)representedApp;
- (NSString)title;
- (int64_t)expectedSize;
- (void)enableWithCompletionHandler:(id)a3;
@end

@implementation MSPStorageTip

- (MSPStorageTip)initWithTitle:(id)a3 message:(id)a4 expectedSize:(int64_t)a5 enablementAction:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MSPStorageTip;
  v13 = [(MSPStorageTip *)&v22 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    title = v13->_title;
    v13->_title = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    message = v13->_message;
    v13->_message = (NSString *)v16;

    v13->_expectedSize = a5;
    uint64_t v18 = [v12 copy];
    id enablementAction = v13->_enablementAction;
    v13->_id enablementAction = (id)v18;

    v20 = v13;
  }

  return v13;
}

- (NSString)representedApp
{
  return (NSString *)(id)*MEMORY[0x1E4F64320];
}

- (void)enableWithCompletionHandler:(id)a3
{
  id v4 = a3;
  global_queue = geo_get_global_queue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__MSPStorageTip_enableWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E617E298;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(global_queue, v7);
}

void __45__MSPStorageTip_enableWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__MSPStorageTip_enableWithCompletionHandler___block_invoke_2;
  v2[3] = &unk_1E617DA20;
  id v3 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

void __45__MSPStorageTip_enableWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__MSPStorageTip_enableWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_1E617D7A0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __45__MSPStorageTip_enableWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (int64_t)expectedSize
{
  return self->_expectedSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong(&self->_enablementAction, 0);
}

@end