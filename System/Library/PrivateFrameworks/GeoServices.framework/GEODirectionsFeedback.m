@interface GEODirectionsFeedback
+ (BOOL)isValid:(id)a3;
+ (Class)alightNotificationFeedbackType;
+ (Class)guidanceFeedbackType;
+ (Class)modalityType;
+ (Class)stepFeedbackType;
+ (Class)trafficRerouteFeedbackType;
- (BOOL)hasDirectionResponseID;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsCarplayConnected;
- (BOOL)isCarplayConnected;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEODirectionsFeedback)init;
- (GEODirectionsFeedback)initWithData:(id)a3;
- (GEODirectionsFeedback)initWithDictionary:(id)a3;
- (GEODirectionsFeedback)initWithJSON:(id)a3;
- (NSData)directionResponseID;
- (NSMutableArray)alightNotificationFeedbacks;
- (NSMutableArray)guidanceFeedbacks;
- (NSMutableArray)modalitys;
- (NSMutableArray)stepFeedbacks;
- (NSMutableArray)trafficRerouteFeedbacks;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)alightNotificationFeedbackAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)guidanceFeedbackAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)modalityAtIndex:(unint64_t)a3;
- (id)stepFeedbackAtIndex:(unint64_t)a3;
- (id)trafficRerouteFeedbackAtIndex:(unint64_t)a3;
- (unint64_t)alightNotificationFeedbacksCount;
- (unint64_t)guidanceFeedbacksCount;
- (unint64_t)hash;
- (unint64_t)modalitysCount;
- (unint64_t)stepFeedbacksCount;
- (unint64_t)trafficRerouteFeedbacksCount;
- (void)_addNoFlagsAlightNotificationFeedback:(uint64_t)a1;
- (void)_addNoFlagsGuidanceFeedback:(uint64_t)a1;
- (void)_addNoFlagsModality:(uint64_t)a1;
- (void)_addNoFlagsStepFeedback:(uint64_t)a1;
- (void)_addNoFlagsTrafficRerouteFeedback:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAlightNotificationFeedbacks;
- (void)_readDirectionResponseID;
- (void)_readGuidanceFeedbacks;
- (void)_readModalitys;
- (void)_readStepFeedbacks;
- (void)_readTrafficRerouteFeedbacks;
- (void)addAlightNotificationFeedback:(id)a3;
- (void)addGuidanceFeedback:(id)a3;
- (void)addModality:(id)a3;
- (void)addStepFeedback:(id)a3;
- (void)addTrafficRerouteFeedback:(id)a3;
- (void)clearAlightNotificationFeedbacks;
- (void)clearGuidanceFeedbacks;
- (void)clearModalitys;
- (void)clearStepFeedbacks;
- (void)clearTrafficRerouteFeedbacks;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAlightNotificationFeedbacks:(id)a3;
- (void)setDirectionResponseID:(id)a3;
- (void)setGuidanceFeedbacks:(id)a3;
- (void)setHasIsCarplayConnected:(BOOL)a3;
- (void)setIsCarplayConnected:(BOOL)a3;
- (void)setModalitys:(id)a3;
- (void)setStepFeedbacks:(id)a3;
- (void)setTrafficRerouteFeedbacks:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEODirectionsFeedback

- (void)clearTrafficRerouteFeedbacks
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  trafficRerouteFeedbacks = self->_trafficRerouteFeedbacks;

  [(NSMutableArray *)trafficRerouteFeedbacks removeAllObjects];
}

- (void)writeTo:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 1u))
  {
    v26 = self->_reader;
    objc_sync_enter(v26);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v27 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v27];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v26);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEODirectionsFeedback *)self readAll:0];
    if (self->_directionResponseID) {
      PBDataWriterWriteDataField();
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v6 = self->_stepFeedbacks;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v45;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v45 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v7);
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v10 = self->_trafficRerouteFeedbacks;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v40 objects:v51 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v41;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v40 objects:v51 count:16];
      }
      while (v11);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v14 = self->_alightNotificationFeedbacks;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v36 objects:v50 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v37;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v36 objects:v50 count:16];
      }
      while (v15);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v18 = self->_guidanceFeedbacks;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v32 objects:v49 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v33;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteSubmessage();
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v32 objects:v49 count:16];
      }
      while (v19);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v22 = self->_modalitys;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v28 objects:v48 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v29;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v22);
          }
          PBDataWriterWriteSubmessage();
          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v28 objects:v48 count:16];
      }
      while (v23);
    }

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
  }
}

