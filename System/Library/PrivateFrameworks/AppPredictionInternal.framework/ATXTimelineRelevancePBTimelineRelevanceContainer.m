@interface ATXTimelineRelevancePBTimelineRelevanceContainer
+ (Class)rotationType;
+ (Class)stackConfigSummaryType;
+ (Class)timelineRelevanceScoreType;
+ (Class)timelineRelevanceSuggestionType;
- (ATXTimelineRelevancePBFeatureVector)featureVector;
- (BOOL)atLeastOnePositiveTimelineRelevanceScore;
- (BOOL)hasAbGroup;
- (BOOL)hasAtLeastOnePositiveTimelineRelevanceScore;
- (BOOL)hasContainerBundleIdentifier;
- (BOOL)hasFeatureVector;
- (BOOL)hasTimelineDonationNilCount;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)rotations;
- (NSMutableArray)stackConfigSummarys;
- (NSMutableArray)timelineRelevanceScores;
- (NSMutableArray)timelineRelevanceSuggestions;
- (NSString)abGroup;
- (NSString)containerBundleIdentifier;
- (NSString)widgetBundleId;
- (NSString)widgetKind;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rotationAtIndex:(unint64_t)a3;
- (id)stackConfigSummaryAtIndex:(unint64_t)a3;
- (id)timelineRelevanceScoreAtIndex:(unint64_t)a3;
- (id)timelineRelevanceSuggestionAtIndex:(unint64_t)a3;
- (id)widgetFamilyAsString:(int)a3;
- (int)StringAsWidgetFamily:(id)a3;
- (int)widgetFamily;
- (int64_t)timelineDonationNilCount;
- (int64_t)timestamp;
- (unint64_t)hash;
- (unint64_t)rotationsCount;
- (unint64_t)stackConfigSummarysCount;
- (unint64_t)timelineRelevanceScoresCount;
- (unint64_t)timelineRelevanceSuggestionsCount;
- (void)addRotation:(id)a3;
- (void)addStackConfigSummary:(id)a3;
- (void)addTimelineRelevanceScore:(id)a3;
- (void)addTimelineRelevanceSuggestion:(id)a3;
- (void)clearRotations;
- (void)clearStackConfigSummarys;
- (void)clearTimelineRelevanceScores;
- (void)clearTimelineRelevanceSuggestions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbGroup:(id)a3;
- (void)setAtLeastOnePositiveTimelineRelevanceScore:(BOOL)a3;
- (void)setContainerBundleIdentifier:(id)a3;
- (void)setFeatureVector:(id)a3;
- (void)setHasAtLeastOnePositiveTimelineRelevanceScore:(BOOL)a3;
- (void)setHasTimelineDonationNilCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setRotations:(id)a3;
- (void)setStackConfigSummarys:(id)a3;
- (void)setTimelineDonationNilCount:(int64_t)a3;
- (void)setTimelineRelevanceScores:(id)a3;
- (void)setTimelineRelevanceSuggestions:(id)a3;
- (void)setTimestamp:(int64_t)a3;
- (void)setWidgetBundleId:(id)a3;
- (void)setWidgetFamily:(int)a3;
- (void)setWidgetKind:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXTimelineRelevancePBTimelineRelevanceContainer

- (BOOL)hasContainerBundleIdentifier
{
  return self->_containerBundleIdentifier != 0;
}

- (id)widgetFamilyAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E68B1A30[a3];
  }
  return v3;
}

- (int)StringAsWidgetFamily:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"WIDGET_FAMILY_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WIDGET_FAMILY_SMALL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WIDGET_FAMILY_MEDIUM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WIDGET_FAMILY_LARGE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"WIDGET_FAMILY_EXTRA_LARGE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setTimelineDonationNilCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timelineDonationNilCount = a3;
}

- (void)setHasTimelineDonationNilCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimelineDonationNilCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAtLeastOnePositiveTimelineRelevanceScore:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_atLeastOnePositiveTimelineRelevanceScore = a3;
}

- (void)setHasAtLeastOnePositiveTimelineRelevanceScore:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAtLeastOnePositiveTimelineRelevanceScore
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)clearTimelineRelevanceScores
{
}

