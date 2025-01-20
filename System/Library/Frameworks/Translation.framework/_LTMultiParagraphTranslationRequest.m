@interface _LTMultiParagraphTranslationRequest
- (NSArray)paragraphRequests;
- (NSString)text;
- (_LTMultiParagraphTranslationRequest)initWithText:(id)a3 localePair:(id)a4 completionHandler:(id)a5;
- (void)_cleanUp;
- (void)_generateParagraphRequests;
@end

@implementation _LTMultiParagraphTranslationRequest

- (_LTMultiParagraphTranslationRequest)initWithText:(id)a3 localePair:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_LTMultiParagraphTranslationRequest;
  v11 = [(_LTMultiParagraphTranslationRequest *)&v22 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    text = v11->_text;
    v11->_text = (NSString *)v12;

    objc_storeStrong((id *)&v11->_localePair, a4);
    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    completedResultMap = v11->_completedResultMap;
    v11->_completedResultMap = (NSMutableDictionary *)v14;

    v16 = _Block_copy(v10);
    id completionHandler = v11->_completionHandler;
    v11->_id completionHandler = v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.translation.MultiParagraphRequest", 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v18;

    [(_LTMultiParagraphTranslationRequest *)v11 _generateParagraphRequests];
    v20 = v11;
  }

  return v11;
}

- (void)_generateParagraphRequests
{
  v20[1] = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:self->_text];
  v4 = [v3 paragraphs];
  if (![v4 count])
  {
    v20[0] = v3;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];

    v4 = (void *)v5;
  }
  dispatch_group_t v6 = dispatch_group_create();
  v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65___LTMultiParagraphTranslationRequest__generateParagraphRequests__block_invoke;
  v15[3] = &unk_2651DBF50;
  objc_copyWeak(&v18, &location);
  id v8 = v6;
  v16 = v8;
  id v9 = v7;
  id v17 = v9;
  [v4 enumerateObjectsUsingBlock:v15];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65___LTMultiParagraphTranslationRequest__generateParagraphRequests__block_invoke_9;
  block[3] = &unk_2651DBA48;
  objc_copyWeak(&v14, &location);
  dispatch_group_notify(v8, queue, block);
  v11 = (NSArray *)[v9 copy];
  paragraphRequests = self->_paragraphRequests;
  self->_paragraphRequests = v11;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_cleanUp
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  completedResultMap = self->_completedResultMap;

  [(NSMutableDictionary *)completedResultMap removeAllObjects];
}

- (NSString)text
{
  return self->_text;
}

- (NSArray)paragraphRequests
{
  return self->_paragraphRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_completedResultMap, 0);
  objc_storeStrong((id *)&self->_paragraphRequests, 0);

  objc_storeStrong((id *)&self->_localePair, 0);
}

@end