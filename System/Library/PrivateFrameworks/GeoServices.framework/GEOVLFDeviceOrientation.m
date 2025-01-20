@interface GEOVLFDeviceOrientation
+ (BOOL)isValid:(id)a3;
- (BOOL)hasOrientation;
- (BOOL)hasRelativeTimestampMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLFDeviceOrientation)initWithDictionary:(id)a3;
- (GEOVLFDeviceOrientation)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)orientationAsString:(int)a3;
- (int)StringAsOrientation:(id)a3;
- (int)orientation;
- (unint64_t)hash;
- (unsigned)relativeTimestampMs;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasOrientation:(BOOL)a3;
- (void)setHasRelativeTimestampMs:(BOOL)a3;
- (void)setOrientation:(int)a3;
- (void)setRelativeTimestampMs:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFDeviceOrientation

- (unsigned)relativeTimestampMs
{
  return self->_relativeTimestampMs;
}

- (void)setRelativeTimestampMs:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_relativeTimestampMs = a3;
}

- (void)setHasRelativeTimestampMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRelativeTimestampMs
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)orientation
{
  if (*(unsigned char *)&self->_flags) {
    return self->_orientation;
  }
  else {
    return 0;
  }
}

- (void)setOrientation:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_orientation = a3;
}

- (void)setHasOrientation:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasOrientation
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)orientationAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F8D20[a3];
  }

  return v3;
}

- (int)StringAsOrientation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VLFDeviceOrientationType_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VLFDeviceOrientationType_OUT_OF_POCKET"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VLFDeviceOrientationType_IN_POCKET"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VLFDeviceOrientationType_FACE_DOWN"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"VLFDeviceOrientationType_FACE_DOWN_ON_TABLE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLFDeviceOrientation;
  int v4 = [(GEOVLFDeviceOrientation *)&v8 description];
  v5 = [(GEOVLFDeviceOrientation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFDeviceOrientation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 16);
    if ((v5 & 2) != 0)
    {
      v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 12)];
      if (a2) {
        v7 = @"relativeTimestampMs";
      }
      else {
        v7 = @"relative_timestamp_ms";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 16);
    }
    if (v5)
    {
      uint64_t v8 = *(int *)(a1 + 8);
      if (v8 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E53F8D20[v8];
      }
      [v4 setObject:v9 forKey:@"orientation"];
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
  return -[GEOVLFDeviceOrientation _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFDeviceOrientation)initWithDictionary:(id)a3
{
  return (GEOVLFDeviceOrientation *)-[GEOVLFDeviceOrientation _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"relativeTimestampMs";
      }
      else {
        v6 = @"relative_timestamp_ms";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRelativeTimestampMs:", objc_msgSend(v7, "unsignedIntValue"));
      }

      uint64_t v8 = [v5 objectForKeyedSubscript:@"orientation"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
        if ([v9 isEqualToString:@"VLFDeviceOrientationType_UNKNOWN"])
        {
          uint64_t v10 = 0;
        }
        else if ([v9 isEqualToString:@"VLFDeviceOrientationType_OUT_OF_POCKET"])
        {
          uint64_t v10 = 1;
        }
        else if ([v9 isEqualToString:@"VLFDeviceOrientationType_IN_POCKET"])
        {
          uint64_t v10 = 2;
        }
        else if ([v9 isEqualToString:@"VLFDeviceOrientationType_FACE_DOWN"])
        {
          uint64_t v10 = 3;
        }
        else if ([v9 isEqualToString:@"VLFDeviceOrientationType_FACE_DOWN_ON_TABLE"])
        {
          uint64_t v10 = 4;
        }
        else
        {
          uint64_t v10 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_24:

          goto LABEL_25;
        }
        uint64_t v10 = [v8 intValue];
      }
      [a1 setOrientation:v10];
      goto LABEL_24;
    }
  }
LABEL_25:

  return a1;
}

- (GEOVLFDeviceOrientation)initWithJSON:(id)a3
{
  return (GEOVLFDeviceOrientation *)-[GEOVLFDeviceOrientation _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFDeviceOrientationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFDeviceOrientationReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOVLFDeviceOrientation *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = self->_relativeTimestampMs;
    *((unsigned char *)v5 + 16) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v5[2] = self->_orientation;
    *((unsigned char *)v5 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_relativeTimestampMs;
    *((unsigned char *)result + 16) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)result + 2) = self->_orientation;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOVLFDeviceOrientation *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_relativeTimestampMs != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_orientation != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOVLFDeviceOrientation *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_relativeTimestampMs;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_orientation;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 16);
  if ((v4 & 2) != 0)
  {
    self->_relativeTimestampMs = *((_DWORD *)v5 + 3);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 16);
  }
  if (v4)
  {
    self->_orientation = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end