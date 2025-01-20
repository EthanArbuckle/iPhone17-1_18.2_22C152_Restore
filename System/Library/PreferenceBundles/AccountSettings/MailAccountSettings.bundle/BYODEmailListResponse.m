@interface BYODEmailListResponse
- (BYODEmailListResponse)initWithDictionary:(id)a3;
- (BYODEmailListResult)result;
- (void)setResult:(id)a3;
@end

@implementation BYODEmailListResponse

- (BYODEmailListResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BYODEmailListResponse;
  v5 = [(BYODBaseResponse *)&v11 initWithDictionary:v4];
  if (v5)
  {
    v6 = [BYODEmailListResult alloc];
    v7 = [v4 objectForKey:@"result"];
    v8 = [(BYODEmailListResult *)v6 initWithDictionary:v7];
    v9 = v5->_result;
    v5->_result = v8;
  }
  return v5;
}

- (BYODEmailListResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end