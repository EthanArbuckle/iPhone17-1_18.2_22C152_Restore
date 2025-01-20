@interface HDCodableMedicalCoding
- (BOOL)hasCode;
- (BOOL)hasCodingSystem;
- (BOOL)hasCodingVersion;
- (BOOL)hasDisplayString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)code;
- (NSString)codingSystem;
- (NSString)codingVersion;
- (NSString)displayString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCode:(id)a3;
- (void)setCodingSystem:(id)a3;
- (void)setCodingVersion:(id)a3;
- (void)setDisplayString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableMedicalCoding

- (BOOL)hasCodingSystem
{
  return self->_codingSystem != 0;
}

- (BOOL)hasCodingVersion
{
  return self->_codingVersion != 0;
}

- (BOOL)hasCode
{
  return self->_code != 0;
}

- (BOOL)hasDisplayString
{
  return self->_displayString != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableMedicalCoding;
  v4 = [(HDCodableMedicalCoding *)&v8 description];
  v5 = [(HDCodableMedicalCoding *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  codingSystem = self->_codingSystem;
  if (codingSystem) {
    [v3 setObject:codingSystem forKey:@"codingSystem"];
  }
  codingVersion = self->_codingVersion;
  if (codingVersion) {
    [v4 setObject:codingVersion forKey:@"codingVersion"];
  }
  code = self->_code;
  if (code) {
    [v4 setObject:code forKey:@"code"];
  }
  displayString = self->_displayString;
  if (displayString) {
    [v4 setObject:displayString forKey:@"displayString"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicalCodingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_codingSystem)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_codingVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_code)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_displayString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_codingSystem)
  {
    objc_msgSend(v4, "setCodingSystem:");
    id v4 = v5;
  }
  if (self->_codingVersion)
  {
    objc_msgSend(v5, "setCodingVersion:");
    id v4 = v5;
  }
  if (self->_code)
  {
    objc_msgSend(v5, "setCode:");
    id v4 = v5;
  }
  if (self->_displayString)
  {
    objc_msgSend(v5, "setDisplayString:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_codingSystem copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_codingVersion copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_code copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  uint64_t v12 = [(NSString *)self->_displayString copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((codingSystem = self->_codingSystem, !((unint64_t)codingSystem | v4[2]))
     || -[NSString isEqual:](codingSystem, "isEqual:"))
    && ((codingVersion = self->_codingVersion, !((unint64_t)codingVersion | v4[3]))
     || -[NSString isEqual:](codingVersion, "isEqual:"))
    && ((code = self->_code, !((unint64_t)code | v4[1])) || -[NSString isEqual:](code, "isEqual:")))
  {
    displayString = self->_displayString;
    if ((unint64_t)displayString | v4[4]) {
      char v9 = -[NSString isEqual:](displayString, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_codingSystem hash];
  NSUInteger v4 = [(NSString *)self->_codingVersion hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_code hash];
  return v4 ^ v5 ^ [(NSString *)self->_displayString hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[2]) {
    -[HDCodableMedicalCoding setCodingSystem:](self, "setCodingSystem:");
  }
  if (v4[3]) {
    -[HDCodableMedicalCoding setCodingVersion:](self, "setCodingVersion:");
  }
  if (v4[1]) {
    -[HDCodableMedicalCoding setCode:](self, "setCode:");
  }
  if (v4[4]) {
    -[HDCodableMedicalCoding setDisplayString:](self, "setDisplayString:");
  }
}

- (NSString)codingSystem
{
  return self->_codingSystem;
}

- (void)setCodingSystem:(id)a3
{
}

- (NSString)codingVersion
{
  return self->_codingVersion;
}

- (void)setCodingVersion:(id)a3
{
}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_codingVersion, 0);
  objc_storeStrong((id *)&self->_codingSystem, 0);

  objc_storeStrong((id *)&self->_code, 0);
}

@end