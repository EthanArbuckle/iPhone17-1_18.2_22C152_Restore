@interface NSItemProvider(LPExtras)
+ (id)_lp_itemProviderWithData:()LPExtras MIMEType:;
- (void)_lp_loadFirstDataRepresentationMatchingMIMETypePredicate:()LPExtras completionHandler:;
@end

@implementation NSItemProvider(LPExtras)

- (void)_lp_loadFirstDataRepresentationMatchingMIMETypePredicate:()LPExtras completionHandler:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  id v16 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v7 = [a1 registeredTypeIdentifiers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(v7);
      }
      v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
      id v12 = +[LPMIMETypeRegistry MIMETypeForUTI:v11];
      if (v6[2](v6, v12)) {
        break;
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v11;

    if (!v13) {
      goto LABEL_12;
    }
    v14 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__NSItemProvider_LPExtras___lp_loadFirstDataRepresentationMatchingMIMETypePredicate_completionHandler___block_invoke;
    block[3] = &unk_1E5B05550;
    block[4] = a1;
    id v15 = v13;
    id v18 = v15;
    id v20 = v16;
    id v12 = v12;
    id v19 = v12;
    dispatch_async(v14, block);
  }
  else
  {
LABEL_9:

    id v12 = 0;
LABEL_12:
    id v15 = 0;
    (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
  }
}

+ (id)_lp_itemProviderWithData:()LPExtras MIMEType:
{
  id v5 = a3;
  uint64_t v6 = +[LPMIMETypeRegistry UTIForMIMEType:a4];
  v7 = (void *)v6;
  id v8 = 0;
  if (v5 && v6)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28D78]);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__NSItemProvider_LPExtras___lp_itemProviderWithData_MIMEType___block_invoke;
    v10[3] = &unk_1E5B05578;
    id v11 = v5;
    [v8 registerDataRepresentationForTypeIdentifier:v7 visibility:0 loadHandler:v10];
  }

  return v8;
}

@end