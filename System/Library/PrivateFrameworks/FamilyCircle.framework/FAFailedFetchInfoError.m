@interface FAFailedFetchInfoError
+ (id)errorWithCachedFamilyCircle:(id)a3 underlyingError:(id)a4;
- (FAFailedFetchInfoError)initWithCachedFamilyCircle:(id)a3 underlyingError:(id)a4;
- (FAFamilyCircle)cachedFamilyCircle;
- (NSError)underlyingError;
@end

@implementation FAFailedFetchInfoError

+ (id)errorWithCachedFamilyCircle:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v5 userInfo];
  id v8 = [v7 mutableCopy];

  [v8 removeObjectForKey:@"NSErrorPeerCertificateChainKey"];
  [v8 removeObjectForKey:@"NSErrorClientCertificateChainKey"];
  [v8 removeObjectForKey:NSURLErrorFailingURLPeerTrustErrorKey];
  [v8 removeObjectForKey:NSUnderlyingErrorKey];
  v9 = [v5 domain];
  id v10 = [v5 code];

  v11 = +[NSError errorWithDomain:v9 code:v10 userInfo:v8];

  v12 = [[FAFailedFetchInfoError alloc] initWithCachedFamilyCircle:v6 underlyingError:v11];
  return v12;
}

- (FAFailedFetchInfoError)initWithCachedFamilyCircle:(id)a3 underlyingError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 domain];
  id v10 = [v8 code];
  v11 = [v8 userInfo];
  v14.receiver = self;
  v14.super_class = (Class)FAFailedFetchInfoError;
  v12 = [(FAFailedFetchInfoError *)&v14 initWithDomain:v9 code:v10 userInfo:v11];

  if (v12)
  {
    objc_storeStrong((id *)&v12->_underlyingError, a4);
    objc_storeStrong((id *)&v12->_cachedFamilyCircle, a3);
  }

  return v12;
}

- (FAFamilyCircle)cachedFamilyCircle
{
  return self->_cachedFamilyCircle;
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_cachedFamilyCircle, 0);
}

@end