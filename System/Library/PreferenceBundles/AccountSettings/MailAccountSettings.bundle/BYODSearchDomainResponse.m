@interface BYODSearchDomainResponse
- (BYODDomainOptionsList)result;
- (BYODSearchDomainResponse)initWithDictionary:(id)a3;
- (BYODSearchDomainResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (void)setResult:(id)a3;
@end

@implementation BYODSearchDomainResponse

- (BYODSearchDomainResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BYODSearchDomainResponse;
  v8 = [(BYODSearchDomainResponse *)&v11 initWithHTTPResponse:v6 data:v7 bodyIsPlist:0];
  v9 = v8;
  if (v8
    && [*(id *)&v8->super.AAResponse_opaque[OBJC_IVAR___AAResponse__httpResponse] statusCode] == stru_B8.segname)
  {
    v9 = [(BYODSearchDomainResponse *)v9 initWithDictionary:*(void *)&v9->super.AAResponse_opaque[OBJC_IVAR___AAResponse__responseDictionary]];
  }

  return v9;
}

- (BYODSearchDomainResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BYODSearchDomainResponse;
  v5 = [(BYODBaseResponse *)&v11 initWithDictionary:v4];
  if (v5)
  {
    id v6 = [BYODDomainOptionsList alloc];
    id v7 = [v4 objectForKeyedSubscript:@"result"];
    v8 = [(BYODDomainOptionsList *)v6 initWithDictionary:v7];
    v9 = v5->_result;
    v5->_result = v8;
  }
  return v5;
}

- (BYODDomainOptionsList)result
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