@interface IMPromise
+ (id)all:(id)a3;
- (BOOL)completed;
- (IMPromise)initWithError:(id)a3;
- (IMPromise)initWithValue:(id)a3;
- (id)then:(id)a3;
- (void)failWithError:(id)a3;
- (void)fullfillWithValue:(id)a3;
- (void)registerCompletionBlock:(id)a3;
@end

@implementation IMPromise

- (IMPromise)initWithValue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMPromise;
  v5 = [(IMPromise *)&v9 init];
  if (v5)
  {
    v6 = [[IMResult alloc] initWithSuccess:v4];
    v7 = v5->_result;
    v5->_result = v6;
  }
  return v5;
}

- (IMPromise)initWithError:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMPromise;
  v5 = [(IMPromise *)&v9 init];
  if (v5)
  {
    v6 = [[IMResult alloc] initWithError:v4];
    v7 = v5->_result;
    v5->_result = v6;
  }
  return v5;
}

- (BOOL)completed
{
  return self->_result != 0;
}

- (void)fullfillWithValue:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [[IMResult alloc] initWithSuccess:v4];
  result = self->_result;
  self->_result = v5;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = self->_completionBlocks;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;
}

- (void)failWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [[IMResult alloc] initWithError:v4];
  result = self->_result;
  self->_result = v5;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = self->_completionBlocks;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;
}

- (void)registerCompletionBlock:(id)a3
{
  uint64_t v10 = (void (**)(id, IMResult *))a3;
  if ([(IMPromise *)self completed])
  {
    v10[2](v10, self->_result);
  }
  else
  {
    completionBlocks = self->_completionBlocks;
    if (completionBlocks)
    {
      v5 = (void *)MEMORY[0x22A670320](v10);
      [(NSMutableArray *)completionBlocks addObject:v5];
    }
    else
    {
      id v6 = objc_alloc(MEMORY[0x263EFF980]);
      v7 = (void *)MEMORY[0x22A670320](v10);
      uint64_t v8 = (NSMutableArray *)objc_msgSend(v6, "initWithObjects:", v7, 0);
      uint64_t v9 = self->_completionBlocks;
      self->_completionBlocks = v8;
    }
  }
}

+ (id)all:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(IMPromise);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if ([v3 count])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [MEMORY[0x263EFF9D0] null];
      [v5 addObject:v7];

      ++v6;
    }
    while ([v3 count] > v6);
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  int v19 = 0;
  if (![v3 count])
  {
    [(IMPromise *)v4 fullfillWithValue:v5];
    *((unsigned char *)v21 + 24) = 1;
  }
  for (unint64_t i = 0; [v3 count] > i; ++i)
  {
    uint64_t v9 = [v3 objectAtIndexedSubscript:i];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_226F9ECA8;
    v12[3] = &unk_2647F6DE8;
    long long v15 = &v20;
    long long v13 = v4;
    id v10 = v5;
    int v17 = i;
    id v14 = v10;
    long long v16 = v18;
    [v9 registerCompletionBlock:v12];
  }
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  return v4;
}

- (id)then:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(IMPromise);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_226F9EE80;
  v11[3] = &unk_2647F6E38;
  unint64_t v6 = v5;
  v12 = v6;
  id v13 = v4;
  id v7 = v4;
  [(IMPromise *)self registerCompletionBlock:v11];
  uint64_t v8 = v13;
  uint64_t v9 = v6;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end