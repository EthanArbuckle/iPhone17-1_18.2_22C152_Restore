@interface CSCustomAttributeKey
+ (BOOL)_keyNameIsValid:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMultiValued;
- (BOOL)isSearchable;
- (BOOL)isSearchableByDefault;
- (BOOL)isUnique;
- (CSCustomAttributeKey)init;
- (CSCustomAttributeKey)initWithCoder:(id)a3;
- (CSCustomAttributeKey)initWithKeyName:(NSString *)keyName;
- (CSCustomAttributeKey)initWithKeyName:(NSString *)keyName searchable:(BOOL)searchable searchableByDefault:(BOOL)searchableByDefault unique:(BOOL)unique multiValued:(BOOL)multiValued;
- (NSString)keyName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyName:(id)a3;
- (void)setMultiValued:(BOOL)a3;
- (void)setSearchable:(BOOL)a3;
- (void)setSearchableByDefault:(BOOL)a3;
- (void)setUnique:(BOOL)a3;
@end

@implementation CSCustomAttributeKey

- (unint64_t)hash
{
  v2 = [(CSCustomAttributeKey *)self keyName];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(CSCustomAttributeKey *)self keyName];
    v7 = [v5 keyName];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v8 = 0;
      goto LABEL_7;
    }
    v6 = [(CSCustomAttributeKey *)self keyName];
    char v8 = [v6 isEqualToString:v4];
  }

LABEL_7:
  return v8;
}

- (NSString)keyName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(CSCustomAttributeKey *)self keyName];
  v6 = (void *)[v4 initWithKeyName:v5];

  objc_msgSend(v6, "setUnique:", -[CSCustomAttributeKey isUnique](self, "isUnique"));
  objc_msgSend(v6, "setSearchableByDefault:", -[CSCustomAttributeKey isSearchableByDefault](self, "isSearchableByDefault"));
  objc_msgSend(v6, "setSearchable:", -[CSCustomAttributeKey isSearchable](self, "isSearchable"));
  objc_msgSend(v6, "setMultiValued:", -[CSCustomAttributeKey isMultiValued](self, "isMultiValued"));
  return v6;
}

- (void)setUnique:(BOOL)a3
{
  self->_unique = a3;
}

- (void)setSearchableByDefault:(BOOL)a3
{
  self->_searchableByDefault = a3;
}

- (void)setSearchable:(BOOL)a3
{
  self->_searchable = a3;
}

- (void)setMultiValued:(BOOL)a3
{
  self->_multiValued = a3;
}

- (BOOL)isUnique
{
  return self->_unique;
}

- (BOOL)isSearchable
{
  return self->_searchable;
}

- (BOOL)isSearchableByDefault
{
  return self->_searchableByDefault;
}

- (BOOL)isMultiValued
{
  return self->_multiValued;
}

- (CSCustomAttributeKey)initWithKeyName:(NSString *)keyName searchable:(BOOL)searchable searchableByDefault:(BOOL)searchableByDefault unique:(BOOL)unique multiValued:(BOOL)multiValued
{
  BOOL v7 = multiValued;
  BOOL v8 = unique;
  BOOL v9 = searchableByDefault;
  BOOL v10 = searchable;
  v12 = keyName;
  if ([(id)objc_opt_class() _keyNameIsValid:v12])
  {
    v17.receiver = self;
    v17.super_class = (Class)CSCustomAttributeKey;
    v13 = [(CSCustomAttributeKey *)&v17 init];
    v14 = v13;
    if (v13)
    {
      [(CSCustomAttributeKey *)v13 setKeyName:v12];
      [(CSCustomAttributeKey *)v14 setSearchable:v10];
      [(CSCustomAttributeKey *)v14 setSearchableByDefault:v9];
      [(CSCustomAttributeKey *)v14 setUnique:v8];
      [(CSCustomAttributeKey *)v14 setMultiValued:v7];
    }
    self = v14;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)setKeyName:(id)a3
{
}

- (CSCustomAttributeKey)initWithKeyName:(NSString *)keyName
{
  return [(CSCustomAttributeKey *)self initWithKeyName:keyName searchable:1 searchableByDefault:0 unique:0 multiValued:0];
}

+ (BOOL)_keyNameIsValid:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _allKeys];
  char v5 = [v4 containsObject:v3];

  if (v5) {
    goto LABEL_6;
  }
  if (_keyNameIsValid__onceToken != -1) {
    dispatch_once(&_keyNameIsValid__onceToken, &__block_literal_global_1891);
  }
  if ([v3 rangeOfCharacterFromSet:_keyNameIsValid__illegalCharacters] != 0x7FFFFFFFFFFFFFFFLL) {
LABEL_6:
  }
    char v6 = 0;
  else {
    char v6 = [v3 canBeConvertedToEncoding:1];
  }

  return v6;
}

- (void).cxx_destruct
{
}

uint64_t __40__CSCustomAttributeKey__keyNameIsValid___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_keyNameIsValid__illegalCharacters;
  _keyNameIsValid__illegalCharacters = v0;

  v2 = (void *)_keyNameIsValid__illegalCharacters;
  id v3 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  [v2 formUnionWithCharacterSet:v3];

  id v4 = (void *)_keyNameIsValid__illegalCharacters;

  return [v4 removeCharactersInString:@"_"];
}

- (CSCustomAttributeKey)init
{
  id v2 = [NSString alloc];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [v2 initWithFormat:@"You must call -[%@ initWithKeyName...]", v4];

  id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v5 userInfo:0];
  objc_exception_throw(v6);
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(CSCustomAttributeKey *)self keyName];
  [v5 encodeObject:v4 forKey:@"keyName"];

  objc_msgSend(v5, "encodeBool:forKey:", -[CSCustomAttributeKey isUnique](self, "isUnique"), @"isUnique");
  objc_msgSend(v5, "encodeBool:forKey:", -[CSCustomAttributeKey isSearchable](self, "isSearchable"), @"isSearchable");
  objc_msgSend(v5, "encodeBool:forKey:", -[CSCustomAttributeKey isSearchableByDefault](self, "isSearchableByDefault"), @"isSearchableByDefault");
  objc_msgSend(v5, "encodeBool:forKey:", -[CSCustomAttributeKey isMultiValued](self, "isMultiValued"), @"isMultiValued");
}

- (CSCustomAttributeKey)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyName"];
  uint64_t v6 = [v4 decodeBoolForKey:@"isUnique"];
  uint64_t v7 = [v4 decodeBoolForKey:@"isSearchable"];
  uint64_t v8 = [v4 decodeBoolForKey:@"isSearchableByDefault"];
  uint64_t v9 = [v4 decodeBoolForKey:@"isMultiValued"];

  BOOL v10 = [(CSCustomAttributeKey *)self initWithKeyName:v5 searchable:v7 searchableByDefault:v8 unique:v6 multiValued:v9];
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CSCustomAttributeKey *)self keyName];
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%p %@", v4, self, v5];

  return v6;
}

@end