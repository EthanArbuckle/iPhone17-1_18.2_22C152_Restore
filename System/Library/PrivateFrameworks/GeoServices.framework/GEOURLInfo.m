@interface GEOURLInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAlternativeMultipathTCPPort;
- (BOOL)hasSupportsMultipathTCP;
- (BOOL)hasUrl;
- (BOOL)hasUseAuthProxy;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsMultipathTCP;
- (BOOL)useAuthProxy;
- (GEOURLInfo)initWithDictionary:(id)a3;
- (GEOURLInfo)initWithJSON:(id)a3;
- (NSString)url;
- (NSURL)nsURL;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)alternativeMultipathTCPPort;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlternativeMultipathTCPPort:(unsigned int)a3;
- (void)setHasAlternativeMultipathTCPPort:(BOOL)a3;
- (void)setHasSupportsMultipathTCP:(BOOL)a3;
- (void)setHasUseAuthProxy:(BOOL)a3;
- (void)setSupportsMultipathTCP:(BOOL)a3;
- (void)setUrl:(id)a3;
- (void)setUseAuthProxy:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOURLInfo

- (NSURL)nsURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = [(GEOURLInfo *)self url];
  v4 = [v2 URLWithString:v3];

  return (NSURL *)v4;
}

- (NSString)url
{
  return self->_url;
}

- (BOOL)supportsMultipathTCP
{
  return (*(unsigned char *)&self->_flags & 2) != 0 && self->_supportsMultipathTCP;
}

- (BOOL)useAuthProxy
{
  return (*(unsigned char *)&self->_flags & 4) != 0 && self->_useAuthProxy;
}

- (BOOL)hasAlternativeMultipathTCPPort
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)alternativeMultipathTCPPort
{
  return self->_alternativeMultipathTCPPort;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  [(GEOURLInfo *)self readAll:1];
  [v4 readAll:1];
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](url, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0) {
      goto LABEL_24;
    }
    if (self->_useAuthProxy)
    {
      if (!*((unsigned char *)v4 + 29)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 29))
    {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) != 0)
    {
      if (self->_supportsMultipathTCP)
      {
        if (!*((unsigned char *)v4 + 28)) {
          goto LABEL_24;
        }
        goto LABEL_20;
      }
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_20;
      }
    }
LABEL_24:
    BOOL v6 = 0;
    goto LABEL_25;
  }
  if ((*((unsigned char *)v4 + 32) & 2) != 0) {
    goto LABEL_24;
  }
LABEL_20:
  BOOL v6 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_alternativeMultipathTCPPort != *((_DWORD *)v4 + 6)) {
      goto LABEL_24;
    }
    BOOL v6 = 1;
  }
LABEL_25:

  return v6;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (void)setUrl:(id)a3
{
}

- (void)setUseAuthProxy:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_useAuthProxy = a3;
}

- (void)setHasUseAuthProxy:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasUseAuthProxy
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)setSupportsMultipathTCP:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_supportsMultipathTCP = a3;
}

- (void)setHasSupportsMultipathTCP:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSupportsMultipathTCP
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)setAlternativeMultipathTCPPort:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_alternativeMultipathTCPPort = a3;
}

- (void)setHasAlternativeMultipathTCPPort:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOURLInfo;
  id v4 = [(GEOURLInfo *)&v8 description];
  v5 = [(GEOURLInfo *)self dictionaryRepresentation];
  BOOL v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOURLInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_12;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 url];
  if (v5) {
    [v4 setObject:v5 forKey:@"url"];
  }

  char v6 = *(unsigned char *)(a1 + 32);
  if ((v6 & 4) != 0)
  {
    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 29)];
    [v4 setObject:v15 forKey:@"useAuthProxy"];

    char v6 = *(unsigned char *)(a1 + 32);
    if ((v6 & 2) == 0)
    {
LABEL_6:
      if ((v6 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)(a1 + 32) & 2) == 0)
  {
    goto LABEL_6;
  }
  v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 28)];
  [v4 setObject:v16 forKey:@"supportsMultipathTCP"];

  if (*(unsigned char *)(a1 + 32))
  {
LABEL_7:
    v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    [v4 setObject:v7 forKey:@"alternativeMultipathTCPPort"];
  }
LABEL_8:
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    v9 = [v8 dictionaryRepresentation];
    v10 = v9;
    if (a2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __40__GEOURLInfo__dictionaryRepresentation___block_invoke;
      v17[3] = &unk_1E53D8860;
      id v12 = v11;
      id v18 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v17];
      id v13 = v12;

      v10 = v13;
    }
    [v4 setObject:v10 forKey:@"Unknown Fields"];
  }
LABEL_12:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOURLInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __40__GEOURLInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOURLInfo)initWithDictionary:(id)a3
{
  return (GEOURLInfo *)-[GEOURLInfo _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v4 = [v3 objectForKeyedSubscript:@"url"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = (void *)[v4 copy];
        [a1 setUrl:v5];
      }
      char v6 = [v3 objectForKeyedSubscript:@"useAuthProxy"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setUseAuthProxy:", objc_msgSend(v6, "BOOLValue"));
      }

      v7 = [v3 objectForKeyedSubscript:@"supportsMultipathTCP"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSupportsMultipathTCP:", objc_msgSend(v7, "BOOLValue"));
      }

      objc_super v8 = [v3 objectForKeyedSubscript:@"alternativeMultipathTCPPort"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAlternativeMultipathTCPPort:", objc_msgSend(v8, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOURLInfo)initWithJSON:(id)a3
{
  return (GEOURLInfo *)-[GEOURLInfo _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOURLInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOURLInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_url)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_5:
      if ((flags & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_6:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_7:
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOURLInfo *)self readAll:0];
  if (self->_url) {
    objc_msgSend(v5, "setUrl:");
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((unsigned char *)v5 + 29) = self->_useAuthProxy;
    *((unsigned char *)v5 + 32) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_5:
      if ((flags & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)v5 + 28) = self->_supportsMultipathTCP;
  *((unsigned char *)v5 + 32) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_6:
    *((_DWORD *)v5 + 6) = self->_alternativeMultipathTCPPort;
    *((unsigned char *)v5 + 32) |= 1u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_url copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v5 + 28) = self->_supportsMultipathTCP;
    *(unsigned char *)(v5 + 32) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(unsigned char *)(v5 + 29) = self->_useAuthProxy;
  *(unsigned char *)(v5 + 32) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_alternativeMultipathTCPPort;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
LABEL_5:
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (unint64_t)hash
{
  [(GEOURLInfo *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_url hash];
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_useAuthProxy;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_supportsMultipathTCP;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_alternativeMultipathTCPPort;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  if (*((void *)v5 + 2)) {
    -[GEOURLInfo setUrl:](self, "setUrl:");
  }
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 4) != 0)
  {
    self->_useAuthProxy = *((unsigned char *)v5 + 29);
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 32);
    if ((v4 & 2) == 0)
    {
LABEL_5:
      if ((v4 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v5 + 32) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_supportsMultipathTCP = *((unsigned char *)v5 + 28);
  *(unsigned char *)&self->_flags |= 2u;
  if (*((unsigned char *)v5 + 32))
  {
LABEL_6:
    self->_alternativeMultipathTCPPort = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_7:
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOURLInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end