- (void)addGuidanceFeedback:(id)a3
{
  id v4 = a3;
  -[GEODirectionsFeedback _readGuidanceFeedbacks]((uint64_t)self);
  -[GEODirectionsFeedback _addNoFlagsGuidanceFeedback:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"directionResponseID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
        [a1 setDirectionResponseID:v7];
      }
      uint64_t v8 = [v5 objectForKeyedSubscript:@"stepFeedback"];
      objc_opt_class();
      id v62 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v79 objects:v87 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v80;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v80 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v79 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v15 = [GEOStepFeedback alloc];
                if (a3) {
                  uint64_t v16 = [(GEOStepFeedback *)v15 initWithJSON:v14];
                }
                else {
                  uint64_t v16 = [(GEOStepFeedback *)v15 initWithDictionary:v14];
                }
                uint64_t v17 = (void *)v16;
                [a1 addStepFeedback:v16];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v79 objects:v87 count:16];
          }
          while (v11);
        }

        id v5 = v62;
      }

      v18 = [v5 objectForKeyedSubscript:@"trafficRerouteFeedback"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v75 objects:v86 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v76;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v76 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v75 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v25 = [GEOTrafficRerouteFeedback alloc];
                if (a3) {
                  uint64_t v26 = [(GEOTrafficRerouteFeedback *)v25 initWithJSON:v24];
                }
                else {
                  uint64_t v26 = [(GEOTrafficRerouteFeedback *)v25 initWithDictionary:v24];
                }
                v27 = (void *)v26;
                [a1 addTrafficRerouteFeedback:v26];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v75 objects:v86 count:16];
          }
          while (v21);
        }

        id v5 = v62;
      }

      long long v28 = [v5 objectForKeyedSubscript:@"alightNotificationFeedback"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v29 = v28;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v71 objects:v85 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v72;
          do
          {
            for (uint64_t k = 0; k != v31; ++k)
            {
              if (*(void *)v72 != v32) {
                objc_enumerationMutation(v29);
              }
              uint64_t v34 = *(void *)(*((void *)&v71 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v35 = [GEOAlightNotificationFeedback alloc];
                if (a3) {
                  uint64_t v36 = [(GEOAlightNotificationFeedback *)v35 initWithJSON:v34];
                }
                else {
                  uint64_t v36 = [(GEOAlightNotificationFeedback *)v35 initWithDictionary:v34];
                }
                long long v37 = (void *)v36;
                [a1 addAlightNotificationFeedback:v36];
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v71 objects:v85 count:16];
          }
          while (v31);
        }

        id v5 = v62;
      }

      if (a3) {
        long long v38 = @"guidanceFeedback";
      }
      else {
        long long v38 = @"guidance_feedback";
      }
      long long v39 = [v5 objectForKeyedSubscript:v38];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v40 = v39;
        uint64_t v41 = [v40 countByEnumeratingWithState:&v67 objects:v84 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v68;
          do
          {
            for (uint64_t m = 0; m != v42; ++m)
            {
              if (*(void *)v68 != v43) {
                objc_enumerationMutation(v40);
              }
              uint64_t v45 = *(void *)(*((void *)&v67 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v46 = [GEOGuidanceEventFeedback alloc];
                if (a3) {
                  uint64_t v47 = [(GEOGuidanceEventFeedback *)v46 initWithJSON:v45];
                }
                else {
                  uint64_t v47 = [(GEOGuidanceEventFeedback *)v46 initWithDictionary:v45];
                }
                v48 = (void *)v47;
                [a1 addGuidanceFeedback:v47];
              }
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v67 objects:v84 count:16];
          }
          while (v42);
        }

        id v5 = v62;
      }

      v49 = [v5 objectForKeyedSubscript:@"modality"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v50 = v49;
        uint64_t v51 = [v50 countByEnumeratingWithState:&v63 objects:v83 count:16];
        if (v51)
        {
          uint64_t v52 = v51;
          uint64_t v53 = *(void *)v64;
          do
          {
            for (uint64_t n = 0; n != v52; ++n)
            {
              if (*(void *)v64 != v53) {
                objc_enumerationMutation(v50);
              }
              uint64_t v55 = *(void *)(*((void *)&v63 + 1) + 8 * n);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v56 = [GEOModality alloc];
                if (a3) {
                  uint64_t v57 = [(GEOModality *)v56 initWithJSON:v55];
                }
                else {
                  uint64_t v57 = [(GEOModality *)v56 initWithDictionary:v55];
                }
                v58 = (void *)v57;
                [a1 addModality:v57];
              }
            }
            uint64_t v52 = [v50 countByEnumeratingWithState:&v63 objects:v83 count:16];
          }
          while (v52);
        }

        id v5 = v62;
      }

      if (a3) {
        v59 = @"isCarplayConnected";
      }
      else {
        v59 = @"is_carplay_connected";
      }
      v60 = [v5 objectForKeyedSubscript:v59];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsCarplayConnected:", objc_msgSend(v60, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (void)setModalitys:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  modalitys = self->_modalitys;
  self->_modalitys = v4;
}

