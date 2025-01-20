@interface _CNAutocompleteUserSessionDisplayedResults
- (BOOL)containsDuetResults;
- (BOOL)ignored;
- (BOOL)relevantForRequest:(id)a3;
- (CNAutocompleteFetchRequest)request;
- (NSMutableDictionary)datesByBatchIndexes;
- (_CNAutocompleteUserSessionDisplayedResults)initWithRequest:(id)a3;
- (void)didReceiveBatch:(unint64_t)a3;
- (void)setContainsDuetResults:(BOOL)a3;
- (void)setDatesByBatchIndexes:(id)a3;
- (void)setIgnored:(BOOL)a3;
@end

@implementation _CNAutocompleteUserSessionDisplayedResults

- (_CNAutocompleteUserSessionDisplayedResults)initWithRequest:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CNAutocompleteUserSessionDisplayedResults;
  v6 = [(_CNAutocompleteUserSessionDisplayedResults *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    datesByBatchIndexes = v7->_datesByBatchIndexes;
    v7->_datesByBatchIndexes = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (void)didReceiveBatch:(unint64_t)a3
{
  id v5 = [(_CNAutocompleteUserSessionDisplayedResults *)self datesByBatchIndexes];
  v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v8 = [(_CNAutocompleteUserSessionDisplayedResults *)self datesByBatchIndexes];
    v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    [v8 setObject:v10 forKeyedSubscript:v9];
  }
}

- (BOOL)relevantForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(_CNAutocompleteUserSessionDisplayedResults *)self request];
  v6 = [v4 searchString];
  unint64_t v7 = [v6 length];
  uint64_t v8 = [v5 searchString];
  if (v7 <= [v8 length])
  {
    char v11 = 0;
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4F5A298];
    id v10 = [v5 searchString];
    if ((*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10))
    {
      char v11 = 1;
    }
    else
    {
      v12 = [v4 searchString];
      v13 = [v5 searchString];
      char v11 = [v12 hasPrefix:v13];
    }
  }

  return v11;
}

- (CNAutocompleteFetchRequest)request
{
  return self->_request;
}

- (NSMutableDictionary)datesByBatchIndexes
{
  return self->_datesByBatchIndexes;
}

- (void)setDatesByBatchIndexes:(id)a3
{
}

- (BOOL)ignored
{
  return self->_ignored;
}

- (void)setIgnored:(BOOL)a3
{
  self->_ignored = a3;
}

- (BOOL)containsDuetResults
{
  return self->_containsDuetResults;
}

- (void)setContainsDuetResults:(BOOL)a3
{
  self->_containsDuetResults = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datesByBatchIndexes, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end