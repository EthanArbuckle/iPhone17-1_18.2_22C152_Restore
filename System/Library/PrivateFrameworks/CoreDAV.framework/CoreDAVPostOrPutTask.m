@interface CoreDAVPostOrPutTask
- (BOOL)forceToServer;
- (CoreDAVPostOrPutTask)initWithDataPayload:(id)a3 dataContentType:(id)a4 atURL:(id)a5 previousETag:(id)a6;
- (CoreDAVPostOrPutTask)initWithURL:(id)a3;
- (NSData)requestDataPayload;
- (NSString)previousETag;
- (NSString)requestDataContentType;
- (NSURL)priorOrderedURL;
- (id)additionalHeaderValues;
- (id)description;
- (int)absoluteOrder;
- (void)setAbsoluteOrder:(int)a3;
- (void)setForceToServer:(BOOL)a3;
- (void)setPreviousETag:(id)a3;
- (void)setPriorOrderedURL:(id)a3;
- (void)setRequestDataContentType:(id)a3;
- (void)setRequestDataPayload:(id)a3;
@end

@implementation CoreDAVPostOrPutTask

- (CoreDAVPostOrPutTask)initWithURL:(id)a3
{
  return [(CoreDAVPostOrPutTask *)self initWithDataPayload:0 dataContentType:0 atURL:a3 previousETag:0];
}

- (CoreDAVPostOrPutTask)initWithDataPayload:(id)a3 dataContentType:(id)a4 atURL:(id)a5 previousETag:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CoreDAVPostOrPutTask;
  v14 = [(CoreDAVTask *)&v17 initWithURL:a5];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_requestDataPayload, a3);
    objc_storeStrong((id *)&v15->_requestDataContentType, a4);
    v15->_forceToServer = 0;
    objc_storeStrong((id *)&v15->_previousETag, a6);
  }

  return v15;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v11.receiver = self;
  v11.super_class = (Class)CoreDAVPostOrPutTask;
  v4 = [(CoreDAVActionBackedTask *)&v11 description];
  [v3 appendFormat:@"[%@ ", v4];

  v5 = [(CoreDAVPostOrPutTask *)self previousETag];
  [v3 appendFormat:@"| Previous ETag: [%@]", v5];

  BOOL v6 = [(CoreDAVPostOrPutTask *)self forceToServer];
  v7 = @"NO";
  if (v6) {
    v7 = @"YES";
  }
  [v3 appendFormat:@"| Force to server: [%@]", v7];
  v8 = [(CoreDAVPostOrPutTask *)self requestDataPayload];
  objc_msgSend(v3, "appendFormat:", @"| Request data payload length in bytes: [%lu]", objc_msgSend(v8, "length"));

  v9 = [(CoreDAVPostOrPutTask *)self requestDataContentType];
  [v3 appendFormat:@"| Request data content type: [%@]", v9];

  [v3 appendFormat:@"]"];
  return v3;
}

- (id)additionalHeaderValues
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v16.receiver = self;
  v16.super_class = (Class)CoreDAVPostOrPutTask;
  v4 = [(CoreDAVTask *)&v16 additionalHeaderValues];
  [v3 addEntriesFromDictionary:v4];

  v5 = [(CoreDAVPostOrPutTask *)self requestDataContentType];
  if (v5) {
    [v3 setObject:v5 forKey:@"Content-Type"];
  }
  if (![(CoreDAVPostOrPutTask *)self forceToServer])
  {
    uint64_t v6 = [(CoreDAVPostOrPutTask *)self previousETag];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = @"*";
    }
    v9 = CoreDAVHTTPHeader_IfNoneMatch;
    if (v6) {
      v9 = CoreDAVHTTPHeader_IfMatch;
    }
    [v3 setObject:v8 forKey:*v9];
  }
  if (self->_sendOrder)
  {
    v10 = [(NSURL *)self->_priorOrderedURL CDVRawLastPathComponent];
    if ([v10 length])
    {
      objc_super v11 = NSString;
      id v12 = CDVRelativeOrderHeaderString();
      id v13 = [v11 stringWithFormat:@"%@%@", v12, v10];
    }
    else
    {
      v14 = [NSNumber numberWithInt:self->_absoluteOrder];
      id v13 = [v14 stringValue];

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
    }
    [v3 setObject:v13 forKey:@"Position"];
    goto LABEL_15;
  }
LABEL_16:

  return v3;
}

- (void)setAbsoluteOrder:(int)a3
{
  self->_sendOrder = 1;
  self->_absoluteOrder = a3;
}

- (void)setPriorOrderedURL:(id)a3
{
  v5 = (NSURL *)a3;
  if (self->_priorOrderedURL != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_priorOrderedURL, a3);
    v5 = v6;
    if (self->_priorOrderedURL) {
      self->_sendOrder = 1;
    }
  }
}

- (BOOL)forceToServer
{
  return self->_forceToServer;
}

- (void)setForceToServer:(BOOL)a3
{
  self->_forceToServer = a3;
}

- (NSString)previousETag
{
  return self->_previousETag;
}

- (void)setPreviousETag:(id)a3
{
}

- (NSString)requestDataContentType
{
  return self->_requestDataContentType;
}

- (void)setRequestDataContentType:(id)a3
{
}

- (NSData)requestDataPayload
{
  return self->_requestDataPayload;
}

- (void)setRequestDataPayload:(id)a3
{
}

- (int)absoluteOrder
{
  return self->_absoluteOrder;
}

- (NSURL)priorOrderedURL
{
  return self->_priorOrderedURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorOrderedURL, 0);
  objc_storeStrong((id *)&self->_requestDataPayload, 0);
  objc_storeStrong((id *)&self->_requestDataContentType, 0);
  objc_storeStrong((id *)&self->_previousETag, 0);
}

@end