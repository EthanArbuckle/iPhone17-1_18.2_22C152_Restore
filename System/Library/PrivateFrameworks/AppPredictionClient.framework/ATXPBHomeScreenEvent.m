@interface ATXPBHomeScreenEvent
- (BOOL)hasAppBundleId;
- (BOOL)hasBlendingCacheId;
- (BOOL)hasEventTypeString;
- (BOOL)hasIntentDescription;
- (BOOL)hasMetadata;
- (BOOL)hasReason;
- (BOOL)hasStackId;
- (BOOL)hasWidgetBundleId;
- (BOOL)hasWidgetKind;
- (BOOL)hasWidgetUniqueId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuggestedWidget;
- (BOOL)readFrom:(id)a3;
- (__CFString)stackKindAsString:(__CFString *)a1;
- (__CFString)stackLocationAsString:(__CFString *)a1;
- (__CFString)widgetSizeAsString:(__CFString *)a1;
- (double)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)suggestionIdsAtIndex:(id *)a1;
- (uint64_t)StringAsStackKind:(uint64_t)a1;
- (uint64_t)StringAsStackLocation:(uint64_t)a1;
- (uint64_t)StringAsWidgetSize:(uint64_t)a1;
- (uint64_t)addSuggestionIds:(uint64_t)a1;
- (uint64_t)appBundleId;
- (uint64_t)blendingCacheId;
- (uint64_t)clearSuggestionIds;
- (uint64_t)eventTypeString;
- (uint64_t)hasDate;
- (uint64_t)hasIsSuggestedWidget;
- (uint64_t)hasStackKind;
- (uint64_t)hasStackLocation;
- (uint64_t)hasWidgetSize;
- (uint64_t)intentDescription;
- (uint64_t)metadata;
- (uint64_t)reason;
- (uint64_t)setDate:(uint64_t)result;
- (uint64_t)setHasDate:(uint64_t)result;
- (uint64_t)setHasIsSuggestedWidget:(uint64_t)result;
- (uint64_t)setHasStackKind:(uint64_t)result;
- (uint64_t)setHasStackLocation:(uint64_t)result;
- (uint64_t)setHasWidgetSize:(uint64_t)result;
- (uint64_t)setIsSuggestedWidget:(uint64_t)result;
- (uint64_t)setStackKind:(uint64_t)result;
- (uint64_t)setStackLocation:(uint64_t)result;
- (uint64_t)setWidgetSize:(uint64_t)result;
- (uint64_t)stackId;
- (uint64_t)stackKind;
- (uint64_t)stackLocation;
- (uint64_t)suggestionIds;
- (uint64_t)suggestionIdsCount;
- (uint64_t)widgetBundleId;
- (uint64_t)widgetKind;
- (uint64_t)widgetSize;
- (uint64_t)widgetUniqueId;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setAppBundleId:(uint64_t)a1;
- (void)setBlendingCacheId:(uint64_t)a1;
- (void)setEventTypeString:(uint64_t)a1;
- (void)setIntentDescription:(uint64_t)a1;
- (void)setMetadata:(uint64_t)a1;
- (void)setReason:(uint64_t)a1;
- (void)setStackId:(uint64_t)a1;
- (void)setSuggestionIds:(uint64_t)a1;
- (void)setWidgetBundleId:(uint64_t)a1;
- (void)setWidgetKind:(uint64_t)a1;
- (void)setWidgetUniqueId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBHomeScreenEvent

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_eventTypeString) {
    PBDataWriterWriteStringField();
  }
  if (self->_reason) {
    PBDataWriterWriteStringField();
  }
  if (self->_blendingCacheId) {
    PBDataWriterWriteStringField();
  }
  if (self->_stackId) {
    PBDataWriterWriteStringField();
  }
  if (self->_widgetBundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_widgetKind) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_intentDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_widgetUniqueId) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_suggestionIds;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_metadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appBundleId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_34;
    }
LABEL_38:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_38;
  }
LABEL_34:
  if ((has & 0x10) != 0) {
LABEL_35:
  }
    PBDataWriterWriteBOOLField();
