@interface GEOAnnouncement
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAnnouncementID;
- (BOOL)hasAnnouncementType;
- (BOOL)hasButtonOneAppURI;
- (BOOL)hasButtonOneMessage;
- (BOOL)hasButtonTwoAppURI;
- (BOOL)hasButtonTwoMessage;
- (BOOL)hasDisplayDestinations;
- (BOOL)hasFlyoverInfo;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMapRegion;
- (BOOL)hasReleasePhase;
- (BOOL)hasTitle;
- (BOOL)hasUserMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAnnouncement)init;
- (GEOAnnouncement)initWithData:(id)a3;
- (GEOAnnouncement)initWithDictionary:(id)a3;
- (GEOAnnouncement)initWithJSON:(id)a3;
- (GEOMapRegion)mapRegion;
- (GEOPDFlyover)flyoverInfo;
- (NSString)buttonOneAppURI;
- (NSString)buttonOneMessage;
- (NSString)buttonTwoAppURI;
- (NSString)buttonTwoMessage;
- (NSString)title;
- (NSString)userMessage;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)announcementTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)releasePhaseAsString:(int)a3;
- (int)StringAsAnnouncementType:(id)a3;
- (int)StringAsReleasePhase:(id)a3;
- (int)announcementType;
- (int)releasePhase;
- (unint64_t)hash;
- (unsigned)announcementID;
- (unsigned)displayDestinations;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readButtonOneAppURI;
- (void)_readButtonOneMessage;
- (void)_readButtonTwoAppURI;
- (void)_readButtonTwoMessage;
- (void)_readFlyoverInfo;
- (void)_readMapRegion;
- (void)_readTitle;
- (void)_readUserMessage;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAnnouncementID:(unsigned int)a3;
- (void)setAnnouncementType:(int)a3;
- (void)setButtonOneAppURI:(id)a3;
- (void)setButtonOneMessage:(id)a3;
- (void)setButtonTwoAppURI:(id)a3;
- (void)setButtonTwoMessage:(id)a3;
- (void)setDisplayDestinations:(unsigned int)a3;
- (void)setFlyoverInfo:(id)a3;
- (void)setHasAnnouncementID:(BOOL)a3;
- (void)setHasAnnouncementType:(BOOL)a3;
- (void)setHasDisplayDestinations:(BOOL)a3;
- (void)setHasReleasePhase:(BOOL)a3;
- (void)setMapRegion:(id)a3;
- (void)setReleasePhase:(int)a3;
- (void)setTitle:(id)a3;
- (void)setUserMessage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAnnouncement

- (GEOAnnouncement)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAnnouncement;
  v2 = [(GEOAnnouncement *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAnnouncement)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAnnouncement;
  v3 = [(GEOAnnouncement *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)announcementID
{
  return self->_announcementID;
}

- (void)setAnnouncementID:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_announcementID = a3;
}

- (void)setHasAnnouncementID:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasAnnouncementID
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAnnouncementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRegion_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasMapRegion
{
  return self->_mapRegion != 0;
}

- (GEOMapRegion)mapRegion
{
  -[GEOAnnouncement _readMapRegion]((uint64_t)self);
  mapRegion = self->_mapRegion;

  return mapRegion;
}

- (void)setMapRegion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void)_readUserMessage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAnnouncementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserMessage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasUserMessage
{
  return self->_userMessage != 0;
}

- (NSString)userMessage
{
  -[GEOAnnouncement _readUserMessage]((uint64_t)self);
  userMessage = self->_userMessage;

  return userMessage;
}

- (void)setUserMessage:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1800u;
  objc_storeStrong((id *)&self->_userMessage, a3);
}

- (void)_readButtonOneMessage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAnnouncementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readButtonOneMessage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasButtonOneMessage
{
  return self->_buttonOneMessage != 0;
}

- (NSString)buttonOneMessage
{
  -[GEOAnnouncement _readButtonOneMessage]((uint64_t)self);
  buttonOneMessage = self->_buttonOneMessage;

  return buttonOneMessage;
}

- (void)setButtonOneMessage:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  objc_storeStrong((id *)&self->_buttonOneMessage, a3);
}

- (void)_readButtonOneAppURI
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAnnouncementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readButtonOneAppURI_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasButtonOneAppURI
{
  return self->_buttonOneAppURI != 0;
}

