@interface GEOLogMsgStateUser
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBestMapsUseStartDate;
- (BOOL)hasHomeCountryCode;
- (BOOL)hasHomeMetroRegion;
- (BOOL)hasIsSignedInWithDsid;
- (BOOL)hasIsTourist;
- (BOOL)hasMapsUseLastDate;
- (BOOL)hasMapsUseStartDate;
- (BOOL)hasPreSyncSessionId;
- (BOOL)hasSyncFirstTimestamp;
- (BOOL)hasSyncLastTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSignedInWithDsid;
- (BOOL)isTourist;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateUser)init;
- (GEOLogMsgStateUser)initWithData:(id)a3;
- (GEOLogMsgStateUser)initWithDictionary:(id)a3;
- (GEOLogMsgStateUser)initWithJSON:(id)a3;
- (GEOSessionID)preSyncSessionId;
- (NSString)homeCountryCode;
- (NSString)homeMetroRegion;
- (double)bestMapsUseStartDate;
- (double)mapsUseLastDate;
- (double)mapsUseStartDate;
- (double)syncFirstTimestamp;
- (double)syncLastTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readHomeCountryCode;
- (void)_readHomeMetroRegion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBestMapsUseStartDate:(double)a3;
- (void)setHasBestMapsUseStartDate:(BOOL)a3;
- (void)setHasIsSignedInWithDsid:(BOOL)a3;
- (void)setHasIsTourist:(BOOL)a3;
- (void)setHasMapsUseLastDate:(BOOL)a3;
- (void)setHasMapsUseStartDate:(BOOL)a3;
- (void)setHasPreSyncSessionId:(BOOL)a3;
- (void)setHasSyncFirstTimestamp:(BOOL)a3;
- (void)setHasSyncLastTimestamp:(BOOL)a3;
- (void)setHomeCountryCode:(id)a3;
- (void)setHomeMetroRegion:(id)a3;
- (void)setIsSignedInWithDsid:(BOOL)a3;
- (void)setIsTourist:(BOOL)a3;
- (void)setMapsUseLastDate:(double)a3;
- (void)setMapsUseStartDate:(double)a3;
- (void)setPreSyncSessionId:(GEOSessionID)a3;
- (void)setSyncFirstTimestamp:(double)a3;
- (void)setSyncLastTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateUser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeMetroRegion, 0);
  objc_storeStrong((id *)&self->_homeCountryCode, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)setIsTourist:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  self->_isTourist = a3;
}

- (void)setIsSignedInWithDsid:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  self->_isSignedInWithDsid = a3;
}

- (void)setHomeMetroRegion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_homeMetroRegion, a3);
}

