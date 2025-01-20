@interface GEORPIncidentFeedback
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIncidentAnnotationDetails;
- (BOOL)hasNewIncidentDetails;
- (BOOL)hasSiriContext;
- (BOOL)hasType;
- (BOOL)hasUserPath;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPIncidentAnnotationDetails)incidentAnnotationDetails;
- (GEORPIncidentFeedback)init;
- (GEORPIncidentFeedback)initWithData:(id)a3;
- (GEORPIncidentFeedback)initWithDictionary:(id)a3;
- (GEORPIncidentFeedback)initWithJSON:(id)a3;
- (GEORPIncidentUserPath)userPath;
- (GEORPNewIncidentDetails)newIncidentDetails;
- (GEORPSiriContext)siriContext;
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
- (void)_readIncidentAnnotationDetails;
- (void)_readNewIncidentDetails;
- (void)_readSiriContext;
- (void)_readUserPath;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIncidentAnnotationDetails:(id)a3;
- (void)setNewIncidentDetails:(id)a3;
- (void)setSiriContext:(id)a3;
- (void)setType:(int)a3;
- (void)setUserPath:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPIncidentFeedback

- (GEORPIncidentFeedback)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPIncidentFeedback;
  v2 = [(GEORPIncidentFeedback *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPIncidentFeedback)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPIncidentFeedback;
  v3 = [(GEORPIncidentFeedback *)&v7 initWithData:a3];
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
  if (flags) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53DAC68[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"INCIDENT_FEEDBACK_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NEW_INCIDENT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ANNOTATE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readNewIncidentDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPIncidentFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNewIncidentDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasNewIncidentDetails
{
  return self->_newIncidentDetails != 0;
}

- (GEORPNewIncidentDetails)newIncidentDetails
{
  -[GEORPIncidentFeedback _readNewIncidentDetails]((uint64_t)self);
  newIncidentDetails = self->_newIncidentDetails;

  return newIncidentDetails;
}

- (void)setNewIncidentDetails:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_newIncidentDetails, a3);
}

- (void)_readIncidentAnnotationDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPIncidentFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentAnnotationDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasIncidentAnnotationDetails
{
  return self->_incidentAnnotationDetails != 0;
}

- (GEORPIncidentAnnotationDetails)incidentAnnotationDetails
{
  -[GEORPIncidentFeedback _readIncidentAnnotationDetails]((uint64_t)self);
  incidentAnnotationDetails = self->_incidentAnnotationDetails;

  return incidentAnnotationDetails;
}

- (void)setIncidentAnnotationDetails:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_incidentAnnotationDetails, a3);
}

- (void)_readSiriContext
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPIncidentFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSiriContext_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSiriContext
{
  return self->_siriContext != 0;
}

- (GEORPSiriContext)siriContext
{
  -[GEORPIncidentFeedback _readSiriContext]((uint64_t)self);
  siriContext = self->_siriContext;

  return siriContext;
}

- (void)setSiriContext:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_siriContext, a3);
}

- (void)_readUserPath
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPIncidentFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserPath_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasUserPath
{
  return self->_userPath != 0;
}

- (GEORPIncidentUserPath)userPath
{
  -[GEORPIncidentFeedback _readUserPath]((uint64_t)self);
  userPath = self->_userPath;

  return userPath;
}

