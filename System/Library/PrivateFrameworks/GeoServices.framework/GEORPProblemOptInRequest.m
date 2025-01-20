@interface GEORPProblemOptInRequest
+ (BOOL)isValid:(id)a3;
- (BOOL)didOptIn;
- (BOOL)hasDevicePushToken;
- (BOOL)hasDidOptIn;
- (BOOL)hasProblemId;
- (BOOL)hasUserCredentials;
- (BOOL)hasUserEmail;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEORPProblemOptInRequest)init;
- (GEORPProblemOptInRequest)initWithData:(id)a3;
- (GEORPProblemOptInRequest)initWithDictionary:(id)a3;
- (GEORPProblemOptInRequest)initWithJSON:(id)a3;
- (GEORPProblemOptInRequest)initWithSubmissionID:(id)a3 allowContactBackAtEmailAddress:(id)a4 traits:(id)a5;
- (GEORPUserCredentials)userCredentials;
- (NSData)devicePushToken;
- (NSString)problemId;
- (NSString)userEmail;
- (id)_dictionaryRepresentation:(unsigned __int8 *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDevicePushToken;
- (void)_readProblemId;
- (void)_readUserCredentials;
- (void)_readUserEmail;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDevicePushToken:(id)a3;
- (void)setDidOptIn:(BOOL)a3;
- (void)setHasDidOptIn:(BOOL)a3;
- (void)setProblemId:(id)a3;
- (void)setUserCredentials:(id)a3;
- (void)setUserEmail:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPProblemOptInRequest

- (GEORPProblemOptInRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPProblemOptInRequest;
  v2 = [(GEORPProblemOptInRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPProblemOptInRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPProblemOptInRequest;
  v3 = [(GEORPProblemOptInRequest *)&v7 initWithData:a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemOptInRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasProblemId
{
  return self->_problemId != 0;
}

- (NSString)problemId
{
  -[GEORPProblemOptInRequest _readProblemId]((uint64_t)self);
  problemId = self->_problemId;

  return problemId;
}

- (void)setProblemId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_problemId, a3);
}

- (BOOL)didOptIn
{
  return self->_didOptIn;
}

- (void)setDidOptIn:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_didOptIn = a3;
}

- (void)setHasDidOptIn:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasDidOptIn
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readUserCredentials
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
        GEORPProblemOptInRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserCredentials_tags_2778);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasUserCredentials
{
  return self->_userCredentials != 0;
}

- (GEORPUserCredentials)userCredentials
{
  -[GEORPProblemOptInRequest _readUserCredentials]((uint64_t)self);
  userCredentials = self->_userCredentials;

  return userCredentials;
}

- (void)setUserCredentials:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_userCredentials, a3);
}

- (void)_readDevicePushToken
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
        GEORPProblemOptInRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDevicePushToken_tags_2779);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDevicePushToken
{
  return self->_devicePushToken != 0;
}

- (NSData)devicePushToken
{
  -[GEORPProblemOptInRequest _readDevicePushToken]((uint64_t)self);
  devicePushToken = self->_devicePushToken;

  return devicePushToken;
}

- (void)setDevicePushToken:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_devicePushToken, a3);
}

- (void)_readUserEmail
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
        GEORPProblemOptInRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserEmail_tags_2780);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasUserEmail
{
  return self->_userEmail != 0;
}

- (NSString)userEmail
{
  -[GEORPProblemOptInRequest _readUserEmail]((uint64_t)self);
  userEmail = self->_userEmail;

  return userEmail;
}

