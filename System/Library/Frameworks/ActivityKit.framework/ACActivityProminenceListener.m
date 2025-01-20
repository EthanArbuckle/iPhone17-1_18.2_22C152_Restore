@interface ACActivityProminenceListener
- (ACActivityProminenceListener)init;
- (_TtC11ActivityKit35ActivityProminenceObservationClient)client;
- (id)listenForActivityProminence:(id)a3 withHandler:(id)a4;
- (void)setClient:(id)a3;
@end

@implementation ACActivityProminenceListener

- (ACActivityProminenceListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACActivityProminenceListener;
  v2 = [(ACActivityProminenceListener *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC11ActivityKit35ActivityProminenceObservationClient);
    client = v2->_client;
    v2->_client = v3;
  }
  return v2;
}

- (id)listenForActivityProminence:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  client = self->_client;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __72__ACActivityProminenceListener_listenForActivityProminence_withHandler___block_invoke;
  v17[3] = &unk_2651767E0;
  id v18 = v6;
  id v8 = v6;
  id v9 = a3;
  v10 = [(ActivityProminenceObservationClient *)client listenForActivityProminenceWithActivityIdentifier:v9 handler:v17];
  id v11 = objc_alloc(MEMORY[0x263F29CD8]);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__ACActivityProminenceListener_listenForActivityProminence_withHandler___block_invoke_2;
  v15[3] = &unk_2651767B8;
  id v16 = v10;
  id v12 = v10;
  v13 = (void *)[v11 initWithIdentifier:@"ACActivityProminenceListener" forReason:v9 invalidationBlock:v15];

  return v13;
}

uint64_t __72__ACActivityProminenceListener_listenForActivityProminence_withHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __72__ACActivityProminenceListener_listenForActivityProminence_withHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (_TtC11ActivityKit35ActivityProminenceObservationClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end