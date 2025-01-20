@interface GEORPFeedbackResult
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIdLookupResult;
- (BOOL)hasImageUploadResult;
- (BOOL)hasLayoutConfigResult;
- (BOOL)hasLogEventResult;
- (BOOL)hasQueryResult;
- (BOOL)hasSubmissionResult;
- (BOOL)hasTdmFraudNotificationResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackIdLookupResult)idLookupResult;
- (GEORPFeedbackImageUploadResult)imageUploadResult;
- (GEORPFeedbackLayoutConfigResult)layoutConfigResult;
- (GEORPFeedbackLogEventResult)logEventResult;
- (GEORPFeedbackQueryResult)queryResult;
- (GEORPFeedbackResult)init;
- (GEORPFeedbackResult)initWithData:(id)a3;
- (GEORPFeedbackResult)initWithDictionary:(id)a3;
- (GEORPFeedbackResult)initWithJSON:(id)a3;
- (GEORPFeedbackSubmissionResult)submissionResult;
- (GEORPFeedbackTdmFraudNotificationResult)tdmFraudNotificationResult;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readIdLookupResult;
- (void)_readImageUploadResult;
- (void)_readLayoutConfigResult;
- (void)_readLogEventResult;
- (void)_readQueryResult;
- (void)_readSubmissionResult;
- (void)_readTdmFraudNotificationResult;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setIdLookupResult:(id)a3;
- (void)setImageUploadResult:(id)a3;
- (void)setLayoutConfigResult:(id)a3;
- (void)setLogEventResult:(id)a3;
- (void)setQueryResult:(id)a3;
- (void)setSubmissionResult:(id)a3;
- (void)setTdmFraudNotificationResult:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tdmFraudNotificationResult, 0);
  objc_storeStrong((id *)&self->_submissionResult, 0);
  objc_storeStrong((id *)&self->_queryResult, 0);
  objc_storeStrong((id *)&self->_logEventResult, 0);
  objc_storeStrong((id *)&self->_layoutConfigResult, 0);
  objc_storeStrong((id *)&self->_imageUploadResult, 0);
  objc_storeStrong((id *)&self->_idLookupResult, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPFeedbackResultIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackResult *)self readAll:0];
    if (self->_submissionResult) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_idLookupResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_queryResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_imageUploadResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_layoutConfigResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_tdmFraudNotificationResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_logEventResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
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
    [(GEORPFeedbackResult *)self readAll:0];
    [(GEORPFeedbackSubmissionResult *)self->_submissionResult clearUnknownFields:1];
    [(GEORPFeedbackIdLookupResult *)self->_idLookupResult clearUnknownFields:1];
    [(GEORPFeedbackQueryResult *)self->_queryResult clearUnknownFields:1];
    [(GEORPFeedbackImageUploadResult *)self->_imageUploadResult clearUnknownFields:1];
    [(GEORPFeedbackTdmFraudNotificationResult *)self->_tdmFraudNotificationResult clearUnknownFields:1];
    logEventResult = self->_logEventResult;
    [(GEORPFeedbackLogEventResult *)logEventResult clearUnknownFields:1];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPFeedbackResult *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 20) = self->_readerMarkPos;
  *((_DWORD *)v5 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_submissionResult) {
    objc_msgSend(v5, "setSubmissionResult:");
  }
  if (self->_idLookupResult) {
    objc_msgSend(v5, "setIdLookupResult:");
  }
  v4 = v5;
  if (self->_queryResult)
  {
    objc_msgSend(v5, "setQueryResult:");
    v4 = v5;
  }
  if (self->_imageUploadResult)
  {
    objc_msgSend(v5, "setImageUploadResult:");
    v4 = v5;
  }
  if (self->_layoutConfigResult)
  {
    objc_msgSend(v5, "setLayoutConfigResult:");
    v4 = v5;
  }
  if (self->_tdmFraudNotificationResult)
  {
    objc_msgSend(v5, "setTdmFraudNotificationResult:");
    v4 = v5;
  }
  if (self->_logEventResult)
  {
    objc_msgSend(v5, "setLogEventResult:");
    v4 = v5;
  }
}