- (void)setUserEmail:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_userEmail, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPProblemOptInRequest;
  v4 = [(GEORPProblemOptInRequest *)&v8 description];
  v5 = [(GEORPProblemOptInRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemOptInRequest _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 problemId];
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

    if (a1[64])
    {
      objc_super v7 = [NSNumber numberWithBool:a1[60]];
      if (a2) {
        objc_super v8 = @"didOptIn";
      }
      else {
        objc_super v8 = @"did_opt_in";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 userCredentials];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"userCredentials";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"user_credentials";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [a1 devicePushToken];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 base64EncodedStringWithOptions:0];
        [v4 setObject:v15 forKey:@"devicePushToken"];
      }
      else
      {
        [v4 setObject:v13 forKey:@"device_push_token"];
      }
    }

    v16 = [a1 userEmail];
    if (v16)
    {
      if (a2) {
        v17 = @"userEmail";
      }
      else {
        v17 = @"user_email";
      }
      [v4 setObject:v16 forKey:v17];
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
  return -[GEORPProblemOptInRequest _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEORPProblemOptInRequest)initWithDictionary:(id)a3
{
  return (GEORPProblemOptInRequest *)-[GEORPProblemOptInRequest _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"problemId";
      }
      else {
        objc_super v6 = @"problem_id";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setProblemId:v8];
      }
      if (a3) {
        v9 = @"didOptIn";
      }
      else {
        v9 = @"did_opt_in";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDidOptIn:", objc_msgSend(v10, "BOOLValue"));
      }

      if (a3) {
        v11 = @"userCredentials";
      }
      else {
        v11 = @"user_credentials";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEORPUserCredentials alloc];
        if (a3) {
          uint64_t v14 = [(GEORPUserCredentials *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEORPUserCredentials *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setUserCredentials:v14];
      }
      if (a3) {
        v16 = @"devicePushToken";
      }
      else {
        v16 = @"device_push_token";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v17 options:0];
        [a1 setDevicePushToken:v18];
      }
      if (a3) {
        v19 = @"userEmail";
      }
      else {
        v19 = @"user_email";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = (void *)[v20 copy];
        [a1 setUserEmail:v21];
      }
    }
  }

  return a1;
}

- (GEORPProblemOptInRequest)initWithJSON:(id)a3
{
  return (GEORPProblemOptInRequest *)-[GEORPProblemOptInRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_2787;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_2788;
    }
    GEORPProblemOptInRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEORPUserCredentials *)self->_userCredentials readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  [a3 position];
  [a3 length];
  v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  objc_super v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    objc_super v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v4;
        uint64_t v12 = *(void *)((char *)a3 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v12);
        *(void *)((char *)a3 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      int v17 = v10 & 7;
      if (v16 || v17 == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          if (v17 != 2) {
            goto LABEL_42;
          }
          goto LABEL_36;
        case 2u:
          if ((v10 & 7) != 0) {
            goto LABEL_42;
          }
          unsigned int v19 = 0;
          break;
        case 3u:
          if (v17 != 2 || !PBReaderPlaceMark() || !GEORPUserCredentialsIsValid((char *)a3)) {
            goto LABEL_42;
          }
          PBReaderRecallMark();
          continue;
        case 4u:
          if (v17 == 2) {
            goto LABEL_36;
          }
          goto LABEL_42;
        case 5u:
          if (v17 == 2) {
            goto LABEL_36;
          }
          goto LABEL_42;
        default:
LABEL_36:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_42:
          PBReaderRecallMark();
          return 0;
      }
      while (1)
      {
        uint64_t v20 = *v4;
        uint64_t v21 = *(void *)((char *)a3 + v20);
        unint64_t v22 = v21 + 1;
        if (v21 == -1 || v22 > *(void *)((char *)a3 + *v5)) {
          break;
        }
        int v23 = *(char *)(*(void *)((char *)a3 + *v7) + v21);
        *(void *)((char *)a3 + v20) = v22;
        if (v23 < 0 && v19++ <= 8) {
          continue;
        }
        goto LABEL_37;
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_37:
      ;
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  BOOL v25 = *((unsigned char *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v25;
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemOptInRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    char flags = (char)self->_flags;
    if ((flags & 0x24) == 0)
    {
      if ((*(unsigned char *)&self->_flags & 8) != 0)
      {
        if (GEORPUserCredentialsIsDirty((uint64_t)self->_userCredentials)) {
          goto LABEL_7;
        }
        char flags = (char)self->_flags;
      }
      if ((flags & 0x12) == 0)
      {
        objc_super v7 = self->_reader;
        objc_sync_enter(v7);
        *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
        [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
        char v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
        [v9 writeData:v8];
        os_unfair_lock_unlock(p_readerLock);

        objc_sync_exit(v7);
        goto LABEL_17;
      }
    }
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPProblemOptInRequest *)self readAll:0];
  if (self->_problemId) {
    PBDataWriterWriteStringField();
  }
  objc_super v6 = v9;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteBOOLField();
    objc_super v6 = v9;
  }
  if (self->_userCredentials)
  {
    PBDataWriterWriteSubmessage();
    objc_super v6 = v9;
  }
  if (self->_devicePushToken)
  {
    PBDataWriterWriteDataField();
    objc_super v6 = v9;
  }
  if (self->_userEmail)
  {
    PBDataWriterWriteStringField();
LABEL_17:
    objc_super v6 = v9;
  }
}

- (unsigned)requestTypeCode
{
  return 1013;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPProblemOptInRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_problemId) {
    objc_msgSend(v5, "setProblemId:");
  }
  v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((unsigned char *)v5 + 60) = self->_didOptIn;
    *((unsigned char *)v5 + 64) |= 1u;
  }
  if (self->_userCredentials)
  {
    objc_msgSend(v5, "setUserCredentials:");
    v4 = v5;
  }
  if (self->_devicePushToken)
  {
    objc_msgSend(v5, "setDevicePushToken:");
    v4 = v5;
  }
  if (self->_userEmail)
  {
    objc_msgSend(v5, "setUserEmail:");
    v4 = v5;
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
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPProblemOptInRequestReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPProblemOptInRequest *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_problemId copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 60) = self->_didOptIn;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  id v11 = [(GEORPUserCredentials *)self->_userCredentials copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  uint64_t v13 = [(NSData *)self->_devicePushToken copyWithZone:a3];
  char v14 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v13;

  uint64_t v15 = [(NSString *)self->_userEmail copyWithZone:a3];
  id v8 = *(id *)(v5 + 40);
  *(void *)(v5 + 40) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEORPProblemOptInRequest *)self readAll:1];
  [v4 readAll:1];
  problemId = self->_problemId;
  if ((unint64_t)problemId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](problemId, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 64))
    {
      if (self->_didOptIn)
      {
        if (!*((unsigned char *)v4 + 60)) {
          goto LABEL_18;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_12;
      }
    }
LABEL_18:
    char v9 = 0;
    goto LABEL_19;
  }
  if (*((unsigned char *)v4 + 64)) {
    goto LABEL_18;
  }
