@interface GEORPThirdPartyPhotoSharingPreferenceUpdateResult
+ (BOOL)isValid:(id)a3;
- (BOOL)hasPreference;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPThirdPartyPhotoSharingPreference)preference;
- (GEORPThirdPartyPhotoSharingPreferenceUpdateResult)init;
- (GEORPThirdPartyPhotoSharingPreferenceUpdateResult)initWithData:(id)a3;
- (GEORPThirdPartyPhotoSharingPreferenceUpdateResult)initWithDictionary:(id)a3;
- (GEORPThirdPartyPhotoSharingPreferenceUpdateResult)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)errorsAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsErrors:(id)a3;
- (int)errors;
- (int)errorsAtIndex:(unint64_t)a3;
- (unint64_t)errorsCount;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readErrors;
- (void)_readPreference;
- (void)addErrors:(int)a3;
- (void)clearErrors;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setErrors:(int *)a3 count:(unint64_t)a4;
- (void)setPreference:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPThirdPartyPhotoSharingPreferenceUpdateResult

- (GEORPThirdPartyPhotoSharingPreferenceUpdateResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPThirdPartyPhotoSharingPreferenceUpdateResult;
  v2 = [(GEORPThirdPartyPhotoSharingPreferenceUpdateResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPThirdPartyPhotoSharingPreferenceUpdateResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPThirdPartyPhotoSharingPreferenceUpdateResult;
  v3 = [(GEORPThirdPartyPhotoSharingPreferenceUpdateResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORPThirdPartyPhotoSharingPreferenceUpdateResult;
  [(GEORPThirdPartyPhotoSharingPreferenceUpdateResult *)&v3 dealloc];
}

- (void)_readErrors
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPThirdPartyPhotoSharingPreferenceUpdateResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readErrors_tags_195);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (unint64_t)errorsCount
{
  return self->_errors.count;
}

- (int)errors
{
  return self->_errors.list;
}

- (void)clearErrors
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;

  PBRepeatedInt32Clear();
}

- (void)addErrors:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (int)errorsAtIndex:(unint64_t)a3
{
  -[GEORPThirdPartyPhotoSharingPreferenceUpdateResult _readErrors]((uint64_t)self);
  p_errors = &self->_errors;
  unint64_t count = self->_errors.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_errors->list[a3];
}

- (void)setErrors:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;

  MEMORY[0x1F4147390](&self->_errors, a3, a4);
}

- (id)errorsAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"THIRD_PARTY_PHOTO_SHARING_PREFERENCE_UPDATE_ERROR_OUTDATED";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"THIRD_PARTY_PHOTO_SHARING_PREFERENCE_UPDATE_ERROR_UNSPECIFIED";
  }
  return v4;
}

- (int)StringAsErrors:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"THIRD_PARTY_PHOTO_SHARING_PREFERENCE_UPDATE_ERROR_UNSPECIFIED"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"THIRD_PARTY_PHOTO_SHARING_PREFERENCE_UPDATE_ERROR_OUTDATED"];
  }

  return v4;
}

- (void)_readPreference
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPThirdPartyPhotoSharingPreferenceUpdateResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPreference_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasPreference
{
  return self->_preference != 0;
}

- (GEORPThirdPartyPhotoSharingPreference)preference
{
  -[GEORPThirdPartyPhotoSharingPreferenceUpdateResult _readPreference]((uint64_t)self);
  preference = self->_preference;

  return preference;
}

- (void)setPreference:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_preference, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPThirdPartyPhotoSharingPreferenceUpdateResult;
  int v4 = [(GEORPThirdPartyPhotoSharingPreferenceUpdateResult *)&v8 description];
  v5 = [(GEORPThirdPartyPhotoSharingPreferenceUpdateResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPThirdPartyPhotoSharingPreferenceUpdateResult _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[3])
    {
      v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v6 = a1 + 2;
      if (a1[3])
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(unsigned int *)(*v6 + 4 * v7);
          if (v8)
          {
            if (v8 == 1)
            {
              v9 = @"THIRD_PARTY_PHOTO_SHARING_PREFERENCE_UPDATE_ERROR_OUTDATED";
            }
            else
            {
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
              v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v9 = @"THIRD_PARTY_PHOTO_SHARING_PREFERENCE_UPDATE_ERROR_UNSPECIFIED";
          }
          [v5 addObject:v9];

          ++v7;
          objc_super v6 = a1 + 2;
        }
        while (v7 < a1[3]);
      }
      [v4 setObject:v5 forKey:@"errors"];
    }
    v10 = [a1 preference];
    v11 = v10;
    if (v10)
    {
      if (a2) {
        [v10 jsonRepresentation];
      }
      else {
      v12 = [v10 dictionaryRepresentation];
      }
      [v4 setObject:v12 forKey:@"preference"];
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
  return -[GEORPThirdPartyPhotoSharingPreferenceUpdateResult _dictionaryRepresentation:](self, 1);
}

