@interface GEORPProblemRequest
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAnalyticMetadata;
- (BOOL)hasClientCapabilities;
- (BOOL)hasClientMetadata;
- (BOOL)hasDebugSettings;
- (BOOL)hasDevicePushToken;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasInputLanguage;
- (BOOL)hasProblem;
- (BOOL)hasProblemUuid;
- (BOOL)hasUserCredentials;
- (BOOL)hasUserEmail;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOPDAnalyticMetadata)analyticMetadata;
- (GEOPDClientMetadata)clientMetadata;
- (GEORPClientCapabilities)clientCapabilities;
- (GEORPDebugSettings)debugSettings;
- (GEORPProblem)problem;
- (GEORPProblemRequest)init;
- (GEORPProblemRequest)initWithData:(id)a3;
- (GEORPProblemRequest)initWithDictionary:(id)a3;
- (GEORPProblemRequest)initWithJSON:(id)a3;
- (GEORPUserCredentials)userCredentials;
- (NSData)devicePushToken;
- (NSString)inputLanguage;
- (NSString)problemUuid;
- (NSString)userEmail;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAnalyticMetadata;
- (void)_readClientCapabilities;
- (void)_readClientMetadata;
- (void)_readDebugSettings;
- (void)_readDevicePushToken;
- (void)_readInputLanguage;
- (void)_readProblem;
- (void)_readProblemUuid;
- (void)_readUserCredentials;
- (void)_readUserEmail;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAnalyticMetadata:(id)a3;
- (void)setClientCapabilities:(id)a3;
- (void)setClientMetadata:(id)a3;
- (void)setDebugSettings:(id)a3;
- (void)setDevicePushToken:(id)a3;
- (void)setInputLanguage:(id)a3;
- (void)setProblem:(id)a3;
- (void)setProblemUuid:(id)a3;
- (void)setUserCredentials:(id)a3;
- (void)setUserEmail:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPProblemRequest

- (GEORPProblemRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPProblemRequest;
  v2 = [(GEORPProblemRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPProblemRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPProblemRequest;
  v3 = [(GEORPProblemRequest *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readProblem
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblem_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasProblem
{
  return self->_problem != 0;
}

- (GEORPProblem)problem
{
  -[GEORPProblemRequest _readProblem]((uint64_t)self);
  problem = self->_problem;

  return problem;
}

- (void)setProblem:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_problem, a3);
}

- (void)_readUserCredentials
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserCredentials_tags_2812);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasUserCredentials
{
  return self->_userCredentials != 0;
}

- (GEORPUserCredentials)userCredentials
{
  -[GEORPProblemRequest _readUserCredentials]((uint64_t)self);
  userCredentials = self->_userCredentials;

  return userCredentials;
}

- (void)setUserCredentials:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_userCredentials, a3);
}

- (void)_readAnalyticMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnalyticMetadata_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasAnalyticMetadata
{
  return self->_analyticMetadata != 0;
}

- (GEOPDAnalyticMetadata)analyticMetadata
{
  -[GEORPProblemRequest _readAnalyticMetadata]((uint64_t)self);
  analyticMetadata = self->_analyticMetadata;

  return analyticMetadata;
}

- (void)setAnalyticMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  objc_storeStrong((id *)&self->_analyticMetadata, a3);
}

- (void)_readClientMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientMetadata_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasClientMetadata
{
  return self->_clientMetadata != 0;
}

- (GEOPDClientMetadata)clientMetadata
{
  -[GEORPProblemRequest _readClientMetadata]((uint64_t)self);
  clientMetadata = self->_clientMetadata;

  return clientMetadata;
}

- (void)setClientMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  objc_storeStrong((id *)&self->_clientMetadata, a3);
}

- (void)_readDevicePushToken
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDevicePushToken_tags_2813);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasDevicePushToken
{
  return self->_devicePushToken != 0;
}

- (NSData)devicePushToken
{
  -[GEORPProblemRequest _readDevicePushToken]((uint64_t)self);
  devicePushToken = self->_devicePushToken;

  return devicePushToken;
}

- (void)setDevicePushToken:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_devicePushToken, a3);
}

- (void)_readUserEmail
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserEmail_tags_2814);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasUserEmail
{
  return self->_userEmail != 0;
}

- (NSString)userEmail
{
  -[GEORPProblemRequest _readUserEmail]((uint64_t)self);
  userEmail = self->_userEmail;

  return userEmail;
}

