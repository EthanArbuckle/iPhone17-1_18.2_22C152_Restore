@interface GEOPDMessageLink
+ (id)messageLinkForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDMessageLink)init;
- (GEOPDMessageLink)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)hoursOfOperations;
- (id)jsonRepresentation;
- (id)messageId;
- (id)messageUrl;
- (id)navBackgroundColor;
- (id)navTintColor;
- (id)timezone;
- (uint64_t)responseTime;
- (unint64_t)hash;
- (void)_addNoFlagsHoursOfOperation:(uint64_t)a1;
- (void)_readHoursOfOperations;
- (void)_readMessageId;
- (void)_readMessageUrl;
- (void)_readNavBackgroundColor;
- (void)_readNavTintColor;
- (void)_readTimezone;
- (void)addHoursOfOperation:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDMessageLink

+ (id)messageLinkForPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__GEOPDMessageLink_PlaceDataExtras__messageLinkForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:39 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __61__GEOPDMessageLink_PlaceDataExtras__messageLinkForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue messageLink](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (GEOPDMessageLink)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDMessageLink;
  v2 = [(GEOPDMessageLink *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDMessageLink)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDMessageLink;
  id v3 = [(GEOPDMessageLink *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readMessageId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMessageLinkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMessageId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)messageId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDMessageLink _readMessageId]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readMessageUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMessageLinkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMessageUrl_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)messageUrl
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDMessageLink _readMessageUrl]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)responseTime
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 92);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    if (v2) {
      return *(unsigned int *)(v1 + 84);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readHoursOfOperations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 8) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMessageLinkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHoursOfOperations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)hoursOfOperations
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDMessageLink _readHoursOfOperations]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addHoursOfOperation:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDMessageLink _readHoursOfOperations](a1);
    -[GEOPDMessageLink _addNoFlagsHoursOfOperation:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 92) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 92) |= 0x200u;
  }
}

