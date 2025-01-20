@interface GEOPDPlaceSummaryLayoutUnitHours
+ (BOOL)isValid:(id)a3;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceSummaryLayoutUnitHours)initWithDictionary:(id)a3;
- (GEOPDPlaceSummaryLayoutUnitHours)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)allowedHoursStatesAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsAllowedHoursStates:(id)a3;
- (int)StringAsType:(id)a3;
- (int)allowedHoursStateAtIndex:(unint64_t)a3;
- (int)allowedHoursStates;
- (int)type;
- (unint64_t)allowedHoursStatesCount;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addAllowedHoursState:(int)a3;
- (void)clearAllowedHoursStates;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAllowedHoursStates:(int *)a3 count:(unint64_t)a4;
- (void)setHasType:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceSummaryLayoutUnitHours

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDPlaceSummaryLayoutUnitHours;
  [(GEOPDPlaceSummaryLayoutUnitHours *)&v3 dealloc];
}

- (int)type
{
  if (*(unsigned char *)&self->_flags) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = off_1E53E6428[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STATE_AND_HOURS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATE_IF_NOT_OPEN"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)allowedHoursStatesCount
{
  return self->_allowedHoursStates.count;
}

- (int)allowedHoursStates
{
  return self->_allowedHoursStates.list;
}

- (void)clearAllowedHoursStates
{
}

- (void)addAllowedHoursState:(int)a3
{
}

- (int)allowedHoursStateAtIndex:(unint64_t)a3
{
  p_allowedHoursStates = &self->_allowedHoursStates;
  unint64_t count = self->_allowedHoursStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_allowedHoursStates->list[a3];
}

- (void)setAllowedHoursStates:(int *)a3 count:(unint64_t)a4
{
}

- (id)allowedHoursStatesAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E6440[a3];
  }

  return v3;
}

- (int)StringAsAllowedHoursStates:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CURRENTLY_CLOSED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TEMPORARILY_CLOSED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PERMANENTLY_CLOSED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CURRENTLY_OPEN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"OPENING_SOON"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CLOSING_SOON"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ANY"])
  {
    int v4 = 7;
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
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutUnitHours;
  int v4 = [(GEOPDPlaceSummaryLayoutUnitHours *)&v8 description];
  v5 = [(GEOPDPlaceSummaryLayoutUnitHours *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutUnitHours _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 36))
    {
      uint64_t v5 = *(int *)(a1 + 32);
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53E6428[v5];
      }
      [v4 setObject:v6 forKey:@"type"];
    }
    if (*(void *)(a1 + 16))
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v8 = (void *)(a1 + 8);
      if (*(void *)(a1 + 16))
      {
        unint64_t v9 = 0;
        do
        {
          uint64_t v10 = *(int *)(*v8 + 4 * v9);
          if (v10 >= 8)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
            v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v11 = off_1E53E6440[v10];
          }
          [v7 addObject:v11];

          ++v9;
          objc_super v8 = (void *)(a1 + 8);
        }
        while (v9 < *(void *)(a1 + 16));
      }
      if (a2) {
        v12 = @"allowedHoursState";
      }
      else {
        v12 = @"allowed_hours_state";
      }
      [v4 setObject:v7 forKey:v12];
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
  return -[GEOPDPlaceSummaryLayoutUnitHours _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryLayoutUnitHours)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitHours *)-[GEOPDPlaceSummaryLayoutUnitHours _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_50;
  }
  v6 = (void *)[a1 init];
  if (v6)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      if ([v8 isEqualToString:@"UNKNOWN"])
      {
        uint64_t v9 = 0;
      }
      else if ([v8 isEqualToString:@"STATE_AND_HOURS"])
      {
        uint64_t v9 = 1;
      }
      else if ([v8 isEqualToString:@"STATE_IF_NOT_OPEN"])
      {
        uint64_t v9 = 2;
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_15:

        if (a3) {
          uint64_t v10 = @"allowedHoursState";
        }
        else {
          uint64_t v10 = @"allowed_hours_state";
        }
        v11 = [v5 objectForKeyedSubscript:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v21 = v11;
          id v22 = v5;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (!v13) {
            goto LABEL_48;
          }
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v24;
          while (1)
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v24 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v18 = v17;
                if ([v18 isEqualToString:@"UNKNOWN"])
                {
                  uint64_t v19 = 0;
                }
                else if ([v18 isEqualToString:@"CURRENTLY_CLOSED"])
                {
                  uint64_t v19 = 1;
                }
                else if ([v18 isEqualToString:@"TEMPORARILY_CLOSED"])
                {
                  uint64_t v19 = 2;
                }
                else if ([v18 isEqualToString:@"PERMANENTLY_CLOSED"])
                {
                  uint64_t v19 = 3;
                }
                else if ([v18 isEqualToString:@"CURRENTLY_OPEN"])
                {
                  uint64_t v19 = 4;
                }
                else if ([v18 isEqualToString:@"OPENING_SOON"])
                {
                  uint64_t v19 = 5;
                }
                else if ([v18 isEqualToString:@"CLOSING_SOON"])
                {
                  uint64_t v19 = 6;
                }
                else if ([v18 isEqualToString:@"ANY"])
                {
                  uint64_t v19 = 7;
                }
                else
                {
                  uint64_t v19 = 0;
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_46;
                }
                uint64_t v19 = [v17 intValue];
              }
              objc_msgSend(v6, "addAllowedHoursState:", v19, v21, v22, (void)v23);
LABEL_46:
              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
            if (!v14)
            {
LABEL_48:

              v11 = v21;
              id v5 = v22;
              break;
            }
          }
        }

        goto LABEL_50;
      }
      uint64_t v9 = [v7 intValue];
    }
    [v6 setType:v9];
    goto LABEL_15;
  }
LABEL_50:

  return v6;
}

- (GEOPDPlaceSummaryLayoutUnitHours)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitHours *)-[GEOPDPlaceSummaryLayoutUnitHours _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitHoursIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitHoursReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  p_allowedHoursStates = &self->_allowedHoursStates;
  if (p_allowedHoursStates->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v7;
      ++v6;
    }
    while (v6 < p_allowedHoursStates->count);
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  [(GEOPDPlaceSummaryLayoutUnitHours *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v7[8] = self->_type;
    *((unsigned char *)v7 + 36) |= 1u;
  }
  if ([(GEOPDPlaceSummaryLayoutUnitHours *)self allowedHoursStatesCount])
  {
    [v7 clearAllowedHoursStates];
    unint64_t v4 = [(GEOPDPlaceSummaryLayoutUnitHours *)self allowedHoursStatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addAllowedHoursState:", -[GEOPDPlaceSummaryLayoutUnitHours allowedHoursStateAtIndex:](self, "allowedHoursStateAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v5 = (void *)v4;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v4 + 32) = self->_type;
    *(unsigned char *)(v4 + 36) |= 1u;
  }
  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEOPDPlaceSummaryLayoutUnitHours *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_8;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_8:
    char IsEqual = 0;
    goto LABEL_9;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_9:

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOPDPlaceSummaryLayoutUnitHours *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  return PBRepeatedInt32Hash() ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v7 = (int *)a3;
  [v7 readAll:0];
  if (v7[9])
  {
    self->_type = v7[8];
    *(unsigned char *)&self->_flags |= 1u;
  }
  uint64_t v4 = [v7 allowedHoursStatesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOPDPlaceSummaryLayoutUnitHours addAllowedHoursState:](self, "addAllowedHoursState:", [v7 allowedHoursStateAtIndex:i]);
  }
}

@end