@interface CTXPCGetRemoteDeviceForTransferResponse
+ (id)allowedClassesForArguments;
- (CTRemoteDevice)device;
- (CTXPCGetRemoteDeviceForTransferResponse)initWithDevice:(id)a3;
@end

@implementation CTXPCGetRemoteDeviceForTransferResponse

- (CTXPCGetRemoteDeviceForTransferResponse)initWithDevice:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"device";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetRemoteDeviceForTransferResponse;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (CTRemoteDevice)device
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKeyedSubscript:@"device"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CTRemoteDevice *)v4;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetRemoteDeviceForTransferResponse;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  id v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end