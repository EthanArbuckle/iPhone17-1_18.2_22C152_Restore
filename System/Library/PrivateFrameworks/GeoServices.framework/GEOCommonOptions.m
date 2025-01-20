@interface GEOCommonOptions
+ (BOOL)isValid:(id)a3;
- (BOOL)excludeGuidance;
- (BOOL)hasExcludeGuidance;
- (BOOL)hasIncludeSnapScoreMetadataDebug;
- (BOOL)hasIncludeSummaryForPredictedDestination;
- (BOOL)hasIncludeTravelTimeAggressive;
- (BOOL)hasIncludeTravelTimeConservative;
- (BOOL)hasIncludeTravelTimeEstimate;
- (BOOL)hasSupportsArMode;
- (BOOL)includeSnapScoreMetadataDebug;
- (BOOL)includeSummaryForPredictedDestination;
- (BOOL)includeTravelTimeAggressive;
- (BOOL)includeTravelTimeConservative;
- (BOOL)includeTravelTimeEstimate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsArMode;
- (GEOCommonOptions)initWithDictionary:(id)a3;
- (GEOCommonOptions)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExcludeGuidance:(BOOL)a3;
- (void)setHasExcludeGuidance:(BOOL)a3;
- (void)setHasIncludeSnapScoreMetadataDebug:(BOOL)a3;
- (void)setHasIncludeSummaryForPredictedDestination:(BOOL)a3;
- (void)setHasIncludeTravelTimeAggressive:(BOOL)a3;
- (void)setHasIncludeTravelTimeConservative:(BOOL)a3;
- (void)setHasIncludeTravelTimeEstimate:(BOOL)a3;
- (void)setHasSupportsArMode:(BOOL)a3;
- (void)setIncludeSnapScoreMetadataDebug:(BOOL)a3;
- (void)setIncludeSummaryForPredictedDestination:(BOOL)a3;
- (void)setIncludeTravelTimeAggressive:(BOOL)a3;
- (void)setIncludeTravelTimeConservative:(BOOL)a3;
- (void)setIncludeTravelTimeEstimate:(BOOL)a3;
- (void)setSupportsArMode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCommonOptions

- (BOOL)includeTravelTimeAggressive
{
  return self->_includeTravelTimeAggressive;
}

- (void)setIncludeTravelTimeAggressive:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_includeTravelTimeAggressive = a3;
}

- (void)setHasIncludeTravelTimeAggressive:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIncludeTravelTimeAggressive
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)includeTravelTimeEstimate
{
  return (*(unsigned char *)&self->_flags & 0x20) == 0 || self->_includeTravelTimeEstimate;
}

- (void)setIncludeTravelTimeEstimate:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_includeTravelTimeEstimate = a3;
}

- (void)setHasIncludeTravelTimeEstimate:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasIncludeTravelTimeEstimate
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (BOOL)includeTravelTimeConservative
{
  return self->_includeTravelTimeConservative;
}

- (void)setIncludeTravelTimeConservative:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_includeTravelTimeConservative = a3;
}

- (void)setHasIncludeTravelTimeConservative:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIncludeTravelTimeConservative
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (BOOL)excludeGuidance
{
  return (*(unsigned char *)&self->_flags & 1) != 0 && self->_excludeGuidance;
}

- (void)setExcludeGuidance:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_excludeGuidance = a3;
}

- (void)setHasExcludeGuidance:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasExcludeGuidance
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)includeSummaryForPredictedDestination
{
  return (*(unsigned char *)&self->_flags & 4) != 0 && self->_includeSummaryForPredictedDestination;
}

- (void)setIncludeSummaryForPredictedDestination:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_includeSummaryForPredictedDestination = a3;
}

- (void)setHasIncludeSummaryForPredictedDestination:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIncludeSummaryForPredictedDestination
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)includeSnapScoreMetadataDebug
{
  return self->_includeSnapScoreMetadataDebug;
}

- (void)setIncludeSnapScoreMetadataDebug:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_includeSnapScoreMetadataDebug = a3;
}

- (void)setHasIncludeSnapScoreMetadataDebug:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIncludeSnapScoreMetadataDebug
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)supportsArMode
{
  return self->_supportsArMode;
}

- (void)setSupportsArMode:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x40u;
  self->_supportsArMode = a3;
}

