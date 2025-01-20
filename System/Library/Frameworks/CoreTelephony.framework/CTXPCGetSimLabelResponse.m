@interface CTXPCGetSimLabelResponse
+ (id)allowedClassesForArguments;
- (CTSimLabel)simLabel;
- (CTXPCGetSimLabelResponse)initWithLabel:(id)a3;
@end

@implementation CTXPCGetSimLabelResponse

- (CTXPCGetSimLabelResponse)initWithLabel:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"label";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetSimLabelResponse;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (CTSimLabel)simLabel
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"label"];
  id v4 = CTThrowingCastIfClass<CTSimLabel>(v3);

  return (CTSimLabel *)v4;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetSimLabelResponse;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end