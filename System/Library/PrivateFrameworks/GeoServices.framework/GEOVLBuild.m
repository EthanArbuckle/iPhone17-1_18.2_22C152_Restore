@interface GEOVLBuild
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDataFormatVersion;
- (BOOL)hasDataOutputVersion;
- (BOOL)hasIdentifier;
- (BOOL)hasRoutingKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLBuild)initWithDictionary:(id)a3;
- (GEOVLBuild)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)identifier;
- (unsigned)dataFormatVersion;
- (unsigned)dataOutputVersion;
- (unsigned)routingKey;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDataFormatVersion:(unsigned int)a3;
- (void)setDataOutputVersion:(unsigned int)a3;
- (void)setHasDataFormatVersion:(BOOL)a3;
- (void)setHasDataOutputVersion:(BOOL)a3;
- (void)setHasIdentifier:(BOOL)a3;
- (void)setHasRoutingKey:(BOOL)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setRoutingKey:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLBuild

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasIdentifier
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)dataOutputVersion
{
  return self->_dataOutputVersion;
}

- (void)setDataOutputVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_dataOutputVersion = a3;
}

- (void)setHasDataOutputVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasDataOutputVersion
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)dataFormatVersion
{
  return self->_dataFormatVersion;
}

- (void)setDataFormatVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_dataFormatVersion = a3;
}

- (void)setHasDataFormatVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDataFormatVersion
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)routingKey
{
  return self->_routingKey;
}

- (void)setRoutingKey:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_routingKey = a3;
}

- (void)setHasRoutingKey:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasRoutingKey
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLBuild;
  v4 = [(GEOVLBuild *)&v8 description];
  v5 = [(GEOVLBuild *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLBuild _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_20;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 28);
  if (v5)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
    [v4 setObject:v6 forKey:@"id"];

    char v5 = *(unsigned char *)(a1 + 28);
  }
  if ((v5 & 4) == 0)
  {
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
    if (a2) {
      v10 = @"dataFormatVersion";
    }
    else {
      v10 = @"data_format_version";
    }
    [v4 setObject:v9 forKey:v10];

    if ((*(unsigned char *)(a1 + 28) & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
  if (a2) {
    objc_super v8 = @"dataOutputVersion";
  }
  else {
    objc_super v8 = @"data_output_version";
  }
  [v4 setObject:v7 forKey:v8];

  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 2) != 0) {
    goto LABEL_12;
  }
LABEL_6:
  if ((v5 & 8) != 0)
  {
LABEL_16:
    v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    if (a2) {
      v12 = @"routingKey";
    }
    else {
      v12 = @"routing_key";
    }
    [v4 setObject:v11 forKey:v12];
  }
LABEL_20:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLBuild _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLBuild)initWithDictionary:(id)a3
{
  return (GEOVLBuild *)-[GEOVLBuild _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"id"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIdentifier:", objc_msgSend(v6, "unsignedLongLongValue"));
      }

      if (a3) {
        v7 = @"dataOutputVersion";
      }
      else {
        v7 = @"data_output_version";
      }
      objc_super v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDataOutputVersion:", objc_msgSend(v8, "unsignedIntValue"));
      }

      if (a3) {
        v9 = @"dataFormatVersion";
      }
      else {
        v9 = @"data_format_version";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDataFormatVersion:", objc_msgSend(v10, "unsignedIntValue"));
      }

      if (a3) {
        v11 = @"routingKey";
      }
      else {
        v11 = @"routing_key";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRoutingKey:", objc_msgSend(v12, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOVLBuild)initWithJSON:(id)a3
{
  return (GEOVLBuild *)-[GEOVLBuild _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLBuildIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLBuildReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteUint64Field();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOVLBuild *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[1] = self->_identifier;
    *((unsigned char *)v5 + 28) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 5) = self->_dataOutputVersion;
  *((unsigned char *)v5 + 28) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  *((_DWORD *)v5 + 4) = self->_dataFormatVersion;
  *((unsigned char *)v5 + 28) |= 2u;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 6) = self->_routingKey;
    *((unsigned char *)v5 + 28) |= 8u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((void *)result + 1) = self->_identifier;
    *((unsigned char *)result + 28) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_dataOutputVersion;
  *((unsigned char *)result + 28) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 4) = self->_dataFormatVersion;
  *((unsigned char *)result + 28) |= 2u;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 6) = self->_routingKey;
  *((unsigned char *)result + 28) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEOVLBuild *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_identifier != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_dataOutputVersion != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_dataFormatVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 8) == 0;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 8) == 0 || self->_routingKey != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  [(GEOVLBuild *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v3 = 2654435761u * self->_identifier;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_dataOutputVersion;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_dataFormatVersion;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_routingKey;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 28);
  if (v4)
  {
    self->_identifier = *((void *)v5 + 1);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 28);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v5 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_dataOutputVersion = *((_DWORD *)v5 + 5);
  *(unsigned char *)&self->_flags |= 4u;
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_dataFormatVersion = *((_DWORD *)v5 + 4);
  *(unsigned char *)&self->_flags |= 2u;
  if ((*((unsigned char *)v5 + 28) & 8) != 0)
  {
LABEL_5:
    self->_routingKey = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_flags |= 8u;
  }
LABEL_6:
}

@end