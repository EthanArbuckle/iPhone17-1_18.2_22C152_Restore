@interface NSError
- (BOOL)isAuthenticationUserCancelled;
- (BOOL)isVettedToSelfError;
@end

@implementation NSError

- (BOOL)isVettedToSelfError
{
  v3 = [(NSError *)self domain];
  unsigned int v4 = [v3 isEqualToString:CKErrorDomain];

  if (!v4) {
    return 0;
  }
  v5 = [(NSError *)self userInfo];
  v6 = [v5 objectForKeyedSubscript:NSUnderlyingErrorKey];

  BOOL v7 = [v6 code] == (id)8007;
  return v7;
}

- (BOOL)isAuthenticationUserCancelled
{
  v3 = [(NSError *)self domain];
  unsigned int v4 = [v3 isEqualToString:CKErrorDomain];

  if (!v4) {
    return 0;
  }
  v5 = [(NSError *)self userInfo];
  v6 = [v5 objectForKeyedSubscript:NSUnderlyingErrorKey];

  if ([v6 code] == (id)8011 || objc_msgSend(v6, "code") == (id)2012)
  {
    BOOL v7 = [v6 userInfo];
    v8 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];

    BOOL v9 = [v8 code] == (id)-7003;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

@end