- (NSString)buttonOneAppURI
{
  -[GEOAnnouncement _readButtonOneAppURI]((uint64_t)self);
  buttonOneAppURI = self->_buttonOneAppURI;

  return buttonOneAppURI;
}

- (void)setButtonOneAppURI:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1010u;
  objc_storeStrong((id *)&self->_buttonOneAppURI, a3);
}

- (void)_readButtonTwoMessage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAnnouncementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readButtonTwoMessage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasButtonTwoMessage
{
  return self->_buttonTwoMessage != 0;
}

- (NSString)buttonTwoMessage
{
  -[GEOAnnouncement _readButtonTwoMessage]((uint64_t)self);
  buttonTwoMessage = self->_buttonTwoMessage;

  return buttonTwoMessage;
}

- (void)setButtonTwoMessage:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1080u;
  objc_storeStrong((id *)&self->_buttonTwoMessage, a3);
}

- (void)_readButtonTwoAppURI
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAnnouncementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readButtonTwoAppURI_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasButtonTwoAppURI
{
  return self->_buttonTwoAppURI != 0;
}

- (NSString)buttonTwoAppURI
{
  -[GEOAnnouncement _readButtonTwoAppURI]((uint64_t)self);
  buttonTwoAppURI = self->_buttonTwoAppURI;

  return buttonTwoAppURI;
}

- (void)setButtonTwoAppURI:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1040u;
  objc_storeStrong((id *)&self->_buttonTwoAppURI, a3);
}

- (unsigned)displayDestinations
{
  return self->_displayDestinations;
}

- (void)setDisplayDestinations:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  self->_displayDestinations = a3;
}

- (void)setHasDisplayDestinations:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4100;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasDisplayDestinations
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (int)releasePhase
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0) {
    return self->_releasePhase;
  }
  else {
    return 1;
  }
}

- (void)setReleasePhase:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  self->_releasePhase = a3;
}

- (void)setHasReleasePhase:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4104;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasReleasePhase
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)releasePhaseAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53DF9D0[a3 - 1];
  }

  return v3;
}

- (int)StringAsReleasePhase:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PHASE_PRODUCTION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PHASE_INTERNAL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PHASE_BETA"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)_readFlyoverInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAnnouncementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFlyoverInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasFlyoverInfo
{
  return self->_flyoverInfo != 0;
}

- (GEOPDFlyover)flyoverInfo
{
  -[GEOAnnouncement _readFlyoverInfo]((uint64_t)self);
  flyoverInfo = self->_flyoverInfo;

  return flyoverInfo;
}

- (void)setFlyoverInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1100u;
  objc_storeStrong((id *)&self->_flyoverInfo, a3);
}

- (void)_readTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAnnouncementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (NSString)title
{
  -[GEOAnnouncement _readTitle]((uint64_t)self);
  title = self->_title;

  return title;
}

- (void)setTitle:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1400u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (int)announcementType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_announcementType;
  }
  else {
    return 0;
  }
}

- (void)setAnnouncementType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_announcementType = a3;
}

- (void)setHasAnnouncementType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4098;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasAnnouncementType
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)announcementTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53DF9E8[a3];
  }

  return v3;
}

