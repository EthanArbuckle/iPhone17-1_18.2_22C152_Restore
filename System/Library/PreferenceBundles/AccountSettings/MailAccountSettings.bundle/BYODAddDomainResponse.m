@interface BYODAddDomainResponse
- (BYODAddDomainResponse)initWithDictionary:(id)a3;
- (BYODAddDomainResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (BYODAddDomainResult)result;
- (void)setResult:(id)a3;
@end

@implementation BYODAddDomainResponse

- (BYODAddDomainResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BYODAddDomainResponse;
  v8 = [(BYODAddDomainResponse *)&v11 initWithHTTPResponse:v6 data:v7 bodyIsPlist:0];
  if (v8) {
    v9 = [(BYODAddDomainResponse *)v8 initWithDictionary:*(void *)&v8->super.AAResponse_opaque[OBJC_IVAR___AAResponse__responseDictionary]];
  }
  else {
    v9 = 0;
  }

  return v9;
}

- (BYODAddDomainResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BYODAddDomainResponse;
  v5 = [(BYODBaseResponse *)&v11 initWithDictionary:v4];
  if (v5)
  {
    id v6 = [BYODAddDomainResult alloc];
    id v7 = [v4 objectForKeyedSubscript:@"result"];
    v8 = [(BYODAddDomainResult *)v6 initWithDictionary:v7];
    v9 = v5->_result;
    v5->_result = v8;
  }
  return v5;
}

- (BYODAddDomainResult)result
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