- (void)addTimelineRelevanceScore:(id)a3
{
  id v4 = a3;
  timelineRelevanceScores = self->_timelineRelevanceScores;
  id v8 = v4;
  if (!timelineRelevanceScores)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_timelineRelevanceScores;
    self->_timelineRelevanceScores = v6;

    id v4 = v8;
    timelineRelevanceScores = self->_timelineRelevanceScores;
  }
  [(NSMutableArray *)timelineRelevanceScores addObject:v4];
}

- (unint64_t)timelineRelevanceScoresCount
{
  return [(NSMutableArray *)self->_timelineRelevanceScores count];
}

- (id)timelineRelevanceScoreAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_timelineRelevanceScores objectAtIndex:a3];
}

+ (Class)timelineRelevanceScoreType
{
  return (Class)objc_opt_class();
}

- (void)clearTimelineRelevanceSuggestions
{
}

- (void)addTimelineRelevanceSuggestion:(id)a3
{
  id v4 = a3;
  timelineRelevanceSuggestions = self->_timelineRelevanceSuggestions;
  id v8 = v4;
  if (!timelineRelevanceSuggestions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_timelineRelevanceSuggestions;
    self->_timelineRelevanceSuggestions = v6;

    id v4 = v8;
    timelineRelevanceSuggestions = self->_timelineRelevanceSuggestions;
  }
  [(NSMutableArray *)timelineRelevanceSuggestions addObject:v4];
}

- (unint64_t)timelineRelevanceSuggestionsCount
{
  return [(NSMutableArray *)self->_timelineRelevanceSuggestions count];
}

- (id)timelineRelevanceSuggestionAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_timelineRelevanceSuggestions objectAtIndex:a3];
}

+ (Class)timelineRelevanceSuggestionType
{
  return (Class)objc_opt_class();
}

- (void)clearRotations
{
}

- (void)addRotation:(id)a3
{
  id v4 = a3;
  rotations = self->_rotations;
  id v8 = v4;
  if (!rotations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_rotations;
    self->_rotations = v6;

    id v4 = v8;
    rotations = self->_rotations;
  }
  [(NSMutableArray *)rotations addObject:v4];
}

- (unint64_t)rotationsCount
{
  return [(NSMutableArray *)self->_rotations count];
}

- (id)rotationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rotations objectAtIndex:a3];
}

+ (Class)rotationType
{
  return (Class)objc_opt_class();
}

- (void)setTimestamp:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearStackConfigSummarys
{
}

- (void)addStackConfigSummary:(id)a3
{
  id v4 = a3;
  stackConfigSummarys = self->_stackConfigSummarys;
  id v8 = v4;
  if (!stackConfigSummarys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_stackConfigSummarys;
    self->_stackConfigSummarys = v6;

    id v4 = v8;
    stackConfigSummarys = self->_stackConfigSummarys;
  }
  [(NSMutableArray *)stackConfigSummarys addObject:v4];
}

- (unint64_t)stackConfigSummarysCount
{
  return [(NSMutableArray *)self->_stackConfigSummarys count];
}

- (id)stackConfigSummaryAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_stackConfigSummarys objectAtIndex:a3];
}

+ (Class)stackConfigSummaryType
{
  return (Class)objc_opt_class();
}

