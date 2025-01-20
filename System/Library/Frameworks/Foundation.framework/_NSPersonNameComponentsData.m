@interface _NSPersonNameComponentsData
+ (BOOL)supportsSecureCoding;
- (NSPersonNameComponents)phoneticRepresentation;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)middleName;
- (NSString)namePrefix;
- (NSString)nameSuffix;
- (NSString)nickname;
- (_NSPersonNameComponentsData)init;
- (_NSPersonNameComponentsData)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNamePrefix:(id)a3;
- (void)setNameSuffix:(id)a3;
- (void)setNickname:(id)a3;
- (void)setPhoneticRepresentation:(id)a3;
@end

@implementation _NSPersonNameComponentsData

- (NSPersonNameComponents)phoneticRepresentation
{
  return (NSPersonNameComponents *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)middleName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)nickname
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)nameSuffix
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)namePrefix
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setGivenName:(id)a3
{
}

- (void)setFamilyName:(id)a3
{
}

- (void)setMiddleName:(id)a3
{
}

- (void)setNameSuffix:(id)a3
{
}

- (void)setNamePrefix:(id)a3
{
}

- (void)setNickname:(id)a3
{
}

- (void)setPhoneticRepresentation:(id)a3
{
}

- (NSString)familyName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)givenName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (_NSPersonNameComponentsData)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_NSPersonNameComponentsData;
  result = [(_NSPersonNameComponentsData *)&v3 init];
  if (result)
  {
    result->_phoneticRepresentation = 0;
    *(_OWORD *)&result->_nameSuffix = 0u;
    *(_OWORD *)&result->_middleName = 0u;
    *(_OWORD *)&result->_givenName = 0u;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (self)
  {

    self->_givenName = 0;
    self->_familyName = 0;

    self->_middleName = 0;
    self->_namePrefix = 0;

    self->_nameSuffix = 0;
    self->_nickname = 0;

    self->_phoneticRepresentation = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)_NSPersonNameComponentsData;
  [(_NSPersonNameComponentsData *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(_NSPersonNameComponentsData);
  v5->_givenName = (NSString *)[(NSString *)self->_givenName copyWithZone:a3];
  v5->_familyName = (NSString *)[(NSString *)self->_familyName copyWithZone:a3];
  v5->_middleName = (NSString *)[(NSString *)self->_middleName copyWithZone:a3];
  v5->_namePrefix = (NSString *)[(NSString *)self->_namePrefix copyWithZone:a3];
  v5->_nameSuffix = (NSString *)[(NSString *)self->_nameSuffix copyWithZone:a3];
  v5->_nickname = (NSString *)[(NSString *)self->_nickname copyWithZone:a3];
  v5->_phoneticRepresentation = (NSPersonNameComponents *)[(NSPersonNameComponents *)self->_phoneticRepresentation copyWithZone:a3];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSPersonNameComponentsData)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPersonNameComponents cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  if (self)
  {
    if ([a3 containsValueForKey:@"NS.givenName"]) {
      self->_givenName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NS.givenName"), "copy");
    }
    if ([a3 containsValueForKey:@"NS.familyName"]) {
      self->_familyName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NS.familyName"), "copy");
    }
    if ([a3 containsValueForKey:@"NS.middleName"]) {
      self->_middleName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NS.middleName"), "copy");
    }
    if ([a3 containsValueForKey:@"NS.namePrefix"]) {
      self->_namePrefix = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NS.namePrefix"), "copy");
    }
    if ([a3 containsValueForKey:@"NS.nameSuffix"]) {
      self->_nameSuffix = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NS.nameSuffix"), "copy");
    }
    if ([a3 containsValueForKey:@"NS.nickname"]) {
      self->_nickname = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NS.nickname"), "copy");
    }
    if ([a3 containsValueForKey:@"NS.phoneticRepresentation"]) {
      self->_phoneticRepresentation = (NSPersonNameComponents *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NS.phoneticRepresentation"), "copy");
    }
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPersonNameComponents cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  [a3 encodeObject:self->_givenName forKey:@"NS.givenName"];
  [a3 encodeObject:self->_familyName forKey:@"NS.familyName"];
  [a3 encodeObject:self->_middleName forKey:@"NS.middleName"];
  [a3 encodeObject:self->_namePrefix forKey:@"NS.namePrefix"];
  [a3 encodeObject:self->_nameSuffix forKey:@"NS.nameSuffix"];
  [a3 encodeObject:self->_nickname forKey:@"NS.nickname"];
  phoneticRepresentation = self->_phoneticRepresentation;

  [a3 encodeObject:phoneticRepresentation forKey:@"NS.phoneticRepresentation"];
}

@end