- (void)setHasSupportsArMode:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasSupportsArMode
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCommonOptions;
  v4 = [(GEOCommonOptions *)&v8 description];
  v5 = [(GEOCommonOptions *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCommonOptions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_17;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 8) != 0)
  {
    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 19)];
    if (a2) {
      v16 = @"includeTravelTimeAggressive";
    }
    else {
      v16 = @"include_travel_time_aggressive";
    }
    [v4 setObject:v15 forKey:v16];

    char v5 = *(unsigned char *)(a1 + 24);
    if ((v5 & 0x20) == 0)
    {
LABEL_4:
      if ((v5 & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)(a1 + 24) & 0x20) == 0)
  {
    goto LABEL_4;
  }
  v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 21)];
  if (a2) {
    v18 = @"includeTravelTimeEstimate";
  }
  else {
    v18 = @"include_travel_time_estimate";
  }
  [v4 setObject:v17 forKey:v18];

  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_28:
  v19 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 20)];
  if (a2) {
    v20 = @"includeTravelTimeConservative";
  }
  else {
    v20 = @"include_travel_time_conservative";
  }
  [v4 setObject:v19 forKey:v20];

  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_36;
  }
LABEL_32:
  v21 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 16)];
  if (a2) {
    v22 = @"excludeGuidance";
  }
  else {
    v22 = @"exclude_guidance";
  }
  [v4 setObject:v21 forKey:v22];

  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_36:
  v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 18)];
  if (a2) {
    v24 = @"includeSummaryForPredictedDestination";
  }
  else {
    v24 = @"include_summary_for_predicted_destination";
  }
  [v4 setObject:v23 forKey:v24];

  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
LABEL_40:
  v25 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 17)];
  if (a2) {
    v26 = @"includeSnapScoreMetadataDebug";
  }
  else {
    v26 = @"include_snap_score_metadata_debug";
  }
  [v4 setObject:v25 forKey:v26];

  if ((*(unsigned char *)(a1 + 24) & 0x40) != 0)
  {
LABEL_9:
    v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 22)];
    if (a2) {
      v7 = @"supportsArMode";
    }
    else {
      v7 = @"supports_ar_mode";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_13:
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    v9 = [v8 dictionaryRepresentation];
    v10 = v9;
    if (a2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __46__GEOCommonOptions__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E53D8860;
      id v12 = v11;
      id v28 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v27];
      id v13 = v12;

      v10 = v13;
    }
    [v4 setObject:v10 forKey:@"Unknown Fields"];
  }
LABEL_17:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCommonOptions _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOCommonOptions__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOCommonOptions)initWithDictionary:(id)a3
{
  return (GEOCommonOptions *)-[GEOCommonOptions _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"includeTravelTimeAggressive";
      }
      else {
        v6 = @"include_travel_time_aggressive";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIncludeTravelTimeAggressive:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"includeTravelTimeEstimate";
      }
      else {
        objc_super v8 = @"include_travel_time_estimate";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIncludeTravelTimeEstimate:", objc_msgSend(v9, "BOOLValue"));
      }

      if (a3) {
        id v10 = @"includeTravelTimeConservative";
      }
      else {
        id v10 = @"include_travel_time_conservative";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIncludeTravelTimeConservative:", objc_msgSend(v11, "BOOLValue"));
      }

      if (a3) {
        id v12 = @"excludeGuidance";
      }
      else {
        id v12 = @"exclude_guidance";
      }
      id v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setExcludeGuidance:", objc_msgSend(v13, "BOOLValue"));
      }

      if (a3) {
        v14 = @"includeSummaryForPredictedDestination";
      }
      else {
        v14 = @"include_summary_for_predicted_destination";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIncludeSummaryForPredictedDestination:", objc_msgSend(v15, "BOOLValue"));
      }

      if (a3) {
        v16 = @"includeSnapScoreMetadataDebug";
      }
      else {
        v16 = @"include_snap_score_metadata_debug";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIncludeSnapScoreMetadataDebug:", objc_msgSend(v17, "BOOLValue"));
      }

      if (a3) {
        v18 = @"supportsArMode";
      }
      else {
        v18 = @"supports_ar_mode";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSupportsArMode:", objc_msgSend(v19, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOCommonOptions)initWithJSON:(id)a3
{
  return (GEOCommonOptions *)-[GEOCommonOptions _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCommonOptionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCommonOptionsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_5:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOCommonOptions *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v5[19] = self->_includeTravelTimeAggressive;
    v5[24] |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v5[21] = self->_includeTravelTimeEstimate;
  v5[24] |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v5[20] = self->_includeTravelTimeConservative;
  v5[24] |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_5:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v5[16] = self->_excludeGuidance;
  v5[24] |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v5[18] = self->_includeSummaryForPredictedDestination;
  v5[24] |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v5[17] = self->_includeSnapScoreMetadataDebug;
  v5[24] |= 2u;
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
LABEL_8:
    v5[22] = self->_supportsArMode;
    v5[24] |= 0x40u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(unsigned char *)(v4 + 19) = self->_includeTravelTimeAggressive;
    *(unsigned char *)(v4 + 24) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v4 + 21) = self->_includeTravelTimeEstimate;
  *(unsigned char *)(v4 + 24) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *(unsigned char *)(v4 + 20) = self->_includeTravelTimeConservative;
  *(unsigned char *)(v4 + 24) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_5:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(unsigned char *)(v4 + 16) = self->_excludeGuidance;
  *(unsigned char *)(v4 + 24) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    *(unsigned char *)(v4 + 17) = self->_includeSnapScoreMetadataDebug;
    *(unsigned char *)(v4 + 24) |= 2u;
    if ((*(unsigned char *)&self->_flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_14:
  *(unsigned char *)(v4 + 18) = self->_includeSummaryForPredictedDestination;
  *(unsigned char *)(v4 + 24) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((flags & 0x40) != 0)
  {
LABEL_8:
    *(unsigned char *)(v4 + 22) = self->_supportsArMode;
    *(unsigned char *)(v4 + 24) |= 0x40u;
  }
LABEL_9:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  [(GEOCommonOptions *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((v4[24] & 8) == 0) {
      goto LABEL_52;
    }
    if (self->_includeTravelTimeAggressive)
    {
      if (!v4[19]) {
        goto LABEL_52;
      }
    }
    else if (v4[19])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[24] & 8) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((v4[24] & 0x20) == 0) {
      goto LABEL_52;
    }
    if (self->_includeTravelTimeEstimate)
    {
      if (!v4[21]) {
        goto LABEL_52;
      }
    }
    else if (v4[21])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[24] & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((v4[24] & 0x10) == 0) {
      goto LABEL_52;
    }
    if (self->_includeTravelTimeConservative)
    {
      if (!v4[20]) {
        goto LABEL_52;
      }
    }
    else if (v4[20])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[24] & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[24] & 1) == 0) {
      goto LABEL_52;
    }
    if (self->_excludeGuidance)
    {
      if (!v4[16]) {
        goto LABEL_52;
      }
    }
    else if (v4[16])
    {
      goto LABEL_52;
    }
  }
  else if (v4[24])
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v4[24] & 4) == 0) {
      goto LABEL_52;
    }
    if (self->_includeSummaryForPredictedDestination)
    {
      if (!v4[18]) {
        goto LABEL_52;
      }
    }
    else if (v4[18])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[24] & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[24] & 2) == 0) {
      goto LABEL_52;
    }
    if (self->_includeSnapScoreMetadataDebug)
    {
      if (!v4[17]) {
        goto LABEL_52;
      }
    }
    else if (v4[17])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[24] & 2) != 0)
  {
    goto LABEL_52;
  }
  BOOL v5 = (v4[24] & 0x40) == 0;
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    if ((v4[24] & 0x40) != 0)
    {
      if (self->_supportsArMode)
      {
        if (!v4[22]) {
          goto LABEL_52;
        }
      }
      else if (v4[22])
      {
        goto LABEL_52;
      }
      BOOL v5 = 1;
      goto LABEL_53;
    }
