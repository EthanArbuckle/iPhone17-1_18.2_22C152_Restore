@interface DAOAuthSafariViewController
+ (id)authenticationSessionWithURL:(id)a3 handler:(id)a4;
@end

@implementation DAOAuthSafariViewController

+ (id)authenticationSessionWithURL:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 scheme];
  if ([v7 isEqualToString:@"http"])
  {

LABEL_4:
    id v10 = objc_alloc(MEMORY[0x263EFC480]);
    v11 = [v5 scheme];
    v12 = (void *)[v10 initWithURL:v5 callbackURLScheme:v11 completionHandler:v6];

    goto LABEL_6;
  }
  v8 = [v5 scheme];
  int v9 = [v8 isEqualToString:@"https"];

  if (v9) {
    goto LABEL_4;
  }
  v12 = 0;
LABEL_6:

  return v12;
}

@end