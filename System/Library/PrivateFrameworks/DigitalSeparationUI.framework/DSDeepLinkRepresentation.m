@interface DSDeepLinkRepresentation
- (BOOL)flowRequiresAuth;
- (DSDeepLinkRepresentation)initWithOrder:(id)a3 orderType:(int64_t)a4 chapters:(id)a5 requiresAuth:(BOOL)a6 flowType:(int64_t)a7 entrypointAnalytic:(id)a8 path:(id)a9;
- (NSArray)navigationOrder;
- (NSDictionary)navigationChapters;
- (NSString)entrypoint;
- (NSString)remoteUIURL;
- (int64_t)flowType;
- (int64_t)navigationType;
@end

@implementation DSDeepLinkRepresentation

- (DSDeepLinkRepresentation)initWithOrder:(id)a3 orderType:(int64_t)a4 chapters:(id)a5 requiresAuth:(BOOL)a6 flowType:(int64_t)a7 entrypointAnalytic:(id)a8 path:(id)a9
{
  id v22 = a3;
  id v15 = a5;
  id v16 = a8;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)DSDeepLinkRepresentation;
  v18 = [(DSDeepLinkRepresentation *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_navigationOrder, a3);
    v19->_navigationType = a4;
    objc_storeStrong((id *)&v19->_navigationChapters, a5);
    v19->_flowRequiresAuth = a6;
    v19->_flowType = a7;
    objc_storeStrong((id *)&v19->_entrypoint, a8);
    objc_storeStrong((id *)&v19->_path, a9);
  }

  return v19;
}

- (NSString)remoteUIURL
{
  if ([(NSString *)self->_path hasPrefix:@"https"]) {
    path = (__CFString *)self->_path;
  }
  else {
    path = &stru_26E9097D0;
  }
  return (NSString *)path;
}

- (NSArray)navigationOrder
{
  return self->_navigationOrder;
}

- (NSDictionary)navigationChapters
{
  return self->_navigationChapters;
}

- (int64_t)navigationType
{
  return self->_navigationType;
}

- (BOOL)flowRequiresAuth
{
  return self->_flowRequiresAuth;
}

- (int64_t)flowType
{
  return self->_flowType;
}

- (NSString)entrypoint
{
  return self->_entrypoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entrypoint, 0);
  objc_storeStrong((id *)&self->_navigationChapters, 0);
  objc_storeStrong((id *)&self->_navigationOrder, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end