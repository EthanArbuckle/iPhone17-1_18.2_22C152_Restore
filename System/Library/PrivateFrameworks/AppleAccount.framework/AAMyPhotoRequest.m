@interface AAMyPhotoRequest
+ (Class)responseClass;
- (AAMyPhotoRequest)initWithAccount:(id)a3;
- (ACAccount)iTunesAccount;
- (NSString)serverCacheTag;
- (id)urlRequest;
- (id)urlString;
- (void)setServerCacheTag:(id)a3;
- (void)setiTunesAccount:(id)a3;
@end

@implementation AAMyPhotoRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AAMyPhotoRequest)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAMyPhotoRequest;
  v6 = [(AAMyPhotoRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 getMyPhotoURL];

  return v3;
}

- (id)urlRequest
{
  v7.receiver = self;
  v7.super_class = (Class)AAMyPhotoRequest;
  v3 = [(AARequest *)&v7 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"GET"];
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  serverCacheTag = self->_serverCacheTag;
  if (serverCacheTag) {
    [v4 setValue:serverCacheTag forHTTPHeaderField:@"ETag"];
  }

  return v4;
}

- (NSString)serverCacheTag
{
  return self->_serverCacheTag;
}

- (void)setServerCacheTag:(id)a3
{
}

- (ACAccount)iTunesAccount
{
  return self->_iTunesAccount;
}

- (void)setiTunesAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
  objc_storeStrong((id *)&self->_serverCacheTag, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end