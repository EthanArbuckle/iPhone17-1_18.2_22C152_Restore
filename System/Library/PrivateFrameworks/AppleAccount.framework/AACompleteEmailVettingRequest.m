@interface AACompleteEmailVettingRequest
+ (Class)responseClass;
- (AACompleteEmailVettingRequest)initWithAccount:(id)a3 token:(id)a4;
- (AACompleteEmailVettingRequest)initWithURLString:(id)a3 account:(id)a4 token:(id)a5;
- (id)bodyDictionary;
- (id)urlString;
@end

@implementation AACompleteEmailVettingRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AACompleteEmailVettingRequest)initWithAccount:(id)a3 token:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AACompleteEmailVettingRequest;
  v8 = [(AAEmailVettingRequest *)&v11 initWithAccount:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_token, a4);
  }

  return v9;
}

- (AACompleteEmailVettingRequest)initWithURLString:(id)a3 account:(id)a4 token:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AACompleteEmailVettingRequest;
  v10 = [(AAEmailVettingRequest *)&v13 initWithURLString:a3 account:a4];
  objc_super v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_token, a5);
  }

  return v11;
}

- (id)urlString
{
  v3 = +[AAURLConfiguration urlConfiguration];
  v4 = [v3 completeValidateEmailURL];

  v5 = [(AAEmailVettingRequest *)self account];
  v6 = [v5 username];
  id v7 = [v4 stringByReplacingOccurrencesOfString:@"$APPLE_ID$" withString:v6];

  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v7];
    id v9 = [v8 string];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)bodyDictionary
{
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  v4 = [(AAEmailVettingRequest *)self account];
  v5 = objc_msgSend(v4, "aa_primaryEmail");
  v6 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v5, @"emailToVet", self->_token, @"token", 0);

  return v6;
}

- (void).cxx_destruct
{
}

@end