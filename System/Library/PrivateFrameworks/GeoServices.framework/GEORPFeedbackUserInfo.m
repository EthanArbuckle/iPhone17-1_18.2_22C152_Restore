@interface GEORPFeedbackUserInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAnonUserInfo;
- (BOOL)hasDevicePushToken;
- (BOOL)hasPreferredEmail;
- (BOOL)hasRolloverInfo;
- (BOOL)hasTdmUserInfo;
- (BOOL)hasUgcUserId;
- (BOOL)hasUserCredentials;
- (BOOL)hasUserEmail;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPAppAttestInfo)anonUserInfo;
- (GEORPAppAttestInfo)rolloverInfo;
- (GEORPFeedbackUserInfo)init;
- (GEORPFeedbackUserInfo)initWithData:(id)a3;
- (GEORPFeedbackUserInfo)initWithDictionary:(id)a3;
- (GEORPFeedbackUserInfo)initWithJSON:(id)a3;
- (GEORPTdmInfo)tdmUserInfo;
- (GEORPUserCredentials)userCredentials;
- (NSData)devicePushToken;
- (NSString)preferredEmail;
- (NSString)ugcUserId;
- (NSString)userEmail;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAnonUserInfo;
- (void)_readDevicePushToken;
- (void)_readPreferredEmail;
- (void)_readRolloverInfo;
- (void)_readTdmUserInfo;
- (void)_readUgcUserId;
- (void)_readUserCredentials;
- (void)_readUserEmail;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAnonUserInfo:(id)a3;
- (void)setDevicePushToken:(id)a3;
- (void)setPreferredEmail:(id)a3;
- (void)setRolloverInfo:(id)a3;
- (void)setTdmUserInfo:(id)a3;
- (void)setUgcUserId:(id)a3;
- (void)setUserCredentials:(id)a3;
- (void)setUserEmail:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackUserInfo

- (GEORPFeedbackUserInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackUserInfo;
  v2 = [(GEORPFeedbackUserInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackUserInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackUserInfo;
  v3 = [(GEORPFeedbackUserInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readUserCredentials
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackUserInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserCredentials_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasUserCredentials
{
  return self->_userCredentials != 0;
}

- (GEORPUserCredentials)userCredentials
{
  -[GEORPFeedbackUserInfo _readUserCredentials]((uint64_t)self);
  userCredentials = self->_userCredentials;

  return userCredentials;
}

- (void)setUserCredentials:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_userCredentials, a3);
}

- (void)_readDevicePushToken
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackUserInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDevicePushToken_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasDevicePushToken
{
  return self->_devicePushToken != 0;
}

- (NSData)devicePushToken
{
  -[GEORPFeedbackUserInfo _readDevicePushToken]((uint64_t)self);
  devicePushToken = self->_devicePushToken;

  return devicePushToken;
}

- (void)setDevicePushToken:(id)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  objc_storeStrong((id *)&self->_devicePushToken, a3);
}

- (void)_readUserEmail
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackUserInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserEmail_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasUserEmail
{
  return self->_userEmail != 0;
}

- (NSString)userEmail
{
  -[GEORPFeedbackUserInfo _readUserEmail]((uint64_t)self);
  userEmail = self->_userEmail;

  return userEmail;
}

- (void)setUserEmail:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_userEmail, a3);
}

- (void)_readPreferredEmail
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackUserInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPreferredEmail_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasPreferredEmail
{
  return self->_preferredEmail != 0;
}

- (NSString)preferredEmail
{
  -[GEORPFeedbackUserInfo _readPreferredEmail]((uint64_t)self);
  preferredEmail = self->_preferredEmail;

  return preferredEmail;
}

- (void)setPreferredEmail:(id)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  objc_storeStrong((id *)&self->_preferredEmail, a3);
}

- (void)_readUgcUserId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackUserInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUgcUserId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasUgcUserId
{
  return self->_ugcUserId != 0;
}

- (NSString)ugcUserId
{
  -[GEORPFeedbackUserInfo _readUgcUserId]((uint64_t)self);
  ugcUserId = self->_ugcUserId;

  return ugcUserId;
}

- (void)setUgcUserId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_ugcUserId, a3);
}

- (void)_readAnonUserInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackUserInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnonUserInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasAnonUserInfo
{
  return self->_anonUserInfo != 0;
}

- (GEORPAppAttestInfo)anonUserInfo
{
  -[GEORPFeedbackUserInfo _readAnonUserInfo]((uint64_t)self);
  anonUserInfo = self->_anonUserInfo;

  return anonUserInfo;
}

- (void)setAnonUserInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  objc_storeStrong((id *)&self->_anonUserInfo, a3);
}