LABEL_36:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetUniqueId, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_widgetBundleId, 0);
  objc_storeStrong((id *)&self->_suggestionIds, 0);
  objc_storeStrong((id *)&self->_stackId, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_intentDescription, 0);
  objc_storeStrong((id *)&self->_eventTypeString, 0);
  objc_storeStrong((id *)&self->_blendingCacheId, 0);

  objc_storeStrong((id *)&self->_appBundleId, 0);
}

- (void)setWidgetUniqueId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 112), a2);
  }
}

- (uint64_t)setWidgetSize:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 124) |= 8u;
    *(_DWORD *)(result + 104) = a2;
  }
  return result;
}

- (void)setWidgetKind:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

- (void)setWidgetBundleId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (void)setSuggestionIds:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (uint64_t)setStackLocation:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 124) |= 4u;
    *(_DWORD *)(result + 76) = a2;
  }
  return result;
}

- (uint64_t)setStackKind:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 124) |= 2u;
    *(_DWORD *)(result + 72) = a2;
  }
  return result;
}

- (void)setStackId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)setReason:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)setMetadata:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setIntentDescription:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setEventTypeString:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (uint64_t)setDate:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 124) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (void)setBlendingCacheId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setAppBundleId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (uint64_t)setHasDate:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 124) = *(unsigned char *)(result + 124) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasDate
{
  if (result) {
    return *(unsigned char *)(result + 124) & 1;
  }
  return result;
}

- (BOOL)hasEventTypeString
{
  if (result) {
    return *(void *)(result + 32) != 0;
  }
  return result;
}

- (BOOL)hasReason
{
  if (result) {
    return *(void *)(result + 56) != 0;
  }
  return result;
}

- (BOOL)hasBlendingCacheId
{
  if (result) {
    return *(void *)(result + 24) != 0;
  }
  return result;
}

- (BOOL)hasStackId
{
  if (result) {
    return *(void *)(result + 64) != 0;
  }
  return result;
}

- (BOOL)hasWidgetBundleId
{
  if (result) {
    return *(void *)(result + 88) != 0;
  }
  return result;
}

- (BOOL)hasWidgetKind
{
  if (result) {
    return *(void *)(result + 96) != 0;
  }
  return result;
}

- (uint64_t)widgetSize
{
  if (result)
  {
    if ((*(unsigned char *)(result + 124) & 8) != 0) {
      return *(unsigned int *)(result + 104);
    }
    else {
      return 1;
    }
  }
  return result;
}

- (uint64_t)setHasWidgetSize:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 8;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 124) = *(unsigned char *)(result + 124) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasWidgetSize
{
  if (result) {
    return (*(unsigned __int8 *)(result + 124) >> 3) & 1;
  }
  return result;
}

- (__CFString)widgetSizeAsString:(__CFString *)a1
{
  if (a1)
  {
    if ((a2 - 1) >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5D09DC8[(int)a2 - 1];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsWidgetSize:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"TwoByTwo"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"TwoByFour"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"FourByFour"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"SixByFour"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"FourByEight"])
    {
      uint64_t v6 = 5;
    }
    else
    {
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)hasIntentDescription
{
  if (result) {
    return *(void *)(result + 40) != 0;
  }
  return result;
}

- (BOOL)hasWidgetUniqueId
{
  if (result) {
    return *(void *)(result + 112) != 0;
  }
  return result;
}

- (uint64_t)clearSuggestionIds
{
  if (result) {
    return [*(id *)(result + 80) removeAllObjects];
  }
  return result;
}

- (uint64_t)addSuggestionIds:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 80);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v6;

      id v5 = *(void **)(a1 + 80);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)suggestionIdsCount
{
  if (result) {
    return [*(id *)(result + 80) count];
  }
  return result;
}

- (id)suggestionIdsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[10] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (BOOL)hasMetadata
{
  if (result) {
    return *(void *)(result + 48) != 0;
  }
  return result;
}

- (BOOL)hasAppBundleId
{
  if (result) {
    return *(void *)(result + 16) != 0;
  }
  return result;
}

