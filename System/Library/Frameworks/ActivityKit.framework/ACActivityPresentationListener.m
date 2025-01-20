@interface ACActivityPresentationListener
- (ACActivityPresentationListener)init;
- (_TtC11ActivityKit37ActivityPresentationObservationClient)client;
- (id)listenForActivityPresentation:(id)a3 presenterBundleIdentifier:(id)a4 withHandler:(id)a5;
- (void)setClient:(id)a3;
@end

@implementation ACActivityPresentationListener

- (ACActivityPresentationListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACActivityPresentationListener;
  v2 = [(ACActivityPresentationListener *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC11ActivityKit37ActivityPresentationObservationClient);
    client = v2->_client;
    v2->_client = v3;
  }
  return v2;
}

- (id)listenForActivityPresentation:(id)a3 presenterBundleIdentifier:(id)a4 withHandler:(id)a5
{
  id v8 = a5;
  client = self->_client;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __102__ACActivityPresentationListener_listenForActivityPresentation_presenterBundleIdentifier_withHandler___block_invoke;
  v19[3] = &unk_265176790;
  id v20 = v8;
  id v10 = v8;
  id v11 = a3;
  v12 = [(ActivityPresentationObservationClient *)client listenForActivityPresentationWithActivityIdentifier:v11 presenterBundleIdentifier:a4 handler:v19];
  id v13 = objc_alloc(MEMORY[0x263F29CD8]);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __102__ACActivityPresentationListener_listenForActivityPresentation_presenterBundleIdentifier_withHandler___block_invoke_2;
  v17[3] = &unk_2651767B8;
  id v18 = v12;
  id v14 = v12;
  v15 = (void *)[v13 initWithIdentifier:@"ACActivityPresentationListener" forReason:v11 invalidationBlock:v17];

  return v15;
}

uint64_t __102__ACActivityPresentationListener_listenForActivityPresentation_presenterBundleIdentifier_withHandler___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2 > 6) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = qword_242FDDB50[a2];
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

uint64_t __102__ACActivityPresentationListener_listenForActivityPresentation_presenterBundleIdentifier_withHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (_TtC11ActivityKit37ActivityPresentationObservationClient)client
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