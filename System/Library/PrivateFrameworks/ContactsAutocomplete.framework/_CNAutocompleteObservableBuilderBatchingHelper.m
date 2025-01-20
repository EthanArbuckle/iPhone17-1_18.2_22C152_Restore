@interface _CNAutocompleteObservableBuilderBatchingHelper
- (NSArray)batches;
- (_CNAutocompleteObservableBuilderBatchingHelper)initWithBatchCount:(unint64_t)a3;
- (id)batchedObservables;
- (void)addObservable:(id)a3 toBatchAtIndex:(unint64_t)a4;
@end

@implementation _CNAutocompleteObservableBuilderBatchingHelper

- (_CNAutocompleteObservableBuilderBatchingHelper)initWithBatchCount:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_CNAutocompleteObservableBuilderBatchingHelper;
  v4 = [(_CNAutocompleteObservableBuilderBatchingHelper *)&v11 init];
  if (v4)
  {
    for (i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
    {
      v6 = [MEMORY[0x1E4F1CA48] array];
      [i addObject:v6];
    }
    uint64_t v7 = [i copy];
    batches = v4->_batches;
    v4->_batches = (NSArray *)v7;

    v9 = v4;
  }

  return v4;
}

- (void)addObservable:(id)a3 toBatchAtIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(_CNAutocompleteObservableBuilderBatchingHelper *)self batches];
  id v8 = [v7 objectAtIndex:a4];

  objc_msgSend(v8, "_cn_addNonNilObject:", v6);
}

- (id)batchedObservables
{
  v2 = [(_CNAutocompleteObservableBuilderBatchingHelper *)self batches];
  v3 = (void *)[v2 copy];

  return v3;
}

- (NSArray)batches
{
  return self->_batches;
}

- (void).cxx_destruct
{
}

@end