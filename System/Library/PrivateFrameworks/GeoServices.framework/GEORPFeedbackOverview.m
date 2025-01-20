@interface GEORPFeedbackOverview
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCreatedAt;
- (BOOL)hasFeedbackState;
- (BOOL)hasLastUpdatedAt;
- (BOOL)hasStateDescription;
- (BOOL)hasTitle;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackOverview)init;
- (GEORPFeedbackOverview)initWithData:(id)a3;
- (GEORPFeedbackOverview)initWithDictionary:(id)a3;
- (GEORPFeedbackOverview)initWithJSON:(id)a3;
- (GEORPTimestamp)createdAt;
- (GEORPTimestamp)lastUpdatedAt;
- (NSString)stateDescription;
- (NSString)title;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedbackStateAsString:(int)a3;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsFeedbackState:(id)a3;
- (int)StringAsType:(id)a3;
- (int)feedbackState;
- (int)type;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCreatedAt;
- (void)_readLastUpdatedAt;
- (void)_readStateDescription;
- (void)_readTitle;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCreatedAt:(id)a3;
- (void)setFeedbackState:(int)a3;
- (void)setHasFeedbackState:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setLastUpdatedAt:(id)a3;
- (void)setStateDescription:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackOverview

- (GEORPFeedbackOverview)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackOverview;
  v2 = [(GEORPFeedbackOverview *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackOverview)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackOverview;
  v3 = [(GEORPFeedbackOverview *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F6738[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_OTHER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_POI"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_TRANSIT_POI"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_ADDRESS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_TILE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_SEARCH"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_MERCHANT_LOOKUP"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_DIRECTIONS"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_GROUND_VIEW"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_POI_ENRICHMENT"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_INCIDENT"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_CURATED_COLLECTION"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_POI_IMAGE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_POI_ACTIVITY"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_ADD_TO_MAP"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_LOCALITY"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_STREET"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_THIRD_PARTY_PHOTO_SHARING_PREFERENCE"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_PHOTO_ATTRIBUTION_PREFERENCE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_RUNNING_TRACK"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_TYPE_RAP_USER_RESPONSE"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackOverviewReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_579);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (NSString)title
{
  -[GEORPFeedbackOverview _readTitle]((uint64_t)self);
  title = self->_title;

  return title;
}

- (void)setTitle:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readCreatedAt
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackOverviewReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCreatedAt_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasCreatedAt
{
  return self->_createdAt != 0;
}

- (GEORPTimestamp)createdAt
{
  -[GEORPFeedbackOverview _readCreatedAt]((uint64_t)self);
  createdAt = self->_createdAt;

  return createdAt;
}

- (void)setCreatedAt:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_createdAt, a3);
}

- (void)_readLastUpdatedAt
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackOverviewReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLastUpdatedAt_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLastUpdatedAt
{
  return self->_lastUpdatedAt != 0;
}

- (GEORPTimestamp)lastUpdatedAt
{
  -[GEORPFeedbackOverview _readLastUpdatedAt]((uint64_t)self);
  lastUpdatedAt = self->_lastUpdatedAt;

  return lastUpdatedAt;
}

- (void)setLastUpdatedAt:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_lastUpdatedAt, a3);
}

- (int)feedbackState
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_feedbackState;
  }
  else {
    return 0;
  }
}

- (void)setFeedbackState:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_feedbackState = a3;
}

- (void)setHasFeedbackState:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasFeedbackState
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)feedbackStateAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F67E8[a3];
  }

  return v3;
}

- (int)StringAsFeedbackState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_STATE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_STATE_CREATED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_STATE_IN_PROGRESS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_STATE_ON_HOLD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_STATE_REJECTED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_STATE_FIXED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_STATE_ASSIGNED_TO_VENDOR"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_STATE_TELL_US_MORE"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readStateDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackOverviewReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStateDescription_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasStateDescription
{
  return self->_stateDescription != 0;
}

- (NSString)stateDescription
{
  -[GEORPFeedbackOverview _readStateDescription]((uint64_t)self);
  stateDescription = self->_stateDescription;

  return stateDescription;
}

