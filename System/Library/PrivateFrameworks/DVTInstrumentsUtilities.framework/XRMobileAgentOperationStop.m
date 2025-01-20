@interface XRMobileAgentOperationStop
- (void)receiveMobileAgent:(id)a3;
@end

@implementation XRMobileAgentOperationStop

- (void)receiveMobileAgent:(id)a3
{
  id v20 = a3;
  [v20 hello:v3 v4:v5 v6:v6];
  v11 = [v20 v7:v8 v9:v10];
  [v11 v12:v13 v14:v15];

  [v20 goodbye:v16 v17:v18 v19:v19];
}

@end