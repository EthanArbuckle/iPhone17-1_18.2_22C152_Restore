@interface MTLLibrary
@end

@implementation MTLLibrary

uint64_t __92___MTLLibrary_newFunctionWithDescriptor_destinationArchive_functionCache_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (!a2) {
    goto LABEL_8;
  }
  if (**(void **)(*(void *)(a1 + 32) + 48) && ([*(id *)(a1 + 40) options] & 0x10) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(uint64_t **)(v5 + 48);
    if ((void *)v4 == a2) {
      MTLPipelineCollection::addFunction(*v6, (uint64_t)a2, *(void *)(v5 + 32), [*(id *)(a1 + 40) options]);
    }
    else {
      MTLPipelineCollection::addSpecializedFunction(*v6, v4, (uint64_t)a2, v5, *(void *)(a1 + 40));
    }
  }
  objc_msgSend(a2, "setOptions:", objc_msgSend(*(id *)(a1 + 40), "options"));
  if ([*(id *)(a1 + 40) options])
  {
    v9 = (void *)[*(id *)(a1 + 32) device];
    uint64_t v10 = *(void *)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __92___MTLLibrary_newFunctionWithDescriptor_destinationArchive_functionCache_completionHandler___block_invoke_2;
    v12[3] = &unk_1E52210D8;
    uint64_t v11 = *(void *)(a1 + 56);
    v12[4] = a2;
    v12[5] = v11;
    return [v9 compileVisibleFunction:a2 withDescriptor:v10 completionHandler:v12];
  }
  else
  {
LABEL_8:
    v7 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v7();
  }
}

uint64_t __92___MTLLibrary_newFunctionWithDescriptor_destinationArchive_functionCache_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {

  }
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

@end