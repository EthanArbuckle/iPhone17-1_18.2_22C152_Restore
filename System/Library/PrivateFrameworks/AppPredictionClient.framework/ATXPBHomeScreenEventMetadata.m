@interface ATXPBHomeScreenEventMetadata
+ (uint64_t)widgetIdentifiablesType;
- (BOOL)hasEngagedUrl;
- (BOOL)hasVisibleRect;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStalenessRotation;
- (BOOL)isSuggestionInAddWidgetSheet;
- (BOOL)isWidgetInTodayView;
- (BOOL)readFrom:(id)a3;
- (__CFString)suggestedPageTypeAsString:(__CFString *)a1;
- (id)bundleIdsAtIndex:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)stackIdsAtIndex:(id *)a1;
- (id)widgetIdentifiablesAtIndex:(id *)a1;
- (id)widgetInStackIdentifiablesAtIndex:(id *)a1;
- (uint64_t)StringAsSuggestedPageType:(uint64_t)a1;
- (uint64_t)addBundleIds:(uint64_t)a1;
- (uint64_t)addStackIds:(uint64_t)a1;
- (uint64_t)addWidgetIdentifiables:(uint64_t)a1;
- (uint64_t)addWidgetInStackIdentifiables:(uint64_t)a1;
- (uint64_t)bundleIds;
- (uint64_t)bundleIdsCount;
- (uint64_t)clearBundleIds;
- (uint64_t)clearStackIds;
- (uint64_t)clearWidgetIdentifiables;
- (uint64_t)clearWidgetInStackIdentifiables;
- (uint64_t)engagedUrl;
- (uint64_t)hasIsStalenessRotation;
- (uint64_t)hasIsSuggestionInAddWidgetSheet;
- (uint64_t)hasIsWidgetInTodayView;
- (uint64_t)hasPageIndex;
- (uint64_t)hasSuggestedPageType;
- (uint64_t)pageIndex;
- (uint64_t)setHasIsStalenessRotation:(uint64_t)result;
- (uint64_t)setHasIsSuggestionInAddWidgetSheet:(uint64_t)result;
- (uint64_t)setHasIsWidgetInTodayView:(uint64_t)result;
- (uint64_t)setHasPageIndex:(uint64_t)result;
- (uint64_t)setHasSuggestedPageType:(uint64_t)result;
- (uint64_t)setIsStalenessRotation:(uint64_t)result;
- (uint64_t)setIsSuggestionInAddWidgetSheet:(uint64_t)result;
- (uint64_t)setIsWidgetInTodayView:(uint64_t)result;
- (uint64_t)setPageIndex:(uint64_t)result;
- (uint64_t)setSuggestedPageType:(uint64_t)result;
- (uint64_t)stackIds;
- (uint64_t)stackIdsCount;
- (uint64_t)suggestedPageType;
- (uint64_t)visibleRect;
- (uint64_t)widgetIdentifiables;
- (uint64_t)widgetIdentifiablesCount;
- (uint64_t)widgetInStackIdentifiables;
- (uint64_t)widgetInStackIdentifiablesCount;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setBundleIds:(uint64_t)a1;
- (void)setEngagedUrl:(uint64_t)a1;
- (void)setStackIds:(uint64_t)a1;
- (void)setVisibleRect:(uint64_t)a1;
- (void)setWidgetIdentifiables:(uint64_t)a1;
- (void)setWidgetInStackIdentifiables:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBHomeScreenEventMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetInStackIdentifiables, 0);
  objc_storeStrong((id *)&self->_widgetIdentifiables, 0);
  objc_storeStrong((id *)&self->_visibleRect, 0);
  objc_storeStrong((id *)&self->_stackIds, 0);
  objc_storeStrong((id *)&self->_engagedUrl, 0);

  objc_storeStrong((id *)&self->_bundleIds, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v5 = self->_stackIds;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v7);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v10 = self->_widgetIdentifiables;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v12);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v15 = self->_widgetInStackIdentifiables;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v17);
  }

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_visibleRect) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_engagedUrl) {
    PBDataWriterWriteStringField();
  }
  char v21 = (char)self->_has;
  if ((v21 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v21 = (char)self->_has;
  }
  if ((v21 & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v22 = self->_bundleIds;
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
        PBDataWriterWriteStringField();
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v24);
  }
}