- (int)StringAsAnnouncementType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_GENERAL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_FLYOVER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_TRANSIT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_VENUES"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_ENHANCED_DETAIL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_LANE_GUIDANCE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_LOOK_AROUND"])
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
  v8.super_class = (Class)GEOAnnouncement;
  int v4 = [(GEOAnnouncement *)&v8 description];
  v5 = [(GEOAnnouncement *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAnnouncement _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(_WORD *)(a1 + 108))
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
      [v4 setObject:v5 forKey:@"announcementID"];
    }
    objc_super v6 = [(id)a1 mapRegion];
    objc_super v7 = v6;
    if (v6)
    {
      if (a2) {
        [v6 jsonRepresentation];
      }
      else {
      objc_super v8 = [v6 dictionaryRepresentation];
      }
      [v4 setObject:v8 forKey:@"mapRegion"];
    }
    v9 = [(id)a1 userMessage];
    if (v9) {
      [v4 setObject:v9 forKey:@"userMessage"];
    }

    v10 = [(id)a1 buttonOneMessage];
    if (v10) {
      [v4 setObject:v10 forKey:@"buttonOneMessage"];
    }

    v11 = [(id)a1 buttonOneAppURI];
    if (v11) {
      [v4 setObject:v11 forKey:@"buttonOneAppURI"];
    }

    v12 = [(id)a1 buttonTwoMessage];
    if (v12) {
      [v4 setObject:v12 forKey:@"buttonTwoMessage"];
    }

    v13 = [(id)a1 buttonTwoAppURI];
    if (v13) {
      [v4 setObject:v13 forKey:@"buttonTwoAppURI"];
    }

    __int16 v14 = *(_WORD *)(a1 + 108);
    if ((v14 & 4) != 0)
    {
      v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 100)];
      [v4 setObject:v15 forKey:@"displayDestinations"];

      __int16 v14 = *(_WORD *)(a1 + 108);
    }
    if ((v14 & 8) != 0)
    {
      unsigned int v16 = *(_DWORD *)(a1 + 104) - 1;
      if (v16 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 104));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = off_1E53DF9D0[v16];
      }
      [v4 setObject:v17 forKey:@"releasePhase"];
    }
    v18 = [(id)a1 flyoverInfo];
    v19 = v18;
    if (v18)
    {
      if (a2) {
        [v18 jsonRepresentation];
      }
      else {
      v20 = [v18 dictionaryRepresentation];
      }
      [v4 setObject:v20 forKey:@"flyoverInfo"];
    }
    v21 = [(id)a1 title];
    if (v21) {
      [v4 setObject:v21 forKey:@"title"];
    }

    if ((*(_WORD *)(a1 + 108) & 2) != 0)
    {
      uint64_t v22 = *(int *)(a1 + 96);
      if (v22 >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 96));
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = off_1E53DF9E8[v22];
      }
      [v4 setObject:v23 forKey:@"announcementType"];
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
  return -[GEOAnnouncement _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOAnnouncement)initWithDictionary:(id)a3
{
  return (GEOAnnouncement *)-[GEOAnnouncement _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"announcementID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAnnouncementID:", objc_msgSend(v6, "unsignedIntValue"));
      }

      objc_super v7 = [v5 objectForKeyedSubscript:@"mapRegion"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOMapRegion alloc];
        if (a3) {
          uint64_t v9 = [(GEOMapRegion *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOMapRegion *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setMapRegion:v9];
      }
      v11 = [v5 objectForKeyedSubscript:@"userMessage"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = (void *)[v11 copy];
        [a1 setUserMessage:v12];
      }
      v13 = [v5 objectForKeyedSubscript:@"buttonOneMessage"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v14 = (void *)[v13 copy];
        [a1 setButtonOneMessage:v14];
      }
      v15 = [v5 objectForKeyedSubscript:@"buttonOneAppURI"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v16 = (void *)[v15 copy];
        [a1 setButtonOneAppURI:v16];
      }
      v17 = [v5 objectForKeyedSubscript:@"buttonTwoMessage"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = (void *)[v17 copy];
        [a1 setButtonTwoMessage:v18];
      }
      v19 = [v5 objectForKeyedSubscript:@"buttonTwoAppURI"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = (void *)[v19 copy];
        [a1 setButtonTwoAppURI:v20];
      }
      v21 = [v5 objectForKeyedSubscript:@"displayDestinations"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDisplayDestinations:", objc_msgSend(v21, "unsignedIntValue"));
      }

      uint64_t v22 = [v5 objectForKeyedSubscript:@"releasePhase"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = v22;
        if ([v23 isEqualToString:@"PHASE_PRODUCTION"])
        {
          uint64_t v24 = 1;
        }
        else if ([v23 isEqualToString:@"PHASE_INTERNAL"])
        {
          uint64_t v24 = 2;
        }
        else if ([v23 isEqualToString:@"PHASE_BETA"])
        {
          uint64_t v24 = 3;
        }
        else
        {
          uint64_t v24 = 1;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_34;
        }
        uint64_t v24 = [v22 intValue];
      }
      [a1 setReleasePhase:v24];
LABEL_34:

      v25 = [v5 objectForKeyedSubscript:@"flyoverInfo"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v26 = [GEOPDFlyover alloc];
        if (a3) {
          uint64_t v27 = [(GEOPDFlyover *)v26 initWithJSON:v25];
        }
        else {
          uint64_t v27 = [(GEOPDFlyover *)v26 initWithDictionary:v25];
        }
        v28 = (void *)v27;
        [a1 setFlyoverInfo:v27];
      }
      v29 = [v5 objectForKeyedSubscript:@"title"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v30 = (void *)[v29 copy];
        [a1 setTitle:v30];
      }
      v31 = [v5 objectForKeyedSubscript:@"announcementType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v32 = v31;
        if ([v32 isEqualToString:@"ANNOUNCEMENT_TYPE_UNKNOWN"])
        {
          uint64_t v33 = 0;
        }
        else if ([v32 isEqualToString:@"ANNOUNCEMENT_TYPE_GENERAL"])
        {
          uint64_t v33 = 1;
        }
        else if ([v32 isEqualToString:@"ANNOUNCEMENT_TYPE_FLYOVER"])
        {
          uint64_t v33 = 2;
        }
        else if ([v32 isEqualToString:@"ANNOUNCEMENT_TYPE_TRANSIT"])
        {
          uint64_t v33 = 3;
        }
        else if ([v32 isEqualToString:@"ANNOUNCEMENT_TYPE_VENUES"])
        {
          uint64_t v33 = 4;
        }
        else if ([v32 isEqualToString:@"ANNOUNCEMENT_TYPE_ENHANCED_DETAIL"])
        {
          uint64_t v33 = 5;
        }
        else if ([v32 isEqualToString:@"ANNOUNCEMENT_TYPE_LANE_GUIDANCE"])
        {
          uint64_t v33 = 6;
        }
        else if ([v32 isEqualToString:@"ANNOUNCEMENT_TYPE_LOOK_AROUND"])
        {
          uint64_t v33 = 7;
        }
        else
        {
          uint64_t v33 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_63:

          goto LABEL_64;
        }
        uint64_t v33 = [v31 intValue];
      }
      [a1 setAnnouncementType:v33];
      goto LABEL_63;
    }
  }