- (void)_readRolloverInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackUserInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRolloverInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasRolloverInfo
{
  return self->_rolloverInfo != 0;
}

- (GEORPAppAttestInfo)rolloverInfo
{
  -[GEORPFeedbackUserInfo _readRolloverInfo]((uint64_t)self);
  rolloverInfo = self->_rolloverInfo;

  return rolloverInfo;
}

- (void)setRolloverInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_rolloverInfo, a3);
}

- (void)_readTdmUserInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackUserInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTdmUserInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasTdmUserInfo
{
  return self->_tdmUserInfo != 0;
}

- (GEORPTdmInfo)tdmUserInfo
{
  -[GEORPFeedbackUserInfo _readTdmUserInfo]((uint64_t)self);
  tdmUserInfo = self->_tdmUserInfo;

  return tdmUserInfo;
}

- (void)setTdmUserInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  objc_storeStrong((id *)&self->_tdmUserInfo, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackUserInfo;
  v4 = [(GEORPFeedbackUserInfo *)&v8 description];
  v5 = [(GEORPFeedbackUserInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackUserInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 userCredentials];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"userCredentials";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"user_credentials";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 devicePushToken];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 base64EncodedStringWithOptions:0];
        [v4 setObject:v11 forKey:@"devicePushToken"];
      }
      else
      {
        [v4 setObject:v9 forKey:@"device_push_token"];
      }
    }

    v12 = [a1 userEmail];
    if (v12)
    {
      if (a2) {
        v13 = @"userEmail";
      }
      else {
        v13 = @"user_email";
      }
      [v4 setObject:v12 forKey:v13];
    }

    v14 = [a1 preferredEmail];
    if (v14)
    {
      if (a2) {
        v15 = @"preferredEmail";
      }
      else {
        v15 = @"preferred_email";
      }
      [v4 setObject:v14 forKey:v15];
    }

    v16 = [a1 ugcUserId];
    if (v16)
    {
      if (a2) {
        v17 = @"ugcUserId";
      }
      else {
        v17 = @"ugc_user_id";
      }
      [v4 setObject:v16 forKey:v17];
    }

    v18 = [a1 anonUserInfo];
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"anonUserInfo";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"anon_user_info";
      }
      [v4 setObject:v20 forKey:v21];
    }
    v22 = [a1 rolloverInfo];
    v23 = v22;
    if (v22)
    {
      if (a2)
      {
        v24 = [v22 jsonRepresentation];
        v25 = @"rolloverInfo";
      }
      else
      {
        v24 = [v22 dictionaryRepresentation];
        v25 = @"rollover_info";
      }
      [v4 setObject:v24 forKey:v25];
    }
    v26 = [a1 tdmUserInfo];
    v27 = v26;
    if (v26)
    {
      if (a2)
      {
        v28 = [v26 jsonRepresentation];
        v29 = @"tdmUserInfo";
      }
      else
      {
        v28 = [v26 dictionaryRepresentation];
        v29 = @"tdm_user_info";
      }
      [v4 setObject:v28 forKey:v29];
    }
    v30 = (void *)a1[2];
    if (v30)
    {
      v31 = [v30 dictionaryRepresentation];
      v32 = v31;
      if (a2)
      {
        v33 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __51__GEORPFeedbackUserInfo__dictionaryRepresentation___block_invoke;
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
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackUserInfo _dictionaryRepresentation:](self, 1);
}

