@interface CTXPCGetEncryptionStatusResponse
+ (id)allowedClassesForArguments;
- (CTEncryptionStatusInfo)info;
- (CTXPCGetEncryptionStatusResponse)initWithEncryptionStatusInfo:(id)a3;
@end

@implementation CTXPCGetEncryptionStatusResponse

- (CTXPCGetEncryptionStatusResponse)initWithEncryptionStatusInfo:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"info";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetEncryptionStatusResponse;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (CTEncryptionStatusInfo)info
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"info"];
  id v4 = CTThrowingCastIfClass<CTEncryptionStatusInfo>(v3);

  return (CTEncryptionStatusInfo *)v4;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetEncryptionStatusResponse;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end