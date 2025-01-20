@interface CTXPCSimHardwareInfoResponse
+ (id)allowedClassesForArguments;
- (CTSimHardwareInfo)hardwareInfo;
- (CTXPCSimHardwareInfoResponse)initWithHardwareInfo:(id)a3;
@end

@implementation CTXPCSimHardwareInfoResponse

- (CTXPCSimHardwareInfoResponse)initWithHardwareInfo:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"hardware-info";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCSimHardwareInfoResponse;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (CTSimHardwareInfo)hardwareInfo
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"hardware-info"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CTSimHardwareInfo *)v4;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCSimHardwareInfoResponse;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  id v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end