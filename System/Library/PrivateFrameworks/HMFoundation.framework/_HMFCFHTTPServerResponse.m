@interface _HMFCFHTTPServerResponse
- (_CFHTTPServerResponse)responseRef;
- (_HMFCFHTTPMessage)response;
- (_HMFCFHTTPServerRequest)request;
- (_HMFCFHTTPServerResponse)initWithRequest:(id)a3 statusCode:(int64_t)a4;
- (id)attributeDescriptions;
- (id)body;
- (id)completionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (id)headerFields;
- (void)dealloc;
- (void)setBody:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setHeaderValue:(id)a3 forHeaderKey:(id)a4;
@end

@implementation _HMFCFHTTPServerResponse

- (_HMFCFHTTPServerResponse)initWithRequest:(id)a3 statusCode:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [HMFActivity alloc];
  v9 = [v7 activity];
  v10 = [(HMFActivity *)v8 initWithName:@"HTTPResponse" parent:v9 options:1];

  v23.receiver = self;
  v23.super_class = (Class)_HMFCFHTTPServerResponse;
  v11 = [(HMFHTTPResponseInternal *)&v23 initWithStatusCode:a4 headerFields:MEMORY[0x1E4F1CC08] body:0 activity:v10];
  v12 = v11;
  if (!v11) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v11->_request, a3);
  [v7 requestRef];
  uint64_t ResponseMessage = _CFHTTPServerRequestCreateResponseMessage();
  if (ResponseMessage)
  {
    v14 = (const void *)ResponseMessage;
    v15 = [[_HMFCFHTTPMessage alloc] initWithMessageRef:ResponseMessage];
    response = v12->_response;
    v12->_response = v15;

    CFRelease(v14);
LABEL_4:
    v17 = v12;
    goto LABEL_8;
  }
  v18 = (void *)MEMORY[0x19F3A87A0]();
  v19 = v12;
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = HMFGetLogIdentifier(v19);
    *(_DWORD *)buf = 138543362;
    v25 = v21;
    _os_log_impl(&dword_19D57B000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to create message", buf, 0xCu);
  }
  v17 = 0;
LABEL_8:

  return v17;
}

- (void)dealloc
{
  responseRef = self->_responseRef;
  if (responseRef) {
    CFRelease(responseRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)_HMFCFHTTPServerResponse;
  [(_HMFCFHTTPServerResponse *)&v4 dealloc];
}

- (id)attributeDescriptions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [HMFAttributeDescription alloc];
  objc_super v4 = NSString;
  v5 = [(_HMFCFHTTPServerResponse *)self request];
  v6 = [v4 stringWithFormat:@"%@", v5];
  id v7 = [(HMFAttributeDescription *)v3 initWithName:@"Request" value:v6];
  v10[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_HMFCFHTTPServerResponse;
  objc_super v4 = [(HMFHTTPResponseInternal *)&v10 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(_HMFCFHTTPServerResponse *)self request];
    v6 = (void *)v4[6];
    v4[6] = v5;

    uint64_t v7 = [(_HMFCFHTTPServerResponse *)self response];
    v8 = (void *)v4[8];
    v4[8] = v7;
  }
  return v4;
}

- (id)headerFields
{
  v2 = [(_HMFCFHTTPServerResponse *)self response];
  v3 = [v2 headerFields];

  return v3;
}

- (void)setHeaderValue:(id)a3 forHeaderKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_HMFCFHTTPServerResponse *)self response];
  [v8 setValue:v7 forHeaderField:v6];
}

- (id)body
{
  v3 = [(_HMFCFHTTPServerResponse *)self response];

  if (v3)
  {
    objc_super v4 = [(_HMFCFHTTPServerResponse *)self response];
    uint64_t v5 = [v4 body];
    id v6 = (void *)[v5 copy];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)setBody:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(_HMFCFHTTPServerResponse *)self response];

  if (v4)
  {
    uint64_t v5 = [(_HMFCFHTTPServerResponse *)self response];
    [v5 setBody:v6];
  }
}

- (_CFHTTPServerResponse)responseRef
{
  result = self->_responseRef;
  if (!result)
  {
    objc_super v4 = [(_HMFCFHTTPServerResponse *)self request];
    [v4 requestRef];
    uint64_t v5 = [(_HMFCFHTTPServerResponse *)self response];
    [v5 message];
    id v6 = [(_HMFCFHTTPServerResponse *)self response];
    [v6 body];
    self->_responseRef = (_CFHTTPServerResponse *)_CFHTTPServerResponseCreateWithData();

    [(_HMFCFHTTPServerResponse *)self responseRef];
    _CFHTTPServerResponseSetClient();
    return self->_responseRef;
  }
  return result;
}

- (_HMFCFHTTPServerRequest)request
{
  return self->_request;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (_HMFCFHTTPMessage)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end