- (GEORPFeedbackQueryResult)queryResult
{
  -[GEORPFeedbackResult _readQueryResult]((uint64_t)self);
  queryResult = self->_queryResult;

  return queryResult;
}

- (void)_readQueryResult
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
        GEORPFeedbackResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
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
      id v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2165);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (GEORPFeedbackResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackResult;
  v2 = [(GEORPFeedbackResult *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackResult;
  id v3 = [(GEORPFeedbackResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readSubmissionResult
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
        GEORPFeedbackResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSubmissionResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasSubmissionResult
{
  return self->_submissionResult != 0;
}

- (GEORPFeedbackSubmissionResult)submissionResult
{
  -[GEORPFeedbackResult _readSubmissionResult]((uint64_t)self);
  submissionResult = self->_submissionResult;

  return submissionResult;
}

- (void)setSubmissionResult:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_submissionResult, a3);
}

- (void)_readIdLookupResult
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
        GEORPFeedbackResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIdLookupResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasIdLookupResult
{
  return self->_idLookupResult != 0;
}

- (GEORPFeedbackIdLookupResult)idLookupResult
{
  -[GEORPFeedbackResult _readIdLookupResult]((uint64_t)self);
  idLookupResult = self->_idLookupResult;

  return idLookupResult;
}

- (void)setIdLookupResult:(id)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  objc_storeStrong((id *)&self->_idLookupResult, a3);
}

- (BOOL)hasQueryResult
{
  return self->_queryResult != 0;
}

- (void)setQueryResult:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_queryResult, a3);
}

- (void)_readImageUploadResult
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
        GEORPFeedbackResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImageUploadResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasImageUploadResult
{
  return self->_imageUploadResult != 0;
}

- (GEORPFeedbackImageUploadResult)imageUploadResult
{
  -[GEORPFeedbackResult _readImageUploadResult]((uint64_t)self);
  imageUploadResult = self->_imageUploadResult;

  return imageUploadResult;
}

- (void)setImageUploadResult:(id)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  objc_storeStrong((id *)&self->_imageUploadResult, a3);
}

- (void)_readLayoutConfigResult
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
        GEORPFeedbackResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLayoutConfigResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasLayoutConfigResult
{
  return self->_layoutConfigResult != 0;
}

- (GEORPFeedbackLayoutConfigResult)layoutConfigResult
{
  -[GEORPFeedbackResult _readLayoutConfigResult]((uint64_t)self);
  layoutConfigResult = self->_layoutConfigResult;

  return layoutConfigResult;
}

- (void)setLayoutConfigResult:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_layoutConfigResult, a3);
}

- (void)_readTdmFraudNotificationResult
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
        GEORPFeedbackResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTdmFraudNotificationResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasTdmFraudNotificationResult
{
  return self->_tdmFraudNotificationResult != 0;
}

- (GEORPFeedbackTdmFraudNotificationResult)tdmFraudNotificationResult
{
  -[GEORPFeedbackResult _readTdmFraudNotificationResult]((uint64_t)self);
  tdmFraudNotificationResult = self->_tdmFraudNotificationResult;

  return tdmFraudNotificationResult;
}

- (void)setTdmFraudNotificationResult:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_tdmFraudNotificationResult, a3);
}

- (void)_readLogEventResult
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
        GEORPFeedbackResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLogEventResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasLogEventResult
{
  return self->_logEventResult != 0;
}

- (GEORPFeedbackLogEventResult)logEventResult
{
  -[GEORPFeedbackResult _readLogEventResult]((uint64_t)self);
  logEventResult = self->_logEventResult;

  return logEventResult;
}

