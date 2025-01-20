@interface NSMorphologyCustomPronoun
+ (BOOL)_validateCustomPronounWithAccessor:(id)a3 forLanguage:(id)a4 error:(id *)a5;
+ (BOOL)isSupportedForLanguage:(NSString *)language;
+ (BOOL)supportsSecureCoding;
+ (NSArray)requiredKeysForLanguage:(NSString *)language;
- (BOOL)_autocompleteEnglishPronounFromSubjectForm;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)_externalRepresentationDictionary;
- (NSMorphologyCustomPronoun)initWithCoder:(id)a3;
- (NSString)objectForm;
- (NSString)possessiveAdjectiveForm;
- (NSString)possessiveForm;
- (NSString)reflexiveForm;
- (NSString)subjectForm;
- (id)_externalRepresentation;
- (id)_initWithExternalRepresentationDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setObjectForm:(NSString *)objectForm;
- (void)setPossessiveAdjectiveForm:(NSString *)possessiveAdjectiveForm;
- (void)setPossessiveForm:(NSString *)possessiveForm;
- (void)setReflexiveForm:(NSString *)reflexiveForm;
- (void)setSubjectForm:(NSString *)subjectForm;
@end

@implementation NSMorphologyCustomPronoun

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSMorphologyCustomPronoun;
  [(NSMorphologyCustomPronoun *)&v3 dealloc];
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  NSUInteger v4 = [(NSString *)[(NSMorphologyCustomPronoun *)self subjectForm] hash] ^ v3;
  NSUInteger v5 = [(NSString *)[(NSMorphologyCustomPronoun *)self objectForm] hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)[(NSMorphologyCustomPronoun *)self possessiveForm] hash];
  NSUInteger v7 = [(NSString *)[(NSMorphologyCustomPronoun *)self possessiveAdjectiveForm] hash];
  return v6 ^ v7 ^ [(NSString *)[(NSMorphologyCustomPronoun *)self reflexiveForm] hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    NSUInteger v5 = [(NSMorphologyCustomPronoun *)self subjectForm];
    uint64_t v6 = [a3 subjectForm];
    if (v5 == (NSString *)v6 || (BOOL v7 = [(NSString *)v5 isEqual:v6]))
    {
      v8 = [(NSMorphologyCustomPronoun *)self objectForm];
      uint64_t v9 = [a3 objectForm];
      if (v8 == (NSString *)v9 || (BOOL v7 = [(NSString *)v8 isEqual:v9]))
      {
        v10 = [(NSMorphologyCustomPronoun *)self possessiveForm];
        uint64_t v11 = [a3 possessiveForm];
        if (v10 == (NSString *)v11 || (BOOL v7 = [(NSString *)v10 isEqual:v11]))
        {
          v12 = [(NSMorphologyCustomPronoun *)self possessiveAdjectiveForm];
          uint64_t v13 = [a3 possessiveAdjectiveForm];
          if (v12 == (NSString *)v13 || (BOOL v7 = [(NSString *)v12 isEqual:v13]))
          {
            v14 = [(NSMorphologyCustomPronoun *)self reflexiveForm];
            uint64_t v15 = [a3 reflexiveForm];
            if (v14 == (NSString *)v15)
            {
              LOBYTE(v7) = 1;
            }
            else
            {
              LOBYTE(v7) = [(NSString *)v14 isEqual:v15];
            }
          }
        }
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

+ (BOOL)isSupportedForLanguage:(NSString *)language
{
  if ([(NSString *)language length] < 2
    || [[(NSString *)language substringToIndex:2] caseInsensitiveCompare:@"en"])
  {
    return 0;
  }
  if ([(NSString *)language length] == 2
    || [(NSString *)language characterAtIndex:2] == 45)
  {
    return 1;
  }
  return [(NSString *)language characterAtIndex:2] == 95;
}

+ (NSArray)requiredKeysForLanguage:(NSString *)language
{
  if ([a1 isSupportedForLanguage:language]) {
    return (NSArray *)&unk_1ECAB6128;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = objc_alloc_init((Class)objc_opt_class());
  v4[1] = [(NSString *)[(NSMorphologyCustomPronoun *)self subjectForm] copy];
  v4[2] = [(NSString *)[(NSMorphologyCustomPronoun *)self objectForm] copy];
  v4[3] = [(NSString *)[(NSMorphologyCustomPronoun *)self possessiveForm] copy];
  v4[4] = [(NSString *)[(NSMorphologyCustomPronoun *)self possessiveAdjectiveForm] copy];
  v4[5] = [(NSString *)[(NSMorphologyCustomPronoun *)self reflexiveForm] copy];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_subjectForm forKey:@"subjectForm"];
  [a3 encodeObject:self->_objectForm forKey:@"objectForm"];
  [a3 encodeObject:self->_possessiveForm forKey:@"possessiveForm"];
  [a3 encodeObject:self->_possessiveAdjectiveForm forKey:@"possessiveAdjectiveForm"];
  reflexiveForm = self->_reflexiveForm;

  [a3 encodeObject:reflexiveForm forKey:@"reflexiveForm"];
}

- (NSMorphologyCustomPronoun)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSMorphologyCustomPronoun;
  NSUInteger v4 = [(NSMorphologyCustomPronoun *)&v6 init];
  if (v4)
  {
    v4->_subjectForm = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"subjectForm"), "copy");
    v4->_objectForm = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"objectForm"), "copy");
    v4->_possessiveForm = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"possessiveForm"), "copy");
    v4->_possessiveAdjectiveForm = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"possessiveAdjectiveForm"), "copy");
    v4->_reflexiveForm = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"reflexiveForm"), "copy");
  }
  return v4;
}

