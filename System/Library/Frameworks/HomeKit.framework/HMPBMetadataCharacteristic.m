@interface HMPBMetadataCharacteristic
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation HMPBMetadataCharacteristic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidStr, 0);

  objc_storeStrong((id *)&self->_chrDescription, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uuidStr)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_chrDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuidStr hash];
  return [(NSString *)self->_chrDescription hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((uuidStr = self->_uuidStr, !((unint64_t)uuidStr | v4[2]))
     || -[NSString isEqual:](uuidStr, "isEqual:")))
  {
    chrDescription = self->_chrDescription;
    if ((unint64_t)chrDescription | v4[1]) {
      char v7 = -[NSString isEqual:](chrDescription, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuidStr copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_chrDescription copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return HMPBMetadataCharacteristicReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uuidStr = self->_uuidStr;
  if (uuidStr) {
    [v3 setObject:uuidStr forKey:@"uuidStr"];
  }
  chrDescription = self->_chrDescription;
  if (chrDescription) {
    [v4 setObject:chrDescription forKey:@"chrDescription"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMPBMetadataCharacteristic;
  id v4 = [(HMPBMetadataCharacteristic *)&v8 description];
  id v5 = [(HMPBMetadataCharacteristic *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end