@interface ATXPBModeConfigurationUIFlowLoggingEvent
+ (Class)candidateEntityIdentifiersType;
+ (Class)currentEntityIdentifiersType;
+ (Class)previousEntityIdentifiersType;
+ (Class)suggestedEntityIdentifiersType;
- (BOOL)hasDndModeUUID;
- (BOOL)hasModeConfigurationEntityType;
- (BOOL)hasModeConfigurationType;
- (BOOL)hasModeConfigurationUI;
- (BOOL)hasSecondsSinceReferenceDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)candidateEntityIdentifiers;
- (NSMutableArray)currentEntityIdentifiers;
- (NSMutableArray)previousEntityIdentifiers;
- (NSMutableArray)suggestedEntityIdentifiers;
- (NSString)dndModeUUID;
- (double)secondsSinceReferenceDate;
- (id)candidateEntityIdentifiersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentEntityIdentifiersAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (id)modeConfigurationEntityTypeAsString:(int)a3;
- (id)modeConfigurationTypeAsString:(int)a3;
- (id)modeConfigurationUIAsString:(int)a3;
- (id)previousEntityIdentifiersAtIndex:(unint64_t)a3;
- (id)suggestedEntityIdentifiersAtIndex:(unint64_t)a3;
- (int)StringAsModeConfigurationEntityType:(id)a3;
- (int)StringAsModeConfigurationType:(id)a3;
- (int)StringAsModeConfigurationUI:(id)a3;
- (int)modeConfigurationEntityType;
- (int)modeConfigurationType;
- (int)modeConfigurationUI;
- (unint64_t)candidateEntityIdentifiersCount;
- (unint64_t)currentEntityIdentifiersCount;
- (unint64_t)hash;
- (unint64_t)previousEntityIdentifiersCount;
- (unint64_t)suggestedEntityIdentifiersCount;
- (void)addCandidateEntityIdentifiers:(id)a3;
- (void)addCurrentEntityIdentifiers:(id)a3;
- (void)addPreviousEntityIdentifiers:(id)a3;
- (void)addSuggestedEntityIdentifiers:(id)a3;
- (void)clearCandidateEntityIdentifiers;
- (void)clearCurrentEntityIdentifiers;
- (void)clearPreviousEntityIdentifiers;
- (void)clearSuggestedEntityIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCandidateEntityIdentifiers:(id)a3;
- (void)setCurrentEntityIdentifiers:(id)a3;
- (void)setDndModeUUID:(id)a3;
- (void)setHasModeConfigurationEntityType:(BOOL)a3;
- (void)setHasModeConfigurationType:(BOOL)a3;
- (void)setHasModeConfigurationUI:(BOOL)a3;
- (void)setHasSecondsSinceReferenceDate:(BOOL)a3;
- (void)setModeConfigurationEntityType:(int)a3;
- (void)setModeConfigurationType:(int)a3;
- (void)setModeConfigurationUI:(int)a3;
- (void)setPreviousEntityIdentifiers:(id)a3;
- (void)setSecondsSinceReferenceDate:(double)a3;
- (void)setSuggestedEntityIdentifiers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBModeConfigurationUIFlowLoggingEvent

- (void)setSecondsSinceReferenceDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_secondsSinceReferenceDate = a3;
}

- (void)setHasSecondsSinceReferenceDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSecondsSinceReferenceDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDndModeUUID
{
  return self->_dndModeUUID != 0;
}

- (int)modeConfigurationUI
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_modeConfigurationUI;
  }
  else {
    return 0;
  }
}

- (void)setModeConfigurationUI:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_modeConfigurationUI = a3;
}

- (void)setHasModeConfigurationUI:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasModeConfigurationUI
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)modeConfigurationUIAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5D06838[a3];
  }

  return v3;
}

- (int)StringAsModeConfigurationUI:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Setup"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Settings"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"OnBoarding"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Total"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)modeConfigurationEntityType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_modeConfigurationEntityType;
  }
  else {
    return 0;
  }
}

- (void)setModeConfigurationEntityType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_modeConfigurationEntityType = a3;
}

- (void)setHasModeConfigurationEntityType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasModeConfigurationEntityType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)modeConfigurationEntityTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5D06858[a3];
  }

  return v3;
}

- (int)StringAsModeConfigurationEntityType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Apps"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Contacts"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Total"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearPreviousEntityIdentifiers
{
}

