@interface GEOActiveResourceFilter
+ (BOOL)isValid:(id)a3;
- (BOOL)_isFilterStaleThresholdExpired;
- (BOOL)hasLastTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOActiveResourceFilter)initWithDictionary:(id)a3;
- (GEOActiveResourceFilter)initWithJSON:(id)a3;
- (NSString)name;
- (PBUnknownFields)unknownFields;
- (double)lastTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)scaleAsString:(int)a3;
- (id)scenarioAsString:(int)a3;
- (int)StringAsScale:(id)a3;
- (int)StringAsScenario:(id)a3;
- (int)scale;
- (int)scenario;
- (unint64_t)hash;
- (unint64_t)whichFilter;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)resetFilter;
- (void)setHasLastTimestamp:(BOOL)a3;
- (void)setLastTimestamp:(double)a3;
- (void)setName:(id)a3;
- (void)setScale:(int)a3;
- (void)setScenario:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOActiveResourceFilter

- (unint64_t)whichFilter
{
  return self->_whichFilter;
}

- (BOOL)readFrom:(id)a3
{
  return GEOActiveResourceFilterReadAllFrom((uint64_t)self, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (int)scale
{
  if (self->_whichFilter == 1) {
    return self->_scale;
  }
  else {
    return 0;
  }
}

- (void)setScale:(int)a3
{
  self->_scale = a3;
  self->_whichFilter = 1;
}

- (void)resetFilter
{
  self->_scale = 0;
  self->_scenario = 0;
  name = self->_name;
  self->_name = 0;

  self->_whichFilter = 0;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteDoubleField();
  }
  unint64_t whichFilter = self->_whichFilter;
  if (whichFilter == 1)
  {
    PBDataWriterWriteInt32Field();
    unint64_t whichFilter = self->_whichFilter;
  }
  if (whichFilter == 2)
  {
    PBDataWriterWriteInt32Field();
    unint64_t whichFilter = self->_whichFilter;
  }
  if (whichFilter == 3) {
    PBDataWriterWriteStringField();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (BOOL)_isFilterStaleThresholdExpired
{
  BOOL v3 = [(GEOActiveResourceFilter *)self hasLastTimestamp];
  if (v3)
  {
    if ([(GEOActiveResourceFilter *)self whichFilter] - 1 > 2)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      double Double = GEOConfigGetDouble(GeoServicesConfig_ResourceFilterStaleInterval, (uint64_t)off_1E9114058);
      double Current = CFAbsoluteTimeGetCurrent();
      [(GEOActiveResourceFilter *)self lastTimestamp];
      double v7 = Current - v6;
      double v8 = CFAbsoluteTimeGetCurrent();
      [(GEOActiveResourceFilter *)self lastTimestamp];
      double v10 = v8 - v9;
      if (v7 < 0.0) {
        double v10 = -v10;
      }
      LOBYTE(v3) = v10 > Double;
    }
  }
  return v3;
}

- (double)lastTimestamp
{
  return self->_lastTimestamp;
}

- (void)setLastTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_lastTimestamp = a3;
}

- (void)setHasLastTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLastTimestamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)scaleAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v3 = off_1E53DFDC8[a3];
  }

  return v3;
}

- (int)StringAsScale:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESOURCE_FILTER_SCALE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCALE_1X"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCALE_2X"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCALE_3X"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)scenario
{
  if (self->_whichFilter == 2) {
    return self->_scenario;
  }
  else {
    return 0;
  }
}

- (void)setScenario:(int)a3
{
  self->_scenario = a3;
  self->_unint64_t whichFilter = 2;
}

- (id)scenarioAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DFDE8[a3];
  }

  return v3;
}

- (int)StringAsScenario:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESOURCE_FILTER_SCENARIO_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCENARIO_CARPLAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCENARIO_NAVIGATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCENARIO_HIGHVISIBILITY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FILTER_SCENARIO_EXPLICIT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (NSString)name
{
  if (self->_whichFilter == 3) {
    v2 = self->_name;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setName:(id)a3
{
  int v4 = (NSString *)a3;
  [(GEOActiveResourceFilter *)self resetFilter];
  name = self->_name;
  self->_name = v4;

  if (v4) {
    self->_unint64_t whichFilter = 3;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOActiveResourceFilter;
  int v4 = [(GEOActiveResourceFilter *)&v8 description];
  id v5 = [(GEOActiveResourceFilter *)self dictionaryRepresentation];
  double v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOActiveResourceFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_23;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = *(void *)(a1 + 48);
  switch(v5)
  {
    case 3:
      double v7 = [(id)a1 name];
      if (!v7)
      {
LABEL_16:

        break;
      }
      double v9 = @"name";
LABEL_15:
      [v4 setObject:v7 forKey:v9];
      goto LABEL_16;
    case 2:
      uint64_t v8 = *(int *)(a1 + 36);
      if (v8 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 36));
        double v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        double v7 = off_1E53DFDE8[v8];
      }
      double v9 = @"scenario";
      goto LABEL_15;
    case 1:
      uint64_t v6 = *(int *)(a1 + 32);
      if (v6 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
        double v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        double v7 = off_1E53DFDC8[v6];
      }
      double v9 = @"scale";
      goto LABEL_15;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    double v10 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
    [v4 setObject:v10 forKey:@"lastTimestamp"];
  }
  v11 = *(void **)(a1 + 8);
  if (v11)
  {
    v12 = [v11 dictionaryRepresentation];
    v13 = v12;
    if (a2)
    {
      v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __53__GEOActiveResourceFilter__dictionaryRepresentation___block_invoke;
      v18[3] = &unk_1E53D8860;
      id v15 = v14;
      id v19 = v15;
      [v13 enumerateKeysAndObjectsUsingBlock:v18];
      id v16 = v15;

      v13 = v16;
    }
    [v4 setObject:v13 forKey:@"Unknown Fields"];
  }
LABEL_23:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOActiveResourceFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOActiveResourceFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    double v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOActiveResourceFilter)initWithDictionary:(id)a3
{
  return (GEOActiveResourceFilter *)-[GEOActiveResourceFilter _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      int v4 = [v3 objectForKeyedSubscript:@"lastTimestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v4 doubleValue];
        objc_msgSend(a1, "setLastTimestamp:");
      }
    }
  }

  return a1;
}

