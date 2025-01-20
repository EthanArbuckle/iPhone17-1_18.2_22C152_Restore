@interface ADAcePassthroughSiriResponse
+ (BOOL)supportsSecureCoding;
- (ADAcePassthroughSiriResponse)initWithCoder:(id)a3;
- (ADAcePassthroughSiriResponse)initWithRequest:(id)a3 replyCommand:(id)a4;
- (id)replyCommand;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADAcePassthroughSiriResponse

- (void).cxx_destruct
{
}

- (ADAcePassthroughSiriResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADAcePassthroughSiriResponse;
  v5 = [(ADAcePassthroughSiriResponse *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AcePassthroughSiriResponseReplyCommand"];
    replyCommand = v5->_replyCommand;
    v5->_replyCommand = (SAAceCommand *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ADAcePassthroughSiriResponse;
  id v4 = a3;
  [(ADAcePassthroughSiriResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_replyCommand, @"AcePassthroughSiriResponseReplyCommand", v5.receiver, v5.super_class);
}

- (id)replyCommand
{
  return self->_replyCommand;
}

- (ADAcePassthroughSiriResponse)initWithRequest:(id)a3 replyCommand:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ADAcePassthroughSiriResponse;
  v8 = (ADAcePassthroughSiriResponse *)[(ADAcePassthroughSiriResponse *)&v11 _initWithRequest:a3];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_replyCommand, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end