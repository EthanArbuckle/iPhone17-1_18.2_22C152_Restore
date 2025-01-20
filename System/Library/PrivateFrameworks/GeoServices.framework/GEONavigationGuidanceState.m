@interface GEONavigationGuidanceState
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGuidanceLevel;
- (BOOL)hasGuidanceLevelIgnoringTimeCriterion;
- (BOOL)hasNavigationState;
- (BOOL)hasNavigationType;
- (BOOL)hasShouldSuppressCellularDataAlerts;
- (BOOL)hasTrackedTransportType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldSuppressCellularDataAlerts;
- (GEONavigationGuidanceState)initWithDictionary:(id)a3;
- (GEONavigationGuidanceState)initWithGuidanceLevel:(int)a3;
- (GEONavigationGuidanceState)initWithJSON:(id)a3;
- (GEONavigationGuidanceState)initWithTransportType:(int)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)guidanceLevelAsString:(int)a3;
- (id)guidanceLevelIgnoringTimeCriterionAsString:(int)a3;
- (id)navigationStateAsString:(int)a3;
- (id)navigationTypeAsString:(int)a3;
- (id)trackedTransportTypeAsString:(int)a3;
- (int)StringAsGuidanceLevel:(id)a3;
- (int)StringAsGuidanceLevelIgnoringTimeCriterion:(id)a3;
- (int)StringAsNavigationState:(id)a3;
- (int)StringAsNavigationType:(id)a3;
- (int)StringAsTrackedTransportType:(id)a3;
- (int)guidanceLevel;
- (int)guidanceLevelIgnoringTimeCriterion;
- (int)navigationState;
- (int)navigationType;
- (int)trackedTransportType;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGuidanceLevel:(int)a3;
- (void)setGuidanceLevelIgnoringTimeCriterion:(int)a3;
- (void)setHasGuidanceLevel:(BOOL)a3;
- (void)setHasGuidanceLevelIgnoringTimeCriterion:(BOOL)a3;
- (void)setHasNavigationState:(BOOL)a3;
- (void)setHasNavigationType:(BOOL)a3;
- (void)setHasShouldSuppressCellularDataAlerts:(BOOL)a3;
- (void)setHasTrackedTransportType:(BOOL)a3;
- (void)setNavigationState:(int)a3;
- (void)setNavigationType:(int)a3;
- (void)setShouldSuppressCellularDataAlerts:(BOOL)a3;
- (void)setTrackedTransportType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEONavigationGuidanceState

- (int)trackedTransportType
{
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    return self->_trackedTransportType;
  }
  else {
    return 4;
  }
}

- (void)setTrackedTransportType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_trackedTransportType = a3;
}

- (void)setHasTrackedTransportType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasTrackedTransportType
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)trackedTransportTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E1200[a3];
  }

  return v3;
}

- (int)StringAsTrackedTransportType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOMOBILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BICYCLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)navigationState
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_navigationState;
  }
  else {
    return 0;
  }
}

- (void)setNavigationState:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_navigationState = a3;
}

- (void)setHasNavigationState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasNavigationState
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)navigationStateAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E1180[a3];
  }

  return v3;
}

- (int)StringAsNavigationState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NOT_NAVIGATING"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PROCEEDING_TO_ROUTE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ON_ROUTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"OFF_ROUTE_OFF_ROAD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"OFF_ROUTE_ON_ROAD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RECALCULATING"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"END_OF_ROUTE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"END_OF_SEGMENT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"OUTSIDE_NAVIGABLE_AREA"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)guidanceLevel
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_guidanceLevel;
  }
  else {
    return 0;
  }
}

- (void)setGuidanceLevel:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_guidanceLevel = a3;
}

- (void)setHasGuidanceLevel:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasGuidanceLevel
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)guidanceLevelAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E11C8[a3];
  }

  return v3;
}

- (int)StringAsGuidanceLevel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PREPARE_TO_TRAVEL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRACKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TURN_BY_TURN"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)shouldSuppressCellularDataAlerts
{
  return self->_shouldSuppressCellularDataAlerts;
}

- (void)setShouldSuppressCellularDataAlerts:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_shouldSuppressCellularDataAlerts = a3;
}

