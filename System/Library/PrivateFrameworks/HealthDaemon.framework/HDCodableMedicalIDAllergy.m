@interface HDCodableMedicalIDAllergy
- (BOOL)hasTextDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)textDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTextDescription:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableMedicalIDAllergy

- (BOOL)hasTextDescription
{
  return self->_textDescription != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableMedicalIDAllergy;
  v4 = [(HDCodableMedicalIDAllergy *)&v8 description];
  v5 = [(HDCodableMedicalIDAllergy *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  textDescription = self->_textDescription;
  if (textDescription) {
    [v3 setObject:textDescription forKey:@"textDescription"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicalIDAllergyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_textDescription) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  textDescription = self->_textDescription;
  if (textDescription) {
    [a3 setTextDescription:textDescription];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_textDescription copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    textDescription = self->_textDescription;
    if ((unint64_t)textDescription | v4[1]) {
      char v6 = -[NSString isEqual:](textDescription, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_textDescription hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[HDCodableMedicalIDAllergy setTextDescription:](self, "setTextDescription:");
  }
}

- (NSString)textDescription
{
  return self->_textDescription;
}

- (void)setTextDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end