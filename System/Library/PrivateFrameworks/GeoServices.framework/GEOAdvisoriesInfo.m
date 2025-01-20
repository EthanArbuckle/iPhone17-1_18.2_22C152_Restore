@interface GEOAdvisoriesInfo
+ (BOOL)isValid:(id)a3;
+ (Class)genericAdvisoryType;
+ (Class)incidentAdvisoryType;
+ (Class)noticeAdvisoryType;
- (BOOL)hasClickableAdvisory;
- (BOOL)hasEvAdvisory;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasTollAdvisory;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAdvisoriesInfo)init;
- (GEOAdvisoriesInfo)initWithData:(id)a3;
- (GEOAdvisoriesInfo)initWithDictionary:(id)a3;
- (GEOAdvisoriesInfo)initWithJSON:(id)a3;
- (GEOAdvisoryNotice)evAdvisory;
- (GEOAdvisoryNotice)tollAdvisory;
- (GEOClickableAdvisory)clickableAdvisory;
- (NSMutableArray)genericAdvisorys;
- (NSMutableArray)incidentAdvisorys;
- (NSMutableArray)noticeAdvisorys;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)genericAdvisoryAtIndex:(unint64_t)a3;
- (id)incidentAdvisoryAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)noticeAdvisoryAtIndex:(unint64_t)a3;
- (unint64_t)genericAdvisorysCount;
- (unint64_t)hash;
- (unint64_t)incidentAdvisorysCount;
- (unint64_t)noticeAdvisorysCount;
- (void)_addNoFlagsGenericAdvisory:(uint64_t)a1;
- (void)_addNoFlagsIncidentAdvisory:(uint64_t)a1;
- (void)_addNoFlagsNoticeAdvisory:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readClickableAdvisory;
- (void)_readEvAdvisory;
- (void)_readGenericAdvisorys;
- (void)_readIncidentAdvisorys;
- (void)_readNoticeAdvisorys;
- (void)_readTollAdvisory;
- (void)addGenericAdvisory:(id)a3;
- (void)addIncidentAdvisory:(id)a3;
- (void)addNoticeAdvisory:(id)a3;
- (void)clearGenericAdvisorys;
- (void)clearIncidentAdvisorys;
- (void)clearNoticeAdvisorys;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setClickableAdvisory:(id)a3;
- (void)setEvAdvisory:(id)a3;
- (void)setGenericAdvisorys:(id)a3;
- (void)setIncidentAdvisorys:(id)a3;
- (void)setNoticeAdvisorys:(id)a3;
- (void)setTollAdvisory:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAdvisoriesInfo

- (GEOAdvisoriesInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAdvisoriesInfo;
  v2 = [(GEOAdvisoriesInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAdvisoriesInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAdvisoriesInfo;
  v3 = [(GEOAdvisoriesInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readNoticeAdvisorys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoriesInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNoticeAdvisorys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)noticeAdvisorys
{
  -[GEOAdvisoriesInfo _readNoticeAdvisorys]((uint64_t)self);
  noticeAdvisorys = self->_noticeAdvisorys;

  return noticeAdvisorys;
}

- (void)setNoticeAdvisorys:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  noticeAdvisorys = self->_noticeAdvisorys;
  self->_noticeAdvisorys = v4;
}

- (void)clearNoticeAdvisorys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  noticeAdvisorys = self->_noticeAdvisorys;

  [(NSMutableArray *)noticeAdvisorys removeAllObjects];
}

- (void)addNoticeAdvisory:(id)a3
{
  id v4 = a3;
  -[GEOAdvisoriesInfo _readNoticeAdvisorys]((uint64_t)self);
  -[GEOAdvisoriesInfo _addNoFlagsNoticeAdvisory:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsNoticeAdvisory:(uint64_t)a1
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

- (unint64_t)noticeAdvisorysCount
{
  -[GEOAdvisoriesInfo _readNoticeAdvisorys]((uint64_t)self);
  noticeAdvisorys = self->_noticeAdvisorys;

  return [(NSMutableArray *)noticeAdvisorys count];
}

- (id)noticeAdvisoryAtIndex:(unint64_t)a3
{
  -[GEOAdvisoriesInfo _readNoticeAdvisorys]((uint64_t)self);
  noticeAdvisorys = self->_noticeAdvisorys;

  return (id)[(NSMutableArray *)noticeAdvisorys objectAtIndex:a3];
}

+ (Class)noticeAdvisoryType
{
  return (Class)objc_opt_class();
}

- (void)_readClickableAdvisory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoriesInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClickableAdvisory_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasClickableAdvisory
{
  return self->_clickableAdvisory != 0;
}

- (GEOClickableAdvisory)clickableAdvisory
{
  -[GEOAdvisoriesInfo _readClickableAdvisory]((uint64_t)self);
  clickableAdvisory = self->_clickableAdvisory;

  return clickableAdvisory;
}

- (void)setClickableAdvisory:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  objc_storeStrong((id *)&self->_clickableAdvisory, a3);
}

- (void)_readTollAdvisory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoriesInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTollAdvisory_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTollAdvisory
{
  return self->_tollAdvisory != 0;
}

- (GEOAdvisoryNotice)tollAdvisory
{
  -[GEOAdvisoriesInfo _readTollAdvisory]((uint64_t)self);
  tollAdvisory = self->_tollAdvisory;

  return tollAdvisory;
}

- (void)setTollAdvisory:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_tollAdvisory, a3);
}

- (void)_readEvAdvisory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoriesInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvAdvisory_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasEvAdvisory
{
  return self->_evAdvisory != 0;
}

- (GEOAdvisoryNotice)evAdvisory
{
  -[GEOAdvisoriesInfo _readEvAdvisory]((uint64_t)self);
  evAdvisory = self->_evAdvisory;

  return evAdvisory;
}

- (void)setEvAdvisory:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_evAdvisory, a3);
}