- (uint64_t)stackKind
{
  if (result)
  {
    if ((*(unsigned char *)(result + 124) & 2) != 0) {
      return *(unsigned int *)(result + 72);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)setHasStackKind:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 124) = *(unsigned char *)(result + 124) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasStackKind
{
  if (result) {
    return (*(unsigned __int8 *)(result + 124) >> 1) & 1;
  }
  return result;
}

- (__CFString)stackKindAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5D09DF0[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsStackKind:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"Unknown"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"PinnedWidget"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"SmartStack"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"NonSmartStack"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"RotatableSuggestibleStack"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"NonRotatableSuggestibleStack"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"RotatableNonSuggestibleStack"])
    {
      uint64_t v6 = 6;
    }
    else if ([v5 isEqualToString:@"NonRotatableNonSuggestibleStack"])
    {
      uint64_t v6 = 7;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)stackLocation
{
  if (result)
  {
    if ((*(unsigned char *)(result + 124) & 4) != 0) {
      return *(unsigned int *)(result + 76);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)setHasStackLocation:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 4;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 124) = *(unsigned char *)(result + 124) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasStackLocation
{
  if (result) {
    return (*(unsigned __int8 *)(result + 124) >> 2) & 1;
  }
  return result;
}

- (__CFString)stackLocationAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5D09E30[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsStackLocation:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"Unknown"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"TodayPage"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"HomeScreenPage1"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"HomeScreenOtherPages"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"HomeScreenPage2"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"HomeScreenPage3"])
    {
      uint64_t v6 = 5;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)setIsSuggestedWidget:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 124) |= 0x10u;
    *(unsigned char *)(result + 120) = a2;
  }
  return result;
}

- (uint64_t)setHasIsSuggestedWidget:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 16;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 124) = *(unsigned char *)(result + 124) & 0xEF | v2;
  }
  return result;
}

