@interface GEOAdvisoryNotice
+ (BOOL)isValid:(id)a3;
+ (Class)advisoryCardType;
+ (Class)advisoryItemType;
+ (Class)analyticsMessageValueType;
- (BOOL)hasAdvisoryType;
- (BOOL)hasDetailCardTitle;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasNoticeArtwork;
- (BOOL)hasNoticeText;
- (BOOL)hasShouldAlwaysShowAdvisoryCard;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldAlwaysShowAdvisoryCard;
- (GEOAdvisoryNotice)init;
- (GEOAdvisoryNotice)initWithData:(id)a3;
- (GEOAdvisoryNotice)initWithDictionary:(id)a3;
- (GEOAdvisoryNotice)initWithJSON:(id)a3;
- (GEOFormattedString)detailCardTitle;
- (GEOFormattedString)noticeText;
- (GEOPBTransitArtwork)noticeArtwork;
- (NSMutableArray)advisoryCards;
- (NSMutableArray)advisoryItems;
- (NSMutableArray)analyticsMessageValues;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)advisoryCardAtIndex:(unint64_t)a3;
- (id)advisoryItemAtIndex:(unint64_t)a3;
- (id)advisoryTypeAsString:(int)a3;
- (id)analyticsMessageValueAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsAdvisoryType:(id)a3;
- (int)advisoryType;
- (unint64_t)advisoryCardsCount;
- (unint64_t)advisoryItemsCount;
- (unint64_t)analyticsMessageValuesCount;
- (unint64_t)hash;
- (unint64_t)incidentIndexsCount;
- (unsigned)incidentIndexAtIndex:(unint64_t)a3;
- (unsigned)incidentIndexs;
- (void)_addNoFlagsAdvisoryCard:(uint64_t)a1;
- (void)_addNoFlagsAdvisoryItem:(uint64_t)a1;
- (void)_addNoFlagsAnalyticsMessageValue:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAdvisoryCards;
- (void)_readAdvisoryItems;
- (void)_readAnalyticsMessageValues;
- (void)_readDetailCardTitle;
- (void)_readIncidentIndexs;
- (void)_readNoticeArtwork;
- (void)_readNoticeText;
- (void)addAdvisoryCard:(id)a3;
- (void)addAdvisoryItem:(id)a3;
- (void)addAnalyticsMessageValue:(id)a3;
- (void)addIncidentIndex:(unsigned int)a3;
- (void)clearAdvisoryCards;
- (void)clearAdvisoryItems;
- (void)clearAnalyticsMessageValues;
- (void)clearIncidentIndexs;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAdvisoryCards:(id)a3;
- (void)setAdvisoryItems:(id)a3;
- (void)setAdvisoryType:(int)a3;
- (void)setAnalyticsMessageValues:(id)a3;
- (void)setDetailCardTitle:(id)a3;
- (void)setHasAdvisoryType:(BOOL)a3;
- (void)setHasShouldAlwaysShowAdvisoryCard:(BOOL)a3;
- (void)setIncidentIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setNoticeArtwork:(id)a3;
- (void)setNoticeText:(id)a3;
- (void)setShouldAlwaysShowAdvisoryCard:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAdvisoryNotice

- (GEOAdvisoryNotice)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAdvisoryNotice;
  v2 = [(GEOAdvisoryNotice *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAdvisoryNotice)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAdvisoryNotice;
  v3 = [(GEOAdvisoryNotice *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOAdvisoryNotice;
  [(GEOAdvisoryNotice *)&v3 dealloc];
}

- (void)_readNoticeText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryNoticeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNoticeText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasNoticeText
{
  return self->_noticeText != 0;
}

- (GEOFormattedString)noticeText
{
  -[GEOAdvisoryNotice _readNoticeText]((uint64_t)self);
  noticeText = self->_noticeText;

  return noticeText;
}

- (void)setNoticeText:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_noticeText, a3);
}

- (void)_readIncidentIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryNoticeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)incidentIndexsCount
{
  return self->_incidentIndexs.count;
}