- (GEOActiveResourceFilter)initWithJSON:(id)a3
{
  return (GEOActiveResourceFilter *)-[GEOActiveResourceFilter _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOActiveResourceFilterIsValid((char *)a3);
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOActiveResourceFilter *)self readAll:0];
  [(GEOActiveResourceFilter *)self resetFilter];
  unint64_t whichFilter = self->_whichFilter;
  if (whichFilter == 3)
  {
    objc_storeStrong(v8 + 3, self->_name);
    id v5 = v8;
  }
  else
  {
    if (whichFilter == 2)
    {
      uint64_t v6 = 36;
      int scenario = self->_scenario;
      id v5 = v8;
    }
    else
    {
      id v5 = v8;
      if (whichFilter != 1) {
        goto LABEL_8;
      }
      uint64_t v6 = 32;
      int scenario = self->_scale;
    }
    *(_DWORD *)((char *)v5 + v6) = scenario;
  }
LABEL_8:
  v5[6] = self->_whichFilter;
  if (*(unsigned char *)&self->_flags)
  {
    v5[2] = *(id *)&self->_lastTimestamp;
    *((unsigned char *)v5 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  unint64_t whichFilter = self->_whichFilter;
  if (whichFilter == 3)
  {
    uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
    id v10 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v9;
  }
  else
  {
    if (whichFilter == 2)
    {
      uint64_t v8 = 36;
    }
    else
    {
      if (whichFilter != 1) {
        goto LABEL_8;
      }
      uint64_t v8 = 32;
    }
    *(_DWORD *)(v5 + v8) = *(_DWORD *)((char *)&self->super.super.isa + v8);
  }
LABEL_8:
  *(void *)(v6 + 48) = self->_whichFilter;
  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v6 + 16) = self->_lastTimestamp;
    *(unsigned char *)(v6 + 40) |= 1u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  [(GEOActiveResourceFilter *)self readAll:1];
  [v4 readAll:1];
  unint64_t whichFilter = self->_whichFilter;
  if (whichFilter != *((void *)v4 + 6)) {
    goto LABEL_15;
  }
  if (whichFilter == 3)
  {
    if (![(NSString *)self->_name isEqual:*((void *)v4 + 3)]) {
      goto LABEL_15;
    }
  }
  else
  {
    if (whichFilter == 2)
    {
      uint64_t v6 = 36;
    }
    else
    {
      if (whichFilter != 1) {
        goto LABEL_11;
      }
      uint64_t v6 = 32;
    }
    if (*(_DWORD *)((char *)&self->super.super.isa + v6) != *(_DWORD *)&v4[v6]) {
      goto LABEL_15;
    }
  }
LABEL_11:
  BOOL v7 = (v4[40] & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[40] & 1) != 0 && self->_lastTimestamp == *((double *)v4 + 2))
    {
      BOOL v7 = 1;
      goto LABEL_16;
    }
LABEL_15:
    BOOL v7 = 0;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  [(GEOActiveResourceFilter *)self readAll:1];
  unint64_t whichFilter = self->_whichFilter;
  uint64_t v4 = 2654435761u * whichFilter;
  if (whichFilter == 3)
  {
    v4 ^= [(NSString *)self->_name hash];
  }
  else
  {
    if (whichFilter == 2)
    {
      uint64_t v5 = 36;
    }
    else
    {
      if (whichFilter != 1) {
        goto LABEL_8;
      }
      uint64_t v5 = 32;
    }
    v4 ^= 2654435761 * *(int *)((char *)&self->super.super.isa + v5);
  }
LABEL_8:
  if (*(unsigned char *)&self->_flags)
  {
    double lastTimestamp = self->_lastTimestamp;
    double v8 = -lastTimestamp;
    if (lastTimestamp >= 0.0) {
      double v8 = self->_lastTimestamp;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v6 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  BOOL v7 = (id *)a3;
  [v7 readAll:0];
  [(GEOActiveResourceFilter *)self resetFilter];
  uint64_t v4 = v7;
  id v5 = v7[6];
  if (v5 == (id)3)
  {
    objc_storeStrong((id *)&self->_name, v7[3]);
    uint64_t v4 = v7;
  }
  else
  {
    if (v5 == (id)2)
    {
      uint64_t v6 = 36;
    }
    else
    {
      if (v5 != (id)1) {
        goto LABEL_8;
      }
      uint64_t v6 = 32;
    }
    *(_DWORD *)((char *)&self->super.super.isa + v6) = *(_DWORD *)((char *)v7 + v6);
  }
LABEL_8:
  self->_unint64_t whichFilter = (unint64_t)v4[6];
  if ((_BYTE)v4[5])
  {
    *(void *)&self->_double lastTimestamp = v4[2];
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
    [(GEOActiveResourceFilter *)self readAll:0];
  }
}

@end