LABEL_64:

  return a1;
}

- (GEOAnnouncement)initWithJSON:(id)a3
{
  return (GEOAnnouncement *)-[GEOAnnouncement _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_22;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_22;
    }
    GEOAnnouncementReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOMapRegion *)self->_mapRegion readAll:1];
    [(GEOPDFlyover *)self->_flyoverInfo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAnnouncementIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAnnouncementReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAnnouncementIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOAnnouncement *)self readAll:0];
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_mapRegion) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_userMessage) {
      PBDataWriterWriteStringField();
    }
    if (self->_buttonOneMessage) {
      PBDataWriterWriteStringField();
    }
    if (self->_buttonOneAppURI) {
      PBDataWriterWriteStringField();
    }
    if (self->_buttonTwoMessage) {
      PBDataWriterWriteStringField();
    }
    if (self->_buttonTwoAppURI) {
      PBDataWriterWriteStringField();
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_flyoverInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_title) {
      PBDataWriterWriteStringField();
    }
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOAnnouncement _readMapRegion]((uint64_t)self);
  mapRegion = self->_mapRegion;

  return [(GEOMapRegion *)mapRegion hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOAnnouncement *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 20) = self->_readerMarkPos;
  *((_DWORD *)v5 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(_WORD *)&self->_flags)
  {
    *((_DWORD *)v5 + 23) = self->_announcementID;
    *((_WORD *)v5 + 54) |= 1u;
  }
  if (self->_mapRegion) {
    objc_msgSend(v5, "setMapRegion:");
  }
  if (self->_userMessage) {
    objc_msgSend(v5, "setUserMessage:");
  }
  if (self->_buttonOneMessage) {
    objc_msgSend(v5, "setButtonOneMessage:");
  }
  if (self->_buttonOneAppURI) {
    objc_msgSend(v5, "setButtonOneAppURI:");
  }
  if (self->_buttonTwoMessage) {
    objc_msgSend(v5, "setButtonTwoMessage:");
  }
  if (self->_buttonTwoAppURI) {
    objc_msgSend(v5, "setButtonTwoAppURI:");
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v5 + 25) = self->_displayDestinations;
    *((_WORD *)v5 + 54) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v5 + 26) = self->_releasePhase;
    *((_WORD *)v5 + 54) |= 8u;
  }
  if (self->_flyoverInfo) {
    objc_msgSend(v5, "setFlyoverInfo:");
  }
  if (self->_title) {
    objc_msgSend(v5, "setTitle:");
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v5 + 24) = self->_announcementType;
    *((_WORD *)v5 + 54) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOAnnouncementReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOAnnouncement *)self readAll:0];
  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 92) = self->_announcementID;
    *(_WORD *)(v5 + 108) |= 1u;
  }
  id v9 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  uint64_t v11 = [(NSString *)self->_userMessage copyWithZone:a3];
  v12 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v11;

  uint64_t v13 = [(NSString *)self->_buttonOneMessage copyWithZone:a3];
  __int16 v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  uint64_t v15 = [(NSString *)self->_buttonOneAppURI copyWithZone:a3];
  unsigned int v16 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v15;

  uint64_t v17 = [(NSString *)self->_buttonTwoMessage copyWithZone:a3];
  v18 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v17;

  uint64_t v19 = [(NSString *)self->_buttonTwoAppURI copyWithZone:a3];
  v20 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v19;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_displayDestinations;
    *(_WORD *)(v5 + 108) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_releasePhase;
    *(_WORD *)(v5 + 108) |= 8u;
  }
  id v22 = [(GEOPDFlyover *)self->_flyoverInfo copyWithZone:a3];
  id v23 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v22;

  uint64_t v24 = [(NSString *)self->_title copyWithZone:a3];
  v25 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v24;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_announcementType;
    *(_WORD *)(v5 + 108) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  [(GEOAnnouncement *)self readAll:1];
  [v4 readAll:1];
  __int16 v5 = *((_WORD *)v4 + 54);
  if (*(_WORD *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_announcementID != *((_DWORD *)v4 + 23)) {
      goto LABEL_37;
    }
  }
  else if (v5)
  {
LABEL_37:
    BOOL v17 = 0;
    goto LABEL_38;
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((void *)v4 + 7) && !-[GEOMapRegion isEqual:](mapRegion, "isEqual:")) {
    goto LABEL_37;
  }
  userMessage = self->_userMessage;
  if ((unint64_t)userMessage | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](userMessage, "isEqual:")) {
      goto LABEL_37;
    }
  }
  buttonOneMessage = self->_buttonOneMessage;
  if ((unint64_t)buttonOneMessage | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](buttonOneMessage, "isEqual:")) {
      goto LABEL_37;
    }
  }
  buttonOneAppURI = self->_buttonOneAppURI;
  if ((unint64_t)buttonOneAppURI | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](buttonOneAppURI, "isEqual:")) {
      goto LABEL_37;
    }
  }
  buttonTwoMessage = self->_buttonTwoMessage;
  if ((unint64_t)buttonTwoMessage | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](buttonTwoMessage, "isEqual:")) {
      goto LABEL_37;
    }
  }
  buttonTwoAppURI = self->_buttonTwoAppURI;
  if ((unint64_t)buttonTwoAppURI | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](buttonTwoAppURI, "isEqual:")) {
      goto LABEL_37;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v13 = *((_WORD *)v4 + 54);
  if ((flags & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_displayDestinations != *((_DWORD *)v4 + 25)) {
      goto LABEL_37;
    }
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((flags & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_releasePhase != *((_DWORD *)v4 + 26)) {
      goto LABEL_37;
    }
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_37;
  }
  flyoverInfo = self->_flyoverInfo;
  if ((unint64_t)flyoverInfo | *((void *)v4 + 6) && !-[GEOPDFlyover isEqual:](flyoverInfo, "isEqual:")) {
    goto LABEL_37;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_37;
    }
  }
  __int16 v16 = *((_WORD *)v4 + 54);
  BOOL v17 = (v16 & 2) == 0;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v16 & 2) == 0 || self->_announcementType != *((_DWORD *)v4 + 24)) {
      goto LABEL_37;
    }
    BOOL v17 = 1;
  }
