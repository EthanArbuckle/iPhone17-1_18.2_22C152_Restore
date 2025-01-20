@interface GEORPFeedbackComponentValue
+ (BOOL)isValid:(id)a3;
- (BOOL)hasConversation;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasNotification;
- (BOOL)hasOverview;
- (BOOL)hasPhotoAttributionPreferences;
- (BOOL)hasPoiEnrichment;
- (BOOL)hasRapInfo;
- (BOOL)hasThirdPartyPhotoSharingPreferences;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackComponentValue)init;
- (GEORPFeedbackComponentValue)initWithData:(id)a3;
- (GEORPFeedbackComponentValue)initWithDictionary:(id)a3;
- (GEORPFeedbackComponentValue)initWithJSON:(id)a3;
- (GEORPFeedbackConversation)conversation;
- (GEORPFeedbackNotification)notification;
- (GEORPFeedbackOverview)overview;
- (GEORPPhotoAttributionPreferences)photoAttributionPreferences;
- (GEORPPoiEnrichment)poiEnrichment;
- (GEORPRapInfo)rapInfo;
- (GEORPThirdPartyPhotoSharingPreference)thirdPartyPhotoSharingPreferences;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readConversation;
- (void)_readNotification;
- (void)_readOverview;
- (void)_readPhotoAttributionPreferences;
- (void)_readPoiEnrichment;
- (void)_readRapInfo;
- (void)_readThirdPartyPhotoSharingPreferences;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setConversation:(id)a3;
- (void)setNotification:(id)a3;
- (void)setOverview:(id)a3;
- (void)setPhotoAttributionPreferences:(id)a3;
- (void)setPoiEnrichment:(id)a3;
- (void)setRapInfo:(id)a3;
- (void)setThirdPartyPhotoSharingPreferences:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackComponentValue

- (GEORPFeedbackComponentValue)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackComponentValue;
  v2 = [(GEORPFeedbackComponentValue *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackComponentValue)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackComponentValue;
  v3 = [(GEORPFeedbackComponentValue *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readNotification
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackComponentValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNotification_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasNotification
{
  return self->_notification != 0;
}

- (GEORPFeedbackNotification)notification
{
  -[GEORPFeedbackComponentValue _readNotification]((uint64_t)self);
  notification = self->_notification;

  return notification;
}

- (void)setNotification:(id)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  objc_storeStrong((id *)&self->_notification, a3);
}

- (void)_readOverview
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackComponentValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOverview_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasOverview
{
  return self->_overview != 0;
}

- (GEORPFeedbackOverview)overview
{
  -[GEORPFeedbackComponentValue _readOverview]((uint64_t)self);
  overview = self->_overview;

  return overview;
}

- (void)setOverview:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_overview, a3);
}

- (void)_readConversation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackComponentValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readConversation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasConversation
{
  return self->_conversation != 0;
}

- (GEORPFeedbackConversation)conversation
{
  -[GEORPFeedbackComponentValue _readConversation]((uint64_t)self);
  conversation = self->_conversation;

  return conversation;
}

- (void)setConversation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (void)_readPoiEnrichment
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackComponentValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiEnrichment_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasPoiEnrichment
{
  return self->_poiEnrichment != 0;
}

- (GEORPPoiEnrichment)poiEnrichment
{
  -[GEORPFeedbackComponentValue _readPoiEnrichment]((uint64_t)self);
  poiEnrichment = self->_poiEnrichment;

  return poiEnrichment;
}

- (void)setPoiEnrichment:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_poiEnrichment, a3);
}

- (void)_readRapInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackComponentValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRapInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasRapInfo
{
  return self->_rapInfo != 0;
}

- (GEORPRapInfo)rapInfo
{
  -[GEORPFeedbackComponentValue _readRapInfo]((uint64_t)self);
  rapInfo = self->_rapInfo;

  return rapInfo;
}

- (void)setRapInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_rapInfo, a3);
}

- (void)_readThirdPartyPhotoSharingPreferences
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackComponentValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readThirdPartyPhotoSharingPreferences_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasThirdPartyPhotoSharingPreferences
{
  return self->_thirdPartyPhotoSharingPreferences != 0;
}

- (GEORPThirdPartyPhotoSharingPreference)thirdPartyPhotoSharingPreferences
{
  -[GEORPFeedbackComponentValue _readThirdPartyPhotoSharingPreferences]((uint64_t)self);
  thirdPartyPhotoSharingPreferences = self->_thirdPartyPhotoSharingPreferences;

  return thirdPartyPhotoSharingPreferences;
}

- (void)setThirdPartyPhotoSharingPreferences:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_thirdPartyPhotoSharingPreferences, a3);
}

