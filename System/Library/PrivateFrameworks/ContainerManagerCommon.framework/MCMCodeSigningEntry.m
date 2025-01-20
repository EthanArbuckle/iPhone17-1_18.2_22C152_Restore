@interface MCMCodeSigningEntry
- (BOOL)isAdvanceCopy;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInvalid;
- (BOOL)isPlaceholder;
- (BOOL)isRegisteredByCaller;
- (BOOL)isRegisteredByKernel;
- (MCMCodeSigningEntry)initWithCodeSigningInfo:(id)a3;
- (MCMCodeSigningEntry)initWithCodeSigningInfo:(id)a3 andDataContainerClass:(unint64_t)a4;
- (MCMCodeSigningEntry)initWithSerializedDictionary:(id)a3;
- (NSArray)childBundleIdentifiers;
- (NSDictionary)codeSigningInfo;
- (id)description;
- (id)serialize;
- (unint64_t)dataContainerClass;
- (unint64_t)hash;
- (void)setAdvanceCopy:(BOOL)a3;
- (void)setChildBundleIdentifiers:(id)a3;
- (void)setCodeSigningInfo:(id)a3;
- (void)setDataContainerClass:(unint64_t)a3;
- (void)setInvalid:(BOOL)a3;
- (void)setPlaceholder:(BOOL)a3;
- (void)setRegisteredByCaller:(BOOL)a3;
- (void)setRegisteredByKernel:(BOOL)a3;
@end

@implementation MCMCodeSigningEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childBundleIdentifiers, 0);

  objc_storeStrong((id *)&self->_codeSigningInfo, 0);
}

- (unint64_t)dataContainerClass
{
  return self->_dataContainerClass;
}

- (void)setRegisteredByKernel:(BOOL)a3
{
  self->_registeredByKernel = a3;
}

- (void)setRegisteredByCaller:(BOOL)a3
{
  self->_registeredByCaller = a3;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (void)setDataContainerClass:(unint64_t)a3
{
  self->_dataContainerClass = a3;
}

- (void)setChildBundleIdentifiers:(id)a3
{
  p_childBundleIdentifiers = &self->_childBundleIdentifiers;

  objc_storeStrong((id *)p_childBundleIdentifiers, a3);
}

- (void)setAdvanceCopy:(BOOL)a3
{
  self->_advanceCopy = a3;
}

- (MCMCodeSigningEntry)initWithCodeSigningInfo:(id)a3 andDataContainerClass:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MCMCodeSigningEntry;
  v8 = [(MCMCodeSigningEntry *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_codeSigningInfo, a3);
    childBundleIdentifiers = v9->_childBundleIdentifiers;
    v9->_childBundleIdentifiers = 0;

    v9->_registeredByKernel = 0;
    *(_DWORD *)&v9->_invalid = 0;
    v9->_dataContainerClass = a4;
  }

  return v9;
}

- (MCMCodeSigningEntry)initWithCodeSigningInfo:(id)a3
{
  return [(MCMCodeSigningEntry *)self initWithCodeSigningInfo:a3 andDataContainerClass:0];
}

- (NSDictionary)codeSigningInfo
{
  return self->_codeSigningInfo;
}

- (BOOL)isRegisteredByKernel
{
  return self->_registeredByKernel;
}

- (BOOL)isRegisteredByCaller
{
  return self->_registeredByCaller;
}

- (BOOL)isAdvanceCopy
{
  return self->_advanceCopy;
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (BOOL)isInvalid
{
  return self->_invalid;
}

- (NSArray)childBundleIdentifiers
{
  return self->_childBundleIdentifiers;
}

- (void)setCodeSigningInfo:(id)a3
{
  p_codeSigningInfo = &self->_codeSigningInfo;

  objc_storeStrong((id *)p_codeSigningInfo, a3);
}

- (id)description
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__MCMCodeSigningEntry_description__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return v4;
}

