@interface GEORPScorecardUpdate
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAction;
- (BOOL)hasScorecard;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPScorecard)scorecard;
- (GEORPScorecardUpdate)initWithDictionary:(id)a3;
- (GEORPScorecardUpdate)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)actionAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsAction:(id)a3;
- (int)action;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAction:(int)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setScorecard:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPScorecardUpdate

- (BOOL)hasScorecard
{
  return self->_scorecard != 0;
}

- (GEORPScorecard)scorecard
{
  return self->_scorecard;
}

- (void)setScorecard:(id)a3
{
}

- (int)action
{
  if (*(unsigned char *)&self->_flags) {
    return self->_action;
  }
  else {
    return 1;
  }
}

- (void)setAction:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAction
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)actionAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53DF1B8[a3];
  }

  return v3;
}

- (int)StringAsAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_ADD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_REMOVE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_UNMODIFIED"])
  {
    int v4 = 3;
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
  v8.super_class = (Class)GEORPScorecardUpdate;
  int v4 = [(GEORPScorecardUpdate *)&v8 description];
  v5 = [(GEORPScorecardUpdate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPScorecardUpdate _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 scorecard];
    v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"scorecard"];
    }
    if (*(unsigned char *)(a1 + 20))
    {
      uint64_t v8 = *(int *)(a1 + 16);
      if (v8 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E53DF1B8[v8];
      }
      [v4 setObject:v9 forKey:@"action"];
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
  return -[GEORPScorecardUpdate _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPScorecardUpdate)initWithDictionary:(id)a3
{
  return (GEORPScorecardUpdate *)-[GEORPScorecardUpdate _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"scorecard"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [GEORPScorecard alloc];
        if (a3) {
          uint64_t v8 = [(GEORPScorecard *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEORPScorecard *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setScorecard:v8];
      }
      v10 = [v5 objectForKeyedSubscript:@"action"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        if ([v11 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_UNKNOWN"])
        {
          uint64_t v12 = 0;
        }
        else if ([v11 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_ADD"])
        {
          uint64_t v12 = 1;
        }
        else if ([v11 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_REMOVE"])
        {
          uint64_t v12 = 2;
        }
        else if ([v11 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_UNMODIFIED"])
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
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_22:

          goto LABEL_23;
        }
        uint64_t v12 = [v10 intValue];
      }
      [a1 setAction:v12];
      goto LABEL_22;
    }
  }
LABEL_23:

  return a1;
}

- (GEORPScorecardUpdate)initWithJSON:(id)a3
{
  return (GEORPScorecardUpdate *)-[GEORPScorecardUpdate _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPScorecardUpdateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPScorecardUpdateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_scorecard)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEORPScorecardUpdate *)self readAll:0];
  if (self->_scorecard) {
    objc_msgSend(v4, "setScorecard:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 4) = self->_action;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEORPScorecard *)self->_scorecard copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_action;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEORPScorecardUpdate *)self readAll:1];
  [v4 readAll:1];
  scorecard = self->_scorecard;
  if ((unint64_t)scorecard | *((void *)v4 + 1))
  {
    if (!-[GEORPScorecard isEqual:](scorecard, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_action == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  [(GEORPScorecardUpdate *)self readAll:1];
  unint64_t v3 = [(GEORPScorecard *)self->_scorecard hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_action;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v6 = (int *)a3;
  [v6 readAll:0];
  scorecard = self->_scorecard;
  uint64_t v5 = *((void *)v6 + 1);
  if (scorecard)
  {
    if (v5) {
      -[GEORPScorecard mergeFrom:](scorecard, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPScorecardUpdate setScorecard:](self, "setScorecard:");
  }
  if (v6[5])
  {
    self->_action = v6[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
}

@end