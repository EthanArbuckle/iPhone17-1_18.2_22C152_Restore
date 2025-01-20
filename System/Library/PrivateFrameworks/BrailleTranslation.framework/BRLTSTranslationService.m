@interface BRLTSTranslationService
- (BRLTSTranslationService)init;
- (BRLTSTranslator)queueTranslator;
- (OS_dispatch_queue)queue;
- (void)brailleForText:(id)a3 parameters:(id)a4 withReply:(id)a5;
- (void)loadBrailleBundleForIdentifier:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQueueTranslator:(id)a3;
- (void)textForBraille:(id)a3 parameters:(id)a4 withReply:(id)a5;
@end

@implementation BRLTSTranslationService

- (BRLTSTranslationService)init
{
  v7.receiver = self;
  v7.super_class = (Class)BRLTSTranslationService;
  v2 = [(BRLTSTranslationService *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.accessibility.BrailleTranslation.BrailleTranslationService.serviceQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)brailleForText:(id)a3 parameters:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(BRLTSTranslationService *)self queue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63__BRLTSTranslationService_brailleForText_parameters_withReply___block_invoke;
  v15[3] = &unk_26440BCA0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __63__BRLTSTranslationService_brailleForText_parameters_withReply___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    v2 = [*(id *)(a1 + 32) queueTranslator];
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v7 = 0;
    v5 = [v2 brailleForText:v3 parameters:v4 locations:&v7];
    id v6 = v7;

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)textForBraille:(id)a3 parameters:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(BRLTSTranslationService *)self queue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63__BRLTSTranslationService_textForBraille_parameters_withReply___block_invoke;
  v15[3] = &unk_26440BCA0;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __63__BRLTSTranslationService_textForBraille_parameters_withReply___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    uint64_t v2 = [*(id *)(a1 + 32) textPositionsRange];
    uint64_t v3 = [*(id *)(a1 + 40) queueTranslator];
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = [v3 textForBraille:v5 parameters:v6 locations:0];

      id v8 = 0;
    }
    else
    {
      id v9 = 0;
      id v7 = [v3 textForBraille:v5 parameters:v6 locations:&v9];
      id v8 = v9;
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)loadBrailleBundleForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRLTSTranslationService *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__BRLTSTranslationService_loadBrailleBundleForIdentifier___block_invoke;
  v7[3] = &unk_26440BCC8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__BRLTSTranslationService_loadBrailleBundleForIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x263F086E0], "brl_brailleTableBundleWithIdentifier:", *(void *)(a1 + 32));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [*(id *)(a1 + 40) queueTranslator];
  uint64_t v3 = [v2 bundle];
  char v4 = [v3 isEqual:v6];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [[BRLTSTranslator alloc] initWithBundle:v6];
    [*(id *)(a1 + 40) setQueueTranslator:v5];
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BRLTSTranslator)queueTranslator
{
  return self->_queueTranslator;
}

- (void)setQueueTranslator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueTranslator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end