id __34__MCMCodeSigningEntry_description__block_invoke(uint64_t a1, char a2)
{
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if ([*(id *)(a1 + 32) isInvalid]) {
    uint64_t v7 = 89;
  }
  else {
    uint64_t v7 = 78;
  }
  uint64_t v22 = v7;
  if ([*(id *)(a1 + 32) isPlaceholder]) {
    uint64_t v8 = 89;
  }
  else {
    uint64_t v8 = 78;
  }
  if ([*(id *)(a1 + 32) isAdvanceCopy]) {
    uint64_t v9 = 89;
  }
  else {
    uint64_t v9 = 78;
  }
  if ([*(id *)(a1 + 32) isRegisteredByCaller]) {
    uint64_t v10 = 89;
  }
  else {
    uint64_t v10 = 78;
  }
  if ([*(id *)(a1 + 32) isRegisteredByKernel]) {
    uint64_t v11 = 89;
  }
  else {
    uint64_t v11 = 78;
  }
  uint64_t v12 = [*(id *)(a1 + 32) dataContainerClass];
  uint64_t v13 = [*(id *)(a1 + 32) childBundleIdentifiers];
  v14 = v13;
  if (a2)
  {
    v15 = [v13 redactedDescription];
    v16 = [*(id *)(a1 + 32) codeSigningInfo];
    uint64_t v17 = [v16 redactedDescription];
    v18 = v4;
    v19 = (void *)v17;
    v20 = [v18 stringWithFormat:@"<%@ invalid: %c, placeholder: %c, advanceCopy: %c, regByCaller: %c, regByKernel: %c, dataClass: %llu, childBundles: %@, CSinfo: %@>", v6, v22, v8, v9, v10, v11, v12, v15, v17];
  }
  else
  {
    v15 = [*(id *)(a1 + 32) codeSigningInfo];
    v20 = [v4 stringWithFormat:@"<%@ invalid: %c, placeholder: %c, advanceCopy: %c, regByCaller: %c, regByKernel: %c, dataClass: %llu, childBundles: %@, CSinfo: %@>", v6, v22, v8, v9, v10, v11, v12, v14, v15];
  }

  return v20;
}