- (NSString)subjectForm
{
  return self->_subjectForm;
}

- (void)setSubjectForm:(NSString *)subjectForm
{
}

- (NSString)objectForm
{
  return self->_objectForm;
}

- (void)setObjectForm:(NSString *)objectForm
{
}

- (NSString)possessiveForm
{
  return self->_possessiveForm;
}

- (void)setPossessiveForm:(NSString *)possessiveForm
{
}

- (NSString)possessiveAdjectiveForm
{
  return self->_possessiveAdjectiveForm;
}

- (void)setPossessiveAdjectiveForm:(NSString *)possessiveAdjectiveForm
{
}

- (NSString)reflexiveForm
{
  return self->_reflexiveForm;
}

- (void)setReflexiveForm:(NSString *)reflexiveForm
{
}

- (BOOL)_autocompleteEnglishPronounFromSubjectForm
{
  return 0;
}

- (id)_initWithExternalRepresentationDictionary:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)NSMorphologyCustomPronoun;
  NSUInteger v4 = [(NSMorphologyCustomPronoun *)&v11 init];
  if (v4)
  {
    NSUInteger v5 = (void *)[a3 objectForKeyedSubscript:@"subjectForm"];
    if (v5 && (_NSIsNSString() & 1) == 0
      || (objc_super v6 = (void *)[a3 objectForKeyedSubscript:@"objectForm"]) != 0
      && (_NSIsNSString() & 1) == 0
      || (uint64_t v7 = (void *)[a3 objectForKeyedSubscript:@"possessiveForm"]) != 0
      && (_NSIsNSString() & 1) == 0
      || (v8 = (void *)[a3 objectForKeyedSubscript:@"possessiveAdjectiveForm"]) != 0
      && (_NSIsNSString() & 1) == 0
      || (uint64_t v9 = (void *)[a3 objectForKeyedSubscript:@"reflexiveForm"]) != 0
      && (_NSIsNSString() & 1) == 0)
    {

      return 0;
    }
    else
    {
      v4->_subjectForm = (NSString *)[v5 copy];
      v4->_objectForm = (NSString *)[v6 copy];
      v4->_possessiveForm = (NSString *)[v7 copy];
      v4->_possessiveAdjectiveForm = (NSString *)[v8 copy];
      v4->_reflexiveForm = (NSString *)[v9 copy];
    }
  }
  return v4;
}

- (NSDictionary)_externalRepresentationDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSMorphologyCustomPronoun subjectForm](self, "subjectForm"), @"subjectForm");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSMorphologyCustomPronoun objectForm](self, "objectForm"), @"objectForm");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSMorphologyCustomPronoun possessiveForm](self, "possessiveForm"), @"possessiveForm");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSMorphologyCustomPronoun possessiveAdjectiveForm](self, "possessiveAdjectiveForm"), @"possessiveAdjectiveForm");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSMorphologyCustomPronoun reflexiveForm](self, "reflexiveForm"), @"reflexiveForm");

  return (NSDictionary *)v3;
}

- (id)_externalRepresentation
{
  v2 = [(NSMorphologyCustomPronoun *)self _externalRepresentationDictionary];

  return +[NSJSONSerialization dataWithJSONObject:v2 options:0 error:0];
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSMorphologyCustomPronoun;
  return +[NSString stringWithFormat:@"%@ { subject: '%@', object: '%@', possessive: '%@', possessive adjective: '%@', reflexive: '%@' }", [(NSMorphologyCustomPronoun *)&v3 description], [(NSMorphologyCustomPronoun *)self subjectForm], [(NSMorphologyCustomPronoun *)self objectForm], [(NSMorphologyCustomPronoun *)self possessiveForm], [(NSMorphologyCustomPronoun *)self possessiveAdjectiveForm], [(NSMorphologyCustomPronoun *)self reflexiveForm]];
}

+ (BOOL)_validateCustomPronounWithAccessor:(id)a3 forLanguage:(id)a4 error:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  if (+[NSMorphologyCustomPronoun isSupportedForLanguage:a4])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v8 = +[NSMorphologyCustomPronoun requiredKeysForLanguage:a4];
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v23 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * v12);
        uint64_t v14 = (*((uint64_t (**)(id, uint64_t))a3 + 2))(a3, v13);
        if (!v14 || v14 == [MEMORY[0x1E4F1CA98] null]) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v23 objects:v22 count:16];
          BOOL result = 1;
          if (v10) {
            goto LABEL_4;
          }
          return result;
        }
      }
      if (!a5) {
        return 0;
      }
      v20 = @"NSInvalidValue";
      uint64_t v21 = v13;
      v16 = (void *)MEMORY[0x1E4F1C9E8];
      v17 = &v21;
      v18 = &v20;
      goto LABEL_16;
    }
    return 1;
  }
  else
  {
    if (a5)
    {
      v27 = @"NSInvalidValue";
      v28[0] = @"self";
      v16 = (void *)MEMORY[0x1E4F1C9E8];
      v17 = v28;
      v18 = &v27;
LABEL_16:
      v19 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 1024, objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1, v20, v21));
      BOOL result = 0;
      *a5 = v19;
      return result;
    }
    return 0;
  }
}

@end