- (void)_readPhotoAttributionPreferences
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackComponentValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotoAttributionPreferences_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasPhotoAttributionPreferences
{
  return self->_photoAttributionPreferences != 0;
}

- (GEORPPhotoAttributionPreferences)photoAttributionPreferences
{
  -[GEORPFeedbackComponentValue _readPhotoAttributionPreferences]((uint64_t)self);
  photoAttributionPreferences = self->_photoAttributionPreferences;

  return photoAttributionPreferences;
}

- (void)setPhotoAttributionPreferences:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_photoAttributionPreferences, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackComponentValue;
  v4 = [(GEORPFeedbackComponentValue *)&v8 description];
  v5 = [(GEORPFeedbackComponentValue *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackComponentValue _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 notification];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"notification"];
    }
    objc_super v8 = [a1 overview];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"overview"];
    }
    v11 = [a1 conversation];
    v12 = v11;
    if (v11)
    {
      if (a2) {
        [v11 jsonRepresentation];
      }
      else {
      v13 = [v11 dictionaryRepresentation];
      }
      [v4 setObject:v13 forKey:@"conversation"];
    }
    v14 = [a1 poiEnrichment];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"poiEnrichment";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"poi_enrichment";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = [a1 rapInfo];
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"rapInfo";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"rap_info";
      }
      [v4 setObject:v20 forKey:v21];
    }
    v22 = [a1 thirdPartyPhotoSharingPreferences];
    v23 = v22;
    if (v22)
    {
      if (a2)
      {
        v24 = [v22 jsonRepresentation];
        v25 = @"thirdPartyPhotoSharingPreferences";
      }
      else
      {
        v24 = [v22 dictionaryRepresentation];
        v25 = @"third_party_photo_sharing_preferences";
      }
      [v4 setObject:v24 forKey:v25];
    }
    v26 = [a1 photoAttributionPreferences];
    v27 = v26;
    if (v26)
    {
      if (a2)
      {
        v28 = [v26 jsonRepresentation];
        v29 = @"photoAttributionPreferences";
      }
      else
      {
        v28 = [v26 dictionaryRepresentation];
        v29 = @"photo_attribution_preferences";
      }
      [v4 setObject:v28 forKey:v29];
    }
    v30 = (void *)a1[2];
    if (v30)
    {
      v31 = [v30 dictionaryRepresentation];
      v32 = v31;
      if (a2)
      {
        v33 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __57__GEORPFeedbackComponentValue__dictionaryRepresentation___block_invoke;
        v37[3] = &unk_1E53D8860;
        id v34 = v33;
        id v38 = v34;
        [v32 enumerateKeysAndObjectsUsingBlock:v37];
        id v35 = v34;

        v32 = v35;
      }
      [v4 setObject:v32 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackComponentValue _dictionaryRepresentation:](self, 1);
}

