@interface GEORPProblemStatus
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCreationDate;
- (BOOL)hasDetails;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasNotification;
- (BOOL)hasProblemId;
- (BOOL)hasProblemResolution;
- (BOOL)hasProblemState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPDetails)details;
- (GEORPNotification)notification;
- (GEORPProblemStatus)init;
- (GEORPProblemStatus)initWithData:(id)a3;
- (GEORPProblemStatus)initWithDictionary:(id)a3;
- (GEORPProblemStatus)initWithJSON:(id)a3;
- (GEORPResolution)problemResolution;
- (NSString)problemId;
- (double)creationDate;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)problemStateAsString:(int)a3;
- (int)StringAsProblemState:(id)a3;
- (int)problemState;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDetails;
- (void)_readNotification;
- (void)_readProblemId;
- (void)_readProblemResolution;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCreationDate:(double)a3;
- (void)setDetails:(id)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setHasProblemState:(BOOL)a3;
- (void)setNotification:(id)a3;
- (void)setProblemId:(id)a3;
- (void)setProblemResolution:(id)a3;
- (void)setProblemState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPProblemStatus

- (GEORPProblemStatus)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPProblemStatus;
  v2 = [(GEORPProblemStatus *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPProblemStatus)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPProblemStatus;
  v3 = [(GEORPProblemStatus *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readProblemId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemStatusReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemId_tags_2918);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasProblemId
{
  return self->_problemId != 0;
}

- (NSString)problemId
{
  -[GEORPProblemStatus _readProblemId]((uint64_t)self);
  problemId = self->_problemId;

  return problemId;
}

- (void)setProblemId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_problemId, a3);
}

- (double)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasCreationDate
{
  return *(unsigned char *)&self->_flags & 1;
}

- (int)problemState
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_problemState;
  }
  else {
    return 1;
  }
}

- (void)setProblemState:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_problemState = a3;
}

- (void)setHasProblemState:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasProblemState
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)problemStateAsString:(int)a3
{
  if ((a3 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E6E30[a3 - 1];
  }

  return v3;
}

- (int)StringAsProblemState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unresolved"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Resolved"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Rejected"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NeedsAdditionalInformation"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ResolvedNotLive"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)_readProblemResolution
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemStatusReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemResolution_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasProblemResolution
{
  return self->_problemResolution != 0;
}

- (GEORPResolution)problemResolution
{
  -[GEORPProblemStatus _readProblemResolution]((uint64_t)self);
  problemResolution = self->_problemResolution;

  return problemResolution;
}

- (void)setProblemResolution:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_problemResolution, a3);
}

- (void)_readNotification
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemStatusReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNotification_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasNotification
{
  return self->_notification != 0;
}

- (GEORPNotification)notification
{
  -[GEORPProblemStatus _readNotification]((uint64_t)self);
  notification = self->_notification;

  return notification;
}

- (void)setNotification:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_notification, a3);
}

- (void)_readDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemStatusReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDetails_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasDetails
{
  return self->_details != 0;
}

- (GEORPDetails)details
{
  -[GEORPProblemStatus _readDetails]((uint64_t)self);
  details = self->_details;

  return details;
}