- (void)_readIncidentAdvisorys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoriesInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentAdvisorys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)incidentAdvisorys
{
  -[GEOAdvisoriesInfo _readIncidentAdvisorys]((uint64_t)self);
  incidentAdvisorys = self->_incidentAdvisorys;

  return incidentAdvisorys;
}

- (void)setIncidentAdvisorys:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  incidentAdvisorys = self->_incidentAdvisorys;
  self->_incidentAdvisorys = v4;
}

- (void)clearIncidentAdvisorys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  incidentAdvisorys = self->_incidentAdvisorys;

  [(NSMutableArray *)incidentAdvisorys removeAllObjects];
}

- (void)addIncidentAdvisory:(id)a3
{
  id v4 = a3;
  -[GEOAdvisoriesInfo _readIncidentAdvisorys]((uint64_t)self);
  -[GEOAdvisoriesInfo _addNoFlagsIncidentAdvisory:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsIncidentAdvisory:(uint64_t)a1
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

- (unint64_t)incidentAdvisorysCount
{
  -[GEOAdvisoriesInfo _readIncidentAdvisorys]((uint64_t)self);
  incidentAdvisorys = self->_incidentAdvisorys;

  return [(NSMutableArray *)incidentAdvisorys count];
}

- (id)incidentAdvisoryAtIndex:(unint64_t)a3
{
  -[GEOAdvisoriesInfo _readIncidentAdvisorys]((uint64_t)self);
  incidentAdvisorys = self->_incidentAdvisorys;

  return (id)[(NSMutableArray *)incidentAdvisorys objectAtIndex:a3];
}

+ (Class)incidentAdvisoryType
{
  return (Class)objc_opt_class();
}

- (void)_readGenericAdvisorys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdvisoriesInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGenericAdvisorys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)genericAdvisorys
{
  -[GEOAdvisoriesInfo _readGenericAdvisorys]((uint64_t)self);
  genericAdvisorys = self->_genericAdvisorys;

  return genericAdvisorys;
}

- (void)setGenericAdvisorys:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  genericAdvisorys = self->_genericAdvisorys;
  self->_genericAdvisorys = v4;
}

- (void)clearGenericAdvisorys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  genericAdvisorys = self->_genericAdvisorys;

  [(NSMutableArray *)genericAdvisorys removeAllObjects];
}