- (void)_addNoFlagsHoursOfOperation:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readTimezone
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMessageLinkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimezone_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)timezone
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDMessageLink _readTimezone]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readNavBackgroundColor
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMessageLinkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNavBackgroundColor_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)navBackgroundColor
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDMessageLink _readNavBackgroundColor]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readNavTintColor
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMessageLinkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNavTintColor_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)navTintColor
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDMessageLink _readNavTintColor]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDMessageLink;
  id v4 = [(GEOPDMessageLink *)&v8 description];
  id v5 = [(GEOPDMessageLink *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMessageLink _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDMessageLink readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDMessageLink messageId]((id *)a1);
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"messageId";
      }
      else {
        objc_super v6 = @"message_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    id v7 = -[GEOPDMessageLink messageUrl]((id *)a1);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"messageUrl";
      }
      else {
        objc_super v8 = @"message_url";
      }
      [v4 setObject:v7 forKey:v8];
    }

    if (*(_WORD *)(a1 + 92))
    {
      uint64_t v9 = *(int *)(a1 + 84);
      if (v9 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53E3C60[v9];
      }
      if (a2) {
        v11 = @"responseTime";
      }
      else {
        v11 = @"response_time";
      }
      [v4 setObject:v10 forKey:v11];
    }
    if ([*(id *)(a1 + 24) count])
    {
      id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v13 = *(id *)(a1 + 24);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v40 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if (a2) {
              [v18 jsonRepresentation];
            }
            else {
            v19 = [v18 dictionaryRepresentation];
            }
            [v12 addObject:v19];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v15);
      }

      if (a2) {
        v20 = @"hoursOfOperation";
      }
      else {
        v20 = @"hours_of_operation";
      }
      [v4 setObject:v12 forKey:v20];
    }
    v21 = -[GEOPDMessageLink timezone]((id *)a1);
    v22 = v21;
    if (v21)
    {
      if (a2) {
        [v21 jsonRepresentation];
      }
      else {
      v23 = [v21 dictionaryRepresentation];
      }
      [v4 setObject:v23 forKey:@"timezone"];
    }
    if ((*(_WORD *)(a1 + 92) & 2) != 0)
    {
      v24 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 88)];
      if (a2) {
        v25 = @"isVerified";
      }
      else {
        v25 = @"is_verified";
      }
      [v4 setObject:v24 forKey:v25];
    }
    v26 = -[GEOPDMessageLink navBackgroundColor]((id *)a1);
    if (v26)
    {
      if (a2) {
        v27 = @"navBackgroundColor";
      }
      else {
        v27 = @"nav_background_color";
      }
      [v4 setObject:v26 forKey:v27];
    }

    v28 = -[GEOPDMessageLink navTintColor]((id *)a1);
    if (v28)
    {
      if (a2) {
        v29 = @"navTintColor";
      }
      else {
        v29 = @"nav_tint_color";
      }
      [v4 setObject:v28 forKey:v29];
    }

    v30 = *(void **)(a1 + 16);
    if (v30)
    {
      v31 = [v30 dictionaryRepresentation];
      v32 = v31;
      if (a2)
      {
        v33 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __46__GEOPDMessageLink__dictionaryRepresentation___block_invoke;
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
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDMessageLink _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_6425;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_6426;
      }
      GEOPDMessageLinkReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDMessageLinkCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __46__GEOPDMessageLink__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDMessageLinkReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3F8) == 0))
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDMessageLink readAll:]((uint64_t)self, 0);
    if (self->_messageId) {
      PBDataWriterWriteStringField();
    }
    if (self->_messageUrl) {
      PBDataWriterWriteStringField();
    }
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_hoursOfOperations;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_timezone) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_navBackgroundColor) {
      PBDataWriterWriteStringField();
    }
    if (self->_navTintColor) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDMessageLinkReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDMessageLink readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_messageId copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_messageUrl copyWithZone:a3];
  long long v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 84) = self->_responseTime;
    *(_WORD *)(v5 + 92) |= 1u;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v13 = self->_hoursOfOperations;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "copyWithZone:", a3, (void)v26);
        -[GEOPDMessageLink addHoursOfOperation:](v5, v17);
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }

  id v18 = [(GEOTimezone *)self->_timezone copyWithZone:a3];
  v19 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v18;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 88) = self->_isVerified;
    *(_WORD *)(v5 + 92) |= 2u;
  }
  uint64_t v20 = -[NSString copyWithZone:](self->_navBackgroundColor, "copyWithZone:", a3, (void)v26);
  v21 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v20;

  uint64_t v22 = [(NSString *)self->_navTintColor copyWithZone:a3];
  v23 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v22;

  v24 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v24;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  -[GEOPDMessageLink readAll:]((uint64_t)self, 1);
  -[GEOPDMessageLink readAll:]((uint64_t)v4, 1);
  messageId = self->_messageId;
  if ((unint64_t)messageId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](messageId, "isEqual:")) {
      goto LABEL_27;
    }
  }
  messageUrl = self->_messageUrl;
  if ((unint64_t)messageUrl | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](messageUrl, "isEqual:")) {
      goto LABEL_27;
    }
  }
  __int16 v7 = *((_WORD *)v4 + 46);
  if (*(_WORD *)&self->_flags)
  {
    if ((v7 & 1) == 0 || self->_responseTime != *((_DWORD *)v4 + 21)) {
      goto LABEL_27;
    }
  }
  else if (v7)
  {
    goto LABEL_27;
  }
  hoursOfOperations = self->_hoursOfOperations;
  if ((unint64_t)hoursOfOperations | *((void *)v4 + 3)
    && !-[NSMutableArray isEqual:](hoursOfOperations, "isEqual:"))
  {
    goto LABEL_27;
  }
  timezone = self->_timezone;
  if ((unint64_t)timezone | *((void *)v4 + 8))
  {
    if (!-[GEOTimezone isEqual:](timezone, "isEqual:")) {
      goto LABEL_27;
    }
  }
  __int16 v10 = *((_WORD *)v4 + 46);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v10 & 2) != 0)
    {
      if (self->_isVerified)
      {
        if (!*((unsigned char *)v4 + 88)) {
          goto LABEL_27;
        }
        goto LABEL_23;
      }
      if (!*((unsigned char *)v4 + 88)) {
        goto LABEL_23;
      }
    }
LABEL_27:
    char v13 = 0;
    goto LABEL_28;
  }
  if ((v10 & 2) != 0) {
    goto LABEL_27;
  }
LABEL_23:
  navBackgroundColor = self->_navBackgroundColor;
  if ((unint64_t)navBackgroundColor | *((void *)v4 + 6)
    && !-[NSString isEqual:](navBackgroundColor, "isEqual:"))
  {
    goto LABEL_27;
  }
  navTintColor = self->_navTintColor;
  if ((unint64_t)navTintColor | *((void *)v4 + 7)) {
    char v13 = -[NSString isEqual:](navTintColor, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_28:

  return v13;
}

- (unint64_t)hash
{
  -[GEOPDMessageLink readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_messageId hash];
  NSUInteger v4 = [(NSString *)self->_messageUrl hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_responseTime;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [(NSMutableArray *)self->_hoursOfOperations hash];
  unint64_t v7 = [(GEOTimezone *)self->_timezone hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_isVerified;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_navBackgroundColor hash];
  return v9 ^ [(NSString *)self->_navTintColor hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_navTintColor, 0);
  objc_storeStrong((id *)&self->_navBackgroundColor, 0);
  objc_storeStrong((id *)&self->_messageUrl, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_hoursOfOperations, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end