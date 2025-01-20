@interface CRKASMNetworkCheckingRosterProvider
+ (id)reachabilityError;
- (CATNetworkReachability)networkReachability;
- (CRKASMNetworkCheckingRosterProvider)initWithRosterProvider:(id)a3;
- (void)createCourseWithProperties:(id)a3 completion:(id)a4;
- (void)removeCourseWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5;
@end

@implementation CRKASMNetworkCheckingRosterProvider

- (CRKASMNetworkCheckingRosterProvider)initWithRosterProvider:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRKASMNetworkCheckingRosterProvider;
  v3 = [(CRKASMRosterProviderDecoratorBase *)&v9 initWithRosterProvider:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F39C80] reachabilityForInternetConnection];
    networkReachability = v3->_networkReachability;
    v3->_networkReachability = (CATNetworkReachability *)v4;

    v6 = v3->_networkReachability;
    v7 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [(CATNetworkReachability *)v6 scheduleInRunLoop:v7 forMode:*MEMORY[0x263EFF478]];
  }
  return v3;
}

- (void)createCourseWithProperties:(id)a3 completion:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = [(CRKASMNetworkCheckingRosterProvider *)self networkReachability];
  char v8 = [v7 isReachable];

  if (v8)
  {
    objc_super v9 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
    [v9 createCourseWithProperties:v10 completion:v6];
  }
  else
  {
    objc_super v9 = [(id)objc_opt_class() reachabilityError];
    v6[2](v6, v9);
  }
}

- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  objc_super v9 = (void (**)(id, void *))a5;
  id v10 = [(CRKASMNetworkCheckingRosterProvider *)self networkReachability];
  char v11 = [v10 isReachable];

  if (v11)
  {
    v12 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
    [v12 updateCourseWithIdentifier:v13 properties:v8 completion:v9];
  }
  else
  {
    v12 = [(id)objc_opt_class() reachabilityError];
    v9[2](v9, v12);
  }
}

- (void)removeCourseWithIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = [(CRKASMNetworkCheckingRosterProvider *)self networkReachability];
  char v8 = [v7 isReachable];

  if (v8)
  {
    objc_super v9 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
    [v9 removeCourseWithIdentifier:v10 completion:v6];
  }
  else
  {
    objc_super v9 = [(id)objc_opt_class() reachabilityError];
    v6[2](v6, v9);
  }
}

+ (id)reachabilityError
{
  return CRKErrorWithCodeAndUserInfo(156, 0);
}

- (CATNetworkReachability)networkReachability
{
  return self->_networkReachability;
}

- (void).cxx_destruct
{
}

@end