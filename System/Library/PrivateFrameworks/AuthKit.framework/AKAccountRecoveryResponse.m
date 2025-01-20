@interface AKAccountRecoveryResponse
- (AKAccountRecoveryResponse)initWithData:(id)a3 httpResponse:(id)a4;
- (NSData)data;
- (NSHTTPURLResponse)httpResponse;
@end

@implementation AKAccountRecoveryResponse

- (AKAccountRecoveryResponse)initWithData:(id)a3 httpResponse:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKAccountRecoveryResponse;
  v9 = [(AKAccountRecoveryResponse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_httpResponse, a4);
    objc_storeStrong((id *)&v10->_data, a3);
  }

  return v10;
}

- (NSData)data
{
  return self->_data;
}

- (NSHTTPURLResponse)httpResponse
{
  return self->_httpResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_httpResponse, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end