- (NSString)abGroup
{
  if (self->_abGroup) {
    return self->_abGroup;
  }
  else {
    return (NSString *)@"default";
  }
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (BOOL)hasFeatureVector
{
  return self->_featureVector != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXTimelineRelevancePBTimelineRelevanceContainer;
  id v4 = [(ATXTimelineRelevancePBTimelineRelevanceContainer *)&v8 description];
  v5 = [(ATXTimelineRelevancePBTimelineRelevanceContainer *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  widgetBundleId = self->_widgetBundleId;
  if (widgetBundleId) {
    [v3 setObject:widgetBundleId forKey:@"widgetBundleId"];
  }
  widgetKind = self->_widgetKind;
  if (widgetKind) {
    [v4 setObject:widgetKind forKey:@"widgetKind"];
  }
  containerBundleIdentifier = self->_containerBundleIdentifier;
  if (containerBundleIdentifier) {
    [v4 setObject:containerBundleIdentifier forKey:@"containerBundleIdentifier"];
  }
  uint64_t widgetFamily = self->_widgetFamily;
  if (widgetFamily >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_widgetFamily);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E68B1A30[widgetFamily];
  }
  [v4 setObject:v9 forKey:@"widgetFamily"];

  char has = (char)self->_has;
  if (has)
  {
    v11 = [NSNumber numberWithLongLong:self->_timelineDonationNilCount];
    [v4 setObject:v11 forKey:@"timelineDonationNilCount"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_atLeastOnePositiveTimelineRelevanceScore];
    [v4 setObject:v12 forKey:@"atLeastOnePositiveTimelineRelevanceScore"];
  }
  if ([(NSMutableArray *)self->_timelineRelevanceScores count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_timelineRelevanceScores, "count"));
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v14 = self->_timelineRelevanceScores;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v58 objects:v65 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v59 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v58 + 1) + 8 * i) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v58 objects:v65 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"timelineRelevanceScore"];
  }
  if ([(NSMutableArray *)self->_timelineRelevanceSuggestions count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_timelineRelevanceSuggestions, "count"));
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v21 = self->_timelineRelevanceSuggestions;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v54 objects:v64 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v55 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v54 + 1) + 8 * j) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v54 objects:v64 count:16];
      }
      while (v23);
    }

    [v4 setObject:v20 forKey:@"timelineRelevanceSuggestion"];
  }
  if ([(NSMutableArray *)self->_rotations count])
  {
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_rotations, "count"));
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v28 = self->_rotations;
    uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v50 objects:v63 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v51;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v51 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(*((void *)&v50 + 1) + 8 * k) dictionaryRepresentation];
          [v27 addObject:v33];
        }
        uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v50 objects:v63 count:16];
      }
      while (v30);
    }

    [v4 setObject:v27 forKey:@"rotation"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v34 = [NSNumber numberWithLongLong:self->_timestamp];
    [v4 setObject:v34 forKey:@"timestamp"];
  }
  if ([(NSMutableArray *)self->_stackConfigSummarys count])
  {
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_stackConfigSummarys, "count"));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v36 = self->_stackConfigSummarys;
    uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v46 objects:v62 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v47;
      do
      {
        for (uint64_t m = 0; m != v38; ++m)
        {
          if (*(void *)v47 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = [*(id *)(*((void *)&v46 + 1) + 8 * m) dictionaryRepresentation];
          [v35 addObject:v41];
        }
        uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v46 objects:v62 count:16];
      }
      while (v38);
    }

    [v4 setObject:v35 forKey:@"stackConfigSummary"];
  }
  abGroup = self->_abGroup;
  if (abGroup) {
    [v4 setObject:abGroup forKey:@"abGroup"];
  }
  featureVector = self->_featureVector;
  if (featureVector)
  {
    v44 = [(ATXTimelineRelevancePBFeatureVector *)featureVector dictionaryRepresentation];
    [v4 setObject:v44 forKey:@"featureVector"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXTimelineRelevancePBTimelineRelevanceContainerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_widgetBundleId) {
    -[ATXTimelineRelevancePBTimelineRelevanceContainer writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_widgetKind) {
    -[ATXTimelineRelevancePBTimelineRelevanceContainer writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (self->_containerBundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v7 = self->_timelineRelevanceScores;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v9);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v12 = self->_timelineRelevanceSuggestions;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v14);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v17 = self->_rotations;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v19);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v22 = self->_stackConfigSummarys;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v24);
  }

  if (self->_abGroup) {
    PBDataWriterWriteStringField();
  }
  if (self->_featureVector) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v22 = a3;
  [v22 setWidgetBundleId:self->_widgetBundleId];
  [v22 setWidgetKind:self->_widgetKind];
  if (self->_containerBundleIdentifier) {
    objc_msgSend(v22, "setContainerBundleIdentifier:");
  }
  *((_DWORD *)v22 + 22) = self->_widgetFamily;
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v22 + 1) = self->_timelineDonationNilCount;
    *((unsigned char *)v22 + 108) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((unsigned char *)v22 + 104) = self->_atLeastOnePositiveTimelineRelevanceScore;
    *((unsigned char *)v22 + 108) |= 4u;
  }
  if ([(ATXTimelineRelevancePBTimelineRelevanceContainer *)self timelineRelevanceScoresCount])
  {
    [v22 clearTimelineRelevanceScores];
    unint64_t v5 = [(ATXTimelineRelevancePBTimelineRelevanceContainer *)self timelineRelevanceScoresCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ATXTimelineRelevancePBTimelineRelevanceContainer *)self timelineRelevanceScoreAtIndex:i];
        [v22 addTimelineRelevanceScore:v8];
      }
    }
  }
  if ([(ATXTimelineRelevancePBTimelineRelevanceContainer *)self timelineRelevanceSuggestionsCount])
  {
    [v22 clearTimelineRelevanceSuggestions];
    unint64_t v9 = [(ATXTimelineRelevancePBTimelineRelevanceContainer *)self timelineRelevanceSuggestionsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        v12 = [(ATXTimelineRelevancePBTimelineRelevanceContainer *)self timelineRelevanceSuggestionAtIndex:j];
        [v22 addTimelineRelevanceSuggestion:v12];
      }
    }
  }
  if ([(ATXTimelineRelevancePBTimelineRelevanceContainer *)self rotationsCount])
  {
    [v22 clearRotations];
    unint64_t v13 = [(ATXTimelineRelevancePBTimelineRelevanceContainer *)self rotationsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(ATXTimelineRelevancePBTimelineRelevanceContainer *)self rotationAtIndex:k];
        [v22 addRotation:v16];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v22 + 2) = self->_timestamp;
    *((unsigned char *)v22 + 108) |= 2u;
  }
  if ([(ATXTimelineRelevancePBTimelineRelevanceContainer *)self stackConfigSummarysCount])
  {
    [v22 clearStackConfigSummarys];
    unint64_t v17 = [(ATXTimelineRelevancePBTimelineRelevanceContainer *)self stackConfigSummarysCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        uint64_t v20 = [(ATXTimelineRelevancePBTimelineRelevanceContainer *)self stackConfigSummaryAtIndex:m];
        [v22 addStackConfigSummary:v20];
      }
    }
  }
  if (self->_abGroup) {
    objc_msgSend(v22, "setAbGroup:");
  }
  v21 = v22;
  if (self->_featureVector)
  {
    objc_msgSend(v22, "setFeatureVector:");
    v21 = v22;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_widgetBundleId copyWithZone:a3];
  v7 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v6;

  uint64_t v8 = [(NSString *)self->_widgetKind copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v8;

  uint64_t v10 = [(NSString *)self->_containerBundleIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  *(_DWORD *)(v5 + 88) = self->_widgetFamily;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timelineDonationNilCount;
    *(unsigned char *)(v5 + 108) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 104) = self->_atLeastOnePositiveTimelineRelevanceScore;
    *(unsigned char *)(v5 + 108) |= 4u;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  unint64_t v13 = self->_timelineRelevanceScores;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v55 != v16) {
          objc_enumerationMutation(v13);
        }
        unint64_t v18 = (void *)[*(id *)(*((void *)&v54 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addTimelineRelevanceScore:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v54 objects:v61 count:16];
    }
    while (v15);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v19 = self->_timelineRelevanceSuggestions;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v51 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = (void *)[*(id *)(*((void *)&v50 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addTimelineRelevanceSuggestion:v24];
      }
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v50 objects:v60 count:16];
    }
    while (v21);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v25 = self->_rotations;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v46 objects:v59 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v47 != v28) {
          objc_enumerationMutation(v25);
        }
        long long v30 = (void *)[*(id *)(*((void *)&v46 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addRotation:v30];
      }
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v46 objects:v59 count:16];
    }
    while (v27);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 108) |= 2u;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v31 = self->_stackConfigSummarys;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v42 objects:v58 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v43;
    do
    {
      for (uint64_t m = 0; m != v33; ++m)
      {
        if (*(void *)v43 != v34) {
          objc_enumerationMutation(v31);
        }
        long long v36 = objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * m), "copyWithZone:", a3, (void)v42);
        [(id)v5 addStackConfigSummary:v36];
      }
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v42 objects:v58 count:16];
    }
    while (v33);
  }

  uint64_t v37 = [(NSString *)self->_abGroup copyWithZone:a3];
  long long v38 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v37;

  id v39 = [(ATXTimelineRelevancePBFeatureVector *)self->_featureVector copyWithZone:a3];
  long long v40 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v39;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  widgetBundleId = self->_widgetBundleId;
  if ((unint64_t)widgetBundleId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](widgetBundleId, "isEqual:")) {
      goto LABEL_39;
    }
  }
  widgetKind = self->_widgetKind;
  if ((unint64_t)widgetKind | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](widgetKind, "isEqual:")) {
      goto LABEL_39;
    }
  }
  containerBundleIdentifier = self->_containerBundleIdentifier;
  if ((unint64_t)containerBundleIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](containerBundleIdentifier, "isEqual:")) {
      goto LABEL_39;
    }
  }
  if (self->_widgetFamily != *((_DWORD *)v4 + 22)) {
    goto LABEL_39;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 108) & 1) == 0 || self->_timelineDonationNilCount != *((void *)v4 + 1)) {
      goto LABEL_39;
    }
  }
  else if (*((unsigned char *)v4 + 108))
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 4) != 0)
    {
      if (self->_atLeastOnePositiveTimelineRelevanceScore)
      {
        if (!*((unsigned char *)v4 + 104)) {
          goto LABEL_39;
        }
        goto LABEL_22;
      }
      if (!*((unsigned char *)v4 + 104)) {
        goto LABEL_22;
      }
    }