- (GEODirectionsFeedback)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEODirectionsFeedback;
  v2 = [(GEODirectionsFeedback *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEODirectionsFeedback)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEODirectionsFeedback;
  v3 = [(GEODirectionsFeedback *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readDirectionResponseID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionResponseID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasDirectionResponseID
{
  return self->_directionResponseID != 0;
}

- (NSData)directionResponseID
{
  -[GEODirectionsFeedback _readDirectionResponseID]((uint64_t)self);
  directionResponseID = self->_directionResponseID;

  return directionResponseID;
}

- (void)setDirectionResponseID:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_directionResponseID, a3);
}

- (void)_readStepFeedbacks
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStepFeedbacks_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)stepFeedbacks
{
  -[GEODirectionsFeedback _readStepFeedbacks]((uint64_t)self);
  stepFeedbacks = self->_stepFeedbacks;

  return stepFeedbacks;
}

- (void)setStepFeedbacks:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  stepFeedbacks = self->_stepFeedbacks;
  self->_stepFeedbacks = v4;
}

- (void)clearStepFeedbacks
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  stepFeedbacks = self->_stepFeedbacks;

  [(NSMutableArray *)stepFeedbacks removeAllObjects];
}

- (void)addStepFeedback:(id)a3
{
  id v4 = a3;
  -[GEODirectionsFeedback _readStepFeedbacks]((uint64_t)self);
  -[GEODirectionsFeedback _addNoFlagsStepFeedback:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsStepFeedback:(uint64_t)a1
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

- (unint64_t)stepFeedbacksCount
{
  -[GEODirectionsFeedback _readStepFeedbacks]((uint64_t)self);
  stepFeedbacks = self->_stepFeedbacks;

  return [(NSMutableArray *)stepFeedbacks count];
}

- (id)stepFeedbackAtIndex:(unint64_t)a3
{
  -[GEODirectionsFeedback _readStepFeedbacks]((uint64_t)self);
  stepFeedbacks = self->_stepFeedbacks;

  return (id)[(NSMutableArray *)stepFeedbacks objectAtIndex:a3];
}

+ (Class)stepFeedbackType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficRerouteFeedbacks
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficRerouteFeedbacks_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)trafficRerouteFeedbacks
{
  -[GEODirectionsFeedback _readTrafficRerouteFeedbacks]((uint64_t)self);
  trafficRerouteFeedbacks = self->_trafficRerouteFeedbacks;

  return trafficRerouteFeedbacks;
}

- (void)setTrafficRerouteFeedbacks:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  trafficRerouteFeedbacks = self->_trafficRerouteFeedbacks;
  self->_trafficRerouteFeedbacks = v4;
}

- (void)addTrafficRerouteFeedback:(id)a3
{
  id v4 = a3;
  -[GEODirectionsFeedback _readTrafficRerouteFeedbacks]((uint64_t)self);
  -[GEODirectionsFeedback _addNoFlagsTrafficRerouteFeedback:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsTrafficRerouteFeedback:(uint64_t)a1
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

- (unint64_t)trafficRerouteFeedbacksCount
{
  -[GEODirectionsFeedback _readTrafficRerouteFeedbacks]((uint64_t)self);
  trafficRerouteFeedbacks = self->_trafficRerouteFeedbacks;

  return [(NSMutableArray *)trafficRerouteFeedbacks count];
}

- (id)trafficRerouteFeedbackAtIndex:(unint64_t)a3
{
  -[GEODirectionsFeedback _readTrafficRerouteFeedbacks]((uint64_t)self);
  trafficRerouteFeedbacks = self->_trafficRerouteFeedbacks;

  return (id)[(NSMutableArray *)trafficRerouteFeedbacks objectAtIndex:a3];
}

+ (Class)trafficRerouteFeedbackType
{
  return (Class)objc_opt_class();
}

- (void)_readAlightNotificationFeedbacks
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAlightNotificationFeedbacks_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)alightNotificationFeedbacks
{
  -[GEODirectionsFeedback _readAlightNotificationFeedbacks]((uint64_t)self);
  alightNotificationFeedbacks = self->_alightNotificationFeedbacks;

  return alightNotificationFeedbacks;
}

- (void)setAlightNotificationFeedbacks:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  alightNotificationFeedbacks = self->_alightNotificationFeedbacks;
  self->_alightNotificationFeedbacks = v4;
}

