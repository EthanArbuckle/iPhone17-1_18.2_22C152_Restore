@interface GEOVLFInitializationFailureDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)hasArkitErrorCode;
- (BOOL)hasArkitUnderlyingErrorCode;
- (BOOL)hasArkitUnderlyingErrorDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLFInitializationFailureDetails)initWithDictionary:(id)a3;
- (GEOVLFInitializationFailureDetails)initWithJSON:(id)a3;
- (NSString)arkitUnderlyingErrorDomain;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)arkitErrorCode;
- (int)arkitUnderlyingErrorCode;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArkitErrorCode:(int)a3;
- (void)setArkitUnderlyingErrorCode:(int)a3;
- (void)setArkitUnderlyingErrorDomain:(id)a3;
- (void)setHasArkitErrorCode:(BOOL)a3;
- (void)setHasArkitUnderlyingErrorCode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFInitializationFailureDetails

- (int)arkitErrorCode
{
  return self->_arkitErrorCode;
}

- (void)setArkitErrorCode:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_arkitErrorCode = a3;
}

- (void)setHasArkitErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasArkitErrorCode
{
  return *(unsigned char *)&self->_flags & 1;
}

- (int)arkitUnderlyingErrorCode
{
  return self->_arkitUnderlyingErrorCode;
}

- (void)setArkitUnderlyingErrorCode:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_arkitUnderlyingErrorCode = a3;
}

- (void)setHasArkitUnderlyingErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasArkitUnderlyingErrorCode
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)hasArkitUnderlyingErrorDomain
{
  return self->_arkitUnderlyingErrorDomain != 0;
}

- (NSString)arkitUnderlyingErrorDomain
{
  return self->_arkitUnderlyingErrorDomain;
}

- (void)setArkitUnderlyingErrorDomain:(id)a3
{
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLFInitializationFailureDetails;
  v4 = [(GEOVLFInitializationFailureDetails *)&v8 description];
  v5 = [(GEOVLFInitializationFailureDetails *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFInitializationFailureDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 24);
    if (v5)
    {
      v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 16)];
      if (a2) {
        v7 = @"arkitErrorCode";
      }
      else {
        v7 = @"arkit_error_code";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if ((v5 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 20)];
      if (a2) {
        v9 = @"arkitUnderlyingErrorCode";
      }
      else {
        v9 = @"arkit_underlying_error_code";
      }
      [v4 setObject:v8 forKey:v9];
    }
    v10 = [(id)a1 arkitUnderlyingErrorDomain];
    if (v10)
    {
      if (a2) {
        v11 = @"arkitUnderlyingErrorDomain";
      }
      else {
        v11 = @"arkit_underlying_error_domain";
      }
      [v4 setObject:v10 forKey:v11];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFInitializationFailureDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFInitializationFailureDetails)initWithDictionary:(id)a3
{
  return (GEOVLFInitializationFailureDetails *)-[GEOVLFInitializationFailureDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"arkitErrorCode";
      }
      else {
        v6 = @"arkit_error_code";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setArkitErrorCode:", objc_msgSend(v7, "intValue"));
      }

      if (a3) {
        objc_super v8 = @"arkitUnderlyingErrorCode";
      }
      else {
        objc_super v8 = @"arkit_underlying_error_code";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setArkitUnderlyingErrorCode:", objc_msgSend(v9, "intValue"));
      }

      if (a3) {
        v10 = @"arkitUnderlyingErrorDomain";
      }
      else {
        v10 = @"arkit_underlying_error_domain";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = (void *)[v11 copy];
        [a1 setArkitUnderlyingErrorDomain:v12];
      }
    }
  }

  return a1;
}

- (GEOVLFInitializationFailureDetails)initWithJSON:(id)a3
{
  return (GEOVLFInitializationFailureDetails *)-[GEOVLFInitializationFailureDetails _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFInitializationFailureDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFInitializationFailureDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_arkitUnderlyingErrorDomain)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEOVLFInitializationFailureDetails *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v6 + 4) = self->_arkitErrorCode;
    *((unsigned char *)v6 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 5) = self->_arkitUnderlyingErrorCode;
    *((unsigned char *)v6 + 24) |= 2u;
  }
  if (self->_arkitUnderlyingErrorDomain)
  {
    objc_msgSend(v6, "setArkitUnderlyingErrorDomain:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 16) = self->_arkitErrorCode;
    *(unsigned char *)(v5 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_arkitUnderlyingErrorCode;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_arkitUnderlyingErrorDomain copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOVLFInitializationFailureDetails *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_arkitErrorCode != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_arkitUnderlyingErrorCode != *((_DWORD *)v4 + 5)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_14;
  }
  arkitUnderlyingErrorDomain = self->_arkitUnderlyingErrorDomain;
  if ((unint64_t)arkitUnderlyingErrorDomain | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](arkitUnderlyingErrorDomain, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  [(GEOVLFInitializationFailureDetails *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_arkitErrorCode;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3 ^ [(NSString *)self->_arkitUnderlyingErrorDomain hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_arkitUnderlyingErrorCode;
  return v4 ^ v3 ^ [(NSString *)self->_arkitUnderlyingErrorDomain hash];
}

- (void)mergeFrom:(id)a3
{
  char v6 = (int *)a3;
  [v6 readAll:0];
  uint64_t v4 = v6;
  char v5 = *((unsigned char *)v6 + 24);
  if (v5)
  {
    self->_arkitErrorCode = v6[4];
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v6 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_arkitUnderlyingErrorCode = v6[5];
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (*((void *)v6 + 1))
  {
    -[GEOVLFInitializationFailureDetails setArkitUnderlyingErrorDomain:](self, "setArkitUnderlyingErrorDomain:");
    uint64_t v4 = v6;
  }
}

- (void).cxx_destruct
{
}

@end