- (unsigned)incidentIndexs
{
  return self->_incidentIndexs.list;
}

- (void)clearIncidentIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;

  PBRepeatedUInt32Clear();
}

- (void)addIncidentIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (unsigned)incidentIndexAtIndex:(unint64_t)a3
{
  -[GEOAdvisoryNotice _readIncidentIndexs]((uint64_t)self);
  p_incidentIndexs = &self->_incidentIndexs;
  unint64_t count = self->_incidentIndexs.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_incidentIndexs->list[a3];
}

- (void)setIncidentIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;

  MEMORY[0x1F4147400](&self->_incidentIndexs, a3, a4);
}

- (void)_readAdvisoryCards
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryNoticeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdvisoryCards_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (NSMutableArray)advisoryCards
{
  -[GEOAdvisoryNotice _readAdvisoryCards]((uint64_t)self);
  advisoryCards = self->_advisoryCards;

  return advisoryCards;
}

- (void)setAdvisoryCards:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  advisoryCards = self->_advisoryCards;
  self->_advisoryCards = v4;
}

- (void)clearAdvisoryCards
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  advisoryCards = self->_advisoryCards;

  [(NSMutableArray *)advisoryCards removeAllObjects];
}

- (void)addAdvisoryCard:(id)a3
{
  id v4 = a3;
  -[GEOAdvisoryNotice _readAdvisoryCards]((uint64_t)self);
  -[GEOAdvisoryNotice _addNoFlagsAdvisoryCard:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsAdvisoryCard:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)advisoryCardsCount
{
  -[GEOAdvisoryNotice _readAdvisoryCards]((uint64_t)self);
  advisoryCards = self->_advisoryCards;

  return [(NSMutableArray *)advisoryCards count];
}

- (id)advisoryCardAtIndex:(unint64_t)a3
{
  -[GEOAdvisoryNotice _readAdvisoryCards]((uint64_t)self);
  advisoryCards = self->_advisoryCards;

  return (id)[(NSMutableArray *)advisoryCards objectAtIndex:a3];
}

+ (Class)advisoryCardType
{
  return (Class)objc_opt_class();
}

- (void)_readAdvisoryItems
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryNoticeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdvisoryItems_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (NSMutableArray)advisoryItems
{
  -[GEOAdvisoryNotice _readAdvisoryItems]((uint64_t)self);
  advisoryItems = self->_advisoryItems;

  return advisoryItems;
}

- (void)setAdvisoryItems:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  advisoryItems = self->_advisoryItems;
  self->_advisoryItems = v4;
}

- (void)clearAdvisoryItems
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  advisoryItems = self->_advisoryItems;

  [(NSMutableArray *)advisoryItems removeAllObjects];
}

- (void)addAdvisoryItem:(id)a3
{
  id v4 = a3;
  -[GEOAdvisoryNotice _readAdvisoryItems]((uint64_t)self);
  -[GEOAdvisoryNotice _addNoFlagsAdvisoryItem:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsAdvisoryItem:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)advisoryItemsCount
{
  -[GEOAdvisoryNotice _readAdvisoryItems]((uint64_t)self);
  advisoryItems = self->_advisoryItems;

  return [(NSMutableArray *)advisoryItems count];
}

- (id)advisoryItemAtIndex:(unint64_t)a3
{
  -[GEOAdvisoryNotice _readAdvisoryItems]((uint64_t)self);
  advisoryItems = self->_advisoryItems;

  return (id)[(NSMutableArray *)advisoryItems objectAtIndex:a3];
}

+ (Class)advisoryItemType
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldAlwaysShowAdvisoryCard
{
  return self->_shouldAlwaysShowAdvisoryCard;
}

- (void)setShouldAlwaysShowAdvisoryCard:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  self->_shouldAlwaysShowAdvisoryCard = a3;
}

- (void)setHasShouldAlwaysShowAdvisoryCard:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1026;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasShouldAlwaysShowAdvisoryCard
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readDetailCardTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryNoticeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDetailCardTitle_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasDetailCardTitle
{
  return self->_detailCardTitle != 0;
}

