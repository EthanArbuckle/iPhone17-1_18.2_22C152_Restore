@interface ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker
- (BOOL)hasAbGroup;
- (BOOL)hasClientModelABGroup;
- (BOOL)hasClientModelIdOfHighestRankingSuggestion;
- (BOOL)hasExecuableTypeOfHighestRankingSuggestion;
- (BOOL)hasHighestConfidenceCategory;
- (BOOL)hasLayoutType;
- (BOOL)hasSelectionType;
- (BOOL)hasWidgetsInStack;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)abGroup;
- (NSString)clientModelABGroup;
- (NSString)clientModelIdOfHighestRankingSuggestion;
- (NSString)execuableTypeOfHighestRankingSuggestion;
- (NSString)highestConfidenceCategory;
- (NSString)layoutType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)selectionTypeAsString:(int)a3;
- (int)StringAsSelectionType:(id)a3;
- (int)selectionType;
- (unint64_t)hash;
- (unsigned)widgetsInStack;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbGroup:(id)a3;
- (void)setClientModelABGroup:(id)a3;
- (void)setClientModelIdOfHighestRankingSuggestion:(id)a3;
- (void)setExecuableTypeOfHighestRankingSuggestion:(id)a3;
- (void)setHasSelectionType:(BOOL)a3;
- (void)setHasWidgetsInStack:(BOOL)a3;
- (void)setHighestConfidenceCategory:(id)a3;
- (void)setLayoutType:(id)a3;
- (void)setSelectionType:(int)a3;
- (void)setWidgetsInStack:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker

- (BOOL)hasLayoutType
{
  return self->_layoutType != 0;
}

- (int)selectionType
{
  if (*(unsigned char *)&self->_has) {
    return self->_selectionType;
  }
  else {
    return 1;
  }
}

- (void)setSelectionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_selectionType = a3;
}

- (void)setHasSelectionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSelectionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)selectionTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"NPlusOne";
  }
  else if (a3 == 2)
  {
    v4 = @"StackRotation";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
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

- (BOOL)hasClientModelIdOfHighestRankingSuggestion
{
  return self->_clientModelIdOfHighestRankingSuggestion != 0;
}

- (BOOL)hasHighestConfidenceCategory
{
  return self->_highestConfidenceCategory != 0;
}

- (void)setWidgetsInStack:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_widgetsInStack = a3;
}

