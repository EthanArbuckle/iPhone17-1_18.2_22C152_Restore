@interface AMSURLAction
+ (AMSURLAction)actionWithError:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)proceedAction;
+ (id)redirectActionWithURL:(id)a3;
+ (id)retryAction;
- (AMSAuthenticateResult)authenticateResult;
- (AMSDialogResult)dialogResult;
- (AMSURLAction)initWithCoder:(id)a3;
- (AMSURLAction)initWithType:(int64_t)a3;
- (AMSURLAction)initWithType:(int64_t)a3 error:(id)a4 reason:(id)a5 redirectURL:(id)a6;
- (NSData)updatedBody;
- (NSDictionary)updatedHeaders;
- (NSError)error;
- (NSString)reason;
- (NSString)retryIdentifier;
- (NSString)updatedBuyParams;
- (NSString)updatedMethod;
- (NSURL)redirectURL;
- (id)description;
- (int64_t)actionType;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticateResult:(id)a3;
- (void)setDialogResult:(id)a3;
- (void)setReason:(id)a3;
- (void)setRetryIdentifier:(id)a3;
- (void)setUpdatedBody:(id)a3;
- (void)setUpdatedBuyParams:(id)a3;
- (void)setUpdatedHeaders:(id)a3;
- (void)setUpdatedMethod:(id)a3;
@end

@implementation AMSURLAction

- (NSError)error
{
  return self->_error;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setDialogResult:(id)a3
{
}

- (void)setAuthenticateResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedMethod, 0);
  objc_storeStrong((id *)&self->_updatedBody, 0);
  objc_storeStrong((id *)&self->_updatedHeaders, 0);
  objc_storeStrong((id *)&self->_dialogResult, 0);
  objc_storeStrong((id *)&self->_authenticateResult, 0);
  objc_storeStrong((id *)&self->_retryIdentifier, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_updatedBuyParams, 0);
}

+ (id)proceedAction
{
  v2 = [[AMSURLAction alloc] initWithType:0];
  return v2;
}

- (AMSURLAction)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSURLAction;
  result = [(AMSURLAction *)&v5 init];
  if (result) {
    result->_actionType = a3;
  }
  return result;
}

+ (AMSURLAction)actionWithError:(id)a3
{
  v3 = (NSError *)a3;
  v4 = [[AMSURLAction alloc] initWithType:3];
  error = v4->_error;
  v4->_error = v3;

  return v4;
}

+ (id)retryAction
{
  v2 = [[AMSURLAction alloc] initWithType:2];
  return v2;
}

+ (id)redirectActionWithURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = [[AMSURLAction alloc] initWithType:1];
    v6 = (NSURL *)v4;
    redirectURL = v5->_redirectURL;
    v5->_redirectURL = v6;
  }
  else
  {
    redirectURL = AMSError(301, @"Unable to redirect", @"Redirect URL not found", 0);
    objc_super v5 = [a1 actionWithError:redirectURL];
  }

  return v5;
}

- (AMSURLAction)initWithType:(int64_t)a3 error:(id)a4 reason:(id)a5 redirectURL:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AMSURLAction;
  v14 = [(AMSURLAction *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_actionType = a3;
    objc_storeStrong((id *)&v14->_error, a4);
    objc_storeStrong((id *)&v15->_reason, a5);
    objc_storeStrong((id *)&v15->_redirectURL, a6);
  }

  return v15;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(AMSURLAction *)self actionType];
  v6 = [(AMSURLAction *)self reason];
  v7 = [(AMSURLAction *)self redirectURL];
  v8 = AMSLogableURL(v7);
  v9 = [(AMSURLAction *)self retryIdentifier];
  v10 = [v3 stringWithFormat:@"<%@ type=%ld reason=%@ redirectURL=%@ retryId=%@>", v4, v5, v6, v8, v9];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSURLAction actionType](self, "actionType"), @"actionType");
  int64_t v5 = [(AMSURLAction *)self error];
  [v4 encodeObject:v5 forKey:@"error"];

  v6 = [(AMSURLAction *)self reason];
  [v4 encodeObject:v6 forKey:@"reason"];

  v7 = [(AMSURLAction *)self redirectURL];
  [v4 encodeObject:v7 forKey:@"redirectURL"];

  v8 = [(AMSURLAction *)self updatedBody];
  [v4 encodeObject:v8 forKey:@"updatedBody"];

  v9 = [(AMSURLAction *)self updatedBuyParams];
  [v4 encodeObject:v9 forKey:@"updateBuyParams"];

  v10 = [(AMSURLAction *)self updatedHeaders];
  [v4 encodeObject:v10 forKey:@"updatedHeaders"];

  id v11 = [(AMSURLAction *)self updatedMethod];
  [v4 encodeObject:v11 forKey:@"updatedMethod"];
}

- (AMSURLAction)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"actionType"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"redirectURL"];
  v9 = [(AMSURLAction *)self initWithType:v5 error:v6 reason:v7 redirectURL:v8];
  if (v9)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_PLISTClasses");
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"updatedBody"];
    updatedBody = v9->_updatedBody;
    v9->_updatedBody = (NSData *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateBuyParams"];
    updatedBuyParams = v9->_updatedBuyParams;
    v9->_updatedBuyParams = (NSString *)v13;

    v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"updatedHeaders"];
    updatedHeaders = v9->_updatedHeaders;
    v9->_updatedHeaders = (NSDictionary *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updatedMethod"];
    updatedMethod = v9->_updatedMethod;
    v9->_updatedMethod = (NSString *)v18;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)updatedBuyParams
{
  return self->_updatedBuyParams;
}

- (void)setUpdatedBuyParams:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSURL)redirectURL
{
  return self->_redirectURL;
}

- (NSString)retryIdentifier
{
  return self->_retryIdentifier;
}

- (void)setRetryIdentifier:(id)a3
{
}

- (AMSAuthenticateResult)authenticateResult
{
  return self->_authenticateResult;
}

- (AMSDialogResult)dialogResult
{
  return self->_dialogResult;
}

- (NSDictionary)updatedHeaders
{
  return self->_updatedHeaders;
}

- (void)setUpdatedHeaders:(id)a3
{
}

- (NSData)updatedBody
{
  return self->_updatedBody;
}

- (void)setUpdatedBody:(id)a3
{
}

- (NSString)updatedMethod
{
  return self->_updatedMethod;
}

- (void)setUpdatedMethod:(id)a3
{
}

@end