- (GEOFormattedString)detailCardTitle
{
  -[GEOAdvisoryNotice _readDetailCardTitle]((uint64_t)self);
  detailCardTitle = self->_detailCardTitle;

  return detailCardTitle;
}

- (void)setDetailCardTitle:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_detailCardTitle, a3);
}

- (void)_readNoticeArtwork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryNoticeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNoticeArtwork_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasNoticeArtwork
{
  return self->_noticeArtwork != 0;
}

- (GEOPBTransitArtwork)noticeArtwork
{
  -[GEOAdvisoryNotice _readNoticeArtwork]((uint64_t)self);
  noticeArtwork = self->_noticeArtwork;

  return noticeArtwork;
}

- (void)setNoticeArtwork:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_noticeArtwork, a3);
}

- (void)_readAnalyticsMessageValues
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoryNoticeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnalyticsMessageValues_tags_424);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (NSMutableArray)analyticsMessageValues
{
  -[GEOAdvisoryNotice _readAnalyticsMessageValues]((uint64_t)self);
  analyticsMessageValues = self->_analyticsMessageValues;

  return analyticsMessageValues;
}

- (void)setAnalyticsMessageValues:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  analyticsMessageValues = self->_analyticsMessageValues;
  self->_analyticsMessageValues = v4;
}

- (void)clearAnalyticsMessageValues
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  analyticsMessageValues = self->_analyticsMessageValues;

  [(NSMutableArray *)analyticsMessageValues removeAllObjects];
}

- (void)addAnalyticsMessageValue:(id)a3
{
  id v4 = a3;
  -[GEOAdvisoryNotice _readAnalyticsMessageValues]((uint64_t)self);
  -[GEOAdvisoryNotice _addNoFlagsAnalyticsMessageValue:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsAnalyticsMessageValue:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)analyticsMessageValuesCount
{
  -[GEOAdvisoryNotice _readAnalyticsMessageValues]((uint64_t)self);
  analyticsMessageValues = self->_analyticsMessageValues;

  return [(NSMutableArray *)analyticsMessageValues count];
}

- (id)analyticsMessageValueAtIndex:(unint64_t)a3
{
  -[GEOAdvisoryNotice _readAnalyticsMessageValues]((uint64_t)self);
  analyticsMessageValues = self->_analyticsMessageValues;

  return (id)[(NSMutableArray *)analyticsMessageValues objectAtIndex:a3];
}

+ (Class)analyticsMessageValueType
{
  return (Class)objc_opt_class();
}

- (int)advisoryType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_advisoryType;
  }
  else {
    return 0;
  }
}

- (void)setAdvisoryType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  self->_advisoryType = a3;
}

- (void)setHasAdvisoryType:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasAdvisoryType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)advisoryTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"FOOTER";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"UNKNOWN";
  }
  return v4;
}