- (void)setHasWidgetsInStack:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidgetsInStack
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasExecuableTypeOfHighestRankingSuggestion
{
  return self->_execuableTypeOfHighestRankingSuggestion != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (BOOL)hasClientModelABGroup
{
  return self->_clientModelABGroup != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker;
  int v4 = [(ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker *)&v8 description];
  v5 = [(ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  layoutType = self->_layoutType;
  if (layoutType) {
    [v3 setObject:layoutType forKey:@"layoutType"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int selectionType = self->_selectionType;
    if (selectionType == 1)
    {
      v7 = @"NPlusOne";
    }
    else if (selectionType == 2)
    {
      v7 = @"StackRotation";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_selectionType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v4 setObject:v7 forKey:@"selectionType"];
  }
  clientModelIdOfHighestRankingSuggestion = self->_clientModelIdOfHighestRankingSuggestion;
  if (clientModelIdOfHighestRankingSuggestion) {
    [v4 setObject:clientModelIdOfHighestRankingSuggestion forKey:@"clientModelIdOfHighestRankingSuggestion"];
  }
  highestConfidenceCategory = self->_highestConfidenceCategory;
  if (highestConfidenceCategory) {
    [v4 setObject:highestConfidenceCategory forKey:@"highestConfidenceCategory"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10 = [NSNumber numberWithUnsignedInt:self->_widgetsInStack];
    [v4 setObject:v10 forKey:@"widgetsInStack"];
  }
  execuableTypeOfHighestRankingSuggestion = self->_execuableTypeOfHighestRankingSuggestion;
  if (execuableTypeOfHighestRankingSuggestion) {
    [v4 setObject:execuableTypeOfHighestRankingSuggestion forKey:@"execuableTypeOfHighestRankingSuggestion"];
  }
  abGroup = self->_abGroup;
  if (abGroup) {
    [v4 setObject:abGroup forKey:@"abGroup"];
  }
  clientModelABGroup = self->_clientModelABGroup;
  if (clientModelABGroup) {
    [v4 setObject:clientModelABGroup forKey:@"clientModelABGroup"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTrackerReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_clientModelIdOfHighestRankingSuggestion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_highestConfidenceCategory)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_execuableTypeOfHighestRankingSuggestion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
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
    *((_DWORD *)v4 + 14) = self->_selectionType;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  if (self->_clientModelIdOfHighestRankingSuggestion)
  {
    objc_msgSend(v5, "setClientModelIdOfHighestRankingSuggestion:");
    id v4 = v5;
  }
  if (self->_highestConfidenceCategory)
  {
    objc_msgSend(v5, "setHighestConfidenceCategory:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 15) = self->_widgetsInStack;
    *((unsigned char *)v4 + 64) |= 2u;
  }
  if (self->_execuableTypeOfHighestRankingSuggestion)
  {
    objc_msgSend(v5, "setExecuableTypeOfHighestRankingSuggestion:");
    id v4 = v5;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v5, "setAbGroup:");
    id v4 = v5;
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
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 56) = self->_selectionType;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_clientModelIdOfHighestRankingSuggestion copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_highestConfidenceCategory copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_widgetsInStack;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  uint64_t v12 = [(NSString *)self->_execuableTypeOfHighestRankingSuggestion copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  uint64_t v14 = [(NSString *)self->_abGroup copyWithZone:a3];
  v15 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v14;

  uint64_t v16 = [(NSString *)self->_clientModelABGroup copyWithZone:a3];
  v17 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  layoutType = self->_layoutType;
  if ((unint64_t)layoutType | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](layoutType, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_selectionType != *((_DWORD *)v4 + 14)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_24:
    char v11 = 0;
    goto LABEL_25;
  }
  clientModelIdOfHighestRankingSuggestion = self->_clientModelIdOfHighestRankingSuggestion;
  if ((unint64_t)clientModelIdOfHighestRankingSuggestion | *((void *)v4 + 3)
    && !-[NSString isEqual:](clientModelIdOfHighestRankingSuggestion, "isEqual:"))
  {
    goto LABEL_24;
  }
  highestConfidenceCategory = self->_highestConfidenceCategory;
  if ((unint64_t)highestConfidenceCategory | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](highestConfidenceCategory, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_widgetsInStack != *((_DWORD *)v4 + 15)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_24;
  }
  execuableTypeOfHighestRankingSuggestion = self->_execuableTypeOfHighestRankingSuggestion;
  if ((unint64_t)execuableTypeOfHighestRankingSuggestion | *((void *)v4 + 4)
    && !-[NSString isEqual:](execuableTypeOfHighestRankingSuggestion, "isEqual:"))
  {
    goto LABEL_24;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](abGroup, "isEqual:")) {
      goto LABEL_24;
    }
  }
  clientModelABGroup = self->_clientModelABGroup;
  if ((unint64_t)clientModelABGroup | *((void *)v4 + 2)) {
    char v11 = -[NSString isEqual:](clientModelABGroup, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_25:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_layoutType hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_selectionType;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_clientModelIdOfHighestRankingSuggestion hash];
  NSUInteger v6 = [(NSString *)self->_highestConfidenceCategory hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_widgetsInStack;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v9 = v7 ^ [(NSString *)self->_execuableTypeOfHighestRankingSuggestion hash];
  NSUInteger v10 = v8 ^ v9 ^ [(NSString *)self->_abGroup hash];
  return v10 ^ [(NSString *)self->_clientModelABGroup hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 6))
  {
    [(ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker *)self setLayoutType:"setLayoutType:"];
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 64))
  {
    self->_int selectionType = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker setClientModelIdOfHighestRankingSuggestion:](self, "setClientModelIdOfHighestRankingSuggestion:");
    id v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker setHighestConfidenceCategory:](self, "setHighestConfidenceCategory:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    self->_widgetsInStack = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 4))
  {
    -[ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker setExecuableTypeOfHighestRankingSuggestion:](self, "setExecuableTypeOfHighestRankingSuggestion:");
    id v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker setAbGroup:](self, "setAbGroup:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker setClientModelABGroup:](self, "setClientModelABGroup:");
    id v4 = v5;
  }
}

- (NSString)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(id)a3
{
}

- (NSString)clientModelIdOfHighestRankingSuggestion
{
  return self->_clientModelIdOfHighestRankingSuggestion;
}

- (void)setClientModelIdOfHighestRankingSuggestion:(id)a3
{
}

- (NSString)highestConfidenceCategory
{
  return self->_highestConfidenceCategory;
}

- (void)setHighestConfidenceCategory:(id)a3
{
}

- (unsigned)widgetsInStack
{
  return self->_widgetsInStack;
}

- (NSString)execuableTypeOfHighestRankingSuggestion
{
  return self->_execuableTypeOfHighestRankingSuggestion;
}

- (void)setExecuableTypeOfHighestRankingSuggestion:(id)a3
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
  objc_storeStrong((id *)&self->_layoutType, 0);
  objc_storeStrong((id *)&self->_highestConfidenceCategory, 0);
  objc_storeStrong((id *)&self->_execuableTypeOfHighestRankingSuggestion, 0);
  objc_storeStrong((id *)&self->_clientModelIdOfHighestRankingSuggestion, 0);
  objc_storeStrong((id *)&self->_clientModelABGroup, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end