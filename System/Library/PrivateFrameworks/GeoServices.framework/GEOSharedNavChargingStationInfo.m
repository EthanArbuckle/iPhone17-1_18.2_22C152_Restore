@interface GEOSharedNavChargingStationInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasChargingTime;
- (BOOL)hasMuid;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSharedNavChargingStationInfo)initWithDictionary:(id)a3;
- (GEOSharedNavChargingStationInfo)initWithJSON:(id)a3;
- (NSString)name;
- (PBUnknownFields)unknownFields;
- (double)chargingTime;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChargingTime:(double)a3;
- (void)setHasChargingTime:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSharedNavChargingStationInfo

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasMuid
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (double)chargingTime
{
  return self->_chargingTime;
}

- (void)setChargingTime:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_chargingTime = a3;
}

- (void)setHasChargingTime:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasChargingTime
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSharedNavChargingStationInfo;
  v4 = [(GEOSharedNavChargingStationInfo *)&v8 description];
  v5 = [(GEOSharedNavChargingStationInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSharedNavChargingStationInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 40) & 2) != 0)
    {
      v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      [v4 setObject:v5 forKey:@"muid"];
    }
    v6 = [(id)a1 name];
    if (v6) {
      [v4 setObject:v6 forKey:@"name"];
    }

    if (*(unsigned char *)(a1 + 40))
    {
      v7 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
      if (a2) {
        objc_super v8 = @"chargingTime";
      }
      else {
        objc_super v8 = @"charging_time";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = [v9 dictionaryRepresentation];
      v11 = v10;
      if (a2)
      {
        v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __61__GEOSharedNavChargingStationInfo__dictionaryRepresentation___block_invoke;
        v16[3] = &unk_1E53D8860;
        id v13 = v12;
        id v17 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v16];
        id v14 = v13;

        v11 = v14;
      }
      [v4 setObject:v11 forKey:@"Unknown Fields"];
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
  return -[GEOSharedNavChargingStationInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __61__GEOSharedNavChargingStationInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSharedNavChargingStationInfo)initWithDictionary:(id)a3
{
  return (GEOSharedNavChargingStationInfo *)-[GEOSharedNavChargingStationInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"muid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMuid:", objc_msgSend(v6, "unsignedLongLongValue"));
      }

      v7 = [v5 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setName:v8];
      }
      if (a3) {
        v9 = @"chargingTime";
      }
      else {
        v9 = @"charging_time";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v10 doubleValue];
        objc_msgSend(a1, "setChargingTime:");
      }
    }
  }

  return a1;
}

- (GEOSharedNavChargingStationInfo)initWithJSON:(id)a3
{
  return (GEOSharedNavChargingStationInfo *)-[GEOSharedNavChargingStationInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSharedNavChargingStationInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSharedNavChargingStationInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteDoubleField();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOSharedNavChargingStationInfo *)self readAll:0];
  id v4 = v5;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v5[3] = self->_muid;
    *((unsigned char *)v5 + 40) |= 2u;
  }
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    v4[2] = *(void *)&self->_chargingTime;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(void *)(v5 + 24) = self->_muid;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_name copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v6 + 16) = self->_chargingTime;
    *(unsigned char *)(v6 + 40) |= 1u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOSharedNavChargingStationInfo *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 40);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_muid != *((void *)v4 + 3)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_14;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
    {
LABEL_14:
      BOOL v8 = 0;
      goto LABEL_15;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 40);
  }
  BOOL v8 = (v6 & 1) == 0;
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_chargingTime != *((double *)v4 + 2)) {
      goto LABEL_14;
    }
    BOOL v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  [(GEOSharedNavChargingStationInfo *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash];
  if (*(unsigned char *)&self->_flags)
  {
    double chargingTime = self->_chargingTime;
    double v7 = -chargingTime;
    if (chargingTime >= 0.0) {
      double v7 = self->_chargingTime;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v5 = (unint64_t *)a3;
  [v5 readAll:0];
  NSUInteger v4 = (double *)v5;
  if ((v5[5] & 2) != 0)
  {
    self->_muid = v5[3];
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (v5[4])
  {
    -[GEOSharedNavChargingStationInfo setName:](self, "setName:");
    NSUInteger v4 = (double *)v5;
  }
  if ((_BYTE)v4[5])
  {
    self->_double chargingTime = v4[2];
    *(unsigned char *)&self->_flags |= 1u;
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
    [(GEOSharedNavChargingStationInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end