- (int)StringAsAdvisoryType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"FOOTER"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAdvisoryNotice;
  int v4 = [(GEOAdvisoryNotice *)&v8 description];
  id v5 = [(GEOAdvisoryNotice *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAdvisoryNotice _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 noticeText];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"noticeText";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"notice_text";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (*(void *)(a1 + 32))
    {
      v9 = PBRepeatedUInt32NSArray();
      if (a2) {
        v10 = @"incidentIndex";
      }
      else {
        v10 = @"incident_index";
      }
      [v4 setObject:v9 forKey:v10];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v12 = *(id *)(a1 + 48);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v57 objects:v62 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v58 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            if (a2) {
              [v17 jsonRepresentation];
            }
            else {
            v18 = [v17 dictionaryRepresentation];
            }
            [v11 addObject:v18];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v57 objects:v62 count:16];
        }
        while (v14);
      }

      if (a2) {
        v19 = @"advisoryCard";
      }
      else {
        v19 = @"advisory_card";
      }
      [v4 setObject:v11 forKey:v19];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v21 = *(id *)(a1 + 56);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v53 objects:v61 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v54;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v54 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v53 + 1) + 8 * j);
            if (a2) {
              [v26 jsonRepresentation];
            }
            else {
            v27 = [v26 dictionaryRepresentation];
            }
            [v20 addObject:v27];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v53 objects:v61 count:16];
        }
        while (v23);
      }

      if (a2) {
        v28 = @"advisoryItem";
      }
      else {
        v28 = @"advisory_item";
      }
      [v4 setObject:v20 forKey:v28];
    }
    if ((*(_WORD *)(a1 + 116) & 2) != 0)
    {
      v29 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 112)];
      if (a2) {
        v30 = @"shouldAlwaysShowAdvisoryCard";
      }
      else {
        v30 = @"should_always_show_advisory_card";
      }
      [v4 setObject:v29 forKey:v30];
    }
    v31 = [(id)a1 detailCardTitle];
    v32 = v31;
    if (v31)
    {
      if (a2)
      {
        v33 = [v31 jsonRepresentation];
        v34 = @"detailCardTitle";
      }
      else
      {
        v33 = [v31 dictionaryRepresentation];
        v34 = @"detail_card_title";
      }
      [v4 setObject:v33 forKey:v34];
    }
    v35 = [(id)a1 noticeArtwork];
    v36 = v35;
    if (v35)
    {
      if (a2)
      {
        v37 = [v35 jsonRepresentation];
        v38 = @"noticeArtwork";
      }
      else
      {
        v37 = [v35 dictionaryRepresentation];
        v38 = @"notice_artwork";
      }
      [v4 setObject:v37 forKey:v38];
    }
    if (*(void *)(a1 + 64))
    {
      v39 = [(id)a1 analyticsMessageValues];
      if (a2) {
        v40 = @"analyticsMessageValue";
      }
      else {
        v40 = @"analytics_message_value";
      }
      [v4 setObject:v39 forKey:v40];
    }
    if (*(_WORD *)(a1 + 116))
    {
      int v41 = *(_DWORD *)(a1 + 108);
      if (v41)
      {
        if (v41 == 1)
        {
          v42 = @"FOOTER";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 108));
          v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v42 = @"UNKNOWN";
      }
      if (a2) {
        v43 = @"advisoryType";
      }
      else {
        v43 = @"advisory_type";
      }
      [v4 setObject:v42 forKey:v43];
    }
    v44 = *(void **)(a1 + 16);
    if (v44)
    {
      v45 = [v44 dictionaryRepresentation];
      v46 = v45;
      if (a2)
      {
        v47 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v45, "count"));
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __47__GEOAdvisoryNotice__dictionaryRepresentation___block_invoke;
        v51[3] = &unk_1E53D8860;
        id v48 = v47;
        id v52 = v48;
        [v46 enumerateKeysAndObjectsUsingBlock:v51];
        id v49 = v48;

        v46 = v49;
      }
      [v4 setObject:v46 forKey:@"Unknown Fields"];
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
  return -[GEOAdvisoryNotice _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOAdvisoryNotice__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (GEOAdvisoryNotice)initWithDictionary:(id)a3
{
  return (GEOAdvisoryNotice *)-[GEOAdvisoryNotice _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"noticeText";
      }
      else {
        objc_super v6 = @"notice_text";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v9 = [(GEOFormattedString *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOFormattedString *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setNoticeText:v9];
      }
      if (a3) {
        v11 = @"incidentIndex";
      }
      else {
        v11 = @"incident_index";
      }
      id v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      id v69 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v82 objects:v89 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v83;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v83 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v82 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addIncidentIndex:", objc_msgSend(v18, "unsignedIntValue"));
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v82 objects:v89 count:16];
          }
          while (v15);
        }

        id v5 = v69;
      }

      if (a3) {
        v19 = @"advisoryCard";
      }
      else {
        v19 = @"advisory_card";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        v67 = v20;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v78 objects:v88 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v79;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v79 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void *)(*((void *)&v78 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v27 = [GEOAdvisoryCard alloc];
                if (a3) {
                  uint64_t v28 = [(GEOAdvisoryCard *)v27 initWithJSON:v26];
                }
                else {
                  uint64_t v28 = [(GEOAdvisoryCard *)v27 initWithDictionary:v26];
                }
                v29 = (void *)v28;
                objc_msgSend(a1, "addAdvisoryCard:", v28, v67);
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v78 objects:v88 count:16];
          }
          while (v23);
        }

        v20 = v67;
        id v5 = v69;
      }

      if (a3) {
        v30 = @"advisoryItem";
      }
      else {
        v30 = @"advisory_item";
      }
      v31 = objc_msgSend(v5, "objectForKeyedSubscript:", v30, v67);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        v68 = v31;
        id v32 = v31;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v74 objects:v87 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v75;
          do
          {
            for (uint64_t k = 0; k != v34; ++k)
            {
              if (*(void *)v75 != v35) {
                objc_enumerationMutation(v32);
              }
              uint64_t v37 = *(void *)(*((void *)&v74 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v38 = [GEOAdvisoryItem alloc];
                if (a3) {
                  uint64_t v39 = [(GEOAdvisoryItem *)v38 initWithJSON:v37];
                }
                else {
                  uint64_t v39 = [(GEOAdvisoryItem *)v38 initWithDictionary:v37];
                }
                v40 = (void *)v39;
                objc_msgSend(a1, "addAdvisoryItem:", v39, v68);
              }
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v74 objects:v87 count:16];
          }
          while (v34);
        }

        v31 = v68;
        id v5 = v69;
      }

      if (a3) {
        int v41 = @"shouldAlwaysShowAdvisoryCard";
      }
      else {
        int v41 = @"should_always_show_advisory_card";
      }
      v42 = objc_msgSend(v5, "objectForKeyedSubscript:", v41, v68);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setShouldAlwaysShowAdvisoryCard:", objc_msgSend(v42, "BOOLValue"));
      }

      if (a3) {
        v43 = @"detailCardTitle";
      }
      else {
        v43 = @"detail_card_title";
      }
      v44 = [v5 objectForKeyedSubscript:v43];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v45 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v46 = [(GEOFormattedString *)v45 initWithJSON:v44];
        }
        else {
          uint64_t v46 = [(GEOFormattedString *)v45 initWithDictionary:v44];
        }
        v47 = (void *)v46;
        [a1 setDetailCardTitle:v46];
      }
      if (a3) {
        id v48 = @"noticeArtwork";
      }
      else {
        id v48 = @"notice_artwork";
      }
      id v49 = [v5 objectForKeyedSubscript:v48];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v50 = [GEOPBTransitArtwork alloc];
        if (a3) {
          uint64_t v51 = [(GEOPBTransitArtwork *)v50 initWithJSON:v49];
        }
        else {
          uint64_t v51 = [(GEOPBTransitArtwork *)v50 initWithDictionary:v49];
        }
        id v52 = (void *)v51;
        [a1 setNoticeArtwork:v51];
      }
      if (a3) {
        long long v53 = @"analyticsMessageValue";
      }
      else {
        long long v53 = @"analytics_message_value";
      }
      long long v54 = [v5 objectForKeyedSubscript:v53];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v55 = v54;
        uint64_t v56 = [v55 countByEnumeratingWithState:&v70 objects:v86 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          uint64_t v58 = *(void *)v71;
          do
          {
            for (uint64_t m = 0; m != v57; ++m)
            {
              if (*(void *)v71 != v58) {
                objc_enumerationMutation(v55);
              }
              long long v60 = *(void **)(*((void *)&v70 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v61 = (void *)[v60 copy];
                [a1 addAnalyticsMessageValue:v61];
              }
            }
            uint64_t v57 = [v55 countByEnumeratingWithState:&v70 objects:v86 count:16];
          }
          while (v57);
        }

        id v5 = v69;
      }

      if (a3) {
        v62 = @"advisoryType";
      }
      else {
        v62 = @"advisory_type";
      }
      uint64_t v63 = [v5 objectForKeyedSubscript:v62];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v64 = v63;
        if ([v64 isEqualToString:@"UNKNOWN"]) {
          uint64_t v65 = 0;
        }
        else {
          uint64_t v65 = [v64 isEqualToString:@"FOOTER"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_105:

          goto LABEL_106;
        }
        uint64_t v65 = [v63 intValue];
      }
      [a1 setAdvisoryType:v65];
      goto LABEL_105;
    }
  }
