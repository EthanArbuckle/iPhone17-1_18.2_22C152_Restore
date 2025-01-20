@interface ECEmailAddressComponents
+ (ECEmailAddressComponents)componentsWithEmailAddress:(id)a3;
+ (ECEmailAddressComponents)componentsWithString:(id)a3;
- (BOOL)_nts_getValidatedDomain:(id *)a3 idnaDomain:(id *)a4 avoidReparse:(BOOL)a5;
- (BOOL)_nts_getValidatedLocalPart:(id *)a3 domain:(id *)a4 idnaDomain:(id *)a5 displayName:(id *)a6;
- (BOOL)_nts_isValid;
- (BOOL)_nts_isValidDomain;
- (BOOL)isEqual:(id)a3;
- (ECEmailAddress)emailAddressValue;
- (ECEmailAddressComponents)init;
- (ECEmailAddressComponents)initWithEmailAddress:(id)a3;
- (ECEmailAddressComponents)initWithString:(id)a3;
- (NSArray)groupList;
- (NSString)debugDescription;
- (NSString)displayName;
- (NSString)domain;
- (NSString)ef_publicDescription;
- (NSString)idnaAddress;
- (NSString)idnaDomain;
- (NSString)localPart;
- (NSString)simpleAddress;
- (NSString)stringValue;
- (id)_initWithString:(id)a3 displayName:(id)a4 localPart:(id)a5 domain:(id)a6 groupList:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setDisplayName:(id)a3;
- (void)setDomain:(id)a3;
- (void)setGroupList:(id)a3;
- (void)setIDNADomain:(id)a3;
- (void)setLocalPart:(id)a3;
@end

@implementation ECEmailAddressComponents

- (void)setDisplayName:(id)a3
{
}

- (NSString)stringValue
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(ECEmailAddressComponents *)v2 _nts_isValid])
  {
    v3 = objc_alloc_init(ECEmailAddressFormatter);
    [(ECEmailAddressFormatter *)v3 setShouldIncludeDisplayName:1];
    id v4 = [[ECEmailAddress alloc] _initWithComponents:v2];
    v5 = [(ECEmailAddressFormatter *)v3 stringFromEmailAddress:v4];
  }
  else
  {
    v5 = 0;
  }
  objc_sync_exit(v2);

  return (NSString *)v5;
}

- (ECEmailAddress)emailAddressValue
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(ECEmailAddressComponents *)v2 _nts_isValid]) {
    id v3 = [[ECEmailAddress alloc] _initWithComponents:v2];
  }
  else {
    id v3 = 0;
  }
  objc_sync_exit(v2);

  return (ECEmailAddress *)v3;
}

- (BOOL)_nts_isValid
{
  BOOL v3 = [(ECEmailAddressComponents *)self _nts_getValidatedLocalPart:0 domain:0 idnaDomain:0 displayName:0];
  if (self->_groupList)
  {
    id v4 = [(NSString *)self->_displayName ecemailaddress_trimmedAndQuotedDisplayName];
    if ([v4 length]) {
      char v5 = [(NSArray *)self->_groupList ef_all:&__block_literal_global_178];
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }
  return v3 ^ v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 2, self->_localPart);
  objc_storeStrong(v4 + 3, self->_domain);
  objc_storeStrong(v4 + 4, self->_idnaDomain);
  objc_storeStrong(v4 + 1, self->_simpleAddress);
  objc_storeStrong(v4 + 6, self->_displayName);
  if (self->_groupList)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_groupList copyItems:1];
    id v6 = v4[5];
    v4[5] = (id)v5;
  }
  else
  {
    id v6 = v4[5];
    v4[5] = 0;
  }

  return v4;
}

- (ECEmailAddressComponents)init
{
  v3.receiver = self;
  v3.super_class = (Class)ECEmailAddressComponents;
  return [(ECEmailAddressComponents *)&v3 init];
}

