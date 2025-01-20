@interface SACommandFailed
- (id)ad_error;
- (id)description;
- (int64_t)resultCallbackCode;
@end

@implementation SACommandFailed

- (int64_t)resultCallbackCode
{
  int64_t result = (int64_t)[(SACommandFailed *)self errorCode];
  if (!result) {
    return -1;
  }
  return result;
}

- (id)ad_error
{
  uint64_t v2 = AFSiriAceErrorDomain;
  id v3 = [(SACommandFailed *)self errorCode];
  return +[NSError errorWithDomain:v2 code:v3 userInfo:0];
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v9.receiver = self;
  v9.super_class = (Class)SACommandFailed;
  v4 = [(SACommandFailed *)&v9 description];
  id v5 = [(SACommandFailed *)self errorCode];
  v6 = [(SACommandFailed *)self reason];
  id v7 = [v3 initWithFormat:@"%@ errorCode: %ld reason: %@", v4, v5, v6];

  return v7;
}

@end