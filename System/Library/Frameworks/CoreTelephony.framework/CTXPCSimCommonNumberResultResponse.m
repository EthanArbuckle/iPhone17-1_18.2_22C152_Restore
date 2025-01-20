@interface CTXPCSimCommonNumberResultResponse
+ (id)allowedClassesForArguments;
- (CTXPCSimCommonNumberResultResponse)initWithResult:(id)a3;
- (NSNumber)result;
@end

@implementation CTXPCSimCommonNumberResultResponse

- (CTXPCSimCommonNumberResultResponse)initWithResult:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"result";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCSimCommonNumberResultResponse;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (NSNumber)result
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"result"];
  id v4 = CTThrowingCastIfClass<NSNumber>(v3);

  return (NSNumber *)v4;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCSimCommonNumberResultResponse;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end