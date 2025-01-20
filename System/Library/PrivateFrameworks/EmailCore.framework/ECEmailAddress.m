@interface ECEmailAddress
+ (BOOL)supportsSecureCoding;
+ (id)_cachedEmailAddressForString:(id)a3 generator:(id)a4;
+ (id)emailAddressWithString:(id)a3;
+ (id)emailAddressesFromStrings:(id)a3 invalidAddresses:(id *)a4;
- (BOOL)_createComponentsFrom:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (ECEmailAddress)initWithCoder:(id)a3;
- (ECEmailAddress)initWithString:(id)a3;
- (ECEmailAddressComponents)components;
- (NSArray)groupList;
- (NSString)debugDescription;
- (NSString)domainStrippingTopLevelDomain;
- (NSString)ef_publicDescription;
- (NSString)highLevelDomain;
- (NSString)highLevelDomainStrippingTopLevelDomain;
- (NSString)stringValue;
- (id)_initWithComponents:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ECEmailAddress

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_components;
}

- (id)_initWithComponents:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ECEmailAddress;
  v5 = [(ECEmailAddress *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    components = v5->_components;
    v5->_components = (ECEmailAddressComponents *)v6;

    v5->_hash = -1;
  }

  return v5;
}

+ (id)emailAddressesFromStrings:(id)a3 invalidAddresses:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v14;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = +[ECEmailAddress emailAddressWithString:v11];
        if (v12) {
          [v6 addObject:v12];
        }
        else {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if (a4) {
    *a4 = v5;
  }

  return v6;
}

- (NSString)ef_publicDescription
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [(ECEmailAddress *)self groupList];
  if (!v3)
  {
    id v14 = [MEMORY[0x1E4F60D58] currentDevice];
    int v15 = [v14 isInternal];

    long long v16 = (void *)MEMORY[0x1E4F60E00];
    if (v15)
    {
      long long v17 = [(ECEmailAddress *)self simpleAddress];
      long long v18 = [(ECEmailAddress *)self localPart];
      v19 = [(ECEmailAddress *)self domain];
      id v6 = objc_msgSend(v16, "ec_partiallyRedactedStringForAddress:localPart:domain:", v17, v18, v19);

LABEL_18:
      goto LABEL_19;
    }
    long long v17 = [(ECEmailAddress *)self simpleAddress];
    uint64_t v21 = [v16 fullyRedactedStringForString:v17];
LABEL_17:
    id v6 = (void *)v21;
    goto LABEL_18;
  }
  id v4 = [MEMORY[0x1E4F60D58] currentDevice];
  int v5 = [v4 isInternal];

  if (!v5)
  {
    uint64_t v20 = objc_msgSend(v3, "ef_compactMapSelector:", sel_simpleAddress);
    long long v17 = [v20 componentsJoinedByString:&stru_1F1A635E8];

    uint64_t v21 = [MEMORY[0x1E4F60E00] fullyRedactedStringForString:v17];
    goto LABEL_17;
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"["];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    char v10 = 1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ((v10 & 1) == 0) {
          [v6 appendString:@", ", (void)v23];
        }
        v13 = objc_msgSend(v12, "ef_publicDescription", (void)v23);
        [v6 appendString:v13];

        char v10 = 0;
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      char v10 = 0;
    }
    while (v8);
  }

  [v6 appendString:@"]"];
LABEL_19:

  return (NSString *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(ECEmailAddress *)self stringValue];
  [v5 encodeObject:v4 forKey:@"EFPropertyKey_stringValue"];
}

- (NSString)stringValue
{
  v3 = objc_alloc_init(ECEmailAddressFormatter);
  [(ECEmailAddressFormatter *)v3 setShouldIncludeDisplayName:1];
  id v4 = [(ECEmailAddressFormatter *)v3 stringFromEmailAddress:self];

  return (NSString *)v4;
}

- (NSArray)groupList
{
  v2 = self;
  objc_sync_enter(v2);
  groupList = v2->_groupList;
  if (!groupList)
  {
    id v4 = [(ECEmailAddressComponents *)v2->_components groupList];
    uint64_t v5 = objc_msgSend(v4, "ef_map:", &__block_literal_global_5);
    id v6 = v2->_groupList;
    v2->_groupList = (NSArray *)v5;

    groupList = v2->_groupList;
  }
  id v7 = groupList;
  objc_sync_exit(v2);

  return v7;
}