- (void)setWidgetInStackIdentifiables:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)setWidgetIdentifiables:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)setVisibleRect:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (uint64_t)setSuggestedPageType:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 76) |= 2u;
    *(_DWORD *)(result + 40) = a2;
  }
  return result;
}

- (void)setStackIds:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (uint64_t)setPageIndex:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 76) |= 1u;
    *(void *)(result + 8) = a2;
  }
  return result;
}

- (void)setEngagedUrl:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setBundleIds:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (uint64_t)setHasPageIndex:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 76) = *(unsigned char *)(result + 76) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasPageIndex
{
  if (result) {
    return *(unsigned char *)(result + 76) & 1;
  }
  return result;
}

- (uint64_t)clearStackIds
{
  if (result) {
    return [*(id *)(result + 32) removeAllObjects];
  }
  return result;
}

- (uint64_t)addStackIds:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 32);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v6;

      v5 = *(void **)(a1 + 32);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)stackIdsCount
{
  if (result) {
    return [*(id *)(result + 32) count];
  }
  return result;
}

- (id)stackIdsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[4] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)clearWidgetIdentifiables
{
  if (result) {
    return [*(id *)(result + 56) removeAllObjects];
  }
  return result;
}

- (uint64_t)addWidgetIdentifiables:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 56);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v6;

      v5 = *(void **)(a1 + 56);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)widgetIdentifiablesCount
{
  if (result) {
    return [*(id *)(result + 56) count];
  }
  return result;
}

- (id)widgetIdentifiablesAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[7] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

+ (uint64_t)widgetIdentifiablesType
{
  self;

  return objc_opt_class();
}

- (uint64_t)clearWidgetInStackIdentifiables
{
  if (result) {
    return [*(id *)(result + 64) removeAllObjects];
  }
  return result;
}

- (uint64_t)addWidgetInStackIdentifiables:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 64);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v6;

      v5 = *(void **)(a1 + 64);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)widgetInStackIdentifiablesCount
{
  if (result) {
    return [*(id *)(result + 64) count];
  }
  return result;
}

- (id)widgetInStackIdentifiablesAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[8] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)setIsSuggestionInAddWidgetSheet:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 76) |= 8u;
    *(unsigned char *)(result + 73) = a2;
  }
  return result;
}

- (uint64_t)setHasIsSuggestionInAddWidgetSheet:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 8;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 76) = *(unsigned char *)(result + 76) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasIsSuggestionInAddWidgetSheet
{
  if (result) {
    return (*(unsigned __int8 *)(result + 76) >> 3) & 1;
  }
  return result;
}

- (uint64_t)setIsWidgetInTodayView:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 76) |= 0x10u;
    *(unsigned char *)(result + 74) = a2;
  }
  return result;
}

- (uint64_t)setHasIsWidgetInTodayView:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 16;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 76) = *(unsigned char *)(result + 76) & 0xEF | v2;
  }
  return result;
}

- (uint64_t)hasIsWidgetInTodayView
{
  if (result) {
    return (*(unsigned __int8 *)(result + 76) >> 4) & 1;
  }
  return result;
}

- (BOOL)hasVisibleRect
{
  if (result) {
    return *(void *)(result + 48) != 0;
  }
  return result;
}

- (BOOL)hasEngagedUrl
{
  if (result) {
    return *(void *)(result + 24) != 0;
  }
  return result;
}

- (uint64_t)setIsStalenessRotation:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 76) |= 4u;
    *(unsigned char *)(result + 72) = a2;
  }
  return result;
}

- (uint64_t)setHasIsStalenessRotation:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 4;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 76) = *(unsigned char *)(result + 76) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasIsStalenessRotation
{
  if (result) {
    return (*(unsigned __int8 *)(result + 76) >> 2) & 1;
  }
  return result;
}

