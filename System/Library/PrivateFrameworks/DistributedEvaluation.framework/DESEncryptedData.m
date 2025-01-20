@interface DESEncryptedData
- (BOOL)hasAlgorithm;
- (BOOL)hasEncryptedKey;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)data;
- (NSData)encryptedKey;
- (NSString)algorithm;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlgorithm:(id)a3;
- (void)setData:(id)a3;
- (void)setEncryptedKey:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation DESEncryptedData

- (void)setVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasEncryptedKey
{
  return self->_encryptedKey != 0;
}

- (BOOL)hasAlgorithm
{
  return self->_algorithm != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DESEncryptedData;
  v4 = [(DESEncryptedData *)&v8 description];
  v5 = [(DESEncryptedData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  data = self->_data;
  if (data) {
    [v3 setObject:data forKey:@"data"];
  }
  encryptedKey = self->_encryptedKey;
  if (encryptedKey) {
    [v3 setObject:encryptedKey forKey:@"encryptedKey"];
  }
  algorithm = self->_algorithm;
  if (algorithm) {
    [v3 setObject:algorithm forKey:@"algorithm"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DESEncryptedDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (!self->_data) {
    -[DESEncryptedData writeTo:]();
  }
  PBDataWriterWriteDataField();
  if (self->_encryptedKey) {
    PBDataWriterWriteDataField();
  }
  if (self->_algorithm) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[8] = self->_version;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  id v5 = v4;
  [v4 setData:self->_data];
  if (self->_encryptedKey) {
    objc_msgSend(v5, "setEncryptedKey:");
  }
  if (self->_algorithm) {
    objc_msgSend(v5, "setAlgorithm:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_version;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_data copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSData *)self->_encryptedKey copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  uint64_t v11 = [(NSString *)self->_algorithm copyWithZone:a3];
  v12 = (void *)v6[1];
  v6[1] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_version != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  data = self->_data;
  if ((unint64_t)data | *((void *)v4 + 2) && !-[NSData isEqual:](data, "isEqual:")) {
    goto LABEL_13;
  }
  encryptedKey = self->_encryptedKey;
  if ((unint64_t)encryptedKey | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](encryptedKey, "isEqual:")) {
      goto LABEL_13;
    }
  }
  algorithm = self->_algorithm;
  if ((unint64_t)algorithm | *((void *)v4 + 1)) {
    char v8 = -[NSString isEqual:](algorithm, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_data hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_encryptedKey hash];
  return v4 ^ v5 ^ [(NSString *)self->_algorithm hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[9])
  {
    self->_version = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[DESEncryptedData setData:](self, "setData:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[DESEncryptedData setEncryptedKey:](self, "setEncryptedKey:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[DESEncryptedData setAlgorithm:](self, "setAlgorithm:");
    uint64_t v4 = v5;
  }
}

- (int)version
{
  return self->_version;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSData)encryptedKey
{
  return self->_encryptedKey;
}

- (void)setEncryptedKey:(id)a3
{
}

- (NSString)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedKey, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_algorithm, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[DESEncryptedData writeTo:]", "DESEncryptedData.m", 133, "nil != self->_data");
}

@end