@interface GEOLogMsgStateExtension
+ (BOOL)isValid:(id)a3;
- (BOOL)hasHasRideBookingAppEnabled;
- (BOOL)hasHasRideBookingAppInstalled;
- (BOOL)hasHasTableBookingAppEnabled;
- (BOOL)hasHasTableBookingAppInstalled;
- (BOOL)hasRideBookingAppEnabled;
- (BOOL)hasRideBookingAppInstalled;
- (BOOL)hasTableBookingAppEnabled;
- (BOOL)hasTableBookingAppInstalled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateExtension)initWithDictionary:(id)a3;
- (GEOLogMsgStateExtension)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(unsigned __int8 *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHasRideBookingAppEnabled:(BOOL)a3;
- (void)setHasHasRideBookingAppInstalled:(BOOL)a3;
- (void)setHasHasTableBookingAppEnabled:(BOOL)a3;
- (void)setHasHasTableBookingAppInstalled:(BOOL)a3;
- (void)setHasRideBookingAppEnabled:(BOOL)a3;
- (void)setHasRideBookingAppInstalled:(BOOL)a3;
- (void)setHasTableBookingAppEnabled:(BOOL)a3;
- (void)setHasTableBookingAppInstalled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateExtension

- (BOOL)hasRideBookingAppInstalled
{
  return self->_hasRideBookingAppInstalled;
}

- (void)setHasRideBookingAppInstalled:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_hasRideBookingAppInstalled = a3;
}

- (void)setHasHasRideBookingAppInstalled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHasRideBookingAppInstalled
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)hasRideBookingAppEnabled
{
  return self->_hasRideBookingAppEnabled;
}

- (void)setHasRideBookingAppEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_hasRideBookingAppEnabled = a3;
}

- (void)setHasHasRideBookingAppEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasHasRideBookingAppEnabled
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasTableBookingAppInstalled
{
  return self->_hasTableBookingAppInstalled;
}

- (void)setHasTableBookingAppInstalled:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_hasTableBookingAppInstalled = a3;
}

- (void)setHasHasTableBookingAppInstalled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasHasTableBookingAppInstalled
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)hasTableBookingAppEnabled
{
  return self->_hasTableBookingAppEnabled;
}

- (void)setHasTableBookingAppEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_hasTableBookingAppEnabled = a3;
}

- (void)setHasHasTableBookingAppEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasHasTableBookingAppEnabled
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateExtension;
  v4 = [(GEOLogMsgStateExtension *)&v8 description];
  v5 = [(GEOLogMsgStateExtension *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateExtension _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_23;
  }
  [a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  unsigned __int8 v5 = a1[12];
  if ((v5 & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:a1[9]];
    if (a2) {
      v7 = @"hasRideBookingAppInstalled";
    }
    else {
      v7 = @"has_ride_booking_app_installed";
    }
    [v4 setObject:v6 forKey:v7];

    unsigned __int8 v5 = a1[12];
  }
  if ((v5 & 1) == 0)
  {
    if ((v5 & 8) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    v10 = [NSNumber numberWithBool:a1[11]];
    if (a2) {
      v11 = @"hasTableBookingAppInstalled";
    }
    else {
      v11 = @"has_table_booking_app_installed";
    }
    [v4 setObject:v10 forKey:v11];

    if ((a1[12] & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  objc_super v8 = [NSNumber numberWithBool:a1[8]];
  if (a2) {
    v9 = @"hasRideBookingAppEnabled";
  }
  else {
    v9 = @"has_ride_booking_app_enabled";
  }
  [v4 setObject:v8 forKey:v9];

  unsigned __int8 v5 = a1[12];
  if ((v5 & 8) != 0) {
    goto LABEL_15;
  }
LABEL_9:
  if ((v5 & 4) != 0)
  {
LABEL_19:
    v12 = [NSNumber numberWithBool:a1[10]];
    if (a2) {
      v13 = @"hasTableBookingAppEnabled";
    }
    else {
      v13 = @"has_table_booking_app_enabled";
    }
    [v4 setObject:v12 forKey:v13];
  }
LABEL_23:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateExtension _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOLogMsgStateExtension)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateExtension *)-[GEOLogMsgStateExtension _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"hasRideBookingAppInstalled";
      }
      else {
        v6 = @"has_ride_booking_app_installed";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHasRideBookingAppInstalled:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"hasRideBookingAppEnabled";
      }
      else {
        objc_super v8 = @"has_ride_booking_app_enabled";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHasRideBookingAppEnabled:", objc_msgSend(v9, "BOOLValue"));
      }

      if (a3) {
        v10 = @"hasTableBookingAppInstalled";
      }
      else {
        v10 = @"has_table_booking_app_installed";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHasTableBookingAppInstalled:", objc_msgSend(v11, "BOOLValue"));
      }

      if (a3) {
        v12 = @"hasTableBookingAppEnabled";
      }
      else {
        v12 = @"has_table_booking_app_enabled";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHasTableBookingAppEnabled:", objc_msgSend(v13, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateExtension)initWithJSON:(id)a3
{
  return (GEOLogMsgStateExtension *)-[GEOLogMsgStateExtension _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateExtensionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateExtensionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteBOOLField();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgStateExtension *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[9] = self->_hasRideBookingAppInstalled;
    v5[12] |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[8] = self->_hasRideBookingAppEnabled;
  v5[12] |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v5[11] = self->_hasTableBookingAppInstalled;
  v5[12] |= 8u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_5:
    v5[10] = self->_hasTableBookingAppEnabled;
    v5[12] |= 4u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((unsigned char *)result + 9) = self->_hasRideBookingAppInstalled;
    *((unsigned char *)result + 12) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 8) = self->_hasRideBookingAppEnabled;
  *((unsigned char *)result + 12) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((unsigned char *)result + 11) = self->_hasTableBookingAppInstalled;
  *((unsigned char *)result + 12) |= 8u;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    return result;
  }
LABEL_5:
  *((unsigned char *)result + 10) = self->_hasTableBookingAppEnabled;
  *((unsigned char *)result + 12) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  [(GEOLogMsgStateExtension *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[12] & 2) == 0) {
      goto LABEL_28;
    }
    if (self->_hasRideBookingAppInstalled)
    {
      if (!v4[9]) {
        goto LABEL_28;
      }
    }
    else if (v4[9])
    {
      goto LABEL_28;
    }
  }
  else if ((v4[12] & 2) != 0)
  {
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[12] & 1) == 0) {
      goto LABEL_28;
    }
    if (self->_hasRideBookingAppEnabled)
    {
      if (!v4[8]) {
        goto LABEL_28;
      }
    }
    else if (v4[8])
    {
      goto LABEL_28;
    }
  }
  else if (v4[12])
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((v4[12] & 8) == 0) {
      goto LABEL_28;
    }
    if (self->_hasTableBookingAppInstalled)
    {
      if (!v4[11]) {
        goto LABEL_28;
      }
    }
    else if (v4[11])
    {
      goto LABEL_28;
    }
  }
  else if ((v4[12] & 8) != 0)
  {
    goto LABEL_28;
  }
  BOOL v5 = (v4[12] & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v4[12] & 4) != 0)
    {
      if (self->_hasTableBookingAppEnabled)
      {
        if (!v4[10]) {
          goto LABEL_28;
        }
      }
      else if (v4[10])
      {
        goto LABEL_28;
      }
      BOOL v5 = 1;
      goto LABEL_29;
    }
LABEL_28:
    BOOL v5 = 0;
  }
LABEL_29:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateExtension *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_hasRideBookingAppInstalled;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_hasRideBookingAppEnabled;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_flags & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_hasTableBookingAppInstalled;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_hasTableBookingAppEnabled;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (BOOL *)a3;
  [v5 readAll:0];
  BOOL v4 = v5[12];
  if ((v4 & 2) != 0)
  {
    self->_hasRideBookingAppInstalled = v5[9];
    *(unsigned char *)&self->_flags |= 2u;
    BOOL v4 = v5[12];
    if (!v4)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if (!v5[12])
  {
    goto LABEL_3;
  }
  self->_hasRideBookingAppEnabled = v5[8];
  *(unsigned char *)&self->_flags |= 1u;
  BOOL v4 = v5[12];
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_hasTableBookingAppInstalled = v5[11];
  *(unsigned char *)&self->_flags |= 8u;
  if ((v5[12] & 4) != 0)
  {
LABEL_5:
    self->_hasTableBookingAppEnabled = v5[10];
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_6:
}

@end