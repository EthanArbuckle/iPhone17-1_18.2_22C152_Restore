@interface NSDictionary(Action)
+ (id)hmd_dictionaryWithActionExecutionError:()Action;
@end

@implementation NSDictionary(Action)

+ (id)hmd_dictionaryWithActionExecutionError:()Action
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v6 = @"HM.genericErrorDataKey";
    v3 = encodeRootObjectForIncomingXPCMessage(a3, 0);
    v7 = v3;
    v4 = [NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  }
  else
  {
    v8 = @"HM.genericSuccessDataKey";
    v9[0] = @"Success";
    v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  return v4;
}

@end