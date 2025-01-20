@interface HKCodableHealthRecordsCode
- (BOOL)hasCode;
- (BOOL)hasDisplayName;
- (BOOL)hasSystem;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)code;
- (NSString)displayName;
- (NSString)system;
- (NSString)version;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCode:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setSystem:(id)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableHealthRecordsCode

- (BOOL)hasSystem
{
  return self->_system != 0;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (BOOL)hasCode
{
  return self->_code != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableHealthRecordsCode;
  v4 = [(HKCodableHealthRecordsCode *)&v8 description];
  v5 = [(HKCodableHealthRecordsCode *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  system = self->_system;
  if (system) {
    [v3 setObject:system forKey:@"system"];
  }
  version = self->_version;
  if (version) {
    [v4 setObject:version forKey:@"version"];
  }
  code = self->_code;
  if (code) {
    [v4 setObject:code forKey:@"code"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v4 setObject:displayName forKey:@"displayName"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableHealthRecordsCodeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_system)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_version)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_code)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_system)
  {
    objc_msgSend(v4, "setSystem:");
    id v4 = v5;
  }
  if (self->_version)
  {
    objc_msgSend(v5, "setVersion:");
    id v4 = v5;
  }
  if (self->_code)
  {
    objc_msgSend(v5, "setCode:");
    id v4 = v5;
  }
  if (self->_displayName)
  {
    objc_msgSend(v5, "setDisplayName:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_system copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_version copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSString *)self->_code copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  uint64_t v12 = [(NSString *)self->_displayName copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((system = self->_system, !((unint64_t)system | v4[3]))
     || -[NSString isEqual:](system, "isEqual:"))
    && ((version = self->_version, !((unint64_t)version | v4[4]))
     || -[NSString isEqual:](version, "isEqual:"))
    && ((code = self->_code, !((unint64_t)code | v4[1])) || -[NSString isEqual:](code, "isEqual:")))
  {
    displayName = self->_displayName;
    if ((unint64_t)displayName | v4[2]) {
      char v9 = -[NSString isEqual:](displayName, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_system hash];
  NSUInteger v4 = [(NSString *)self->_version hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_code hash];
  return v4 ^ v5 ^ [(NSString *)self->_displayName hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[3]) {
    -[HKCodableHealthRecordsCode setSystem:](self, "setSystem:");
  }
  if (v4[4]) {
    -[HKCodableHealthRecordsCode setVersion:](self, "setVersion:");
  }
  if (v4[1]) {
    -[HKCodableHealthRecordsCode setCode:](self, "setCode:");
  }
  if (v4[2]) {
    -[HKCodableHealthRecordsCode setDisplayName:](self, "setDisplayName:");
  }
}

- (NSString)system
{
  return self->_system;
}

- (void)setSystem:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_system, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

@end