LABEL_39:
    char v14 = 0;
    goto LABEL_40;
  }
  if ((*((unsigned char *)v4 + 108) & 4) != 0) {
    goto LABEL_39;
  }
LABEL_22:
  timelineRelevanceScores = self->_timelineRelevanceScores;
  if ((unint64_t)timelineRelevanceScores | *((void *)v4 + 8)
    && !-[NSMutableArray isEqual:](timelineRelevanceScores, "isEqual:"))
  {
    goto LABEL_39;
  }
  timelineRelevanceSuggestions = self->_timelineRelevanceSuggestions;
  if ((unint64_t)timelineRelevanceSuggestions | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](timelineRelevanceSuggestions, "isEqual:")) {
      goto LABEL_39;
    }
  }
  rotations = self->_rotations;
  if ((unint64_t)rotations | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](rotations, "isEqual:")) {
      goto LABEL_39;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 2) == 0 || self->_timestamp != *((void *)v4 + 2)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 2) != 0)
  {
    goto LABEL_39;
  }
  stackConfigSummarys = self->_stackConfigSummarys;
  if ((unint64_t)stackConfigSummarys | *((void *)v4 + 7)
    && !-[NSMutableArray isEqual:](stackConfigSummarys, "isEqual:"))
  {
    goto LABEL_39;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](abGroup, "isEqual:")) {
      goto LABEL_39;
    }
  }
  featureVector = self->_featureVector;
  if ((unint64_t)featureVector | *((void *)v4 + 5)) {
    char v14 = -[ATXTimelineRelevancePBFeatureVector isEqual:](featureVector, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_40:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_widgetBundleId hash];
  NSUInteger v4 = [(NSString *)self->_widgetKind hash];
  NSUInteger v5 = [(NSString *)self->_containerBundleIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_timelineDonationNilCount;
  }
  else {
    uint64_t v6 = 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_atLeastOnePositiveTimelineRelevanceScore;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t widgetFamily = self->_widgetFamily;
  uint64_t v9 = [(NSMutableArray *)self->_timelineRelevanceScores hash];
  uint64_t v10 = [(NSMutableArray *)self->_timelineRelevanceSuggestions hash];
  uint64_t v11 = [(NSMutableArray *)self->_rotations hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v12 = 2654435761 * self->_timestamp;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ (2654435761 * widgetFamily);
  uint64_t v14 = v9 ^ v10 ^ v11 ^ v12 ^ [(NSMutableArray *)self->_stackConfigSummarys hash];
  NSUInteger v15 = v13 ^ v14 ^ [(NSString *)self->_abGroup hash];
  return v15 ^ [(ATXTimelineRelevancePBFeatureVector *)self->_featureVector hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 10)) {
    -[ATXTimelineRelevancePBTimelineRelevanceContainer setWidgetBundleId:](self, "setWidgetBundleId:");
  }
  if (*((void *)v4 + 12)) {
    -[ATXTimelineRelevancePBTimelineRelevanceContainer setWidgetKind:](self, "setWidgetKind:");
  }
  if (*((void *)v4 + 4)) {
    -[ATXTimelineRelevancePBTimelineRelevanceContainer setContainerBundleIdentifier:](self, "setContainerBundleIdentifier:");
  }
  self->_uint64_t widgetFamily = *((_DWORD *)v4 + 22);
  char v5 = *((unsigned char *)v4 + 108);
  if (v5)
  {
    self->_timelineDonationNilCount = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 108);
  }
  if ((v5 & 4) != 0)
  {
    self->_atLeastOnePositiveTimelineRelevanceScore = *((unsigned char *)v4 + 104);
    *(unsigned char *)&self->_has |= 4u;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v6 = *((id *)v4 + 8);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v6);
        }
        [(ATXTimelineRelevancePBTimelineRelevanceContainer *)self addTimelineRelevanceScore:*(void *)(*((void *)&v40 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v8);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v11 = *((id *)v4 + 9);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v11);
        }
        [(ATXTimelineRelevancePBTimelineRelevanceContainer *)self addTimelineRelevanceSuggestion:*(void *)(*((void *)&v36 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v13);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v16 = *((id *)v4 + 6);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        [(ATXTimelineRelevancePBTimelineRelevanceContainer *)self addRotation:*(void *)(*((void *)&v32 + 1) + 8 * k)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v45 count:16];
    }
    while (v18);
  }

  if ((*((unsigned char *)v4 + 108) & 2) != 0)
  {
    self->_timestamp = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v21 = *((id *)v4 + 7);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v44 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        -[ATXTimelineRelevancePBTimelineRelevanceContainer addStackConfigSummary:](self, "addStackConfigSummary:", *(void *)(*((void *)&v28 + 1) + 8 * m), (void)v28);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v44 count:16];
    }
    while (v23);
  }

  if (*((void *)v4 + 3)) {
    -[ATXTimelineRelevancePBTimelineRelevanceContainer setAbGroup:](self, "setAbGroup:");
  }
  featureVector = self->_featureVector;
  uint64_t v27 = *((void *)v4 + 5);
  if (featureVector)
  {
    if (v27) {
      -[ATXTimelineRelevancePBFeatureVector mergeFrom:](featureVector, "mergeFrom:");
    }
  }
  else if (v27)
  {
    -[ATXTimelineRelevancePBTimelineRelevanceContainer setFeatureVector:](self, "setFeatureVector:");
  }
}