- (unint64_t)hash
{
  v3 = [(MCMCodeSigningEntry *)self codeSigningInfo];
  uint64_t v4 = [v3 hash];
  v5 = [(MCMCodeSigningEntry *)self childBundleIdentifiers];
  uint64_t v6 = [v5 hash];
  if ([(MCMCodeSigningEntry *)self isInvalid]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 0;
  }
  if ([(MCMCodeSigningEntry *)self isPlaceholder]) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 0;
  }
  if ([(MCMCodeSigningEntry *)self isRegisteredByCaller]) {
    uint64_t v9 = 8;
  }
  else {
    uint64_t v9 = 0;
  }
  BOOL v10 = [(MCMCodeSigningEntry *)self dataContainerClass] != 0;
  if ([(MCMCodeSigningEntry *)self isAdvanceCopy]) {
    uint64_t v11 = 32;
  }
  else {
    uint64_t v11 = 0;
  }
  if ([(MCMCodeSigningEntry *)self isRegisteredByKernel]) {
    uint64_t v12 = 64;
  }
  else {
    uint64_t v12 = 0;
  }

  return v7 + (v6 ^ v4) + v8 + v9 + 16 * v10 + v11 + v12;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (MCMCodeSigningEntry *)a3;
  if (self == v5)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      uint64_t v7 = [(MCMCodeSigningEntry *)self codeSigningInfo];
      if (v7
        || ([(MCMCodeSigningEntry *)v6 codeSigningInfo],
            (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v8 = [(MCMCodeSigningEntry *)self codeSigningInfo];
        uint64_t v9 = [(MCMCodeSigningEntry *)v6 codeSigningInfo];
        int v10 = [v8 isEqualToDictionary:v9];

        if (v7)
        {

          if (!v10) {
            goto LABEL_22;
          }
        }
        else
        {

          if ((v10 & 1) == 0) {
            goto LABEL_22;
          }
        }
      }
      uint64_t v12 = [(MCMCodeSigningEntry *)self childBundleIdentifiers];
      if (v12
        || ([(MCMCodeSigningEntry *)v6 childBundleIdentifiers],
            (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v13 = [(MCMCodeSigningEntry *)self childBundleIdentifiers];
        v14 = [(MCMCodeSigningEntry *)v6 childBundleIdentifiers];
        int v15 = [v13 isEqualToArray:v14];

        if (v12)
        {

          if (!v15) {
            goto LABEL_22;
          }
        }
        else
        {

          if ((v15 & 1) == 0) {
            goto LABEL_22;
          }
        }
      }
      BOOL v16 = [(MCMCodeSigningEntry *)self isInvalid];
      if (v16 == [(MCMCodeSigningEntry *)v6 isInvalid])
      {
        BOOL v17 = [(MCMCodeSigningEntry *)self isPlaceholder];
        if (v17 == [(MCMCodeSigningEntry *)v6 isPlaceholder])
        {
          BOOL v18 = [(MCMCodeSigningEntry *)self isAdvanceCopy];
          if (v18 == [(MCMCodeSigningEntry *)v6 isAdvanceCopy])
          {
            BOOL v19 = [(MCMCodeSigningEntry *)self isRegisteredByCaller];
            if (v19 == [(MCMCodeSigningEntry *)v6 isRegisteredByCaller])
            {
              BOOL v20 = [(MCMCodeSigningEntry *)self isRegisteredByKernel];
              if (v20 == [(MCMCodeSigningEntry *)v6 isRegisteredByKernel])
              {
                unint64_t v22 = [(MCMCodeSigningEntry *)self dataContainerClass];
                BOOL v11 = v22 == [(MCMCodeSigningEntry *)v6 dataContainerClass];
                goto LABEL_23;
              }
            }
          }
        }
      }
LABEL_22:
      BOOL v11 = 0;
LABEL_23:

      goto LABEL_24;
    }
    BOOL v11 = 0;
  }
LABEL_24:

  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  uint64_t v4 = [(MCMCodeSigningEntry *)self codeSigningInfo];
  [v3 setObject:v4 forKeyedSubscript:@"CodeSigningInfo"];

  v5 = [(MCMCodeSigningEntry *)self childBundleIdentifiers];
  [v3 setObject:v5 forKeyedSubscript:@"ChildBundleIds"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[MCMCodeSigningEntry isInvalid](self, "isInvalid"));
  [v3 setObject:v6 forKeyedSubscript:@"Invalid"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[MCMCodeSigningEntry isPlaceholder](self, "isPlaceholder"));
  [v3 setObject:v7 forKeyedSubscript:@"Placeholder"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[MCMCodeSigningEntry isAdvanceCopy](self, "isAdvanceCopy"));
  [v3 setObject:v8 forKeyedSubscript:@"AdvanceCopy"];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[MCMCodeSigningEntry isRegisteredByCaller](self, "isRegisteredByCaller"));
  [v3 setObject:v9 forKeyedSubscript:@"RegisteredByCaller"];

  int v10 = objc_msgSend(NSNumber, "numberWithBool:", -[MCMCodeSigningEntry isRegisteredByKernel](self, "isRegisteredByKernel"));
  [v3 setObject:v10 forKeyedSubscript:@"RegisteredByKernel"];

  BOOL v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MCMCodeSigningEntry dataContainerClass](self, "dataContainerClass"));
  [v3 setObject:v11 forKeyedSubscript:@"DataContainerClass"];

  uint64_t v12 = (void *)[v3 copy];

  return v12;
}

- (MCMCodeSigningEntry)initWithSerializedDictionary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MCMCodeSigningEntry;
  v5 = [(MCMCodeSigningEntry *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"CodeSigningInfo"];
    codeSigningInfo = v5->_codeSigningInfo;
    v5->_codeSigningInfo = (NSDictionary *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"ChildBundleIds"];
    childBundleIdentifiers = v5->_childBundleIdentifiers;
    v5->_childBundleIdentifiers = (NSArray *)v8;

    int v10 = [v4 objectForKeyedSubscript:@"Invalid"];
    v5->_invalid = [v10 BOOLValue];

    BOOL v11 = [v4 objectForKeyedSubscript:@"Placeholder"];
    v5->_placeholder = [v11 BOOLValue];

    uint64_t v12 = [v4 objectForKeyedSubscript:@"AdvanceCopy"];
    v5->_advanceCopy = [v12 BOOLValue];

    uint64_t v13 = [v4 objectForKeyedSubscript:@"RegisteredByCaller"];
    v5->_registeredByCaller = [v13 BOOLValue];

    v14 = [v4 objectForKeyedSubscript:@"RegisteredByKernel"];
    v5->_registeredByKernel = [v14 BOOLValue];

    int v15 = [v4 objectForKeyedSubscript:@"DataContainerClass"];
    v5->_dataContainerClass = [v15 unsignedLongLongValue];
  }
  return v5;
}

@end