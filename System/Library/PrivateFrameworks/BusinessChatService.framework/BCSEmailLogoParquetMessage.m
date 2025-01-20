@interface BCSEmailLogoParquetMessage
- (BOOL)hasBusinessId;
- (BOOL)hasLogo;
- (BOOL)hasLogoFormat;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)logo;
- (NSString)businessId;
- (NSString)logoFormat;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBusinessId:(id)a3;
- (void)setLogo:(id)a3;
- (void)setLogoFormat:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCSEmailLogoParquetMessage

- (BOOL)hasBusinessId
{
  return self->_businessId != 0;
}

- (BOOL)hasLogoFormat
{
  return self->_logoFormat != 0;
}

- (BOOL)hasLogo
{
  return self->_logo != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BCSEmailLogoParquetMessage;
  v4 = [(BCSEmailLogoParquetMessage *)&v8 description];
  v5 = [(BCSEmailLogoParquetMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  businessId = self->_businessId;
  if (businessId) {
    [v3 setObject:businessId forKey:@"business_id"];
  }
  logoFormat = self->_logoFormat;
  if (logoFormat) {
    [v4 setObject:logoFormat forKey:@"logo_format"];
  }
  logo = self->_logo;
  if (logo) {
    [v4 setObject:logo forKey:@"logo"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x263F62298];
  v5 = (int *)MEMORY[0x263F62288];
  v6 = (int *)MEMORY[0x263F62270];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x263F62298]) < *(void *)((char *)a3 + (int)*MEMORY[0x263F62288]))
  {
    objc_super v8 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*((unsigned char *)a3 + *v6)) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        if (v10++ >= 9)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
      unint64_t v18 = v11 >> 3;
      if ((v11 >> 3) == 3) {
        break;
      }
      if (v18 == 2)
      {
        PBReaderReadString();
        v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = 24;
        goto LABEL_24;
      }
      if (v18 == 1)
      {
        PBReaderReadString();
        v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = 8;
LABEL_24:
        v21 = *(Class *)((char *)&self->super.super.isa + v20);
        *(Class *)((char *)&self->super.super.isa + v20) = v19;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
    }
    PBReaderReadData();
    v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = 16;
    goto LABEL_24;
  }
  return *((unsigned char *)a3 + *v6) == 0;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_businessId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_logoFormat)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_logo)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_businessId)
  {
    objc_msgSend(v4, "setBusinessId:");
    id v4 = v5;
  }
  if (self->_logoFormat)
  {
    objc_msgSend(v5, "setLogoFormat:");
    id v4 = v5;
  }
  if (self->_logo)
  {
    objc_msgSend(v5, "setLogo:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_businessId copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_logoFormat copyWithZone:a3];
  char v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSData *)self->_logo copyWithZone:a3];
  unint64_t v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((businessId = self->_businessId, !((unint64_t)businessId | v4[1]))
     || -[NSString isEqual:](businessId, "isEqual:"))
    && ((logoFormat = self->_logoFormat, !((unint64_t)logoFormat | v4[3]))
     || -[NSString isEqual:](logoFormat, "isEqual:")))
  {
    logo = self->_logo;
    if ((unint64_t)logo | v4[2]) {
      char v8 = -[NSData isEqual:](logo, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_businessId hash];
  NSUInteger v4 = [(NSString *)self->_logoFormat hash] ^ v3;
  return v4 ^ [(NSData *)self->_logo hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[1]) {
    -[BCSEmailLogoParquetMessage setBusinessId:](self, "setBusinessId:");
  }
  if (v4[3]) {
    -[BCSEmailLogoParquetMessage setLogoFormat:](self, "setLogoFormat:");
  }
  if (v4[2]) {
    -[BCSEmailLogoParquetMessage setLogo:](self, "setLogo:");
  }
}

- (NSString)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(id)a3
{
}

- (NSString)logoFormat
{
  return self->_logoFormat;
}

- (void)setLogoFormat:(id)a3
{
}

- (NSData)logo
{
  return self->_logo;
}

- (void)setLogo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoFormat, 0);
  objc_storeStrong((id *)&self->_logo, 0);

  objc_storeStrong((id *)&self->_businessId, 0);
}

@end