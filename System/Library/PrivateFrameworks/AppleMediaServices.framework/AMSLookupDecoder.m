@interface AMSLookupDecoder
- (id)resultFromResult:(id)a3 error:(id *)a4;
@end

@implementation AMSLookupDecoder

- (id)resultFromResult:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = [AMSLookupResult alloc];
  v6 = [v4 object];
  v7 = [(AMSLookupResult *)v5 initWithResult:v4 dictionary:v6];

  v8 = [v4 response];

  if (v8)
  {
    objc_msgSend(v8, "ams_expirationInterval");
    if (v9 >= 0.0)
    {
      v10 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:");
      [(AMSLookupResult *)v7 setExpirationDate:v10];
    }
  }

  return v7;
}

@end