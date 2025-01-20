@interface GEOLocalTime
+ (BOOL)isValid:(id)a3;
- (BOOL)hasHumanReadable;
- (BOOL)hasTimeRoundedToHour;
- (BOOL)hasTimezoneOffsetFromGmtInHours;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocalTime)initWithCFAbsoluteTime:(double)a3;
- (GEOLocalTime)initWithDate:(id)a3;
- (GEOLocalTime)initWithDictionary:(id)a3;
- (GEOLocalTime)initWithJSON:(id)a3;
- (NSString)humanReadable;
- (PBUnknownFields)unknownFields;
- (float)timezoneOffsetFromGmtInHours;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)timeRoundedToHour;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTimeRoundedToHour:(BOOL)a3;
- (void)setHasTimezoneOffsetFromGmtInHours:(BOOL)a3;
- (void)setHumanReadable:(id)a3;
- (void)setTimeRoundedToHour:(unint64_t)a3;
- (void)setTimezoneOffsetFromGmtInHours:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLocalTime

- (GEOLocalTime)initWithCFAbsoluteTime:(double)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GEOLocalTime;
  v4 = [(GEOLocalTime *)&v11 init];
  v5 = v4;
  if (v4)
  {
    [(GEOLocalTime *)v4 setTimeRoundedToHour:(unint64_t)(round(a3 / 3600.0) * 3600.0)];
    CFTimeZoneRef v6 = CFTimeZoneCopySystem();
    double SecondsFromGMT = CFTimeZoneGetSecondsFromGMT(v6, a3);
    if (v6) {
      CFRelease(v6);
    }
    double v8 = SecondsFromGMT / 3600.0;
    *(float *)&double v8 = SecondsFromGMT / 3600.0;
    [(GEOLocalTime *)v5 setTimezoneOffsetFromGmtInHours:v8];
    v9 = v5;
  }

  return v5;
}

- (GEOLocalTime)initWithDate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOLocalTime;
  v5 = [(GEOLocalTime *)&v13 init];
  if (v5)
  {
    [v4 timeIntervalSinceReferenceDate];
    CFAbsoluteTime v7 = v6;
    [(GEOLocalTime *)v5 setTimeRoundedToHour:(unint64_t)(round(v6 / 3600.0) * 3600.0)];
    CFTimeZoneRef v8 = CFTimeZoneCopySystem();
    double SecondsFromGMT = CFTimeZoneGetSecondsFromGMT(v8, v7);
    if (v8) {
      CFRelease(v8);
    }
    double v10 = SecondsFromGMT / 3600.0;
    *(float *)&double v10 = SecondsFromGMT / 3600.0;
    [(GEOLocalTime *)v5 setTimezoneOffsetFromGmtInHours:v10];
    objc_super v11 = v5;
  }

  return v5;
}

- (void)setTimezoneOffsetFromGmtInHours:(float)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_timezoneOffsetFromGmtInHours = a3;
}

- (void)setTimeRoundedToHour:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_timeRoundedToHour = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_humanReadable, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
  if (self->_humanReadable)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (unint64_t)timeRoundedToHour
{
  return self->_timeRoundedToHour;
}

- (void)setHasTimeRoundedToHour:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTimeRoundedToHour
{
  return *(unsigned char *)&self->_flags & 1;
}

- (float)timezoneOffsetFromGmtInHours
{
  return self->_timezoneOffsetFromGmtInHours;
}

