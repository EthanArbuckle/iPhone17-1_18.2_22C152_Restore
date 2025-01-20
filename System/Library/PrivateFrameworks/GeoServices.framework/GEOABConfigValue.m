@interface GEOABConfigValue
+ (BOOL)isValid:(id)a3;
- (BOOL)BOOLValue;
- (BOOL)hasBoolValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasIntValue;
- (BOOL)hasStringValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOABConfigValue)initWithDictionary:(id)a3;
- (GEOABConfigValue)initWithJSON:(id)a3;
- (NSString)stringValue;
- (PBUnknownFields)unknownFields;
- (double)doubleValue;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int64_t)intValue;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBoolValue:(BOOL)a3;
- (void)setDoubleValue:(double)a3;
- (void)setHasBoolValue:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasIntValue:(BOOL)a3;
- (void)setIntValue:(int64_t)a3;
- (void)setStringValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOABConfigValue

- (int64_t)intValue
{
  return self->_intValue;
}

- (void)setIntValue:(int64_t)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_intValue = a3;
}

- (void)setHasIntValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIntValue
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void)setDoubleValue:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDoubleValue
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (void)setBoolValue:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_BOOLValue = a3;
}

- (void)setHasBoolValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasBoolValue
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOABConfigValue;
  v4 = [(GEOABConfigValue *)&v8 description];
  v5 = [(GEOABConfigValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOABConfigValue _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 44);
    if ((v5 & 2) != 0)
    {
      v6 = [NSNumber numberWithLongLong:*(void *)(a1 + 24)];
      if (a2) {
        v7 = @"intValue";
      }
      else {
        v7 = @"int_value";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 44);
    }
    if (v5)
    {
      objc_super v8 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
      if (a2) {
        v9 = @"doubleValue";
      }
      else {
        v9 = @"double_value";
      }
      [v4 setObject:v8 forKey:v9];
    }
    v10 = [(id)a1 stringValue];
    if (v10)
    {
      if (a2) {
        v11 = @"stringValue";
      }
      else {
        v11 = @"string_value";
      }
      [v4 setObject:v10 forKey:v11];
    }

    if ((*(unsigned char *)(a1 + 44) & 4) != 0)
    {
      v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
      if (a2) {
        v13 = @"BOOLValue";
      }
      else {
        v13 = @"BOOL_value";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = *(void **)(a1 + 8);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __46__GEOABConfigValue__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
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
  return -[GEOABConfigValue _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOABConfigValue__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOABConfigValue)initWithDictionary:(id)a3
{
  return (GEOABConfigValue *)-[GEOABConfigValue _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"intValue";
      }
      else {
        v6 = @"int_value";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIntValue:", objc_msgSend(v7, "longLongValue"));
      }

      if (a3) {
        objc_super v8 = @"doubleValue";
      }
      else {
        objc_super v8 = @"double_value";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 doubleValue];
        objc_msgSend(a1, "setDoubleValue:");
      }

      if (a3) {
        id v10 = @"stringValue";
      }
      else {
        id v10 = @"string_value";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = (void *)[v11 copy];
        [a1 setStringValue:v12];
      }
      if (a3) {
        v13 = @"BOOLValue";
      }
      else {
        v13 = @"BOOL_value";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setBoolValue:", objc_msgSend(v14, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOABConfigValue)initWithJSON:(id)a3
{
  return (GEOABConfigValue *)-[GEOABConfigValue _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOABConfigValueIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOABConfigValueReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteSint64Field();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  v6 = a3;
  [(GEOABConfigValue *)self readAll:0];
  v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((void *)v6 + 3) = self->_intValue;
    v6[44] |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((void *)v6 + 2) = *(void *)&self->_doubleValue;
    v6[44] |= 1u;
  }
  if (self->_stringValue)
  {
    objc_msgSend(v6, "setStringValue:");
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    v4[40] = self->_BOOLValue;
    v4[44] |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(void *)(v5 + 24) = self->_intValue;
    *(unsigned char *)(v5 + 44) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(double *)(v5 + 16) = self->_doubleValue;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_stringValue copyWithZone:a3];
  v9 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v8;

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(unsigned char *)(v6 + 40) = self->_BOOLValue;
    *(unsigned char *)(v6 + 44) |= 4u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  [(GEOABConfigValue *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 44);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_intValue != *((void *)v4 + 3)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_doubleValue != *((double *)v4 + 2)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_17;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:")) {
      goto LABEL_17;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 44);
  }
  BOOL v8 = (v6 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) != 0)
    {
      if (self->_BOOLValue)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_17;
        }
      }
      else if (*((unsigned char *)v4 + 40))
      {
        goto LABEL_17;
      }
      BOOL v8 = 1;
      goto LABEL_18;
    }
LABEL_17:
    BOOL v8 = 0;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  [(GEOABConfigValue *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_intValue;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double doubleValue = self->_doubleValue;
  double v5 = -doubleValue;
  if (doubleValue >= 0.0) {
    double v5 = self->_doubleValue;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  NSUInteger v9 = [(NSString *)self->_stringValue hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v10 = 2654435761 * self->_BOOLValue;
  }
  else {
    uint64_t v10 = 0;
  }
  return v8 ^ v3 ^ v10 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v6 = a3;
  [v6 readAll:0];
  id v4 = (BOOL *)v6;
  char v5 = *((unsigned char *)v6 + 44);
  if ((v5 & 2) != 0)
  {
    self->_intValue = *((void *)v6 + 3);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v6 + 44);
  }
  if (v5)
  {
    self->_double doubleValue = *((double *)v6 + 2);
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v6 + 4))
  {
    -[GEOABConfigValue setStringValue:](self, "setStringValue:");
    id v4 = (BOOL *)v6;
  }
  if ((v4[44] & 4) != 0)
  {
    self->_BOOLValue = v4[40];
    *(unsigned char *)&self->_flags |= 4u;
  }
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
    [(GEOABConfigValue *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end