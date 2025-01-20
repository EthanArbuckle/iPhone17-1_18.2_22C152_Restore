@interface __NSCFURLSessionTaskDependencyTreeNode
- (__NSCFURLSessionTaskDependencyTreeNode)init;
- (uint64_t)buildTree:(void *)a3 parentsToDependencies:(void *)a4 parentsToChildren:;
- (uint64_t)makePriorityInfoStartingFromStreamID:(uint64_t)a3 parentStream:(void *)a4 priorityInfo:(void *)a5 dependentToParentStreamIDs:(void *)a6 parentToParentStreamIDs:;
- (void)dealloc;
@end

@implementation __NSCFURLSessionTaskDependencyTreeNode

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 8);
    objc_setProperty_nonatomic(self, v3, 0, 16);
    objc_setProperty_nonatomic(self, v4, 0, 24);
    objc_setProperty_nonatomic(self, v5, 0, 32);
    objc_setProperty_nonatomic(self, v6, 0, 40);
    objc_setProperty_nonatomic(self, v7, 0, 48);
  }
  v8.receiver = self;
  v8.super_class = (Class)__NSCFURLSessionTaskDependencyTreeNode;
  [(__NSCFURLSessionTaskDependencyTreeNode *)&v8 dealloc];
}

- (__NSCFURLSessionTaskDependencyTreeNode)init
{
  v6.receiver = self;
  v6.super_class = (Class)__NSCFURLSessionTaskDependencyTreeNode;
  v2 = [(__NSCFURLSessionTaskDependencyTreeNode *)&v6 init];
  if (v2)
  {
    SEL v3 = (void *)[MEMORY[0x1E4F1CA48] array];
    objc_setProperty_nonatomic(v2, v4, v3, 16);
  }
  return v2;
}

- (uint64_t)buildTree:(void *)a3 parentsToDependencies:(void *)a4 parentsToChildren:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v7 = result;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = *(id *)(result + 24);
    result = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (result)
    {
      uint64_t v8 = result;
      uint64_t v9 = *(void *)v20;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
          v12 = objc_alloc_init(__NSCFURLSessionTaskDependencyTreeNode);
          v13 = (void *)[a2 objectForKeyedSubscript:v11];
          if (v12)
          {
            objc_setProperty_nonatomic(v12, v14, v13, 8);
            v15 = (void *)[a4 objectForKeyedSubscript:v11];
            objc_setProperty_nonatomic(v12, v16, v15, 24);
            [a3 removeObjectForKey:v11];
            -[__NSCFURLSessionTaskDependencyTreeNode buildTree:parentsToDependencies:parentsToChildren:](v12, a2, a3, a4);
            objc_setProperty_nonatomic(v12, v17, 0, 24);
          }
          else
          {
            [a4 objectForKeyedSubscript:v11];
            [a3 removeObjectForKey:v11];
          }
          [*(id *)(v7 + 16) addObject:v12];
          ++v10;
        }
        while (v8 != v10);
        result = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        uint64_t v8 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)makePriorityInfoStartingFromStreamID:(uint64_t)a3 parentStream:(void *)a4 priorityInfo:(void *)a5 dependentToParentStreamIDs:(void *)a6 parentToParentStreamIDs:
{
  v37[5] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v11 = result;
    uint64_t v12 = [NSNumber numberWithInt:*a2];
    if ([a4 count])
    {
      uint64_t v13 = [NSNumber numberWithInt:a3];
      v34[0] = @"parentStreamID";
      v34[1] = @"weight";
      v35[0] = v13;
      v35[1] = &unk_1ECFD1B48;
      v34[2] = @"exclusive";
      v35[2] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(v11 + 8), "exclusive"));
      v35[3] = v12;
      v34[3] = @"streamID";
      v34[4] = @"path";
      uint64_t v14 = *(void *)(v11 + 8);
      if (v14)
      {
        uint64_t v15 = *(void *)(v14 + 16);
        if (v15)
        {
          uint64_t v14 = *(void *)(v15 + 8);
          if (!v14) {
            uint64_t v14 = *(void *)(v15 + 16);
          }
        }
        else
        {
          uint64_t v14 = 0;
        }
      }
      v35[4] = v14;
      objc_msgSend(a4, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v35, v34, 5));
      uint64_t v16 = *(void *)(v11 + 8);
      if (v16) {
        uint64_t v17 = *(void *)(v16 + 16);
      }
      else {
        uint64_t v17 = 0;
      }
      [a5 setObject:v13 forKeyedSubscript:v17];
      uint64_t v18 = *(void *)(v11 + 8);
      if (v18) {
        long long v19 = *(__NSURLSessionTaskDependencyResourceIdentifier **)(v18 + 16);
      }
      else {
        long long v19 = 0;
      }
    }
    else
    {
      long long v20 = *(void **)(v11 + 32);
      if (!v20) {
        long long v20 = &unk_1ECFD1B18;
      }
      v36[0] = @"parentStreamID";
      v36[1] = @"weight";
      v37[0] = v20;
      v37[1] = &unk_1ECFD1B30;
      v36[2] = @"exclusive";
      v36[3] = @"streamID";
      v37[2] = MEMORY[0x1E4F1CC28];
      v37[3] = v12;
      v36[4] = @"path";
      v37[4] = @"/";
      objc_msgSend(a4, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v37, v36, 5));
      long long v21 = objc_alloc_init(__NSURLSessionTaskDependencyResourceIdentifier);
      long long v19 = v21;
      if (v21) {
        objc_setProperty_nonatomic(v21, v22, @"/", 8);
      }
    }
    [a6 setObject:v12 forKeyedSubscript:v19];
    uint64_t v23 = *a2;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v24 = *(void **)(v11 + 16);
    result = [v24 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (result)
    {
      uint64_t v25 = result;
      uint64_t v26 = *(void *)v30;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v30 != v26) {
            objc_enumerationMutation(v24);
          }
          uint64_t v28 = *(void *)(*((void *)&v29 + 1) + 8 * v27);
          *a2 += 2;
          -[__NSCFURLSessionTaskDependencyTreeNode makePriorityInfoStartingFromStreamID:parentStream:priorityInfo:dependentToParentStreamIDs:parentToParentStreamIDs:](v28, a2, v23, a4, a5, a6);
          ++v27;
        }
        while (v25 != v27);
        result = [v24 countByEnumeratingWithState:&v29 objects:v33 count:16];
        uint64_t v25 = result;
      }
      while (result);
    }
  }
  return result;
}

@end