- (void)addPreviousEntityIdentifiers:(id)a3
{
  id v4 = a3;
  previousEntityIdentifiers = self->_previousEntityIdentifiers;
  id v8 = v4;
  if (!previousEntityIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_previousEntityIdentifiers;
    self->_previousEntityIdentifiers = v6;

    id v4 = v8;
    previousEntityIdentifiers = self->_previousEntityIdentifiers;
  }
  [(NSMutableArray *)previousEntityIdentifiers addObject:v4];
}

- (unint64_t)previousEntityIdentifiersCount
{
  return [(NSMutableArray *)self->_previousEntityIdentifiers count];
}

- (id)previousEntityIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_previousEntityIdentifiers objectAtIndex:a3];
}

+ (Class)previousEntityIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)clearSuggestedEntityIdentifiers
{
}

- (void)addSuggestedEntityIdentifiers:(id)a3
{
  id v4 = a3;
  suggestedEntityIdentifiers = self->_suggestedEntityIdentifiers;
  id v8 = v4;
  if (!suggestedEntityIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_suggestedEntityIdentifiers;
    self->_suggestedEntityIdentifiers = v6;

    id v4 = v8;
    suggestedEntityIdentifiers = self->_suggestedEntityIdentifiers;
  }
  [(NSMutableArray *)suggestedEntityIdentifiers addObject:v4];
}

- (unint64_t)suggestedEntityIdentifiersCount
{
  return [(NSMutableArray *)self->_suggestedEntityIdentifiers count];
}

- (id)suggestedEntityIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_suggestedEntityIdentifiers objectAtIndex:a3];
}

+ (Class)suggestedEntityIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)clearCurrentEntityIdentifiers
{
}

- (void)addCurrentEntityIdentifiers:(id)a3
{
  id v4 = a3;
  currentEntityIdentifiers = self->_currentEntityIdentifiers;
  id v8 = v4;
  if (!currentEntityIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_currentEntityIdentifiers;
    self->_currentEntityIdentifiers = v6;

    id v4 = v8;
    currentEntityIdentifiers = self->_currentEntityIdentifiers;
  }
  [(NSMutableArray *)currentEntityIdentifiers addObject:v4];
}

- (unint64_t)currentEntityIdentifiersCount
{
  return [(NSMutableArray *)self->_currentEntityIdentifiers count];
}

- (id)currentEntityIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_currentEntityIdentifiers objectAtIndex:a3];
}

+ (Class)currentEntityIdentifiersType
{
  return (Class)objc_opt_class();
}

- (int)modeConfigurationType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_modeConfigurationType;
  }
  else {
    return 0;
  }
}

- (void)setModeConfigurationType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_modeConfigurationType = a3;
}

- (void)setHasModeConfigurationType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasModeConfigurationType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)modeConfigurationTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5D06870[a3];
  }

  return v3;
}

- (int)StringAsModeConfigurationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Allow"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Deny"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Total"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearCandidateEntityIdentifiers
{
}

- (void)addCandidateEntityIdentifiers:(id)a3
{
  id v4 = a3;
  candidateEntityIdentifiers = self->_candidateEntityIdentifiers;
  id v8 = v4;
  if (!candidateEntityIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_candidateEntityIdentifiers;
    self->_candidateEntityIdentifiers = v6;

    id v4 = v8;
    candidateEntityIdentifiers = self->_candidateEntityIdentifiers;
  }
  [(NSMutableArray *)candidateEntityIdentifiers addObject:v4];
}

- (unint64_t)candidateEntityIdentifiersCount
{
  return [(NSMutableArray *)self->_candidateEntityIdentifiers count];
}

- (id)candidateEntityIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_candidateEntityIdentifiers objectAtIndex:a3];
}