LABEL_106:

  return a1;
}

- (GEOAdvisoryNotice)initWithJSON:(id)a3
{
  return (GEOAdvisoryNotice *)-[GEOAdvisoryNotice _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_461;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_462;
    }
    GEOAdvisoryNoticeReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOAdvisoryNoticeCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAdvisoryNoticeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAdvisoryNoticeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAdvisoryNoticeIsDirty((uint64_t)self) & 1) == 0)
  {
    v19 = self->_reader;
    objc_sync_enter(v19);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v20 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v20];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOAdvisoryNotice *)self readAll:0];
    if (self->_noticeText) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_incidentIndexs.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_incidentIndexs.count);
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = self->_advisoryCards;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v8);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v11 = self->_advisoryItems;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v12);
    }

    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_detailCardTitle) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_noticeArtwork) {
      PBDataWriterWriteSubmessage();
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v15 = self->_analyticsMessageValues;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t k = 0; k != v16; ++k)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v15);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
      }
      while (v16);
    }

    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v21);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  -[GEOAdvisoryNotice _readAdvisoryCards]((uint64_t)self);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = self->_advisoryCards;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v20 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        goto LABEL_18;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEOAdvisoryNotice _readAdvisoryItems]((uint64_t)self);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_advisoryItems;
  uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
LABEL_11:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v17 != v12) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3, (void)v16)) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_18:
    BOOL v14 = 1;
    goto LABEL_19;
  }