- (void)setHasShouldSuppressCellularDataAlerts:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasShouldSuppressCellularDataAlerts
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (int)guidanceLevelIgnoringTimeCriterion
{
  if (*(unsigned char *)&self->_flags) {
    return self->_guidanceLevelIgnoringTimeCriterion;
  }
  else {
    return 0;
  }
}

- (void)setGuidanceLevelIgnoringTimeCriterion:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_guidanceLevelIgnoringTimeCriterion = a3;
}

- (void)setHasGuidanceLevelIgnoringTimeCriterion:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasGuidanceLevelIgnoringTimeCriterion
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)guidanceLevelIgnoringTimeCriterionAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E11C8[a3];
  }

  return v3;
}

- (int)StringAsGuidanceLevelIgnoringTimeCriterion:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PREPARE_TO_TRAVEL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRACKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TURN_BY_TURN"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)navigationType
{
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    return self->_navigationType;
  }
  else {
    return 0;
  }
}

- (void)setNavigationType:(int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_navigationType = a3;
}

- (void)setHasNavigationType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasNavigationType
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)navigationTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E11E8[a3];
  }

  return v3;
}

- (int)StringAsNavigationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TURN_BY_TURN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STEPPING"])
  {
    int v4 = 2;
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
  v8.super_class = (Class)GEONavigationGuidanceState;
  int v4 = [(GEONavigationGuidanceState *)&v8 description];
  v5 = [(GEONavigationGuidanceState *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v2 = 0;
    goto LABEL_30;
  }
  [(id)a1 readAll:1];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  char v3 = *(unsigned char *)(a1 + 32);
  if ((v3 & 0x10) != 0)
  {
    uint64_t v4 = *(int *)(a1 + 24);
    if (v4 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E53E1200[v4];
    }
    [v2 setObject:v5 forKey:@"trackedTransportType"];

    char v3 = *(unsigned char *)(a1 + 32);
    if ((v3 & 4) == 0)
    {
LABEL_4:
      if ((v3 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)(a1 + 32) & 4) == 0)
  {
    goto LABEL_4;
  }
  uint64_t v6 = *(int *)(a1 + 16);
  if (v6 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E53E1180[v6];
  }
  [v2 setObject:v7 forKey:@"navigationState"];

  char v3 = *(unsigned char *)(a1 + 32);
  if ((v3 & 2) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_17:
  uint64_t v8 = *(int *)(a1 + 12);
  if (v8 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 12));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E53E11C8[v8];
  }
  [v2 setObject:v9 forKey:@"guidanceLevel"];

  char v3 = *(unsigned char *)(a1 + 32);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 1) == 0) {
      goto LABEL_7;
    }
LABEL_22:
    uint64_t v11 = *(int *)(a1 + 8);
    if (v11 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E53E11C8[v11];
    }
    [v2 setObject:v12 forKey:@"guidanceLevelIgnoringTimeCriterion"];

    if ((*(unsigned char *)(a1 + 32) & 8) == 0) {
      goto LABEL_30;
    }
    goto LABEL_26;
  }
LABEL_21:
  v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 28)];
  [v2 setObject:v10 forKey:@"shouldSuppressCellularDataAlerts"];

  char v3 = *(unsigned char *)(a1 + 32);
  if (v3) {
    goto LABEL_22;
  }
LABEL_7:
  if ((v3 & 8) != 0)
  {
LABEL_26:
    uint64_t v13 = *(int *)(a1 + 20);
    if (v13 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E53E11E8[v13];
    }
    [v2 setObject:v14 forKey:@"navigationType"];
  }
LABEL_30:

  return v2;
}