- (void)setHomeCountryCode:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_homeCountryCode, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgStateUser *)self readAll:0];
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      *(double *)(v5 + 72) = self->_syncFirstTimestamp;
      *(_WORD *)(v5 + 104) |= 0x10u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 0x20) == 0)
      {
LABEL_7:
        if ((flags & 8) == 0) {
          goto LABEL_8;
        }
        goto LABEL_18;
      }
    }
    else if ((flags & 0x20) == 0)
    {
      goto LABEL_7;
    }
    *(double *)(v5 + 80) = self->_syncLastTimestamp;
    *(_WORD *)(v5 + 104) |= 0x20u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_8:
      if ((flags & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
LABEL_18:
    *(double *)(v5 + 64) = self->_mapsUseStartDate;
    *(_WORD *)(v5 + 104) |= 8u;
    if ((*(_WORD *)&self->_flags & 4) == 0)
    {
LABEL_10:
      uint64_t v10 = [(NSString *)self->_homeCountryCode copyWithZone:a3];
      v11 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v10;

      uint64_t v12 = [(NSString *)self->_homeMetroRegion copyWithZone:a3];
      v13 = *(void **)(v5 + 48);
      *(void *)(v5 + 48) = v12;

      __int16 v14 = (__int16)self->_flags;
      if ((v14 & 0x80) != 0)
      {
        *(unsigned char *)(v5 + 101) = self->_isTourist;
        *(_WORD *)(v5 + 104) |= 0x80u;
        __int16 v14 = (__int16)self->_flags;
        if ((v14 & 1) == 0)
        {
LABEL_12:
          if ((v14 & 0x40) == 0) {
            goto LABEL_13;
          }
          goto LABEL_22;
        }
      }
      else if ((v14 & 1) == 0)
      {
        goto LABEL_12;
      }
      *(GEOSessionID *)(v5 + 16) = self->_preSyncSessionId;
      *(_WORD *)(v5 + 104) |= 1u;
      __int16 v14 = (__int16)self->_flags;
      if ((v14 & 0x40) == 0)
      {
LABEL_13:
        if ((v14 & 2) == 0) {
          return (id)v5;
        }
LABEL_14:
        *(double *)(v5 + 32) = self->_bestMapsUseStartDate;
        *(_WORD *)(v5 + 104) |= 2u;
        return (id)v5;
      }
LABEL_22:
      *(unsigned char *)(v5 + 100) = self->_isSignedInWithDsid;
      *(_WORD *)(v5 + 104) |= 0x40u;
      if ((*(_WORD *)&self->_flags & 2) == 0) {
        return (id)v5;
      }
      goto LABEL_14;
    }
LABEL_9:
    *(double *)(v5 + 56) = self->_mapsUseLastDate;
    *(_WORD *)(v5 + 104) |= 4u;
    goto LABEL_10;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgStateUserReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (GEOLogMsgStateUser)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateUser;
  v2 = [(GEOLogMsgStateUser *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x700) == 0)
    {
      id v8 = self->_reader;
      objc_sync_enter(v8);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v9];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v8);
      goto LABEL_26;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgStateUser *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_5:
      if ((flags & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_flags & 4) != 0) {
LABEL_7:
  }
    PBDataWriterWriteDoubleField();
LABEL_8:
  if (self->_homeCountryCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_homeMetroRegion) {
    PBDataWriterWriteStringField();
  }
  __int16 v7 = (__int16)self->_flags;
  if ((v7 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v7 = (__int16)self->_flags;
    if ((v7 & 1) == 0)
    {
LABEL_14:
      if ((v7 & 0x40) == 0) {
        goto LABEL_15;
      }
      goto LABEL_23;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterPlaceMark();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterRecallMark();
  __int16 v7 = (__int16)self->_flags;
  if ((v7 & 0x40) == 0)
  {
LABEL_15:
    if ((v7 & 2) == 0) {
      goto LABEL_26;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_flags & 2) != 0) {
LABEL_24:
  }
    PBDataWriterWriteDoubleField();
LABEL_26:
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    __int16 v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_9655;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_9656;
    }
    GEOLogMsgStateUserReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOLogMsgStateUser)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateUser;
  BOOL v3 = [(GEOLogMsgStateUser *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (double)syncFirstTimestamp
{
  return self->_syncFirstTimestamp;
}

- (void)setSyncFirstTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  self->_syncFirstTimestamp = a3;
}

- (void)setHasSyncFirstTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1040;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasSyncFirstTimestamp
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (double)syncLastTimestamp
{
  return self->_syncLastTimestamp;
}

- (void)setSyncLastTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  self->_syncLastTimestamp = a3;
}

- (void)setHasSyncLastTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1056;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasSyncLastTimestamp
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (double)mapsUseStartDate
{
  return self->_mapsUseStartDate;
}

- (void)setMapsUseStartDate:(double)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  self->_mapsUseStartDate = a3;
}

- (void)setHasMapsUseStartDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1032;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasMapsUseStartDate
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (double)mapsUseLastDate
{
  return self->_mapsUseLastDate;
}

- (void)setMapsUseLastDate:(double)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  self->_mapsUseLastDate = a3;
}

- (void)setHasMapsUseLastDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1028;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasMapsUseLastDate
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readHomeCountryCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateUserReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHomeCountryCode_tags_9611);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasHomeCountryCode
{
  return self->_homeCountryCode != 0;
}

- (NSString)homeCountryCode
{
  -[GEOLogMsgStateUser _readHomeCountryCode]((uint64_t)self);
  homeCountryCode = self->_homeCountryCode;

  return homeCountryCode;
}

- (void)_readHomeMetroRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateUserReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHomeMetroRegion_tags_9612);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasHomeMetroRegion
{
  return self->_homeMetroRegion != 0;
}

- (NSString)homeMetroRegion
{
  -[GEOLogMsgStateUser _readHomeMetroRegion]((uint64_t)self);
  homeMetroRegion = self->_homeMetroRegion;

  return homeMetroRegion;
}

- (BOOL)isTourist
{
  return self->_isTourist;
}