LABEL_52:
    BOOL v5 = 0;
  }
LABEL_53:

  return v5;
}

- (unint64_t)hash
{
  [(GEOCommonOptions *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v3 = 2654435761 * self->_includeTravelTimeAggressive;
    if ((*(unsigned char *)&self->_flags & 0x20) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_includeTravelTimeEstimate;
      if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_includeTravelTimeConservative;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v5 = 0;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_excludeGuidance;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_includeSummaryForPredictedDestination;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_13:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_includeSnapScoreMetadataDebug;
  if ((*(unsigned char *)&self->_flags & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_supportsArMode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (BOOL *)a3;
  [v5 readAll:0];
  BOOL v4 = v5[24];
  if ((v4 & 8) != 0)
  {
    self->_includeTravelTimeAggressive = v5[19];
    *(unsigned char *)&self->_flags |= 8u;
    BOOL v4 = v5[24];
    if ((v4 & 0x20) == 0)
    {
LABEL_3:
      if ((v4 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v5[24] & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_includeTravelTimeEstimate = v5[21];
  *(unsigned char *)&self->_flags |= 0x20u;
  BOOL v4 = v5[24];
  if ((v4 & 0x10) == 0)
  {
LABEL_4:
    if (!v4) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_includeTravelTimeConservative = v5[20];
  *(unsigned char *)&self->_flags |= 0x10u;
  BOOL v4 = v5[24];
  if (!v4)
  {
LABEL_5:
    if ((v4 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_excludeGuidance = v5[16];
  *(unsigned char *)&self->_flags |= 1u;
  BOOL v4 = v5[24];
  if ((v4 & 4) == 0)
  {
LABEL_6:
    if ((v4 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_includeSummaryForPredictedDestination = v5[18];
  *(unsigned char *)&self->_flags |= 4u;
  BOOL v4 = v5[24];
  if ((v4 & 2) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_includeSnapScoreMetadataDebug = v5[17];
  *(unsigned char *)&self->_flags |= 2u;
  if ((v5[24] & 0x40) != 0)
  {
LABEL_8:
    self->_supportsArMode = v5[22];
    *(unsigned char *)&self->_flags |= 0x40u;
  }
LABEL_9:
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
    [(GEOCommonOptions *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end