- (GEONavigationGuidanceState)initWithDictionary:(id)a3
{
  return (GEONavigationGuidanceState *)-[GEONavigationGuidanceState _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      uint64_t v4 = [v3 objectForKeyedSubscript:@"trackedTransportType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = v4;
        if ([v5 isEqualToString:@"AUTOMOBILE"])
        {
          uint64_t v6 = 0;
        }
        else if ([v5 isEqualToString:@"TRANSIT"])
        {
          uint64_t v6 = 1;
        }
        else if ([v5 isEqualToString:@"WALKING"])
        {
          uint64_t v6 = 2;
        }
        else if ([v5 isEqualToString:@"BICYCLE"])
        {
          uint64_t v6 = 3;
        }
        else if ([v5 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
        {
          uint64_t v6 = 4;
        }
        else if ([v5 isEqualToString:@"FERRY"])
        {
          uint64_t v6 = 5;
        }
        else if ([v5 isEqualToString:@"RIDESHARE"])
        {
          uint64_t v6 = 6;
        }
        else
        {
          uint64_t v6 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_23;
        }
        uint64_t v6 = [v4 intValue];
      }
      [a1 setTrackedTransportType:v6];
LABEL_23:

      v7 = [v3 objectForKeyedSubscript:@"navigationState"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"NOT_NAVIGATING"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"PROCEEDING_TO_ROUTE"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"ON_ROUTE"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"OFF_ROUTE_OFF_ROAD"])
        {
          uint64_t v9 = 3;
        }
        else if ([v8 isEqualToString:@"OFF_ROUTE_ON_ROAD"])
        {
          uint64_t v9 = 4;
        }
        else if ([v8 isEqualToString:@"RECALCULATING"])
        {
          uint64_t v9 = 5;
        }
        else if ([v8 isEqualToString:@"END_OF_ROUTE"])
        {
          uint64_t v9 = 6;
        }
        else if ([v8 isEqualToString:@"END_OF_SEGMENT"])
        {
          uint64_t v9 = 7;
        }
        else if ([v8 isEqualToString:@"OUTSIDE_NAVIGABLE_AREA"])
        {
          uint64_t v9 = 8;
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_47;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setNavigationState:v9];
LABEL_47:

      v10 = [v3 objectForKeyedSubscript:@"guidanceLevel"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        if ([v11 isEqualToString:@"NONE"])
        {
          uint64_t v12 = 0;
        }
        else if ([v11 isEqualToString:@"PREPARE_TO_TRAVEL"])
        {
          uint64_t v12 = 1;
        }
        else if ([v11 isEqualToString:@"TRACKING"])
        {
          uint64_t v12 = 2;
        }
        else if ([v11 isEqualToString:@"TURN_BY_TURN"])
        {
          uint64_t v12 = 3;
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_61;
        }
        uint64_t v12 = [v10 intValue];
      }
      [a1 setGuidanceLevel:v12];
LABEL_61:

      uint64_t v13 = [v3 objectForKeyedSubscript:@"shouldSuppressCellularDataAlerts"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setShouldSuppressCellularDataAlerts:", objc_msgSend(v13, "BOOLValue"));
      }

      v14 = [v3 objectForKeyedSubscript:@"guidanceLevelIgnoringTimeCriterion"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;
        if ([v15 isEqualToString:@"NONE"])
        {
          uint64_t v16 = 0;
        }
        else if ([v15 isEqualToString:@"PREPARE_TO_TRAVEL"])
        {
          uint64_t v16 = 1;
        }
        else if ([v15 isEqualToString:@"TRACKING"])
        {
          uint64_t v16 = 2;
        }
        else if ([v15 isEqualToString:@"TURN_BY_TURN"])
        {
          uint64_t v16 = 3;
        }
        else
        {
          uint64_t v16 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_77;
        }
        uint64_t v16 = [v14 intValue];
      }
      [a1 setGuidanceLevelIgnoringTimeCriterion:v16];
LABEL_77:

      v17 = [v3 objectForKeyedSubscript:@"navigationType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v17;
        if ([v18 isEqualToString:@"NONE"])
        {
          uint64_t v19 = 0;
        }
        else if ([v18 isEqualToString:@"TURN_BY_TURN"])
        {
          uint64_t v19 = 1;
        }
        else if ([v18 isEqualToString:@"STEPPING"])
        {
          uint64_t v19 = 2;
        }
        else
        {
          uint64_t v19 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_89:

          goto LABEL_90;
        }
        uint64_t v19 = [v17 intValue];
      }
      [a1 setNavigationType:v19];
      goto LABEL_89;
    }
  }
LABEL_90:

  return a1;
}