- (void)setUserPath:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_userPath, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPIncidentFeedback;
  int v4 = [(GEORPIncidentFeedback *)&v8 description];
  v5 = [(GEORPIncidentFeedback *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPIncidentFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v5 = *(int *)(a1 + 60);
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53DAC68[v5];
      }
      [v4 setObject:v6 forKey:@"type"];
    }
    objc_super v7 = (void *)[(id)a1 newIncidentDetails];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"newIncidentDetails";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"new_incident_details";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = [(id)a1 incidentAnnotationDetails];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"incidentAnnotationDetails";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"incident_annotation_details";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = [(id)a1 siriContext];
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"siriContext";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"siri_context";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = [(id)a1 userPath];
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"userPath";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"user_path";
      }
      [v4 setObject:v21 forKey:v22];
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
  return -[GEORPIncidentFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPIncidentFeedback)initWithDictionary:(id)a3
{
  return (GEORPIncidentFeedback *)-[GEORPIncidentFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_48;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_48;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"INCIDENT_FEEDBACK_TYPE_UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"NEW_INCIDENT"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"ANNOTATE"])
    {
      uint64_t v8 = 2;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_14:
    [a1 setType:v8];
  }

  if (a3) {
    v9 = @"newIncidentDetails";
  }
  else {
    v9 = @"new_incident_details";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [GEORPNewIncidentDetails alloc];
    if (a3) {
      uint64_t v12 = [(GEORPNewIncidentDetails *)v11 initWithJSON:v10];
    }
    else {
      uint64_t v12 = [(GEORPNewIncidentDetails *)v11 initWithDictionary:v10];
    }
    v13 = (void *)v12;
    [a1 setNewIncidentDetails:v12];
  }
  if (a3) {
    v14 = @"incidentAnnotationDetails";
  }
  else {
    v14 = @"incident_annotation_details";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [GEORPIncidentAnnotationDetails alloc];
    if (a3) {
      uint64_t v17 = [(GEORPIncidentAnnotationDetails *)v16 initWithJSON:v15];
    }
    else {
      uint64_t v17 = [(GEORPIncidentAnnotationDetails *)v16 initWithDictionary:v15];
    }
    v18 = (void *)v17;
    [a1 setIncidentAnnotationDetails:v17];
  }
  if (a3) {
    v19 = @"siriContext";
  }
  else {
    v19 = @"siri_context";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21 = [GEORPSiriContext alloc];
    if (a3) {
      uint64_t v22 = [(GEORPSiriContext *)v21 initWithJSON:v20];
    }
    else {
      uint64_t v22 = [(GEORPSiriContext *)v21 initWithDictionary:v20];
    }
    v23 = (void *)v22;
    [a1 setSiriContext:v22];
  }
  if (a3) {
    v24 = @"userPath";
  }
  else {
    v24 = @"user_path";
  }
  v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26 = [GEORPIncidentUserPath alloc];
    if (a3) {
      uint64_t v27 = [(GEORPIncidentUserPath *)v26 initWithJSON:v25];
    }
    else {
      uint64_t v27 = [(GEORPIncidentUserPath *)v26 initWithDictionary:v25];
    }
    v28 = (void *)v27;
    [a1 setUserPath:v27];
  }
LABEL_48:

  return a1;
}

