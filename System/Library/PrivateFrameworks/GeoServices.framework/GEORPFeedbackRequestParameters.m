@interface GEORPFeedbackRequestParameters
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIdLookupParameters;
- (BOOL)hasImageUploadParameters;
- (BOOL)hasLayoutConfigParameters;
- (BOOL)hasLogEventParameters;
- (BOOL)hasQueryParameters;
- (BOOL)hasSubmissionParameters;
- (BOOL)hasTdmFraudNotificationParameters;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPOIEnrichment;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackIdLookupParameters)idLookupParameters;
- (GEORPFeedbackImageUploadParameters)imageUploadParameters;
- (GEORPFeedbackLayoutConfigParameters)layoutConfigParameters;
- (GEORPFeedbackLogEventParameters)logEventParameters;
- (GEORPFeedbackQueryParameters)queryParameters;
- (GEORPFeedbackRequestParameters)init;
- (GEORPFeedbackRequestParameters)initWithData:(id)a3;
- (GEORPFeedbackRequestParameters)initWithDictionary:(id)a3;
- (GEORPFeedbackRequestParameters)initWithIncidentAnnotationDetails:(id)a3 userPath:(id)a4;
- (GEORPFeedbackRequestParameters)initWithIncidentLocation:(id)a3 userLocation:(id)a4 type:(int)a5 historicalLocations:(id)a6 userPath:(id)a7;
- (GEORPFeedbackRequestParameters)initWithJSON:(id)a3;
- (GEORPFeedbackRequestParameters)initWithMerchantIndustryCode:(int64_t)a3 mapsIdentifier:(unint64_t)a4 merchantName:(id)a5 merchantRawName:(id)a6 merchantIndustryCategory:(id)a7 merchantURL:(id)a8 merchantFormattedAddress:(id)a9 transactionTime:(double)a10 transactionType:(id)a11 transactionLocation:(id)a12 merchantBankTransactionInfo:(id)a13;
- (GEORPFeedbackSubmissionParameters)submissionParameters;
- (GEORPTdmFraudNotificationParameters)tdmFraudNotificationParameters;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initForRunningTrackIssue:(int)a3 trackCoordinateLatitude:(double)a4 trackCoordinateLongitude:(double)a5 trackFeatureID:(id)a6 nameOfTrack:(id)a7 numberOfLanes:(id)a8 comment:(id)a9;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readIdLookupParameters;
- (void)_readImageUploadParameters;
- (void)_readLayoutConfigParameters;
- (void)_readLogEventParameters;
- (void)_readQueryParameters;
- (void)_readSubmissionParameters;
- (void)_readTdmFraudNotificationParameters;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setIdLookupParameters:(id)a3;
- (void)setImageUploadParameters:(id)a3;
- (void)setLayoutConfigParameters:(id)a3;
- (void)setLogEventParameters:(id)a3;
- (void)setQueryParameters:(id)a3;
- (void)setSubmissionParameters:(id)a3;
- (void)setTdmFraudNotificationParameters:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackRequestParameters

- (GEORPFeedbackRequestParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackRequestParameters;
  v2 = [(GEORPFeedbackRequestParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackRequestParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackRequestParameters;
  v3 = [(GEORPFeedbackRequestParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSubmissionParameters
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
        GEORPFeedbackRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSubmissionParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasSubmissionParameters
{
  return self->_submissionParameters != 0;
}

- (GEORPFeedbackSubmissionParameters)submissionParameters
{
  -[GEORPFeedbackRequestParameters _readSubmissionParameters]((uint64_t)self);
  submissionParameters = self->_submissionParameters;

  return submissionParameters;
}

- (void)setSubmissionParameters:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_submissionParameters, a3);
}

- (void)_readIdLookupParameters
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
        GEORPFeedbackRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIdLookupParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasIdLookupParameters
{
  return self->_idLookupParameters != 0;
}

- (GEORPFeedbackIdLookupParameters)idLookupParameters
{
  -[GEORPFeedbackRequestParameters _readIdLookupParameters]((uint64_t)self);
  idLookupParameters = self->_idLookupParameters;

  return idLookupParameters;
}

- (void)setIdLookupParameters:(id)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  objc_storeStrong((id *)&self->_idLookupParameters, a3);
}

- (void)_readQueryParameters
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
        GEORPFeedbackRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasQueryParameters
{
  return self->_queryParameters != 0;
}

- (GEORPFeedbackQueryParameters)queryParameters
{
  -[GEORPFeedbackRequestParameters _readQueryParameters]((uint64_t)self);
  queryParameters = self->_queryParameters;

  return queryParameters;
}

- (void)setQueryParameters:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_queryParameters, a3);
}

- (void)_readImageUploadParameters
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
        GEORPFeedbackRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImageUploadParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasImageUploadParameters
{
  return self->_imageUploadParameters != 0;
}

- (GEORPFeedbackImageUploadParameters)imageUploadParameters
{
  -[GEORPFeedbackRequestParameters _readImageUploadParameters]((uint64_t)self);
  imageUploadParameters = self->_imageUploadParameters;

  return imageUploadParameters;
}

- (void)setImageUploadParameters:(id)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  objc_storeStrong((id *)&self->_imageUploadParameters, a3);
}

- (void)_readLayoutConfigParameters
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
        GEORPFeedbackRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLayoutConfigParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasLayoutConfigParameters
{
  return self->_layoutConfigParameters != 0;
}

- (GEORPFeedbackLayoutConfigParameters)layoutConfigParameters
{
  -[GEORPFeedbackRequestParameters _readLayoutConfigParameters]((uint64_t)self);
  layoutConfigParameters = self->_layoutConfigParameters;

  return layoutConfigParameters;
}

- (void)setLayoutConfigParameters:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_layoutConfigParameters, a3);
}

- (void)_readTdmFraudNotificationParameters
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
        GEORPFeedbackRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTdmFraudNotificationParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasTdmFraudNotificationParameters
{
  return self->_tdmFraudNotificationParameters != 0;
}

- (GEORPTdmFraudNotificationParameters)tdmFraudNotificationParameters
{
  -[GEORPFeedbackRequestParameters _readTdmFraudNotificationParameters]((uint64_t)self);
  tdmFraudNotificationParameters = self->_tdmFraudNotificationParameters;

  return tdmFraudNotificationParameters;
}

- (void)setTdmFraudNotificationParameters:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_tdmFraudNotificationParameters, a3);
}

