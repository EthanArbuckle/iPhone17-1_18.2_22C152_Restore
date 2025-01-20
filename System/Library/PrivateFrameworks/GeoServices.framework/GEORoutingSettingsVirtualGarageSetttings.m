@interface GEORoutingSettingsVirtualGarageSetttings
+ (BOOL)isValid:(id)a3;
- (BOOL)hasElectronicVehicleCount;
- (BOOL)hasLicensePlateCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORoutingSettingsVirtualGarageSetttings)initWithDictionary:(id)a3;
- (GEORoutingSettingsVirtualGarageSetttings)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)electronicVehicleCount;
- (int)licensePlateCount;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setElectronicVehicleCount:(int)a3;
- (void)setHasElectronicVehicleCount:(BOOL)a3;
- (void)setHasLicensePlateCount:(BOOL)a3;
- (void)setLicensePlateCount:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORoutingSettingsVirtualGarageSetttings

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"electronicVehicleCount";
      }
      else {
        v6 = @"electronic_vehicle_count";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setElectronicVehicleCount:", objc_msgSend(v7, "intValue"));
      }

      if (a3) {
        v8 = @"licensePlateCount";
      }
      else {
        v8 = @"license_plate_count";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLicensePlateCount:", objc_msgSend(v9, "intValue"));
      }
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEORoutingSettingsVirtualGarageSetttings *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_electronicVehicleCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_licensePlateCount != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (int)electronicVehicleCount
{
  return self->_electronicVehicleCount;
}

- (void)setElectronicVehicleCount:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_electronicVehicleCount = a3;
}

- (void)setHasElectronicVehicleCount:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasElectronicVehicleCount
{
  return *(unsigned char *)&self->_flags & 1;
}

- (int)licensePlateCount
{
  return self->_licensePlateCount;
}

- (void)setLicensePlateCount:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_licensePlateCount = a3;
}

- (void)setHasLicensePlateCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLicensePlateCount
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORoutingSettingsVirtualGarageSetttings;
  id v4 = [(GEORoutingSettingsVirtualGarageSetttings *)&v8 description];
  BOOL v5 = [(GEORoutingSettingsVirtualGarageSetttings *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORoutingSettingsVirtualGarageSetttings _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 16);
    if (v5)
    {
      v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 8)];
      if (a2) {
        v7 = @"electronicVehicleCount";
      }
      else {
        v7 = @"electronic_vehicle_count";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 16);
    }
    if ((v5 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 12)];
      if (a2) {
        v9 = @"licensePlateCount";
      }
      else {
        v9 = @"license_plate_count";
      }
      [v4 setObject:v8 forKey:v9];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORoutingSettingsVirtualGarageSetttings _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORoutingSettingsVirtualGarageSetttings)initWithDictionary:(id)a3
{
  return (GEORoutingSettingsVirtualGarageSetttings *)-[GEORoutingSettingsVirtualGarageSetttings _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEORoutingSettingsVirtualGarageSetttings)initWithJSON:(id)a3
{
  return (GEORoutingSettingsVirtualGarageSetttings *)-[GEORoutingSettingsVirtualGarageSetttings _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORoutingSettingsVirtualGarageSetttingsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORoutingSettingsVirtualGarageSetttingsReadAllFrom((uint64_t)self, a3);
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
}

- (void)copyTo:(id)a3
{
  char v5 = a3;
  [(GEORoutingSettingsVirtualGarageSetttings *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[2] = self->_electronicVehicleCount;
    *((unsigned char *)v5 + 16) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[3] = self->_licensePlateCount;
    *((unsigned char *)v5 + 16) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)result + 2) = self->_electronicVehicleCount;
    *((unsigned char *)result + 16) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_licensePlateCount;
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (unint64_t)hash
{
  [(GEORoutingSettingsVirtualGarageSetttings *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_electronicVehicleCount;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_licensePlateCount;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  char v5 = (int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 16);
  if (v4)
  {
    self->_electronicVehicleCount = v5[2];
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 16);
  }
  if ((v4 & 2) != 0)
  {
    self->_licensePlateCount = v5[3];
    *(unsigned char *)&self->_flags |= 2u;
  }
}

@end