- (GEONavigationGuidanceState)initWithJSON:(id)a3
{
  return (GEONavigationGuidanceState *)-[GEONavigationGuidanceState _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEONavigationGuidanceStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONavigationGuidanceStateReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
LABEL_7:
  }
    PBDataWriterWriteInt32Field();
LABEL_8:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEONavigationGuidanceState *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v5[6] = self->_trackedTransportType;
    *((unsigned char *)v5 + 32) |= 0x10u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[4] = self->_navigationState;
  *((unsigned char *)v5 + 32) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v5[3] = self->_guidanceLevel;
  *((unsigned char *)v5 + 32) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)v5 + 28) = self->_shouldSuppressCellularDataAlerts;
  *((unsigned char *)v5 + 32) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v5[2] = self->_guidanceLevelIgnoringTimeCriterion;
  *((unsigned char *)v5 + 32) |= 1u;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_7:
    v5[5] = self->_navigationType;
    *((unsigned char *)v5 + 32) |= 8u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *((_DWORD *)result + 6) = self->_trackedTransportType;
    *((unsigned char *)result + 32) |= 0x10u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_navigationState;
  *((unsigned char *)result + 32) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 3) = self->_guidanceLevel;
  *((unsigned char *)result + 32) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)result + 28) = self->_shouldSuppressCellularDataAlerts;
  *((unsigned char *)result + 32) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 2) = self->_guidanceLevelIgnoringTimeCriterion;
  *((unsigned char *)result + 32) |= 1u;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    return result;
  }
LABEL_7:
  *((_DWORD *)result + 5) = self->_navigationType;
  *((unsigned char *)result + 32) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  [(GEONavigationGuidanceState *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) == 0 || self->_trackedTransportType != *((_DWORD *)v4 + 6)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_navigationState != *((_DWORD *)v4 + 4)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_guidanceLevel != *((_DWORD *)v4 + 3)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x20) != 0)
    {
      if (self->_shouldSuppressCellularDataAlerts)
      {
        if (!*((unsigned char *)v4 + 28)) {
          goto LABEL_34;
        }
        goto LABEL_25;
      }
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_25;
      }
    }
LABEL_34:
    BOOL v5 = 0;
    goto LABEL_35;
  }
  if ((*((unsigned char *)v4 + 32) & 0x20) != 0) {
    goto LABEL_34;
  }
LABEL_25:
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_guidanceLevelIgnoringTimeCriterion != *((_DWORD *)v4 + 2)) {
      goto LABEL_34;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_34;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 8) == 0;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_navigationType != *((_DWORD *)v4 + 5)) {
      goto LABEL_34;
    }
    BOOL v5 = 1;
  }
LABEL_35:

  return v5;
}

- (unint64_t)hash
{
  [(GEONavigationGuidanceState *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    uint64_t v3 = 2654435761 * self->_trackedTransportType;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_navigationState;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_guidanceLevel;
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_shouldSuppressCellularDataAlerts;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_guidanceLevelIgnoringTimeCriterion;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_navigationType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 0x10) != 0)
  {
    self->_trackedTransportType = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_flags |= 0x10u;
    char v4 = *((unsigned char *)v5 + 32);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v5 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_navigationState = *((_DWORD *)v5 + 4);
  *(unsigned char *)&self->_flags |= 4u;
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_guidanceLevel = *((_DWORD *)v5 + 3);
  *(unsigned char *)&self->_flags |= 2u;
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 0x20) == 0)
  {
LABEL_5:
    if ((v4 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_shouldSuppressCellularDataAlerts = *((unsigned char *)v5 + 28);
  *(unsigned char *)&self->_flags |= 0x20u;
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 1) == 0)
  {
LABEL_6:
    if ((v4 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_guidanceLevelIgnoringTimeCriterion = *((_DWORD *)v5 + 2);
  *(unsigned char *)&self->_flags |= 1u;
  if ((*((unsigned char *)v5 + 32) & 8) != 0)
  {
LABEL_7:
    self->_navigationType = *((_DWORD *)v5 + 5);
    *(unsigned char *)&self->_flags |= 8u;
  }
LABEL_8:
}

- (GEONavigationGuidanceState)initWithTransportType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  char v4 = [(GEONavigationGuidanceState *)self init];
  id v5 = v4;
  if (v4)
  {
    [(GEONavigationGuidanceState *)v4 setTrackedTransportType:v3];
    uint64_t v6 = v5;
  }

  return v5;
}

- (GEONavigationGuidanceState)initWithGuidanceLevel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  char v4 = [(GEONavigationGuidanceState *)self init];
  id v5 = v4;
  if (v4)
  {
    [(GEONavigationGuidanceState *)v4 setGuidanceLevel:v3];
    uint64_t v6 = v5;
  }

  return v5;
}

@end