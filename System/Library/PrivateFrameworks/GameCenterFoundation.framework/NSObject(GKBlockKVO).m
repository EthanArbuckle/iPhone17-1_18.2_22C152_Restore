@interface NSObject(GKBlockKVO)
- (id)_gkAddObserverForKeyPath:()GKBlockKVO options:withBlock:;
- (void)_gkRemoveObserverWithBlockToken:()GKBlockKVO;
@end

@implementation NSObject(GKBlockKVO)

- (id)_gkAddObserverForKeyPath:()GKBlockKVO options:withBlock:
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__16;
  v35 = __Block_byref_object_dispose__16;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__16;
  v29 = __Block_byref_object_dispose__16;
  id v30 = 0;
  v10 = GKObserverMutationQueueCreatingIfNecessary();
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __67__NSObject_GKBlockKVO___gkAddObserverForKeyPath_options_withBlock___block_invoke;
  v18 = &unk_1E6472538;
  uint64_t v19 = a1;
  v22 = &v25;
  id v11 = v8;
  id v20 = v11;
  uint64_t v24 = a4;
  id v12 = v9;
  id v21 = v12;
  v23 = &v31;
  dispatch_sync(v10, &v15);

  objc_msgSend((id)v26[5], "startObserving", v15, v16, v17, v18, v19);
  id v13 = (id)v32[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v13;
}

- (void)_gkRemoveObserverWithBlockToken:()GKBlockKVO
{
  id v4 = a3;
  v5 = GKObserverMutationQueueCreatingIfNecessary();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__NSObject_GKBlockKVO___gkRemoveObserverWithBlockToken___block_invoke;
  v7[3] = &unk_1E646EC80;
  v7[4] = a1;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

@end