void __57__GEORPFeedbackComponentValue__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEORPFeedbackComponentValue)initWithDictionary:(id)a3
{
  return (GEORPFeedbackComponentValue *)-[GEORPFeedbackComponentValue _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"notification"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEORPFeedbackNotification alloc];
        if (a3) {
          uint64_t v8 = [(GEORPFeedbackNotification *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEORPFeedbackNotification *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setNotification:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"overview"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEORPFeedbackOverview alloc];
        if (a3) {
          uint64_t v12 = [(GEORPFeedbackOverview *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEORPFeedbackOverview *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setOverview:v12];
      }
      v14 = [v5 objectForKeyedSubscript:@"conversation"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = [GEORPFeedbackConversation alloc];
        if (a3) {
          uint64_t v16 = [(GEORPFeedbackConversation *)v15 initWithJSON:v14];
        }
        else {
          uint64_t v16 = [(GEORPFeedbackConversation *)v15 initWithDictionary:v14];
        }
        v17 = (void *)v16;
        [a1 setConversation:v16];
      }
      if (a3) {
        v18 = @"poiEnrichment";
      }
      else {
        v18 = @"poi_enrichment";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [GEORPPoiEnrichment alloc];
        if (a3) {
          uint64_t v21 = [(GEORPPoiEnrichment *)v20 initWithJSON:v19];
        }
        else {
          uint64_t v21 = [(GEORPPoiEnrichment *)v20 initWithDictionary:v19];
        }
        v22 = (void *)v21;
        [a1 setPoiEnrichment:v21];
      }
      if (a3) {
        v23 = @"rapInfo";
      }
      else {
        v23 = @"rap_info";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = [GEORPRapInfo alloc];
        if (a3) {
          uint64_t v26 = [(GEORPRapInfo *)v25 initWithJSON:v24];
        }
        else {
          uint64_t v26 = [(GEORPRapInfo *)v25 initWithDictionary:v24];
        }
        v27 = (void *)v26;
        [a1 setRapInfo:v26];
      }
      if (a3) {
        v28 = @"thirdPartyPhotoSharingPreferences";
      }
      else {
        v28 = @"third_party_photo_sharing_preferences";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v30 = [GEORPThirdPartyPhotoSharingPreference alloc];
        if (a3) {
          uint64_t v31 = [(GEORPThirdPartyPhotoSharingPreference *)v30 initWithJSON:v29];
        }
        else {
          uint64_t v31 = [(GEORPThirdPartyPhotoSharingPreference *)v30 initWithDictionary:v29];
        }
        v32 = (void *)v31;
        [a1 setThirdPartyPhotoSharingPreferences:v31];
      }
      if (a3) {
        v33 = @"photoAttributionPreferences";
      }
      else {
        v33 = @"photo_attribution_preferences";
      }
      id v34 = [v5 objectForKeyedSubscript:v33];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v35 = [GEORPPhotoAttributionPreferences alloc];
        if (a3) {
          uint64_t v36 = [(GEORPPhotoAttributionPreferences *)v35 initWithJSON:v34];
        }
        else {
          uint64_t v36 = [(GEORPPhotoAttributionPreferences *)v35 initWithDictionary:v34];
        }
        v37 = (void *)v36;
        [a1 setPhotoAttributionPreferences:v36];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackComponentValue)initWithJSON:(id)a3
{
  return (GEORPFeedbackComponentValue *)-[GEORPFeedbackComponentValue _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_293;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_294;
    }
    GEORPFeedbackComponentValueReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPFeedbackComponentValueCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackComponentValueIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackComponentValueReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPFeedbackComponentValueIsDirty((uint64_t)self))
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
    [(GEORPFeedbackComponentValue *)self readAll:0];
    if (self->_notification) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_overview)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_conversation)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_poiEnrichment)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_rapInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_thirdPartyPhotoSharingPreferences)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_photoAttributionPreferences)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPFeedbackComponentValue _readRapInfo]((uint64_t)self);
  rapInfo = self->_rapInfo;

  return [(GEORPRapInfo *)rapInfo hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPFeedbackComponentValue *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 20) = self->_readerMarkPos;
  *((_DWORD *)v5 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_notification) {
    objc_msgSend(v5, "setNotification:");
  }
  if (self->_overview) {
    objc_msgSend(v5, "setOverview:");
  }
  v4 = v5;
  if (self->_conversation)
  {
    objc_msgSend(v5, "setConversation:");
    v4 = v5;
  }
  if (self->_poiEnrichment)
  {
    objc_msgSend(v5, "setPoiEnrichment:");
    v4 = v5;
  }
  if (self->_rapInfo)
  {
    objc_msgSend(v5, "setRapInfo:");
    v4 = v5;
  }
  if (self->_thirdPartyPhotoSharingPreferences)
  {
    objc_msgSend(v5, "setThirdPartyPhotoSharingPreferences:");
    v4 = v5;
  }
  if (self->_photoAttributionPreferences)
  {
    objc_msgSend(v5, "setPhotoAttributionPreferences:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackComponentValue *)self readAll:0];
    id v8 = [(GEORPFeedbackNotification *)self->_notification copyWithZone:a3];
    v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    id v10 = [(GEORPFeedbackOverview *)self->_overview copyWithZone:a3];
    v11 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;

    id v12 = [(GEORPFeedbackConversation *)self->_conversation copyWithZone:a3];
    v13 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v12;

    id v14 = [(GEORPPoiEnrichment *)self->_poiEnrichment copyWithZone:a3];
    v15 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v14;

    id v16 = [(GEORPRapInfo *)self->_rapInfo copyWithZone:a3];
    v17 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v16;

    id v18 = [(GEORPThirdPartyPhotoSharingPreference *)self->_thirdPartyPhotoSharingPreferences copyWithZone:a3];
    v19 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v18;

    id v20 = [(GEORPPhotoAttributionPreferences *)self->_photoAttributionPreferences copyWithZone:a3];
    uint64_t v21 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v20;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPFeedbackComponentValueReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEORPFeedbackComponentValue *)self readAll:1];
  [v4 readAll:1];
  notification = self->_notification;
  if ((unint64_t)notification | v4[4])
  {
    if (!-[GEORPFeedbackNotification isEqual:](notification, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (((overview = self->_overview, !((unint64_t)overview | v4[5]))
     || -[GEORPFeedbackOverview isEqual:](overview, "isEqual:"))
    && ((conversation = self->_conversation, !((unint64_t)conversation | v4[3]))
     || -[GEORPFeedbackConversation isEqual:](conversation, "isEqual:"))
    && ((poiEnrichment = self->_poiEnrichment, !((unint64_t)poiEnrichment | v4[7]))
     || -[GEORPPoiEnrichment isEqual:](poiEnrichment, "isEqual:"))
    && ((rapInfo = self->_rapInfo, !((unint64_t)rapInfo | v4[8])) || -[GEORPRapInfo isEqual:](rapInfo, "isEqual:"))&& ((thirdPartyPhotoSharingPreferences = self->_thirdPartyPhotoSharingPreferences, !((unint64_t)thirdPartyPhotoSharingPreferences | v4[9]))|| -[GEORPThirdPartyPhotoSharingPreference isEqual:](thirdPartyPhotoSharingPreferences, "isEqual:")))
  {
    photoAttributionPreferences = self->_photoAttributionPreferences;
    if ((unint64_t)photoAttributionPreferences | v4[6]) {
      char v12 = -[GEORPPhotoAttributionPreferences isEqual:](photoAttributionPreferences, "isEqual:");
    }
    else {
      char v12 = 1;
    }
  }
  else
  {
LABEL_16:
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  [(GEORPFeedbackComponentValue *)self readAll:1];
  unint64_t v3 = [(GEORPFeedbackNotification *)self->_notification hash];
  unint64_t v4 = [(GEORPFeedbackOverview *)self->_overview hash] ^ v3;
  unint64_t v5 = [(GEORPFeedbackConversation *)self->_conversation hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEORPPoiEnrichment *)self->_poiEnrichment hash];
  unint64_t v7 = [(GEORPRapInfo *)self->_rapInfo hash];
  unint64_t v8 = v7 ^ [(GEORPThirdPartyPhotoSharingPreference *)self->_thirdPartyPhotoSharingPreferences hash];
  return v6 ^ v8 ^ [(GEORPPhotoAttributionPreferences *)self->_photoAttributionPreferences hash];
}

- (void)mergeFrom:(id)a3
{
  id v18 = a3;
  [v18 readAll:0];
  notification = self->_notification;
  uint64_t v5 = v18[4];
  if (notification)
  {
    if (v5) {
      -[GEORPFeedbackNotification mergeFrom:](notification, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPFeedbackComponentValue setNotification:](self, "setNotification:");
  }
  overview = self->_overview;
  uint64_t v7 = v18[5];
  if (overview)
  {
    if (v7) {
      -[GEORPFeedbackOverview mergeFrom:](overview, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPFeedbackComponentValue setOverview:](self, "setOverview:");
  }
  conversation = self->_conversation;
  uint64_t v9 = v18[3];
  if (conversation)
  {
    if (v9) {
      -[GEORPFeedbackConversation mergeFrom:](conversation, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEORPFeedbackComponentValue setConversation:](self, "setConversation:");
  }
  poiEnrichment = self->_poiEnrichment;
  uint64_t v11 = v18[7];
  if (poiEnrichment)
  {
    if (v11) {
      -[GEORPPoiEnrichment mergeFrom:](poiEnrichment, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEORPFeedbackComponentValue setPoiEnrichment:](self, "setPoiEnrichment:");
  }
  rapInfo = self->_rapInfo;
  uint64_t v13 = v18[8];
  if (rapInfo)
  {
    if (v13) {
      -[GEORPRapInfo mergeFrom:](rapInfo, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEORPFeedbackComponentValue setRapInfo:](self, "setRapInfo:");
  }
  thirdPartyPhotoSharingPreferences = self->_thirdPartyPhotoSharingPreferences;
  uint64_t v15 = v18[9];
  if (thirdPartyPhotoSharingPreferences)
  {
    if (v15) {
      -[GEORPThirdPartyPhotoSharingPreference mergeFrom:](thirdPartyPhotoSharingPreferences, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEORPFeedbackComponentValue setThirdPartyPhotoSharingPreferences:](self, "setThirdPartyPhotoSharingPreferences:");
  }
  photoAttributionPreferences = self->_photoAttributionPreferences;
  uint64_t v17 = v18[6];
  if (photoAttributionPreferences)
  {
    if (v17) {
      -[GEORPPhotoAttributionPreferences mergeFrom:](photoAttributionPreferences, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[GEORPFeedbackComponentValue setPhotoAttributionPreferences:](self, "setPhotoAttributionPreferences:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackComponentValueReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_298);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x101u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPFeedbackComponentValue *)self readAll:0];
    [(GEORPFeedbackNotification *)self->_notification clearUnknownFields:1];
    [(GEORPFeedbackOverview *)self->_overview clearUnknownFields:1];
    [(GEORPFeedbackConversation *)self->_conversation clearUnknownFields:1];
    rapInfo = self->_rapInfo;
    [(GEORPRapInfo *)rapInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyPhotoSharingPreferences, 0);
  objc_storeStrong((id *)&self->_rapInfo, 0);
  objc_storeStrong((id *)&self->_poiEnrichment, 0);
  objc_storeStrong((id *)&self->_photoAttributionPreferences, 0);
  objc_storeStrong((id *)&self->_overview, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end