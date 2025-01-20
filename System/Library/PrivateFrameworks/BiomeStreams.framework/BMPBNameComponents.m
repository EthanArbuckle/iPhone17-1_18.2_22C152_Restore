@interface BMPBNameComponents
- (BOOL)hasFamilyName;
- (BOOL)hasGivenName;
- (BOOL)hasMiddleName;
- (BOOL)hasNamePrefix;
- (BOOL)hasNameSuffix;
- (BOOL)hasNickname;
- (BOOL)hasPreviousFamilyName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)middleName;
- (NSString)namePrefix;
- (NSString)nameSuffix;
- (NSString)nickname;
- (NSString)previousFamilyName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNamePrefix:(id)a3;
- (void)setNameSuffix:(id)a3;
- (void)setNickname:(id)a3;
- (void)setPreviousFamilyName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBNameComponents

- (BOOL)hasNamePrefix
{
  return self->_namePrefix != 0;
}

- (BOOL)hasGivenName
{
  return self->_givenName != 0;
}

- (BOOL)hasMiddleName
{
  return self->_middleName != 0;
}

- (BOOL)hasPreviousFamilyName
{
  return self->_previousFamilyName != 0;
}

- (BOOL)hasFamilyName
{
  return self->_familyName != 0;
}

- (BOOL)hasNameSuffix
{
  return self->_nameSuffix != 0;
}

- (BOOL)hasNickname
{
  return self->_nickname != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBNameComponents;
  v4 = [(BMPBNameComponents *)&v8 description];
  v5 = [(BMPBNameComponents *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  namePrefix = self->_namePrefix;
  if (namePrefix) {
    [v3 setObject:namePrefix forKey:@"namePrefix"];
  }
  givenName = self->_givenName;
  if (givenName) {
    [v4 setObject:givenName forKey:@"givenName"];
  }
  middleName = self->_middleName;
  if (middleName) {
    [v4 setObject:middleName forKey:@"middleName"];
  }
  previousFamilyName = self->_previousFamilyName;
  if (previousFamilyName) {
    [v4 setObject:previousFamilyName forKey:@"previousFamilyName"];
  }
  familyName = self->_familyName;
  if (familyName) {
    [v4 setObject:familyName forKey:@"familyName"];
  }
  nameSuffix = self->_nameSuffix;
  if (nameSuffix) {
    [v4 setObject:nameSuffix forKey:@"nameSuffix"];
  }
  nickname = self->_nickname;
  if (nickname) {
    [v4 setObject:nickname forKey:@"nickname"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBNameComponentsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_namePrefix)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_givenName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_middleName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_previousFamilyName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_familyName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_nameSuffix)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_nickname)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_namePrefix)
  {
    objc_msgSend(v4, "setNamePrefix:");
    id v4 = v5;
  }
  if (self->_givenName)
  {
    objc_msgSend(v5, "setGivenName:");
    id v4 = v5;
  }
  if (self->_middleName)
  {
    objc_msgSend(v5, "setMiddleName:");
    id v4 = v5;
  }
  if (self->_previousFamilyName)
  {
    objc_msgSend(v5, "setPreviousFamilyName:");
    id v4 = v5;
  }
  if (self->_familyName)
  {
    objc_msgSend(v5, "setFamilyName:");
    id v4 = v5;
  }
  if (self->_nameSuffix)
  {
    objc_msgSend(v5, "setNameSuffix:");
    id v4 = v5;
  }
  if (self->_nickname)
  {
    objc_msgSend(v5, "setNickname:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_namePrefix copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_givenName copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_middleName copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSString *)self->_previousFamilyName copyWithZone:a3];
  v13 = (void *)v5[7];
  v5[7] = v12;

  uint64_t v14 = [(NSString *)self->_familyName copyWithZone:a3];
  v15 = (void *)v5[1];
  v5[1] = v14;

  uint64_t v16 = [(NSString *)self->_nameSuffix copyWithZone:a3];
  v17 = (void *)v5[5];
  v5[5] = v16;

  uint64_t v18 = [(NSString *)self->_nickname copyWithZone:a3];
  v19 = (void *)v5[6];
  v5[6] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((namePrefix = self->_namePrefix, !((unint64_t)namePrefix | v4[4]))
     || -[NSString isEqual:](namePrefix, "isEqual:"))
    && ((givenName = self->_givenName, !((unint64_t)givenName | v4[2]))
     || -[NSString isEqual:](givenName, "isEqual:"))
    && ((middleName = self->_middleName, !((unint64_t)middleName | v4[3]))
     || -[NSString isEqual:](middleName, "isEqual:"))
    && ((previousFamilyName = self->_previousFamilyName, !((unint64_t)previousFamilyName | v4[7]))
     || -[NSString isEqual:](previousFamilyName, "isEqual:"))
    && ((familyName = self->_familyName, !((unint64_t)familyName | v4[1]))
     || -[NSString isEqual:](familyName, "isEqual:"))
    && ((nameSuffix = self->_nameSuffix, !((unint64_t)nameSuffix | v4[5]))
     || -[NSString isEqual:](nameSuffix, "isEqual:")))
  {
    nickname = self->_nickname;
    if ((unint64_t)nickname | v4[6]) {
      char v12 = -[NSString isEqual:](nickname, "isEqual:");
    }
    else {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_namePrefix hash];
  NSUInteger v4 = [(NSString *)self->_givenName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_middleName hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_previousFamilyName hash];
  NSUInteger v7 = [(NSString *)self->_familyName hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_nameSuffix hash];
  return v6 ^ v8 ^ [(NSString *)self->_nickname hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[4]) {
    -[BMPBNameComponents setNamePrefix:](self, "setNamePrefix:");
  }
  if (v4[2]) {
    -[BMPBNameComponents setGivenName:](self, "setGivenName:");
  }
  if (v4[3]) {
    -[BMPBNameComponents setMiddleName:](self, "setMiddleName:");
  }
  if (v4[7]) {
    -[BMPBNameComponents setPreviousFamilyName:](self, "setPreviousFamilyName:");
  }
  if (v4[1]) {
    -[BMPBNameComponents setFamilyName:](self, "setFamilyName:");
  }
  if (v4[5]) {
    -[BMPBNameComponents setNameSuffix:](self, "setNameSuffix:");
  }
  if (v4[6]) {
    -[BMPBNameComponents setNickname:](self, "setNickname:");
  }
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (void)setNamePrefix:(id)a3
{
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
}

- (NSString)previousFamilyName
{
  return self->_previousFamilyName;
}

- (void)setPreviousFamilyName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (void)setNameSuffix:(id)a3
{
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousFamilyName, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);

  objc_storeStrong((id *)&self->_familyName, 0);
}

@end