- (uint64_t)suggestedPageType
{
  if (result)
  {
    if ((*(unsigned char *)(result + 76) & 2) != 0) {
      return *(unsigned int *)(result + 40);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)setHasSuggestedPageType:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 76) = *(unsigned char *)(result + 76) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasSuggestedPageType
{
  if (result) {
    return (*(unsigned __int8 *)(result + 76) >> 1) & 1;
  }
  return result;
}

- (__CFString)suggestedPageTypeAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5D06608[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsSuggestedPageType:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"Unspecified"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"Default"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"Custom"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"DND"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"Sleep"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"Driving"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"Exercise"])
    {
      uint64_t v6 = 6;
    }
    else if ([v5 isEqualToString:@"Work"])
    {
      uint64_t v6 = 7;
    }
    else if ([v5 isEqualToString:@"Personal"])
    {
      uint64_t v6 = 8;
    }
    else if ([v5 isEqualToString:@"Reading"])
    {
      uint64_t v6 = 9;
    }
    else if ([v5 isEqualToString:@"Gaming"])
    {
      uint64_t v6 = 10;
    }
    else if ([v5 isEqualToString:@"Mindfulness"])
    {
      uint64_t v6 = 11;
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

- (uint64_t)clearBundleIds
{
  if (result) {
    return [*(id *)(result + 16) removeAllObjects];
  }
  return result;
}

- (uint64_t)addBundleIds:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 16);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v6;

      id v5 = *(void **)(a1 + 16);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)bundleIdsCount
{
  if (result) {
    return [*(id *)(result + 16) count];
  }
  return result;
}

