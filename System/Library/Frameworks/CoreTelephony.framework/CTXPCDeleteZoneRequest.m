@interface CTXPCDeleteZoneRequest
+ (id)allowedClassesForArguments;
- (CTXPCDeleteZoneRequest)initWithZone:(id)a3;
- (id)zoneID;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCDeleteZoneRequest

- (CTXPCDeleteZoneRequest)initWithZone:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"zone";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCDeleteZoneRequest;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CTXPCDeleteZoneRequest *)self zoneID];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __70__CTXPCDeleteZoneRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E5262CB0;
  id v9 = v7;
  id v11 = v9;
  [v6 deleteZone:v8 completion:v10];
}

void __70__CTXPCDeleteZoneRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [[CTXPCBooleanResponseMessage alloc] initWithResult:a2];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

- (int)requiredEntitlement
{
  return 3;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCDeleteZoneRequest;
  uint64_t v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (id)zoneID
{
  uint64_t v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"zone"];
  id v4 = CTThrowingCastIfClass<NSString>(v3);

  return v4;
}

@end