@interface ATXMPBBlendingWidgetRotationEngagementTracker
- (BOOL)hasAbGroup;
- (BOOL)hasClientModelABGroup;
- (BOOL)hasClientModelId;
- (BOOL)hasEngagementType;
- (BOOL)hasExecutableType;
- (BOOL)hasHighestConfidenceCategory;
- (BOOL)hasLayoutType;
- (BOOL)hasSelectionType;
- (BOOL)hasStackLocation;
- (BOOL)hasWidgetIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)abGroup;
- (NSString)clientModelABGroup;
- (NSString)clientModelId;
- (NSString)executableType;
- (NSString)highestConfidenceCategory;
- (NSString)layoutType;
- (NSString)widgetIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)engagementTypeAsString:(int)a3;
- (id)selectionTypeAsString:(int)a3;
- (id)stackLocationAsString:(int)a3;
- (int)StringAsEngagementType:(id)a3;
- (int)StringAsSelectionType:(id)a3;
- (int)StringAsStackLocation:(id)a3;
- (int)engagementType;
- (int)selectionType;
- (int)stackLocation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbGroup:(id)a3;
- (void)setClientModelABGroup:(id)a3;
- (void)setClientModelId:(id)a3;
- (void)setEngagementType:(int)a3;
- (void)setExecutableType:(id)a3;
- (void)setHasEngagementType:(BOOL)a3;
- (void)setHasSelectionType:(BOOL)a3;
- (void)setHasStackLocation:(BOOL)a3;
- (void)setHighestConfidenceCategory:(id)a3;
- (void)setLayoutType:(id)a3;
- (void)setSelectionType:(int)a3;
- (void)setStackLocation:(int)a3;
- (void)setWidgetIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBBlendingWidgetRotationEngagementTracker

- (BOOL)hasLayoutType
{
  return self->_layoutType != 0;
}

- (int)engagementType
{
  if (*(unsigned char *)&self->_has) {
    return self->_engagementType;
  }
  else {
    return 1;
  }
}

- (void)setEngagementType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_engagementType = a3;
}

- (void)setHasEngagementType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEngagementType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)engagementTypeAsString:(int)a3
{
  if ((a3 - 1) >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E68AF788[a3 - 1];
  }
  return v3;
}

- (int)StringAsEngagementType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NotSeen"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Shown"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"UserRotate"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Dwell"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Tapped"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"AddedToStack"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RejectedRotationDismissOnce"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RejectedRotationNeverShowAgain"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (BOOL)hasWidgetIdentifier
{
  return self->_widgetIdentifier != 0;
}

- (int)selectionType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_selectionType;
  }
  else {
    return 1;
  }
}

- (void)setSelectionType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_selectionType = a3;
}

- (void)setHasSelectionType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSelectionType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)selectionTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"NPlusOne";
  }
  else if (a3 == 2)
  {
    int v4 = @"StackRotation";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsSelectionType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"NPlusOne"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"StackRotation"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (BOOL)hasHighestConfidenceCategory
{
  return self->_highestConfidenceCategory != 0;
}

- (BOOL)hasExecutableType
{
  return self->_executableType != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (int)stackLocation
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_stackLocation;
  }
  else {
    return 0;
  }
}

- (void)setStackLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_stackLocation = a3;
}

- (void)setHasStackLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStackLocation
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)stackLocationAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E68AF7C8[a3];
  }
  return v3;
}

