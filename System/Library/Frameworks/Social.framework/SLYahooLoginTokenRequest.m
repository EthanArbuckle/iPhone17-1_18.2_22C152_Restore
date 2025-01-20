@interface SLYahooLoginTokenRequest
+ (id)urlRequestForLoginTokenFromUsername:(id)a3 password:(id)a4 src:(id)a5;
@end

@implementation SLYahooLoginTokenRequest

+ (id)urlRequestForLoginTokenFromUsername:(id)a3 password:(id)a4 src:(id)a5
{
  v5 = (void *)MEMORY[0x1E4F1CB10];
  v6 = [NSString stringWithFormat:@"https://login.yahoo.com/config/pwtoken_get?login=%@&passwd=%@&src=%@", a3, a4, a5];
  v7 = [v5 URLWithString:v6];

  v8 = [MEMORY[0x1E4F28E88] requestWithURL:v7];
  [v8 setCachePolicy:1];
  [v8 setHTTPMethod:@"GET"];

  return v8;
}

@end