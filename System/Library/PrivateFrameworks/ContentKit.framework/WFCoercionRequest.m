@interface WFCoercionRequest
+ (id)_requestForCoercingToContentClasses:(id)a3 itemCompletionHandler:(id)a4;
+ (id)requestForCoercingToContentClasses:(id)a3 completionHandler:(id)a4;
+ (id)requestForCoercingToFileType:(id)a3 completionHandler:(id)a4;
+ (id)requestForCoercingToObjectClass:(Class)a3 completionHandler:(id)a4;
- (Class)objectClass;
- (NSArray)contentItemClasses;
- (WFCoercionOptions)options;
- (WFFileType)fileType;
- (id)contentCollectionResultHandler;
- (id)contentItemsCompletionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fileRepresentationResultHandler;
- (id)objectRepresentationResultHandler;
- (int64_t)requestType;
- (void)completeContentItemCoercionRequestWithResultItems:(id)a3 originalItem:(id)a4 error:(id)a5;
- (void)setOptions:(id)a3;
@end

@implementation WFCoercionRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItemClasses, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_objectClass, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_contentCollectionResultHandler, 0);
  objc_storeStrong(&self->_contentItemsCompletionHandler, 0);
  objc_storeStrong(&self->_fileRepresentationResultHandler, 0);
  objc_storeStrong(&self->_objectRepresentationResultHandler, 0);
}

- (NSArray)contentItemClasses
{
  return self->_contentItemClasses;
}

- (WFFileType)fileType
{
  return self->_fileType;
}

- (Class)objectClass
{
  return self->_objectClass;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setOptions:(id)a3
{
}

- (id)contentItemsCompletionHandler
{
  return self->_contentItemsCompletionHandler;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v4[6] = [(WFCoercionRequest *)self requestType];
  uint64_t v5 = [(objc_class *)[(WFCoercionRequest *)self objectClass] copy];
  v6 = (void *)v4[7];
  v4[7] = v5;

  v7 = [(WFCoercionRequest *)self objectRepresentationResultHandler];
  uint64_t v8 = [v7 copy];
  v9 = (void *)v4[1];
  v4[1] = v8;

  uint64_t v10 = [(WFCoercionRequest *)self fileType];
  v11 = (void *)v4[8];
  v4[8] = v10;

  v12 = [(WFCoercionRequest *)self fileRepresentationResultHandler];
  uint64_t v13 = [v12 copy];
  v14 = (void *)v4[2];
  v4[2] = v13;

  v15 = [(WFCoercionRequest *)self contentItemClasses];
  uint64_t v16 = [v15 copy];
  v17 = (void *)v4[9];
  v4[9] = v16;

  v18 = [(WFCoercionRequest *)self contentCollectionResultHandler];
  uint64_t v19 = [v18 copy];
  v20 = (void *)v4[4];
  v4[4] = v19;

  v21 = [(WFCoercionRequest *)self contentItemsCompletionHandler];
  uint64_t v22 = [v21 copy];
  v23 = (void *)v4[3];
  v4[3] = v22;

  v24 = [(WFCoercionRequest *)self options];
  uint64_t v25 = [v24 copy];
  v26 = (void *)v4[5];
  v4[5] = v25;

  return v4;
}

- (void)completeContentItemCoercionRequestWithResultItems:(id)a3 originalItem:(id)a4 error:(id)a5
{
  v17[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFCoercionRequest.m", 105, @"Invalid parameter not satisfying: %@", @"originalItem" object file lineNumber description];
  }
  contentItemsCompletionHandler = (void (**)(id, id, id))self->_contentItemsCompletionHandler;
  if (contentItemsCompletionHandler)
  {
    contentItemsCompletionHandler[2](contentItemsCompletionHandler, v9, v11);
  }
  else if (self->_contentCollectionResultHandler)
  {
    if (v9)
    {
      uint64_t v13 = +[WFContentCollection collectionWithItems:v9];
    }
    else
    {
      uint64_t v13 = 0;
    }
    if ([v9 count])
    {
      v14 = objc_opt_new();
    }
    else
    {
      v17[0] = v10;
      v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
      v14 = +[WFContentCollection collectionWithItems:v15];
    }
    (*((void (**)(void))self->_contentCollectionResultHandler + 2))();
  }
}

- (id)contentCollectionResultHandler
{
  id contentCollectionResultHandler = self->_contentCollectionResultHandler;
  if (contentCollectionResultHandler)
  {
    v4 = _Block_copy(contentCollectionResultHandler);
  }
  else
  {
    uint64_t v5 = _Block_copy(self->_contentItemsCompletionHandler);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__WFCoercionRequest_contentCollectionResultHandler__block_invoke;
    aBlock[3] = &unk_264286450;
    id v9 = v5;
    id v6 = v5;
    v4 = _Block_copy(aBlock);
  }
  return v4;
}

void __51__WFCoercionRequest_contentCollectionResultHandler__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v6 = a4;
    id v7 = [a2 items];
    (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
  }
}