LABEL_17:
  BOOL v14 = 0;
LABEL_19:

  return v14;
}

- (void)copyTo:(id)a3
{
  long long v19 = (id *)a3;
  [(GEOAdvisoryNotice *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v19 + 1, self->_reader);
  *((_DWORD *)v19 + 24) = self->_readerMarkPos;
  *((_DWORD *)v19 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_noticeText) {
    objc_msgSend(v19, "setNoticeText:");
  }
  if ([(GEOAdvisoryNotice *)self incidentIndexsCount])
  {
    [v19 clearIncidentIndexs];
    unint64_t v4 = [(GEOAdvisoryNotice *)self incidentIndexsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v19, "addIncidentIndex:", -[GEOAdvisoryNotice incidentIndexAtIndex:](self, "incidentIndexAtIndex:", i));
    }
  }
  if ([(GEOAdvisoryNotice *)self advisoryCardsCount])
  {
    [v19 clearAdvisoryCards];
    unint64_t v7 = [(GEOAdvisoryNotice *)self advisoryCardsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        uint64_t v10 = [(GEOAdvisoryNotice *)self advisoryCardAtIndex:j];
        [v19 addAdvisoryCard:v10];
      }
    }
  }
  if ([(GEOAdvisoryNotice *)self advisoryItemsCount])
  {
    [v19 clearAdvisoryItems];
    unint64_t v11 = [(GEOAdvisoryNotice *)self advisoryItemsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
      {
        BOOL v14 = [(GEOAdvisoryNotice *)self advisoryItemAtIndex:k];
        [v19 addAdvisoryItem:v14];
      }
    }
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((unsigned char *)v19 + 112) = self->_shouldAlwaysShowAdvisoryCard;
    *((_WORD *)v19 + 58) |= 2u;
  }
  if (self->_detailCardTitle) {
    objc_msgSend(v19, "setDetailCardTitle:");
  }
  if (self->_noticeArtwork) {
    objc_msgSend(v19, "setNoticeArtwork:");
  }
  if ([(GEOAdvisoryNotice *)self analyticsMessageValuesCount])
  {
    [v19 clearAnalyticsMessageValues];
    unint64_t v15 = [(GEOAdvisoryNotice *)self analyticsMessageValuesCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
      {
        long long v18 = [(GEOAdvisoryNotice *)self analyticsMessageValueAtIndex:m];
        [v19 addAnalyticsMessageValue:v18];
      }
    }
  }
  if (*(_WORD *)&self->_flags)
  {
    *((_DWORD *)v19 + 27) = self->_advisoryType;
    *((_WORD *)v19 + 58) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOAdvisoryNoticeReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_31;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOAdvisoryNotice *)self readAll:0];
  id v9 = [(GEOFormattedString *)self->_noticeText copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v9;

  PBRepeatedUInt32Copy();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unint64_t v11 = self->_advisoryCards;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v11);
        }
        unint64_t v15 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addAdvisoryCard:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v12);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  unint64_t v16 = self->_advisoryItems;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addAdvisoryItem:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v17);
  }

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 112) = self->_shouldAlwaysShowAdvisoryCard;
    *(_WORD *)(v5 + 116) |= 2u;
  }
  id v21 = [(GEOFormattedString *)self->_detailCardTitle copyWithZone:a3];
  long long v22 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v21;

  id v23 = [(GEOPBTransitArtwork *)self->_noticeArtwork copyWithZone:a3];
  long long v24 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v23;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v25 = self->_analyticsMessageValues;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v25);
        }
        long long v29 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * k), "copyWithZone:", a3, (void)v32);
        [(id)v5 addAnalyticsMessageValue:v29];
      }
      uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v26);
  }

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 108) = self->_advisoryType;
    *(_WORD *)(v5 + 116) |= 1u;
  }
  long long v30 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v30;
