@interface BYODDomainVerifyTransferResponse
- (BOOL)verifySuccess;
- (BYODDomainVerifyTransferResponse)initWithDictionary:(id)a3;
- (BYODDomainVerifyTransferResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (void)setVerifySuccess:(BOOL)a3;
@end

@implementation BYODDomainVerifyTransferResponse

- (BYODDomainVerifyTransferResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BYODDomainVerifyTransferResponse;
  v8 = [(BYODDomainVerifyTransferResponse *)&v11 initWithHTTPResponse:v6 data:v7 bodyIsPlist:0];
  v9 = v8;
  if (v8
    && [*(id *)&v8->super.AAResponse_opaque[OBJC_IVAR___AAResponse__httpResponse] statusCode] == stru_B8.segname)
  {
    v9 = [(BYODDomainVerifyTransferResponse *)v9 initWithDictionary:*(void *)&v9->super.AAResponse_opaque[OBJC_IVAR___AAResponse__responseDictionary]];
  }

  return v9;
}

- (BYODDomainVerifyTransferResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BYODDomainVerifyTransferResponse;
  v5 = [(BYODBaseResponse *)&v8 initWithDictionary:v4];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"success"];
    v5->_verifySuccess = [v6 BOOLValue];
  }
  return v5;
}

- (BOOL)verifySuccess
{
  return self->_verifySuccess;
}

- (void)setVerifySuccess:(BOOL)a3
{
  self->_verifySuccess = a3;
}

@end