- (void)clearAlightNotificationFeedbacks
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  alightNotificationFeedbacks = self->_alightNotificationFeedbacks;

  [(NSMutableArray *)alightNotificationFeedbacks removeAllObjects];
}

- (void)addAlightNotificationFeedback:(id)a3
{
  id v4 = a3;
  -[GEODirectionsFeedback _readAlightNotificationFeedbacks]((uint64_t)self);
  -[GEODirectionsFeedback _addNoFlagsAlightNotificationFeedback:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsAlightNotificationFeedback:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)alightNotificationFeedbacksCount
{
  -[GEODirectionsFeedback _readAlightNotificationFeedbacks]((uint64_t)self);
  alightNotificationFeedbacks = self->_alightNotificationFeedbacks;

  return [(NSMutableArray *)alightNotificationFeedbacks count];
}

- (id)alightNotificationFeedbackAtIndex:(unint64_t)a3
{
  -[GEODirectionsFeedback _readAlightNotificationFeedbacks]((uint64_t)self);
  alightNotificationFeedbacks = self->_alightNotificationFeedbacks;

  return (id)[(NSMutableArray *)alightNotificationFeedbacks objectAtIndex:a3];
}

+ (Class)alightNotificationFeedbackType
{
  return (Class)objc_opt_class();
}

- (void)_readGuidanceFeedbacks
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGuidanceFeedbacks_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)guidanceFeedbacks
{
  -[GEODirectionsFeedback _readGuidanceFeedbacks]((uint64_t)self);
  guidanceFeedbacks = self->_guidanceFeedbacks;

  return guidanceFeedbacks;
}

- (void)setGuidanceFeedbacks:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  guidanceFeedbacks = self->_guidanceFeedbacks;
  self->_guidanceFeedbacks = v4;
}

- (void)clearGuidanceFeedbacks
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  guidanceFeedbacks = self->_guidanceFeedbacks;

  [(NSMutableArray *)guidanceFeedbacks removeAllObjects];
}

- (void)_addNoFlagsGuidanceFeedback:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)guidanceFeedbacksCount
{
  -[GEODirectionsFeedback _readGuidanceFeedbacks]((uint64_t)self);
  guidanceFeedbacks = self->_guidanceFeedbacks;

  return [(NSMutableArray *)guidanceFeedbacks count];
}

- (id)guidanceFeedbackAtIndex:(unint64_t)a3
{
  -[GEODirectionsFeedback _readGuidanceFeedbacks]((uint64_t)self);
  guidanceFeedbacks = self->_guidanceFeedbacks;

  return (id)[(NSMutableArray *)guidanceFeedbacks objectAtIndex:a3];
}

+ (Class)guidanceFeedbackType
{
  return (Class)objc_opt_class();
}

- (void)_readModalitys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModalitys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)modalitys
{
  -[GEODirectionsFeedback _readModalitys]((uint64_t)self);
  modalitys = self->_modalitys;

  return modalitys;
}

- (void)clearModalitys
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  modalitys = self->_modalitys;

  [(NSMutableArray *)modalitys removeAllObjects];
}

