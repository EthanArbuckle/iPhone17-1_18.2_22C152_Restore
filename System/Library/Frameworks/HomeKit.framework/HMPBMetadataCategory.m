@interface HMPBMetadataCategory
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation HMPBMetadataCategory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidStr, 0);

  objc_storeStrong((id *)&self->_catDescription, 0);
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
  if (self->_catDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuidStr hash];
  NSUInteger v4 = [(NSString *)self->_catDescription hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_identifier;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  uuidStr = self->_uuidStr;
  if ((unint64_t)uuidStr | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](uuidStr, "isEqual:")) {
      goto LABEL_10;
    }
  }
  catDescription = self->_catDescription;
  if ((unint64_t)catDescription | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](catDescription, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_identifier == *((_DWORD *)v4 + 4))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuidStr copyWithZone:a3];
  BOOL v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_catDescription copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_identifier;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)readFrom:(id)a3
{
  return HMPBMetadataCategoryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uuidStr = self->_uuidStr;
  if (uuidStr) {
    [v3 setObject:uuidStr forKey:@"uuidStr"];
  }
  catDescription = self->_catDescription;
  if (catDescription) {
    [v4 setObject:catDescription forKey:@"catDescription"];
  }
  if (*(unsigned char *)&self->_has)
  {
    BOOL v7 = [NSNumber numberWithInt:self->_identifier];
    [v4 setObject:v7 forKey:@"identifier"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMPBMetadataCategory;
  id v4 = [(HMPBMetadataCategory *)&v8 description];
  uint64_t v5 = [(HMPBMetadataCategory *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end