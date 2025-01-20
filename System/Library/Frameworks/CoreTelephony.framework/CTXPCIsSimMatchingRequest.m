@interface CTXPCIsSimMatchingRequest
+ (BOOL)supportsSecureCoding;
- (CTXPCIsSimMatchingRequest)initWithCoder:(id)a3;
- (CTXPCIsSimMatchingRequest)initWithDescriptor:(id)a3 carrierDescriptors:(id)a4;
- (NSArray)carrierDescriptors;
- (int)requiredEntitlement;
- (void)encodeWithCoder:(id)a3;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
- (void)setCarrierDescriptors:(id)a3;
@end

@implementation CTXPCIsSimMatchingRequest

- (CTXPCIsSimMatchingRequest)initWithDescriptor:(id)a3 carrierDescriptors:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CTXPCIsSimMatchingRequest;
  v8 = [(CTXPCSubscriptionContextRequest *)&v11 initWithDescriptor:a3 namedArguments:MEMORY[0x1E4F1CC08]];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_carrierDescriptors, a4);
  }

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCSubscriptionContextRequest *)self descriptor];
  v9 = [(CTXPCIsSimMatchingRequest *)self carrierDescriptors];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__CTXPCIsSimMatchingRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5262E68;
  id v10 = v7;
  id v12 = v10;
  [v6 isSimMatching:v8 carrierDescriptors:v9 completion:v11];
}

void __73__CTXPCIsSimMatchingRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  v5 = [CTXPCSimCommonNumberResultResponse alloc];
  id v6 = [NSNumber numberWithBool:a2];
  id v7 = [(CTXPCSimCommonNumberResultResponse *)v5 initWithResult:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 1;
}

- (CTXPCIsSimMatchingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTXPCIsSimMatchingRequest;
  v5 = [(CTXPCMessage *)&v13 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"carrierDescriptors"];
    carrierDescriptors = v5->_carrierDescriptors;
    v5->_carrierDescriptors = (NSArray *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CTXPCIsSimMatchingRequest;
  [(CTXPCMessage *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_carrierDescriptors forKey:@"carrierDescriptors"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)carrierDescriptors
{
  return self->_carrierDescriptors;
}

- (void)setCarrierDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end