@interface IKJSViewModelService
- (id)openLinkForType:(id)a3 document:(id)a4 extraInfo:(id)a5;
@end

@implementation IKJSViewModelService

- (id)openLinkForType:(id)a3 document:(id)a4 extraInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [IKJSViewModelLink alloc];
  v12 = [(IKJSObject *)self appContext];
  v13 = [(IKJSObject *)v11 initWithAppContext:v12];

  [(IKJSViewModelLink *)v13 setDocument:v10];
  if (v9)
  {
    v14 = (void *)[v9 mutableCopy];
  }
  else
  {
    v14 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  }
  v15 = v14;
  [v14 setObject:v8 forKeyedSubscript:@"requestType"];
  v16 = [(IKJSObject *)self appContext];
  v17 = [v16 jsApp];

  v18 = (void *)[v15 copy];
  char v19 = [v17 requestDocumentWithContext:v18 response:v13];

  if ((v19 & 1) == 0)
  {
    [v15 setObject:v13 forKeyedSubscript:@"viewModelLink"];
    v20 = (void *)[v15 copy];
    [(IKJSEventListenerObject *)self invokeSingleListener:v8 extraInfo:v20 return:0];
  }
  v21 = v13;
  v22 = [(IKJSObject *)self appContext];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __59__IKJSViewModelService_openLinkForType_document_extraInfo___block_invoke;
  v24[3] = &__block_descriptor_40_e19_v16__0__JSContext_8l;
  v24[4] = v21;
  [v22 addPostEvaluateBlock:v24];

  return v21;
}

void __59__IKJSViewModelService_openLinkForType_document_extraInfo___block_invoke(uint64_t a1)
{
}

@end