- (id)_initWithString:(id)a3 displayName:(id)a4 localPart:(id)a5 domain:(id)a6 groupList:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ECEmailAddressComponents;
  v16 = [(ECEmailAddressComponents *)&v22 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_displayName, a4);
    objc_storeStrong((id *)&v17->_localPart, a5);
    objc_storeStrong((id *)&v17->_groupList, a7);
    if (+[ECIDNAEncoder encodingRequiredForDomainName:v14])
    {
      uint64_t v18 = objc_msgSend(v14, "ecemailaddress_uniquedDomain");
      domain = v17->_domain;
      v17->_domain = (NSString *)v18;
    }
    else
    {
      uint64_t v20 = objc_msgSend(v14, "ecemailaddress_uniquedDomain");
      domain = v17->_idnaDomain;
      v17->_idnaDomain = (NSString *)v20;
    }
  }
  return v17;
}

- (BOOL)_nts_getValidatedDomain:(id *)a3 idnaDomain:(id *)a4 avoidReparse:(BOOL)a5
{
  if (self->_idnaDomain && !self->_domain)
  {
    v9 = +[ECIDNADecoder stringByDecodingDomainName:](ECIDNADecoder, "stringByDecodingDomainName:");
    objc_msgSend(v9, "ecemailaddress_uniquedDomain");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    domain = self->_domain;
    self->_domain = v10;
  }
  if (!self->_domain)
  {
    id v12 = 0;
LABEL_15:
    BOOL v14 = 0;
    goto LABEL_16;
  }
  +[ECIDNAEncoder stringByEncodingDomainName:](ECIDNAEncoder, "stringByEncodingDomainName:");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v13 = v12 != 0;
  if (v12 && !a5) {
    BOOL v13 = +[ECEmailAddressParser validateDomain:self->_domain];
  }
  if (!v13) {
    goto LABEL_15;
  }
  if (a3) {
    *a3 = self->_domain;
  }
  if (a4)
  {
    id v12 = v12;
    *a4 = v12;
  }
  BOOL v14 = 1;
LABEL_16:

  return v14;
}

