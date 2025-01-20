@interface ENAsyncReducer
- (CUTResult)result;
- (ENAsyncReducer)initWithInput:(id)a3 initialValue:(id)a4;
- (NSArray)input;
- (id)completionBlock;
- (id)reducerBlock;
- (void)_completeWithResult:(id)a3;
- (void)_reduceWithPending:(id)a3 visited:(id)a4 currentResult:(id)a5 completion:(id)a6;
- (void)reduceWithCompletion:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setInput:(id)a3;
- (void)setReducerBlock:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation ENAsyncReducer

- (ENAsyncReducer)initWithInput:(id)a3 initialValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ENAsyncReducer;
  v9 = [(ENAsyncReducer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_input, a3);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F59E18]) initWithSuccess:v8];
    v12 = v10->_result;
    v10->_result = (CUTResult *)v11;
  }
  return v10;
}

- (void)reduceWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(ENAsyncReducer *)self setCompletionBlock:a3];
  v4 = +[ENLog utilities];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [(ENAsyncReducer *)self input];
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = [v5 count];
    _os_log_impl(&dword_1DD450000, v4, OS_LOG_TYPE_INFO, "Reduce {input: %ld}", buf, 0xCu);
  }
  v6 = [(ENAsyncReducer *)self reducerBlock];

  if (v6)
  {
    id v7 = [(ENAsyncReducer *)self input];
    id v8 = [(ENAsyncReducer *)self result];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1DD45C724;
    v10[3] = &unk_1E6CC5390;
    v10[4] = self;
    [(ENAsyncReducer *)self _reduceWithPending:v7 visited:MEMORY[0x1E4F1CBF0] currentResult:v8 completion:v10];
  }
  else
  {
    v9 = +[ENLog utilities];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD450000, v9, OS_LOG_TYPE_DEFAULT, "Missing reduce block -- Done", buf, 2u);
    }

    id v7 = [(ENAsyncReducer *)self result];
    [(ENAsyncReducer *)self _completeWithResult:v7];
  }
}

- (void)_completeWithResult:(id)a3
{
  id v4 = a3;
  [(ENAsyncReducer *)self setResult:v4];
  v5 = [(ENAsyncReducer *)self completionBlock];
  ((void (**)(void, id))v5)[2](v5, v4);

  [(ENAsyncReducer *)self setCompletionBlock:0];
  [(ENAsyncReducer *)self setReducerBlock:0];
}

- (void)_reduceWithPending:(id)a3 visited:(id)a4 currentResult:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 count])
  {
    objc_super v14 = [v10 firstObject];
    v15 = objc_msgSend(v10, "subarrayWithRange:", 1, objc_msgSend(v10, "count") - 1);
    v16 = [v11 arrayByAddingObject:v14];
    v17 = objc_alloc_init(ENAsyncReducerState);
    [(ENAsyncReducerState *)v17 setVisitedItems:v11];
    [(ENAsyncReducerState *)v17 setPendingItems:v15];
    [(ENAsyncReducerState *)v17 setCurrentItem:v14];
    uint64_t v18 = [v12 state];
    if (v18 == 1)
    {
      [(ENAsyncReducerState *)v17 setCurrentResult:0];
    }
    else if (!v18)
    {
      v19 = [v12 value];
      [(ENAsyncReducerState *)v17 setCurrentResult:v19];
    }
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = sub_1DD45CBA0;
    v33[3] = &unk_1E6CC53B8;
    id v21 = v13;
    id v34 = v21;
    [(ENAsyncReducerState *)v17 setCancelBlock:v33];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_1DD45CC20;
    v31[3] = &unk_1E6CC53E0;
    id v22 = v21;
    id v32 = v22;
    [(ENAsyncReducerState *)v17 setStopBlock:v31];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1DD45CCA0;
    v27[3] = &unk_1E6CC5408;
    v27[4] = self;
    id v28 = v15;
    id v29 = v16;
    id v30 = v22;
    id v23 = v16;
    id v24 = v15;
    [(ENAsyncReducerState *)v17 setContinueBlock:v27];
    v25 = [(ENAsyncReducer *)self reducerBlock];
    ((void (**)(void, ENAsyncReducerState *))v25)[2](v25, v17);
  }
  else
  {
    v20 = +[ENLog utilities];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1DD450000, v20, OS_LOG_TYPE_INFO, "No more items -- Done", v26, 2u);
    }

    (*((void (**)(id, id))v13 + 2))(v13, v12);
  }
}

- (NSArray)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
}

- (CUTResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (id)reducerBlock
{
  return self->_reducerBlock;
}

- (void)setReducerBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_reducerBlock, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

@end