- (void)setStateDescription:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_stateDescription, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackOverview;
  int v4 = [(GEORPFeedbackOverview *)&v8 description];
  v5 = [(GEORPFeedbackOverview *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackOverview _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 76) & 2) != 0)
    {
      uint64_t v5 = *(int *)(a1 + 72);
      if (v5 >= 0x16)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 72));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53F6738[v5];
      }
      [v4 setObject:v6 forKey:@"type"];
    }
    objc_super v7 = [(id)a1 title];
    if (v7) {
      [v4 setObject:v7 forKey:@"title"];
    }

    objc_super v8 = [(id)a1 createdAt];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"createdAt";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"created_at";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = [(id)a1 lastUpdatedAt];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"lastUpdatedAt";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"last_updated_at";
      }
      [v4 setObject:v14 forKey:v15];
    }
    if (*(unsigned char *)(a1 + 76))
    {
      uint64_t v16 = *(int *)(a1 + 68);
      if (v16 >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = off_1E53F67E8[v16];
      }
      if (a2) {
        v18 = @"feedbackState";
      }
      else {
        v18 = @"feedback_state";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = [(id)a1 stateDescription];
    if (v19)
    {
      if (a2) {
        v20 = @"stateDescription";
      }
      else {
        v20 = @"state_description";
      }
      [v4 setObject:v19 forKey:v20];
    }

    v21 = *(void **)(a1 + 16);
    if (v21)
    {
      v22 = [v21 dictionaryRepresentation];
      v23 = v22;
      if (a2)
      {
        v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __51__GEORPFeedbackOverview__dictionaryRepresentation___block_invoke;
        v28[3] = &unk_1E53D8860;
        id v25 = v24;
        id v29 = v25;
        [v23 enumerateKeysAndObjectsUsingBlock:v28];
        id v26 = v25;

        v23 = v26;
      }
      [v4 setObject:v23 forKey:@"Unknown Fields"];
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
  return -[GEORPFeedbackOverview _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEORPFeedbackOverview__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackOverview)initWithDictionary:(id)a3
{
  return (GEORPFeedbackOverview *)-[GEORPFeedbackOverview _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_102;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_102;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"FEEDBACK_TYPE_UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_OTHER"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_POI"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_TRANSIT_POI"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_ADDRESS"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_TILE"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_SEARCH"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_MERCHANT_LOOKUP"])
    {
      uint64_t v8 = 7;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_DIRECTIONS"])
    {
      uint64_t v8 = 8;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_GROUND_VIEW"])
    {
      uint64_t v8 = 9;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_POI_ENRICHMENT"])
    {
      uint64_t v8 = 10;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_INCIDENT"])
    {
      uint64_t v8 = 11;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_CURATED_COLLECTION"])
    {
      uint64_t v8 = 12;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_POI_IMAGE"])
    {
      uint64_t v8 = 13;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_POI_ACTIVITY"])
    {
      uint64_t v8 = 14;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_ADD_TO_MAP"])
    {
      uint64_t v8 = 15;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_LOCALITY"])
    {
      uint64_t v8 = 16;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_STREET"])
    {
      uint64_t v8 = 17;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_THIRD_PARTY_PHOTO_SHARING_PREFERENCE"])
    {
      uint64_t v8 = 18;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_PHOTO_ATTRIBUTION_PREFERENCE"])
    {
      uint64_t v8 = 19;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_RUNNING_TRACK"])
    {
      uint64_t v8 = 20;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_TYPE_RAP_USER_RESPONSE"])
    {
      uint64_t v8 = 21;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_53;
    }
    uint64_t v8 = [v6 intValue];
  }
  [a1 setType:v8];
LABEL_53:

  v9 = [v5 objectForKeyedSubscript:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = (void *)[v9 copy];
    [a1 setTitle:v10];
  }
  if (a3) {
    v11 = @"createdAt";
  }
  else {
    v11 = @"created_at";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [GEORPTimestamp alloc];
    if (a3) {
      uint64_t v14 = [(GEORPTimestamp *)v13 initWithJSON:v12];
    }
    else {
      uint64_t v14 = [(GEORPTimestamp *)v13 initWithDictionary:v12];
    }
    v15 = (void *)v14;
    [a1 setCreatedAt:v14];
  }
  if (a3) {
    uint64_t v16 = @"lastUpdatedAt";
  }
  else {
    uint64_t v16 = @"last_updated_at";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [GEORPTimestamp alloc];
    if (a3) {
      uint64_t v19 = [(GEORPTimestamp *)v18 initWithJSON:v17];
    }
    else {
      uint64_t v19 = [(GEORPTimestamp *)v18 initWithDictionary:v17];
    }
    v20 = (void *)v19;
    [a1 setLastUpdatedAt:v19];
  }
  if (a3) {
    v21 = @"feedbackState";
  }
  else {
    v21 = @"feedback_state";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v22;
    if ([v23 isEqualToString:@"FEEDBACK_STATE_UNKNOWN"])
    {
      uint64_t v24 = 0;
    }
    else if ([v23 isEqualToString:@"FEEDBACK_STATE_CREATED"])
    {
      uint64_t v24 = 1;
    }
    else if ([v23 isEqualToString:@"FEEDBACK_STATE_IN_PROGRESS"])
    {
      uint64_t v24 = 2;
    }
    else if ([v23 isEqualToString:@"FEEDBACK_STATE_ON_HOLD"])
    {
      uint64_t v24 = 3;
    }
    else if ([v23 isEqualToString:@"FEEDBACK_STATE_REJECTED"])
    {
      uint64_t v24 = 4;
    }
    else if ([v23 isEqualToString:@"FEEDBACK_STATE_FIXED"])
    {
      uint64_t v24 = 5;
    }
    else if ([v23 isEqualToString:@"FEEDBACK_STATE_ASSIGNED_TO_VENDOR"])
    {
      uint64_t v24 = 6;
    }
    else if ([v23 isEqualToString:@"FEEDBACK_STATE_TELL_US_MORE"])
    {
      uint64_t v24 = 7;
    }
    else
    {
      uint64_t v24 = 0;
    }

    goto LABEL_95;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v24 = [v22 intValue];
LABEL_95:
    [a1 setFeedbackState:v24];
  }

  if (a3) {
    id v25 = @"stateDescription";
  }
  else {
    id v25 = @"state_description";
  }
  id v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = (void *)[v26 copy];
    [a1 setStateDescription:v27];
  }
LABEL_102:

  return a1;
}

- (GEORPFeedbackOverview)initWithJSON:(id)a3
{
  return (GEORPFeedbackOverview *)-[GEORPFeedbackOverview _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_604;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_605;
    }
    GEORPFeedbackOverviewReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEORPTimestamp *)self->_createdAt readAll:1];
    [(GEORPTimestamp *)self->_lastUpdatedAt readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackOverviewIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackOverviewReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 7u))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackOverview *)self readAll:0];
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_title)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_createdAt)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_lastUpdatedAt)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    if (self->_stateDescription)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPFeedbackOverview *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v5 + 18) = self->_type;
    *((unsigned char *)v5 + 76) |= 2u;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    int v4 = v5;
  }
  if (self->_createdAt)
  {
    objc_msgSend(v5, "setCreatedAt:");
    int v4 = v5;
  }
  if (self->_lastUpdatedAt)
  {
    objc_msgSend(v5, "setLastUpdatedAt:");
    int v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 17) = self->_feedbackState;
    *((unsigned char *)v4 + 76) |= 1u;
  }
  if (self->_stateDescription)
  {
    objc_msgSend(v5, "setStateDescription:");
    int v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPFeedbackOverviewReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackOverview *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_type;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_title copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  id v11 = [(GEORPTimestamp *)self->_createdAt copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  id v13 = [(GEORPTimestamp *)self->_lastUpdatedAt copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_feedbackState;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  uint64_t v15 = [(NSString *)self->_stateDescription copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  [(GEORPFeedbackOverview *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_type != *((_DWORD *)v4 + 18)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
LABEL_20:
    char v9 = 0;
    goto LABEL_21;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 6) && !-[NSString isEqual:](title, "isEqual:")) {
    goto LABEL_20;
  }
  createdAt = self->_createdAt;
  if ((unint64_t)createdAt | *((void *)v4 + 3))
  {
    if (!-[GEORPTimestamp isEqual:](createdAt, "isEqual:")) {
      goto LABEL_20;
    }
  }
  lastUpdatedAt = self->_lastUpdatedAt;
  if ((unint64_t)lastUpdatedAt | *((void *)v4 + 4))
  {
    if (!-[GEORPTimestamp isEqual:](lastUpdatedAt, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_feedbackState != *((_DWORD *)v4 + 17)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_20;
  }
  stateDescription = self->_stateDescription;
  if ((unint64_t)stateDescription | *((void *)v4 + 5)) {
    char v9 = -[NSString isEqual:](stateDescription, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  [(GEORPFeedbackOverview *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_title hash];
  unint64_t v5 = [(GEORPTimestamp *)self->_createdAt hash];
  unint64_t v6 = [(GEORPTimestamp *)self->_lastUpdatedAt hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v7 = 2654435761 * self->_feedbackState;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_stateDescription hash];
}

- (void)mergeFrom:(id)a3
{
  char v9 = (int *)a3;
  [v9 readAll:0];
  NSUInteger v4 = v9;
  if ((v9[19] & 2) != 0)
  {
    self->_type = v9[18];
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (*((void *)v9 + 6))
  {
    -[GEORPFeedbackOverview setTitle:](self, "setTitle:");
    NSUInteger v4 = v9;
  }
  createdAt = self->_createdAt;
  uint64_t v6 = *((void *)v4 + 3);
  if (createdAt)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEORPTimestamp mergeFrom:](createdAt, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEORPFeedbackOverview setCreatedAt:](self, "setCreatedAt:");
  }
  NSUInteger v4 = v9;
LABEL_11:
  lastUpdatedAt = self->_lastUpdatedAt;
  uint64_t v8 = *((void *)v4 + 4);
  if (lastUpdatedAt)
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[GEORPTimestamp mergeFrom:](lastUpdatedAt, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[GEORPFeedbackOverview setLastUpdatedAt:](self, "setLastUpdatedAt:");
  }
  NSUInteger v4 = v9;
LABEL_17:
  if (v4[19])
  {
    self->_feedbackState = v4[17];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v4 + 5))
  {
    -[GEORPFeedbackOverview setStateDescription:](self, "setStateDescription:");
    NSUInteger v4 = v9;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackOverviewReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_609);
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
  *(unsigned char *)&self->_flags |= 0x84u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPFeedbackOverview *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_stateDescription, 0);
  objc_storeStrong((id *)&self->_lastUpdatedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end