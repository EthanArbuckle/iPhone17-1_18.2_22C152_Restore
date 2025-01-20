@interface _CNDiagnosticResponsePreparer
- (CNFuture)logFuture;
- (_CNDiagnosticResponsePreparer)initWithResponsePreparer:(id)a3 delegate:(id)a4 log:(id)a5;
- (id)prepareResults:(id)a3 forFetch:(id)a4;
@end

@implementation _CNDiagnosticResponsePreparer

- (_CNDiagnosticResponsePreparer)initWithResponsePreparer:(id)a3 delegate:(id)a4 log:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_CNDiagnosticResponsePreparer;
  v9 = [(_CNAutocompleteResponsePreparerDecorator *)&v14 initWithResponsePreparer:a3 delegate:a4];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F5A408] lazyFutureWithBlock:v8];
    logFuture = v9->_logFuture;
    v9->_logFuture = (CNFuture *)v10;

    v12 = v9;
  }

  return v9;
}

- (id)prepareResults:(id)a3 forFetch:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v13 = [(_CNDiagnosticResponsePreparer *)self logFuture];
        [v12 addDiagnosticLogFuture:v13];
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
  objc_super v14 = [(_CNAutocompleteResponsePreparerDecorator *)self preparer];
  v15 = [v14 prepareResults:v6 forFetch:v7];

  return v15;
}

- (CNFuture)logFuture
{
  return (CNFuture *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
}

@end