@interface GEOWiFiESSMatch
+ (BOOL)isValid:(id)a3;
- (BOOL)hasEss;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOWiFiESS)ess;
- (GEOWiFiESSMatch)initWithDictionary:(id)a3;
- (GEOWiFiESSMatch)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEss:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWiFiESSMatch

- (int)status
{
  if (*(unsigned char *)&self->_flags) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E1FC8[a3];
  }

  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"OK"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NOT_FOUND"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasEss
{
  return self->_ess != 0;
}

- (GEOWiFiESS)ess
{
  return self->_ess;
}

- (void)setEss:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiESSMatch;
  int v4 = [(GEOWiFiESSMatch *)&v8 description];
  v5 = [(GEOWiFiESSMatch *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiESSMatch _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 20))
    {
      uint64_t v5 = *(int *)(a1 + 16);
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53E1FC8[v5];
      }
      [v4 setObject:v6 forKey:@"status"];
    }
    v7 = [(id)a1 ess];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"ess"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWiFiESSMatch _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOWiFiESSMatch)initWithDictionary:(id)a3
{
  return (GEOWiFiESSMatch *)-[GEOWiFiESSMatch _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_21;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_21;
  }
  v6 = [v5 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"OK"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"NOT_FOUND"])
    {
      uint64_t v8 = 2;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_14:
    [a1 setStatus:v8];
  }

  v9 = [v5 objectForKeyedSubscript:@"ess"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [GEOWiFiESS alloc];
    if (a3) {
      uint64_t v11 = [(GEOWiFiESS *)v10 initWithJSON:v9];
    }
    else {
      uint64_t v11 = [(GEOWiFiESS *)v10 initWithDictionary:v9];
    }
    v12 = (void *)v11;
    [a1 setEss:v11];
  }
LABEL_21:

  return a1;
}

- (GEOWiFiESSMatch)initWithJSON:(id)a3
{
  return (GEOWiFiESSMatch *)-[GEOWiFiESSMatch _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiESSMatchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiESSMatchReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_ess)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOWiFiESS *)self->_ess hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOWiFiESSMatch *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 4) = self->_status;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  if (self->_ess)
  {
    objc_msgSend(v5, "setEss:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_status;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  id v7 = [(GEOWiFiESS *)self->_ess copyWithZone:a3];
  uint64_t v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEOWiFiESSMatch *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_status != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  ess = self->_ess;
  if ((unint64_t)ess | *((void *)v4 + 1)) {
    char v6 = -[GEOWiFiESS isEqual:](ess, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEOWiFiESSMatch *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_status;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(GEOWiFiESS *)self->_ess hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v7 = (int *)a3;
  [v7 readAll:0];
  id v4 = v7;
  if (v7[5])
  {
    self->_status = v7[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
  ess = self->_ess;
  uint64_t v6 = *((void *)v7 + 1);
  if (ess)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOWiFiESS mergeFrom:](ess, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOWiFiESSMatch setEss:](self, "setEss:");
  }
  id v4 = v7;
LABEL_9:
}

- (void).cxx_destruct
{
}

@end