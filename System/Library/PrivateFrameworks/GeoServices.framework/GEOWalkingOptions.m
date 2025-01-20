@interface GEOWalkingOptions
+ (BOOL)isValid:(id)a3;
- (BOOL)hasPreferredSpeed;
- (BOOL)hasWalkingUserPreferences;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOWalkingOptions)init;
- (GEOWalkingOptions)initWithData:(id)a3;
- (GEOWalkingOptions)initWithDictionary:(id)a3;
- (GEOWalkingOptions)initWithJSON:(id)a3;
- (GEOWalkingUserPreferences)walkingUserPreferences;
- (PBUnknownFields)unknownFields;
- (double)preferredSpeed;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)avoidedModesAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsAvoidedModes:(id)a3;
- (int)avoidedModeAtIndex:(unint64_t)a3;
- (int)avoidedModes;
- (unint64_t)avoidedModesCount;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAvoidedModes;
- (void)_readWalkingUserPreferences;
- (void)addAvoidedMode:(int)a3;
- (void)clearAvoidedModes;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAvoidedModes:(int *)a3 count:(unint64_t)a4;
- (void)setHasPreferredSpeed:(BOOL)a3;
- (void)setPreferredSpeed:(double)a3;
- (void)setWalkingUserPreferences:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWalkingOptions

- (void)setWalkingUserPreferences:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_walkingUserPreferences, a3);
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOWalkingOptions;
  [(GEOWalkingOptions *)&v3 dealloc];
}

- (GEOWalkingOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWalkingOptions;
  v2 = [(GEOWalkingOptions *)&v6 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOWalkingOptions *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteDoubleField();
    }
    id v5 = v9;
    if (self->_avoidedModes.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v9;
        ++v6;
      }
      while (v6 < self->_avoidedModes.count);
    }
    if (self->_walkingUserPreferences)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      v8 = (int *)&readAll__recursiveTag_8917;
    }
    else {
      v8 = (int *)&readAll__nonRecursiveTag_8918;
    }
    GEOWalkingOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOWalkingUserPreferences *)self->_walkingUserPreferences readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingUserPreferences, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOWalkingOptions)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWalkingOptions;
  BOOL v3 = [(GEOWalkingOptions *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (double)preferredSpeed
{
  return self->_preferredSpeed;
}

- (void)setPreferredSpeed:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_preferredSpeed = a3;
}

- (void)setHasPreferredSpeed:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasPreferredSpeed
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readAvoidedModes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWalkingOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAvoidedModes_tags_8903);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)avoidedModesCount
{
  return self->_avoidedModes.count;
}

- (int)avoidedModes
{
  return self->_avoidedModes.list;
}

- (void)clearAvoidedModes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  PBRepeatedInt32Clear();
}

- (void)addAvoidedMode:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (int)avoidedModeAtIndex:(unint64_t)a3
{
  -[GEOWalkingOptions _readAvoidedModes]((uint64_t)self);
  p_avoidedModes = &self->_avoidedModes;
  unint64_t count = self->_avoidedModes.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_avoidedModes->list[a3];
}

- (void)setAvoidedModes:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  MEMORY[0x1F4147390](&self->_avoidedModes, a3, a4);
}

- (id)avoidedModesAsString:(int)a3
{
  if (a3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = @"AVOID_FERRY";
  }
  return v4;
}

- (int)StringAsAvoidedModes:(id)a3
{
  return 0;
}

- (void)_readWalkingUserPreferences
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWalkingOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWalkingUserPreferences_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasWalkingUserPreferences
{
  return self->_walkingUserPreferences != 0;
}