LABEL_31:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  [(GEOAdvisoryNotice *)self readAll:1];
  [v4 readAll:1];
  noticeText = self->_noticeText;
  if ((unint64_t)noticeText | *((void *)v4 + 11))
  {
    if (!-[GEOFormattedString isEqual:](noticeText, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_27;
  }
  advisoryCards = self->_advisoryCards;
  if ((unint64_t)advisoryCards | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](advisoryCards, "isEqual:")) {
      goto LABEL_27;
    }
  }
  advisoryItems = self->_advisoryItems;
  if ((unint64_t)advisoryItems | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](advisoryItems, "isEqual:")) {
      goto LABEL_27;
    }
  }
  __int16 v8 = *((_WORD *)v4 + 58);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v8 & 2) != 0)
    {
      if (self->_shouldAlwaysShowAdvisoryCard)
      {
        if (!*((unsigned char *)v4 + 112)) {
          goto LABEL_27;
        }
        goto LABEL_17;
      }
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_17;
      }
    }
LABEL_27:
    BOOL v13 = 0;
    goto LABEL_28;
  }
  if ((v8 & 2) != 0) {
    goto LABEL_27;
  }
LABEL_17:
  detailCardTitle = self->_detailCardTitle;
  if ((unint64_t)detailCardTitle | *((void *)v4 + 9)
    && !-[GEOFormattedString isEqual:](detailCardTitle, "isEqual:"))
  {
    goto LABEL_27;
  }
  noticeArtworuint64_t k = self->_noticeArtwork;
  if ((unint64_t)noticeArtwork | *((void *)v4 + 10))
  {
    if (!-[GEOPBTransitArtwork isEqual:](noticeArtwork, "isEqual:")) {
      goto LABEL_27;
    }
  }
  analyticsMessageValues = self->_analyticsMessageValues;
  if ((unint64_t)analyticsMessageValues | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](analyticsMessageValues, "isEqual:")) {
      goto LABEL_27;
    }
  }
  __int16 v12 = *((_WORD *)v4 + 58);
  BOOL v13 = (v12 & 1) == 0;
  if (*(_WORD *)&self->_flags)
  {
    if ((v12 & 1) == 0 || self->_advisoryType != *((_DWORD *)v4 + 27)) {
      goto LABEL_27;
    }
    BOOL v13 = 1;
  }