- (void)setDetails:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_details, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPProblemStatus;
  int v4 = [(GEORPProblemStatus *)&v8 description];
  v5 = [(GEORPProblemStatus *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemStatus _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 problemId];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"problemId";
      }
      else {
        objc_super v6 = @"problem_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    char v7 = *(unsigned char *)(a1 + 72);
    if (v7)
    {
      objc_super v8 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
      if (a2) {
        v9 = @"creationDate";
      }
      else {
        v9 = @"creation_date";
      }
      [v4 setObject:v8 forKey:v9];

      char v7 = *(unsigned char *)(a1 + 72);
    }
    if ((v7 & 2) != 0)
    {
      unsigned int v10 = *(_DWORD *)(a1 + 68) - 1;
      if (v10 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 68));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E53E6E30[v10];
      }
      if (a2) {
        v12 = @"problemState";
      }
      else {
        v12 = @"problem_state";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [(id)a1 problemResolution];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"problemResolution";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"problem_resolution";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = [(id)a1 notification];
    v18 = v17;
    if (v17)
    {
      if (a2) {
        [v17 jsonRepresentation];
      }
      else {
      v19 = [v17 dictionaryRepresentation];
      }
      [v4 setObject:v19 forKey:@"notification"];
    }
    v20 = [(id)a1 details];
    v21 = v20;
    if (v20)
    {
      if (a2) {
        [v20 jsonRepresentation];
      }
      else {
      v22 = [v20 dictionaryRepresentation];
      }
      [v4 setObject:v22 forKey:@"details"];
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
  return -[GEORPProblemStatus _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPProblemStatus)initWithDictionary:(id)a3
{
  return (GEORPProblemStatus *)-[GEORPProblemStatus _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_51;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_51;
  }
  if (a3) {
    objc_super v6 = @"problemId";
  }
  else {
    objc_super v6 = @"problem_id";
  }
  char v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [a1 setProblemId:v8];
  }
  if (a3) {
    v9 = @"creationDate";
  }
  else {
    v9 = @"creation_date";
  }
  unsigned int v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v10 doubleValue];
    objc_msgSend(a1, "setCreationDate:");
  }

  if (a3) {
    v11 = @"problemState";
  }
  else {
    v11 = @"problem_state";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v12;
    if ([v13 isEqualToString:@"Unresolved"])
    {
      uint64_t v14 = 1;
    }
    else if ([v13 isEqualToString:@"Resolved"])
    {
      uint64_t v14 = 2;
    }
    else if ([v13 isEqualToString:@"Rejected"])
    {
      uint64_t v14 = 3;
    }
    else if ([v13 isEqualToString:@"NeedsAdditionalInformation"])
    {
      uint64_t v14 = 4;
    }
    else if ([v13 isEqualToString:@"ResolvedNotLive"])
    {
      uint64_t v14 = 5;
    }
    else
    {
      uint64_t v14 = 1;
    }

    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v12 intValue];
LABEL_31:
    [a1 setProblemState:v14];
  }

  if (a3) {
    v15 = @"problemResolution";
  }
  else {
    v15 = @"problem_resolution";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [GEORPResolution alloc];
    if (a3) {
      uint64_t v18 = [(GEORPResolution *)v17 initWithJSON:v16];
    }
    else {
      uint64_t v18 = [(GEORPResolution *)v17 initWithDictionary:v16];
    }
    v19 = (void *)v18;
    [a1 setProblemResolution:v18];
  }
  v20 = [v5 objectForKeyedSubscript:@"notification"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21 = [GEORPNotification alloc];
    if (a3) {
      uint64_t v22 = [(GEORPNotification *)v21 initWithJSON:v20];
    }
    else {
      uint64_t v22 = [(GEORPNotification *)v21 initWithDictionary:v20];
    }
    v23 = (void *)v22;
    [a1 setNotification:v22];
  }
  v24 = [v5 objectForKeyedSubscript:@"details"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = [GEORPDetails alloc];
    if (a3) {
      uint64_t v26 = [(GEORPDetails *)v25 initWithJSON:v24];
    }
    else {
      uint64_t v26 = [(GEORPDetails *)v25 initWithDictionary:v24];
    }
    v27 = (void *)v26;
    [a1 setDetails:v26];
  }
LABEL_51:

  return a1;
}

