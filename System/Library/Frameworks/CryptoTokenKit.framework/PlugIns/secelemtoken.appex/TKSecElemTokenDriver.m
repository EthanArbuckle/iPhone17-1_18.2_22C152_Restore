@interface TKSecElemTokenDriver
- (id)tokenDriver:(id)a3 tokenForConfiguration:(id)a4 error:(id *)a5;
- (void)tokenDriver:(id)a3 configure:(id)a4;
@end

@implementation TKSecElemTokenDriver

- (id)tokenDriver:(id)a3 tokenForConfiguration:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = [TKSecElemToken alloc];
  v9 = [v7 instanceID];

  v10 = [(TKSecElemToken *)v8 initWithTokenDriver:self instanceID:v9 error:a5];

  return v10;
}

- (void)tokenDriver:(id)a3 configure:(id)a4
{
  id v4 = [a4 addTokenConfigurationForTokenInstanceID:&stru_100008700];
}

@end