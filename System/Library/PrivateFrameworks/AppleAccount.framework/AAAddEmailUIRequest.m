@interface AAAddEmailUIRequest
- (AAAddEmailUIRequest)initWithAccount:(id)a3;
- (AAAddEmailUIRequest)initWithURLString:(id)a3 account:(id)a4;
- (ACAccount)account;
- (id)urlRequest;
- (id)urlString;
- (void)setAccount:(id)a3;
@end

@implementation AAAddEmailUIRequest

- (AAAddEmailUIRequest)initWithAccount:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AAAddEmailUIRequest;
  v5 = [(AAAddEmailUIRequest *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AAAddEmailUIRequest *)v5 setAccount:v4];
  }

  return v6;
}

- (AAAddEmailUIRequest)initWithURLString:(id)a3 account:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AAAddEmailUIRequest;
  v7 = [(AARequest *)&v10 initWithURLString:a3];
  objc_super v8 = v7;
  if (v7) {
    [(AAAddEmailUIRequest *)v7 setAccount:v6];
  }

  return v8;
}

- (id)urlString
{
  v5.receiver = self;
  v5.super_class = (Class)AAAddEmailUIRequest;
  v2 = [(AARequest *)&v5 urlString];
  if (!v2)
  {
    v3 = +[AAURLConfiguration urlConfiguration];
    v2 = [v3 addEmailURL];
  }

  return v2;
}

- (id)urlRequest
{
  v7.receiver = self;
  v7.super_class = (Class)AAAddEmailUIRequest;
  v3 = [(AARequest *)&v7 urlRequest];
  id v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  [v4 setValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
  objc_super v5 = [(AAAddEmailUIRequest *)self account];
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v5, 0);

  return v4;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end