- (BOOL)_nts_getValidatedLocalPart:(id *)a3 domain:(id *)a4 idnaDomain:(id *)a5 displayName:(id *)a6
{
  v11 = [(NSString *)self->_displayName ecemailaddress_trimmedAndQuotedDisplayName];
  if ([v11 length]) {
    BOOL v12 = +[ECEmailAddressParser validateDisplayName:v11];
  }
  else {
    BOOL v12 = 1;
  }
  BOOL v13 = [(NSString *)self->_localPart ecemailaddress_trimmedAndQuotedLocalPart];
  if ([v13 length]
    && (v12 & +[ECEmailAddressParser validateLocalPart:v13]) == 1
    && [(ECEmailAddressComponents *)self _nts_getValidatedDomain:a4 idnaDomain:a5 avoidReparse:0])
  {
    if (a3) {
      *a3 = v13;
    }
    if (a6) {
      *a6 = v11;
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (NSString)simpleAddress
{
  v2 = self;
  objc_sync_enter(v2);
  simpleAddress = v2->_simpleAddress;
  if (!simpleAddress)
  {
    if (v2->_groupList)
    {
      simpleAddress = 0;
    }
    else
    {
      id v14 = 0;
      id v15 = 0;
      BOOL v4 = [(ECEmailAddressComponents *)v2 _nts_getValidatedLocalPart:&v15 domain:&v14 idnaDomain:0 displayName:0];
      id v5 = v15;
      id v6 = v14;
      v7 = v6;
      if (v4)
      {
        v8 = NSString;
        v9 = objc_msgSend(v6, "_lp_userVisibleHost");
        uint64_t v10 = [v8 stringWithFormat:@"%@@%@", v5, v9];
        v11 = v2->_simpleAddress;
        v2->_simpleAddress = (NSString *)v10;
      }
      simpleAddress = v2->_simpleAddress;
    }
  }
  BOOL v12 = simpleAddress;
  objc_sync_exit(v2);

  return v12;
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)groupList
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = [(NSArray *)v2->_groupList objectEnumerator];
  BOOL v4 = [v3 allObjects];

  objc_sync_exit(v2);
  return (NSArray *)v4;
}

- (ECEmailAddressComponents)initWithString:(id)a3
{
  id v4 = a3;
  id v14 = 0;
  id v15 = 0;
  id v12 = 0;
  id v13 = 0;
  BOOL v5 = +[ECEmailAddressParser parseEmailAddressString:v4 displayName:&v15 localPart:&v14 domain:&v13 groupList:&v12];
  id v6 = v15;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  if (v5)
  {
    self = (ECEmailAddressComponents *)[(ECEmailAddressComponents *)self _initWithString:v4 displayName:v6 localPart:v7 domain:v8 groupList:v9];
    uint64_t v10 = self;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)_nts_isValidDomain
{
  BOOL v3 = [(ECEmailAddressComponents *)self _nts_getValidatedDomain:0 idnaDomain:0 avoidReparse:1];
  if (self->_groupList)
  {
    id v4 = [(NSString *)self->_displayName ecemailaddress_trimmedAndQuotedDisplayName];
    if ([v4 length]) {
      char v5 = [(NSArray *)self->_groupList ef_all:&__block_literal_global_176];
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }
  return v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_groupList, 0);
  objc_storeStrong((id *)&self->_idnaDomain, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_localPart, 0);
  objc_storeStrong((id *)&self->_simpleAddress, 0);
}

- (NSString)domain
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_idnaDomain && !v2->_domain)
  {
    uint64_t v3 = +[ECIDNADecoder stringByDecodingDomainName:](ECIDNADecoder, "stringByDecodingDomainName:");
    domain = v2->_domain;
    v2->_domain = (NSString *)v3;
  }
  char v5 = v2->_domain;
  objc_sync_exit(v2);

  return v5;
}

+ (ECEmailAddressComponents)componentsWithEmailAddress:(id)a3
{
  id v4 = a3;
  char v5 = (void *)[objc_alloc((Class)a1) initWithEmailAddress:v4];

  return (ECEmailAddressComponents *)v5;
}

- (ECEmailAddressComponents)initWithEmailAddress:(id)a3
{
  id v4 = a3;
  char v5 = [v4 components];
  id v6 = (ECEmailAddressComponents *)[v5 copy];

  if (!v6) {
    id v6 = (ECEmailAddressComponents *)[0 init];
  }

  return v6;
}

- (NSString)localPart
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_localPart;
  objc_sync_exit(v2);

  return v3;
}

+ (ECEmailAddressComponents)componentsWithString:(id)a3
{
  id v4 = a3;
  char v5 = (void *)[objc_alloc((Class)a1) initWithString:v4];

  return (ECEmailAddressComponents *)v5;
}

- (NSString)debugDescription
{
  uint64_t v3 = [(ECEmailAddressComponents *)self domain];
  id v4 = [(ECEmailAddressComponents *)self idnaDomain];
  char v5 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v6 = objc_opt_class();
  id v7 = [(ECEmailAddressComponents *)self displayName];
  id v8 = [(ECEmailAddressComponents *)self localPart];
  id v9 = [v5 stringWithFormat:@"<%@: %p> displayName=%@ localPart=%@ domain=%@", v6, self, v7, v8, v3];

  if (([v3 isEqualToString:v4] & 1) == 0) {
    [v9 appendFormat:@" idnaDomain=%@", v4];
  }
  uint64_t v10 = [(ECEmailAddressComponents *)self groupList];
  v11 = v10;
  if (v10)
  {
    id v12 = objc_msgSend(v10, "ef_map:", &__block_literal_global_162);
    id v13 = [v12 componentsJoinedByString:@", "];
    [v9 appendFormat:@" groupList={%@}", v13];
  }
  return (NSString *)v9;
}

id __44__ECEmailAddressComponents_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 debugDescription];
  return v2;
}