- (GEOWalkingUserPreferences)walkingUserPreferences
{
  -[GEOWalkingOptions _readWalkingUserPreferences]((uint64_t)self);
  walkingUserPreferences = self->_walkingUserPreferences;

  return walkingUserPreferences;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWalkingOptions;
  v4 = [(GEOWalkingOptions *)&v8 description];
  id v5 = [(GEOWalkingOptions *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWalkingOptions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 76))
    {
      id v5 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
      if (a2) {
        unint64_t v6 = @"preferredSpeed";
      }
      else {
        unint64_t v6 = @"preferred_speed";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (*(void *)(a1 + 32))
    {
      objc_super v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v8 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v9 = 0;
        do
        {
          uint64_t v10 = *(unsigned int *)(*v8 + 4 * v9);
          if (v10)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
            v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v11 = @"AVOID_FERRY";
          }
          [v7 addObject:v11];

          ++v9;
          objc_super v8 = (void *)(a1 + 24);
        }
        while (v9 < *(void *)(a1 + 32));
      }
      if (a2) {
        v12 = @"avoidedMode";
      }
      else {
        v12 = @"avoided_mode";
      }
      [v4 setObject:v7 forKey:v12];
    }
    v13 = [(id)a1 walkingUserPreferences];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"walkingUserPreferences";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"walking_user_preferences";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = *(void **)(a1 + 16);
    if (v17)
    {
      v18 = [v17 dictionaryRepresentation];
      v19 = v18;
      if (a2)
      {
        v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __47__GEOWalkingOptions__dictionaryRepresentation___block_invoke;
        v24[3] = &unk_1E53D8860;
        id v21 = v20;
        id v25 = v21;
        [v19 enumerateKeysAndObjectsUsingBlock:v24];
        id v22 = v21;

        v19 = v22;
      }
      [v4 setObject:v19 forKey:@"Unknown Fields"];
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
  return -[GEOWalkingOptions _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOWalkingOptions__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    unint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOWalkingOptions)initWithDictionary:(id)a3
{
  return (GEOWalkingOptions *)-[GEOWalkingOptions _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        unint64_t v6 = @"preferredSpeed";
      }
      else {
        unint64_t v6 = @"preferred_speed";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 doubleValue];
        objc_msgSend(a1, "setPreferredSpeed:");
      }

      if (a3) {
        objc_super v8 = @"avoidedMode";
      }
      else {
        objc_super v8 = @"avoided_mode";
      }
      unint64_t v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = v5;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (!v11) {
          goto LABEL_24;
        }
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v25;
        while (1)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v15 isEqualToString:@"AVOID_FERRY"];
              uint64_t v16 = 0;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v16 = [v15 intValue];
            }
            [a1 addAvoidedMode:v16];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (!v12)
          {
LABEL_24:

            id v5 = v23;
            break;
          }
        }
      }

      if (a3) {
        v17 = @"walkingUserPreferences";
      }
      else {
        v17 = @"walking_user_preferences";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [GEOWalkingUserPreferences alloc];
        if (a3) {
          uint64_t v20 = [(GEOWalkingUserPreferences *)v19 initWithJSON:v18];
        }
        else {
          uint64_t v20 = [(GEOWalkingUserPreferences *)v19 initWithDictionary:v18];
        }
        id v21 = (void *)v20;
        [a1 setWalkingUserPreferences:v20];
      }
    }
  }

  return a1;
}

- (GEOWalkingOptions)initWithJSON:(id)a3
{
  return (GEOWalkingOptions *)-[GEOWalkingOptions _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWalkingOptionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWalkingOptionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  objc_super v7 = (id *)a3;
  [(GEOWalkingOptions *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 16) = self->_readerMarkPos;
  *((_DWORD *)v7 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    v7[6] = *(id *)&self->_preferredSpeed;
    *((unsigned char *)v7 + 76) |= 1u;
  }
  if ([(GEOWalkingOptions *)self avoidedModesCount])
  {
    [v7 clearAvoidedModes];
    unint64_t v4 = [(GEOWalkingOptions *)self avoidedModesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addAvoidedMode:", -[GEOWalkingOptions avoidedModeAtIndex:](self, "avoidedModeAtIndex:", i));
    }
  }
  if (self->_walkingUserPreferences) {
    objc_msgSend(v7, "setWalkingUserPreferences:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOWalkingOptionsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWalkingOptions *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 48) = self->_preferredSpeed;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  PBRepeatedInt32Copy();
  id v9 = [(GEOWalkingUserPreferences *)self->_walkingUserPreferences copyWithZone:a3];
  id v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  uint64_t v11 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  [(GEOWalkingOptions *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_preferredSpeed != *((double *)v4 + 6)) {
      goto LABEL_10;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_10;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_10:
    char v6 = 0;
    goto LABEL_11;
  }
  walkingUserPreferences = self->_walkingUserPreferences;
  if ((unint64_t)walkingUserPreferences | *((void *)v4 + 7)) {
    char v6 = -[GEOWalkingUserPreferences isEqual:](walkingUserPreferences, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_11:

  return v6;
}

- (unint64_t)hash
{
  [(GEOWalkingOptions *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    double preferredSpeed = self->_preferredSpeed;
    double v5 = -preferredSpeed;
    if (preferredSpeed >= 0.0) {
      double v5 = self->_preferredSpeed;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  uint64_t v8 = PBRepeatedInt32Hash() ^ v3;
  return v8 ^ [(GEOWalkingUserPreferences *)self->_walkingUserPreferences hash];
}

- (void)mergeFrom:(id)a3
{
  id v10 = (double *)a3;
  [v10 readAll:0];
  if (*((unsigned char *)v10 + 76))
  {
    self->_double preferredSpeed = v10[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
  uint64_t v4 = [v10 avoidedModesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOWalkingOptions addAvoidedMode:](self, "addAvoidedMode:", [v10 avoidedModeAtIndex:i]);
  }
  walkingUserPreferences = self->_walkingUserPreferences;
  uint64_t v8 = v10;
  uint64_t v9 = *((void *)v10 + 7);
  if (walkingUserPreferences)
  {
    if (!v9) {
      goto LABEL_12;
    }
    -[GEOWalkingUserPreferences mergeFrom:](walkingUserPreferences, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_12;
    }
    -[GEOWalkingOptions setWalkingUserPreferences:](self, "setWalkingUserPreferences:");
  }
  uint64_t v8 = v10;
LABEL_12:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOWalkingOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_8922);
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
  *(unsigned char *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOWalkingOptions *)self readAll:0];
    walkingUserPreferences = self->_walkingUserPreferences;
    [(GEOWalkingUserPreferences *)walkingUserPreferences clearUnknownFields:1];
  }
}

@end