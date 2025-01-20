@interface GEOCacheMissLoadError
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCount;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCacheMissLoadError)initWithDictionary:(id)a3;
- (GEOCacheMissLoadError)initWithJSON:(id)a3;
- (NSString)errorDomain;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)errorCode;
- (unint64_t)hash;
- (unsigned)count;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCount:(unsigned int)a3;
- (void)setErrorCode:(int)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCacheMissLoadError

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (int)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCacheMissLoadError;
  v4 = [(GEOCacheMissLoadError *)&v8 description];
  v5 = [(GEOCacheMissLoadError *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCacheMissLoadError _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 errorDomain];
    if (v5)
    {
      if (a2) {
        v6 = @"errorDomain";
      }
      else {
        v6 = @"error_domain";
      }
      [v4 setObject:v5 forKey:v6];
    }

    char v7 = *(unsigned char *)(a1 + 24);
    if ((v7 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 20)];
      if (a2) {
        v9 = @"errorCode";
      }
      else {
        v9 = @"error_code";
      }
      [v4 setObject:v8 forKey:v9];

      char v7 = *(unsigned char *)(a1 + 24);
    }
    if (v7)
    {
      v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
      [v4 setObject:v10 forKey:@"count"];
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
  return -[GEOCacheMissLoadError _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCacheMissLoadError)initWithDictionary:(id)a3
{
  return (GEOCacheMissLoadError *)-[GEOCacheMissLoadError _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"errorDomain";
      }
      else {
        v6 = @"error_domain";
      }
      char v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setErrorDomain:v8];
      }
      if (a3) {
        v9 = @"errorCode";
      }
      else {
        v9 = @"error_code";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setErrorCode:", objc_msgSend(v10, "intValue"));
      }

      v11 = [v5 objectForKeyedSubscript:@"count"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCount:", objc_msgSend(v11, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOCacheMissLoadError)initWithJSON:(id)a3
{
  return (GEOCacheMissLoadError *)-[GEOCacheMissLoadError _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCacheMissLoadErrorIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCacheMissLoadErrorReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_errorDomain)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOCacheMissLoadError *)self readAll:0];
  if (self->_errorDomain) {
    objc_msgSend(v5, "setErrorDomain:");
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v5 + 5) = self->_errorCode;
    *((unsigned char *)v5 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v5 + 4) = self->_count;
    *((unsigned char *)v5 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_errorDomain copyWithZone:a3];
  char v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_errorCode;
    *(unsigned char *)(v5 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 16) = self->_count;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOCacheMissLoadError *)self readAll:1];
  [v4 readAll:1];
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](errorDomain, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_errorCode != *((_DWORD *)v4 + 5)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_count != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  [(GEOCacheMissLoadError *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_errorDomain hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_errorCode;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_count;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  if (*((void *)v5 + 1)) {
    -[GEOCacheMissLoadError setErrorDomain:](self, "setErrorDomain:");
  }
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 2) != 0)
  {
    self->_errorCode = *((_DWORD *)v5 + 5);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 24);
  }
  if (v4)
  {
    self->_count = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
}

@end