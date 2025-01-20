@interface HFServiceDescriptor
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (HFServiceDescriptor)init;
- (HFServiceDescriptor)initWithServiceType:(id)a3 serviceSubtype:(id)a4 parentServiceDescriptor:(id)a5;
- (HFServiceDescriptor)initWithServiceType:(id)a3 serviceSubtype:(id)a4 parentServiceDescriptorGenerator:(id)a5;
- (HFServiceDescriptor)parentServiceDescriptor;
- (NSString)serviceSubtype;
- (NSString)serviceType;
- (id)parentServiceDescriptorGenerator;
- (unint64_t)hash;
@end

@implementation HFServiceDescriptor

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)serviceSubtype
{
  return self->_serviceSubtype;
}

- (HFServiceDescriptor)initWithServiceType:(id)a3 serviceSubtype:(id)a4 parentServiceDescriptor:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__HFServiceDescriptor_initWithServiceType_serviceSubtype_parentServiceDescriptor___block_invoke;
  v12[3] = &unk_264094718;
  id v13 = v8;
  id v9 = v8;
  v10 = [(HFServiceDescriptor *)self initWithServiceType:a3 serviceSubtype:a4 parentServiceDescriptorGenerator:v12];

  return v10;
}

- (HFServiceDescriptor)initWithServiceType:(id)a3 serviceSubtype:(id)a4 parentServiceDescriptorGenerator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HFServiceDescriptor;
  v12 = [(HFServiceDescriptor *)&v17 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceType, a3);
    objc_storeStrong((id *)&v13->_serviceSubtype, a4);
    uint64_t v14 = [v11 copy];
    id parentServiceDescriptorGenerator = v13->_parentServiceDescriptorGenerator;
    v13->_id parentServiceDescriptorGenerator = (id)v14;
  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_parentServiceDescriptorGenerator, 0);
  objc_storeStrong((id *)&self->_serviceSubtype, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_parentServiceDescriptor, 0);
}

void __34__HFServiceDescriptor_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_17_5];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_19_2];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_22_5];
  uint64_t v4 = [v0 build];

  v5 = (void *)qword_26AB2F0E8;
  qword_26AB2F0E8 = v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_252 != -1) {
    dispatch_once(&_MergedGlobals_252, &__block_literal_global_10_5);
  }
  id v2 = (void *)qword_26AB2F0E8;
  return (NAIdentity *)v2;
}

uint64_t __34__HFServiceDescriptor_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 parentServiceDescriptor];
}

uint64_t __34__HFServiceDescriptor_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 serviceSubtype];
}

uint64_t __34__HFServiceDescriptor_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serviceType];
}

- (HFServiceDescriptor)parentServiceDescriptor
{
  parentServiceDescriptor = self->_parentServiceDescriptor;
  if (!parentServiceDescriptor)
  {
    unint64_t v4 = [(HFServiceDescriptor *)self parentServiceDescriptorGenerator];
    v4[2]();
    v5 = (HFServiceDescriptor *)objc_claimAutoreleasedReturnValue();
    v6 = self->_parentServiceDescriptor;
    self->_parentServiceDescriptor = v5;

    parentServiceDescriptor = self->_parentServiceDescriptor;
  }
  return parentServiceDescriptor;
}

- (id)parentServiceDescriptorGenerator
{
  return self->_parentServiceDescriptorGenerator;
}

- (HFServiceDescriptor)init
{
  unint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithServiceType_serviceSubtype_parentServiceDescriptor_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFServiceDescriptor.m", 20, @"%s is unavailable; use %@ instead",
    "-[HFServiceDescriptor init]",
    v5);

  return 0;
}

id __82__HFServiceDescriptor_initWithServiceType_serviceSubtype_parentServiceDescriptor___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end