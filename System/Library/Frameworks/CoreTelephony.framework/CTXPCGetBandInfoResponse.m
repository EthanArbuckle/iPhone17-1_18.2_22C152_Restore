@interface CTXPCGetBandInfoResponse
+ (id)allowedClassesForArguments;
- (CTBandInfo)bandInfo;
- (CTXPCGetBandInfoResponse)initWithBandInfo:(id)a3;
- (CTXPCGetBandInfoResponse)initWithBandMasks:(id)a3;
- (NSDictionary)bandMasks;
@end

@implementation CTXPCGetBandInfoResponse

- (CTXPCGetBandInfoResponse)initWithBandMasks:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"bands";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetBandInfoResponse;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (CTXPCGetBandInfoResponse)initWithBandInfo:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"bands";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetBandInfoResponse;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (NSDictionary)bandMasks
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"bands"];
  id v4 = CTThrowingCastIfClass<NSDictionary>(v3);

  return (NSDictionary *)v4;
}

- (CTBandInfo)bandInfo
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"bands"];
  id v4 = CTThrowingCastIfClass<CTBandInfo>(v3);

  return (CTBandInfo *)v4;
}

+ (id)allowedClassesForArguments
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCGetBandInfoResponse;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  id v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

@end