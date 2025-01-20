@interface CHSEntitlementCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)canKeepAlive;
- (BOOL)canOpenSystemURLs;
- (BOOL)invalidatesOnStorefrontChange;
- (BOOL)isEqual:(id)a3;
- (BOOL)usesEventService;
- (CHSEntitlementCollection)initWithCoder:(id)a3;
- (NSString)description;
- (id)_initFromCollection:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSEntitlementCollection

- (id)_initFromCollection:(id)a3
{
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CHSEntitlementCollection;
  v5 = [(CHSEntitlementCollection *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_usesEventService = v4[8];
    v5->_canOpenSystemURLs = v4[9];
    v5->_canKeepAlive = v4[10];
    v5->_invalidatesOnStorefrontChange = v4[11];
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CHSEntitlementCollection *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = self->_usesEventService == v5[8]
        && self->_canOpenSystemURLs == v5[9]
        && self->_canKeepAlive == v5[10]
        && self->_invalidatesOnStorefrontChange == v5[11];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v2.i32[0] = *(_DWORD *)&self->_usesEventService;
  uint16x4_t v3 = vshl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v2), (uint16x4_t)0x4000300020001);
  return (v3.i8[0] | v3.i8[4] | ((v3.i32[0] | v3.i32[1]) >> 16)) ^ 0x1Fu;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CHSEntitlementCollection alloc];
  return [(CHSEntitlementCollection *)v4 _initFromCollection:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CHSMutableEntitlementCollection alloc];
  return [(CHSEntitlementCollection *)v4 _initFromCollection:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeBool:self->_usesEventService forKey:@"usesEventService"];
  [v4 encodeBool:self->_canOpenSystemURLs forKey:@"canOpenSystemURLs"];
  [v4 encodeBool:self->_canKeepAlive forKey:@"canKeepAlive"];
  [v4 encodeBool:self->_invalidatesOnStorefrontChange forKey:@"invalidatesOnStorefrontChange"];
}

- (CHSEntitlementCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CHSEntitlementCollection;
  v5 = [(CHSEntitlementCollection *)&v7 init];
  if (v5)
  {
    v5->_usesEventService = [v4 decodeBoolForKey:@"usesEventService"];
    v5->_canOpenSystemURLs = [v4 decodeBoolForKey:@"canOpenSystemURLs"];
    v5->_canKeepAlive = [v4 decodeBoolForKey:@"canKeepAlive"];
    v5->_invalidatesOnStorefrontChange = [v4 decodeBoolForKey:@"invalidatesOnStorefrontChange"];
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)[(CHSEntitlementCollection *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescriptionBuilder
{
  return [(CHSEntitlementCollection *)self descriptionBuilderWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint16x4_t v3 = [(CHSEntitlementCollection *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__CHSEntitlementCollection_descriptionBuilderWithMultilinePrefix___block_invoke;
  v8[3] = &unk_1E56C81F0;
  id v5 = v4;
  id v9 = v5;
  v10 = self;
  [v5 appendProem:self block:v8];
  id v6 = v5;

  return v6;
}

id __66__CHSEntitlementCollection_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"usesEventService"];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 9) withName:@"canOpenSystemURLs"];
  id v4 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 10) withName:@"canKeepAlive"];
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 11) withName:@"invalidatesOnStorefrontChange"];
}

- (BOOL)usesEventService
{
  return self->_usesEventService;
}

- (BOOL)canOpenSystemURLs
{
  return self->_canOpenSystemURLs;
}

- (BOOL)canKeepAlive
{
  return self->_canKeepAlive;
}

- (BOOL)invalidatesOnStorefrontChange
{
  return self->_invalidatesOnStorefrontChange;
}

@end