- (void)setLogEventResult:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_logEventResult, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackResult;
  v4 = [(GEORPFeedbackResult *)&v8 description];
  id v5 = [(GEORPFeedbackResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackResult _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 submissionResult];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"submissionResult";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"submission_result";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 idLookupResult];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"idLookupResult";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"id_lookup_result";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [a1 queryResult];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"queryResult";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"query_result";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = [a1 imageUploadResult];
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"imageUploadResult";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"image_upload_result";
      }
      [v4 setObject:v19 forKey:v20];
    }
    v21 = [a1 layoutConfigResult];
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        v23 = [v21 jsonRepresentation];
        v24 = @"layoutConfigResult";
      }
      else
      {
        v23 = [v21 dictionaryRepresentation];
        v24 = @"layout_config_result";
      }
      [v4 setObject:v23 forKey:v24];
    }
    v25 = [a1 tdmFraudNotificationResult];
    v26 = v25;
    if (v25)
    {
      if (a2)
      {
        v27 = [v25 jsonRepresentation];
        v28 = @"tdmFraudNotificationResult";
      }
      else
      {
        v27 = [v25 dictionaryRepresentation];
        v28 = @"tdm_fraud_notification_result";
      }
      [v4 setObject:v27 forKey:v28];
    }
    v29 = [a1 logEventResult];
    v30 = v29;
    if (v29)
    {
      if (a2)
      {
        v31 = [v29 jsonRepresentation];
        v32 = @"logEventResult";
      }
      else
      {
        v31 = [v29 dictionaryRepresentation];
        v32 = @"log_event_result";
      }
      [v4 setObject:v31 forKey:v32];
    }
    v33 = (void *)a1[2];
    if (v33)
    {
      v34 = [v33 dictionaryRepresentation];
      v35 = v34;
      if (a2)
      {
        v36 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __49__GEORPFeedbackResult__dictionaryRepresentation___block_invoke;
        v40[3] = &unk_1E53D8860;
        id v37 = v36;
        id v41 = v37;
        [v35 enumerateKeysAndObjectsUsingBlock:v40];
        id v38 = v37;

        v35 = v38;
      }
      [v4 setObject:v35 forKey:@"Unknown Fields"];
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
  return -[GEORPFeedbackResult _dictionaryRepresentation:](self, 1);
}