- (void)setHasIsTourist:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1152;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasIsTourist
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (GEOSessionID)preSyncSessionId
{
  p_preSyncSessionId = &self->_preSyncSessionId;
  unint64_t high = self->_preSyncSessionId._high;
  unint64_t low = p_preSyncSessionId->_low;
  result._unint64_t low = low;
  result._unint64_t high = high;
  return result;
}

- (void)setPreSyncSessionId:(GEOSessionID)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  self->_preSyncSessionId = a3;
}

- (void)setHasPreSyncSessionId:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasPreSyncSessionId
{
  return *(_WORD *)&self->_flags & 1;
}

- (BOOL)isSignedInWithDsid
{
  return self->_isSignedInWithDsid;
}

- (void)setHasIsSignedInWithDsid:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1088;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasIsSignedInWithDsid
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (double)bestMapsUseStartDate
{
  return self->_bestMapsUseStartDate;
}

- (void)setBestMapsUseStartDate:(double)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  self->_bestMapsUseStartDate = a3;
}

- (void)setHasBestMapsUseStartDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1026;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasBestMapsUseStartDate
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateUser;
  id v4 = [(GEOLogMsgStateUser *)&v8 description];
  uint64_t v5 = [(GEOLogMsgStateUser *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateUser _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_54;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 104);
  if ((v5 & 0x10) != 0)
  {
    objc_super v6 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
    if (a2) {
      objc_super v7 = @"syncFirstTimestamp";
    }
    else {
      objc_super v7 = @"sync_first_timestamp";
    }
    [v4 setObject:v6 forKey:v7];

    __int16 v5 = *(_WORD *)(a1 + 104);
  }
  if ((v5 & 0x20) != 0)
  {
    v15 = [NSNumber numberWithDouble:*(double *)(a1 + 80)];
    if (a2) {
      v16 = @"syncLastTimestamp";
    }
    else {
      v16 = @"sync_last_timestamp";
    }
    [v4 setObject:v15 forKey:v16];

    __int16 v5 = *(_WORD *)(a1 + 104);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_10;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_9;
  }
  v17 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  if (a2) {
    v18 = @"mapsUseStartDate";
  }
  else {
    v18 = @"maps_use_start_date";
  }
  [v4 setObject:v17 forKey:v18];

  if ((*(_WORD *)(a1 + 104) & 4) != 0)
  {
LABEL_10:
    objc_super v8 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
    if (a2) {
      v9 = @"mapsUseLastDate";
    }
    else {
      v9 = @"maps_use_last_date";
    }
    [v4 setObject:v8 forKey:v9];
  }
LABEL_14:
  uint64_t v10 = [(id)a1 homeCountryCode];
  if (v10)
  {
    if (a2) {
      v11 = @"homeCountryCode";
    }
    else {
      v11 = @"home_country_code";
    }
    [v4 setObject:v10 forKey:v11];
  }

  uint64_t v12 = [(id)a1 homeMetroRegion];
  if (v12)
  {
    if (a2) {
      v13 = @"homeMetroRegion";
    }
    else {
      v13 = @"home_metro_region";
    }
    [v4 setObject:v12 forKey:v13];
  }

  __int16 v14 = *(_WORD *)(a1 + 104);
  if ((v14 & 0x80) != 0)
  {
    v19 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 101)];
    if (a2) {
      v20 = @"isTourist";
    }
    else {
      v20 = @"is_tourist";
    }
    [v4 setObject:v19 forKey:v20];

    __int16 v14 = *(_WORD *)(a1 + 104);
    if ((v14 & 1) == 0)
    {
LABEL_26:
      if ((v14 & 0x40) == 0) {
        goto LABEL_27;
      }
LABEL_46:
      v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 100)];
      if (a2) {
        v24 = @"isSignedInWithDsid";
      }
      else {
        v24 = @"is_signed_in_with_dsid";
      }
      [v4 setObject:v23 forKey:v24];

      if ((*(_WORD *)(a1 + 104) & 2) == 0) {
        goto LABEL_54;
      }
      goto LABEL_50;
    }
  }
  else if ((v14 & 1) == 0)
  {
    goto LABEL_26;
  }
  v21 = _GEOSessionIDDictionaryRepresentation((void *)(a1 + 16));
  if (a2) {
    v22 = @"preSyncSessionId";
  }
  else {
    v22 = @"pre_sync_session_id";
  }
  [v4 setObject:v21 forKey:v22];

  __int16 v14 = *(_WORD *)(a1 + 104);
  if ((v14 & 0x40) != 0) {
    goto LABEL_46;
  }