id __57__ECEmailAddress__cachedEmailAddressForString_generator___block_invoke(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CA98] null];
  }
  id v4 = v3;

  return v4;
}

id __33__ECEmailAddress_initWithString___block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)ECEmailAddress;
  id v2 = objc_msgSendSuper2(&v5, sel_init);
  id v3 = v2;
  if (v2 && ([v2 _createComponentsFrom:*(void *)(a1 + 40)] & 1) == 0)
  {

    id v3 = 0;
  }
  return v3;
}

- (BOOL)_createComponentsFrom:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[ECEmailAddressComponents alloc] initWithString:v4];
  BOOL v6 = [(ECEmailAddressComponents *)v5 _nts_isValidDomain];
  BOOL v7 = v6;
  if (self) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    objc_storeStrong((id *)&self->_components, v5);
    self->_hash = -1;
  }

  return v7;
}

- (ECEmailAddress)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_stringValue"];
  BOOL v6 = [(ECEmailAddress *)self initWithString:v5];

  return v6;
}

+ (id)emailAddressWithString:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[objc_alloc((Class)a1) initWithString:v4];

  return v5;
}

- (ECEmailAddress)initWithString:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_opt_class();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __33__ECEmailAddress_initWithString___block_invoke;
  v10[3] = &unk_1E63EE3C8;
  BOOL v6 = self;
  uint64_t v11 = v6;
  id v7 = v4;
  id v12 = v7;
  BOOL v8 = [v5 _cachedEmailAddressForString:v7 generator:v10];

  return v8;
}

+ (id)_cachedEmailAddressForString:(id)a3 generator:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    if (sharedCache_onceToken != -1) {
      dispatch_once(&sharedCache_onceToken, &__block_literal_global_275);
    }
    id v7 = (id)sharedCache_cache;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__ECEmailAddress__cachedEmailAddressForString_generator___block_invoke;
    v11[3] = &unk_1E63EE410;
    id v12 = v6;
    BOOL v8 = [v7 objectForKey:v5 generator:v11];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_groupList, 0);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ECEmailAddress;
  if (-[ECEmailAddress respondsToSelector:](&v5, sel_respondsToSelector_)) {
    char v3 = 1;
  }
  else {
    char v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (NSString)highLevelDomain
{
  id v2 = [(ECEmailAddress *)self domain];
  char v3 = objc_msgSend(v2, "_lp_highLevelDomainFromHost");

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ECEmailAddress *)a3;
  objc_super v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    char v8 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    components = self->_components;
    id v7 = [(ECEmailAddress *)v5 components];
    char v8 = [(ECEmailAddressComponents *)components isEqual:v7];
  }
  else
  {
LABEL_5:
    char v8 = 0;
  }
LABEL_7:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ECEmailAddressComponents)components
{
  return self->_components;
}

- (NSString)debugDescription
{
  char v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(ECEmailAddress *)self stringValue];
  id v6 = [(ECEmailAddress *)self components];
  id v7 = [v6 debugDescription];
  char v8 = [v3 stringWithFormat:@"<%@: %p> %@ components=%@", v4, self, v5, v7];

  return (NSString *)v8;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (result == -1)
  {
    unint64_t result = [(ECEmailAddressComponents *)self->_components hash];
    self->_hash = result;
  }
  return result;
}

- (int64_t)compare:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"ECEmailAddress.m", 188, @"Invalid parameter not satisfying: %@", @"[otherAddress isKindOfClass:ECEmailAddress.class]" object file lineNumber description];
  }
  id v6 = [(ECEmailAddress *)self simpleAddress];
  id v7 = [v5 simpleAddress];
  int64_t v8 = [v6 compare:v7];

  return v8;
}

id __27__ECEmailAddress_groupList__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 emailAddressValue];
  return v2;
}

- (id)valueForUndefinedKey:(id)a3
{
  char v3 = [(ECEmailAddressComponents *)self->_components valueForKey:a3];
  return v3;
}

- (NSString)highLevelDomainStrippingTopLevelDomain
{
  id v2 = [(ECEmailAddress *)self highLevelDomain];
  char v3 = objc_msgSend(v2, "_lp_hostByStrippingTopLevelDomain");

  return (NSString *)v3;
}

- (NSString)domainStrippingTopLevelDomain
{
  id v2 = [(ECEmailAddress *)self domain];
  char v3 = objc_msgSend(v2, "_lp_hostByStrippingTopLevelDomain");

  return (NSString *)v3;
}

@end