- (GEORPThirdPartyPhotoSharingPreferenceUpdateResult)initWithDictionary:(id)a3
{
  return (GEORPThirdPartyPhotoSharingPreferenceUpdateResult *)-[GEORPThirdPartyPhotoSharingPreferenceUpdateResult _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_26;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_26;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"errors"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_20;
  }
  char v20 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v8) {
    goto LABEL_19;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v22 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;
        if ([v13 isEqualToString:@"THIRD_PARTY_PHOTO_SHARING_PREFERENCE_UPDATE_ERROR_UNSPECIFIED"])uint64_t v14 = 0; {
        else
        }
          uint64_t v14 = [v13 isEqualToString:@"THIRD_PARTY_PHOTO_SHARING_PREFERENCE_UPDATE_ERROR_OUTDATED"];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        uint64_t v14 = [v12 intValue];
      }
      [a1 addErrors:v14];
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v9);
LABEL_19:

  a3 = v20;
LABEL_20:

  v15 = [v5 objectForKeyedSubscript:@"preference"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [GEORPThirdPartyPhotoSharingPreference alloc];
    if (a3) {
      uint64_t v17 = [(GEORPThirdPartyPhotoSharingPreference *)v16 initWithJSON:v15];
    }
    else {
      uint64_t v17 = [(GEORPThirdPartyPhotoSharingPreference *)v16 initWithDictionary:v15];
    }
    v18 = (void *)v17;
    [a1 setPreference:v17];
  }
LABEL_26:

  return a1;
}

- (GEORPThirdPartyPhotoSharingPreferenceUpdateResult)initWithJSON:(id)a3
{
  return (GEORPThirdPartyPhotoSharingPreferenceUpdateResult *)-[GEORPThirdPartyPhotoSharingPreferenceUpdateResult _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_196_1;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_197_1;
    }
    GEORPThirdPartyPhotoSharingPreferenceUpdateResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEORPThirdPartyPhotoSharingPreference *)self->_preference readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPThirdPartyPhotoSharingPreferenceUpdateResultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPThirdPartyPhotoSharingPreferenceUpdateResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 7) == 0)
    {
      id v7 = self->_reader;
      objc_sync_enter(v7);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      uint64_t v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v9 writeData:v8];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v7);
      goto LABEL_9;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPThirdPartyPhotoSharingPreferenceUpdateResult *)self readAll:0];
  id v5 = v9;
  if (self->_errors.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v5 = v9;
      ++v6;
    }
    while (v6 < self->_errors.count);
  }
  if (self->_preference)
  {
    PBDataWriterWriteSubmessage();
LABEL_9:
    id v5 = v9;
  }
}

- (void)copyTo:(id)a3
{
  id v7 = (id *)a3;
  [(GEORPThirdPartyPhotoSharingPreferenceUpdateResult *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 12) = self->_readerMarkPos;
  *((_DWORD *)v7 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORPThirdPartyPhotoSharingPreferenceUpdateResult *)self errorsCount])
  {
    [v7 clearErrors];
    unint64_t v4 = [(GEORPThirdPartyPhotoSharingPreferenceUpdateResult *)self errorsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addErrors:", -[GEORPThirdPartyPhotoSharingPreferenceUpdateResult errorsAtIndex:](self, "errorsAtIndex:", i));
    }
  }
  if (self->_preference) {
    objc_msgSend(v7, "setPreference:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPThirdPartyPhotoSharingPreferenceUpdateResult *)self readAll:0];
    PBRepeatedInt32Copy();
    id v8 = [(GEORPThirdPartyPhotoSharingPreference *)self->_preference copyWithZone:a3];
    id v7 = (PBDataReader *)v5[5];
    v5[5] = v8;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPThirdPartyPhotoSharingPreferenceUpdateResultReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEORPThirdPartyPhotoSharingPreferenceUpdateResult *)self readAll:1],
        [v4 readAll:1],
        PBRepeatedInt32IsEqual()))
  {
    preference = self->_preference;
    if ((unint64_t)preference | v4[5]) {
      char v6 = -[GEORPThirdPartyPhotoSharingPreference isEqual:](preference, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  [(GEORPThirdPartyPhotoSharingPreferenceUpdateResult *)self readAll:1];
  uint64_t v3 = PBRepeatedInt32Hash();
  return [(GEORPThirdPartyPhotoSharingPreference *)self->_preference hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v10 = a3;
  [v10 readAll:0];
  uint64_t v4 = [v10 errorsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEORPThirdPartyPhotoSharingPreferenceUpdateResult addErrors:](self, "addErrors:", [v10 errorsAtIndex:i]);
  }
  preference = self->_preference;
  id v8 = v10;
  uint64_t v9 = v10[5];
  if (preference)
  {
    if (!v9) {
      goto LABEL_10;
    }
    -[GEORPThirdPartyPhotoSharingPreference mergeFrom:](preference, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_10;
    }
    -[GEORPThirdPartyPhotoSharingPreferenceUpdateResult setPreference:](self, "setPreference:");
  }
  id v8 = v10;
LABEL_10:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preference, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end