- (void)addModality:(id)a3
{
  id v4 = a3;
  -[GEODirectionsFeedback _readModalitys]((uint64_t)self);
  -[GEODirectionsFeedback _addNoFlagsModality:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsModality:(uint64_t)a1
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

- (unint64_t)modalitysCount
{
  -[GEODirectionsFeedback _readModalitys]((uint64_t)self);
  modalitys = self->_modalitys;

  return [(NSMutableArray *)modalitys count];
}

- (id)modalityAtIndex:(unint64_t)a3
{
  -[GEODirectionsFeedback _readModalitys]((uint64_t)self);
  modalitys = self->_modalitys;

  return (id)[(NSMutableArray *)modalitys objectAtIndex:a3];
}

+ (Class)modalityType
{
  return (Class)objc_opt_class();
}

- (BOOL)isCarplayConnected
{
  return self->_isCarplayConnected;
}

- (void)setIsCarplayConnected:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_isCarplayConnected = a3;
}

- (void)setHasIsCarplayConnected:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasIsCarplayConnected
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEODirectionsFeedback;
  id v4 = [(GEODirectionsFeedback *)&v8 description];
  id v5 = [(GEODirectionsFeedback *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODirectionsFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 directionResponseID];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"directionResponseID"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"directionResponseID"];
      }
    }

    if ([*(id *)(a1 + 48) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v9 = *(id *)(a1 + 48);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v68 objects:v76 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v69 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v68 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            uint64_t v15 = [v14 dictionaryRepresentation];
            }
            [v8 addObject:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v68 objects:v76 count:16];
        }
        while (v11);
      }

      [v4 setObject:v8 forKey:@"stepFeedback"];
    }
    if ([*(id *)(a1 + 56) count])
    {
      uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v17 = *(id *)(a1 + 56);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v64 objects:v75 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v65;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v65 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void **)(*((void *)&v64 + 1) + 8 * j);
            if (a2) {
              [v22 jsonRepresentation];
            }
            else {
            uint64_t v23 = [v22 dictionaryRepresentation];
            }
            [v16 addObject:v23];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v64 objects:v75 count:16];
        }
        while (v19);
      }

      [v4 setObject:v16 forKey:@"trafficRerouteFeedback"];
    }
    if ([*(id *)(a1 + 16) count])
    {
      uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v25 = *(id *)(a1 + 16);
      uint64_t v26 = [v25 countByEnumeratingWithState:&v60 objects:v74 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v61;
        do
        {
          for (uint64_t k = 0; k != v27; ++k)
          {
            if (*(void *)v61 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void **)(*((void *)&v60 + 1) + 8 * k);
            if (a2) {
              [v30 jsonRepresentation];
            }
            else {
            uint64_t v31 = [v30 dictionaryRepresentation];
            }
            [v24 addObject:v31];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v60 objects:v74 count:16];
        }
        while (v27);
      }

      [v4 setObject:v24 forKey:@"alightNotificationFeedback"];
    }
    if ([*(id *)(a1 + 32) count])
    {
      uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v33 = *(id *)(a1 + 32);
      uint64_t v34 = [v33 countByEnumeratingWithState:&v56 objects:v73 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v57;
        do
        {
          for (uint64_t m = 0; m != v35; ++m)
          {
            if (*(void *)v57 != v36) {
              objc_enumerationMutation(v33);
            }
            long long v38 = *(void **)(*((void *)&v56 + 1) + 8 * m);
            if (a2) {
              [v38 jsonRepresentation];
            }
            else {
            long long v39 = [v38 dictionaryRepresentation];
            }
            [v32 addObject:v39];
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v56 objects:v73 count:16];
        }
        while (v35);
      }

      if (a2) {
        id v40 = @"guidanceFeedback";
      }
      else {
        id v40 = @"guidance_feedback";
      }
      [v4 setObject:v32 forKey:v40];
    }
    if ([*(id *)(a1 + 40) count])
    {
      uint64_t v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v42 = *(id *)(a1 + 40);
      uint64_t v43 = [v42 countByEnumeratingWithState:&v52 objects:v72 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v53;
        do
        {
          for (uint64_t n = 0; n != v44; ++n)
          {
            if (*(void *)v53 != v45) {
              objc_enumerationMutation(v42);
            }
            uint64_t v47 = *(void **)(*((void *)&v52 + 1) + 8 * n);
            if (a2) {
              [v47 jsonRepresentation];
            }
            else {
            v48 = objc_msgSend(v47, "dictionaryRepresentation", (void)v52);
            }
            objc_msgSend(v41, "addObject:", v48, (void)v52);
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v52 objects:v72 count:16];
        }
        while (v44);
      }

      [v4 setObject:v41 forKey:@"modality"];
    }
    if (*(unsigned char *)(a1 + 80))
    {
      v49 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 76)];
      if (a2) {
        id v50 = @"isCarplayConnected";
      }
      else {
        id v50 = @"is_carplay_connected";
      }
      objc_msgSend(v4, "setObject:forKey:", v49, v50, (void)v52);
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
  return -[GEODirectionsFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEODirectionsFeedback)initWithDictionary:(id)a3
{
  return (GEODirectionsFeedback *)-[GEODirectionsFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEODirectionsFeedback)initWithJSON:(id)a3
{
  return (GEODirectionsFeedback *)-[GEODirectionsFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_38;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_38;
    }
    GEODirectionsFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEODirectionsFeedbackCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEODirectionsFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEODirectionsFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEODirectionsFeedback _readTrafficRerouteFeedbacks]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_trafficRerouteFeedbacks;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  uint64_t v24 = (id *)a3;
  [(GEODirectionsFeedback *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v24 + 1, self->_reader);
  *((_DWORD *)v24 + 16) = self->_readerMarkPos;
  *((_DWORD *)v24 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_directionResponseID) {
    objc_msgSend(v24, "setDirectionResponseID:");
  }
  if ([(GEODirectionsFeedback *)self stepFeedbacksCount])
  {
    [v24 clearStepFeedbacks];
    unint64_t v4 = [(GEODirectionsFeedback *)self stepFeedbacksCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEODirectionsFeedback *)self stepFeedbackAtIndex:i];
        [v24 addStepFeedback:v7];
      }
    }
  }
  if ([(GEODirectionsFeedback *)self trafficRerouteFeedbacksCount])
  {
    [v24 clearTrafficRerouteFeedbacks];
    unint64_t v8 = [(GEODirectionsFeedback *)self trafficRerouteFeedbacksCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEODirectionsFeedback *)self trafficRerouteFeedbackAtIndex:j];
        [v24 addTrafficRerouteFeedback:v11];
      }
    }
  }
  if ([(GEODirectionsFeedback *)self alightNotificationFeedbacksCount])
  {
    [v24 clearAlightNotificationFeedbacks];
    unint64_t v12 = [(GEODirectionsFeedback *)self alightNotificationFeedbacksCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        long long v15 = [(GEODirectionsFeedback *)self alightNotificationFeedbackAtIndex:k];
        [v24 addAlightNotificationFeedback:v15];
      }
    }
  }
  if ([(GEODirectionsFeedback *)self guidanceFeedbacksCount])
  {
    [v24 clearGuidanceFeedbacks];
    unint64_t v16 = [(GEODirectionsFeedback *)self guidanceFeedbacksCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(GEODirectionsFeedback *)self guidanceFeedbackAtIndex:m];
        [v24 addGuidanceFeedback:v19];
      }
    }
  }
  if ([(GEODirectionsFeedback *)self modalitysCount])
  {
    [v24 clearModalitys];
    unint64_t v20 = [(GEODirectionsFeedback *)self modalitysCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        uint64_t v23 = [(GEODirectionsFeedback *)self modalityAtIndex:n];
        [v24 addModality:v23];
      }
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((unsigned char *)v24 + 76) = self->_isCarplayConnected;
    *((unsigned char *)v24 + 80) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
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
      GEODirectionsFeedbackReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEODirectionsFeedback *)self readAll:0];
  uint64_t v9 = [(NSData *)self->_directionResponseID copyWithZone:a3];
  BOOL v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v11 = self->_stepFeedbacks;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v54 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = (void *)[*(id *)(*((void *)&v53 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addStepFeedback:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v12);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  unint64_t v16 = self->_trafficRerouteFeedbacks;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v50 != v18) {
          objc_enumerationMutation(v16);
        }
        unint64_t v20 = (void *)[*(id *)(*((void *)&v49 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addTrafficRerouteFeedback:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v17);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  unint64_t v21 = self->_alightNotificationFeedbacks;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v45 objects:v59 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v46 != v23) {
          objc_enumerationMutation(v21);
        }
        id v25 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addAlightNotificationFeedback:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v45 objects:v59 count:16];
    }
    while (v22);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v26 = self->_guidanceFeedbacks;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v41 objects:v58 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v42;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addGuidanceFeedback:v30];
      }
      uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v41 objects:v58 count:16];
    }
    while (v27);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v31 = self->_modalitys;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v37 objects:v57 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v38;
    do
    {
      for (uint64_t n = 0; n != v32; ++n)
      {
        if (*(void *)v38 != v33) {
          objc_enumerationMutation(v31);
        }
        uint64_t v35 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * n), "copyWithZone:", a3, (void)v37);
        [(id)v5 addModality:v35];
      }
      uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v37 objects:v57 count:16];
    }
    while (v32);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 76) = self->_isCarplayConnected;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEODirectionsFeedback *)self readAll:1];
  [v4 readAll:1];
  directionResponseID = self->_directionResponseID;
  if ((unint64_t)directionResponseID | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](directionResponseID, "isEqual:")) {
      goto LABEL_16;
    }
  }
  stepFeedbacks = self->_stepFeedbacks;
  if ((unint64_t)stepFeedbacks | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](stepFeedbacks, "isEqual:")) {
      goto LABEL_16;
    }
  }
  trafficRerouteFeedbacks = self->_trafficRerouteFeedbacks;
  if ((unint64_t)trafficRerouteFeedbacks | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](trafficRerouteFeedbacks, "isEqual:")) {
      goto LABEL_16;
    }
  }
  alightNotificationFeedbacks = self->_alightNotificationFeedbacks;
  if ((unint64_t)alightNotificationFeedbacks | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](alightNotificationFeedbacks, "isEqual:")) {
      goto LABEL_16;
    }
  }
  guidanceFeedbacks = self->_guidanceFeedbacks;
  if ((unint64_t)guidanceFeedbacks | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](guidanceFeedbacks, "isEqual:")) {
      goto LABEL_16;
    }
  }
  modalitys = self->_modalitys;
  if ((unint64_t)modalitys | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](modalitys, "isEqual:")) {
      goto LABEL_16;
    }
  }
  BOOL v11 = (*((unsigned char *)v4 + 80) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0)
    {
LABEL_16:
      BOOL v11 = 0;
      goto LABEL_17;
    }
    if (self->_isCarplayConnected)
    {
      if (!*((unsigned char *)v4 + 76)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)v4 + 76))
    {
      goto LABEL_16;
    }
    BOOL v11 = 1;
  }