- (NSString)ef_publicDescription
{
  uint64_t v3 = [MEMORY[0x1E4F60D58] currentDevice];
  int v4 = [v3 isInternal];
  char v5 = (void *)MEMORY[0x1E4F60E00];
  if (v4)
  {
    uint64_t v6 = [(ECEmailAddressComponents *)self simpleAddress];
    id v7 = [(ECEmailAddressComponents *)self localPart];
    id v8 = [(ECEmailAddressComponents *)self domain];
    id v9 = objc_msgSend(v5, "ec_partiallyRedactedStringForAddress:localPart:domain:", v6, v7, v8);
  }
  else
  {
    uint64_t v6 = [(ECEmailAddressComponents *)self simpleAddress];
    id v9 = [v5 fullyRedactedStringForString:v6];
  }

  uint64_t v10 = [NSString stringWithFormat:@"<%@: %p> %@", objc_opt_class(), self, v9];

  return (NSString *)v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(ECEmailAddressComponents *)self localPart];
  int v4 = [v3 lowercaseString];
  uint64_t v5 = [v4 hash];

  uint64_t v6 = [(ECEmailAddressComponents *)self domain];
  id v7 = [v6 lowercaseString];
  uint64_t v8 = [v7 hash];

  id v9 = [(ECEmailAddressComponents *)self groupList];
  unint64_t v10 = 33 * (33 * v5 + v8) + [v9 hash] + 35937;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (ECEmailAddressComponents *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v15 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __36__ECEmailAddressComponents_isEqual___block_invoke_2;
        v20[3] = &unk_1E63EE4A0;
        id v21 = &__block_literal_global_168;
        uint64_t v6 = (uint64_t (**)(void, void, void))MEMORY[0x1C18A3120](v20);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __36__ECEmailAddressComponents_isEqual___block_invoke_4;
        v18[3] = &unk_1E63EE4C8;
        id v19 = &__block_literal_global_168;
        id v7 = (unsigned int (**)(void, void, void))MEMORY[0x1C18A3120](v18);
        uint64_t v8 = v5;
        id v9 = [(ECEmailAddressComponents *)self localPart];
        unint64_t v10 = [(ECEmailAddressComponents *)self domain];
        v11 = [(ECEmailAddressComponents *)v8 localPart];
        uint64_t v12 = [(ECEmailAddressComponents *)v8 domain];
        id v13 = (void *)v12;
        if (v9 || v11 || v10 || v12)
        {
          if (((uint64_t (**)(void, void *, void *))v6)[2](v6, v9, v11))
          {
            char v15 = ((uint64_t (**)(void, void *, void *))v6)[2](v6, v10, v13);
            goto LABEL_15;
          }
        }
        else if (((unsigned int (**)(void, NSArray *, NSArray *))v7)[2](v7, self->_groupList, v8->_groupList))
        {
          v17 = [(ECEmailAddressComponents *)self displayName];
          id v14 = [(ECEmailAddressComponents *)v8 displayName];
          char v15 = ((uint64_t (**)(void, void *, void *))v6)[2](v6, v17, v14);

LABEL_15:
          goto LABEL_16;
        }
        char v15 = 0;
        goto LABEL_15;
      }
    }
    char v15 = 0;
  }
LABEL_16:

  return v15;
}

uint64_t __36__ECEmailAddressComponents_isEqual___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = v6;
  if (a2 && a3) {
    uint64_t v8 = (*((uint64_t (**)(id))v6 + 2))(v6);
  }
  else {
    uint64_t v8 = (a2 | a3) == 0;
  }

  return v8;
}

uint64_t __36__ECEmailAddressComponents_isEqual___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __36__ECEmailAddressComponents_isEqual___block_invoke_3;
  v13[3] = &unk_1E63EE478;
  id v14 = v5;
  id v15 = v6;
  uint64_t v8 = *(uint64_t (**)(uint64_t, id, id, void *))(v7 + 16);
  id v9 = v6;
  id v10 = v5;
  uint64_t v11 = v8(v7, v10, v9, v13);

  return v11;
}