+ (Class)candidateEntityIdentifiersType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBModeConfigurationUIFlowLoggingEvent;
  id v4 = [(ATXPBModeConfigurationUIFlowLoggingEvent *)&v8 description];
  v5 = [(ATXPBModeConfigurationUIFlowLoggingEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithDouble:self->_secondsSinceReferenceDate];
    [v3 setObject:v4 forKey:@"secondsSinceReferenceDate"];
  }
  dndModeUUID = self->_dndModeUUID;
  if (dndModeUUID) {
    [v3 setObject:dndModeUUID forKey:@"dndModeUUID"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t modeConfigurationUI = self->_modeConfigurationUI;
    if (modeConfigurationUI >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_modeConfigurationUI);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E5D06838[modeConfigurationUI];
    }
    [v3 setObject:v8 forKey:@"modeConfigurationUI"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t modeConfigurationEntityType = self->_modeConfigurationEntityType;
    if (modeConfigurationEntityType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_modeConfigurationEntityType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E5D06858[modeConfigurationEntityType];
    }
    [v3 setObject:v10 forKey:@"modeConfigurationEntityType"];
  }
  previousEntityIdentifiers = self->_previousEntityIdentifiers;
  if (previousEntityIdentifiers) {
    [v3 setObject:previousEntityIdentifiers forKey:@"previousEntityIdentifiers"];
  }
  suggestedEntityIdentifiers = self->_suggestedEntityIdentifiers;
  if (suggestedEntityIdentifiers) {
    [v3 setObject:suggestedEntityIdentifiers forKey:@"suggestedEntityIdentifiers"];
  }
  currentEntityIdentifiers = self->_currentEntityIdentifiers;
  if (currentEntityIdentifiers) {
    [v3 setObject:currentEntityIdentifiers forKey:@"currentEntityIdentifiers"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t modeConfigurationType = self->_modeConfigurationType;
    if (modeConfigurationType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_modeConfigurationType);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E5D06870[modeConfigurationType];
    }
    [v3 setObject:v15 forKey:@"modeConfigurationType"];
  }
  candidateEntityIdentifiers = self->_candidateEntityIdentifiers;
  if (candidateEntityIdentifiers) {
    [v3 setObject:candidateEntityIdentifiers forKey:@"candidateEntityIdentifiers"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBModeConfigurationUIFlowLoggingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_dndModeUUID) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v6 = self->_previousEntityIdentifiers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v8);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v11 = self->_suggestedEntityIdentifiers;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v13);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v16 = self->_currentEntityIdentifiers;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }
    while (v18);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v21 = self->_candidateEntityIdentifiers;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v26 objects:v42 count:16];
    }
    while (v23);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_secondsSinceReferenceDate;
    *((unsigned char *)v4 + 72) |= 1u;
  }
  uint64_t v22 = v4;
  if (self->_dndModeUUID)
  {
    objc_msgSend(v4, "setDndModeUUID:");
    id v4 = v22;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_modeConfigurationUI;
    *((unsigned char *)v4 + 72) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_modeConfigurationEntityType;
    *((unsigned char *)v4 + 72) |= 2u;
  }
  if ([(ATXPBModeConfigurationUIFlowLoggingEvent *)self previousEntityIdentifiersCount])
  {
    [v22 clearPreviousEntityIdentifiers];
    unint64_t v6 = [(ATXPBModeConfigurationUIFlowLoggingEvent *)self previousEntityIdentifiersCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(ATXPBModeConfigurationUIFlowLoggingEvent *)self previousEntityIdentifiersAtIndex:i];
        [v22 addPreviousEntityIdentifiers:v9];
      }
    }
  }
  if ([(ATXPBModeConfigurationUIFlowLoggingEvent *)self suggestedEntityIdentifiersCount])
  {
    [v22 clearSuggestedEntityIdentifiers];
    unint64_t v10 = [(ATXPBModeConfigurationUIFlowLoggingEvent *)self suggestedEntityIdentifiersCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(ATXPBModeConfigurationUIFlowLoggingEvent *)self suggestedEntityIdentifiersAtIndex:j];
        [v22 addSuggestedEntityIdentifiers:v13];
      }
    }
  }
  if ([(ATXPBModeConfigurationUIFlowLoggingEvent *)self currentEntityIdentifiersCount])
  {
    [v22 clearCurrentEntityIdentifiers];
    unint64_t v14 = [(ATXPBModeConfigurationUIFlowLoggingEvent *)self currentEntityIdentifiersCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        uint64_t v17 = [(ATXPBModeConfigurationUIFlowLoggingEvent *)self currentEntityIdentifiersAtIndex:k];
        [v22 addCurrentEntityIdentifiers:v17];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v22 + 11) = self->_modeConfigurationType;
    *((unsigned char *)v22 + 72) |= 4u;
  }
  if ([(ATXPBModeConfigurationUIFlowLoggingEvent *)self candidateEntityIdentifiersCount])
  {
    [v22 clearCandidateEntityIdentifiers];
    unint64_t v18 = [(ATXPBModeConfigurationUIFlowLoggingEvent *)self candidateEntityIdentifiersCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t m = 0; m != v19; ++m)
      {
        v21 = [(ATXPBModeConfigurationUIFlowLoggingEvent *)self candidateEntityIdentifiersAtIndex:m];
        [v22 addCandidateEntityIdentifiers:v21];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_secondsSinceReferenceDate;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_dndModeUUID copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_modeConfigurationUI;
    *(unsigned char *)(v6 + 72) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_modeConfigurationEntityType;
    *(unsigned char *)(v6 + 72) |= 2u;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  unint64_t v10 = self->_previousEntityIdentifiers;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v10);
        }
        unint64_t v15 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addPreviousEntityIdentifiers:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v12);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v16 = self->_suggestedEntityIdentifiers;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v44 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addSuggestedEntityIdentifiers:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v18);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v22 = self->_currentEntityIdentifiers;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v27 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * k) copyWithZone:a3];
        [(id)v6 addCurrentEntityIdentifiers:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v24);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_modeConfigurationType;
    *(unsigned char *)(v6 + 72) |= 4u;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v28 = self->_candidateEntityIdentifiers;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v51 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v36;
    do
    {
      for (uint64_t m = 0; m != v30; ++m)
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v28);
        }
        long long v33 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * m), "copyWithZone:", a3, (void)v35);
        [(id)v6 addCandidateEntityIdentifiers:v33];
      }
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v51 count:16];
    }
    while (v30);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_secondsSinceReferenceDate != *((double *)v4 + 1)) {
      goto LABEL_33;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_33;
  }
  dndModeUUID = self->_dndModeUUID;
  if ((unint64_t)dndModeUUID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](dndModeUUID, "isEqual:"))
    {
LABEL_33:
      char v11 = 0;
      goto LABEL_34;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 8) == 0 || self->_modeConfigurationUI != *((_DWORD *)v4 + 12)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 8) != 0)
  {
    goto LABEL_33;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_modeConfigurationEntityType != *((_DWORD *)v4 + 10)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_33;
  }
  previousEntityIdentifiers = self->_previousEntityIdentifiers;
  if ((unint64_t)previousEntityIdentifiers | *((void *)v4 + 7)
    && !-[NSMutableArray isEqual:](previousEntityIdentifiers, "isEqual:"))
  {
    goto LABEL_33;
  }
  suggestedEntityIdentifiers = self->_suggestedEntityIdentifiers;
  if ((unint64_t)suggestedEntityIdentifiers | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](suggestedEntityIdentifiers, "isEqual:")) {
      goto LABEL_33;
    }
  }
  currentEntityIdentifiers = self->_currentEntityIdentifiers;
  if ((unint64_t)currentEntityIdentifiers | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](currentEntityIdentifiers, "isEqual:")) {
      goto LABEL_33;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_modeConfigurationType != *((_DWORD *)v4 + 11)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_33;
  }
  candidateEntityIdentifiers = self->_candidateEntityIdentifiers;
  if ((unint64_t)candidateEntityIdentifiers | *((void *)v4 + 2)) {
    char v11 = -[NSMutableArray isEqual:](candidateEntityIdentifiers, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double secondsSinceReferenceDate = self->_secondsSinceReferenceDate;
    double v5 = -secondsSinceReferenceDate;
    if (secondsSinceReferenceDate >= 0.0) {
      double v5 = self->_secondsSinceReferenceDate;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_dndModeUUID hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v9 = 2654435761 * self->_modeConfigurationUI;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_11:
      uint64_t v10 = 2654435761 * self->_modeConfigurationEntityType;
      goto LABEL_14;
    }
  }
  uint64_t v10 = 0;
LABEL_14:
  uint64_t v11 = [(NSMutableArray *)self->_previousEntityIdentifiers hash];
  uint64_t v12 = [(NSMutableArray *)self->_suggestedEntityIdentifiers hash];
  uint64_t v13 = [(NSMutableArray *)self->_currentEntityIdentifiers hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v14 = 2654435761 * self->_modeConfigurationType;
  }
  else {
    uint64_t v14 = 0;
  }
  return v8 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ [(NSMutableArray *)self->_candidateEntityIdentifiers hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = (double *)a3;
  double v5 = v4;
  if ((_BYTE)v4[9])
  {
    self->_double secondsSinceReferenceDate = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4)) {
    -[ATXPBModeConfigurationUIFlowLoggingEvent setDndModeUUID:](self, "setDndModeUUID:");
  }
  char v6 = *((unsigned char *)v5 + 72);
  if ((v6 & 8) != 0)
  {
    self->_uint64_t modeConfigurationUI = *((_DWORD *)v5 + 12);
    *(unsigned char *)&self->_has |= 8u;
    char v6 = *((unsigned char *)v5 + 72);
  }
  if ((v6 & 2) != 0)
  {
    self->_uint64_t modeConfigurationEntityType = *((_DWORD *)v5 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = *((id *)v5 + 7);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
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
        [(ATXPBModeConfigurationUIFlowLoggingEvent *)self addPreviousEntityIdentifiers:*(void *)(*((void *)&v39 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v9);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = *((id *)v5 + 8);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
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
        [(ATXPBModeConfigurationUIFlowLoggingEvent *)self addSuggestedEntityIdentifiers:*(void *)(*((void *)&v35 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v14);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = *((id *)v5 + 3);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
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
        [(ATXPBModeConfigurationUIFlowLoggingEvent *)self addCurrentEntityIdentifiers:*(void *)(*((void *)&v31 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v19);
  }

  if (((_BYTE)v5[9] & 4) != 0)
  {
    self->_uint64_t modeConfigurationType = *((_DWORD *)v5 + 11);
    *(unsigned char *)&self->_has |= 4u;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v22 = *((id *)v5 + 2);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
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
        -[ATXPBModeConfigurationUIFlowLoggingEvent addCandidateEntityIdentifiers:](self, "addCandidateEntityIdentifiers:", *(void *)(*((void *)&v27 + 1) + 8 * m), (void)v27);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v24);
  }
}

- (double)secondsSinceReferenceDate
{
  return self->_secondsSinceReferenceDate;
}

- (NSString)dndModeUUID
{
  return self->_dndModeUUID;
}

- (void)setDndModeUUID:(id)a3
{
}

- (NSMutableArray)previousEntityIdentifiers
{
  return self->_previousEntityIdentifiers;
}

- (void)setPreviousEntityIdentifiers:(id)a3
{
}

- (NSMutableArray)suggestedEntityIdentifiers
{
  return self->_suggestedEntityIdentifiers;
}

- (void)setSuggestedEntityIdentifiers:(id)a3
{
}

- (NSMutableArray)currentEntityIdentifiers
{
  return self->_currentEntityIdentifiers;
}

- (void)setCurrentEntityIdentifiers:(id)a3
{
}

- (NSMutableArray)candidateEntityIdentifiers
{
  return self->_candidateEntityIdentifiers;
}

- (void)setCandidateEntityIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_previousEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_dndModeUUID, 0);
  objc_storeStrong((id *)&self->_currentEntityIdentifiers, 0);

  objc_storeStrong((id *)&self->_candidateEntityIdentifiers, 0);
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  double v5 = [(ATXPBModeConfigurationUIFlowLoggingEvent *)self init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      id v7 = [v6 objectForKeyedSubscript:@"dndModeUUID"];
      [(ATXPBModeConfigurationUIFlowLoggingEvent *)v5 setDndModeUUID:v7];

      id v8 = [v6 objectForKeyedSubscript:@"modeConfigurationUI"];
      if ([v8 isEqualToString:@"Setup"])
      {
        uint64_t v9 = 0;
      }
      else if ([v8 isEqualToString:@"Settings"])
      {
        uint64_t v9 = 1;
      }
      else if ([v8 isEqualToString:@"OnBoarding"])
      {
        uint64_t v9 = 2;
      }
      else if ([v8 isEqualToString:@"Total"])
      {
        uint64_t v9 = 3;
      }
      else
      {
        uint64_t v9 = 0;
      }

      [(ATXPBModeConfigurationUIFlowLoggingEvent *)v5 setModeConfigurationUI:v9];
      id v10 = [v6 objectForKeyedSubscript:@"modeConfigurationEntityType"];
      if ([v10 isEqualToString:@"Apps"])
      {
        uint64_t v11 = 0;
      }
      else if ([v10 isEqualToString:@"Contacts"])
      {
        uint64_t v11 = 1;
      }
      else if ([v10 isEqualToString:@"Total"])
      {
        uint64_t v11 = 2;
      }
      else
      {
        uint64_t v11 = 0;
      }

      [(ATXPBModeConfigurationUIFlowLoggingEvent *)v5 setModeConfigurationEntityType:v11];
      id v12 = [v6 objectForKeyedSubscript:@"modeConfigurationType"];
      if ([v12 isEqualToString:@"Allow"])
      {
        uint64_t v13 = 0;
      }
      else if ([v12 isEqualToString:@"Deny"])
      {
        uint64_t v13 = 1;
      }
      else if ([v12 isEqualToString:@"Total"])
      {
        uint64_t v13 = 2;
      }
      else
      {
        uint64_t v13 = 0;
      }

      [(ATXPBModeConfigurationUIFlowLoggingEvent *)v5 setModeConfigurationType:v13];
      uint64_t v14 = [v6 objectForKeyedSubscript:@"suggestedEntityIdentifiers"];
      [(ATXPBModeConfigurationUIFlowLoggingEvent *)v5 setSuggestedEntityIdentifiers:v14];

      uint64_t v15 = [v6 objectForKeyedSubscript:@"candidateEntityIdentifiers"];
      [(ATXPBModeConfigurationUIFlowLoggingEvent *)v5 setCandidateEntityIdentifiers:v15];

      v16 = [v6 objectForKeyedSubscript:@"previousEntityIdentifiers"];
      [(ATXPBModeConfigurationUIFlowLoggingEvent *)v5 setPreviousEntityIdentifiers:v16];

      id v17 = [v6 objectForKeyedSubscript:@"currentEntityIdentifiers"];
      [(ATXPBModeConfigurationUIFlowLoggingEvent *)v5 setCurrentEntityIdentifiers:v17];

      uint64_t v18 = [v6 objectForKeyedSubscript:@"eventDate"];
      [v18 timeIntervalSinceReferenceDate];
      -[ATXPBModeConfigurationUIFlowLoggingEvent setSecondsSinceReferenceDate:](v5, "setSecondsSinceReferenceDate:");
    }
  }

  return v5;
}

- (id)jsonRepresentation
{
  v24[9] = *MEMORY[0x1E4F143B8];
  v23[0] = @"dndModeUUID";
  id v22 = +[ATXJSONHelper wrapObject:self->_dndModeUUID];
  v24[0] = v22;
  v23[1] = @"modeConfigurationUI";
  uint64_t modeConfigurationUI = self->_modeConfigurationUI;
  if (modeConfigurationUI >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_modeConfigurationUI);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = off_1E5D08818[modeConfigurationUI];
  }
  v21 = v4;
  uint64_t v20 = +[ATXJSONHelper wrapObject:v4];
  v24[1] = v20;
  v23[2] = @"entityType";
  uint64_t modeConfigurationEntityType = self->_modeConfigurationEntityType;
  if (modeConfigurationEntityType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_modeConfigurationEntityType);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = off_1E5D08838[modeConfigurationEntityType];
  }
  uint64_t v19 = v6;
  id v7 = +[ATXJSONHelper wrapObject:v6];
  v24[2] = v7;
  v23[3] = @"modeConfigurationType";
  uint64_t modeConfigurationType = self->_modeConfigurationType;
  if (modeConfigurationType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_modeConfigurationType);
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = off_1E5D08850[modeConfigurationType];
  }
  id v10 = +[ATXJSONHelper wrapObject:v9];
  v24[3] = v10;
  v23[4] = @"suggestedEntityIdentifiers";
  uint64_t v11 = +[ATXJSONHelper wrapObject:self->_suggestedEntityIdentifiers];
  v24[4] = v11;
  v23[5] = @"candidateEntityIdentifiers";
  id v12 = +[ATXJSONHelper wrapObject:self->_candidateEntityIdentifiers];
  v24[5] = v12;
  v23[6] = @"previousEntityIdentifiers";
  uint64_t v13 = +[ATXJSONHelper wrapObject:self->_previousEntityIdentifiers];
  v24[6] = v13;
  v23[7] = @"currentEntityIdentifiers";
  uint64_t v14 = +[ATXJSONHelper wrapObject:self->_currentEntityIdentifiers];
  v24[7] = v14;
  v23[8] = @"eventDate";
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_secondsSinceReferenceDate];
  v16 = +[ATXJSONHelper wrapObject:v15];
  v24[8] = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:9];

  return v17;
}

@end