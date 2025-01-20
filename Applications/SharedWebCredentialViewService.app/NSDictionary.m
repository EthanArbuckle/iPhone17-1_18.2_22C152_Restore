@interface NSDictionary
- (int64_t)compareCredentialDictionaryAscending:(id)a3;
@end

@implementation NSDictionary

- (int64_t)compareCredentialDictionaryAscending:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSDictionary *)self objectForKey:@"acct"];
  uint64_t v6 = [v4 objectForKey:@"acct"];
  v7 = &stru_1000084A0;
  if (v5) {
    v8 = (__CFString *)v5;
  }
  else {
    v8 = &stru_1000084A0;
  }
  if (v6) {
    v9 = (__CFString *)v6;
  }
  else {
    v9 = &stru_1000084A0;
  }
  id v10 = [(__CFString *)v8 localizedCaseInsensitiveCompare:v9];
  if (!v10)
  {
    v11 = [(NSDictionary *)self objectForKey:@"srvr"];
    uint64_t v12 = [v4 objectForKey:@"srvr"];
    if (!v11) {
      v11 = &stru_1000084A0;
    }
    if (v12) {
      v7 = (__CFString *)v12;
    }
    id v10 = [(__CFString *)v11 localizedCaseInsensitiveCompare:v7];
  }
  return (int64_t)v10;
}

@end