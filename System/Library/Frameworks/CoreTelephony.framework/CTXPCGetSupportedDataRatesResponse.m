@interface CTXPCGetSupportedDataRatesResponse
+ (id)allowedClassesForArguments;
- (CTSupportedMaxDataRates)rates;
- (CTXPCGetSupportedDataRatesResponse)initWithSupportedRates:(id)a3;
@end

@implementation CTXPCGetSupportedDataRatesResponse

- (CTXPCGetSupportedDataRatesResponse)initWithSupportedRates:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"supportedDataRates";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetSupportedDataRatesResponse;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (CTSupportedMaxDataRates)rates
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"supportedDataRates"];
  id v4 = CTThrowingCastIfClass<CTSupportedMaxDataRates>(v3);

  return (CTSupportedMaxDataRates *)v4;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetSupportedDataRatesResponse;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end