- (void)setHasTimezoneOffsetFromGmtInHours:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTimezoneOffsetFromGmtInHours
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLocalTime;
  id v4 = [(GEOLocalTime *)&v8 description];
  v5 = [(GEOLocalTime *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLocalTime _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v6 = *(unsigned char *)(a1 + 36);
    if (v6)
    {
      CFAbsoluteTime v7 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      if (a2) {
        objc_super v8 = @"timeRoundedToHour";
      }
      else {
        objc_super v8 = @"time_rounded_to_hour";
      }
      [v4 setObject:v7 forKey:v8];

      char v6 = *(unsigned char *)(a1 + 36);
    }
    if ((v6 & 2) != 0)
    {
      LODWORD(v5) = *(_DWORD *)(a1 + 32);
      v9 = [NSNumber numberWithFloat:v5];
      if (a2) {
        double v10 = @"timezoneOffsetFromGmtInHours";
      }
      else {
        double v10 = @"timezone_offset_from_gmt_in_hours";
      }
      [v4 setObject:v9 forKey:v10];
    }
    objc_super v11 = [(id)a1 humanReadable];
    if (v11)
    {
      if (a2) {
        v12 = @"humanReadable";
      }
      else {
        v12 = @"human_readable";
      }
      [v4 setObject:v11 forKey:v12];
    }

    objc_super v13 = *(void **)(a1 + 8);
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __42__GEOLocalTime__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
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
  return -[GEOLocalTime _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __42__GEOLocalTime__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  CFAbsoluteTime v7 = *(void **)(a1 + 32);
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

- (GEOLocalTime)initWithDictionary:(id)a3
{
  return (GEOLocalTime *)-[GEOLocalTime _initWithDictionary:isJSON:](self, a3, 0);
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
        char v6 = @"timeRoundedToHour";
      }
      else {
        char v6 = @"time_rounded_to_hour";
      }
      CFAbsoluteTime v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTimeRoundedToHour:", objc_msgSend(v7, "unsignedLongLongValue"));
      }

      if (a3) {
        objc_super v8 = @"timezoneOffsetFromGmtInHours";
      }
      else {
        objc_super v8 = @"timezone_offset_from_gmt_in_hours";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 floatValue];
        objc_msgSend(a1, "setTimezoneOffsetFromGmtInHours:");
      }

      if (a3) {
        id v10 = @"humanReadable";
      }
      else {
        id v10 = @"human_readable";
      }
      objc_super v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = (void *)[v11 copy];
        [a1 setHumanReadable:v12];
      }
    }
  }

  return a1;
}

- (GEOLocalTime)initWithJSON:(id)a3
{
  return (GEOLocalTime *)-[GEOLocalTime _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLocalTimeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLocalTimeReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEOLocalTime *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if (flags)
  {
    *((void *)v6 + 3) = self->_timeRoundedToHour;
    *((unsigned char *)v6 + 36) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 8) = LODWORD(self->_timezoneOffsetFromGmtInHours);
    *((unsigned char *)v6 + 36) |= 2u;
  }
  if (self->_humanReadable)
  {
    objc_msgSend(v6, "setHumanReadable:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 24) = self->_timeRoundedToHour;
    *(unsigned char *)(v5 + 36) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(float *)(v5 + 32) = self->_timezoneOffsetFromGmtInHours;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_humanReadable copyWithZone:a3];
  v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOLocalTime *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_timeRoundedToHour != *((void *)v4 + 3)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_timezoneOffsetFromGmtInHours != *((float *)v4 + 8)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_14;
  }
  humanReadable = self->_humanReadable;
  if ((unint64_t)humanReadable | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](humanReadable, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLocalTime *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v3 = 2654435761u * self->_timeRoundedToHour;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    return v8 ^ v3 ^ [(NSString *)self->_humanReadable hash];
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float timezoneOffsetFromGmtInHours = self->_timezoneOffsetFromGmtInHours;
  double v5 = timezoneOffsetFromGmtInHours;
  if (timezoneOffsetFromGmtInHours < 0.0) {
    double v5 = -timezoneOffsetFromGmtInHours;
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
  return v8 ^ v3 ^ [(NSString *)self->_humanReadable hash];
}

- (void)mergeFrom:(id)a3
{
  id v6 = a3;
  [v6 readAll:0];
  id v4 = v6;
  char v5 = *((unsigned char *)v6 + 36);
  if (v5)
  {
    self->_timeRoundedToHour = *((void *)v6 + 3);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v6 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_float timezoneOffsetFromGmtInHours = *((float *)v6 + 8);
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (*((void *)v6 + 2))
  {
    -[GEOLocalTime setHumanReadable:](self, "setHumanReadable:");
    id v4 = v6;
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
    [(GEOLocalTime *)self readAll:0];
  }
}

- (BOOL)hasHumanReadable
{
  return self->_humanReadable != 0;
}

- (NSString)humanReadable
{
  return self->_humanReadable;
}

- (void)setHumanReadable:(id)a3
{
}

@end