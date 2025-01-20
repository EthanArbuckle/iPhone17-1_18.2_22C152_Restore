@interface HDCodableClinicalContact
- (BOOL)hasName;
- (BOOL)hasNameContactIdentifier;
- (BOOL)hasPhoneNumber;
- (BOOL)hasPhoneNumberContactIdentifier;
- (BOOL)hasPhoneNumberLabel;
- (BOOL)hasRelationship;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)name;
- (NSString)nameContactIdentifier;
- (NSString)phoneNumber;
- (NSString)phoneNumberContactIdentifier;
- (NSString)phoneNumberLabel;
- (NSString)relationship;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setName:(id)a3;
- (void)setNameContactIdentifier:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setPhoneNumberContactIdentifier:(id)a3;
- (void)setPhoneNumberLabel:(id)a3;
- (void)setRelationship:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableClinicalContact

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasNameContactIdentifier
{
  return self->_nameContactIdentifier != 0;
}

- (BOOL)hasPhoneNumber
{
  return self->_phoneNumber != 0;
}

- (BOOL)hasPhoneNumberContactIdentifier
{
  return self->_phoneNumberContactIdentifier != 0;
}

- (BOOL)hasPhoneNumberLabel
{
  return self->_phoneNumberLabel != 0;
}

- (BOOL)hasRelationship
{
  return self->_relationship != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableClinicalContact;
  v4 = [(HDCodableClinicalContact *)&v8 description];
  v5 = [(HDCodableClinicalContact *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  nameContactIdentifier = self->_nameContactIdentifier;
  if (nameContactIdentifier) {
    [v4 setObject:nameContactIdentifier forKey:@"nameContactIdentifier"];
  }
  phoneNumber = self->_phoneNumber;
  if (phoneNumber) {
    [v4 setObject:phoneNumber forKey:@"phoneNumber"];
  }
  phoneNumberContactIdentifier = self->_phoneNumberContactIdentifier;
  if (phoneNumberContactIdentifier) {
    [v4 setObject:phoneNumberContactIdentifier forKey:@"phoneNumberContactIdentifier"];
  }
  phoneNumberLabel = self->_phoneNumberLabel;
  if (phoneNumberLabel) {
    [v4 setObject:phoneNumberLabel forKey:@"phoneNumberLabel"];
  }
  relationship = self->_relationship;
  if (relationship) {
    [v4 setObject:relationship forKey:@"relationship"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableClinicalContactReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_nameContactIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_phoneNumber)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_phoneNumberContactIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_phoneNumberLabel)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_relationship)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v5;
  }
  if (self->_nameContactIdentifier)
  {
    objc_msgSend(v5, "setNameContactIdentifier:");
    id v4 = v5;
  }
  if (self->_phoneNumber)
  {
    objc_msgSend(v5, "setPhoneNumber:");
    id v4 = v5;
  }
  if (self->_phoneNumberContactIdentifier)
  {
    objc_msgSend(v5, "setPhoneNumberContactIdentifier:");
    id v4 = v5;
  }
  if (self->_phoneNumberLabel)
  {
    objc_msgSend(v5, "setPhoneNumberLabel:");
    id v4 = v5;
  }
  if (self->_relationship)
  {
    objc_msgSend(v5, "setRelationship:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_nameContactIdentifier copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_phoneNumber copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSString *)self->_phoneNumberContactIdentifier copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSString *)self->_phoneNumberLabel copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  uint64_t v16 = [(NSString *)self->_relationship copyWithZone:a3];
  v17 = (void *)v5[6];
  v5[6] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[1])) || -[NSString isEqual:](name, "isEqual:"))
    && ((nameContactIdentifier = self->_nameContactIdentifier, !((unint64_t)nameContactIdentifier | v4[2]))
     || -[NSString isEqual:](nameContactIdentifier, "isEqual:"))
    && ((phoneNumber = self->_phoneNumber, !((unint64_t)phoneNumber | v4[3]))
     || -[NSString isEqual:](phoneNumber, "isEqual:"))
    && ((phoneNumberContactIdentifier = self->_phoneNumberContactIdentifier,
         !((unint64_t)phoneNumberContactIdentifier | v4[4]))
     || -[NSString isEqual:](phoneNumberContactIdentifier, "isEqual:"))
    && ((phoneNumberLabel = self->_phoneNumberLabel, !((unint64_t)phoneNumberLabel | v4[5]))
     || -[NSString isEqual:](phoneNumberLabel, "isEqual:")))
  {
    relationship = self->_relationship;
    if ((unint64_t)relationship | v4[6]) {
      char v11 = -[NSString isEqual:](relationship, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_nameContactIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_phoneNumber hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_phoneNumberContactIdentifier hash];
  NSUInteger v7 = [(NSString *)self->_phoneNumberLabel hash];
  return v6 ^ v7 ^ [(NSString *)self->_relationship hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[1]) {
    -[HDCodableClinicalContact setName:](self, "setName:");
  }
  if (v4[2]) {
    -[HDCodableClinicalContact setNameContactIdentifier:](self, "setNameContactIdentifier:");
  }
  if (v4[3]) {
    -[HDCodableClinicalContact setPhoneNumber:](self, "setPhoneNumber:");
  }
  if (v4[4]) {
    -[HDCodableClinicalContact setPhoneNumberContactIdentifier:](self, "setPhoneNumberContactIdentifier:");
  }
  if (v4[5]) {
    -[HDCodableClinicalContact setPhoneNumberLabel:](self, "setPhoneNumberLabel:");
  }
  if (v4[6]) {
    -[HDCodableClinicalContact setRelationship:](self, "setRelationship:");
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)nameContactIdentifier
{
  return self->_nameContactIdentifier;
}

- (void)setNameContactIdentifier:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)phoneNumberContactIdentifier
{
  return self->_phoneNumberContactIdentifier;
}

- (void)setPhoneNumberContactIdentifier:(id)a3
{
}

- (NSString)phoneNumberLabel
{
  return self->_phoneNumberLabel;
}

- (void)setPhoneNumberLabel:(id)a3
{
}

- (NSString)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_phoneNumberLabel, 0);
  objc_storeStrong((id *)&self->_phoneNumberContactIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_nameContactIdentifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end