- (uint64_t)hasIsSuggestedWidget
{
  if (result) {
    return (*(unsigned __int8 *)(result + 124) >> 4) & 1;
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBHomeScreenEvent;
  id v4 = [(ATXPBHomeScreenEvent *)&v8 description];
  id v5 = [(ATXPBHomeScreenEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithDouble:self->_date];
    [v3 setObject:v4 forKey:@"date"];
  }
  eventTypeString = self->_eventTypeString;
  if (eventTypeString) {
    [v3 setObject:eventTypeString forKey:@"eventTypeString"];
  }
  reason = self->_reason;
  if (reason) {
    [v3 setObject:reason forKey:@"reason"];
  }
  blendingCacheId = self->_blendingCacheId;
  if (blendingCacheId) {
    [v3 setObject:blendingCacheId forKey:@"blendingCacheId"];
  }
  stackId = self->_stackId;
  if (stackId) {
    [v3 setObject:stackId forKey:@"stackId"];
  }
  widgetBundleId = self->_widgetBundleId;
  if (widgetBundleId) {
    [v3 setObject:widgetBundleId forKey:@"widgetBundleId"];
  }
  widgetKind = self->_widgetKind;
  if (widgetKind) {
    [v3 setObject:widgetKind forKey:@"widgetKind"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    unsigned int v11 = self->_widgetSize - 1;
    if (v11 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_widgetSize);
      long long v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v12 = off_1E5D09DC8[v11];
    }
    [v3 setObject:v12 forKey:@"widgetSize"];
  }
  intentDescription = self->_intentDescription;
  if (intentDescription) {
    [v3 setObject:intentDescription forKey:@"intentDescription"];
  }
  widgetUniqueId = self->_widgetUniqueId;
  if (widgetUniqueId) {
    [v3 setObject:widgetUniqueId forKey:@"widgetUniqueId"];
  }
  suggestionIds = self->_suggestionIds;
  if (suggestionIds) {
    [v3 setObject:suggestionIds forKey:@"suggestionIds"];
  }
  metadata = self->_metadata;
  if (metadata)
  {
    v17 = [(ATXPBHomeScreenEventMetadata *)metadata dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"metadata"];
  }
  appBundleId = self->_appBundleId;
  if (appBundleId) {
    [v3 setObject:appBundleId forKey:@"appBundleId"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t stackKind = self->_stackKind;
    if (stackKind >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_stackKind);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E5D09DF0[stackKind];
    }
    [v3 setObject:v23 forKey:@"stackKind"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_32:
      if ((has & 0x10) == 0) {
        goto LABEL_34;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_32;
  }
  uint64_t stackLocation = self->_stackLocation;
  if (stackLocation >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_stackLocation);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = off_1E5D09E30[stackLocation];
  }
  [v3 setObject:v25 forKey:@"stackLocation"];

  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_34;
  }
LABEL_33:
  v20 = [NSNumber numberWithBool:self->_isSuggestedWidget];
  [v3 setObject:v20 forKey:@"isSuggestedWidget"];

LABEL_34:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBHomeScreenEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 124))
    {
      v3[1] = *(id *)(a1 + 8);
      *((unsigned char *)v3 + 124) |= 1u;
    }
    id v4 = *(void **)(a1 + 32);
    v19 = v3;
    if (v4)
    {
      -[ATXPBHomeScreenEvent setEventTypeString:]((uint64_t)v3, v4);
      id v3 = v19;
    }
    id v5 = *(void **)(a1 + 56);
    if (v5)
    {
      -[ATXPBHomeScreenEvent setReason:]((uint64_t)v19, v5);
      id v3 = v19;
    }
    uint64_t v6 = *(void **)(a1 + 24);
    if (v6)
    {
      -[ATXPBHomeScreenEvent setBlendingCacheId:]((uint64_t)v19, v6);
      id v3 = v19;
    }
    uint64_t v7 = *(void **)(a1 + 64);
    if (v7)
    {
      -[ATXPBHomeScreenEvent setStackId:]((uint64_t)v19, v7);
      id v3 = v19;
    }
    objc_super v8 = *(void **)(a1 + 88);
    if (v8)
    {
      -[ATXPBHomeScreenEvent setWidgetBundleId:]((uint64_t)v19, v8);
      id v3 = v19;
    }
    id v9 = *(void **)(a1 + 96);
    if (v9)
    {
      -[ATXPBHomeScreenEvent setWidgetKind:]((uint64_t)v19, v9);
      id v3 = v19;
    }
    if ((*(unsigned char *)(a1 + 124) & 8) != 0)
    {
      *((_DWORD *)v3 + 26) = *(_DWORD *)(a1 + 104);
      *((unsigned char *)v3 + 124) |= 8u;
    }
    v10 = *(void **)(a1 + 40);
    if (v10) {
      -[ATXPBHomeScreenEvent setIntentDescription:]((uint64_t)v19, v10);
    }
    unsigned int v11 = *(void **)(a1 + 112);
    if (v11) {
      -[ATXPBHomeScreenEvent setWidgetUniqueId:]((uint64_t)v19, v11);
    }
    if ([*(id *)(a1 + 80) count])
    {
      if (v19) {
        [v19[10] removeAllObjects];
      }
      uint64_t v12 = [*(id *)(a1 + 80) count];
      if (v12)
      {
        uint64_t v13 = v12;
        for (uint64_t i = 0; i != v13; ++i)
        {
          v15 = -[ATXPBHomeScreenEvent suggestionIdsAtIndex:]((id *)a1, i);
          -[ATXPBHomeScreenEvent addSuggestionIds:]((uint64_t)v19, v15);
        }
      }
    }
    uint64_t v16 = *(void **)(a1 + 48);
    if (v16) {
      -[ATXPBHomeScreenEvent setMetadata:]((uint64_t)v19, v16);
    }
    v17 = *(void **)(a1 + 16);
    id v3 = v19;
    if (v17)
    {
      -[ATXPBHomeScreenEvent setAppBundleId:]((uint64_t)v19, v17);
      id v3 = v19;
    }
    char v18 = *(unsigned char *)(a1 + 124);
    if ((v18 & 2) != 0)
    {
      *((_DWORD *)v3 + 18) = *(_DWORD *)(a1 + 72);
      *((unsigned char *)v3 + 124) |= 2u;
      char v18 = *(unsigned char *)(a1 + 124);
      if ((v18 & 4) == 0)
      {
LABEL_34:
        if ((v18 & 0x10) == 0) {
          goto LABEL_36;
        }
        goto LABEL_35;
      }
    }
    else if ((*(unsigned char *)(a1 + 124) & 4) == 0)
    {
      goto LABEL_34;
    }
    *((_DWORD *)v3 + 19) = *(_DWORD *)(a1 + 76);
    *((unsigned char *)v3 + 124) |= 4u;
    if ((*(unsigned char *)(a1 + 124) & 0x10) != 0)
    {
LABEL_35:
      *((unsigned char *)v3 + 120) = *(unsigned char *)(a1 + 120);
      *((unsigned char *)v3 + 124) |= 0x10u;
    }
  }
