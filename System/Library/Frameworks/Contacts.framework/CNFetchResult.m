@interface CNFetchResult
- (CNFetchResult)initWithValue:(id)a3 currentHistoryToken:(id)a4;
- (NSData)currentHistoryToken;
- (id)description;
- (id)value;
@end

@implementation CNFetchResult

- (CNFetchResult)initWithValue:(id)a3 currentHistoryToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNFetchResult;
  v9 = [(CNFetchResult *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_value, a3);
    uint64_t v11 = [v8 copy];
    currentHistoryToken = v10->_currentHistoryToken;
    v10->_currentHistoryToken = (NSData *)v11;

    v13 = v10;
  }

  return v10;
}

- (id)value
{
  return self->_value;
}

- (NSData)currentHistoryToken
{
  return self->_currentHistoryToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHistoryToken, 0);

  objc_storeStrong(&self->_value, 0);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v4 = [(CNFetchResult *)self value];
  id v5 = (id)[v3 appendName:@"value" object:v4];

  v6 = [(CNFetchResult *)self currentHistoryToken];
  id v7 = (id)[v3 appendName:@"currentHistoryToken" object:v6];

  id v8 = [v3 build];

  return v8;
}

@end