@interface CTXPCGetOperatorNameResponse
- (CTXPCGetOperatorNameResponse)initWithOperatorName:(id)a3;
- (NSString)operatorName;
@end

@implementation CTXPCGetOperatorNameResponse

- (NSString)operatorName
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"operatorName"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return (NSString *)v4;
}

- (CTXPCGetOperatorNameResponse)initWithOperatorName:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"operatorName";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetOperatorNameResponse;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

@end