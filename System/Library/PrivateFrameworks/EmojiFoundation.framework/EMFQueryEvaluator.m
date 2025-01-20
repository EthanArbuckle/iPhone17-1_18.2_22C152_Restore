@interface EMFQueryEvaluator
- (EMFInvertedIndex)index;
- (EMFQueryEvaluator)initWithIndex:(id)a3;
- (EMFQueryEvaluator)initWithIndex:(id)a3 andOverrideList:(id)a4;
- (EMFQueryResultOverrideList)overrideList;
- (id)_overriddenResultsForQuery:(id)a3;
- (id)performQuery:(id)a3;
- (void)setOverrideList:(id)a3;
@end

@implementation EMFQueryEvaluator

- (EMFQueryEvaluator)initWithIndex:(id)a3
{
  return [(EMFQueryEvaluator *)self initWithIndex:a3 andOverrideList:0];
}

- (EMFQueryEvaluator)initWithIndex:(id)a3 andOverrideList:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(EMFQueryEvaluator *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_index, a3);
    objc_storeStrong((id *)&v10->_overrideList, a4);
  }

  return v10;
}

- (id)performQuery:(id)a3
{
  id v4 = a3;
  v5 = [v4 tokenCounts];
  v6 = [(EMFInvertedIndex *)self->_index calculateDocumentWeightsForQueryTokenCounts:v5];
  id v7 = [(EMFQueryEvaluator *)self _overriddenResultsForQuery:v4];
  id v8 = [EMFQueryResult alloc];
  if (v7) {
    uint64_t v9 = [(EMFQueryResult *)v8 initWithQuery:v4 matchingDocumentWeights:v6 resultOverride:v7];
  }
  else {
    uint64_t v9 = [(EMFQueryResult *)v8 initWithQuery:v4 andMatchingDocumentWeights:v6];
  }
  v10 = (void *)v9;

  return v10;
}

- (id)_overriddenResultsForQuery:(id)a3
{
  overrideList = self->_overrideList;
  if (overrideList)
  {
    overrideList = [overrideList overriddenResultsForQuery:a3];
  }
  return overrideList;
}

- (EMFInvertedIndex)index
{
  return self->_index;
}

- (EMFQueryResultOverrideList)overrideList
{
  return self->_overrideList;
}

- (void)setOverrideList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideList, 0);
  objc_storeStrong((id *)&self->_index, 0);
}

@end