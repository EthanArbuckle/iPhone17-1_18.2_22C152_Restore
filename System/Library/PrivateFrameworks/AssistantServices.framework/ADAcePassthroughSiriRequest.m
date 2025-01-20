@interface ADAcePassthroughSiriRequest
+ (BOOL)supportsSecureCoding;
- (ADAcePassthroughSiriRequest)initWithClientBoundCommand:(id)a3;
- (ADAcePassthroughSiriRequest)initWithCoder:(id)a3;
- (id)_ad_preheatableServiceDomainForDomainSignalRequest;
- (id)clientBoundCommand;
- (id)createResponseWithReplyCommand:(id)a3;
- (void)_ad_handleAceDomainSignalRequestWithCompletionHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADAcePassthroughSiriRequest

- (void).cxx_destruct
{
}

- (ADAcePassthroughSiriRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADAcePassthroughSiriRequest;
  v5 = [(ADAcePassthroughSiriRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AcePassthroughSiriRequestClientBoundCommand"];
    clientBoundCommand = v5->_clientBoundCommand;
    v5->_clientBoundCommand = (SABaseClientBoundCommand *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ADAcePassthroughSiriRequest;
  id v4 = a3;
  [(ADAcePassthroughSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientBoundCommand, @"AcePassthroughSiriRequestClientBoundCommand", v5.receiver, v5.super_class);
}

- (id)createResponseWithReplyCommand:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"ADAcePassthroughSiriRequest.m", 42, @"Invalid parameter not satisfying: %@", @"replyCommand" object file lineNumber description];
  }
  uint64_t v6 = [[ADAcePassthroughSiriResponse alloc] initWithRequest:self replyCommand:v5];

  return v6;
}

- (id)clientBoundCommand
{
  return self->_clientBoundCommand;
}

- (ADAcePassthroughSiriRequest)initWithClientBoundCommand:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADAcePassthroughSiriRequest;
  uint64_t v6 = [(ADAcePassthroughSiriRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clientBoundCommand, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_ad_handleAceDomainSignalRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ADAcePassthroughSiriRequest *)self clientBoundCommand];
  objc_msgSend(v5, "_ad_handleAceDomainSignalRequest:completionHandler:", self, v4);
}

- (id)_ad_preheatableServiceDomainForDomainSignalRequest
{
  v2 = [(ADAcePassthroughSiriRequest *)self clientBoundCommand];
  v3 = objc_msgSend(v2, "_ad_preheatableDomain");

  return v3;
}

@end