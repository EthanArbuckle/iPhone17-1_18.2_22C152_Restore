@interface FADeclineChildTransferRequest
- (BOOL)isUserInitiated;
- (NSString)requestCode;
- (id)urlRequest;
- (id)urlString;
- (void)setRequestCode:(id)a3;
@end

@implementation FADeclineChildTransferRequest

- (BOOL)isUserInitiated
{
  return 1;
}

- (id)urlString
{
  v2 = [MEMORY[0x263F259C0] urlConfiguration];
  v3 = [v2 rejectChildTransferURL];

  return v3;
}

- (id)urlRequest
{
  v10[1] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)FADeclineChildTransferRequest;
  v3 = [(AAFamilyRequest *)&v8 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  requestCode = self->_requestCode;
  if (requestCode)
  {
    v9 = @"request-code";
    v10[0] = requestCode;
    v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    objc_msgSend(v4, "aa_setBodyWithParameters:", v6);
  }
  [v4 setValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
  return v4;
}

- (NSString)requestCode
{
  return self->_requestCode;
}

- (void)setRequestCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end