- (id)bundleIdsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[2] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBHomeScreenEventMetadata;
  id v4 = [(ATXPBHomeScreenEventMetadata *)&v8 description];
  id v5 = [(ATXPBHomeScreenEventMetadata *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_pageIndex];
    [v3 setObject:v4 forKey:@"pageIndex"];
  }
  stackIds = self->_stackIds;
  if (stackIds) {
    [v3 setObject:stackIds forKey:@"stackIds"];
  }
  if ([(NSMutableArray *)self->_widgetIdentifiables count])
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_widgetIdentifiables, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v7 = self->_widgetIdentifiables;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v36 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"widgetIdentifiables"];
  }
  if ([(NSMutableArray *)self->_widgetInStackIdentifiables count])
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_widgetInStackIdentifiables, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v14 = self->_widgetInStackIdentifiables;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v32 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"widgetInStackIdentifiables"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    char v21 = [NSNumber numberWithBool:self->_isSuggestionInAddWidgetSheet];
    [v3 setObject:v21 forKey:@"isSuggestionInAddWidgetSheet"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v22 = [NSNumber numberWithBool:self->_isWidgetInTodayView];
    [v3 setObject:v22 forKey:@"isWidgetInTodayView"];
  }
  visibleRect = self->_visibleRect;
  if (visibleRect)
  {
    uint64_t v24 = [(ATXPBCGRectWrapper *)visibleRect dictionaryRepresentation];
    [v3 setObject:v24 forKey:@"visibleRect"];
  }
  engagedUrl = self->_engagedUrl;
  if (engagedUrl) {
    [v3 setObject:engagedUrl forKey:@"engagedUrl"];
  }
  char v26 = (char)self->_has;
  if ((v26 & 4) != 0)
  {
    long long v27 = [NSNumber numberWithBool:self->_isStalenessRotation];
    [v3 setObject:v27 forKey:@"isStalenessRotation"];

    char v26 = (char)self->_has;
  }
  if ((v26 & 2) != 0)
  {
    uint64_t suggestedPageType = self->_suggestedPageType;
    if (suggestedPageType >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_suggestedPageType);
      long long v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v29 = off_1E5D06608[suggestedPageType];
    }
    [v3 setObject:v29 forKey:@"suggestedPageType"];
  }
  bundleIds = self->_bundleIds;
  if (bundleIds) {
    [v3 setObject:bundleIds forKey:@"bundleIds"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBHomeScreenEventMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(uint64_t)a1
{
  id v24 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 76))
    {
      *((void *)v24 + 1) = *(void *)(a1 + 8);
      *((unsigned char *)v24 + 76) |= 1u;
    }
    if ([*(id *)(a1 + 32) count])
    {
      if (v24) {
        [*((id *)v24 + 4) removeAllObjects];
      }
      uint64_t v3 = [*(id *)(a1 + 32) count];
      if (v3)
      {
        uint64_t v4 = v3;
        for (uint64_t i = 0; i != v4; ++i)
        {
          id v6 = -[ATXPBHomeScreenEventMetadata stackIdsAtIndex:]((id *)a1, i);
          -[ATXPBHomeScreenEventMetadata addStackIds:]((uint64_t)v24, v6);
        }
      }
    }
    if ([*(id *)(a1 + 56) count])
    {
      if (v24) {
        [*((id *)v24 + 7) removeAllObjects];
      }
      uint64_t v7 = [*(id *)(a1 + 56) count];
      if (v7)
      {
        uint64_t v8 = v7;
        for (uint64_t j = 0; j != v8; ++j)
        {
          uint64_t v10 = -[ATXPBHomeScreenEventMetadata widgetIdentifiablesAtIndex:]((id *)a1, j);
          -[ATXPBHomeScreenEventMetadata addWidgetIdentifiables:]((uint64_t)v24, v10);
        }
      }
    }
    if ([*(id *)(a1 + 64) count])
    {
      if (v24) {
        [*((id *)v24 + 8) removeAllObjects];
      }
      uint64_t v11 = [*(id *)(a1 + 64) count];
      if (v11)
      {
        uint64_t v12 = v11;
        for (uint64_t k = 0; k != v12; ++k)
        {
          v14 = -[ATXPBHomeScreenEventMetadata widgetInStackIdentifiablesAtIndex:]((id *)a1, k);
          -[ATXPBHomeScreenEventMetadata addWidgetInStackIdentifiables:]((uint64_t)v24, v14);
        }
      }
    }
    char v15 = *(unsigned char *)(a1 + 76);
    uint64_t v16 = v24;
    if ((v15 & 8) != 0)
    {
      *((unsigned char *)v24 + 73) = *(unsigned char *)(a1 + 73);
      *((unsigned char *)v24 + 76) |= 8u;
      char v15 = *(unsigned char *)(a1 + 76);
    }
    if ((v15 & 0x10) != 0)
    {
      *((unsigned char *)v24 + 74) = *(unsigned char *)(a1 + 74);
      *((unsigned char *)v24 + 76) |= 0x10u;
    }
    uint64_t v17 = *(void **)(a1 + 48);
    if (v17)
    {
      -[ATXPBHomeScreenEventMetadata setVisibleRect:]((uint64_t)v24, v17);
      uint64_t v16 = v24;
    }
    uint64_t v18 = *(void **)(a1 + 24);
    if (v18)
    {
      -[ATXPBHomeScreenEventMetadata setEngagedUrl:]((uint64_t)v24, v18);
      uint64_t v16 = v24;
    }
    char v19 = *(unsigned char *)(a1 + 76);
    if ((v19 & 4) != 0)
    {
      v16[72] = *(unsigned char *)(a1 + 72);
      v16[76] |= 4u;
      char v19 = *(unsigned char *)(a1 + 76);
    }
    if ((v19 & 2) != 0)
    {
      *((_DWORD *)v16 + 10) = *(_DWORD *)(a1 + 40);
      v16[76] |= 2u;
    }
    if ([*(id *)(a1 + 16) count])
    {
      if (v24) {
        [*((id *)v24 + 2) removeAllObjects];
      }
      uint64_t v20 = [*(id *)(a1 + 16) count];
      if (v20)
      {
        uint64_t v21 = v20;
        for (uint64_t m = 0; m != v21; ++m)
        {
          uint64_t v23 = -[ATXPBHomeScreenEventMetadata bundleIdsAtIndex:]((id *)a1, m);
          -[ATXPBHomeScreenEventMetadata addBundleIds:]((uint64_t)v24, v23);
        }
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_pageIndex;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v7 = self->_stackIds;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v51 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v50 + 1) + 8 * i) copyWithZone:a3];
        -[ATXPBHomeScreenEventMetadata addStackIds:](v6, v12);
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v9);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v13 = self->_widgetIdentifiables;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v47 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = (void *)[*(id *)(*((void *)&v46 + 1) + 8 * j) copyWithZone:a3];
        -[ATXPBHomeScreenEventMetadata addWidgetIdentifiables:](v6, v18);
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v15);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  char v19 = self->_widgetInStackIdentifiables;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v43;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v43 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = (void *)[*(id *)(*((void *)&v42 + 1) + 8 * k) copyWithZone:a3];
        -[ATXPBHomeScreenEventMetadata addWidgetInStackIdentifiables:](v6, v24);
      }
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v42 objects:v55 count:16];
    }
    while (v21);
  }

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v6 + 73) = self->_isSuggestionInAddWidgetSheet;
    *(unsigned char *)(v6 + 76) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(unsigned char *)(v6 + 74) = self->_isWidgetInTodayView;
    *(unsigned char *)(v6 + 76) |= 0x10u;
  }
  id v26 = [(ATXPBCGRectWrapper *)self->_visibleRect copyWithZone:a3];
  long long v27 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v26;

  uint64_t v28 = [(NSString *)self->_engagedUrl copyWithZone:a3];
  long long v29 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v28;

  char v30 = (char)self->_has;
  if ((v30 & 4) != 0)
  {
    *(unsigned char *)(v6 + 72) = self->_isStalenessRotation;
    *(unsigned char *)(v6 + 76) |= 4u;
    char v30 = (char)self->_has;
  }
  if ((v30 & 2) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_suggestedPageType;
    *(unsigned char *)(v6 + 76) |= 2u;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v31 = self->_bundleIds;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v38 objects:v54 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v39;
    do
    {
      for (uint64_t m = 0; m != v33; ++m)
      {
        if (*(void *)v39 != v34) {
          objc_enumerationMutation(v31);
        }
        long long v36 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * m), "copyWithZone:", a3, (void)v38);
        -[ATXPBHomeScreenEventMetadata addBundleIds:](v6, v36);
      }
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v38 objects:v54 count:16];
    }
    while (v33);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_48;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_pageIndex != *((void *)v4 + 1)) {
      goto LABEL_48;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_48;
  }
  stackIds = self->_stackIds;
  if ((unint64_t)stackIds | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](stackIds, "isEqual:"))
  {
    goto LABEL_48;
  }
  widgetIdentifiables = self->_widgetIdentifiables;
  if ((unint64_t)widgetIdentifiables | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](widgetIdentifiables, "isEqual:")) {
      goto LABEL_48;
    }
  }
  widgetInStackIdentifiables = self->_widgetInStackIdentifiables;
  if ((unint64_t)widgetInStackIdentifiables | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](widgetInStackIdentifiables, "isEqual:")) {
      goto LABEL_48;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 8) == 0) {
      goto LABEL_48;
    }
    if (self->_isSuggestionInAddWidgetSheet)
    {
      if (!*((unsigned char *)v4 + 73)) {
        goto LABEL_48;
      }
    }
    else if (*((unsigned char *)v4 + 73))
    {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 8) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 0x10) == 0) {
      goto LABEL_48;
    }
    if (self->_isWidgetInTodayView)
    {
      if (!*((unsigned char *)v4 + 74)) {
        goto LABEL_48;
      }
    }
    else if (*((unsigned char *)v4 + 74))
    {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 0x10) != 0)
  {
    goto LABEL_48;
  }
  visibleRect = self->_visibleRect;
  if ((unint64_t)visibleRect | *((void *)v4 + 6) && !-[ATXPBCGRectWrapper isEqual:](visibleRect, "isEqual:")) {
    goto LABEL_48;
  }
  engagedUrl = self->_engagedUrl;
  if ((unint64_t)engagedUrl | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](engagedUrl, "isEqual:")) {
      goto LABEL_48;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) != 0)
    {
      if (self->_isStalenessRotation)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_48;
        }
        goto LABEL_41;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_41;
      }
    }