LABEL_38:

  return v17;
}

- (unint64_t)hash
{
  [(GEOAnnouncement *)self readAll:1];
  if (*(_WORD *)&self->_flags) {
    uint64_t v16 = 2654435761 * self->_announcementID;
  }
  else {
    uint64_t v16 = 0;
  }
  unint64_t v15 = [(GEOMapRegion *)self->_mapRegion hash];
  NSUInteger v14 = [(NSString *)self->_userMessage hash];
  NSUInteger v13 = [(NSString *)self->_buttonOneMessage hash];
  NSUInteger v3 = [(NSString *)self->_buttonOneAppURI hash];
  NSUInteger v4 = [(NSString *)self->_buttonTwoMessage hash];
  NSUInteger v5 = [(NSString *)self->_buttonTwoAppURI hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    uint64_t v7 = 2654435761 * self->_displayDestinations;
    if ((flags & 8) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((flags & 8) != 0)
    {
LABEL_6:
      uint64_t v8 = 2654435761 * self->_releasePhase;
      goto LABEL_9;
    }
  }
  uint64_t v8 = 0;
LABEL_9:
  unint64_t v9 = [(GEOPDFlyover *)self->_flyoverInfo hash];
  NSUInteger v10 = [(NSString *)self->_title hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_announcementType;
  }
  else {
    uint64_t v11 = 0;
  }
  return v15 ^ v16 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v10 = (unsigned int *)a3;
  [v10 readAll:0];
  NSUInteger v4 = v10;
  if (v10[27])
  {
    self->_announcementID = v10[23];
    *(_WORD *)&self->_flags |= 1u;
  }
  mapRegion = self->_mapRegion;
  uint64_t v6 = *((void *)v10 + 7);
  if (mapRegion)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOAnnouncement setMapRegion:](self, "setMapRegion:");
  }
  NSUInteger v4 = v10;