LABEL_36:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_date;
    *(unsigned char *)(v5 + 124) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_eventTypeString copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  uint64_t v9 = [(NSString *)self->_reason copyWithZone:a3];
  v10 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v9;

  uint64_t v11 = [(NSString *)self->_blendingCacheId copyWithZone:a3];
  uint64_t v12 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v11;

  uint64_t v13 = [(NSString *)self->_stackId copyWithZone:a3];
  long long v14 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v13;

  uint64_t v15 = [(NSString *)self->_widgetBundleId copyWithZone:a3];
  uint64_t v16 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v15;

  uint64_t v17 = [(NSString *)self->_widgetKind copyWithZone:a3];
  char v18 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v17;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_widgetSize;
    *(unsigned char *)(v6 + 124) |= 8u;
  }
  uint64_t v19 = [(NSString *)self->_intentDescription copyWithZone:a3];
  v20 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v19;

  uint64_t v21 = [(NSString *)self->_widgetUniqueId copyWithZone:a3];
  v22 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v21;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v23 = self->_suggestionIds;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "copyWithZone:", a3, (void)v35);
        -[ATXPBHomeScreenEvent addSuggestionIds:](v6, v28);
      }
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v25);
  }

  id v29 = [(ATXPBHomeScreenEventMetadata *)self->_metadata copyWithZone:a3];
  v30 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v29;

  uint64_t v31 = [(NSString *)self->_appBundleId copyWithZone:a3];
  v32 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v31;

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_14;
    }
LABEL_18:
    *(_DWORD *)(v6 + 76) = self->_stackLocation;
    *(unsigned char *)(v6 + 124) |= 4u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return (id)v6;
    }
    goto LABEL_15;
  }
  *(_DWORD *)(v6 + 72) = self->_stackKind;
  *(unsigned char *)(v6 + 124) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_18;
  }
