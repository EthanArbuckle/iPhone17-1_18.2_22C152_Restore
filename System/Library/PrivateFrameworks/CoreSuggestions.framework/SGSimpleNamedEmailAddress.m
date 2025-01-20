@interface SGSimpleNamedEmailAddress
+ (BOOL)supportsSecureCoding;
+ (id)emailToNameDictionaryWithNamedEmailAddresses:(id)a3;
+ (id)namedEmailAddressWithCSPerson:(id)a3;
+ (id)namedEmailAddressWithFieldValue:(id)a3;
+ (id)namedEmailAddressesWithEmailToNameDictionary:(id)a3;
+ (id)namedEmailAddressesWithFieldValues:(id)a3;
+ (id)serializeAll:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNamedEmailAddress:(id)a3;
- (NSString)emailAddress;
- (NSString)name;
- (SGSimpleNamedEmailAddress)initWithCoder:(id)a3;
- (SGSimpleNamedEmailAddress)initWithName:(id)a3 emailAddress:(id)a4;
- (SGSimpleNamedEmailAddress)initWithNamedHandle:(id)a3;
- (id)asCSPerson;
- (id)serialized;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGSimpleNamedEmailAddress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_emailAddress, 0);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (id)asCSPerson
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F23810]);
  name = self->_name;
  v8[0] = self->_emailAddress;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v6 = (void *)[v3 initWithDisplayName:name handles:v5 handleIdentifier:@"emailAddresses"];

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_emailAddress hash];
}

- (BOOL)isEqualToNamedEmailAddress:(id)a3
{
  v4 = (id *)a3;
  name = self->_name;
  v6 = (NSString *)v4[2];
  if (name == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = name;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      char v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_emailAddress;
  v12 = v11;
  if (v11 == v4[1]) {
    char v10 = 1;
  }
  else {
    char v10 = -[NSString isEqual:](v11, "isEqual:");
  }

LABEL_9:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGSimpleNamedEmailAddress *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGSimpleNamedEmailAddress *)self isEqualToNamedEmailAddress:v5];

  return v6;
}

- (id)serialized
{
  if (self->_name) {
    v2 = (NSString *)[[NSString alloc] initWithFormat:@"%@ <%@>", self->_name, self->_emailAddress];
  }
  else {
    v2 = self->_emailAddress;
  }

  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_emailAddress forKey:@"emailAddress"];
}

- (SGSimpleNamedEmailAddress)initWithCoder:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGSimpleNamedEmailAddress;
  BOOL v6 = [(SGSimpleNamedEmailAddress *)&v15 init];
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"name"];
    name = v6->_name;
    v6->_name = (NSString *)v8;

    char v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v11 = [v5 decodeObjectOfClasses:v10 forKey:@"emailAddress"];

    if (v11)
    {
      v12 = v11;
      emailAddress = v6->_emailAddress;
      v6->_emailAddress = v12;
    }
    else
    {
      emailAddress = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(emailAddress, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGSimpleNamedEmailAddress.m", 67, @"nonnull property %s *%s was null when decoded", "NSString", "emailAddress");
    }
  }
  return v6;
}

- (SGSimpleNamedEmailAddress)initWithNamedHandle:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  BOOL v6 = [v4 handle];

  v7 = [(SGSimpleNamedEmailAddress *)self initWithName:v5 emailAddress:v6];
  return v7;
}

- (SGSimpleNamedEmailAddress)initWithName:(id)a3 emailAddress:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGSimpleNamedEmailAddress;
  char v9 = [(SGSimpleNamedEmailAddress *)&v12 init];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_emailAddress, a4);
  }

  return v10;
}

+ (id)serializeAll:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "serialized", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)emailToNameDictionaryWithNamedEmailAddresses:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "emailAddress", (void)v17);

        if (v11)
        {
          uint64_t v12 = [v10 name];
          long long v13 = (void *)v12;
          if (v12) {
            long long v14 = (__CFString *)v12;
          }
          else {
            long long v14 = &stru_1EF915628;
          }
          long long v15 = [v10 emailAddress];
          [v4 setObject:v14 forKeyedSubscript:v15];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)namedEmailAddressesWithEmailToNameDictionary:(id)a3
{
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v4 = a3;
    id v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __74__SGSimpleNamedEmailAddress_namedEmailAddressesWithEmailToNameDictionary___block_invoke;
    v8[3] = &unk_1E5B8F8F8;
    id v6 = v5;
    id v9 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __74__SGSimpleNamedEmailAddress_namedEmailAddressesWithEmailToNameDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [[SGSimpleNamedEmailAddress alloc] initWithName:v5 emailAddress:v6];

  [v4 addObject:v7];
}

+ (id)namedEmailAddressesWithFieldValues:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = +[SGSimpleNamedEmailAddress namedEmailAddressWithFieldValue:](SGSimpleNamedEmailAddress, "namedEmailAddressWithFieldValue:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)namedEmailAddressWithCSPerson:(id)a3
{
  id v4 = a3;
  id v5 = [v4 handleIdentifier];
  if (![v5 isEqual:@"emailAddresses"])
  {
    v11 = 0;
    goto LABEL_5;
  }
  uint64_t v6 = [v4 handles];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = objc_alloc((Class)a1);
    id v5 = [v4 displayName];
    id v9 = [v4 handles];
    char v10 = [v9 firstObject];
    v11 = (void *)[v8 initWithName:v5 emailAddress:v10];

LABEL_5:
    goto LABEL_7;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

+ (id)namedEmailAddressWithFieldValue:(id)a3
{
  id v3 = (__CFString *)a3;
  CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  if (!CStringPtr) {
    CStringPtr = (const char *)[(__CFString *)v3 UTF8String];
  }
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = __Block_byref_object_copy__3150;
  long long v13 = __Block_byref_object_dispose__3151;
  id v14 = 0;
  if (v3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __61__SGSimpleNamedEmailAddress_namedEmailAddressWithFieldValue___block_invoke;
    v8[3] = &unk_1E5B8F8D0;
    void v8[4] = &v9;
    SGParseNamedEmailAddress(CStringPtr, v8);
    id v5 = (void *)v10[5];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __61__SGSimpleNamedEmailAddress_namedEmailAddressWithFieldValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (![v9 length] || objc_msgSend(v9, "isEqualToString:", v5))
  {

    id v9 = 0;
  }
  id v6 = [[SGSimpleNamedEmailAddress alloc] initWithName:v9 emailAddress:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end