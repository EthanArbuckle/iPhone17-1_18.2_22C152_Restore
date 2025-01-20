@interface GDMockCNFetchResult
- (GDMockCNFetchResult)initWithValue:(id)a3 currentHistoryToken:(id)a4;
- (NSData)currentHistoryToken;
- (id)value;
@end

@implementation GDMockCNFetchResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHistoryToken, 0);
  objc_storeStrong(&self->_value, 0);
}

- (NSData)currentHistoryToken
{
  return self->_currentHistoryToken;
}

- (id)value
{
  return self->_value;
}

- (GDMockCNFetchResult)initWithValue:(id)a3 currentHistoryToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GDMockCNFetchResult;
  v9 = [(GDMockCNFetchResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_value, a3);
    objc_storeStrong((id *)&v10->_currentHistoryToken, a4);
  }

  return v10;
}

@end