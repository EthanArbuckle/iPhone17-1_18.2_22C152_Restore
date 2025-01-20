@interface GEORPFeedbackSubmissionParameters
+ (BOOL)isValid:(id)a3;
- (BOOL)hasClientSubmissionUuid;
- (BOOL)hasCommonContext;
- (BOOL)hasCommonCorrections;
- (BOOL)hasDetails;
- (BOOL)hasDynamicForm;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasParentFeedbackId;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackCommonContext)commonContext;
- (GEORPFeedbackCommonCorrections)commonCorrections;
- (GEORPFeedbackDetails)details;
- (GEORPFeedbackDynamicForm)dynamicForm;
- (GEORPFeedbackSubmissionParameters)init;
- (GEORPFeedbackSubmissionParameters)initWithData:(id)a3;
- (GEORPFeedbackSubmissionParameters)initWithDictionary:(id)a3;
- (GEORPFeedbackSubmissionParameters)initWithJSON:(id)a3;
- (NSString)clientSubmissionUuid;
- (NSString)parentFeedbackId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readClientSubmissionUuid;
- (void)_readCommonContext;
- (void)_readCommonCorrections;
- (void)_readDetails;
- (void)_readDynamicForm;
- (void)_readParentFeedbackId;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setClientSubmissionUuid:(id)a3;
- (void)setCommonContext:(id)a3;
- (void)setCommonCorrections:(id)a3;
- (void)setDetails:(id)a3;
- (void)setDynamicForm:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setParentFeedbackId:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackSubmissionParameters

- (GEORPFeedbackSubmissionParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackSubmissionParameters;
  v2 = [(GEORPFeedbackSubmissionParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackSubmissionParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackSubmissionParameters;
  v3 = [(GEORPFeedbackSubmissionParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readClientSubmissionUuid
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientSubmissionUuid_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasClientSubmissionUuid
{
  return self->_clientSubmissionUuid != 0;
}

- (NSString)clientSubmissionUuid
{
  -[GEORPFeedbackSubmissionParameters _readClientSubmissionUuid]((uint64_t)self);
  clientSubmissionUuid = self->_clientSubmissionUuid;

  return clientSubmissionUuid;
}

- (void)setClientSubmissionUuid:(id)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  objc_storeStrong((id *)&self->_clientSubmissionUuid, a3);
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DBBA0[a3];
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

- (void)_readDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDetails_tags_2229);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDetails
{
  return self->_details != 0;
}

- (GEORPFeedbackDetails)details
{
  -[GEORPFeedbackSubmissionParameters _readDetails]((uint64_t)self);
  details = self->_details;

  return details;
}

- (void)setDetails:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_details, a3);
}

- (void)_readCommonContext
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCommonContext_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasCommonContext
{
  return self->_commonContext != 0;
}

- (GEORPFeedbackCommonContext)commonContext
{
  -[GEORPFeedbackSubmissionParameters _readCommonContext]((uint64_t)self);
  commonContext = self->_commonContext;

  return commonContext;
}

- (void)setCommonContext:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_commonContext, a3);
}

- (void)_readCommonCorrections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCommonCorrections_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasCommonCorrections
{
  return self->_commonCorrections != 0;
}

- (GEORPFeedbackCommonCorrections)commonCorrections
{
  -[GEORPFeedbackSubmissionParameters _readCommonCorrections]((uint64_t)self);
  commonCorrections = self->_commonCorrections;

  return commonCorrections;
}

- (void)setCommonCorrections:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_commonCorrections, a3);
}

- (void)_readParentFeedbackId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readParentFeedbackId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasParentFeedbackId
{
  return self->_parentFeedbackId != 0;
}

- (NSString)parentFeedbackId
{
  -[GEORPFeedbackSubmissionParameters _readParentFeedbackId]((uint64_t)self);
  parentFeedbackId = self->_parentFeedbackId;

  return parentFeedbackId;
}

- (void)setParentFeedbackId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_parentFeedbackId, a3);
}

