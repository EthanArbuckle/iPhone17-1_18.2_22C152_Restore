@interface CTXPCGetCameraScanInfoForCardDataResponse
+ (id)allowedClassesForArguments;
- (CTCellularPlanManagerCameraScanAction)action;
- (CTXPCGetCameraScanInfoForCardDataResponse)initWithAction:(id)a3;
@end

@implementation CTXPCGetCameraScanInfoForCardDataResponse

- (CTXPCGetCameraScanInfoForCardDataResponse)initWithAction:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 setObject:v4 forKeyedSubscript:@"action"];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetCameraScanInfoForCardDataResponse;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (CTCellularPlanManagerCameraScanAction)action
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"action"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CTCellularPlanManagerCameraScanAction *)v4;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetCameraScanInfoForCardDataResponse;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  id v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end