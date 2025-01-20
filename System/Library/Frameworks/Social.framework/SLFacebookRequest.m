@interface SLFacebookRequest
- (NSString)accessToken;
- (SLFacebookRequest)initWithURL:(id)a3 parameters:(id)a4 requestMethod:(int64_t)a5;
- (id)preparedURLRequest;
- (int)responseDataFormat;
- (void)setAccessToken:(id)a3;
- (void)setResponseDataFormat:(int)a3;
@end

@implementation SLFacebookRequest

- (SLFacebookRequest)initWithURL:(id)a3 parameters:(id)a4 requestMethod:(int64_t)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SLFacebookRequest;
  v9 = [(SLRequest *)&v12 initWithServiceType:@"com.apple.social.facebook" URL:a3 parameters:v8 requestMethod:a5];
  if (v9)
  {
    v10 = [v8 objectForKey:@"format"];

    if (!v10) {
      [(SLFacebookRequest *)v9 setResponseDataFormat:2];
    }
  }

  return v9;
}

- (id)preparedURLRequest
{
  [(SLFacebookRequest *)self preflightRequest];
  v5.receiver = self;
  v5.super_class = (Class)SLFacebookRequest;
  v3 = [(SLRequest *)&v5 preparedURLRequest];

  return v3;
}

- (void)setAccessToken:(id)a3
{
  if (a3) {
    [(SLRequest *)self setParameterValue:a3 forKey:@"access_token"];
  }
  else {
    [(SLRequest *)self removeParameterForKey:@"access_token"];
  }
}

- (NSString)accessToken
{
  return (NSString *)[(SLRequest *)self parameterForKey:@"access_token"];
}

- (void)setResponseDataFormat:(int)a3
{
  if (a3 == 2) {
    v3 = @"json";
  }
  else {
    v3 = @"xml";
  }
  [(SLRequest *)self setParameterValue:v3 forKey:@"format"];
}

- (int)responseDataFormat
{
  v2 = [(SLRequest *)self parameterForKey:@"format"];
  v3 = v2;
  if (v2)
  {
    if ([v2 isEqualToString:@"json"]) {
      int v4 = 2;
    }
    else {
      int v4 = 0;
    }
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

@end