LABEL_48:
    char v11 = 0;
    goto LABEL_49;
  }
  if ((*((unsigned char *)v4 + 76) & 4) != 0) {
    goto LABEL_48;
  }
LABEL_41:
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_suggestedPageType != *((_DWORD *)v4 + 10)) {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_48;
  }
  bundleIds = self->_bundleIds;
  if ((unint64_t)bundleIds | *((void *)v4 + 2)) {
    char v11 = -[NSMutableArray isEqual:](bundleIds, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_49:

  return v11;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_pageIndex;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_stackIds hash];
  uint64_t v5 = [(NSMutableArray *)self->_widgetIdentifiables hash];
  uint64_t v6 = [(NSMutableArray *)self->_widgetInStackIdentifiables hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v7 = 2654435761 * self->_isSuggestionInAddWidgetSheet;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_6:
      uint64_t v8 = 2654435761 * self->_isWidgetInTodayView;
      goto LABEL_9;
    }
  }
  uint64_t v8 = 0;
LABEL_9:
  unint64_t v9 = [(ATXPBCGRectWrapper *)self->_visibleRect hash];
  NSUInteger v10 = [(NSString *)self->_engagedUrl hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v11 = 2654435761 * self->_isStalenessRotation;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(NSMutableArray *)self->_bundleIds hash];
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_suggestedPageType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(NSMutableArray *)self->_bundleIds hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (*((unsigned char *)v3 + 76))
    {
      *(void *)(a1 + 8) = v3[1];
      *(unsigned char *)(a1 + 76) |= 1u;
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v5 = v3[4];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v42 != v8) {
            objc_enumerationMutation(v5);
          }
          -[ATXPBHomeScreenEventMetadata addStackIds:](a1, *(void **)(*((void *)&v41 + 1) + 8 * i));
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v41 objects:v48 count:16];
      }
      while (v7);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v10 = v4[7];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v38 != v13) {
            objc_enumerationMutation(v10);
          }
          -[ATXPBHomeScreenEventMetadata addWidgetIdentifiables:](a1, *(void **)(*((void *)&v37 + 1) + 8 * j));
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v12);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = v4[8];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (uint64_t k = 0; k != v17; ++k)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v15);
          }
          -[ATXPBHomeScreenEventMetadata addWidgetInStackIdentifiables:](a1, *(void **)(*((void *)&v33 + 1) + 8 * k));
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v46 count:16];
      }
      while (v17);
    }

    char v20 = *((unsigned char *)v4 + 76);
    if ((v20 & 8) != 0)
    {
      *(unsigned char *)(a1 + 73) = *((unsigned char *)v4 + 73);
      *(unsigned char *)(a1 + 76) |= 8u;
      char v20 = *((unsigned char *)v4 + 76);
    }
    if ((v20 & 0x10) != 0)
    {
      *(unsigned char *)(a1 + 74) = *((unsigned char *)v4 + 74);
      *(unsigned char *)(a1 + 76) |= 0x10u;
    }
    id v21 = v4[6];
    if (*(void *)(a1 + 48))
    {
      if (v21) {
        -[ATXPBCGRectWrapper mergeFrom:](*(void *)(a1 + 48), (uint64_t)v21);
      }
    }
    else if (v21)
    {
      objc_storeStrong((id *)(a1 + 48), v21);
    }
    id v22 = v4[3];
    if (v22) {
      objc_storeStrong((id *)(a1 + 24), v22);
    }
    char v23 = *((unsigned char *)v4 + 76);
    if ((v23 & 4) != 0)
    {
      *(unsigned char *)(a1 + 72) = *((unsigned char *)v4 + 72);
      *(unsigned char *)(a1 + 76) |= 4u;
      char v23 = *((unsigned char *)v4 + 76);
    }
    if ((v23 & 2) != 0)
    {
      *(_DWORD *)(a1 + 40) = *((_DWORD *)v4 + 10);
      *(unsigned char *)(a1 + 76) |= 2u;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v24 = v4[2];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v29 objects:v45 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v30;
      do
      {
        for (uint64_t m = 0; m != v26; ++m)
        {
          if (*(void *)v30 != v27) {
            objc_enumerationMutation(v24);
          }
          -[ATXPBHomeScreenEventMetadata addBundleIds:](a1, *(void **)(*((void *)&v29 + 1) + 8 * m));
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v29 objects:v45 count:16];
      }
      while (v26);
    }
  }
}

- (uint64_t)pageIndex
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)stackIds
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)widgetIdentifiables
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (uint64_t)widgetInStackIdentifiables
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (BOOL)isSuggestionInAddWidgetSheet
{
  if (result) {
    return *(unsigned char *)(result + 73) != 0;
  }
  return result;
}

- (BOOL)isWidgetInTodayView
{
  if (result) {
    return *(unsigned char *)(result + 74) != 0;
  }
  return result;
}

- (uint64_t)visibleRect
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (uint64_t)engagedUrl
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (BOOL)isStalenessRotation
{
  if (result) {
    return *(unsigned char *)(result + 72) != 0;
  }
  return result;
}

- (uint64_t)bundleIds
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

@end