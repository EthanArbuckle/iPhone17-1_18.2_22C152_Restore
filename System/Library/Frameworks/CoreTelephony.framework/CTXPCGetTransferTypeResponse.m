@interface CTXPCGetTransferTypeResponse
+ (id)allowedClassesForArguments;
- (CTXPCGetTransferTypeResponse)initWithCapability:(unint64_t)a3;
- (unint64_t)capability;
@end

@implementation CTXPCGetTransferTypeResponse

- (CTXPCGetTransferTypeResponse)initWithCapability:(unint64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"capability";
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetTransferTypeResponse;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (unint64_t)capability
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"capability"];
  v4 = CTThrowingCastIfClass<NSNumber>(v3);

  unint64_t v5 = [v4 unsignedIntegerValue];
  return v5;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetTransferTypeResponse;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end