- (void)addGenericAdvisory:(id)a3
{
  id v4 = a3;
  -[GEOAdvisoriesInfo _readGenericAdvisorys]((uint64_t)self);
  -[GEOAdvisoriesInfo _addNoFlagsGenericAdvisory:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsGenericAdvisory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)genericAdvisorysCount
{
  -[GEOAdvisoriesInfo _readGenericAdvisorys]((uint64_t)self);
  genericAdvisorys = self->_genericAdvisorys;

  return [(NSMutableArray *)genericAdvisorys count];
}

- (id)genericAdvisoryAtIndex:(unint64_t)a3
{
  -[GEOAdvisoriesInfo _readGenericAdvisorys]((uint64_t)self);
  genericAdvisorys = self->_genericAdvisorys;

  return (id)[(NSMutableArray *)genericAdvisorys objectAtIndex:a3];
}

+ (Class)genericAdvisoryType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAdvisoriesInfo;
  id v4 = [(GEOAdvisoriesInfo *)&v8 description];
  id v5 = [(GEOAdvisoriesInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAdvisoriesInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 56) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v6 = *(id *)(a1 + 56);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v61 objects:v67 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v62 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v61 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v61 objects:v67 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"noticeAdvisory";
      }
      else {
        v13 = @"notice_advisory";
      }
      [v4 setObject:v5 forKey:v13];
    }
    v14 = [(id)a1 clickableAdvisory];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"clickableAdvisory";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"clickable_advisory";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = [(id)a1 tollAdvisory];
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"tollAdvisory";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"toll_advisory";
      }
      [v4 setObject:v20 forKey:v21];
    }
    v22 = [(id)a1 evAdvisory];
    v23 = v22;
    if (v22)
    {
      if (a2)
      {
        v24 = [v22 jsonRepresentation];
        v25 = @"evAdvisory";
      }
      else
      {
        v24 = [v22 dictionaryRepresentation];
        v25 = @"ev_advisory";
      }
      [v4 setObject:v24 forKey:v25];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v27 = *(id *)(a1 + 48);
      uint64_t v28 = [v27 countByEnumeratingWithState:&v57 objects:v66 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v58;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v58 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(void **)(*((void *)&v57 + 1) + 8 * j);
            if (a2) {
              [v32 jsonRepresentation];
            }
            else {
            v33 = [v32 dictionaryRepresentation];
            }
            [v26 addObject:v33];
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v57 objects:v66 count:16];
        }
        while (v29);
      }

      if (a2) {
        v34 = @"incidentAdvisory";
      }
      else {
        v34 = @"incident_advisory";
      }
      [v4 setObject:v26 forKey:v34];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v36 = *(id *)(a1 + 40);
      uint64_t v37 = [v36 countByEnumeratingWithState:&v53 objects:v65 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v54;
        do
        {
          for (uint64_t k = 0; k != v38; ++k)
          {
            if (*(void *)v54 != v39) {
              objc_enumerationMutation(v36);
            }
            v41 = *(void **)(*((void *)&v53 + 1) + 8 * k);
            if (a2) {
              [v41 jsonRepresentation];
            }
            else {
            v42 = [v41 dictionaryRepresentation];
            }
            [v35 addObject:v42];
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v53 objects:v65 count:16];
        }
        while (v38);
      }

      if (a2) {
        v43 = @"genericAdvisory";
      }
      else {
        v43 = @"generic_advisory";
      }
      [v4 setObject:v35 forKey:v43];
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
        v51[2] = __47__GEOAdvisoriesInfo__dictionaryRepresentation___block_invoke;
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
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAdvisoriesInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOAdvisoriesInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOAdvisoriesInfo)initWithDictionary:(id)a3
{
  return (GEOAdvisoriesInfo *)-[GEOAdvisoriesInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"noticeAdvisory";
      }
      else {
        id v6 = @"notice_advisory";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v55 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v64 objects:v70 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v65 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v64 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEOAdvisoryNotice alloc];
                if (a3) {
                  uint64_t v15 = [(GEOAdvisoryNotice *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOAdvisoryNotice *)v14 initWithDictionary:v13];
                }
                v16 = (void *)v15;
                [a1 addNoticeAdvisory:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v64 objects:v70 count:16];
          }
          while (v10);
        }

        id v5 = v55;
      }

      if (a3) {
        v17 = @"clickableAdvisory";
      }
      else {
        v17 = @"clickable_advisory";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [GEOClickableAdvisory alloc];
        if (a3) {
          uint64_t v20 = [(GEOClickableAdvisory *)v19 initWithJSON:v18];
        }
        else {
          uint64_t v20 = [(GEOClickableAdvisory *)v19 initWithDictionary:v18];
        }
        v21 = (void *)v20;
        [a1 setClickableAdvisory:v20];
      }
      if (a3) {
        v22 = @"tollAdvisory";
      }
      else {
        v22 = @"toll_advisory";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24 = [GEOAdvisoryNotice alloc];
        if (a3) {
          uint64_t v25 = [(GEOAdvisoryNotice *)v24 initWithJSON:v23];
        }
        else {
          uint64_t v25 = [(GEOAdvisoryNotice *)v24 initWithDictionary:v23];
        }
        v26 = (void *)v25;
        [a1 setTollAdvisory:v25];
      }
      if (a3) {
        id v27 = @"evAdvisory";
      }
      else {
        id v27 = @"ev_advisory";
      }
      uint64_t v28 = [v5 objectForKeyedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v29 = [GEOAdvisoryNotice alloc];
        if (a3) {
          uint64_t v30 = [(GEOAdvisoryNotice *)v29 initWithJSON:v28];
        }
        else {
          uint64_t v30 = [(GEOAdvisoryNotice *)v29 initWithDictionary:v28];
        }
        v31 = (void *)v30;
        [a1 setEvAdvisory:v30];
      }
      if (a3) {
        v32 = @"incidentAdvisory";
      }
      else {
        v32 = @"incident_advisory";
      }
      v33 = [v5 objectForKeyedSubscript:v32];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v34 = v33;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v60 objects:v69 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v61;
          do
          {
            for (uint64_t j = 0; j != v36; ++j)
            {
              if (*(void *)v61 != v37) {
                objc_enumerationMutation(v34);
              }
              uint64_t v39 = *(void *)(*((void *)&v60 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v40 = [GEOAdvisoryNotice alloc];
                if (a3) {
                  uint64_t v41 = [(GEOAdvisoryNotice *)v40 initWithJSON:v39];
                }
                else {
                  uint64_t v41 = [(GEOAdvisoryNotice *)v40 initWithDictionary:v39];
                }
                v42 = (void *)v41;
                [a1 addIncidentAdvisory:v41];
              }
            }
            uint64_t v36 = [v34 countByEnumeratingWithState:&v60 objects:v69 count:16];
          }
          while (v36);
        }

        id v5 = v55;
      }

      if (a3) {
        v43 = @"genericAdvisory";
      }
      else {
        v43 = @"generic_advisory";
      }
      v44 = [v5 objectForKeyedSubscript:v43];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v45 = v44;
        uint64_t v46 = [v45 countByEnumeratingWithState:&v56 objects:v68 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v57;
          do
          {
            for (uint64_t k = 0; k != v47; ++k)
            {
              if (*(void *)v57 != v48) {
                objc_enumerationMutation(v45);
              }
              uint64_t v50 = *(void *)(*((void *)&v56 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v51 = [GEOAdvisoryNotice alloc];
                if (a3) {
                  uint64_t v52 = [(GEOAdvisoryNotice *)v51 initWithJSON:v50];
                }
                else {
                  uint64_t v52 = [(GEOAdvisoryNotice *)v51 initWithDictionary:v50];
                }
                long long v53 = (void *)v52;
                [a1 addGenericAdvisory:v52];
              }
            }
            uint64_t v47 = [v45 countByEnumeratingWithState:&v56 objects:v68 count:16];
          }
          while (v47);
        }

        id v5 = v55;
      }
    }
  }

  return a1;
}

