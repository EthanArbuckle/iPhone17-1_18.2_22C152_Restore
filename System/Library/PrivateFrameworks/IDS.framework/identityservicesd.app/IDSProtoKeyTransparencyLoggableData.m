@interface IDSProtoKeyTransparencyLoggableData
+ (Class)applicationPublicIdentityType;
- (BOOL)hasKtVersion;
- (BOOL)hasNgmPublicIdentity;
- (BOOL)hasNgmVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)ngmPublicIdentity;
- (NSMutableArray)applicationPublicIdentitys;
- (id)applicationPublicIdentityAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)applicationPublicIdentitysCount;
- (unint64_t)hash;
- (unsigned)ktVersion;
- (unsigned)ngmVersion;
- (void)addApplicationPublicIdentity:(id)a3;
- (void)clearApplicationPublicIdentitys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicationPublicIdentitys:(id)a3;
- (void)setHasKtVersion:(BOOL)a3;
- (void)setHasNgmVersion:(BOOL)a3;
- (void)setKtVersion:(unsigned int)a3;
- (void)setNgmPublicIdentity:(id)a3;
- (void)setNgmVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSProtoKeyTransparencyLoggableData

- (BOOL)hasNgmPublicIdentity
{
  return self->_ngmPublicIdentity != 0;
}

- (void)setNgmVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_ngmVersion = a3;
}

- (void)setHasNgmVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNgmVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setKtVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ktVersion = a3;
}

- (void)setHasKtVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKtVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearApplicationPublicIdentitys
{
}

- (void)addApplicationPublicIdentity:(id)a3
{
  id v4 = a3;
  applicationPublicIdentitys = self->_applicationPublicIdentitys;
  id v8 = v4;
  if (!applicationPublicIdentitys)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_applicationPublicIdentitys;
    self->_applicationPublicIdentitys = v6;

    id v4 = v8;
    applicationPublicIdentitys = self->_applicationPublicIdentitys;
  }
  [(NSMutableArray *)applicationPublicIdentitys addObject:v4];
}

- (unint64_t)applicationPublicIdentitysCount
{
  return (unint64_t)[(NSMutableArray *)self->_applicationPublicIdentitys count];
}

- (id)applicationPublicIdentityAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_applicationPublicIdentitys objectAtIndex:a3];
}

+ (Class)applicationPublicIdentityType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)IDSProtoKeyTransparencyLoggableData;
  char v3 = [(IDSProtoKeyTransparencyLoggableData *)&v7 description];
  id v4 = [(IDSProtoKeyTransparencyLoggableData *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  ngmPublicIdentity = self->_ngmPublicIdentity;
  if (ngmPublicIdentity) {
    [v3 setObject:ngmPublicIdentity forKey:@"ngm_public_identity"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_ngmVersion];
    [v4 setObject:v7 forKey:@"ngm_version"];

    char has = (char)self->_has;
  }
  if (has)
  {
    id v8 = +[NSNumber numberWithUnsignedInt:self->_ktVersion];
    [v4 setObject:v8 forKey:@"kt_version"];
  }
  if ([(NSMutableArray *)self->_applicationPublicIdentitys count])
  {
    id v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_applicationPublicIdentitys, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = self->_applicationPublicIdentitys;
    id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v9 addObject:v15];
        }
        id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v4 setObject:v9 forKey:@"application_public_identity"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return IDSProtoKeyTransparencyLoggableDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_ngmPublicIdentity) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_applicationPublicIdentitys;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_ngmPublicIdentity)
  {
    objc_msgSend(v4, "setNgmPublicIdentity:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_ngmVersion;
    *((unsigned char *)v4 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_ktVersion;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  if ([(IDSProtoKeyTransparencyLoggableData *)self applicationPublicIdentitysCount])
  {
    [v10 clearApplicationPublicIdentitys];
    unint64_t v6 = [(IDSProtoKeyTransparencyLoggableData *)self applicationPublicIdentitysCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(IDSProtoKeyTransparencyLoggableData *)self applicationPublicIdentityAtIndex:i];
        [v10 addApplicationPublicIdentity:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_ngmPublicIdentity copyWithZone:a3];
  unint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_ngmVersion;
    *((unsigned char *)v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v5 + 4) = self->_ktVersion;
    *((unsigned char *)v5 + 36) |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = self->_applicationPublicIdentitys;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [v5 addApplicationPublicIdentity:v14];
      }
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  ngmPublicIdentity = self->_ngmPublicIdentity;
  if ((unint64_t)ngmPublicIdentity | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](ngmPublicIdentity, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_ngmVersion != *((_DWORD *)v4 + 8)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
LABEL_16:
    unsigned __int8 v7 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_ktVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_16;
  }
  applicationPublicIdentitys = self->_applicationPublicIdentitys;
  if ((unint64_t)applicationPublicIdentitys | *((void *)v4 + 1)) {
    unsigned __int8 v7 = -[NSMutableArray isEqual:](applicationPublicIdentitys, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_ngmPublicIdentity hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_ngmVersion;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ (unint64_t)[(NSMutableArray *)self->_applicationPublicIdentitys hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_ktVersion;
  return v4 ^ v3 ^ v5 ^ (unint64_t)[(NSMutableArray *)self->_applicationPublicIdentitys hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[IDSProtoKeyTransparencyLoggableData setNgmPublicIdentity:](self, "setNgmPublicIdentity:");
  }
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_ngmVersion = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 36);
  }
  if (v5)
  {
    self->_ktVersion = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 1);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[IDSProtoKeyTransparencyLoggableData addApplicationPublicIdentity:](self, "addApplicationPublicIdentity:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSData)ngmPublicIdentity
{
  return self->_ngmPublicIdentity;
}

- (void)setNgmPublicIdentity:(id)a3
{
}

- (unsigned)ngmVersion
{
  return self->_ngmVersion;
}

- (unsigned)ktVersion
{
  return self->_ktVersion;
}

- (NSMutableArray)applicationPublicIdentitys
{
  return self->_applicationPublicIdentitys;
}

- (void)setApplicationPublicIdentitys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ngmPublicIdentity, 0);

  objc_storeStrong((id *)&self->_applicationPublicIdentitys, 0);
}

@end