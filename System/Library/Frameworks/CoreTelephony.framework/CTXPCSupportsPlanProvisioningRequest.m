@interface CTXPCSupportsPlanProvisioningRequest
+ (id)allowedClassesForArguments;
- (CTXPCSupportsPlanProvisioningRequest)initWithCarrierDescriptors:(id)a3 smdpUrl:(id)a4 iccidPrefix:(id)a5;
- (id)carrierDescriptors;
- (id)iccidPrefix;
- (id)smdpUrl;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCSupportsPlanProvisioningRequest

- (CTXPCSupportsPlanProvisioningRequest)initWithCarrierDescriptors:(id)a3 smdpUrl:(id)a4 iccidPrefix:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_opt_new();
  [v11 setObject:v8 forKeyedSubscript:@"carrierDescriptors"];
  [v11 setObject:v9 forKeyedSubscript:@"smdpUrl"];
  [v11 setObject:v10 forKeyedSubscript:@"iccidPrefix"];
  v14.receiver = self;
  v14.super_class = (Class)CTXPCSupportsPlanProvisioningRequest;
  v12 = [(CTXPCMessage *)&v14 initWithNamedArguments:v11];

  return v12;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CTXPCSupportsPlanProvisioningRequest *)self carrierDescriptors];
  id v9 = [(CTXPCSupportsPlanProvisioningRequest *)self smdpUrl];
  id v10 = [(CTXPCSupportsPlanProvisioningRequest *)self iccidPrefix];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__CTXPCSupportsPlanProvisioningRequest_performRequestWithHandler_completionHandler___block_invoke;
  v12[3] = &unk_1E5262CB0;
  id v11 = v7;
  id v13 = v11;
  [v6 supportsPlanProvisioning:0 carrierDescriptors:v8 smdpUrl:v9 iccidPrefix:v10 completionHandler:v12];
}

void __84__CTXPCSupportsPlanProvisioningRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [[CTXPCBooleanResponseMessage alloc] initWithResult:a2];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

- (int)requiredEntitlement
{
  return 26;
}

+ (id)allowedClassesForArguments
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCSupportsPlanProvisioningRequest;
  uint64_t v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (id)carrierDescriptors
{
  uint64_t v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"carrierDescriptors"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)smdpUrl
{
  uint64_t v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"smdpUrl"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)iccidPrefix
{
  uint64_t v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"iccidPrefix"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end