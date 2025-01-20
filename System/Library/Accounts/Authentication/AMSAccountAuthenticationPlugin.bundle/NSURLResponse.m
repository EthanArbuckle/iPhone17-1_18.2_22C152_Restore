@interface NSURLResponse
- (NSString)ams_storefront;
@end

@implementation NSURLResponse

- (NSString)ams_storefront
{
  v2 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }

  if (v3)
  {
    v4 = [(NSURLResponse *)v3 allHeaderFields];
    v5 = objc_msgSend(v4, "ams_objectForCaseInsensitiveKey:", AMSHTTPHeaderSetStoreFront);
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      v8 = [(NSURLResponse *)v3 allHeaderFields];
      objc_msgSend(v8, "ams_objectForCaseInsensitiveKey:", @"X-Apple-Request-Store-Front");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v7 = 0;
  }

  return (NSString *)v7;
}

@end