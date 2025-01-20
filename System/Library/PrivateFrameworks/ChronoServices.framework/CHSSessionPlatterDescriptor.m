@interface CHSSessionPlatterDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHSSessionPlatterDescriptor)initWithCoder:(id)a3;
- (CHSSessionPlatterDescriptor)initWithExtensionIdentity:(id)a3 activityAttributesType:(id)a4;
- (NSData)activityAttributesType;
- (id)_initWithDescriptor:(id)a3;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)widgetForFamily:(int64_t)a3 activityIdentifier:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSSessionPlatterDescriptor

- (CHSSessionPlatterDescriptor)initWithExtensionIdentity:(id)a3 activityAttributesType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHSSessionPlatterDescriptor;
  v8 = [(CHSBaseDescriptor *)&v12 initWithExtensionIdentity:v6];
  uint64_t v9 = [v7 copy];
  activityAttributesType = v8->_activityAttributesType;
  v8->_activityAttributesType = (NSData *)v9;

  return v8;
}

- (id)_initWithDescriptor:(id)a3
{
  id v4 = a3;
  v5 = [(CHSSessionPlatterDescriptor *)self initWithExtensionIdentity:*((void *)v4 + 1) activityAttributesType:*((void *)v4 + 15)];
  uint64_t v6 = [*((id *)v4 + 3) copy];
  displayName = v5->super._displayName;
  v5->super._displayName = (NSString *)v6;

  uint64_t v8 = [*((id *)v4 + 4) copy];
  widgetDescription = v5->super._widgetDescription;
  v5->super._widgetDescription = (NSString *)v8;

  uint64_t v10 = [*((id *)v4 + 6) copy];
  localeToken = v5->super._localeToken;
  v5->super._localeToken = (NSData *)v10;

  uint64_t v12 = [*((id *)v4 + 5) copy];
  eventMachServiceName = v5->super._eventMachServiceName;
  v5->super._eventMachServiceName = (NSString *)v12;

  v5->super._preferredBackgroundStyle = *((void *)v4 + 7);
  v5->super._supportsVibrantContent = *((unsigned char *)v4 + 64);
  objc_storeStrong((id *)&v5->super._sdkVersion, *((id *)v4 + 10));
  v5->super._version = *((void *)v4 + 9);

  return v5;
}

- (id)widgetForFamily:(int64_t)a3 activityIdentifier:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = [CHSWidget alloc];
    uint64_t v8 = [(CHSBaseDescriptor *)self extensionIdentity];
    a3 = [(CHSWidget *)v7 initWithExtensionIdentity:v8 kind:@"sessionPlatter" family:a3 intent:0 activityIdentifier:v6];
  }
  return (id)a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CHSSessionPlatterDescriptor;
  if ([(CHSBaseDescriptor *)&v16 isEqual:v4])
  {
    v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    uint64_t v6 = objc_opt_class();
    id v7 = v4;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    id v10 = v8;

    if (v10)
    {
      activityAttributesType = self->_activityAttributesType;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __39__CHSSessionPlatterDescriptor_isEqual___block_invoke;
      v14[3] = &unk_1E56C81C8;
      id v15 = v10;
      id v12 = (id)[v5 appendObject:activityAttributesType counterpart:v14];
      char v9 = [v5 isEqual];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

id __39__CHSSessionPlatterDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 120);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  v8.receiver = self;
  v8.super_class = (Class)CHSSessionPlatterDescriptor;
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[CHSBaseDescriptor hash](&v8, sel_hash));
  id v5 = (id)[v3 appendObject:self->_activityAttributesType];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (id)description
{
  return [(CHSSessionPlatterDescriptor *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(CHSSessionPlatterDescriptor *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__CHSSessionPlatterDescriptor_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E56C81F0;
  id v4 = v3;
  id v8 = v4;
  char v9 = self;
  [v4 appendProem:self block:v7];
  id v5 = v4;

  return v5;
}

uint64_t __57__CHSSessionPlatterDescriptor_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 24) withName:@"displayName"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CHSSessionPlatterDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__CHSSessionPlatterDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E56C81F0;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  id v7 = v6;

  return v7;
}

void __69__CHSSessionPlatterDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"extensionIdentity"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 24) withName:@"displayName"];
  id v3 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 72) withName:@"version"];
  id v4 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 56) withName:@"preferredBackgroundStyle"];
  id v5 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(unsigned __int8 *)(*(void *)(a1 + 40) + 64) withName:@"supportsVibrantContent"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 80) withName:@"sdkVersion"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 32) withName:@"widgetDescription"];
  id v6 = *(void **)(a1 + 32);
  id v8 = [*(id *)(*(void *)(a1 + 40) + 48) base64EncodedStringWithOptions:0];
  objc_msgSend(v6, "appendString:withName:");

  id v7 = *(void **)(a1 + 32);
  id v9 = [*(id *)(*(void *)(a1 + 40) + 40) description];
  objc_msgSend(v7, "appendString:withName:");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CHSMutableSessionPlatterDescriptor alloc];
  return [(CHSSessionPlatterDescriptor *)v4 _initWithDescriptor:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CHSSessionPlatterDescriptor;
  [(CHSBaseDescriptor *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_activityAttributesType forKey:@"activityAttributesType"];
}

- (CHSSessionPlatterDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHSSessionPlatterDescriptor;
  objc_super v5 = [(CHSBaseDescriptor *)&v11 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityAttributesType"];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 copy];
      activityAttributesType = v5->_activityAttributesType;
      v5->_activityAttributesType = (NSData *)v8;
    }
    else
    {
      activityAttributesType = v5;
      objc_super v5 = 0;
    }
  }
  return v5;
}

- (NSData)activityAttributesType
{
  return self->_activityAttributesType;
}

- (void).cxx_destruct
{
}

@end