- (void)_readLogEventParameters
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
        GEORPFeedbackRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLogEventParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasLogEventParameters
{
  return self->_logEventParameters != 0;
}

- (GEORPFeedbackLogEventParameters)logEventParameters
{
  -[GEORPFeedbackRequestParameters _readLogEventParameters]((uint64_t)self);
  logEventParameters = self->_logEventParameters;

  return logEventParameters;
}

- (void)setLogEventParameters:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_logEventParameters, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackRequestParameters;
  v4 = [(GEORPFeedbackRequestParameters *)&v8 description];
  v5 = [(GEORPFeedbackRequestParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackRequestParameters _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 submissionParameters];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"submissionParameters";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"submission_parameters";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 idLookupParameters];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"idLookupParameters";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"id_lookup_parameters";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [a1 queryParameters];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"queryParameters";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"query_parameters";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = [a1 imageUploadParameters];
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"imageUploadParameters";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"image_upload_parameters";
      }
      [v4 setObject:v19 forKey:v20];
    }
    v21 = [a1 layoutConfigParameters];
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        v23 = [v21 jsonRepresentation];
        v24 = @"layoutConfigParameters";
      }
      else
      {
        v23 = [v21 dictionaryRepresentation];
        v24 = @"layout_config_parameters";
      }
      [v4 setObject:v23 forKey:v24];
    }
    v25 = [a1 tdmFraudNotificationParameters];
    v26 = v25;
    if (v25)
    {
      if (a2)
      {
        v27 = [v25 jsonRepresentation];
        v28 = @"tdmFraudNotificationParameters";
      }
      else
      {
        v27 = [v25 dictionaryRepresentation];
        v28 = @"tdm_fraud_notification_parameters";
      }
      [v4 setObject:v27 forKey:v28];
    }
    v29 = [a1 logEventParameters];
    v30 = v29;
    if (v29)
    {
      if (a2)
      {
        v31 = [v29 jsonRepresentation];
        v32 = @"logEventParameters";
      }
      else
      {
        v31 = [v29 dictionaryRepresentation];
        v32 = @"log_event_parameters";
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
        v40[2] = __60__GEORPFeedbackRequestParameters__dictionaryRepresentation___block_invoke;
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
  return -[GEORPFeedbackRequestParameters _dictionaryRepresentation:](self, 1);
}

void __60__GEORPFeedbackRequestParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackRequestParameters)initWithDictionary:(id)a3
{
  return (GEORPFeedbackRequestParameters *)-[GEORPFeedbackRequestParameters _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"submissionParameters";
      }
      else {
        objc_super v6 = @"submission_parameters";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEORPFeedbackSubmissionParameters alloc];
        if (a3) {
          uint64_t v9 = [(GEORPFeedbackSubmissionParameters *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEORPFeedbackSubmissionParameters *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setSubmissionParameters:v9];
      }
      if (a3) {
        v11 = @"idLookupParameters";
      }
      else {
        v11 = @"id_lookup_parameters";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEORPFeedbackIdLookupParameters alloc];
        if (a3) {
          uint64_t v14 = [(GEORPFeedbackIdLookupParameters *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEORPFeedbackIdLookupParameters *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setIdLookupParameters:v14];
      }
      if (a3) {
        v16 = @"queryParameters";
      }
      else {
        v16 = @"query_parameters";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [GEORPFeedbackQueryParameters alloc];
        if (a3) {
          uint64_t v19 = [(GEORPFeedbackQueryParameters *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEORPFeedbackQueryParameters *)v18 initWithDictionary:v17];
        }
        v20 = (void *)v19;
        [a1 setQueryParameters:v19];
      }
      if (a3) {
        v21 = @"imageUploadParameters";
      }
      else {
        v21 = @"image_upload_parameters";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = [GEORPFeedbackImageUploadParameters alloc];
        if (a3) {
          uint64_t v24 = [(GEORPFeedbackImageUploadParameters *)v23 initWithJSON:v22];
        }
        else {
          uint64_t v24 = [(GEORPFeedbackImageUploadParameters *)v23 initWithDictionary:v22];
        }
        v25 = (void *)v24;
        [a1 setImageUploadParameters:v24];
      }
      if (a3) {
        v26 = @"layoutConfigParameters";
      }
      else {
        v26 = @"layout_config_parameters";
      }
      v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = [GEORPFeedbackLayoutConfigParameters alloc];
        if (a3) {
          uint64_t v29 = [(GEORPFeedbackLayoutConfigParameters *)v28 initWithJSON:v27];
        }
        else {
          uint64_t v29 = [(GEORPFeedbackLayoutConfigParameters *)v28 initWithDictionary:v27];
        }
        v30 = (void *)v29;
        [a1 setLayoutConfigParameters:v29];
      }
      if (a3) {
        v31 = @"tdmFraudNotificationParameters";
      }
      else {
        v31 = @"tdm_fraud_notification_parameters";
      }
      v32 = [v5 objectForKeyedSubscript:v31];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v33 = [GEORPTdmFraudNotificationParameters alloc];
        if (a3) {
          uint64_t v34 = [(GEORPTdmFraudNotificationParameters *)v33 initWithJSON:v32];
        }
        else {
          uint64_t v34 = [(GEORPTdmFraudNotificationParameters *)v33 initWithDictionary:v32];
        }
        v35 = (void *)v34;
        [a1 setTdmFraudNotificationParameters:v34];
      }
      if (a3) {
        v36 = @"logEventParameters";
      }
      else {
        v36 = @"log_event_parameters";
      }
      id v37 = [v5 objectForKeyedSubscript:v36];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v38 = [GEORPFeedbackLogEventParameters alloc];
        if (a3) {
          uint64_t v39 = [(GEORPFeedbackLogEventParameters *)v38 initWithJSON:v37];
        }
        else {
          uint64_t v39 = [(GEORPFeedbackLogEventParameters *)v38 initWithDictionary:v37];
        }
        v40 = (void *)v39;
        [a1 setLogEventParameters:v39];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackRequestParameters)initWithJSON:(id)a3
{
  return (GEORPFeedbackRequestParameters *)-[GEORPFeedbackRequestParameters _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1982;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1983;
    }
    GEORPFeedbackRequestParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPFeedbackRequestParametersCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackRequestParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackRequestParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPFeedbackRequestParametersIsDirty((uint64_t)self))
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
    [(GEORPFeedbackRequestParameters *)self readAll:0];
    if (self->_submissionParameters) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_idLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_queryParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_imageUploadParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_layoutConfigParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_tdmFraudNotificationParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_logEventParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPFeedbackRequestParameters _readImageUploadParameters]((uint64_t)self);
  if ([(GEORPFeedbackImageUploadParameters *)self->_imageUploadParameters hasGreenTeaWithValue:v3])
  {
    return 1;
  }
  -[GEORPFeedbackRequestParameters _readLayoutConfigParameters]((uint64_t)self);
  if ([(GEORPFeedbackLayoutConfigParameters *)self->_layoutConfigParameters hasGreenTeaWithValue:v3])
  {
    return 1;
  }
  -[GEORPFeedbackRequestParameters _readSubmissionParameters]((uint64_t)self);
  submissionParameters = self->_submissionParameters;

  return [(GEORPFeedbackSubmissionParameters *)submissionParameters hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPFeedbackRequestParameters *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 20) = self->_readerMarkPos;
  *((_DWORD *)v5 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_submissionParameters) {
    objc_msgSend(v5, "setSubmissionParameters:");
  }
  if (self->_idLookupParameters) {
    objc_msgSend(v5, "setIdLookupParameters:");
  }
  v4 = v5;
  if (self->_queryParameters)
  {
    objc_msgSend(v5, "setQueryParameters:");
    v4 = v5;
  }
  if (self->_imageUploadParameters)
  {
    objc_msgSend(v5, "setImageUploadParameters:");
    v4 = v5;
  }
  if (self->_layoutConfigParameters)
  {
    objc_msgSend(v5, "setLayoutConfigParameters:");
    v4 = v5;
  }
  if (self->_tdmFraudNotificationParameters)
  {
    objc_msgSend(v5, "setTdmFraudNotificationParameters:");
    v4 = v5;
  }
  if (self->_logEventParameters)
  {
    objc_msgSend(v5, "setLogEventParameters:");
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
    [(GEORPFeedbackRequestParameters *)self readAll:0];
    id v8 = [(GEORPFeedbackSubmissionParameters *)self->_submissionParameters copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v8;

    id v10 = [(GEORPFeedbackIdLookupParameters *)self->_idLookupParameters copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    id v12 = [(GEORPFeedbackQueryParameters *)self->_queryParameters copyWithZone:a3];
    v13 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v12;

    id v14 = [(GEORPFeedbackImageUploadParameters *)self->_imageUploadParameters copyWithZone:a3];
    v15 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v14;

    id v16 = [(GEORPFeedbackLayoutConfigParameters *)self->_layoutConfigParameters copyWithZone:a3];
    v17 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v16;

    id v18 = [(GEORPTdmFraudNotificationParameters *)self->_tdmFraudNotificationParameters copyWithZone:a3];
    uint64_t v19 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v18;

    id v20 = [(GEORPFeedbackLogEventParameters *)self->_logEventParameters copyWithZone:a3];
    v21 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v20;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPFeedbackRequestParametersReadAllFrom(v5, self->_reader, 0);
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
  [(GEORPFeedbackRequestParameters *)self readAll:1];
  [v4 readAll:1];
  submissionParameters = self->_submissionParameters;
  if ((unint64_t)submissionParameters | v4[8])
  {
    if (!-[GEORPFeedbackSubmissionParameters isEqual:](submissionParameters, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (((idLookupParameters = self->_idLookupParameters, !((unint64_t)idLookupParameters | v4[3]))
     || -[GEORPFeedbackIdLookupParameters isEqual:](idLookupParameters, "isEqual:"))
    && ((queryParameters = self->_queryParameters, !((unint64_t)queryParameters | v4[7]))
     || -[GEORPFeedbackQueryParameters isEqual:](queryParameters, "isEqual:"))
    && ((imageUploadParameters = self->_imageUploadParameters, !((unint64_t)imageUploadParameters | v4[4]))
     || -[GEORPFeedbackImageUploadParameters isEqual:](imageUploadParameters, "isEqual:"))
    && ((layoutConfigParameters = self->_layoutConfigParameters, !((unint64_t)layoutConfigParameters | v4[5]))
     || -[GEORPFeedbackLayoutConfigParameters isEqual:](layoutConfigParameters, "isEqual:"))
    && ((tdmFraudNotificationParameters = self->_tdmFraudNotificationParameters,
         !((unint64_t)tdmFraudNotificationParameters | v4[9]))
     || -[GEORPTdmFraudNotificationParameters isEqual:](tdmFraudNotificationParameters, "isEqual:")))
  {
    logEventParameters = self->_logEventParameters;
    if ((unint64_t)logEventParameters | v4[6]) {
      char v12 = -[GEORPFeedbackLogEventParameters isEqual:](logEventParameters, "isEqual:");
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
  [(GEORPFeedbackRequestParameters *)self readAll:1];
  unint64_t v3 = [(GEORPFeedbackSubmissionParameters *)self->_submissionParameters hash];
  unint64_t v4 = [(GEORPFeedbackIdLookupParameters *)self->_idLookupParameters hash] ^ v3;
  unint64_t v5 = [(GEORPFeedbackQueryParameters *)self->_queryParameters hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEORPFeedbackImageUploadParameters *)self->_imageUploadParameters hash];
  unint64_t v7 = [(GEORPFeedbackLayoutConfigParameters *)self->_layoutConfigParameters hash];
  unint64_t v8 = v7 ^ [(GEORPTdmFraudNotificationParameters *)self->_tdmFraudNotificationParameters hash];
  return v6 ^ v8 ^ [(GEORPFeedbackLogEventParameters *)self->_logEventParameters hash];
}

- (void)mergeFrom:(id)a3
{
  id v18 = a3;
  [v18 readAll:0];
  submissionParameters = self->_submissionParameters;
  uint64_t v5 = v18[8];
  if (submissionParameters)
  {
    if (v5) {
      -[GEORPFeedbackSubmissionParameters mergeFrom:](submissionParameters, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPFeedbackRequestParameters setSubmissionParameters:](self, "setSubmissionParameters:");
  }
  idLookupParameters = self->_idLookupParameters;
  uint64_t v7 = v18[3];
  if (idLookupParameters)
  {
    if (v7) {
      -[GEORPFeedbackIdLookupParameters mergeFrom:](idLookupParameters, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPFeedbackRequestParameters setIdLookupParameters:](self, "setIdLookupParameters:");
  }
  queryParameters = self->_queryParameters;
  uint64_t v9 = v18[7];
  if (queryParameters)
  {
    if (v9) {
      -[GEORPFeedbackQueryParameters mergeFrom:](queryParameters, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEORPFeedbackRequestParameters setQueryParameters:](self, "setQueryParameters:");
  }
  imageUploadParameters = self->_imageUploadParameters;
  uint64_t v11 = v18[4];
  if (imageUploadParameters)
  {
    if (v11) {
      -[GEORPFeedbackImageUploadParameters mergeFrom:](imageUploadParameters, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEORPFeedbackRequestParameters setImageUploadParameters:](self, "setImageUploadParameters:");
  }
  layoutConfigParameters = self->_layoutConfigParameters;
  uint64_t v13 = v18[5];
  if (layoutConfigParameters)
  {
    if (v13) {
      -[GEORPFeedbackLayoutConfigParameters mergeFrom:](layoutConfigParameters, "mergeFrom:");
    }
  }
  else if (v13)
  {
    [(GEORPFeedbackRequestParameters *)self setLayoutConfigParameters:"setLayoutConfigParameters:"];
  }
  tdmFraudNotificationParameters = self->_tdmFraudNotificationParameters;
  uint64_t v15 = v18[9];
  if (tdmFraudNotificationParameters)
  {
    if (v15) {
      -[GEORPTdmFraudNotificationParameters mergeFrom:](tdmFraudNotificationParameters, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEORPFeedbackRequestParameters setTdmFraudNotificationParameters:](self, "setTdmFraudNotificationParameters:");
  }
  logEventParameters = self->_logEventParameters;
  uint64_t v17 = v18[6];
  if (logEventParameters)
  {
    if (v17) {
      -[GEORPFeedbackLogEventParameters mergeFrom:](logEventParameters, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[GEORPFeedbackRequestParameters setLogEventParameters:](self, "setLogEventParameters:");
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
      GEORPFeedbackRequestParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1987);
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
    [(GEORPFeedbackRequestParameters *)self readAll:0];
    [(GEORPFeedbackSubmissionParameters *)self->_submissionParameters clearUnknownFields:1];
    [(GEORPFeedbackIdLookupParameters *)self->_idLookupParameters clearUnknownFields:1];
    [(GEORPFeedbackQueryParameters *)self->_queryParameters clearUnknownFields:1];
    [(GEORPFeedbackImageUploadParameters *)self->_imageUploadParameters clearUnknownFields:1];
    [(GEORPTdmFraudNotificationParameters *)self->_tdmFraudNotificationParameters clearUnknownFields:1];
    logEventParameters = self->_logEventParameters;
    [(GEORPFeedbackLogEventParameters *)logEventParameters clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tdmFraudNotificationParameters, 0);
  objc_storeStrong((id *)&self->_submissionParameters, 0);
  objc_storeStrong((id *)&self->_queryParameters, 0);
  objc_storeStrong((id *)&self->_logEventParameters, 0);
  objc_storeStrong((id *)&self->_layoutConfigParameters, 0);
  objc_storeStrong((id *)&self->_imageUploadParameters, 0);
  objc_storeStrong((id *)&self->_idLookupParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)isPOIEnrichment
{
  BOOL v3 = [(GEORPFeedbackRequestParameters *)self submissionParameters];
  unint64_t v4 = [(GEORPFeedbackRequestParameters *)self imageUploadParameters];
  uint64_t v5 = [(GEORPFeedbackRequestParameters *)self queryParameters];
  unint64_t v6 = v5;
  if (v4)
  {
    char v7 = [v4 isEnrichment];
  }
  else if (v3)
  {
    char v7 = [v3 type] == 10;
  }
  else if (v5 && [v5 feedbackComponentTypesCount])
  {
    unint64_t v8 = 0;
    do
    {
      int v9 = [v6 feedbackComponentTypeAtIndex:v8];
      char v7 = v9 == 4;
      if (v9 == 4) {
        break;
      }
      ++v8;
    }
    while (v8 < [v6 feedbackComponentTypesCount]);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (GEORPFeedbackRequestParameters)initWithMerchantIndustryCode:(int64_t)a3 mapsIdentifier:(unint64_t)a4 merchantName:(id)a5 merchantRawName:(id)a6 merchantIndustryCategory:(id)a7 merchantURL:(id)a8 merchantFormattedAddress:(id)a9 transactionTime:(double)a10 transactionType:(id)a11 transactionLocation:(id)a12 merchantBankTransactionInfo:(id)a13
{
  double var1 = a12.var1;
  double var0 = a12.var0;
  id v65 = a5;
  id v64 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a11;
  id v26 = a13;
  v66.receiver = self;
  v66.super_class = (Class)GEORPFeedbackRequestParameters;
  v27 = [(GEORPFeedbackRequestParameters *)&v66 init];
  if (v27)
  {
    v28 = objc_alloc_init(GEORPFeedbackSubmissionParameters);
    [(GEORPFeedbackRequestParameters *)v27 setSubmissionParameters:v28];

    uint64_t v29 = [(GEORPFeedbackRequestParameters *)v27 submissionParameters];
    [v29 setType:7];

    v30 = objc_alloc_init(GEORPFeedbackCommonContext);
    [(GEORPFeedbackRequestParameters *)v27 submissionParameters];
    id v63 = v26;
    id v31 = v25;
    id v32 = v24;
    id v33 = v23;
    id v34 = v22;
    v36 = unint64_t v35 = a4;
    [v36 setCommonContext:v30];

    double Current = CFAbsoluteTimeGetCurrent();
    id v38 = [(GEORPFeedbackRequestParameters *)v27 submissionParameters];
    uint64_t v39 = [v38 commonContext];
    [v39 setClientCreatedAt:Current];

    v40 = objc_alloc_init(GEORPFeedbackDetails);
    id v41 = [(GEORPFeedbackRequestParameters *)v27 submissionParameters];
    [v41 setDetails:v40];

    v42 = objc_alloc_init(GEORPMerchantLookupFeedback);
    v43 = [(GEORPFeedbackRequestParameters *)v27 submissionParameters];
    v44 = [v43 details];
    [v44 setMerchantLookupFeedback:v42];

    v45 = objc_alloc_init(GEORPMerchantLookupContext);
    [(GEORPMerchantLookupContext *)v45 setMerchantIndustryCode:a3];
    v46 = objc_alloc_init(GEOPDMapsIdentifier);
    [(GEORPMerchantLookupContext *)v45 setMerchantId:v46];

    v47 = objc_alloc_init(GEOPDShardedId);
    v48 = [(GEORPMerchantLookupContext *)v45 merchantId];
    [v48 setShardedId:v47];

    v49 = [(GEORPMerchantLookupContext *)v45 merchantId];
    v50 = [v49 shardedId];
    unint64_t v51 = v35;
    id v22 = v34;
    id v23 = v33;
    id v24 = v32;
    id v25 = v31;
    id v26 = v63;
    [v50 setMuid:v51];

    v52 = (void *)[v65 copy];
    [(GEORPMerchantLookupContext *)v45 setMerchantName:v52];

    v53 = (void *)[v64 copy];
    [(GEORPMerchantLookupContext *)v45 setMerchantRawName:v53];

    v54 = (void *)[v22 copy];
    [(GEORPMerchantLookupContext *)v45 setMerchantIndustryCategory:v54];

    v55 = (void *)[v23 copy];
    [(GEORPMerchantLookupContext *)v45 setMerchantUrl:v55];

    v56 = (void *)[v24 copy];
    [(GEORPMerchantLookupContext *)v45 setMerchantFormattedAddress:v56];

    [(GEORPMerchantLookupContext *)v45 setTransactionTime:a10];
    v57 = (void *)[v25 copy];
    [(GEORPMerchantLookupContext *)v45 setTransactionType:v57];

    v58 = -[GEOLocation initWithGEOCoordinate:]([GEOLocation alloc], "initWithGEOCoordinate:", var0, var1);
    [(GEORPMerchantLookupContext *)v45 setTransactionLocation:v58];

    [(GEORPMerchantLookupContext *)v45 setMerchantBankTransactionInfo:v63];
    v59 = [(GEORPFeedbackRequestParameters *)v27 submissionParameters];
    v60 = [v59 details];
    v61 = [v60 merchantLookupFeedback];
    [v61 setContext:v45];
  }
  return v27;
}

- (id)initForRunningTrackIssue:(int)a3 trackCoordinateLatitude:(double)a4 trackCoordinateLongitude:(double)a5 trackFeatureID:(id)a6 nameOfTrack:(id)a7 numberOfLanes:(id)a8 comment:(id)a9
{
  uint64_t v14 = *(void *)&a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v95.receiver = self;
  v95.super_class = (Class)GEORPFeedbackRequestParameters;
  id v20 = [(GEORPFeedbackRequestParameters *)&v95 init];
  if (!v20) {
    goto LABEL_154;
  }
  id v94 = v17;
  v21 = objc_alloc_init(GEORPFeedbackSubmissionParameters);
  [(GEORPFeedbackRequestParameters *)v20 setSubmissionParameters:v21];

  id v22 = [(GEORPFeedbackRequestParameters *)v20 submissionParameters];
  [v22 setType:20];

  id v23 = objc_alloc_init(GEORPFeedbackCommonContext);
  id v24 = [(GEORPFeedbackRequestParameters *)v20 submissionParameters];
  [v24 setCommonContext:v23];

  double Current = CFAbsoluteTimeGetCurrent();
  id v26 = [(GEORPFeedbackRequestParameters *)v20 submissionParameters];
  v27 = [v26 commonContext];
  [v27 setClientCreatedAt:Current];

  v28 = [(GEORPFeedbackRequestParameters *)v20 submissionParameters];
  uint64_t v29 = [v28 commonContext];
  [v29 recordEnvironmentAndManifestURLs];

  v30 = objc_alloc_init(GEORPMapLocation);
  id v31 = [(GEORPFeedbackRequestParameters *)v20 submissionParameters];
  id v32 = [v31 commonContext];
  [v32 setMapLocation:v30];

  id v33 = objc_alloc_init(GEOLatLng);
  id v34 = [(GEORPFeedbackRequestParameters *)v20 submissionParameters];
  unint64_t v35 = [v34 commonContext];
  v36 = [v35 mapLocation];
  [v36 setCoordinate:v33];

  id v37 = [(GEORPFeedbackRequestParameters *)v20 submissionParameters];
  id v38 = [v37 commonContext];
  uint64_t v39 = [v38 mapLocation];
  v40 = [v39 coordinate];
  [v40 setLat:a4];

  id v41 = [(GEORPFeedbackRequestParameters *)v20 submissionParameters];
  v42 = [v41 commonContext];
  v43 = [v42 mapLocation];
  v44 = [v43 coordinate];
  [v44 setLng:a5];

  v45 = objc_alloc_init(GEORPFeedbackDetails);
  v46 = [(GEORPFeedbackRequestParameters *)v20 submissionParameters];
  [v46 setDetails:v45];

  v47 = objc_alloc_init(GEORPRunningTrackFeedback);
  v48 = [(GEORPFeedbackRequestParameters *)v20 submissionParameters];
  v49 = [v48 details];
  [v49 setRunningTrackFeedback:v47];

  v50 = [(GEORPFeedbackRequestParameters *)v20 submissionParameters];
  unint64_t v51 = [v50 details];
  v52 = [v51 runningTrackFeedback];
  id v93 = v16;
  [v52 setTrackFeatureId:v16];

  v53 = objc_alloc_init(GEORPFeedbackDynamicForm);
  v54 = objc_alloc_init(GEORPFeedbackFormField);
  [(GEORPFeedbackFormField *)v54 setName:10001];
  v55 = objc_alloc_init(GEORPFeedbackFieldValue);
  [(GEORPFeedbackFormField *)v54 setValue:v55];

  v56 = [(GEORPFeedbackFormField *)v54 value];
  [v56 setFieldValueType:1];

  v57 = objc_alloc_init(GEORPFeedbackSingleSelectField);
  v58 = [(GEORPFeedbackFormField *)v54 value];
  [v58 setSingleSelectField:v57];

  v59 = objc_alloc_init(GEORPFeedbackFieldOption);
  v60 = [(GEORPFeedbackFormField *)v54 value];
  v61 = [v60 singleSelectField];
  [v61 setSelected:v59];

  v62 = [(GEORPFeedbackFormField *)v54 value];
  id v63 = [v62 singleSelectField];
  id v64 = [v63 selected];
  [v64 setKey:v14];

  if ((int)v14 <= 1300)
  {
    if ((int)v14 > 1100)
    {
      switch((int)v14)
      {
        case 1101:
          id v65 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_NAME";
          break;
        case 1102:
          id v65 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_LOCATION";
          break;
        case 1103:
          id v65 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_ENTRANCE";
          break;
        case 1104:
          id v65 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_EXIT";
          break;
        case 1105:
          id v65 = @"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_NAME";
          break;
        case 1106:
          id v65 = @"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SHAPE";
          break;
        case 1107:
          id v65 = @"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SCHEDULE";
          break;
        case 1108:
          id v65 = @"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_DELAY";
          break;
        case 1109:
          goto LABEL_134;
        case 1110:
          id v65 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_TEMPORARILY";
          break;
        case 1111:
          id v65 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_PERMANENTLY";
          break;
        case 1112:
          id v65 = @"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_INFO_WRONG";
          break;
        case 1113:
          id v65 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_SOMETHING_ELSE";
          break;
        default:
          switch((int)v14)
          {
            case 1201:
              id v65 = @"FEEDBACK_FIELD_OPTION_STREET_NAME_WRONG";
              break;
            case 1202:
              id v65 = @"FEEDBACK_FIELD_OPTION_STREET_MISSING";
              break;
            case 1206:
              id v65 = @"FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY";
              break;
            case 1207:
              id v65 = @"FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY";
              break;
            case 1208:
              id v65 = @"FEEDBACK_FIELD_OPTION_STREET_SOMETHING_ELSE";
              break;
            case 1209:
              id v65 = @"FEEDBACK_FIELD_OPTION_STREET_PRIVATE";
              break;
            case 1210:
              id v65 = @"FEEDBACK_FIELD_OPTION_STREET_SHAPE_WRONG";
              break;
            case 1211:
              id v65 = @"FEEDBACK_FIELD_OPTION_FEATURE_WRONG";
              break;
            default:
              goto LABEL_134;
          }
          break;
      }
    }
    else
    {
      id v65 = @"FEEDBACK_FIELD_OPTION_UNKNOWN";
      switch((int)v14)
      {
        case 0:
          goto LABEL_147;
        case 1:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_NAME";
          break;
        case 2:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_ADDRESS";
          break;
        case 3:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_LOCATION";
          break;
        case 4:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_WEBSITE";
          break;
        case 5:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_HOURS";
          break;
        case 6:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_PHONE";
          break;
        case 7:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_CLOSED_TEMPORARY";
          break;
        case 8:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_CLOSED_PERMANENT";
          break;
        case 9:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_MULTIPLE";
          break;
        case 10:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_SOMETHING_ELSE";
          break;
        case 11:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_CATEGORY";
          break;
        case 12:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_PHONE_OR_WEBSITE";
          break;
        case 13:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_CLOSED";
          break;
        case 14:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_CLOSED_UNSURE";
          break;
        case 15:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_REOPENING";
          break;
        case 16:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_ADDRESS_WRONG";
          break;
        case 17:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_WEBSITE_WRONG";
          break;
        case 18:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_HOURS_WRONG";
          break;
        case 19:
          id v65 = @"FEEDBACK_FIELD_OPTION_POI_PHONE_WRONG";
          break;
        default:
          if (v14 <= 0x44C)
          {
            switch((int)v14)
            {
              case 501:
                id v65 = @"FEEDBACK_FIELD_OPTION_LOCALITY_NAME";
                break;
              case 502:
                id v65 = @"FEEDBACK_FIELD_OPTION_LOCALITY_PIN";
                break;
              case 503:
                id v65 = @"FEEDBACK_FIELD_OPTION_LOCALITY_ZIPCODE";
                break;
              case 504:
                id v65 = @"FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY";
                break;
              case 505:
                id v65 = @"FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_LARGE";
                break;
              case 506:
                id v65 = @"FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_SMALL";
                break;
              case 507:
                id v65 = @"FEEDBACK_FIELD_OPTION_LOCALITY_SOMETHING_ELSE";
                break;
              default:
                JUMPOUT(0);
            }
          }
          else
          {
            switch((int)v14)
            {
              case 1001:
                id v65 = @"FEEDBACK_FIELD_OPTION_ADDRESS_LOCATION";
                break;
              case 1002:
                id v65 = @"FEEDBACK_FIELD_OPTION_ADDRESS_WRONG";
                break;
              case 1003:
                id v65 = @"FEEDBACK_FIELD_OPTION_ADDRESS_SOMETHING_ELSE";
                break;
              case 1004:
                id v65 = @"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT";
                break;
              case 1005:
                id v65 = @"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_DRIVING";
                break;
              case 1006:
                id v65 = @"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_WALKING";
                break;
              case 1007:
                id v65 = @"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_BOTH";
                break;
              default:
                goto LABEL_134;
            }
          }
          break;
      }
    }
    goto LABEL_147;
  }
  if ((int)v14 <= 2100)
  {
    if ((int)v14 <= 2000)
    {
      switch((int)v14)
      {
        case 1701:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_STREET";
          break;
        case 1702:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_ADDRESS";
          break;
        case 1703:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN";
          break;
        case 1704:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_STOP_SIGN";
          break;
        case 1705:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_LIGHT";
          break;
        case 1706:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_CAMERA";
          break;
        case 1707:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_OTHER";
          break;
        case 1708:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_PLACE";
          break;
        case 1709:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_NEIGHBORHOOD";
          break;
        case 1710:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_TRANSIT_STOP";
          break;
        case 1711:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_BIKE_WALK_PATH";
          break;
        case 1712:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_SOMETHING_ELSE";
          break;
        case 1713:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_TRANSIT_LINE";
          break;
        case 1714:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN_LIGHT";
          break;
        case 1715:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_STREET_FEATURES";
          break;
        case 1716:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_STREET_SURFACE";
          break;
        case 1717:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_STREET_LANE";
          break;
        case 1718:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_STREET_CROSSWALK";
          break;
        case 1719:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_STREET_MEDIAN";
          break;
        case 1720:
          id v65 = @"FEEDBACK_FIELD_OPTION_ADD_MISSING_PATH_OR_TRAIL";
          break;
        default:
          switch((int)v14)
          {
            case 1301:
              id v65 = @"FEEDBACK_FIELD_OPTION_TRAIL_NAME_WRONG";
              break;
            case 1302:
              id v65 = @"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED";
              break;
            case 1303:
              id v65 = @"FEEDBACK_FIELD_OPTION_TRAIL_SOMETHING_ELSE";
              break;
            case 1304:
              id v65 = @"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_TEMPORARY";
              break;
            case 1305:
              id v65 = @"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_PERMANENT";
              break;
            case 1306:
              id v65 = @"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_UNSURE";
              break;
            default:
              goto LABEL_134;
          }
          break;
      }
      goto LABEL_147;
    }
    if ((int)v14 > 2050)
    {
      switch((int)v14)
      {
        case 2051:
          id v65 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_LANE_GUIDANCE";
          break;
        case 2052:
          id v65 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_TOO_LATE";
          break;
        case 2053:
          id v65 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_DRIVING_NOT_ALLOWED";
          break;
        case 2054:
          id v65 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_SAFE";
          break;
        default:
          goto LABEL_134;
      }
      goto LABEL_147;
    }
    switch(v14)
    {
      case 0x7D1:
        id v65 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_ALLOWED";
        goto LABEL_147;
      case 0x7D2:
        id v65 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_WRONG";
        goto LABEL_147;
      case 0x7D3:
        id v65 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_SOMETHING_ELSE";
        goto LABEL_147;
    }
    goto LABEL_134;
  }
  if ((int)v14 > 2500)
  {
    if ((int)v14 <= 2600)
    {
      switch((int)v14)
      {
        case 2501:
          id v65 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_NOT_RELEVANT";
          break;
        case 2502:
          id v65 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_INAPPROPRIATE";
          break;
        case 2503:
          id v65 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_IMAGE_QUALITY";
          break;
        case 2504:
          id v65 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_BUTTON";
          break;
        case 2505:
          id v65 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_PRIVACY_CONCERN";
          break;
        case 2506:
          id v65 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_LEGAL_ISSUE";
          break;
        case 2507:
          id v65 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_SOMETHING_ELSE";
          break;
        default:
          goto LABEL_134;
      }
    }
    else
    {
      switch((int)v14)
      {
        case 5000:
          id v65 = @"FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_ERROR";
          break;
        case 5001:
          id v65 = @"FEEDBACK_FIELD_OPTION_STOP_SIGN_ERROR";
          break;
        case 5002:
          id v65 = @"FEEDBACK_FIELD_OPTION_LIGHT_SIGN_WRONG";
          break;
        case 5003:
          id v65 = @"FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_MISSING";
          break;
        case 5004:
          id v65 = @"FEEDBACK_FIELD_OPTION_STOP_SIGN_MISSING";
          break;
        default:
          if (v14 != 10000) {
            goto LABEL_134;
          }
          id v65 = @"FEEDBACK_FIELD_OPTION_CHOICE";
          break;
      }
    }
    goto LABEL_147;
  }
  if ((int)v14 <= 2300)
  {
    switch((int)v14)
    {
      case 2201:
        id v65 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_ALLOWED";
        break;
      case 2202:
        id v65 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_SAFE";
        break;
      case 2203:
        id v65 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING";
        break;
      case 2204:
        id v65 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_ADD";
        break;
      case 2205:
        id v65 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_REMOVE";
        break;
      case 2206:
        id v65 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT";
        break;
      case 2207:
        id v65 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_ADD";
        break;
      case 2208:
        id v65 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_REMOVE";
        break;
      default:
        switch((int)v14)
        {
          case 2101:
            id v65 = @"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_LOCATION_WRONG";
            break;
          case 2102:
            id v65 = @"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE";
            break;
          case 2103:
            id v65 = @"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_DRIVING";
            break;
          case 2104:
            id v65 = @"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_WALKING";
            break;
          case 2105:
            id v65 = @"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_BOTH";
            break;
          case 2106:
            id v65 = @"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ADDRESS_WRONG";
            break;
          default:
            goto LABEL_134;
        }
        break;
    }
    goto LABEL_147;
  }
  if (v14 == 2301)
  {
    id v65 = @"FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_ALLOWED";
    goto LABEL_147;
  }
  if (v14 == 2302)
  {
    id v65 = @"FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_SAFE";
    goto LABEL_147;
  }
  if (v14 != 2401)
  {
LABEL_134:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
    id v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_147;
  }
  id v65 = @"FEEDBACK_FIELD_OPTION_TRANSIT_STEP_BETTER_ROUTE_AVAILABLE";
LABEL_147:
  objc_super v66 = [(GEORPFeedbackFormField *)v54 value];
  v67 = [v66 singleSelectField];
  v68 = [v67 selected];
  [v68 setDefaultText:v65];

  [(GEORPFeedbackDynamicForm *)v53 addFormFields:v54];
  id v17 = v94;
  if (v94)
  {
    v69 = objc_alloc_init(GEORPFeedbackFormField);
    [(GEORPFeedbackFormField *)v69 setName:2001];
    v70 = objc_alloc_init(GEORPFeedbackFieldValue);
    [(GEORPFeedbackFormField *)v69 setValue:v70];

    v71 = [(GEORPFeedbackFormField *)v69 value];
    [v71 setFieldValueType:3];

    v72 = objc_alloc_init(GEORPFeedbackTextField);
    v73 = [(GEORPFeedbackFormField *)v69 value];
    [v73 setTextField:v72];

    v74 = [(GEORPFeedbackFormField *)v69 value];
    v75 = [v74 textField];
    [v75 setEdited:v94];

    [(GEORPFeedbackDynamicForm *)v53 addFormFields:v69];
  }
  if (v18)
  {
    v76 = objc_alloc_init(GEORPFeedbackFormField);
    [(GEORPFeedbackFormField *)v76 setName:2002];
    v77 = objc_alloc_init(GEORPFeedbackFieldValue);
    [(GEORPFeedbackFormField *)v76 setValue:v77];

    v78 = [(GEORPFeedbackFormField *)v76 value];
    [v78 setFieldValueType:11];

    v79 = objc_alloc_init(GEORPFeedbackIntField);
    v80 = [(GEORPFeedbackFormField *)v76 value];
    [v80 setIntField:v79];

    uint64_t v81 = [v18 intValue];
    v82 = [(GEORPFeedbackFormField *)v76 value];
    v83 = [v82 intField];
    [v83 setEdited:v81];

    id v17 = v94;
    [(GEORPFeedbackDynamicForm *)v53 addFormFields:v76];
  }
  if (v19)
  {
    v84 = objc_alloc_init(GEORPFeedbackFormField);
    [(GEORPFeedbackFormField *)v84 setName:1];
    v85 = objc_alloc_init(GEORPFeedbackFieldValue);
    [(GEORPFeedbackFormField *)v84 setValue:v85];

    v86 = [(GEORPFeedbackFormField *)v84 value];
    [v86 setFieldValueType:3];

    v87 = objc_alloc_init(GEORPFeedbackTextField);
    v88 = [(GEORPFeedbackFormField *)v84 value];
    [v88 setTextField:v87];

    v89 = [(GEORPFeedbackFormField *)v84 value];
    v90 = [v89 textField];
    [v90 setEdited:v19];

    [(GEORPFeedbackDynamicForm *)v53 addFormFields:v84];
  }
  v91 = [(GEORPFeedbackRequestParameters *)v20 submissionParameters];
  [v91 setDynamicForm:v53];

  id v16 = v93;
LABEL_154:

  return v20;
}

- (GEORPFeedbackRequestParameters)initWithIncidentLocation:(id)a3 userLocation:(id)a4 type:(int)a5 historicalLocations:(id)a6 userPath:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v49.receiver = self;
  v49.super_class = (Class)GEORPFeedbackRequestParameters;
  id v16 = [(GEORPFeedbackRequestParameters *)&v49 init];
  if (v16)
  {
    id v17 = objc_alloc_init(GEORPFeedbackSubmissionParameters);
    [(GEORPFeedbackRequestParameters *)v16 setSubmissionParameters:v17];

    id v18 = [(GEORPFeedbackRequestParameters *)v16 submissionParameters];
    [v18 setType:11];

    id v19 = objc_alloc_init(GEORPFeedbackCommonContext);
    id v20 = [(GEORPFeedbackRequestParameters *)v16 submissionParameters];
    [v20 setCommonContext:v19];

    double Current = CFAbsoluteTimeGetCurrent();
    id v22 = [(GEORPFeedbackRequestParameters *)v16 submissionParameters];
    id v23 = [v22 commonContext];
    [v23 setClientCreatedAt:Current];

    id v24 = [(GEORPFeedbackRequestParameters *)v16 submissionParameters];
    id v25 = [v24 commonContext];
    [v25 recordEnvironmentAndManifestURLs];

    id v26 = objc_alloc_init(GEORPFeedbackDetails);
    v27 = [(GEORPFeedbackRequestParameters *)v16 submissionParameters];
    [v27 setDetails:v26];

    v28 = objc_alloc_init(GEORPIncidentFeedback);
    uint64_t v29 = [(GEORPFeedbackRequestParameters *)v16 submissionParameters];
    v30 = [v29 details];
    [v30 setIncidentFeedback:v28];

    id v31 = [(GEORPFeedbackRequestParameters *)v16 submissionParameters];
    id v32 = [v31 details];
    id v33 = [v32 incidentFeedback];
    [v33 setType:1];

    id v34 = objc_alloc_init(GEORPNewIncidentDetails);
    unint64_t v35 = objc_alloc_init(GEORPUserLocationDetails);
    [(GEORPNewIncidentDetails *)v34 setUserLocation:v35];

    v36 = [(GEORPNewIncidentDetails *)v34 userLocation];
    [v36 setCurrentUserLocation:v13];

    id v37 = (void *)[v14 mutableCopy];
    id v38 = [(GEORPNewIncidentDetails *)v34 userLocation];
    [v38 setDeviceHistoricalLocations:v37];

    [(GEORPNewIncidentDetails *)v34 setType:v9];
    uint64_t v39 = objc_alloc_init(GEORPIncidentLocation);
    [(GEORPNewIncidentDetails *)v34 setIncidentLocation:v39];

    v40 = [v12 latLng];
    id v41 = [(GEORPNewIncidentDetails *)v34 incidentLocation];
    [v41 setLatLng:v40];

    v42 = [(GEORPFeedbackRequestParameters *)v16 submissionParameters];
    v43 = [v42 details];
    v44 = [v43 incidentFeedback];
    [v44 setNewIncidentDetails:v34];

    v45 = [(GEORPFeedbackRequestParameters *)v16 submissionParameters];
    v46 = [v45 details];
    v47 = [v46 incidentFeedback];
    [v47 setUserPath:v15];
  }
  return v16;
}

- (GEORPFeedbackRequestParameters)initWithIncidentAnnotationDetails:(id)a3 userPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)GEORPFeedbackRequestParameters;
  unint64_t v8 = [(GEORPFeedbackRequestParameters *)&v31 init];
  if (v8)
  {
    uint64_t v9 = objc_alloc_init(GEORPFeedbackSubmissionParameters);
    [(GEORPFeedbackRequestParameters *)v8 setSubmissionParameters:v9];

    id v10 = [(GEORPFeedbackRequestParameters *)v8 submissionParameters];
    [v10 setType:11];

    uint64_t v11 = objc_alloc_init(GEORPFeedbackCommonContext);
    id v12 = [(GEORPFeedbackRequestParameters *)v8 submissionParameters];
    [v12 setCommonContext:v11];

    double Current = CFAbsoluteTimeGetCurrent();
    id v14 = [(GEORPFeedbackRequestParameters *)v8 submissionParameters];
    id v15 = [v14 commonContext];
    [v15 setClientCreatedAt:Current];

    id v16 = objc_alloc_init(GEORPFeedbackDetails);
    id v17 = [(GEORPFeedbackRequestParameters *)v8 submissionParameters];
    [v17 setDetails:v16];

    id v18 = objc_alloc_init(GEORPIncidentFeedback);
    id v19 = [(GEORPFeedbackRequestParameters *)v8 submissionParameters];
    id v20 = [v19 details];
    [v20 setIncidentFeedback:v18];

    v21 = [(GEORPFeedbackRequestParameters *)v8 submissionParameters];
    id v22 = [v21 details];
    id v23 = [v22 incidentFeedback];
    [v23 setType:2];

    id v24 = [(GEORPFeedbackRequestParameters *)v8 submissionParameters];
    id v25 = [v24 details];
    id v26 = [v25 incidentFeedback];
    [v26 setIncidentAnnotationDetails:v6];

    v27 = [(GEORPFeedbackRequestParameters *)v8 submissionParameters];
    v28 = [v27 details];
    uint64_t v29 = [v28 incidentFeedback];
    [v29 setUserPath:v7];
  }
  return v8;
}

@end