BOOL __36__ECEmailAddressComponents_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "compare:options:range:locale:", *(void *)(a1 + 40), 1, 0, objc_msgSend(*(id *)(a1 + 32), "length"), 0) == 0;
}

uint64_t __36__ECEmailAddressComponents_isEqual___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __36__ECEmailAddressComponents_isEqual___block_invoke_5;
  v13[3] = &unk_1E63EE478;
  id v14 = v5;
  id v15 = v6;
  uint64_t v8 = *(uint64_t (**)(uint64_t, id, id, void *))(v7 + 16);
  id v9 = v6;
  id v10 = v5;
  uint64_t v11 = v8(v7, v10, v9, v13);

  return v11;
}

uint64_t __36__ECEmailAddressComponents_isEqual___block_invoke_5(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 32)];
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
  uint64_t v4 = [v2 isEqualToSet:v3];

  return v4;
}

- (void)setLocalPart:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (v4->_localPart != v8)
  {
    uint64_t v5 = [(NSString *)v8 copy];
    localPart = v4->_localPart;
    v4->_localPart = (NSString *)v5;

    simpleAddress = v4->_simpleAddress;
    v4->_simpleAddress = 0;
  }
  objc_sync_exit(v4);
}

- (void)setDomain:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "ecemailaddress_uniquedDomain");
  id v10 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v5->_domain != v10)
  {
    uint64_t v6 = +[ECIDNADecoder stringByDecodingDomainName:](ECIDNADecoder, "stringByDecodingDomainName:");
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    idnaDomain = v5->_idnaDomain;
    v5->_idnaDomain = 0;

    simpleAddress = v5->_simpleAddress;
    v5->_simpleAddress = 0;
  }
  objc_sync_exit(v5);
}

- (NSString)idnaDomain
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_domain && !v2->_idnaDomain)
  {
    uint64_t v3 = +[ECIDNAEncoder stringByEncodingDomainName:](ECIDNAEncoder, "stringByEncodingDomainName:");
    idnaDomain = v2->_idnaDomain;
    v2->_idnaDomain = (NSString *)v3;
  }
  uint64_t v5 = v2->_idnaDomain;
  objc_sync_exit(v2);

  return v5;
}

- (void)setIDNADomain:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "ecemailaddress_uniquedDomain");
  obj = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v5->_idnaDomain != obj)
  {
    objc_storeStrong((id *)&v5->_idnaDomain, obj);
    domain = v5->_domain;
    v5->_domain = 0;

    simpleAddress = v5->_simpleAddress;
    v5->_simpleAddress = 0;
  }
  objc_sync_exit(v5);
}

- (void)setGroupList:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v8 copy];
  groupList = v4->_groupList;
  v4->_groupList = (NSArray *)v5;

  simpleAddress = v4->_simpleAddress;
  v4->_simpleAddress = 0;

  objc_sync_exit(v4);
}

uint64_t __46__ECEmailAddressComponents__nts_isValidDomain__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 groupList];
  if (v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = objc_msgSend(v2, "_nts_isValidDomain");
  }

  return v4;
}

uint64_t __40__ECEmailAddressComponents__nts_isValid__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 groupList];
  if (v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = objc_msgSend(v2, "_nts_isValid");
  }

  return v4;
}

- (NSString)idnaAddress
{
  id v2 = self;
  objc_sync_enter(v2);
  if (v2->_groupList)
  {
    id v3 = 0;
    id v4 = 0;
  }
  else
  {
    id v8 = 0;
    id v9 = 0;
    BOOL v5 = [(ECEmailAddressComponents *)v2 _nts_getValidatedLocalPart:&v9 domain:0 idnaDomain:&v8 displayName:0];
    id v4 = v9;
    id v3 = v8;
    if (v5)
    {
      uint64_t v6 = [NSString stringWithFormat:@"%@@%@", v4, v3];
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
LABEL_6:

  objc_sync_exit(v2);
  return (NSString *)v6;
}

@end