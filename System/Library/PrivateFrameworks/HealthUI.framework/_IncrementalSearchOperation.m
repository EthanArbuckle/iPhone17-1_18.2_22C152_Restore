@interface _IncrementalSearchOperation
- (NSRegularExpression)regularExpression;
- (NSString)searchBody;
- (_IncrementalSearchOperation)initWithSearchString:(id)a3 searchBody:(id)a4 resultsBlock:(id)a5 finishedBlock:(id)a6;
- (id)searchFinishedBlock;
- (id)searchResultsBlock;
- (void)main;
@end

@implementation _IncrementalSearchOperation

- (_IncrementalSearchOperation)initWithSearchString:(id)a3 searchBody:(id)a4 resultsBlock:(id)a5 finishedBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)_IncrementalSearchOperation;
  v14 = [(_IncrementalSearchOperation *)&v26 init];
  if (v14)
  {
    unsigned __int8 v25 = 0;
    v15 = +[HKIncrementalSearchBar regularExpressionFromString:v10 quoteForJavascript:0 caseless:&v25];
    id v24 = 0;
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v15 options:v25 error:&v24];
    id v17 = v24;
    regularExpression = v14->_regularExpression;
    v14->_regularExpression = (NSRegularExpression *)v16;

    objc_storeStrong((id *)&v14->_searchBody, a4);
    v19 = _Block_copy(v12);
    id searchResultsBlock = v14->_searchResultsBlock;
    v14->_id searchResultsBlock = v19;

    v21 = _Block_copy(v13);
    id searchFinishedBlock = v14->_searchFinishedBlock;
    v14->_id searchFinishedBlock = v21;
  }
  return v14;
}

- (void)main
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x42810000000;
  v19 = &unk_1E0F50A5E;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  if (([(_IncrementalSearchOperation *)self isCancelled] & 1) == 0)
  {
    v17[4] = 0;
    objc_initWeak(&location, self);
    regularExpression = self->_regularExpression;
    searchBody = self->_searchBody;
    uint64_t v5 = [(NSString *)searchBody length];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __35___IncrementalSearchOperation_main__block_invoke;
    v12[3] = &unk_1E6D561D0;
    v12[4] = self;
    v12[5] = &v16;
    objc_copyWeak(&v13, &location);
    v12[6] = v15;
    -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:](regularExpression, "enumerateMatchesInString:options:range:usingBlock:", searchBody, 0, 0, v5, v12);
    if (([(_IncrementalSearchOperation *)self isCancelled] & 1) == 0)
    {
      if (v17[4])
      {
        id searchResultsBlock = self->_searchResultsBlock;
        id v7 = objc_loadWeakRetained(&location);
        v8 = (void (*)(void *, id, unsigned char *))searchResultsBlock[2];
        memcpy(__dst, v17 + 4, sizeof(__dst));
        v8(searchResultsBlock, v7, __dst);
      }
      id searchFinishedBlock = (void (**)(id, id))self->_searchFinishedBlock;
      id v10 = objc_loadWeakRetained(&location);
      searchFinishedBlock[2](searchFinishedBlock, v10);
    }
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v16, 8);
}

- (NSRegularExpression)regularExpression
{
  return (NSRegularExpression *)objc_getProperty(self, a2, 248, 1);
}

- (NSString)searchBody
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (id)searchResultsBlock
{
  return objc_getProperty(self, a2, 264, 1);
}

- (id)searchFinishedBlock
{
  return objc_getProperty(self, a2, 272, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_searchFinishedBlock, 0);
  objc_storeStrong(&self->_searchResultsBlock, 0);
  objc_storeStrong((id *)&self->_searchBody, 0);
  objc_storeStrong((id *)&self->_regularExpression, 0);
}

@end