LABEL_9:
  if (*((void *)v4 + 9))
  {
    -[GEOAnnouncement setUserMessage:](self, "setUserMessage:");
    NSUInteger v4 = v10;
  }
  if (*((void *)v4 + 3))
  {
    -[GEOAnnouncement setButtonOneMessage:](self, "setButtonOneMessage:");
    NSUInteger v4 = v10;
  }
  if (*((void *)v4 + 2))
  {
    -[GEOAnnouncement setButtonOneAppURI:](self, "setButtonOneAppURI:");
    NSUInteger v4 = v10;
  }
  if (*((void *)v4 + 5))
  {
    -[GEOAnnouncement setButtonTwoMessage:](self, "setButtonTwoMessage:");
    NSUInteger v4 = v10;
  }
  if (*((void *)v4 + 4))
  {
    -[GEOAnnouncement setButtonTwoAppURI:](self, "setButtonTwoAppURI:");
    NSUInteger v4 = v10;
  }
  __int16 v7 = *((_WORD *)v4 + 54);
  if ((v7 & 4) != 0)
  {
    self->_displayDestinations = v4[25];
    *(_WORD *)&self->_flags |= 4u;
    __int16 v7 = *((_WORD *)v4 + 54);
  }
  if ((v7 & 8) != 0)
  {
    self->_releasePhase = v4[26];
    *(_WORD *)&self->_flags |= 8u;
  }
  flyoverInfo = self->_flyoverInfo;
  uint64_t v9 = *((void *)v4 + 6);
  if (flyoverInfo)
  {
    if (!v9) {
      goto LABEL_29;
    }
    -[GEOPDFlyover mergeFrom:](flyoverInfo, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_29;
    }
    -[GEOAnnouncement setFlyoverInfo:](self, "setFlyoverInfo:");
  }
  NSUInteger v4 = v10;
LABEL_29:
  if (*((void *)v4 + 8))
  {
    -[GEOAnnouncement setTitle:](self, "setTitle:");
    NSUInteger v4 = v10;
  }
  if ((v4[27] & 2) != 0)
  {
    self->_announcementType = v4[24];
    *(_WORD *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userMessage, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_flyoverInfo, 0);
  objc_storeStrong((id *)&self->_buttonTwoMessage, 0);
  objc_storeStrong((id *)&self->_buttonTwoAppURI, 0);
  objc_storeStrong((id *)&self->_buttonOneMessage, 0);
  objc_storeStrong((id *)&self->_buttonOneAppURI, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end