@interface AMSHTTPArchiveTaskInfo
+ (BOOL)supportsSecureCoding;
- (AMSHTTPArchiveTaskInfo)initWithCoder:(id)a3;
- (AMSHTTPArchiveTaskInfo)initWithURLTaskInfo:(id)a3;
- (NSData)HTTPBody;
- (NSData)responseData;
- (NSURLSessionTaskMetrics)metrics;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSHTTPArchiveTaskInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_HTTPBody, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSHTTPArchiveTaskInfo)initWithURLTaskInfo:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSHTTPArchiveTaskInfo;
  v5 = [(AMSHTTPArchiveTaskInfo *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 metrics];
    metrics = v5->_metrics;
    v5->_metrics = (NSURLSessionTaskMetrics *)v6;

    v8 = [v4 task];
    v9 = [v8 originalRequest];
    uint64_t v10 = [v9 HTTPBody];
    HTTPBody = v5->_HTTPBody;
    v5->_HTTPBody = (NSData *)v10;

    uint64_t v12 = [v4 data];
    responseData = v5->_responseData;
    v5->_responseData = (NSData *)v12;
  }
  return v5;
}

- (NSURLSessionTaskMetrics)metrics
{
  return self->_metrics;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AMSHTTPArchiveTaskInfo *)self metrics];
  [v4 encodeObject:v5 forKey:@"kCodingKeyMetrics"];

  uint64_t v6 = [(AMSHTTPArchiveTaskInfo *)self HTTPBody];
  [v4 encodeObject:v6 forKey:@"kCodingKeyHTTPBody"];

  id v7 = [(AMSHTTPArchiveTaskInfo *)self responseData];
  [v4 encodeObject:v7 forKey:@"kCodingKeyResponseData"];
}

- (NSData)responseData
{
  return self->_responseData;
}

- (NSData)HTTPBody
{
  return self->_HTTPBody;
}

- (AMSHTTPArchiveTaskInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSHTTPArchiveTaskInfo;
  v5 = [(AMSHTTPArchiveTaskInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyMetrics"];
    metrics = v5->_metrics;
    v5->_metrics = (NSURLSessionTaskMetrics *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyHTTPBody"];
    HTTPBody = v5->_HTTPBody;
    v5->_HTTPBody = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyResponseData"];
    responseData = v5->_responseData;
    v5->_responseData = (NSData *)v10;
  }
  return v5;
}

@end