LABEL_28:

  return v13;
}

- (unint64_t)hash
{
  [(GEOAdvisoryNotice *)self readAll:1];
  unint64_t v12 = [(GEOFormattedString *)self->_noticeText hash];
  uint64_t v3 = PBRepeatedUInt32Hash();
  uint64_t v4 = [(NSMutableArray *)self->_advisoryCards hash];
  uint64_t v5 = [(NSMutableArray *)self->_advisoryItems hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_shouldAlwaysShowAdvisoryCard;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(GEOFormattedString *)self->_detailCardTitle hash];
  unint64_t v8 = [(GEOPBTransitArtwork *)self->_noticeArtwork hash];
  uint64_t v9 = [(NSMutableArray *)self->_analyticsMessageValues hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v10 = 2654435761 * self->_advisoryType;
  }
  else {
    uint64_t v10 = 0;
  }
  return v3 ^ v12 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  noticeText = self->_noticeText;
  uint64_t v6 = *((void *)v4 + 11);
  if (noticeText)
  {
    if (v6) {
      -[GEOFormattedString mergeFrom:](noticeText, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOAdvisoryNotice setNoticeText:](self, "setNoticeText:");
  }
  uint64_t v7 = [v4 incidentIndexsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[GEOAdvisoryNotice addIncidentIndex:](self, "addIncidentIndex:", [v4 incidentIndexAtIndex:i]);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = *((id *)v4 + 6);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v43 count:16];
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
        [(GEOAdvisoryNotice *)self addAdvisoryCard:*(void *)(*((void *)&v37 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v12);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v15 = *((id *)v4 + 7);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v42 count:16];
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
        [(GEOAdvisoryNotice *)self addAdvisoryItem:*(void *)(*((void *)&v33 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v17);
  }

  if ((*((_WORD *)v4 + 58) & 2) != 0)
  {
    self->_shouldAlwaysShowAdvisoryCard = *((unsigned char *)v4 + 112);
    *(_WORD *)&self->_flags |= 2u;
  }
  detailCardTitle = self->_detailCardTitle;
  uint64_t v21 = *((void *)v4 + 9);
  if (detailCardTitle)
  {
    if (v21) {
      -[GEOFormattedString mergeFrom:](detailCardTitle, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[GEOAdvisoryNotice setDetailCardTitle:](self, "setDetailCardTitle:");
  }
  noticeArtworuint64_t k = self->_noticeArtwork;
  uint64_t v23 = *((void *)v4 + 10);
  if (noticeArtwork)
  {
    if (v23) {
      -[GEOPBTransitArtwork mergeFrom:](noticeArtwork, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[GEOAdvisoryNotice setNoticeArtwork:](self, "setNoticeArtwork:");
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v24 = *((id *)v4 + 8);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v29 objects:v41 count:16];
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
        -[GEOAdvisoryNotice addAnalyticsMessageValue:](self, "addAnalyticsMessageValue:", *(void *)(*((void *)&v29 + 1) + 8 * m), (void)v29);
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v26);
  }

  if (*((_WORD *)v4 + 58))
  {
    self->_advisoryType = *((_DWORD *)v4 + 27);
    *(_WORD *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOAdvisoryNoticeReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_466);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x404u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOAdvisoryNotice *)self readAll:0];
    [(GEOFormattedString *)self->_noticeText clearUnknownFields:1];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_advisoryCards;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = self->_advisoryItems;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }

    [(GEOFormattedString *)self->_detailCardTitle clearUnknownFields:1];
    [(GEOPBTransitArtwork *)self->_noticeArtwork clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noticeText, 0);
  objc_storeStrong((id *)&self->_noticeArtwork, 0);
  objc_storeStrong((id *)&self->_detailCardTitle, 0);
  objc_storeStrong((id *)&self->_analyticsMessageValues, 0);
  objc_storeStrong((id *)&self->_advisoryItems, 0);
  objc_storeStrong((id *)&self->_advisoryCards, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end