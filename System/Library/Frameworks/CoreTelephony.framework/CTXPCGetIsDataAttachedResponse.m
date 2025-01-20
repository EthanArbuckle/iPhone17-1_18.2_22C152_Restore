@interface CTXPCGetIsDataAttachedResponse
+ (id)allowedClassesForArguments;
- (BOOL)isDataAttached;
- (CTXPCGetIsDataAttachedResponse)initWithIsDataAttached:(BOOL)a3;
@end

@implementation CTXPCGetIsDataAttachedResponse

- (CTXPCGetIsDataAttachedResponse)initWithIsDataAttached:(BOOL)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"isDataAttached";
  v4 = [NSNumber numberWithBool:a3];
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetIsDataAttachedResponse;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (BOOL)isDataAttached
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"isDataAttached"];
  v4 = CTThrowingCastIfClass<NSNumber>(v3);
  char v5 = [v4 BOOLValue];

  return v5;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetIsDataAttachedResponse;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end