- (NSString)widgetBundleId
{
  return self->_widgetBundleId;
}

- (void)setWidgetBundleId:(id)a3
{
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (void)setWidgetKind:(id)a3
{
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (void)setContainerBundleIdentifier:(id)a3
{
}

- (int)widgetFamily
{
  return self->_widgetFamily;
}

- (void)setWidgetFamily:(int)a3
{
  self->_uint64_t widgetFamily = a3;
}

- (int64_t)timelineDonationNilCount
{
  return self->_timelineDonationNilCount;
}

- (BOOL)atLeastOnePositiveTimelineRelevanceScore
{
  return self->_atLeastOnePositiveTimelineRelevanceScore;
}

- (NSMutableArray)timelineRelevanceScores
{
  return self->_timelineRelevanceScores;
}

- (void)setTimelineRelevanceScores:(id)a3
{
}

- (NSMutableArray)timelineRelevanceSuggestions
{
  return self->_timelineRelevanceSuggestions;
}

- (void)setTimelineRelevanceSuggestions:(id)a3
{
}

- (NSMutableArray)rotations
{
  return self->_rotations;
}

- (void)setRotations:(id)a3
{
}

- (int64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)stackConfigSummarys
{
  return self->_stackConfigSummarys;
}

- (void)setStackConfigSummarys:(id)a3
{
}

- (void)setAbGroup:(id)a3
{
}

- (ATXTimelineRelevancePBFeatureVector)featureVector
{
  return self->_featureVector;
}

- (void)setFeatureVector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_widgetBundleId, 0);
  objc_storeStrong((id *)&self->_timelineRelevanceSuggestions, 0);
  objc_storeStrong((id *)&self->_timelineRelevanceScores, 0);
  objc_storeStrong((id *)&self->_stackConfigSummarys, 0);
  objc_storeStrong((id *)&self->_rotations, 0);
  objc_storeStrong((id *)&self->_featureVector, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ATXTimelineRelevancePBTimelineRelevanceContainer writeTo:]", "ATXTimelineRelevancePBTimelineRelevanceContainer.m", 390, "nil != self->_widgetBundleId");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[ATXTimelineRelevancePBTimelineRelevanceContainer writeTo:]", "ATXTimelineRelevancePBTimelineRelevanceContainer.m", 395, "nil != self->_widgetKind");
}

@end