@interface AATermsReportUserActionRequest
+ (Class)responseClass;
- (AATermsReportUserActionRequest)initWithAccount:(id)a3 urlRequest:(id)a4 parameters:(id)a5;
- (id)urlRequest;
@end

@implementation AATermsReportUserActionRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AATermsReportUserActionRequest)initWithAccount:(id)a3 urlRequest:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 URL];
  v12 = [v11 absoluteString];
  v17.receiver = self;
  v17.super_class = (Class)AATermsReportUserActionRequest;
  v13 = [(AARequest *)&v17 initWithURLString:v12];

  if (v13)
  {
    v14 = (NSURLRequest *)[v9 mutableCopy];
    if (v10 && [v10 count]) {
      [(NSURLRequest *)v14 aa_setJSONBodyWithParameters:v10];
    }
    [(NSURLRequest *)v14 setHTTPMethod:@"POST"];
    [(NSURLRequest *)v14 ak_addClientInfoHeader];
    [(NSURLRequest *)v14 aa_addAuthTokenOrBasicAuthHeaderWithAccount:v8 preferUsingPassword:1];
    urlRequest = v13->_urlRequest;
    v13->_urlRequest = v14;
  }
  return v13;
}

- (id)urlRequest
{
  return self->_urlRequest;
}

- (void).cxx_destruct
{
}

@end