LABEL_14:
  if ((has & 0x10) != 0)
  {
LABEL_15:
    *(unsigned char *)(v6 + 120) = self->_isSuggestedWidget;
    *(unsigned char *)(v6 + 124) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 124) & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_46;
    }
  }
  else if (*((unsigned char *)v4 + 124))
  {
    goto LABEL_46;
  }
  eventTypeString = self->_eventTypeString;
  if ((unint64_t)eventTypeString | *((void *)v4 + 4)
    && !-[NSString isEqual:](eventTypeString, "isEqual:"))
  {
    goto LABEL_46;
  }
  reason = self->_reason;
  if ((unint64_t)reason | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](reason, "isEqual:")) {
      goto LABEL_46;
    }
  }
  blendingCacheId = self->_blendingCacheId;
  if ((unint64_t)blendingCacheId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](blendingCacheId, "isEqual:")) {
      goto LABEL_46;
    }
  }
  stackId = self->_stackId;
  if ((unint64_t)stackId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](stackId, "isEqual:")) {
      goto LABEL_46;
    }
  }
  widgetBundleId = self->_widgetBundleId;
  if ((unint64_t)widgetBundleId | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](widgetBundleId, "isEqual:")) {
      goto LABEL_46;
    }
  }
  widgetKind = self->_widgetKind;
  if ((unint64_t)widgetKind | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](widgetKind, "isEqual:")) {
      goto LABEL_46;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 8) == 0 || self->_widgetSize != *((_DWORD *)v4 + 26)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 124) & 8) != 0)
  {
    goto LABEL_46;
  }
  intentDescription = self->_intentDescription;
  if ((unint64_t)intentDescription | *((void *)v4 + 5)
    && !-[NSString isEqual:](intentDescription, "isEqual:"))
  {
    goto LABEL_46;
  }
  widgetUniqueId = self->_widgetUniqueId;
  if ((unint64_t)widgetUniqueId | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](widgetUniqueId, "isEqual:")) {
      goto LABEL_46;
    }
  }
  suggestionIds = self->_suggestionIds;
  if ((unint64_t)suggestionIds | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](suggestionIds, "isEqual:")) {
      goto LABEL_46;
    }
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 6))
  {
    if (!-[ATXPBHomeScreenEventMetadata isEqual:](metadata, "isEqual:")) {
      goto LABEL_46;
    }
  }
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:")) {
      goto LABEL_46;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 2) == 0 || self->_stackKind != *((_DWORD *)v4 + 18)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 124) & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 4) == 0 || self->_stackLocation != *((_DWORD *)v4 + 19)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 124) & 4) != 0)
  {
    goto LABEL_46;
  }
  BOOL v16 = (*((unsigned char *)v4 + 124) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 0x10) == 0)
    {
LABEL_46:
      BOOL v16 = 0;
      goto LABEL_47;
    }
    if (self->_isSuggestedWidget)
    {
      if (!*((unsigned char *)v4 + 120)) {
        goto LABEL_46;
      }
    }
    else if (*((unsigned char *)v4 + 120))
    {
      goto LABEL_46;
    }
    BOOL v16 = 1;
  }
LABEL_47:

  return v16;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double date = self->_date;
    double v4 = -date;
    if (date >= 0.0) {
      double v4 = self->_date;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    double v7 = fmod(v5, 1.84467441e19);
    unint64_t v8 = 2654435761u * (unint64_t)v7;
    unint64_t v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0) {
      unint64_t v9 = 2654435761u * (unint64_t)v7;
    }
    unint64_t v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0) {
      unint64_t v10 = v9;
    }
    unint64_t v27 = v10;
  }
  else
  {
    unint64_t v27 = 0;
  }
  NSUInteger v26 = [(NSString *)self->_eventTypeString hash];
  NSUInteger v25 = [(NSString *)self->_reason hash];
  NSUInteger v24 = [(NSString *)self->_blendingCacheId hash];
  NSUInteger v23 = [(NSString *)self->_stackId hash];
  NSUInteger v11 = [(NSString *)self->_widgetBundleId hash];
  NSUInteger v12 = [(NSString *)self->_widgetKind hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v13 = 2654435761 * self->_widgetSize;
  }
  else {
    uint64_t v13 = 0;
  }
  NSUInteger v14 = [(NSString *)self->_intentDescription hash];
  NSUInteger v15 = [(NSString *)self->_widgetUniqueId hash];
  uint64_t v16 = [(NSMutableArray *)self->_suggestionIds hash];
  unint64_t v17 = [(ATXPBHomeScreenEventMetadata *)self->_metadata hash];
  NSUInteger v18 = [(NSString *)self->_appBundleId hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v19 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_15;
    }
LABEL_18:
    uint64_t v20 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_16;
    }
LABEL_19:
    uint64_t v21 = 0;
    return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
  }
  uint64_t v19 = 2654435761 * self->_stackKind;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_18;
  }
LABEL_15:
  uint64_t v20 = 2654435761 * self->_stackLocation;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_19;
  }