LABEL_12:
  userCredentials = self->_userCredentials;
  if ((unint64_t)userCredentials | *((void *)v4 + 4)
    && !-[GEORPUserCredentials isEqual:](userCredentials, "isEqual:"))
  {
    goto LABEL_18;
  }
  devicePushToken = self->_devicePushToken;
  if ((unint64_t)devicePushToken | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](devicePushToken, "isEqual:")) {
      goto LABEL_18;
    }
  }
  userEmail = self->_userEmail;
  if ((unint64_t)userEmail | *((void *)v4 + 5)) {
    char v9 = -[NSString isEqual:](userEmail, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_19:

  return v9;
}

- (unint64_t)hash
{
  [(GEORPProblemOptInRequest *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_problemId hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_didOptIn;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  unint64_t v6 = [(GEORPUserCredentials *)self->_userCredentials hash];
  uint64_t v7 = v5 ^ v6 ^ [(NSData *)self->_devicePushToken hash];
  return v7 ^ [(NSString *)self->_userEmail hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v7 = a3;
  [v7 readAll:0];
  uint64_t v4 = v7;
  if (v7[3])
  {
    -[GEORPProblemOptInRequest setProblemId:](self, "setProblemId:");
    uint64_t v4 = v7;
  }
  if (v4[8])
  {
    self->_didOptIn = *((unsigned char *)v4 + 60);
    *(unsigned char *)&self->_flags |= 1u;
  }
  userCredentials = self->_userCredentials;
  uint64_t v6 = v4[4];
  if (userCredentials)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEORPUserCredentials mergeFrom:](userCredentials, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEORPProblemOptInRequest setUserCredentials:](self, "setUserCredentials:");
  }
  uint64_t v4 = v7;
LABEL_11:
  if (v4[2])
  {
    -[GEORPProblemOptInRequest setDevicePushToken:](self, "setDevicePushToken:");
    uint64_t v4 = v7;
  }
  if (v4[5])
  {
    -[GEORPProblemOptInRequest setUserEmail:](self, "setUserEmail:");
    uint64_t v4 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userEmail, 0);
  objc_storeStrong((id *)&self->_userCredentials, 0);
  objc_storeStrong((id *)&self->_problemId, 0);
  objc_storeStrong((id *)&self->_devicePushToken, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEORPProblemOptInRequest)initWithSubmissionID:(id)a3 allowContactBackAtEmailAddress:(id)a4 traits:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEORPProblemOptInRequest;
  char v9 = [(GEORPProblemOptInRequest *)&v13 init];
  unint64_t v10 = v9;
  if (v9)
  {
    [(GEORPProblemOptInRequest *)v9 setProblemId:v7];
    id v11 = +[GEORPUserCredentials _credentialsForPrimaryICloudAccount];
    [(GEORPProblemOptInRequest *)v10 setUserCredentials:v11];

    [(GEORPProblemOptInRequest *)v10 setUserEmail:v8];
  }

  return v10;
}

@end