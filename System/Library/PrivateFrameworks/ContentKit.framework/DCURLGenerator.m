@interface DCURLGenerator
- (NSString)host;
- (NSString)path;
- (NSString)query;
- (NSString)scheme;
- (id)URL;
@end

@implementation DCURLGenerator

- (NSString)query
{
  return 0;
}

- (NSString)path
{
  return 0;
}

- (NSString)host
{
  return 0;
}

- (NSString)scheme
{
  return 0;
}

- (id)URL
{
  v3 = [(DCURLGenerator *)self query];
  v4 = NSURL;
  v5 = NSString;
  v6 = [(DCURLGenerator *)self scheme];
  uint64_t v7 = [(DCURLGenerator *)self host];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = &stru_26C71CE08;
  }
  uint64_t v10 = [(DCURLGenerator *)self path];
  v11 = (void *)v10;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = &stru_26C71CE08;
  }
  v13 = @"?";
  if (v3)
  {
    v14 = v3;
  }
  else
  {
    v13 = &stru_26C71CE08;
    v14 = &stru_26C71CE08;
  }
  v15 = [v5 stringWithFormat:@"%@://%@%@%@%@", v6, v9, v12, v13, v14];
  v16 = [v4 URLWithString:v15];

  return v16;
}

@end