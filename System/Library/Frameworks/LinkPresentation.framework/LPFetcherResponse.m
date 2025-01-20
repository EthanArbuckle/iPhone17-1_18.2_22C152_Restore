@interface LPFetcherResponse
- (LPFetcherResponse)initWithState:(int64_t)a3 fetcher:(id)a4;
- (id)userData;
- (int64_t)state;
@end

@implementation LPFetcherResponse

- (LPFetcherResponse)initWithState:(int64_t)a3 fetcher:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LPFetcherResponse;
  v7 = [(LPFetcherResponse *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_state = a3;
    uint64_t v9 = [v6 userData];
    id userData = v8->_userData;
    v8->_id userData = (id)v9;

    v11 = v8;
  }

  return v8;
}

- (int64_t)state
{
  return self->_state;
}

- (id)userData
{
  return self->_userData;
}

- (void).cxx_destruct
{
}

@end