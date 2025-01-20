@interface NSArray(DOCNode)
- (id)fpfs_syncFPItemsFromNodes;
@end

@implementation NSArray(DOCNode)

- (id)fpfs_syncFPItemsFromNodes
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  v3 = dispatch_group_create();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = a1;
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        dispatch_group_enter(v3);
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __45__NSArray_DOCNode__fpfs_syncFPItemsFromNodes__block_invoke;
        v12[3] = &unk_2641B5A60;
        v15 = v20;
        id v13 = v2;
        v14 = v3;
        [v7 fetchFPItem:v12];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v4);
  }

  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v8 = [v2 count];
  if (v8 == [obj count]) {
    id v9 = v2;
  }
  else {
    id v9 = (id)MEMORY[0x263EFFA68];
  }
  _Block_object_dispose(v20, 8);

  return v9;
}

@end