@interface PARReply
+ (BOOL)supportsSecureCoding;
- (NSArray)rawResponse;
- (NSData)data;
- (NSURLRequest)httpRequest;
- (NSURLResponse)httpResponse;
- (PARReply)initWithCoder:(id)a3;
- (PARTask)task;
- (double)scale;
- (int)replyType;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setHttpRequest:(id)a3;
- (void)setHttpResponse:(id)a3;
- (void)setRawResponse:(id)a3;
- (void)setReplyType:(int)a3;
- (void)setScale:(double)a3;
- (void)setTask:(id)a3;
@end

@implementation PARReply

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_task);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_httpRequest, 0);

  objc_storeStrong((id *)&self->_rawResponse, 0);
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setTask:(id)a3
{
}

- (PARTask)task
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_task);

  return (PARTask *)WeakRetained;
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setHttpResponse:(id)a3
{
}

- (NSURLResponse)httpResponse
{
  return self->_httpResponse;
}

- (void)setHttpRequest:(id)a3
{
}

- (NSURLRequest)httpRequest
{
  return self->_httpRequest;
}

- (void)setReplyType:(int)a3
{
  self->_replyType = a3;
}

- (int)replyType
{
  return self->_replyType;
}

- (NSArray)rawResponse
{
  rawResponse = self->_rawResponse;
  if (rawResponse)
  {
    v3 = rawResponse;
  }
  else
  {
    data = self->_data;
    if (data)
    {
      v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:data options:1 error:0];
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (void)setRawResponse:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  httpRequest = self->_httpRequest;
  id v5 = a3;
  [v5 encodeObject:httpRequest forKey:@"_httpRequest"];
  [v5 encodeObject:self->_httpResponse forKey:@"_httpResponse"];
  [v5 encodeObject:self->_data forKey:@"_data"];
  [v5 encodeDouble:@"_scale" forKey:self->_scale];
  [v5 encodeInt32:self->_replyType forKey:@"_replyType"];
}

- (PARReply)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PARReply;
  id v5 = [(PARReply *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_httpRequest"];
    httpRequest = v5->_httpRequest;
    v5->_httpRequest = (NSURLRequest *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_httpResponse"];
    httpResponse = v5->_httpResponse;
    v5->_httpResponse = (NSURLResponse *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_data"];
    data = v5->_data;
    v5->_data = (NSData *)v10;

    [v4 decodeDoubleForKey:@"_scale"];
    v5->_scale = v12;
    v5->_replyType = [v4 decodeInt32ForKey:@"_replyType"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end