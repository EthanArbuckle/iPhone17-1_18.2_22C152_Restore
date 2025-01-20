@interface DTUVShellPipeService
+ (void)registerCapabilities:(id)a3;
- (id)createExternalService:(id)a3 error:(id *)a4;
@end

@implementation DTUVShellPipeService

+ (void)registerCapabilities:(id)a3
{
}

- (id)createExternalService:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = DTUVSharedServiceFactory(a4);
  if (objc_opt_respondsToSelector())
  {
    v14 = (void *)[v6 newShellPipeService:v5 error:a4];
  }
  else if (a4)
  {
    DTUVServiceError(@"This version of PreviewsOSSupport doesn't support shell message streams. Please update your OS.", v7, v8, v9, v10, v11, v12, v13, v16);
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end