- (GEOAdvisoriesInfo)initWithJSON:(id)a3
{
  return (GEOAdvisoriesInfo *)-[GEOAdvisoriesInfo _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_184;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_185;
    }
    GEOAdvisoriesInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOAdvisoriesInfoCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAdvisoriesInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAdvisoriesInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAdvisoriesInfoIsDirty((uint64_t)self) & 1) == 0)
  {
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOAdvisoriesInfo *)self readAll:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = self->_noticeAdvisorys;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    if (self->_clickableAdvisory) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_tollAdvisory) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_evAdvisory) {
      PBDataWriterWriteSubmessage();
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v10 = self->_incidentAdvisorys;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v14 = self->_genericAdvisorys;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v15);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  -[GEOAdvisoriesInfo _readEvAdvisory]((uint64_t)self);
  if (![(GEOAdvisoryNotice *)self->_evAdvisory hasGreenTeaWithValue:v3])
  {
    -[GEOAdvisoriesInfo _readGenericAdvisorys]((uint64_t)self);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v5 = self->_genericAdvisorys;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v28;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v27 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      -[GEOAdvisoriesInfo _readIncidentAdvisorys]((uint64_t)self);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v5 = self->_incidentAdvisorys;
      uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v24;
LABEL_12:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v23 + 1) + 8 * v13) hasGreenTeaWithValue:v3]) {
            break;
          }
          if (v11 == ++v13)
          {
            uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v32 count:16];
            if (v11) {
              goto LABEL_12;
            }
            goto LABEL_18;
          }
        }
      }
      else
      {
LABEL_18:

        -[GEOAdvisoriesInfo _readNoticeAdvisorys]((uint64_t)self);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v5 = self->_noticeAdvisorys;
        uint64_t v14 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v31 count:16];
        if (!v14)
        {
LABEL_26:

          -[GEOAdvisoriesInfo _readTollAdvisory]((uint64_t)self);
          return [(GEOAdvisoryNotice *)self->_tollAdvisory hasGreenTeaWithValue:v3];
        }
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v20;
LABEL_20:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v17), "hasGreenTeaWithValue:", v3, (void)v19)) {
            break;
          }
          if (v15 == ++v17)
          {
            uint64_t v15 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v31 count:16];
            if (v15) {
              goto LABEL_20;
            }
            goto LABEL_26;
          }
        }
      }
    }
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  uint64_t v16 = (id *)a3;
  [(GEOAdvisoriesInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 18) = self->_readerMarkPos;
  *((_DWORD *)v16 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOAdvisoriesInfo *)self noticeAdvisorysCount])
  {
    [v16 clearNoticeAdvisorys];
    unint64_t v4 = [(GEOAdvisoriesInfo *)self noticeAdvisorysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOAdvisoriesInfo *)self noticeAdvisoryAtIndex:i];
        [v16 addNoticeAdvisory:v7];
      }
    }
  }
  if (self->_clickableAdvisory) {
    objc_msgSend(v16, "setClickableAdvisory:");
  }
  if (self->_tollAdvisory) {
    objc_msgSend(v16, "setTollAdvisory:");
  }
  if (self->_evAdvisory) {
    objc_msgSend(v16, "setEvAdvisory:");
  }
  if ([(GEOAdvisoriesInfo *)self incidentAdvisorysCount])
  {
    [v16 clearIncidentAdvisorys];
    unint64_t v8 = [(GEOAdvisoriesInfo *)self incidentAdvisorysCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOAdvisoriesInfo *)self incidentAdvisoryAtIndex:j];
        [v16 addIncidentAdvisory:v11];
      }
    }
  }
  if ([(GEOAdvisoriesInfo *)self genericAdvisorysCount])
  {
    [v16 clearGenericAdvisorys];
    unint64_t v12 = [(GEOAdvisoriesInfo *)self genericAdvisorysCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOAdvisoriesInfo *)self genericAdvisoryAtIndex:k];
        [v16 addGenericAdvisory:v15];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOAdvisoriesInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOAdvisoriesInfo *)self readAll:0];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  unint64_t v8 = self->_noticeAdvisorys;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v39;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v38 + 1) + 8 * v11) copyWithZone:a3];
        [(id)v5 addNoticeAdvisory:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v9);
  }

  id v13 = [(GEOClickableAdvisory *)self->_clickableAdvisory copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  id v15 = [(GEOAdvisoryNotice *)self->_tollAdvisory copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v15;

  id v17 = [(GEOAdvisoryNotice *)self->_evAdvisory copyWithZone:a3];
  v18 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v17;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v19 = self->_incidentAdvisorys;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v35;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * v22) copyWithZone:a3];
        [(id)v5 addIncidentAdvisory:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v20);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v24 = self->_genericAdvisorys;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v31;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v24);
        }
        long long v28 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v27), "copyWithZone:", a3, (void)v30);
        [(id)v5 addGenericAdvisory:v28];

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v25);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOAdvisoriesInfo *)self readAll:1],
         [v4 readAll:1],
         noticeAdvisorys = self->_noticeAdvisorys,
         !((unint64_t)noticeAdvisorys | v4[7]))
     || -[NSMutableArray isEqual:](noticeAdvisorys, "isEqual:"))
    && ((clickableAdvisory = self->_clickableAdvisory, !((unint64_t)clickableAdvisory | v4[3]))
     || -[GEOClickableAdvisory isEqual:](clickableAdvisory, "isEqual:"))
    && ((tollAdvisory = self->_tollAdvisory, !((unint64_t)tollAdvisory | v4[8]))
     || -[GEOAdvisoryNotice isEqual:](tollAdvisory, "isEqual:"))
    && ((evAdvisory = self->_evAdvisory, !((unint64_t)evAdvisory | v4[4]))
     || -[GEOAdvisoryNotice isEqual:](evAdvisory, "isEqual:"))
    && ((incidentAdvisorys = self->_incidentAdvisorys, !((unint64_t)incidentAdvisorys | v4[6]))
     || -[NSMutableArray isEqual:](incidentAdvisorys, "isEqual:")))
  {
    genericAdvisorys = self->_genericAdvisorys;
    if ((unint64_t)genericAdvisorys | v4[5]) {
      char v11 = -[NSMutableArray isEqual:](genericAdvisorys, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  [(GEOAdvisoriesInfo *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_noticeAdvisorys hash];
  unint64_t v4 = [(GEOClickableAdvisory *)self->_clickableAdvisory hash] ^ v3;
  unint64_t v5 = [(GEOAdvisoryNotice *)self->_tollAdvisory hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOAdvisoryNotice *)self->_evAdvisory hash];
  uint64_t v7 = [(NSMutableArray *)self->_incidentAdvisorys hash];
  return v6 ^ v7 ^ [(NSMutableArray *)self->_genericAdvisorys hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = v4[7];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOAdvisoriesInfo *)self addNoticeAdvisory:*(void *)(*((void *)&v34 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v7);
  }

  clickableAdvisory = self->_clickableAdvisory;
  id v11 = v4[3];
  if (clickableAdvisory)
  {
    if (v11) {
      -[GEOClickableAdvisory mergeFrom:](clickableAdvisory, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOAdvisoriesInfo setClickableAdvisory:](self, "setClickableAdvisory:");
  }
  tollAdvisory = self->_tollAdvisory;
  id v13 = v4[8];
  if (tollAdvisory)
  {
    if (v13) {
      -[GEOAdvisoryNotice mergeFrom:](tollAdvisory, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEOAdvisoriesInfo setTollAdvisory:](self, "setTollAdvisory:");
  }
  evAdvisory = self->_evAdvisory;
  id v15 = v4[4];
  if (evAdvisory)
  {
    if (v15) {
      -[GEOAdvisoryNotice mergeFrom:](evAdvisory, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEOAdvisoriesInfo setEvAdvisory:](self, "setEvAdvisory:");
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = v4[6];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        [(GEOAdvisoriesInfo *)self addIncidentAdvisory:*(void *)(*((void *)&v30 + 1) + 8 * j)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v18);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v21 = v4[5];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        -[GEOAdvisoriesInfo addGenericAdvisory:](self, "addGenericAdvisory:", *(void *)(*((void *)&v26 + 1) + 8 * k), (void)v26);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v23);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOAdvisoriesInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_189);
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
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x81u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOAdvisoriesInfo *)self readAll:0];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v7 = self->_noticeAdvisorys;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v9);
    }

    [(GEOClickableAdvisory *)self->_clickableAdvisory clearUnknownFields:1];
    [(GEOAdvisoryNotice *)self->_tollAdvisory clearUnknownFields:1];
    [(GEOAdvisoryNotice *)self->_evAdvisory clearUnknownFields:1];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    unint64_t v12 = self->_incidentAdvisorys;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v14);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v17 = self->_genericAdvisorys;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v23;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v21++), "clearUnknownFields:", 1, (void)v22);
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v19);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tollAdvisory, 0);
  objc_storeStrong((id *)&self->_noticeAdvisorys, 0);
  objc_storeStrong((id *)&self->_incidentAdvisorys, 0);
  objc_storeStrong((id *)&self->_genericAdvisorys, 0);
  objc_storeStrong((id *)&self->_evAdvisory, 0);
  objc_storeStrong((id *)&self->_clickableAdvisory, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end