void __49__GEORPFeedbackResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackResult)initWithDictionary:(id)a3
{
  return (GEORPFeedbackResult *)-[GEORPFeedbackResult _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"submissionResult";
      }
      else {
        objc_super v6 = @"submission_result";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEORPFeedbackSubmissionResult alloc];
        if (a3) {
          uint64_t v9 = [(GEORPFeedbackSubmissionResult *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEORPFeedbackSubmissionResult *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setSubmissionResult:v9];
      }
      if (a3) {
        v11 = @"idLookupResult";
      }
      else {
        v11 = @"id_lookup_result";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEORPFeedbackIdLookupResult alloc];
        if (a3) {
          uint64_t v14 = [(GEORPFeedbackIdLookupResult *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEORPFeedbackIdLookupResult *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setIdLookupResult:v14];
      }
      if (a3) {
        v16 = @"queryResult";
      }
      else {
        v16 = @"query_result";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [GEORPFeedbackQueryResult alloc];
        if (a3) {
          uint64_t v19 = [(GEORPFeedbackQueryResult *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEORPFeedbackQueryResult *)v18 initWithDictionary:v17];
        }
        v20 = (void *)v19;
        [a1 setQueryResult:v19];
      }
      if (a3) {
        v21 = @"imageUploadResult";
      }
      else {
        v21 = @"image_upload_result";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = [GEORPFeedbackImageUploadResult alloc];
        if (a3) {
          uint64_t v24 = [(GEORPFeedbackImageUploadResult *)v23 initWithJSON:v22];
        }
        else {
          uint64_t v24 = [(GEORPFeedbackImageUploadResult *)v23 initWithDictionary:v22];
        }
        v25 = (void *)v24;
        [a1 setImageUploadResult:v24];
      }
      if (a3) {
        v26 = @"layoutConfigResult";
      }
      else {
        v26 = @"layout_config_result";
      }
      v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = [GEORPFeedbackLayoutConfigResult alloc];
        if (a3) {
          uint64_t v29 = [(GEORPFeedbackLayoutConfigResult *)v28 initWithJSON:v27];
        }
        else {
          uint64_t v29 = [(GEORPFeedbackLayoutConfigResult *)v28 initWithDictionary:v27];
        }
        v30 = (void *)v29;
        [a1 setLayoutConfigResult:v29];
      }
      if (a3) {
        v31 = @"tdmFraudNotificationResult";
      }
      else {
        v31 = @"tdm_fraud_notification_result";
      }
      v32 = [v5 objectForKeyedSubscript:v31];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v33 = [GEORPFeedbackTdmFraudNotificationResult alloc];
        if (a3) {
          uint64_t v34 = [(GEORPFeedbackTdmFraudNotificationResult *)v33 initWithJSON:v32];
        }
        else {
          uint64_t v34 = [(GEORPFeedbackTdmFraudNotificationResult *)v33 initWithDictionary:v32];
        }
        v35 = (void *)v34;
        [a1 setTdmFraudNotificationResult:v34];
      }
      if (a3) {
        v36 = @"logEventResult";
      }
      else {
        v36 = @"log_event_result";
      }
      id v37 = [v5 objectForKeyedSubscript:v36];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v38 = [GEORPFeedbackLogEventResult alloc];
        if (a3) {
          uint64_t v39 = [(GEORPFeedbackLogEventResult *)v38 initWithJSON:v37];
        }
        else {
          uint64_t v39 = [(GEORPFeedbackLogEventResult *)v38 initWithDictionary:v37];
        }
        v40 = (void *)v39;
        [a1 setLogEventResult:v39];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackResult)initWithJSON:(id)a3
{
  return (GEORPFeedbackResult *)-[GEORPFeedbackResult _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_2160;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_2161;
    }
    GEORPFeedbackResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPFeedbackResultCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackResultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackResultReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPFeedbackResult _readIdLookupResult]((uint64_t)self);
  if ([(GEORPFeedbackIdLookupResult *)self->_idLookupResult hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPFeedbackResult _readQueryResult]((uint64_t)self);
  queryResult = self->_queryResult;

  return [(GEORPFeedbackQueryResult *)queryResult hasGreenTeaWithValue:v3];
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
    [(GEORPFeedbackResult *)self readAll:0];
    id v8 = [(GEORPFeedbackSubmissionResult *)self->_submissionResult copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v8;

    id v10 = [(GEORPFeedbackIdLookupResult *)self->_idLookupResult copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    id v12 = [(GEORPFeedbackQueryResult *)self->_queryResult copyWithZone:a3];
    v13 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v12;

    id v14 = [(GEORPFeedbackImageUploadResult *)self->_imageUploadResult copyWithZone:a3];
    v15 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v14;

    id v16 = [(GEORPFeedbackLayoutConfigResult *)self->_layoutConfigResult copyWithZone:a3];
    v17 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v16;

    id v18 = [(GEORPFeedbackTdmFraudNotificationResult *)self->_tdmFraudNotificationResult copyWithZone:a3];
    uint64_t v19 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v18;

    id v20 = [(GEORPFeedbackLogEventResult *)self->_logEventResult copyWithZone:a3];
    v21 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v20;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPFeedbackResultReadAllFrom(v5, self->_reader, 0);
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
  [(GEORPFeedbackResult *)self readAll:1];
  [v4 readAll:1];
  submissionResult = self->_submissionResult;
  if ((unint64_t)submissionResult | v4[8])
  {
    if (!-[GEORPFeedbackSubmissionResult isEqual:](submissionResult, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (((idLookupResult = self->_idLookupResult, !((unint64_t)idLookupResult | v4[3]))
     || -[GEORPFeedbackIdLookupResult isEqual:](idLookupResult, "isEqual:"))
    && ((queryResult = self->_queryResult, !((unint64_t)queryResult | v4[7]))
     || -[GEORPFeedbackQueryResult isEqual:](queryResult, "isEqual:"))
    && ((imageUploadResult = self->_imageUploadResult, !((unint64_t)imageUploadResult | v4[4]))
     || -[GEORPFeedbackImageUploadResult isEqual:](imageUploadResult, "isEqual:"))
    && ((layoutConfigResult = self->_layoutConfigResult, !((unint64_t)layoutConfigResult | v4[5]))
     || -[GEORPFeedbackLayoutConfigResult isEqual:](layoutConfigResult, "isEqual:"))
    && ((tdmFraudNotificationResult = self->_tdmFraudNotificationResult,
         !((unint64_t)tdmFraudNotificationResult | v4[9]))
     || -[GEORPFeedbackTdmFraudNotificationResult isEqual:](tdmFraudNotificationResult, "isEqual:")))
  {
    logEventResult = self->_logEventResult;
    if ((unint64_t)logEventResult | v4[6]) {
      char v12 = -[GEORPFeedbackLogEventResult isEqual:](logEventResult, "isEqual:");
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
  [(GEORPFeedbackResult *)self readAll:1];
  unint64_t v3 = [(GEORPFeedbackSubmissionResult *)self->_submissionResult hash];
  unint64_t v4 = [(GEORPFeedbackIdLookupResult *)self->_idLookupResult hash] ^ v3;
  unint64_t v5 = [(GEORPFeedbackQueryResult *)self->_queryResult hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEORPFeedbackImageUploadResult *)self->_imageUploadResult hash];
  unint64_t v7 = [(GEORPFeedbackLayoutConfigResult *)self->_layoutConfigResult hash];
  unint64_t v8 = v7 ^ [(GEORPFeedbackTdmFraudNotificationResult *)self->_tdmFraudNotificationResult hash];
  return v6 ^ v8 ^ [(GEORPFeedbackLogEventResult *)self->_logEventResult hash];
}

- (void)mergeFrom:(id)a3
{
  id v18 = a3;
  [v18 readAll:0];
  submissionResult = self->_submissionResult;
  uint64_t v5 = v18[8];
  if (submissionResult)
  {
    if (v5) {
      -[GEORPFeedbackSubmissionResult mergeFrom:](submissionResult, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPFeedbackResult setSubmissionResult:](self, "setSubmissionResult:");
  }
  idLookupResult = self->_idLookupResult;
  uint64_t v7 = v18[3];
  if (idLookupResult)
  {
    if (v7) {
      -[GEORPFeedbackIdLookupResult mergeFrom:](idLookupResult, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPFeedbackResult setIdLookupResult:](self, "setIdLookupResult:");
  }
  queryResult = self->_queryResult;
  uint64_t v9 = v18[7];
  if (queryResult)
  {
    if (v9) {
      -[GEORPFeedbackQueryResult mergeFrom:](queryResult, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEORPFeedbackResult setQueryResult:](self, "setQueryResult:");
  }
  imageUploadResult = self->_imageUploadResult;
  uint64_t v11 = v18[4];
  if (imageUploadResult)
  {
    if (v11) {
      -[GEORPFeedbackImageUploadResult mergeFrom:](imageUploadResult, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEORPFeedbackResult setImageUploadResult:](self, "setImageUploadResult:");
  }
  layoutConfigResult = self->_layoutConfigResult;
  uint64_t v13 = v18[5];
  if (layoutConfigResult)
  {
    if (v13) {
      -[GEORPFeedbackLayoutConfigResult mergeFrom:](layoutConfigResult, "mergeFrom:");
    }
  }
  else if (v13)
  {
    [(GEORPFeedbackResult *)self setLayoutConfigResult:"setLayoutConfigResult:"];
  }
  tdmFraudNotificationResult = self->_tdmFraudNotificationResult;
  uint64_t v15 = v18[9];
  if (tdmFraudNotificationResult)
  {
    if (v15) {
      -[GEORPFeedbackTdmFraudNotificationResult mergeFrom:](tdmFraudNotificationResult, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEORPFeedbackResult setTdmFraudNotificationResult:](self, "setTdmFraudNotificationResult:");
  }
  logEventResult = self->_logEventResult;
  uint64_t v17 = v18[6];
  if (logEventResult)
  {
    if (v17) {
      -[GEORPFeedbackLogEventResult mergeFrom:](logEventResult, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[GEORPFeedbackResult setLogEventResult:](self, "setLogEventResult:");
  }
}

@end