@interface WFContentCollection
@end

@implementation WFContentCollection

void __94__WFContentCollection_ShareableObjects__getShareableObjectsOfTypes_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    v8 = [v6 items];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __94__WFContentCollection_ShareableObjects__getShareableObjectsOfTypes_options_completionHandler___block_invoke_2;
    v12[3] = &__block_descriptor_48_e73_v32__0__WFContentItem_8Q16___v_____WFSystemShareableObject____NSError__24l;
    long long v13 = *(_OWORD *)(a1 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __94__WFContentCollection_ShareableObjects__getShareableObjectsOfTypes_options_completionHandler___block_invoke_3;
    v9[3] = &unk_264E5E4B8;
    id v11 = *(id *)(a1 + 32);
    id v10 = v6;
    objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v12, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __94__WFContentCollection_ShareableObjects__getShareableObjectsOfTypes_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 getShareableObjectOfTypes:*(void *)(a1 + 32) options:*(void *)(a1 + 40) completionHandler:a4];
}

void __94__WFContentCollection_ShareableObjects__getShareableObjectsOfTypes_options_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 attributionSet];
  (*(void (**)(uint64_t, id, id, id))(v4 + 16))(v4, v7, v8, v6);
}

@end