LABEL_16:
  uint64_t v21 = 2654435761 * self->_isSuggestedWidget;
  return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!a1) {
    goto LABEL_40;
  }
  if (*((unsigned char *)v3 + 124))
  {
    *(void *)(a1 + 8) = v3[1];
    *(unsigned char *)(a1 + 124) |= 1u;
  }
  long double v5 = (void *)v3[4];
  if (v5) {
    -[ATXPBHomeScreenEvent setEventTypeString:](a1, v5);
  }
  double v6 = (void *)*((void *)v4 + 7);
  if (v6) {
    -[ATXPBHomeScreenEvent setReason:](a1, v6);
  }
  double v7 = (void *)*((void *)v4 + 3);
  if (v7) {
    -[ATXPBHomeScreenEvent setBlendingCacheId:](a1, v7);
  }
  unint64_t v8 = (void *)*((void *)v4 + 8);
  if (v8) {
    -[ATXPBHomeScreenEvent setStackId:](a1, v8);
  }
  unint64_t v9 = (void *)*((void *)v4 + 11);
  if (v9) {
    -[ATXPBHomeScreenEvent setWidgetBundleId:](a1, v9);
  }
  unint64_t v10 = (void *)*((void *)v4 + 12);
  if (v10) {
    -[ATXPBHomeScreenEvent setWidgetKind:](a1, v10);
  }
  if ((*((unsigned char *)v4 + 124) & 8) != 0)
  {
    *(_DWORD *)(a1 + 104) = *((_DWORD *)v4 + 26);
    *(unsigned char *)(a1 + 124) |= 8u;
  }
  NSUInteger v11 = (void *)*((void *)v4 + 5);
  if (v11) {
    -[ATXPBHomeScreenEvent setIntentDescription:](a1, v11);
  }
  NSUInteger v12 = (void *)*((void *)v4 + 14);
  if (v12) {
    -[ATXPBHomeScreenEvent setWidgetUniqueId:](a1, v12);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = *((id *)v4 + 10);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        -[ATXPBHomeScreenEvent addSuggestionIds:](a1, *(void **)(*((void *)&v22 + 1) + 8 * i));
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }

  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = (void *)*((void *)v4 + 6);
  if (v18)
  {
    if (v19) {
      -[ATXPBHomeScreenEventMetadata mergeFrom:](v18, v19);
    }
  }
  else if (v19)
  {
    -[ATXPBHomeScreenEvent setMetadata:](a1, v19);
  }
  uint64_t v20 = (void *)*((void *)v4 + 2);
  if (v20) {
    -[ATXPBHomeScreenEvent setAppBundleId:](a1, v20);
  }
  char v21 = *((unsigned char *)v4 + 124);
  if ((v21 & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 124) & 4) == 0) {
      goto LABEL_38;
    }
LABEL_42:
    *(_DWORD *)(a1 + 76) = *((_DWORD *)v4 + 19);
    *(unsigned char *)(a1 + 124) |= 4u;
    if ((*((unsigned char *)v4 + 124) & 0x10) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  *(_DWORD *)(a1 + 72) = *((_DWORD *)v4 + 18);
  *(unsigned char *)(a1 + 124) |= 2u;
  char v21 = *((unsigned char *)v4 + 124);
  if ((v21 & 4) != 0) {
    goto LABEL_42;
  }
LABEL_38:
  if ((v21 & 0x10) != 0)
  {
LABEL_39:
    *(unsigned char *)(a1 + 120) = *((unsigned char *)v4 + 120);
    *(unsigned char *)(a1 + 124) |= 0x10u;
  }
LABEL_40:
}

- (double)date
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)eventTypeString
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)reason
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (uint64_t)blendingCacheId
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (uint64_t)stackId
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (uint64_t)widgetBundleId
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

- (uint64_t)widgetKind
{
  if (result) {
    return *(void *)(result + 96);
  }
  return result;
}

- (uint64_t)intentDescription
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (uint64_t)widgetUniqueId
{
  if (result) {
    return *(void *)(result + 112);
  }
  return result;
}

- (uint64_t)suggestionIds
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

- (uint64_t)metadata
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (uint64_t)appBundleId
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (BOOL)isSuggestedWidget
{
  if (result) {
    return *(unsigned char *)(result + 120) != 0;
  }
  return result;
}

@end