- (void)setUserEmail:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_userEmail, a3);
}

- (void)_readInputLanguage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInputLanguage_tags_2815);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasInputLanguage
{
  return self->_inputLanguage != 0;
}

- (NSString)inputLanguage
{
  -[GEORPProblemRequest _readInputLanguage]((uint64_t)self);
  inputLanguage = self->_inputLanguage;

  return inputLanguage;
}

- (void)setInputLanguage:(id)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  objc_storeStrong((id *)&self->_inputLanguage, a3);
}

- (void)_readClientCapabilities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientCapabilities_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasClientCapabilities
{
  return self->_clientCapabilities != 0;
}

- (GEORPClientCapabilities)clientCapabilities
{
  -[GEORPProblemRequest _readClientCapabilities]((uint64_t)self);
  clientCapabilities = self->_clientCapabilities;

  return clientCapabilities;
}

- (void)setClientCapabilities:(id)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  objc_storeStrong((id *)&self->_clientCapabilities, a3);
}

- (void)_readProblemUuid
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemUuid_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasProblemUuid
{
  return self->_problemUuid != 0;
}

- (NSString)problemUuid
{
  -[GEORPProblemRequest _readProblemUuid]((uint64_t)self);
  problemUuid = self->_problemUuid;

  return problemUuid;
}

- (void)setProblemUuid:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_problemUuid, a3);
}

- (void)_readDebugSettings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDebugSettings_tags_2816);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasDebugSettings
{
  return self->_debugSettings != 0;
}

- (GEORPDebugSettings)debugSettings
{
  -[GEORPProblemRequest _readDebugSettings]((uint64_t)self);
  debugSettings = self->_debugSettings;

  return debugSettings;
}

- (void)setDebugSettings:(id)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  objc_storeStrong((id *)&self->_debugSettings, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPProblemRequest;
  v4 = [(GEORPProblemRequest *)&v8 description];
  v5 = [(GEORPProblemRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemRequest _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 problem];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"problem"];
    }
    objc_super v8 = [a1 userCredentials];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"userCredentials";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"user_credentials";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = [a1 analyticMetadata];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"analyticMetadata";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"analytic_metadata";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = [a1 clientMetadata];
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"clientMetadata";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"client_metadata";
      }
      [v4 setObject:v18 forKey:v19];
    }
    v20 = [a1 devicePushToken];
    v21 = v20;
    if (v20)
    {
      if (a2)
      {
        v22 = [v20 base64EncodedStringWithOptions:0];
        [v4 setObject:v22 forKey:@"devicePushToken"];
      }
      else
      {
        [v4 setObject:v20 forKey:@"device_push_token"];
      }
    }

    v23 = [a1 userEmail];
    if (v23)
    {
      if (a2) {
        v24 = @"userEmail";
      }
      else {
        v24 = @"user_email";
      }
      [v4 setObject:v23 forKey:v24];
    }

    v25 = [a1 inputLanguage];
    if (v25)
    {
      if (a2) {
        v26 = @"inputLanguage";
      }
      else {
        v26 = @"input_language";
      }
      [v4 setObject:v25 forKey:v26];
    }

    v27 = [a1 clientCapabilities];
    v28 = v27;
    if (v27)
    {
      if (a2)
      {
        v29 = [v27 jsonRepresentation];
        v30 = @"clientCapabilities";
      }
      else
      {
        v29 = [v27 dictionaryRepresentation];
        v30 = @"client_capabilities";
      }
      [v4 setObject:v29 forKey:v30];
    }
    v31 = [a1 problemUuid];
    if (v31)
    {
      if (a2) {
        v32 = @"problemUuid";
      }
      else {
        v32 = @"problem_uuid";
      }
      [v4 setObject:v31 forKey:v32];
    }

    v33 = [a1 debugSettings];
    v34 = v33;
    if (v33)
    {
      if (a2)
      {
        v35 = [v33 jsonRepresentation];
        v36 = @"debugSettings";
      }
      else
      {
        v35 = [v33 dictionaryRepresentation];
        v36 = @"debug_settings";
      }
      [v4 setObject:v35 forKey:v36];
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
  return -[GEORPProblemRequest _dictionaryRepresentation:](self, 1);
}

