@interface AAInitiateEmailVettingRequest
- (id)bodyDictionary;
- (id)urlString;
@end

@implementation AAInitiateEmailVettingRequest

- (id)urlString
{
  v3 = +[AAURLConfiguration urlConfiguration];
  v4 = [v3 initiateValidateEmailURL];

  v5 = [(AAEmailVettingRequest *)self account];
  v6 = [v5 username];
  v7 = [v4 stringByReplacingOccurrencesOfString:@"$APPLE_ID$" withString:v6];

  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v7];
    v9 = [v8 string];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)bodyDictionary
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  v3 = [(AAEmailVettingRequest *)self account];
  v4 = objc_msgSend(v3, "aa_primaryEmail");
  v5 = [v2 dictionaryWithObject:v4 forKey:@"emailToVet"];

  return v5;
}

@end