- (GEORPIncidentFeedback)initWithJSON:(id)a3
{
  return (GEORPIncidentFeedback *)-[GEORPIncidentFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_162;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_163;
    }
    GEORPIncidentFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPIncidentFeedbackCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPIncidentFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPIncidentFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPIncidentFeedbackIsDirty((uint64_t)self) & 1) == 0)
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPIncidentFeedback *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_newIncidentDetails) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_incidentAnnotationDetails) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_siriContext) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_userPath) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPIncidentFeedback _readIncidentAnnotationDetails]((uint64_t)self);
  if ([(GEORPIncidentAnnotationDetails *)self->_incidentAnnotationDetails hasGreenTeaWithValue:v3])
  {
    return 1;
  }
  -[GEORPIncidentFeedback _readNewIncidentDetails]((uint64_t)self);
  newIncidentDetails = self->_newIncidentDetails;

  return [(GEORPNewIncidentDetails *)newIncidentDetails hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPIncidentFeedback *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 15) = self->_type;
    *((unsigned char *)v5 + 64) |= 1u;
  }
  if (self->_newIncidentDetails)
  {
    objc_msgSend(v5, "setNewIncidentDetails:");
    int v4 = v5;
  }
  if (self->_incidentAnnotationDetails)
  {
    objc_msgSend(v5, "setIncidentAnnotationDetails:");
    int v4 = v5;
  }
  if (self->_siriContext)
  {
    objc_msgSend(v5, "setSiriContext:");
    int v4 = v5;
  }
  if (self->_userPath)
  {
    objc_msgSend(v5, "setUserPath:");
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
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPIncidentFeedbackReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPIncidentFeedback *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_type;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  id v9 = [(GEORPNewIncidentDetails *)self->_newIncidentDetails copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEORPIncidentAnnotationDetails *)self->_incidentAnnotationDetails copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  id v13 = [(GEORPSiriContext *)self->_siriContext copyWithZone:a3];
  v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  id v15 = [(GEORPIncidentUserPath *)self->_userPath copyWithZone:a3];
  id v8 = *(id *)(v5 + 40);
  *(void *)(v5 + 40) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  [(GEORPIncidentFeedback *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_type != *((_DWORD *)v4 + 15)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  newIncidentDetails = self->_newIncidentDetails;
  if ((unint64_t)newIncidentDetails | *((void *)v4 + 3)
    && !-[GEORPNewIncidentDetails isEqual:](newIncidentDetails, "isEqual:"))
  {
    goto LABEL_15;
  }
  incidentAnnotationDetails = self->_incidentAnnotationDetails;
  if ((unint64_t)incidentAnnotationDetails | *((void *)v4 + 2))
  {
    if (!-[GEORPIncidentAnnotationDetails isEqual:](incidentAnnotationDetails, "isEqual:")) {
      goto LABEL_15;
    }
  }
  siriContext = self->_siriContext;
  if ((unint64_t)siriContext | *((void *)v4 + 4))
  {
    if (!-[GEORPSiriContext isEqual:](siriContext, "isEqual:")) {
      goto LABEL_15;
    }
  }
  userPath = self->_userPath;
  if ((unint64_t)userPath | *((void *)v4 + 5)) {
    char v9 = -[GEORPIncidentUserPath isEqual:](userPath, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  [(GEORPIncidentFeedback *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEORPNewIncidentDetails *)self->_newIncidentDetails hash] ^ v3;
  unint64_t v5 = [(GEORPIncidentAnnotationDetails *)self->_incidentAnnotationDetails hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEORPSiriContext *)self->_siriContext hash];
  return v6 ^ [(GEORPIncidentUserPath *)self->_userPath hash];
}

- (void)mergeFrom:(id)a3
{
  id v13 = (int *)a3;
  [v13 readAll:0];
  unint64_t v4 = v13;
  if (v13[16])
  {
    self->_type = v13[15];
    *(unsigned char *)&self->_flags |= 1u;
  }
  newIncidentDetails = self->_newIncidentDetails;
  uint64_t v6 = *((void *)v13 + 3);
  if (newIncidentDetails)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORPNewIncidentDetails mergeFrom:](newIncidentDetails, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORPIncidentFeedback setNewIncidentDetails:](self, "setNewIncidentDetails:");
  }
  unint64_t v4 = v13;
LABEL_9:
  incidentAnnotationDetails = self->_incidentAnnotationDetails;
  uint64_t v8 = *((void *)v4 + 2);
  if (incidentAnnotationDetails)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEORPIncidentAnnotationDetails mergeFrom:](incidentAnnotationDetails, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEORPIncidentFeedback setIncidentAnnotationDetails:](self, "setIncidentAnnotationDetails:");
  }
  unint64_t v4 = v13;
LABEL_15:
  siriContext = self->_siriContext;
  uint64_t v10 = *((void *)v4 + 4);
  if (siriContext)
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEORPSiriContext mergeFrom:](siriContext, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEORPIncidentFeedback setSiriContext:](self, "setSiriContext:");
  }
  unint64_t v4 = v13;
LABEL_21:
  userPath = self->_userPath;
  uint64_t v12 = *((void *)v4 + 5);
  if (userPath)
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEORPIncidentUserPath mergeFrom:](userPath, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEORPIncidentFeedback setUserPath:](self, "setUserPath:");
  }
  unint64_t v4 = v13;
LABEL_27:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPath, 0);
  objc_storeStrong((id *)&self->_siriContext, 0);
  objc_storeStrong((id *)&self->_newIncidentDetails, 0);
  objc_storeStrong((id *)&self->_incidentAnnotationDetails, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end