- (GEORPProblemStatus)initWithJSON:(id)a3
{
  return (GEORPProblemStatus *)-[GEORPProblemStatus _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    char v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_2940;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_2941;
    }
    GEORPProblemStatusReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEORPResolution *)self->_problemResolution readAll:1];
    [(GEORPNotification *)self->_notification readAll:1];
    [(GEORPDetails *)self->_details readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPProblemStatusIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemStatusReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPProblemStatusIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    char v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPProblemStatus *)self readAll:0];
    if (self->_problemId) {
      PBDataWriterWriteStringField();
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteDoubleField();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_problemResolution) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_notification) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_details) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPProblemStatus _readDetails]((uint64_t)self);
  if ([(GEORPDetails *)self->_details hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPProblemStatus _readProblemResolution]((uint64_t)self);
  problemResolution = self->_problemResolution;

  return [(GEORPResolution *)problemResolution hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEORPProblemStatus *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_problemId) {
    objc_msgSend(v6, "setProblemId:");
  }
  char flags = (char)self->_flags;
  id v5 = v6;
  if (flags)
  {
    v6[2] = *(id *)&self->_creationDate;
    *((unsigned char *)v6 + 72) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 17) = self->_problemState;
    *((unsigned char *)v6 + 72) |= 2u;
  }
  if (self->_problemResolution)
  {
    objc_msgSend(v6, "setProblemResolution:");
    id v5 = v6;
  }
  if (self->_notification)
  {
    objc_msgSend(v6, "setNotification:");
    id v5 = v6;
  }
  if (self->_details)
  {
    objc_msgSend(v6, "setDetails:");
    id v5 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    char v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPProblemStatusReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPProblemStatus *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_problemId copyWithZone:a3];
  unsigned int v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(double *)(v5 + 16) = self->_creationDate;
    *(unsigned char *)(v5 + 72) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_problemState;
    *(unsigned char *)(v5 + 72) |= 2u;
  }
  id v12 = [(GEORPResolution *)self->_problemResolution copyWithZone:a3];
  id v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  id v14 = [(GEORPNotification *)self->_notification copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  id v16 = [(GEORPDetails *)self->_details copyWithZone:a3];
  id v8 = *(id *)(v5 + 24);
  *(void *)(v5 + 24) = v16;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  [(GEORPProblemStatus *)self readAll:1];
  [v4 readAll:1];
  problemId = self->_problemId;
  if ((unint64_t)problemId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](problemId, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_creationDate != *((double *)v4 + 2)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_20:
    char v9 = 0;
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_problemState != *((_DWORD *)v4 + 17)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_20;
  }
  problemResolution = self->_problemResolution;
  if ((unint64_t)problemResolution | *((void *)v4 + 6)
    && !-[GEORPResolution isEqual:](problemResolution, "isEqual:"))
  {
    goto LABEL_20;
  }
  notification = self->_notification;
  if ((unint64_t)notification | *((void *)v4 + 4))
  {
    if (!-[GEORPNotification isEqual:](notification, "isEqual:")) {
      goto LABEL_20;
    }
  }
  details = self->_details;
  if ((unint64_t)details | *((void *)v4 + 3)) {
    char v9 = -[GEORPDetails isEqual:](details, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  [(GEORPProblemStatus *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_problemId hash];
  char flags = (char)self->_flags;
  if (flags)
  {
    double creationDate = self->_creationDate;
    double v7 = -creationDate;
    if (creationDate >= 0.0) {
      double v7 = self->_creationDate;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((flags & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_problemState;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = v5 ^ v3 ^ v10 ^ [(GEORPResolution *)self->_problemResolution hash];
  unint64_t v12 = [(GEORPNotification *)self->_notification hash];
  return v11 ^ v12 ^ [(GEORPDetails *)self->_details hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v12 = a3;
  [v12 readAll:0];
  id v4 = v12;
  if (v12[5])
  {
    -[GEORPProblemStatus setProblemId:](self, "setProblemId:");
    id v4 = v12;
  }
  char v5 = *((unsigned char *)v4 + 72);
  if (v5)
  {
    self->_double creationDate = (double)v4[2];
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v4 + 72);
  }
  if ((v5 & 2) != 0)
  {
    self->_problemState = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_flags |= 2u;
  }
  problemResolution = self->_problemResolution;
  uint64_t v7 = v4[6];
  if (problemResolution)
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[GEORPResolution mergeFrom:](problemResolution, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[GEORPProblemStatus setProblemResolution:](self, "setProblemResolution:");
  }
  id v4 = v12;
LABEL_13:
  notification = self->_notification;
  uint64_t v9 = v4[4];
  if (notification)
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[GEORPNotification mergeFrom:](notification, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[GEORPProblemStatus setNotification:](self, "setNotification:");
  }
  id v4 = v12;
LABEL_19:
  details = self->_details;
  uint64_t v11 = v4[3];
  if (details)
  {
    if (!v11) {
      goto LABEL_25;
    }
    -[GEORPDetails mergeFrom:](details, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_25;
    }
    -[GEORPProblemStatus setDetails:](self, "setDetails:");
  }
  id v4 = v12;
LABEL_25:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_problemResolution, 0);
  objc_storeStrong((id *)&self->_problemId, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_details, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end