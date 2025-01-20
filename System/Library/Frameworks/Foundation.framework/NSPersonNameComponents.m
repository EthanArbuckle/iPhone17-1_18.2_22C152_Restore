@interface NSPersonNameComponents
+ (BOOL)supportsSecureCoding;
+ (id)__componentsRequiredForScriptDetectionWithPhoneticDesired:(BOOL)a3;
+ (id)_allComponents;
+ (id)_allProperties;
- (BOOL)_isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToComponents:(id)a3;
- (NSPersonNameComponents)init;
- (NSPersonNameComponents)initWithCoder:(id)a3;
- (NSPersonNameComponents)phoneticRepresentation;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)middleName;
- (NSString)namePrefix;
- (NSString)nameSuffix;
- (NSString)nickname;
- (id)_scriptDeterminingStringRepresentationWithPhoneticDesired:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setFamilyName:(NSString *)familyName;
- (void)setGivenName:(NSString *)givenName;
- (void)setMiddleName:(NSString *)middleName;
- (void)setNamePrefix:(NSString *)namePrefix;
- (void)setNameSuffix:(NSString *)nameSuffix;
- (void)setNickname:(NSString *)nickname;
- (void)setPhoneticRepresentation:(NSPersonNameComponents *)phoneticRepresentation;
@end

@implementation NSPersonNameComponents

- (NSPersonNameComponents)phoneticRepresentation
{
  return (NSPersonNameComponents *)[self->_private phoneticRepresentation];
}

- (NSString)middleName
{
  return (NSString *)[self->_private middleName];
}

- (NSString)nickname
{
  return (NSString *)[self->_private nickname];
}

- (NSString)nameSuffix
{
  return (NSString *)[self->_private nameSuffix];
}

- (NSString)namePrefix
{
  return (NSString *)[self->_private namePrefix];
}

- (BOOL)_isEmpty
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!self) {
    return 1;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = (void *)[(id)objc_opt_class() _allProperties];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (!v4) {
    return 1;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v15;
  BOOL v7 = 1;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v3);
      }
      v9 = (void *)[(NSPersonNameComponents *)self valueForKeyPath:*(void *)(*((void *)&v14 + 1) + 8 * i)];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        BOOL v10 = [v9 length] == 0;
      }
      else {
        BOOL v10 = v9 == 0;
      }
      if (!v10) {
        BOOL v7 = 0;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  }
  while (v5);
  return v7;
}

+ (id)_allProperties
{
  v3[7] = *MEMORY[0x1E4F143B8];
  v3[0] = @"givenName";
  v3[1] = @"familyName";
  v3[2] = @"middleName";
  v3[3] = @"namePrefix";
  v3[4] = @"nameSuffix";
  v3[5] = @"nickname";
  v3[6] = @"phoneticRepresentation";
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v3, 7));
}

- (void)setGivenName:(NSString *)givenName
{
}

- (void)setFamilyName:(NSString *)familyName
{
}

- (void)setMiddleName:(NSString *)middleName
{
}

- (void)setNameSuffix:(NSString *)nameSuffix
{
}

- (void)setNamePrefix:(NSString *)namePrefix
{
}

- (void)setNickname:(NSString *)nickname
{
}

- (id)_scriptDeterminingStringRepresentationWithPhoneticDesired:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[NSString string];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = +[NSPersonNameComponents __componentsRequiredForScriptDetectionWithPhoneticDesired:v3];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [(NSPersonNameComponents *)self valueForKeyPath:*(void *)(*((void *)&v14 + 1) + 8 * v10)];
        if (v11) {
          [(NSString *)v5 appendString:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v8);
  }
  return v5;
}

+ (id)__componentsRequiredForScriptDetectionWithPhoneticDesired:(BOOL)a3
{
  v6[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v6[0] = @"phoneticRepresentation.givenName";
    v6[1] = @"phoneticRepresentation.middleName";
    v6[2] = @"phoneticRepresentation.familyName";
    BOOL v3 = v6;
  }
  else
  {
    v5[0] = @"givenName";
    v5[1] = @"middleName";
    v5[2] = @"familyName";
    BOOL v3 = v5;
  }
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
}

+ (id)_allComponents
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v3[0] = @"givenName";
  v3[1] = @"familyName";
  v3[2] = @"middleName";
  v3[3] = @"namePrefix";
  v3[4] = @"nameSuffix";
  v3[5] = @"nickname";
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v3, 6));
}

- (void)setPhoneticRepresentation:(NSPersonNameComponents *)phoneticRepresentation
{
}

- (NSString)familyName
{
  return (NSString *)[self->_private familyName];
}

- (NSString)givenName
{
  return (NSString *)[self->_private givenName];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = (id)[self->_private copyWithZone:a3];
  return v5;
}

- (NSPersonNameComponents)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)NSPersonNameComponents;
  v2 = [(NSPersonNameComponents *)&v4 init];
  if (v2) {
    v2->_private = objc_alloc_init(_NSPersonNameComponentsData);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSPersonNameComponents;
  [(NSPersonNameComponents *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPersonNameComponents)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPersonNameComponents cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  if (self && [a3 containsValueForKey:@"NS.nameComponentsPrivate"]) {
    self->_private = (id)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NS.nameComponentsPrivate"), "copy");
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPersonNameComponents cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  id v5 = self->_private;

  [a3 encodeObject:v5 forKey:@"NS.nameComponentsPrivate"];
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSPersonNameComponents;
  return +[NSString stringWithFormat:@"%@ {givenName = %@, familyName = %@, middleName = %@, namePrefix = %@, nameSuffix = %@, nickname = %@ phoneticRepresentation = %@ }", [(NSPersonNameComponents *)&v3 description], [(NSPersonNameComponents *)self givenName], [(NSPersonNameComponents *)self familyName], [(NSPersonNameComponents *)self middleName], [(NSPersonNameComponents *)self namePrefix], [(NSPersonNameComponents *)self nameSuffix], [(NSPersonNameComponents *)self nickname], [(NSPersonNameComponents *)self phoneticRepresentation]];
}

- (BOOL)isEqual:(id)a3
{
  return self == a3 || -[NSPersonNameComponents isEqualToComponents:](self, "isEqualToComponents:");
}

- (BOOL)isEqualToComponents:(id)a3
{
  id v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v5 = +[NSPersonNameComponents _allProperties];
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 1;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__NSPersonNameComponents_isEqualToComponents___block_invoke;
    v7[3] = &unk_1E51F84E8;
    v7[4] = self;
    v7[5] = v3;
    v7[6] = &v8;
    [v5 enumerateObjectsUsingBlock:v7];
    LOBYTE(v3) = *((unsigned char *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }
  return (char)v3;
}

uint64_t __46__NSPersonNameComponents_isEqualToComponents___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v6 = (void *)[*(id *)(a1 + 32) valueForKey:a2];
  uint64_t result = [*(id *)(a1 + 40) valueForKey:a2];
  if (result) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8 || v6 && (!result || (uint64_t result = [v6 isEqual:result], (result & 1) == 0)))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 1;
  id v3 = +[NSPersonNameComponents _allProperties];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__NSPersonNameComponents_hash__block_invoke;
  v6[3] = &unk_1E51F8510;
  void v6[4] = self;
  v6[5] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __30__NSPersonNameComponents_hash__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)[*(id *)(a1 + 32) valueForKey:a2];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t result = [v3 hash];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result - v4 + 32 * v4;
  return result;
}

@end