- (int)StringAsStackLocation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TodayPage"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HomeScreenPage1"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HomeScreenOtherPages"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HomeScreenPage2"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HomeScreenPage3"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasClientModelABGroup
{
  return self->_clientModelABGroup != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBBlendingWidgetRotationEngagementTracker;
  int v4 = [(ATXMPBBlendingWidgetRotationEngagementTracker *)&v8 description];
  v5 = [(ATXMPBBlendingWidgetRotationEngagementTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  layoutType = self->_layoutType;
  if (layoutType) {
    [v3 setObject:layoutType forKey:@"layoutType"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v6 = self->_engagementType - 1;
    if (v6 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_engagementType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E68AF788[v6];
    }
    [v4 setObject:v7 forKey:@"engagementType"];
  }
  clientModelId = self->_clientModelId;
  if (clientModelId) {
    [v4 setObject:clientModelId forKey:@"clientModelId"];
  }
  widgetIdentifier = self->_widgetIdentifier;
  if (widgetIdentifier) {
    [v4 setObject:widgetIdentifier forKey:@"widgetIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int selectionType = self->_selectionType;
    if (selectionType == 1)
    {
      v11 = @"NPlusOne";
    }
    else if (selectionType == 2)
    {
      v11 = @"StackRotation";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_selectionType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v4 setObject:v11 forKey:@"selectionType"];
  }
  highestConfidenceCategory = self->_highestConfidenceCategory;
  if (highestConfidenceCategory) {
    [v4 setObject:highestConfidenceCategory forKey:@"highestConfidenceCategory"];
  }
  executableType = self->_executableType;
  if (executableType) {
    [v4 setObject:executableType forKey:@"executableType"];
  }
  abGroup = self->_abGroup;
  if (abGroup) {
    [v4 setObject:abGroup forKey:@"abGroup"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t stackLocation = self->_stackLocation;
    if (stackLocation >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_stackLocation);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E68AF7C8[stackLocation];
    }
    [v4 setObject:v16 forKey:@"stackLocation"];
  }
  clientModelABGroup = self->_clientModelABGroup;
  if (clientModelABGroup) {
    [v4 setObject:clientModelABGroup forKey:@"clientModelABGroup"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBBlendingWidgetRotationEngagementTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_layoutType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_clientModelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_widgetIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_highestConfidenceCategory)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_executableType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_clientModelABGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_layoutType)
  {
    objc_msgSend(v4, "setLayoutType:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_engagementType;
    *((unsigned char *)v4 + 80) |= 1u;
  }
  if (self->_clientModelId)
  {
    objc_msgSend(v5, "setClientModelId:");
    id v4 = v5;
  }
  if (self->_widgetIdentifier)
  {
    objc_msgSend(v5, "setWidgetIdentifier:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_selectionType;
    *((unsigned char *)v4 + 80) |= 2u;
  }
  if (self->_highestConfidenceCategory)
  {
    objc_msgSend(v5, "setHighestConfidenceCategory:");
    id v4 = v5;
  }
  if (self->_executableType)
  {
    objc_msgSend(v5, "setExecutableType:");
    id v4 = v5;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v5, "setAbGroup:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 17) = self->_stackLocation;
    *((unsigned char *)v4 + 80) |= 4u;
  }
  if (self->_clientModelABGroup)
  {
    objc_msgSend(v5, "setClientModelABGroup:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_layoutType copyWithZone:a3];
  v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_engagementType;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_clientModelId copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_widgetIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v10;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_selectionType;
    *(unsigned char *)(v5 + 80) |= 2u;
  }
  uint64_t v12 = [(NSString *)self->_highestConfidenceCategory copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  uint64_t v14 = [(NSString *)self->_executableType copyWithZone:a3];
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  uint64_t v16 = [(NSString *)self->_abGroup copyWithZone:a3];
  v17 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v16;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_stackLocation;
    *(unsigned char *)(v5 + 80) |= 4u;
  }
  uint64_t v18 = [(NSString *)self->_clientModelABGroup copyWithZone:a3];
  v19 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  layoutType = self->_layoutType;
  if ((unint64_t)layoutType | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](layoutType, "isEqual:")) {
      goto LABEL_31;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_engagementType != *((_DWORD *)v4 + 8)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_31:
    char v12 = 0;
    goto LABEL_32;
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((void *)v4 + 3)
    && !-[NSString isEqual:](clientModelId, "isEqual:"))
  {
    goto LABEL_31;
  }
  widgetIdentifier = self->_widgetIdentifier;
  if ((unint64_t)widgetIdentifier | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](widgetIdentifier, "isEqual:")) {
      goto LABEL_31;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_selectionType != *((_DWORD *)v4 + 16)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_31;
  }
  highestConfidenceCategory = self->_highestConfidenceCategory;
  if ((unint64_t)highestConfidenceCategory | *((void *)v4 + 6)
    && !-[NSString isEqual:](highestConfidenceCategory, "isEqual:"))
  {
    goto LABEL_31;
  }
  executableType = self->_executableType;
  if ((unint64_t)executableType | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](executableType, "isEqual:")) {
      goto LABEL_31;
    }
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](abGroup, "isEqual:")) {
      goto LABEL_31;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_stackLocation != *((_DWORD *)v4 + 17)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    goto LABEL_31;
  }
  clientModelABGroup = self->_clientModelABGroup;
  if ((unint64_t)clientModelABGroup | *((void *)v4 + 2)) {
    char v12 = -[NSString isEqual:](clientModelABGroup, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_32:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_layoutType hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_engagementType;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_clientModelId hash];
  NSUInteger v6 = [(NSString *)self->_widgetIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_selectionType;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_highestConfidenceCategory hash];
  NSUInteger v9 = [(NSString *)self->_executableType hash];
  NSUInteger v10 = [(NSString *)self->_abGroup hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_stackLocation;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSString *)self->_clientModelABGroup hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 7))
  {
    [(ATXMPBBlendingWidgetRotationEngagementTracker *)self setLayoutType:"setLayoutType:"];
    uint64_t v4 = v5;
  }
  if (v4[20])
  {
    self->_engagementType = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[ATXMPBBlendingWidgetRotationEngagementTracker setClientModelId:](self, "setClientModelId:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 9))
  {
    -[ATXMPBBlendingWidgetRotationEngagementTracker setWidgetIdentifier:](self, "setWidgetIdentifier:");
    uint64_t v4 = v5;
  }
  if ((v4[20] & 2) != 0)
  {
    self->_int selectionType = v4[16];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 6))
  {
    -[ATXMPBBlendingWidgetRotationEngagementTracker setHighestConfidenceCategory:](self, "setHighestConfidenceCategory:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[ATXMPBBlendingWidgetRotationEngagementTracker setExecutableType:](self, "setExecutableType:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[ATXMPBBlendingWidgetRotationEngagementTracker setAbGroup:](self, "setAbGroup:");
    uint64_t v4 = v5;
  }
  if ((v4[20] & 4) != 0)
  {
    self->_uint64_t stackLocation = v4[17];
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 2))
  {
    -[ATXMPBBlendingWidgetRotationEngagementTracker setClientModelABGroup:](self, "setClientModelABGroup:");
    uint64_t v4 = v5;
  }
}

- (NSString)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(id)a3
{
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
}

- (NSString)widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (void)setWidgetIdentifier:(id)a3
{
}

- (NSString)highestConfidenceCategory
{
  return self->_highestConfidenceCategory;
}

- (void)setHighestConfidenceCategory:(id)a3
{
}

- (NSString)executableType
{
  return self->_executableType;
}

- (void)setExecutableType:(id)a3
{
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
}

- (NSString)clientModelABGroup
{
  return self->_clientModelABGroup;
}

- (void)setClientModelABGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetIdentifier, 0);
  objc_storeStrong((id *)&self->_layoutType, 0);
  objc_storeStrong((id *)&self->_highestConfidenceCategory, 0);
  objc_storeStrong((id *)&self->_executableType, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_clientModelABGroup, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end