- (GEORPProblemRequest)initWithDictionary:(id)a3
{
  return (GEORPProblemRequest *)-[GEORPProblemRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"problem"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEORPProblem alloc];
        if (a3) {
          uint64_t v8 = [(GEORPProblem *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEORPProblem *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setProblem:v8];
      }
      if (a3) {
        v10 = @"userCredentials";
      }
      else {
        v10 = @"user_credentials";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [GEORPUserCredentials alloc];
        if (a3) {
          uint64_t v13 = [(GEORPUserCredentials *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEORPUserCredentials *)v12 initWithDictionary:v11];
        }
        v14 = (void *)v13;
        [a1 setUserCredentials:v13];
      }
      if (a3) {
        v15 = @"analyticMetadata";
      }
      else {
        v15 = @"analytic_metadata";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [GEOPDAnalyticMetadata alloc];
        if (a3) {
          uint64_t v18 = [(GEOPDAnalyticMetadata *)v17 initWithJSON:v16];
        }
        else {
          uint64_t v18 = [(GEOPDAnalyticMetadata *)v17 initWithDictionary:v16];
        }
        v19 = (void *)v18;
        [a1 setAnalyticMetadata:v18];
      }
      if (a3) {
        v20 = @"clientMetadata";
      }
      else {
        v20 = @"client_metadata";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = [GEOPDClientMetadata alloc];
        if (a3) {
          uint64_t v23 = [(GEOPDClientMetadata *)v22 initWithJSON:v21];
        }
        else {
          uint64_t v23 = [(GEOPDClientMetadata *)v22 initWithDictionary:v21];
        }
        v24 = (void *)v23;
        [a1 setClientMetadata:v23];
      }
      if (a3) {
        v25 = @"devicePushToken";
      }
      else {
        v25 = @"device_push_token";
      }
      v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v27 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v26 options:0];
        [a1 setDevicePushToken:v27];
      }
      if (a3) {
        v28 = @"userEmail";
      }
      else {
        v28 = @"user_email";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v30 = (void *)[v29 copy];
        [a1 setUserEmail:v30];
      }
      if (a3) {
        v31 = @"inputLanguage";
      }
      else {
        v31 = @"input_language";
      }
      v32 = [v5 objectForKeyedSubscript:v31];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v33 = (void *)[v32 copy];
        [a1 setInputLanguage:v33];
      }
      if (a3) {
        v34 = @"clientCapabilities";
      }
      else {
        v34 = @"client_capabilities";
      }
      v35 = [v5 objectForKeyedSubscript:v34];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v36 = [GEORPClientCapabilities alloc];
        if (a3) {
          uint64_t v37 = [(GEORPClientCapabilities *)v36 initWithJSON:v35];
        }
        else {
          uint64_t v37 = [(GEORPClientCapabilities *)v36 initWithDictionary:v35];
        }
        v38 = (void *)v37;
        [a1 setClientCapabilities:v37];
      }
      if (a3) {
        v39 = @"problemUuid";
      }
      else {
        v39 = @"problem_uuid";
      }
      v40 = [v5 objectForKeyedSubscript:v39];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v41 = (void *)[v40 copy];
        [a1 setProblemUuid:v41];
      }
      if (a3) {
        v42 = @"debugSettings";
      }
      else {
        v42 = @"debug_settings";
      }
      v43 = [v5 objectForKeyedSubscript:v42];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v44 = [GEORPDebugSettings alloc];
        if (a3) {
          uint64_t v45 = [(GEORPDebugSettings *)v44 initWithJSON:v43];
        }
        else {
          uint64_t v45 = [(GEORPDebugSettings *)v44 initWithDictionary:v43];
        }
        v46 = (void *)v45;
        [a1 setDebugSettings:v45];
      }
    }
  }

  return a1;
}