void __51__GEORPFeedbackUserInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackUserInfo)initWithDictionary:(id)a3
{
  return (GEORPFeedbackUserInfo *)-[GEORPFeedbackUserInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"userCredentials";
      }
      else {
        objc_super v6 = @"user_credentials";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEORPUserCredentials alloc];
        if (a3) {
          uint64_t v9 = [(GEORPUserCredentials *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEORPUserCredentials *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setUserCredentials:v9];
      }
      if (a3) {
        v11 = @"devicePushToken";
      }
      else {
        v11 = @"device_push_token";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v12 options:0];
        [a1 setDevicePushToken:v13];
      }
      if (a3) {
        v14 = @"userEmail";
      }
      else {
        v14 = @"user_email";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = (void *)[v15 copy];
        [a1 setUserEmail:v16];
      }
      if (a3) {
        v17 = @"preferredEmail";
      }
      else {
        v17 = @"preferred_email";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = (void *)[v18 copy];
        [a1 setPreferredEmail:v19];
      }
      if (a3) {
        v20 = @"ugcUserId";
      }
      else {
        v20 = @"ugc_user_id";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = (void *)[v21 copy];
        [a1 setUgcUserId:v22];
      }
      if (a3) {
        v23 = @"anonUserInfo";
      }
      else {
        v23 = @"anon_user_info";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = [GEORPAppAttestInfo alloc];
        if (a3) {
          uint64_t v26 = [(GEORPAppAttestInfo *)v25 initWithJSON:v24];
        }
        else {
          uint64_t v26 = [(GEORPAppAttestInfo *)v25 initWithDictionary:v24];
        }
        v27 = (void *)v26;
        [a1 setAnonUserInfo:v26];
      }
      if (a3) {
        v28 = @"rolloverInfo";
      }
      else {
        v28 = @"rollover_info";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v30 = [GEORPAppAttestInfo alloc];
        if (a3) {
          uint64_t v31 = [(GEORPAppAttestInfo *)v30 initWithJSON:v29];
        }
        else {
          uint64_t v31 = [(GEORPAppAttestInfo *)v30 initWithDictionary:v29];
        }
        v32 = (void *)v31;
        [a1 setRolloverInfo:v31];
      }
      if (a3) {
        v33 = @"tdmUserInfo";
      }
      else {
        v33 = @"tdm_user_info";
      }
      id v34 = [v5 objectForKeyedSubscript:v33];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v35 = [GEORPTdmInfo alloc];
        if (a3) {
          uint64_t v36 = [(GEORPTdmInfo *)v35 initWithJSON:v34];
        }
        else {
          uint64_t v36 = [(GEORPTdmInfo *)v35 initWithDictionary:v34];
        }
        v37 = (void *)v36;
        [a1 setTdmUserInfo:v36];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackUserInfo)initWithJSON:(id)a3
{
  return (GEORPFeedbackUserInfo *)-[GEORPFeedbackUserInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_2473;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_2474;
    }
    GEORPFeedbackUserInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPFeedbackUserInfoCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackUserInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackUserInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPFeedbackUserInfoIsDirty((uint64_t)self))
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
    [(GEORPFeedbackUserInfo *)self readAll:0];
    if (self->_userCredentials) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_devicePushToken)
    {
      PBDataWriterWriteDataField();
      id v5 = v8;
    }
    if (self->_userEmail)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_preferredEmail)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_ugcUserId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_anonUserInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_rolloverInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_tdmUserInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPFeedbackUserInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 22) = self->_readerMarkPos;
  *((_DWORD *)v5 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_userCredentials) {
    objc_msgSend(v5, "setUserCredentials:");
  }
  if (self->_devicePushToken) {
    objc_msgSend(v5, "setDevicePushToken:");
  }
  v4 = v5;
  if (self->_userEmail)
  {
    objc_msgSend(v5, "setUserEmail:");
    v4 = v5;
  }
  if (self->_preferredEmail)
  {
    objc_msgSend(v5, "setPreferredEmail:");
    v4 = v5;
  }
  if (self->_ugcUserId)
  {
    objc_msgSend(v5, "setUgcUserId:");
    v4 = v5;
  }
  if (self->_anonUserInfo)
  {
    objc_msgSend(v5, "setAnonUserInfo:");
    v4 = v5;
  }
  if (self->_rolloverInfo)
  {
    objc_msgSend(v5, "setRolloverInfo:");
    v4 = v5;
  }
  if (self->_tdmUserInfo)
  {
    objc_msgSend(v5, "setTdmUserInfo:");
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
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackUserInfo *)self readAll:0];
    id v8 = [(GEORPUserCredentials *)self->_userCredentials copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v8;

    uint64_t v10 = [(NSData *)self->_devicePushToken copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    uint64_t v12 = [(NSString *)self->_userEmail copyWithZone:a3];
    v13 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v12;

    uint64_t v14 = [(NSString *)self->_preferredEmail copyWithZone:a3];
    v15 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v14;

    uint64_t v16 = [(NSString *)self->_ugcUserId copyWithZone:a3];
    v17 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v16;

    id v18 = [(GEORPAppAttestInfo *)self->_anonUserInfo copyWithZone:a3];
    v19 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v18;

    id v20 = [(GEORPAppAttestInfo *)self->_rolloverInfo copyWithZone:a3];
    v21 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v20;

    id v22 = [(GEORPTdmInfo *)self->_tdmUserInfo copyWithZone:a3];
    v23 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v22;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPFeedbackUserInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEORPFeedbackUserInfo *)self readAll:1];
  [v4 readAll:1];
  userCredentials = self->_userCredentials;
  if ((unint64_t)userCredentials | v4[9])
  {
    if (!-[GEORPUserCredentials isEqual:](userCredentials, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (((devicePushToken = self->_devicePushToken, !((unint64_t)devicePushToken | v4[4]))
     || -[NSData isEqual:](devicePushToken, "isEqual:"))
    && ((userEmail = self->_userEmail, !((unint64_t)userEmail | v4[10]))
     || -[NSString isEqual:](userEmail, "isEqual:"))
    && ((preferredEmail = self->_preferredEmail, !((unint64_t)preferredEmail | v4[5]))
     || -[NSString isEqual:](preferredEmail, "isEqual:"))
    && ((ugcUserId = self->_ugcUserId, !((unint64_t)ugcUserId | v4[8]))
     || -[NSString isEqual:](ugcUserId, "isEqual:"))
    && ((anonUserInfo = self->_anonUserInfo, !((unint64_t)anonUserInfo | v4[3]))
     || -[GEORPAppAttestInfo isEqual:](anonUserInfo, "isEqual:"))
    && ((rolloverInfo = self->_rolloverInfo, !((unint64_t)rolloverInfo | v4[6]))
     || -[GEORPAppAttestInfo isEqual:](rolloverInfo, "isEqual:")))
  {
    tdmUserInfo = self->_tdmUserInfo;
    if ((unint64_t)tdmUserInfo | v4[7]) {
      char v13 = -[GEORPTdmInfo isEqual:](tdmUserInfo, "isEqual:");
    }
    else {
      char v13 = 1;
    }
  }
  else
  {
LABEL_18:
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  [(GEORPFeedbackUserInfo *)self readAll:1];
  unint64_t v3 = [(GEORPUserCredentials *)self->_userCredentials hash];
  uint64_t v4 = [(NSData *)self->_devicePushToken hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_userEmail hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_preferredEmail hash];
  NSUInteger v7 = [(NSString *)self->_ugcUserId hash];
  unint64_t v8 = v7 ^ [(GEORPAppAttestInfo *)self->_anonUserInfo hash];
  unint64_t v9 = v6 ^ v8 ^ [(GEORPAppAttestInfo *)self->_rolloverInfo hash];
  return v9 ^ [(GEORPTdmInfo *)self->_tdmUserInfo hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v12 = a3;
  [v12 readAll:0];
  userCredentials = self->_userCredentials;
  uint64_t v5 = v12[9];
  if (userCredentials)
  {
    if (v5) {
      -[GEORPUserCredentials mergeFrom:](userCredentials, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPFeedbackUserInfo setUserCredentials:](self, "setUserCredentials:");
  }
  if (v12[4]) {
    -[GEORPFeedbackUserInfo setDevicePushToken:](self, "setDevicePushToken:");
  }
  if (v12[10]) {
    -[GEORPFeedbackUserInfo setUserEmail:](self, "setUserEmail:");
  }
  if (v12[5]) {
    -[GEORPFeedbackUserInfo setPreferredEmail:](self, "setPreferredEmail:");
  }
  if (v12[8]) {
    -[GEORPFeedbackUserInfo setUgcUserId:](self, "setUgcUserId:");
  }
  anonUserInfo = self->_anonUserInfo;
  uint64_t v7 = v12[3];
  if (anonUserInfo)
  {
    if (v7) {
      -[GEORPAppAttestInfo mergeFrom:](anonUserInfo, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPFeedbackUserInfo setAnonUserInfo:](self, "setAnonUserInfo:");
  }
  rolloverInfo = self->_rolloverInfo;
  uint64_t v9 = v12[6];
  if (rolloverInfo)
  {
    if (v9) {
      -[GEORPAppAttestInfo mergeFrom:](rolloverInfo, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEORPFeedbackUserInfo setRolloverInfo:](self, "setRolloverInfo:");
  }
  tdmUserInfo = self->_tdmUserInfo;
  uint64_t v11 = v12[7];
  if (tdmUserInfo)
  {
    if (v11) {
      -[GEORPTdmInfo mergeFrom:](tdmUserInfo, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEORPFeedbackUserInfo setTdmUserInfo:](self, "setTdmUserInfo:");
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
      GEORPFeedbackUserInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2478);
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
  *(_WORD *)&self->_flags |= 0x201u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPFeedbackUserInfo *)self readAll:0];
    [(GEORPAppAttestInfo *)self->_anonUserInfo clearUnknownFields:1];
    [(GEORPAppAttestInfo *)self->_rolloverInfo clearUnknownFields:1];
    tdmUserInfo = self->_tdmUserInfo;
    [(GEORPTdmInfo *)tdmUserInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userEmail, 0);
  objc_storeStrong((id *)&self->_userCredentials, 0);
  objc_storeStrong((id *)&self->_ugcUserId, 0);
  objc_storeStrong((id *)&self->_tdmUserInfo, 0);
  objc_storeStrong((id *)&self->_rolloverInfo, 0);
  objc_storeStrong((id *)&self->_preferredEmail, 0);
  objc_storeStrong((id *)&self->_devicePushToken, 0);
  objc_storeStrong((id *)&self->_anonUserInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end