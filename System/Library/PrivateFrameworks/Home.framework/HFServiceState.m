@interface HFServiceState
+ (Class)stateClassForServiceDescriptor:(id)a3;
+ (NAIdentity)na_identity;
+ (NSSet)optionalCharacteristicTypes;
+ (NSSet)requiredCharacteristicTypes;
+ (NSString)stateClassIdentifier;
+ (id)stateForServiceDescriptor:(id)a3 withBatchReadResponse:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTransitioning;
- (HFServiceState)initWithBatchReadResponse:(id)a3;
- (unint64_t)hash;
@end

@implementation HFServiceState

+ (Class)stateClassForServiceDescriptor:(id)a3
{
  id v3 = a3;
  v4 = [v3 serviceSubtype];
  v5 = v4;
  if (!v4 || [v4 isEqualToString:*MEMORY[0x263F0D5E8]])
  {
    v6 = (void *)MEMORY[0x263F0E708];
    v7 = [v3 serviceType];
    uint64_t v8 = objc_msgSend(v6, "hf_defaultServiceSubtypeForServiceType:", v7);

    v5 = (void *)v8;
  }
  v9 = [v3 serviceType];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F0D880]];

  if (v10)
  {
    if (_MergedGlobals_15 != -1) {
      dispatch_once(&_MergedGlobals_15, &__block_literal_global_9_8);
    }
    id v11 = (id)qword_26AB2E7D8;
    v12 = [v11 objectForKeyedSubscript:v5];
  }
  else
  {
    if (qword_26AB2E7E0 != -1) {
      dispatch_once(&qword_26AB2E7E0, &__block_literal_global_19_8);
    }
    id v11 = (id)qword_26AB2E7E8;
    v13 = [v3 serviceType];
    v12 = [v11 objectForKeyedSubscript:v13];
  }
  return (Class)v12;
}

- (BOOL)isTransitioning
{
  return 0;
}

+ (NSSet)optionalCharacteristicTypes
{
  return (NSSet *)[MEMORY[0x263EFFA08] set];
}

uint64_t __49__HFServiceState_stateClassForServiceDescriptor___block_invoke_2()
{
  v4[4] = *MEMORY[0x263EF8340];
  v3[0] = *MEMORY[0x263F0D5C0];
  v4[0] = objc_opt_class();
  v3[1] = *MEMORY[0x263F0D5D8];
  v4[1] = objc_opt_class();
  v3[2] = *MEMORY[0x263F0D5B8];
  v4[2] = objc_opt_class();
  v3[3] = *MEMORY[0x263F0D5F0];
  v4[3] = objc_opt_class();
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  uint64_t v1 = qword_26AB2E7D8;
  qword_26AB2E7D8 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __49__HFServiceState_stateClassForServiceDescriptor___block_invoke_5()
{
  v4[4] = *MEMORY[0x263EF8340];
  v3[0] = *MEMORY[0x263F0D6D8];
  v4[0] = objc_opt_class();
  v3[1] = *MEMORY[0x263F0D740];
  v4[1] = objc_opt_class();
  v3[2] = *MEMORY[0x263F0D898];
  v4[2] = objc_opt_class();
  v3[3] = *MEMORY[0x263F0D8A0];
  v4[3] = objc_opt_class();
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  uint64_t v1 = qword_26AB2E7E8;
  qword_26AB2E7E8 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (NSString)stateClassIdentifier
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFServiceState.m", 21, @"%s is an abstract method that must be overriden by subclass %@", "+[HFServiceState stateClassIdentifier]", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (NSSet)requiredCharacteristicTypes
{
  return (NSSet *)[MEMORY[0x263EFFA08] set];
}

- (HFServiceState)initWithBatchReadResponse:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HFServiceState.m", 37, @"%s is an abstract method that must be overriden by subclass %@", "-[HFServiceState initWithBatchReadResponse:]", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (id)stateForServiceDescriptor:(id)a3 withBatchReadResponse:(id)a4
{
  id v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "stateClassForServiceDescriptor:", a3)), "initWithBatchReadResponse:", v6);

  return v7;
}

+ (NAIdentity)na_identity
{
  if (qword_26AB2E7F0 != -1) {
    dispatch_once(&qword_26AB2E7F0, &__block_literal_global_27_9);
  }
  v2 = (void *)qword_26AB2E7F8;
  return (NAIdentity *)v2;
}

void __29__HFServiceState_na_identity__block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_34_4];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_36_2];
  uint64_t v3 = [v0 build];

  v4 = (void *)qword_26AB2E7F8;
  qword_26AB2E7F8 = v3;
}

uint64_t __29__HFServiceState_na_identity__block_invoke_4()
{
  uint64_t v0 = objc_opt_class();
  return [v0 stateClassIdentifier];
}

uint64_t __29__HFServiceState_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 stateTypeIdentifier];
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

@end