LABEL_17:

  return v11;
}

- (unint64_t)hash
{
  [(GEODirectionsFeedback *)self readAll:1];
  uint64_t v3 = [(NSData *)self->_directionResponseID hash];
  uint64_t v4 = [(NSMutableArray *)self->_stepFeedbacks hash];
  uint64_t v5 = [(NSMutableArray *)self->_trafficRerouteFeedbacks hash];
  uint64_t v6 = [(NSMutableArray *)self->_alightNotificationFeedbacks hash];
  uint64_t v7 = [(NSMutableArray *)self->_guidanceFeedbacks hash];
  uint64_t v8 = [(NSMutableArray *)self->_modalitys hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v9 = 2654435761 * self->_isCarplayConnected;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 3)) {
    -[GEODirectionsFeedback setDirectionResponseID:](self, "setDirectionResponseID:");
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v5 = *((id *)v4 + 6);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEODirectionsFeedback *)self addStepFeedback:*(void *)(*((void *)&v46 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = *((id *)v4 + 7);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEODirectionsFeedback *)self addTrafficRerouteFeedback:*(void *)(*((void *)&v42 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v12);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v15 = *((id *)v4 + 2);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        [(GEODirectionsFeedback *)self addAlightNotificationFeedback:*(void *)(*((void *)&v38 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v17);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v20 = *((id *)v4 + 4);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        [(GEODirectionsFeedback *)self addGuidanceFeedback:*(void *)(*((void *)&v34 + 1) + 8 * m)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
    }
    while (v22);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v25 = *((id *)v4 + 5);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      for (uint64_t n = 0; n != v27; ++n)
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        -[GEODirectionsFeedback addModality:](self, "addModality:", *(void *)(*((void *)&v30 + 1) + 8 * n), (void)v30);
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
    }
    while (v27);
  }

  if (*((unsigned char *)v4 + 80))
  {
    self->_isCarplayConnected = *((unsigned char *)v4 + 76);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficRerouteFeedbacks, 0);
  objc_storeStrong((id *)&self->_stepFeedbacks, 0);
  objc_storeStrong((id *)&self->_modalitys, 0);
  objc_storeStrong((id *)&self->_guidanceFeedbacks, 0);
  objc_storeStrong((id *)&self->_directionResponseID, 0);
  objc_storeStrong((id *)&self->_alightNotificationFeedbacks, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end