- (GEORPProblemRequest)initWithJSON:(id)a3
{
  return (GEORPProblemRequest *)-[GEORPProblemRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_2847;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_2848;
    }
    GEORPProblemRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPProblemRequestCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPProblemRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPProblemRequestIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORPProblemRequest *)self readAll:0];
    if (self->_problem) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_userCredentials) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_analyticMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_clientMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_devicePushToken) {
      PBDataWriterWriteDataField();
    }
    if (self->_userEmail) {
      PBDataWriterWriteStringField();
    }
    if (self->_inputLanguage) {
      PBDataWriterWriteStringField();
    }
    if (self->_clientCapabilities) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_problemUuid) {
      PBDataWriterWriteStringField();
    }
    if (self->_debugSettings) {
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
  -[GEORPProblemRequest _readClientMetadata]((uint64_t)self);
  if ([(GEOPDClientMetadata *)self->_clientMetadata hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPProblemRequest _readProblem]((uint64_t)self);
  problem = self->_problem;

  return [(GEORPProblem *)problem hasGreenTeaWithValue:v3];
}

- (unsigned)requestTypeCode
{
  return 1014;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPProblemRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 24) = self->_readerMarkPos;
  *((_DWORD *)v5 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_problem) {
    objc_msgSend(v5, "setProblem:");
  }
  if (self->_userCredentials) {
    objc_msgSend(v5, "setUserCredentials:");
  }
  v4 = v5;
  if (self->_analyticMetadata)
  {
    objc_msgSend(v5, "setAnalyticMetadata:");
    v4 = v5;
  }
  if (self->_clientMetadata)
  {
    objc_msgSend(v5, "setClientMetadata:");
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
  if (self->_inputLanguage)
  {
    objc_msgSend(v5, "setInputLanguage:");
    v4 = v5;
  }
  if (self->_clientCapabilities)
  {
    objc_msgSend(v5, "setClientCapabilities:");
    v4 = v5;
  }
  if (self->_problemUuid)
  {
    objc_msgSend(v5, "setProblemUuid:");
    v4 = v5;
  }
  if (self->_debugSettings)
  {
    objc_msgSend(v5, "setDebugSettings:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPProblemRequest *)self readAll:0];
    id v8 = [(GEORPProblem *)self->_problem copyWithZone:a3];
    v9 = (void *)v5[9];
    v5[9] = v8;

    id v10 = [(GEORPUserCredentials *)self->_userCredentials copyWithZone:a3];
    v11 = (void *)v5[10];
    v5[10] = v10;

    id v12 = [(GEOPDAnalyticMetadata *)self->_analyticMetadata copyWithZone:a3];
    uint64_t v13 = (void *)v5[2];
    v5[2] = v12;

    id v14 = [(GEOPDClientMetadata *)self->_clientMetadata copyWithZone:a3];
    v15 = (void *)v5[4];
    v5[4] = v14;

    uint64_t v16 = [(NSData *)self->_devicePushToken copyWithZone:a3];
    v17 = (void *)v5[6];
    v5[6] = v16;

    uint64_t v18 = [(NSString *)self->_userEmail copyWithZone:a3];
    v19 = (void *)v5[11];
    v5[11] = v18;

    uint64_t v20 = [(NSString *)self->_inputLanguage copyWithZone:a3];
    v21 = (void *)v5[7];
    v5[7] = v20;

    id v22 = [(GEORPClientCapabilities *)self->_clientCapabilities copyWithZone:a3];
    uint64_t v23 = (void *)v5[3];
    v5[3] = v22;

    uint64_t v24 = [(NSString *)self->_problemUuid copyWithZone:a3];
    v25 = (void *)v5[8];
    v5[8] = v24;

    id v26 = [(GEORPDebugSettings *)self->_debugSettings copyWithZone:a3];
    id v7 = (PBDataReader *)v5[5];
    v5[5] = v26;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPProblemRequestReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  [(GEORPProblemRequest *)self readAll:1];
  [v4 readAll:1];
  problem = self->_problem;
  if ((unint64_t)problem | v4[9])
  {
    if (!-[GEORPProblem isEqual:](problem, "isEqual:")) {
      goto LABEL_22;
    }
  }
  userCredentials = self->_userCredentials;
  if ((unint64_t)userCredentials | v4[10] && !-[GEORPUserCredentials isEqual:](userCredentials, "isEqual:")) {
    goto LABEL_22;
  }
  if (((analyticMetadata = self->_analyticMetadata, !((unint64_t)analyticMetadata | v4[2]))
     || -[GEOPDAnalyticMetadata isEqual:](analyticMetadata, "isEqual:"))
    && ((clientMetadata = self->_clientMetadata, !((unint64_t)clientMetadata | v4[4]))
     || -[GEOPDClientMetadata isEqual:](clientMetadata, "isEqual:"))
    && ((devicePushToken = self->_devicePushToken, !((unint64_t)devicePushToken | v4[6]))
     || -[NSData isEqual:](devicePushToken, "isEqual:"))
    && ((userEmail = self->_userEmail, !((unint64_t)userEmail | v4[11]))
     || -[NSString isEqual:](userEmail, "isEqual:"))
    && ((inputLanguage = self->_inputLanguage, !((unint64_t)inputLanguage | v4[7]))
     || -[NSString isEqual:](inputLanguage, "isEqual:"))
    && ((clientCapabilities = self->_clientCapabilities, !((unint64_t)clientCapabilities | v4[3]))
     || -[GEORPClientCapabilities isEqual:](clientCapabilities, "isEqual:"))
    && ((problemUuid = self->_problemUuid, !((unint64_t)problemUuid | v4[8]))
     || -[NSString isEqual:](problemUuid, "isEqual:")))
  {
    debugSettings = self->_debugSettings;
    if ((unint64_t)debugSettings | v4[5]) {
      char v15 = -[GEORPDebugSettings isEqual:](debugSettings, "isEqual:");
    }
    else {
      char v15 = 1;
    }
  }
  else
  {
LABEL_22:
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  [(GEORPProblemRequest *)self readAll:1];
  unint64_t v3 = [(GEORPProblem *)self->_problem hash];
  unint64_t v4 = [(GEORPUserCredentials *)self->_userCredentials hash] ^ v3;
  unint64_t v5 = [(GEOPDAnalyticMetadata *)self->_analyticMetadata hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOPDClientMetadata *)self->_clientMetadata hash];
  uint64_t v7 = [(NSData *)self->_devicePushToken hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_userEmail hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_inputLanguage hash];
  unint64_t v10 = [(GEORPClientCapabilities *)self->_clientCapabilities hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_problemUuid hash];
  return v9 ^ v11 ^ [(GEORPDebugSettings *)self->_debugSettings hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = a3;
  [v16 readAll:0];
  problem = self->_problem;
  uint64_t v5 = v16[9];
  if (problem)
  {
    if (v5) {
      -[GEORPProblem mergeFrom:](problem, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPProblemRequest setProblem:](self, "setProblem:");
  }
  userCredentials = self->_userCredentials;
  uint64_t v7 = v16[10];
  if (userCredentials)
  {
    if (v7) {
      -[GEORPUserCredentials mergeFrom:](userCredentials, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPProblemRequest setUserCredentials:](self, "setUserCredentials:");
  }
  analyticMetadata = self->_analyticMetadata;
  uint64_t v9 = v16[2];
  if (analyticMetadata)
  {
    if (v9) {
      -[GEOPDAnalyticMetadata mergeFrom:](analyticMetadata, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEORPProblemRequest setAnalyticMetadata:](self, "setAnalyticMetadata:");
  }
  clientMetadata = self->_clientMetadata;
  uint64_t v11 = v16[4];
  if (clientMetadata)
  {
    if (v11) {
      -[GEOPDClientMetadata mergeFrom:](clientMetadata, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEORPProblemRequest setClientMetadata:](self, "setClientMetadata:");
  }
  if (v16[6]) {
    -[GEORPProblemRequest setDevicePushToken:](self, "setDevicePushToken:");
  }
  if (v16[11]) {
    -[GEORPProblemRequest setUserEmail:](self, "setUserEmail:");
  }
  if (v16[7]) {
    -[GEORPProblemRequest setInputLanguage:](self, "setInputLanguage:");
  }
  clientCapabilities = self->_clientCapabilities;
  uint64_t v13 = v16[3];
  if (clientCapabilities)
  {
    if (v13) {
      -[GEORPClientCapabilities mergeFrom:](clientCapabilities, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEORPProblemRequest setClientCapabilities:](self, "setClientCapabilities:");
  }
  if (v16[8]) {
    -[GEORPProblemRequest setProblemUuid:](self, "setProblemUuid:");
  }
  debugSettings = self->_debugSettings;
  uint64_t v15 = v16[5];
  if (debugSettings)
  {
    if (v15) {
      -[GEORPDebugSettings mergeFrom:](debugSettings, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEORPProblemRequest setDebugSettings:](self, "setDebugSettings:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userEmail, 0);
  objc_storeStrong((id *)&self->_userCredentials, 0);
  objc_storeStrong((id *)&self->_problem, 0);
  objc_storeStrong((id *)&self->_problemUuid, 0);
  objc_storeStrong((id *)&self->_inputLanguage, 0);
  objc_storeStrong((id *)&self->_devicePushToken, 0);
  objc_storeStrong((id *)&self->_debugSettings, 0);
  objc_storeStrong((id *)&self->_clientMetadata, 0);
  objc_storeStrong((id *)&self->_clientCapabilities, 0);
  objc_storeStrong((id *)&self->_analyticMetadata, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end