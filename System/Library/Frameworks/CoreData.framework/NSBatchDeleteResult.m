@interface NSBatchDeleteResult
- (NSBatchDeleteRequestResultType)resultType;
- (NSBatchDeleteResult)initWithResultType:(unint64_t)a3 andObject:(id)a4;
- (NSBatchDeleteResult)initWithSubresults:(id)a3;
- (id)result;
- (void)dealloc;
@end

@implementation NSBatchDeleteResult

- (id)result
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSBatchDeleteResult)initWithResultType:(unint64_t)a3 andObject:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NSBatchDeleteResult;
  v6 = [(NSBatchDeleteResult *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_resultType = a3;
    v6->_aggregatedResult = (id)[a4 copy];
  }
  return v7;
}

- (void)dealloc
{
  self->_aggregatedResult = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSBatchDeleteResult;
  [(NSBatchDeleteResult *)&v3 dealloc];
}

- (NSBatchDeleteResult)initWithSubresults:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)NSBatchDeleteResult;
  v4 = [(NSBatchDeleteResult *)&v49 init];
  if (!v4) {
    return v4;
  }
  if ([a3 count])
  {
    uint64_t resultType = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "resultType");
    v4->_uint64_t resultType = resultType;
  }
  else
  {
    uint64_t resultType = v4->_resultType;
  }
  if (resultType == 2)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v16 = [a3 countByEnumeratingWithState:&v41 objects:v55 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v42 != v19) {
            objc_enumerationMutation(a3);
          }
          v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          unint64_t v22 = v4->_resultType;
          if (v22 != [v21 resultType])
          {
            v31 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v32 = *MEMORY[0x1E4F1C3B8];
            v53 = @"Results";
            id v54 = a3;
            v33 = (void *)MEMORY[0x1E4F1C9E8];
            v34 = &v54;
            v35 = &v53;
            goto LABEL_49;
          }
          v18 += objc_msgSend((id)objc_msgSend(v21, "result"), "integerValue");
        }
        uint64_t v17 = [a3 countByEnumeratingWithState:&v41 objects:v55 count:16];
      }
      while (v17);
    }
    else
    {
      uint64_t v18 = 0;
    }
    id v7 = (id)[NSNumber numberWithInteger:v18];
    goto LABEL_44;
  }
  if (resultType == 1)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v23 = [a3 countByEnumeratingWithState:&v37 objects:v52 count:16];
    if (!v23) {
      goto LABEL_44;
    }
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v38;
    while (1)
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(a3);
        }
        v27 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        unint64_t v28 = v4->_resultType;
        if (v28 != [v27 resultType])
        {
          v31 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v32 = *MEMORY[0x1E4F1C3B8];
          v50 = @"Results";
          id v51 = a3;
          v33 = (void *)MEMORY[0x1E4F1C9E8];
          v34 = &v51;
          v35 = &v50;
LABEL_49:
          objc_exception_throw((id)objc_msgSend(v31, "exceptionWithName:reason:userInfo:", v32, @"Mismatched result types during aggregation of batch delete results", objc_msgSend(v33, "dictionaryWithObjects:forKeys:count:", v34, v35, 1)));
        }
        v29 = (void *)[v27 result];
        if ([v29 count]) {
          [v7 addObjectsFromArray:v29];
        }
      }
      uint64_t v24 = [a3 countByEnumeratingWithState:&v37 objects:v52 count:16];
      if (!v24) {
        goto LABEL_44;
      }
    }
  }
  if (resultType) {
    return v4;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v45 objects:v58 count:16];
  id v7 = (id)MEMORY[0x1E4F1CC28];
  if (!v6) {
    goto LABEL_44;
  }
  uint64_t v8 = v6;
  int v9 = 0;
  int v10 = 0;
  uint64_t v11 = *(void *)v46;
  do
  {
    uint64_t v12 = 0;
    int v13 = -v9;
    int v36 = v9 + v8;
    do
    {
      if (*(void *)v46 != v11) {
        objc_enumerationMutation(a3);
      }
      v14 = *(void **)(*((void *)&v45 + 1) + 8 * v12);
      unint64_t v15 = v4->_resultType;
      if (v15 != [v14 resultType])
      {
        v31 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v32 = *MEMORY[0x1E4F1C3B8];
        v56 = @"Results";
        id v57 = a3;
        v33 = (void *)MEMORY[0x1E4F1C9E8];
        v34 = &v57;
        v35 = &v56;
        goto LABEL_49;
      }
      if (((v13 != v12) & (v10 ^ 1)) != 0) {
        int v10 = 0;
      }
      else {
        int v10 = objc_msgSend((id)objc_msgSend(v14, "result"), "BOOLValue");
      }
      ++v12;
    }
    while (v8 != v12);
    uint64_t v8 = [a3 countByEnumeratingWithState:&v45 objects:v58 count:16];
    int v9 = v36;
  }
  while (v8);
  id v7 = (id)MEMORY[0x1E4F1CC28];
  if (v10) {
    id v7 = (id)MEMORY[0x1E4F1CC38];
  }
LABEL_44:
  v4->_aggregatedResult = v7;
  return v4;
}

- (NSBatchDeleteRequestResultType)resultType
{
  return self->_resultType;
}

@end