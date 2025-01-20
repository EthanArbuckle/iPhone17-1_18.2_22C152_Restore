@interface _NBSearchOperation
- (NBSearchDataSource)dataSource;
- (NSString)searchString;
- (_NBSearchOperation)initWithSearchDataSource:(id)a3 searchString:(id)a4;
- (void)main;
@end

@implementation _NBSearchOperation

- (_NBSearchOperation)initWithSearchDataSource:(id)a3 searchString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_NBSearchOperation;
  v8 = [(_NBSearchOperation *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    v10 = (NSString *)[v7 copy];
    searchString = v9->_searchString;
    v9->_searchString = v10;
  }
  return v9;
}

- (void)main
{
  if (([(_NBSearchOperation *)self isCancelled] & 1) == 0)
  {
    [(_NBSearchOperation *)self executeSearch];
  }
}

- (NBSearchDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (NBSearchDataSource *)WeakRetained;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end