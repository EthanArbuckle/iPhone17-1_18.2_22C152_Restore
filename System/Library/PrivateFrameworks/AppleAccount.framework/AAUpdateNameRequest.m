@interface AAUpdateNameRequest
+ (Class)responseClass;
- (AAUpdateNameRequest)initWithGrandSlamAccount:(id)a3 accountStore:(id)a4 firstName:(id)a5 lastName:(id)a6;
- (id)urlRequest;
- (id)urlString;
@end

@implementation AAUpdateNameRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AAUpdateNameRequest)initWithGrandSlamAccount:(id)a3 accountStore:(id)a4 firstName:(id)a5 lastName:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)AAUpdateNameRequest;
  v13 = [(AAAppleIDSettingsRequest *)&v16 initWithGrandSlamAccount:a3 accountStore:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_newFirstName, a5);
    objc_storeStrong((id *)&v14->_newLastName, a6);
  }

  return v14;
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 updateNameURL];

  return v3;
}

- (id)urlRequest
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)AAUpdateNameRequest;
  v3 = [(AAAppleIDSettingsRequest *)&v9 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  newFirstName = self->_newFirstName;
  if (newFirstName)
  {
    newLastName = self->_newLastName;
    if (newLastName)
    {
      v10[0] = @"firstName";
      v10[1] = @"lastName";
      v11[0] = newFirstName;
      v11[1] = newLastName;
      v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
      objc_msgSend(v4, "aa_setBodyWithParameters:", v7);
    }
  }
  [v4 setHTTPMethod:@"POST"];
  [v4 addValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newLastName, 0);

  objc_storeStrong((id *)&self->_newFirstName, 0);
}

@end