- (id)objectRepresentationResultHandler
{
  if (self->_objectRepresentationResultHandler) {
    id objectRepresentationResultHandler = self->_objectRepresentationResultHandler;
  }
  else {
    id objectRepresentationResultHandler = &__block_literal_global_170;
  }
  v3 = _Block_copy(objectRepresentationResultHandler);
  return v3;
}

- (id)fileRepresentationResultHandler
{
  if (self->_fileRepresentationResultHandler) {
    id fileRepresentationResultHandler = self->_fileRepresentationResultHandler;
  }
  else {
    id fileRepresentationResultHandler = &__block_literal_global_3341;
  }
  v3 = _Block_copy(fileRepresentationResultHandler);
  return v3;
}

- (WFCoercionOptions)options
{
  options = self->_options;
  if (!options)
  {
    uint64_t v4 = +[WFCoercionOptions new];
    uint64_t v5 = self->_options;
    self->_options = v4;

    options = self->_options;
  }
  return options;
}

+ (id)_requestForCoercingToContentClasses:(id)a3 itemCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"WFCoercionRequest.m", 65, @"Invalid parameter not satisfying: %@", @"contentItemClasses" object file lineNumber description];
  }
  uint64_t v9 = objc_opt_new();
  id v10 = (void *)v9;
  if (v9)
  {
    *(void *)(v9 + 48) = 2;
    uint64_t v11 = [v8 copy];
    v12 = (void *)v10[3];
    v10[3] = v11;

    uint64_t v13 = [v7 copy];
    v14 = (void *)v10[9];
    v10[9] = v13;

    v15 = v10;
  }

  return v10;
}

+ (id)requestForCoercingToContentClasses:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"WFCoercionRequest.m", 52, @"Invalid parameter not satisfying: %@", @"contentItemClasses" object file lineNumber description];
  }
  uint64_t v9 = objc_opt_new();
  id v10 = (void *)v9;
  if (v9)
  {
    *(void *)(v9 + 48) = 2;
    uint64_t v11 = [v8 copy];
    v12 = (void *)v10[4];
    v10[4] = v11;

    uint64_t v13 = [v7 copy];
    v14 = (void *)v10[9];
    v10[9] = v13;

    v15 = v10;
  }

  return v10;
}

+ (id)requestForCoercingToFileType:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = v8;
  if (v8)
  {
    *(void *)(v8 + 48) = 1;
    uint64_t v10 = [v7 copy];
    uint64_t v11 = *(void **)(v9 + 16);
    *(void *)(v9 + 16) = v10;

    objc_storeStrong((id *)(v9 + 64), a3);
    id v12 = (id)v9;
  }

  return (id)v9;
}

+ (id)requestForCoercingToObjectClass:(Class)a3 completionHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = v6;
  if (v6)
  {
    *(void *)(v6 + 48) = 0;
    uint64_t v8 = [v5 copy];
    uint64_t v9 = *(void **)(v7 + 8);
    *(void *)(v7 + 8) = v8;

    objc_storeStrong((id *)(v7 + 56), a3);
    id v10 = (id)v7;
  }

  return (id)v7;
}

@end