LABEL_27:
  if ((v14 & 2) != 0)
  {
LABEL_50:
    v25 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    if (a2) {
      v26 = @"bestMapsUseStartDate";
    }
    else {
      v26 = @"best_maps_use_start_date";
    }
    [v4 setObject:v25 forKey:v26];
  }
LABEL_54:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateUser _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateUser)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateUser *)-[GEOLogMsgStateUser _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"syncFirstTimestamp";
      }
      else {
        objc_super v6 = @"sync_first_timestamp";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 doubleValue];
        objc_msgSend(a1, "setSyncFirstTimestamp:");
      }

      if (a3) {
        objc_super v8 = @"syncLastTimestamp";
      }
      else {
        objc_super v8 = @"sync_last_timestamp";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 doubleValue];
        objc_msgSend(a1, "setSyncLastTimestamp:");
      }

      if (a3) {
        uint64_t v10 = @"mapsUseStartDate";
      }
      else {
        uint64_t v10 = @"maps_use_start_date";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v11 doubleValue];
        objc_msgSend(a1, "setMapsUseStartDate:");
      }

      if (a3) {
        uint64_t v12 = @"mapsUseLastDate";
      }
      else {
        uint64_t v12 = @"maps_use_last_date";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v13 doubleValue];
        objc_msgSend(a1, "setMapsUseLastDate:");
      }

      if (a3) {
        __int16 v14 = @"homeCountryCode";
      }
      else {
        __int16 v14 = @"home_country_code";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = (void *)[v15 copy];
        [a1 setHomeCountryCode:v16];
      }
      if (a3) {
        v17 = @"homeMetroRegion";
      }
      else {
        v17 = @"home_metro_region";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = (void *)[v18 copy];
        [a1 setHomeMetroRegion:v19];
      }
      if (a3) {
        v20 = @"isTourist";
      }
      else {
        v20 = @"is_tourist";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsTourist:", objc_msgSend(v21, "BOOLValue"));
      }

      if (a3) {
        v22 = @"preSyncSessionId";
      }
      else {
        v22 = @"pre_sync_session_id";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v29 = 0;
        uint64_t v30 = 0;
        _GEOSessionIDFromDictionaryRepresentation(v23, &v29);
        objc_msgSend(a1, "setPreSyncSessionId:", v29, v30);
      }

      if (a3) {
        v24 = @"isSignedInWithDsid";
      }
      else {
        v24 = @"is_signed_in_with_dsid";
      }
      v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsSignedInWithDsid:", objc_msgSend(v25, "BOOLValue"));
      }

      if (a3) {
        v26 = @"bestMapsUseStartDate";
      }
      else {
        v26 = @"best_maps_use_start_date";
      }
      v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v27 doubleValue];
        objc_msgSend(a1, "setBestMapsUseStartDate:");
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateUser)initWithJSON:(id)a3
{
  return (GEOLogMsgStateUser *)-[GEOLogMsgStateUser _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateUserIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateUserReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  objc_super v7 = (id *)a3;
  [(GEOLogMsgStateUser *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 22) = self->_readerMarkPos;
  *((_DWORD *)v7 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  id v4 = v7;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v7[9] = *(id *)&self->_syncFirstTimestamp;
    *((_WORD *)v7 + 52) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v7[10] = *(id *)&self->_syncLastTimestamp;
  *((_WORD *)v7 + 52) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_20:
  v7[8] = *(id *)&self->_mapsUseStartDate;
  *((_WORD *)v7 + 52) |= 8u;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
LABEL_5:
    v7[7] = *(id *)&self->_mapsUseLastDate;
    *((_WORD *)v7 + 52) |= 4u;
  }
LABEL_6:
  if (self->_homeCountryCode)
  {
    objc_msgSend(v7, "setHomeCountryCode:");
    id v4 = v7;
  }
  if (self->_homeMetroRegion)
  {
    objc_msgSend(v7, "setHomeMetroRegion:");
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x80) != 0)
  {
    *((unsigned char *)v4 + 101) = self->_isTourist;
    *((_WORD *)v4 + 52) |= 0x80u;
    __int16 v6 = (__int16)self->_flags;
    if ((v6 & 1) == 0)
    {
LABEL_12:
      if ((v6 & 0x40) == 0) {
        goto LABEL_13;
      }
      goto LABEL_24;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_12;
  }
  *((_OWORD *)v4 + 1) = self->_preSyncSessionId;
  *((_WORD *)v4 + 52) |= 1u;
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x40) == 0)
  {
LABEL_13:
    if ((v6 & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_24:
  *((unsigned char *)v4 + 100) = self->_isSignedInWithDsid;
  *((_WORD *)v4 + 52) |= 0x40u;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
LABEL_14:
    v4[4] = *(id *)&self->_bestMapsUseStartDate;
    *((_WORD *)v4 + 52) |= 2u;
  }
LABEL_15:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_55;
  }
  [(GEOLogMsgStateUser *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  unsigned __int16 v6 = v4[52];
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_syncFirstTimestamp != *((double *)v4 + 9)) {
      goto LABEL_55;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_55;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_syncLastTimestamp != *((double *)v4 + 10)) {
      goto LABEL_55;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_55;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_mapsUseStartDate != *((double *)v4 + 8)) {
      goto LABEL_55;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_55;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_mapsUseLastDate != *((double *)v4 + 7)) {
      goto LABEL_55;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_55;
  }
  homeCountryCode = self->_homeCountryCode;
  if ((unint64_t)homeCountryCode | *((void *)v4 + 5)
    && !-[NSString isEqual:](homeCountryCode, "isEqual:"))
  {
    goto LABEL_55;
  }
  homeMetroRegion = self->_homeMetroRegion;
  if ((unint64_t)homeMetroRegion | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](homeMetroRegion, "isEqual:")) {
      goto LABEL_55;
    }
  }
  $CCA7DFCF6839FE4DA1B68604F02FABCB v9 = self->_flags;
  int v10 = v4[52];
  if ((*(unsigned char *)&v9 & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0) {
      goto LABEL_55;
    }
    if (self->_isTourist)
    {
      if (!*((unsigned char *)v4 + 101)) {
        goto LABEL_55;
      }
    }
    else if (*((unsigned char *)v4 + 101))
    {
      goto LABEL_55;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_55;
  }
  if (*(unsigned char *)&v9 & 1) != 0 && (v10)
  {
    if (self->_preSyncSessionId._high != *((void *)v4 + 2) || self->_preSyncSessionId._low != *((void *)v4 + 3)) {
      goto LABEL_55;
    }
  }
  else if ((*(_DWORD *)&v9 | v10))
  {
    goto LABEL_55;
  }
  if ((*(unsigned char *)&v9 & 0x40) != 0)
  {
    if ((v10 & 0x40) != 0)
    {
      if (self->_isSignedInWithDsid)
      {
        if (!*((unsigned char *)v4 + 100)) {
          goto LABEL_55;
        }
        goto LABEL_51;
      }
      if (!*((unsigned char *)v4 + 100)) {
        goto LABEL_51;
      }
    }
LABEL_55:
    BOOL v12 = 0;
    goto LABEL_56;
  }
  if ((v10 & 0x40) != 0) {
    goto LABEL_55;
  }
LABEL_51:
  BOOL v12 = (v10 & 2) == 0;
  if ((*(unsigned char *)&v9 & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_bestMapsUseStartDate != *((double *)v4 + 4)) {
      goto LABEL_55;
    }
    BOOL v12 = 1;
  }
LABEL_56:

  return v12;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateUser *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    double syncFirstTimestamp = self->_syncFirstTimestamp;
    double v6 = -syncFirstTimestamp;
    if (syncFirstTimestamp >= 0.0) {
      double v6 = self->_syncFirstTimestamp;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((flags & 0x20) != 0)
  {
    double syncLastTimestamp = self->_syncLastTimestamp;
    double v11 = -syncLastTimestamp;
    if (syncLastTimestamp >= 0.0) {
      double v11 = self->_syncLastTimestamp;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((flags & 8) != 0)
  {
    double mapsUseStartDate = self->_mapsUseStartDate;
    double v16 = -mapsUseStartDate;
    if (mapsUseStartDate >= 0.0) {
      double v16 = self->_mapsUseStartDate;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((flags & 4) != 0)
  {
    double mapsUseLastDate = self->_mapsUseLastDate;
    double v21 = -mapsUseLastDate;
    if (mapsUseLastDate >= 0.0) {
      double v21 = self->_mapsUseLastDate;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  NSUInteger v24 = [(NSString *)self->_homeCountryCode hash];
  NSUInteger v25 = [(NSString *)self->_homeMetroRegion hash];
  __int16 v26 = (__int16)self->_flags;
  if ((v26 & 0x80) != 0)
  {
    uint64_t v27 = 2654435761 * self->_isTourist;
    if (v26)
    {
LABEL_35:
      uint64_t v28 = PBHashBytes();
      __int16 v26 = (__int16)self->_flags;
      if ((v26 & 0x40) != 0) {
        goto LABEL_36;
      }
LABEL_43:
      uint64_t v29 = 0;
      if ((v26 & 2) != 0) {
        goto LABEL_37;
      }
LABEL_44:
      unint64_t v34 = 0;
      return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v25 ^ v27 ^ v28 ^ v29 ^ v34;
    }
  }
  else
  {
    uint64_t v27 = 0;
    if (v26) {
      goto LABEL_35;
    }
  }
  uint64_t v28 = 0;
  if ((v26 & 0x40) == 0) {
    goto LABEL_43;
  }
LABEL_36:
  uint64_t v29 = 2654435761 * self->_isSignedInWithDsid;
  if ((v26 & 2) == 0) {
    goto LABEL_44;
  }
LABEL_37:
  double bestMapsUseStartDate = self->_bestMapsUseStartDate;
  double v31 = -bestMapsUseStartDate;
  if (bestMapsUseStartDate >= 0.0) {
    double v31 = self->_bestMapsUseStartDate;
  }
  long double v32 = floor(v31 + 0.5);
  double v33 = (v31 - v32) * 1.84467441e19;
  unint64_t v34 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
  if (v33 >= 0.0)
  {
    if (v33 > 0.0) {
      v34 += (unint64_t)v33;
    }
  }
  else
  {
    v34 -= (unint64_t)fabs(v33);
  }
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v25 ^ v27 ^ v28 ^ v29 ^ v34;
}

- (void)mergeFrom:(id)a3
{
  long double v7 = (double *)a3;
  [v7 readAll:0];
  unint64_t v4 = v7;
  __int16 v5 = *((_WORD *)v7 + 52);
  if ((v5 & 0x10) != 0)
  {
    self->_double syncFirstTimestamp = v7[9];
    *(_WORD *)&self->_flags |= 0x10u;
    __int16 v5 = *((_WORD *)v7 + 52);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_double syncLastTimestamp = v7[10];
  *(_WORD *)&self->_flags |= 0x20u;
  __int16 v5 = *((_WORD *)v7 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_20:
  self->_double mapsUseStartDate = v7[8];
  *(_WORD *)&self->_flags |= 8u;
  if (((_WORD)v7[13] & 4) != 0)
  {
LABEL_5:
    self->_double mapsUseLastDate = v7[7];
    *(_WORD *)&self->_flags |= 4u;
  }
LABEL_6:
  if (*((void *)v7 + 5))
  {
    -[GEOLogMsgStateUser setHomeCountryCode:](self, "setHomeCountryCode:");
    unint64_t v4 = v7;
  }
  if (*((void *)v4 + 6))
  {
    -[GEOLogMsgStateUser setHomeMetroRegion:](self, "setHomeMetroRegion:");
    unint64_t v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 52);
  if ((v6 & 0x80) != 0)
  {
    self->_isTourist = *((unsigned char *)v4 + 101);
    *(_WORD *)&self->_flags |= 0x80u;
    __int16 v6 = *((_WORD *)v4 + 52);
    if ((v6 & 1) == 0)
    {
LABEL_12:
      if ((v6 & 0x40) == 0) {
        goto LABEL_13;
      }
      goto LABEL_24;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_12;
  }
  self->_preSyncSessionId = (GEOSessionID)*((_OWORD *)v4 + 1);
  *(_WORD *)&self->_flags |= 1u;
  __int16 v6 = *((_WORD *)v4 + 52);
  if ((v6 & 0x40) == 0)
  {
LABEL_13:
    if ((v6 & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_24:
  self->_isSignedInWithDsid = *((unsigned char *)v4 + 100);
  *(_WORD *)&self->_flags |= 0x40u;
  if (((_WORD)v4[13] & 2) != 0)
  {
LABEL_14:
    self->_double bestMapsUseStartDate = v4[4];
    *(_WORD *)&self->_flags |= 2u;
  }
LABEL_15:
}

@end