- (void)_readDynamicForm
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackSubmissionParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDynamicForm_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDynamicForm
{
  return self->_dynamicForm != 0;
}

- (GEORPFeedbackDynamicForm)dynamicForm
{
  -[GEORPFeedbackSubmissionParameters _readDynamicForm]((uint64_t)self);
  dynamicForm = self->_dynamicForm;

  return dynamicForm;
}

- (void)setDynamicForm:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_dynamicForm, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackSubmissionParameters;
  int v4 = [(GEORPFeedbackSubmissionParameters *)&v8 description];
  v5 = [(GEORPFeedbackSubmissionParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackSubmissionParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 clientSubmissionUuid];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"clientSubmissionUuid";
      }
      else {
        objc_super v6 = @"client_submission_uuid";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if (*(_WORD *)(a1 + 88))
    {
      uint64_t v7 = *(int *)(a1 + 84);
      if (v7 >= 0x16)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v8 = off_1E53DBBA0[v7];
      }
      [v4 setObject:v8 forKey:@"type"];
    }
    v9 = [(id)a1 details];
    v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"details"];
    }
    v12 = [(id)a1 commonContext];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"commonContext";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"common_context";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = [(id)a1 commonCorrections];
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"commonCorrections";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"common_corrections";
      }
      [v4 setObject:v18 forKey:v19];
    }
    v20 = [(id)a1 parentFeedbackId];
    if (v20)
    {
      if (a2) {
        v21 = @"parentFeedbackId";
      }
      else {
        v21 = @"parent_feedback_id";
      }
      [v4 setObject:v20 forKey:v21];
    }

    v22 = [(id)a1 dynamicForm];
    v23 = v22;
    if (v22)
    {
      if (a2)
      {
        v24 = [v22 jsonRepresentation];
        v25 = @"dynamicForm";
      }
      else
      {
        v24 = [v22 dictionaryRepresentation];
        v25 = @"dynamic_form";
      }
      [v4 setObject:v24 forKey:v25];
    }
    v26 = *(void **)(a1 + 16);
    if (v26)
    {
      v27 = [v26 dictionaryRepresentation];
      v28 = v27;
      if (a2)
      {
        v29 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __63__GEORPFeedbackSubmissionParameters__dictionaryRepresentation___block_invoke;
        v33[3] = &unk_1E53D8860;
        id v30 = v29;
        id v34 = v30;
        [v28 enumerateKeysAndObjectsUsingBlock:v33];
        id v31 = v30;

        v28 = v31;
      }
      [v4 setObject:v28 forKey:@"Unknown Fields"];
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
  return -[GEORPFeedbackSubmissionParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __63__GEORPFeedbackSubmissionParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
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

- (GEORPFeedbackSubmissionParameters)initWithDictionary:(id)a3
{
  return (GEORPFeedbackSubmissionParameters *)-[GEORPFeedbackSubmissionParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_93;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_93;
  }
  if (a3) {
    objc_super v6 = @"clientSubmissionUuid";
  }
  else {
    objc_super v6 = @"client_submission_uuid";
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [a1 setClientSubmissionUuid:v8];
  }
  v9 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    if ([v10 isEqualToString:@"FEEDBACK_TYPE_UNKNOWN"])
    {
      uint64_t v11 = 0;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_OTHER"])
    {
      uint64_t v11 = 1;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_POI"])
    {
      uint64_t v11 = 2;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_TRANSIT_POI"])
    {
      uint64_t v11 = 3;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_ADDRESS"])
    {
      uint64_t v11 = 4;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_TILE"])
    {
      uint64_t v11 = 5;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_SEARCH"])
    {
      uint64_t v11 = 6;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_MERCHANT_LOOKUP"])
    {
      uint64_t v11 = 7;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_DIRECTIONS"])
    {
      uint64_t v11 = 8;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_GROUND_VIEW"])
    {
      uint64_t v11 = 9;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_POI_ENRICHMENT"])
    {
      uint64_t v11 = 10;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_INCIDENT"])
    {
      uint64_t v11 = 11;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_CURATED_COLLECTION"])
    {
      uint64_t v11 = 12;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_POI_IMAGE"])
    {
      uint64_t v11 = 13;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_POI_ACTIVITY"])
    {
      uint64_t v11 = 14;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_ADD_TO_MAP"])
    {
      uint64_t v11 = 15;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_LOCALITY"])
    {
      uint64_t v11 = 16;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_STREET"])
    {
      uint64_t v11 = 17;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_THIRD_PARTY_PHOTO_SHARING_PREFERENCE"])
    {
      uint64_t v11 = 18;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_PHOTO_ATTRIBUTION_PREFERENCE"])
    {
      uint64_t v11 = 19;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_RUNNING_TRACK"])
    {
      uint64_t v11 = 20;
    }
    else if ([v10 isEqualToString:@"FEEDBACK_TYPE_RAP_USER_RESPONSE"])
    {
      uint64_t v11 = 21;
    }
    else
    {
      uint64_t v11 = 0;
    }

    goto LABEL_57;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v9 intValue];
LABEL_57:
    [a1 setType:v11];
  }

  v12 = [v5 objectForKeyedSubscript:@"details"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [GEORPFeedbackDetails alloc];
    if (a3) {
      uint64_t v14 = [(GEORPFeedbackDetails *)v13 initWithJSON:v12];
    }
    else {
      uint64_t v14 = [(GEORPFeedbackDetails *)v13 initWithDictionary:v12];
    }
    v15 = (void *)v14;
    [a1 setDetails:v14];
  }
  if (a3) {
    v16 = @"commonContext";
  }
  else {
    v16 = @"common_context";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [GEORPFeedbackCommonContext alloc];
    if (a3) {
      uint64_t v19 = [(GEORPFeedbackCommonContext *)v18 initWithJSON:v17];
    }
    else {
      uint64_t v19 = [(GEORPFeedbackCommonContext *)v18 initWithDictionary:v17];
    }
    v20 = (void *)v19;
    [a1 setCommonContext:v19];
  }
  if (a3) {
    v21 = @"commonCorrections";
  }
  else {
    v21 = @"common_corrections";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23 = [GEORPFeedbackCommonCorrections alloc];
    if (a3) {
      uint64_t v24 = [(GEORPFeedbackCommonCorrections *)v23 initWithJSON:v22];
    }
    else {
      uint64_t v24 = [(GEORPFeedbackCommonCorrections *)v23 initWithDictionary:v22];
    }
    v25 = (void *)v24;
    [a1 setCommonCorrections:v24];
  }
  if (a3) {
    v26 = @"parentFeedbackId";
  }
  else {
    v26 = @"parent_feedback_id";
  }
  v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v28 = (void *)[v27 copy];
    [a1 setParentFeedbackId:v28];
  }
  if (a3) {
    v29 = @"dynamicForm";
  }
  else {
    v29 = @"dynamic_form";
  }
  id v30 = [v5 objectForKeyedSubscript:v29];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v31 = [GEORPFeedbackDynamicForm alloc];
    if (a3) {
      uint64_t v32 = [(GEORPFeedbackDynamicForm *)v31 initWithJSON:v30];
    }
    else {
      uint64_t v32 = [(GEORPFeedbackDynamicForm *)v31 initWithDictionary:v30];
    }
    v33 = (void *)v32;
    [a1 setDynamicForm:v32];
  }
LABEL_93:

  return a1;
}

- (GEORPFeedbackSubmissionParameters)initWithJSON:(id)a3
{
  return (GEORPFeedbackSubmissionParameters *)-[GEORPFeedbackSubmissionParameters _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_2264;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_2265;
    }
    GEORPFeedbackSubmissionParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPFeedbackSubmissionParametersCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackSubmissionParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackSubmissionParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPFeedbackSubmissionParametersIsDirty((uint64_t)self))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackSubmissionParameters *)self readAll:0];
    if (self->_clientSubmissionUuid) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (*(_WORD *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    if (self->_details)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_commonContext)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_commonCorrections)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_parentFeedbackId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_dynamicForm)
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
  -[GEORPFeedbackSubmissionParameters _readCommonContext]((uint64_t)self);
  if ([(GEORPFeedbackCommonContext *)self->_commonContext hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPFeedbackSubmissionParameters _readDetails]((uint64_t)self);
  if ([(GEORPFeedbackDetails *)self->_details hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPFeedbackSubmissionParameters _readDynamicForm]((uint64_t)self);
  dynamicForm = self->_dynamicForm;

  return [(GEORPFeedbackDynamicForm *)dynamicForm hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPFeedbackSubmissionParameters *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 18) = self->_readerMarkPos;
  *((_DWORD *)v5 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_clientSubmissionUuid) {
    objc_msgSend(v5, "setClientSubmissionUuid:");
  }
  int v4 = v5;
  if (*(_WORD *)&self->_flags)
  {
    *((_DWORD *)v5 + 21) = self->_type;
    *((_WORD *)v5 + 44) |= 1u;
  }
  if (self->_details)
  {
    objc_msgSend(v5, "setDetails:");
    int v4 = v5;
  }
  if (self->_commonContext)
  {
    objc_msgSend(v5, "setCommonContext:");
    int v4 = v5;
  }
  if (self->_commonCorrections)
  {
    objc_msgSend(v5, "setCommonCorrections:");
    int v4 = v5;
  }
  if (self->_parentFeedbackId)
  {
    objc_msgSend(v5, "setParentFeedbackId:");
    int v4 = v5;
  }
  if (self->_dynamicForm)
  {
    objc_msgSend(v5, "setDynamicForm:");
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
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPFeedbackSubmissionParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackSubmissionParameters *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_clientSubmissionUuid copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 84) = self->_type;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  id v11 = [(GEORPFeedbackDetails *)self->_details copyWithZone:a3];
  v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  id v13 = [(GEORPFeedbackCommonContext *)self->_commonContext copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  id v15 = [(GEORPFeedbackCommonCorrections *)self->_commonCorrections copyWithZone:a3];
  v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  uint64_t v17 = [(NSString *)self->_parentFeedbackId copyWithZone:a3];
  v18 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v17;

  id v19 = [(GEORPFeedbackDynamicForm *)self->_dynamicForm copyWithZone:a3];
  v20 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v19;

  v21 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEORPFeedbackSubmissionParameters *)self readAll:1];
  [v4 readAll:1];
  clientSubmissionUuid = self->_clientSubmissionUuid;
  if ((unint64_t)clientSubmissionUuid | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientSubmissionUuid, "isEqual:")) {
      goto LABEL_19;
    }
  }
  __int16 v6 = *((_WORD *)v4 + 44);
  if (*(_WORD *)&self->_flags)
  {
    if ((v6 & 1) == 0 || self->_type != *((_DWORD *)v4 + 21)) {
      goto LABEL_19;
    }
  }
  else if (v6)
  {
LABEL_19:
    char v12 = 0;
    goto LABEL_20;
  }
  details = self->_details;
  if ((unint64_t)details | *((void *)v4 + 6) && !-[GEORPFeedbackDetails isEqual:](details, "isEqual:")) {
    goto LABEL_19;
  }
  commonContext = self->_commonContext;
  if ((unint64_t)commonContext | *((void *)v4 + 4))
  {
    if (!-[GEORPFeedbackCommonContext isEqual:](commonContext, "isEqual:")) {
      goto LABEL_19;
    }
  }
  commonCorrections = self->_commonCorrections;
  if ((unint64_t)commonCorrections | *((void *)v4 + 5))
  {
    if (!-[GEORPFeedbackCommonCorrections isEqual:](commonCorrections, "isEqual:")) {
      goto LABEL_19;
    }
  }
  parentFeedbackId = self->_parentFeedbackId;
  if ((unint64_t)parentFeedbackId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](parentFeedbackId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  dynamicForm = self->_dynamicForm;
  if ((unint64_t)dynamicForm | *((void *)v4 + 7)) {
    char v12 = -[GEORPFeedbackDynamicForm isEqual:](dynamicForm, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_20:

  return v12;
}

- (unint64_t)hash
{
  [(GEORPFeedbackSubmissionParameters *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_clientSubmissionUuid hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_type;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  unint64_t v6 = [(GEORPFeedbackDetails *)self->_details hash];
  unint64_t v7 = v5 ^ v6 ^ [(GEORPFeedbackCommonContext *)self->_commonContext hash];
  unint64_t v8 = [(GEORPFeedbackCommonCorrections *)self->_commonCorrections hash];
  NSUInteger v9 = v8 ^ [(NSString *)self->_parentFeedbackId hash];
  return v7 ^ v9 ^ [(GEORPFeedbackDynamicForm *)self->_dynamicForm hash];
}

- (void)mergeFrom:(id)a3
{
  id v13 = a3;
  [v13 readAll:0];
  uint64_t v4 = v13;
  if (v13[3])
  {
    -[GEORPFeedbackSubmissionParameters setClientSubmissionUuid:](self, "setClientSubmissionUuid:");
    uint64_t v4 = v13;
  }
  if (v4[11])
  {
    self->_type = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 1u;
  }
  details = self->_details;
  uint64_t v6 = v4[6];
  if (details)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEORPFeedbackDetails mergeFrom:](details, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEORPFeedbackSubmissionParameters setDetails:](self, "setDetails:");
  }
  uint64_t v4 = v13;
LABEL_11:
  commonContext = self->_commonContext;
  uint64_t v8 = v4[4];
  if (commonContext)
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[GEORPFeedbackCommonContext mergeFrom:](commonContext, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[GEORPFeedbackSubmissionParameters setCommonContext:](self, "setCommonContext:");
  }
  uint64_t v4 = v13;
LABEL_17:
  commonCorrections = self->_commonCorrections;
  uint64_t v10 = v4[5];
  if (commonCorrections)
  {
    if (!v10) {
      goto LABEL_23;
    }
    -[GEORPFeedbackCommonCorrections mergeFrom:](commonCorrections, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_23;
    }
    -[GEORPFeedbackSubmissionParameters setCommonCorrections:](self, "setCommonCorrections:");
  }
  uint64_t v4 = v13;
LABEL_23:
  if (v4[8])
  {
    -[GEORPFeedbackSubmissionParameters setParentFeedbackId:](self, "setParentFeedbackId:");
    uint64_t v4 = v13;
  }
  dynamicForm = self->_dynamicForm;
  uint64_t v12 = v4[7];
  if (dynamicForm)
  {
    if (!v12) {
      goto LABEL_31;
    }
    -[GEORPFeedbackDynamicForm mergeFrom:](dynamicForm, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_31;
    }
    -[GEORPFeedbackSubmissionParameters setDynamicForm:](self, "setDynamicForm:");
  }
  uint64_t v4 = v13;
LABEL_31:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      NSUInteger v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackSubmissionParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2269);
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
  *(_WORD *)&self->_flags |= 0x102u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPFeedbackSubmissionParameters *)self readAll:0];
    [(GEORPFeedbackDetails *)self->_details clearUnknownFields:1];
    [(GEORPFeedbackCommonContext *)self->_commonContext clearUnknownFields:1];
    commonCorrections = self->_commonCorrections;
    [(GEORPFeedbackCommonCorrections *)commonCorrections clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentFeedbackId, 0);
  objc_storeStrong((id *)&self->_dynamicForm, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_commonCorrections, 0);
  objc_storeStrong((id *)&self->_commonContext, 0);
  objc_storeStrong((id *)&self->_clientSubmissionUuid, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end