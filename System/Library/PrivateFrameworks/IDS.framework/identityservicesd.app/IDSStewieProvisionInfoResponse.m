@interface IDSStewieProvisionInfoResponse
- (IDSStewieProvisionInfoRequest)request;
- (IDSStewieProvisionInfoResponse)initWithRequest:(id)a3 responseCode:(int64_t)a4 failureMessage:(id)a5 additionalInfo:(id)a6;
- (NSDictionary)additionalInfo;
- (NSString)failureMessage;
- (int64_t)responseCode;
@end

@implementation IDSStewieProvisionInfoResponse

- (IDSStewieProvisionInfoResponse)initWithRequest:(id)a3 responseCode:(int64_t)a4 failureMessage:(id)a5 additionalInfo:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)IDSStewieProvisionInfoResponse;
  v14 = [(IDSStewieProvisionInfoResponse *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_request, a3);
    v15->_responseCode = a4;
    objc_storeStrong((id *)&v15->_failureMessage, a5);
    objc_storeStrong((id *)&v15->_additionalInfo, a6);
  }

  return v15;
}

- (IDSStewieProvisionInfoRequest)request
{
  return (IDSStewieProvisionInfoRequest *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (NSString)failureMessage
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)additionalInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_failureMessage, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end