@interface GEORPProblemCollectionRequest
+ (BOOL)isValid:(id)a3;
+ (Class)requestElementType;
- (BOOL)hasCountryCode;
- (BOOL)hasDebugSettings;
- (BOOL)hasDevicePushToken;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHwMachine;
- (BOOL)hasInputLanguage;
- (BOOL)hasOsRelease;
- (BOOL)hasUserCredentials;
- (BOOL)hasUserEmail;
- (BOOL)hasUserLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOLocation)userLocation;
- (GEORPDebugSettings)debugSettings;
- (GEORPProblemCollectionRequest)init;
- (GEORPProblemCollectionRequest)initWithData:(id)a3;
- (GEORPProblemCollectionRequest)initWithDictionary:(id)a3;
- (GEORPProblemCollectionRequest)initWithJSON:(id)a3;
- (GEORPUserCredentials)userCredentials;
- (NSData)devicePushToken;
- (NSMutableArray)requestElements;
- (NSString)countryCode;
- (NSString)hwMachine;
- (NSString)inputLanguage;
- (NSString)osRelease;
- (NSString)userEmail;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)requestElementAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)requestElementsCount;
- (unsigned)requestTypeCode;
- (void)_addNoFlagsRequestElement:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCountryCode;
- (void)_readDebugSettings;
- (void)_readDevicePushToken;
- (void)_readHwMachine;
- (void)_readInputLanguage;
- (void)_readOsRelease;
- (void)_readRequestElements;
- (void)_readUserCredentials;
- (void)_readUserEmail;
- (void)_readUserLocation;
- (void)addRequestElement:(id)a3;
- (void)clearRequestElements;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCountryCode:(id)a3;
- (void)setDebugSettings:(id)a3;
- (void)setDevicePushToken:(id)a3;
- (void)setHwMachine:(id)a3;
- (void)setInputLanguage:(id)a3;
- (void)setOsRelease:(id)a3;
- (void)setRequestElements:(id)a3;
- (void)setUserCredentials:(id)a3;
- (void)setUserEmail:(id)a3;
- (void)setUserLocation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPProblemCollectionRequest

- (GEORPProblemCollectionRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPProblemCollectionRequest;
  v2 = [(GEORPProblemCollectionRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPProblemCollectionRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPProblemCollectionRequest;
  v3 = [(GEORPProblemCollectionRequest *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRequestElements
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestElements_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (NSMutableArray)requestElements
{
  -[GEORPProblemCollectionRequest _readRequestElements]((uint64_t)self);
  requestElements = self->_requestElements;

  return requestElements;
}

- (void)setRequestElements:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  requestElements = self->_requestElements;
  self->_requestElements = v4;
}

- (void)clearRequestElements
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  requestElements = self->_requestElements;

  [(NSMutableArray *)requestElements removeAllObjects];
}

- (void)addRequestElement:(id)a3
{
  id v4 = a3;
  -[GEORPProblemCollectionRequest _readRequestElements]((uint64_t)self);
  -[GEORPProblemCollectionRequest _addNoFlagsRequestElement:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsRequestElement:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)requestElementsCount
{
  -[GEORPProblemCollectionRequest _readRequestElements]((uint64_t)self);
  requestElements = self->_requestElements;

  return [(NSMutableArray *)requestElements count];
}

- (id)requestElementAtIndex:(unint64_t)a3
{
  -[GEORPProblemCollectionRequest _readRequestElements]((uint64_t)self);
  requestElements = self->_requestElements;

  return (id)[(NSMutableArray *)requestElements objectAtIndex:a3];
}

+ (Class)requestElementType
{
  return (Class)objc_opt_class();
}

- (void)_readHwMachine
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHwMachine_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasHwMachine
{
  return self->_hwMachine != 0;
}

- (NSString)hwMachine
{
  -[GEORPProblemCollectionRequest _readHwMachine]((uint64_t)self);
  hwMachine = self->_hwMachine;

  return hwMachine;
}

- (void)setHwMachine:(id)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  objc_storeStrong((id *)&self->_hwMachine, a3);
}

- (void)_readOsRelease
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOsRelease_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasOsRelease
{
  return self->_osRelease != 0;
}

- (NSString)osRelease
{
  -[GEORPProblemCollectionRequest _readOsRelease]((uint64_t)self);
  osRelease = self->_osRelease;

  return osRelease;
}

- (void)setOsRelease:(id)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  objc_storeStrong((id *)&self->_osRelease, a3);
}

- (void)_readCountryCode
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountryCode_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (NSString)countryCode
{
  -[GEORPProblemCollectionRequest _readCountryCode]((uint64_t)self);
  countryCode = self->_countryCode;

  return countryCode;
}

- (void)setCountryCode:(id)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (void)_readInputLanguage
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInputLanguage_tags);
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
  -[GEORPProblemCollectionRequest _readInputLanguage]((uint64_t)self);
  inputLanguage = self->_inputLanguage;

  return inputLanguage;
}

- (void)setInputLanguage:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_inputLanguage, a3);
}

- (void)_readUserCredentials
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserCredentials_tags_0);
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
  -[GEORPProblemCollectionRequest _readUserCredentials]((uint64_t)self);
  userCredentials = self->_userCredentials;

  return userCredentials;
}

- (void)setUserCredentials:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_userCredentials, a3);
}

- (void)_readDevicePushToken
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDevicePushToken_tags_0);
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
  -[GEORPProblemCollectionRequest _readDevicePushToken]((uint64_t)self);
  devicePushToken = self->_devicePushToken;

  return devicePushToken;
}

- (void)setDevicePushToken:(id)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  objc_storeStrong((id *)&self->_devicePushToken, a3);
}

- (void)_readUserEmail
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserEmail_tags_0);
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
  -[GEORPProblemCollectionRequest _readUserEmail]((uint64_t)self);
  userEmail = self->_userEmail;

  return userEmail;
}

- (void)setUserEmail:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_userEmail, a3);
}

- (void)_readUserLocation
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserLocation_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasUserLocation
{
  return self->_userLocation != 0;
}

- (GEOLocation)userLocation
{
  -[GEORPProblemCollectionRequest _readUserLocation]((uint64_t)self);
  userLocation = self->_userLocation;

  return userLocation;
}

- (void)setUserLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_userLocation, a3);
}

- (void)_readDebugSettings
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
        GEORPProblemCollectionRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDebugSettings_tags_0);
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
  -[GEORPProblemCollectionRequest _readDebugSettings]((uint64_t)self);
  debugSettings = self->_debugSettings;

  return debugSettings;
}

- (void)setDebugSettings:(id)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  objc_storeStrong((id *)&self->_debugSettings, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPProblemCollectionRequest;
  id v4 = [(GEORPProblemCollectionRequest *)&v8 description];
  id v5 = [(GEORPProblemCollectionRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemCollectionRequest _dictionaryRepresentation:]((id *)&self->super.super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[8] count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[8], "count"));
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v6 = a1[8];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v41 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = objc_msgSend(v11, "dictionaryRepresentation", (void)v40);
            }
            objc_msgSend(v5, "addObject:", v12, (void)v40);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"requestElement";
      }
      else {
        v13 = @"request_element";
      }
      objc_msgSend(v4, "setObject:forKey:", v5, v13, (void)v40);
    }
    v14 = [a1 hwMachine];
    if (v14)
    {
      if (a2) {
        v15 = @"hwMachine";
      }
      else {
        v15 = @"hw_machine";
      }
      [v4 setObject:v14 forKey:v15];
    }

    v16 = [a1 osRelease];
    if (v16)
    {
      if (a2) {
        v17 = @"osRelease";
      }
      else {
        v17 = @"os_release";
      }
      [v4 setObject:v16 forKey:v17];
    }

    v18 = [a1 countryCode];
    if (v18)
    {
      if (a2) {
        v19 = @"countryCode";
      }
      else {
        v19 = @"country_code";
      }
      [v4 setObject:v18 forKey:v19];
    }

    v20 = [a1 inputLanguage];
    if (v20)
    {
      if (a2) {
        v21 = @"inputLanguage";
      }
      else {
        v21 = @"input_language";
      }
      [v4 setObject:v20 forKey:v21];
    }

    v22 = [a1 userCredentials];
    v23 = v22;
    if (v22)
    {
      if (a2)
      {
        v24 = [v22 jsonRepresentation];
        v25 = @"userCredentials";
      }
      else
      {
        v24 = [v22 dictionaryRepresentation];
        v25 = @"user_credentials";
      }
      [v4 setObject:v24 forKey:v25];
    }
    v26 = [a1 devicePushToken];
    v27 = v26;
    if (v26)
    {
      if (a2)
      {
        v28 = [v26 base64EncodedStringWithOptions:0];
        [v4 setObject:v28 forKey:@"devicePushToken"];
      }
      else
      {
        [v4 setObject:v26 forKey:@"device_push_token"];
      }
    }

    v29 = [a1 userEmail];
    if (v29)
    {
      if (a2) {
        v30 = @"userEmail";
      }
      else {
        v30 = @"user_email";
      }
      [v4 setObject:v29 forKey:v30];
    }

    v31 = [a1 userLocation];
    v32 = v31;
    if (v31)
    {
      if (a2)
      {
        v33 = [v31 jsonRepresentation];
        v34 = @"userLocation";
      }
      else
      {
        v33 = [v31 dictionaryRepresentation];
        v34 = @"user_location";
      }
      [v4 setObject:v33 forKey:v34];
    }
    v35 = [a1 debugSettings];
    v36 = v35;
    if (v35)
    {
      if (a2)
      {
        v37 = [v35 jsonRepresentation];
        v38 = @"debugSettings";
      }
      else
      {
        v37 = [v35 dictionaryRepresentation];
        v38 = @"debug_settings";
      }
      [v4 setObject:v37 forKey:v38];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPProblemCollectionRequest _dictionaryRepresentation:]((id *)&self->super.super.super.isa, 1);
}

- (GEORPProblemCollectionRequest)initWithDictionary:(id)a3
{
  return (GEORPProblemCollectionRequest *)-[GEORPProblemCollectionRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"requestElement";
      }
      else {
        id v6 = @"request_element";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v51 = v5;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v52 objects:v56 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v53;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v53 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v52 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEORPProblem alloc];
                if (a3) {
                  uint64_t v15 = [(GEORPProblem *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEORPProblem *)v14 initWithDictionary:v13];
                }
                v16 = (void *)v15;
                [a1 addRequestElement:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v52 objects:v56 count:16];
          }
          while (v10);
        }

        id v5 = v51;
      }

      if (a3) {
        v17 = @"hwMachine";
      }
      else {
        v17 = @"hw_machine";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = (void *)[v18 copy];
        [a1 setHwMachine:v19];
      }
      if (a3) {
        v20 = @"osRelease";
      }
      else {
        v20 = @"os_release";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = (void *)[v21 copy];
        [a1 setOsRelease:v22];
      }
      if (a3) {
        v23 = @"countryCode";
      }
      else {
        v23 = @"country_code";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = (void *)[v24 copy];
        [a1 setCountryCode:v25];
      }
      if (a3) {
        v26 = @"inputLanguage";
      }
      else {
        v26 = @"input_language";
      }
      v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = (void *)[v27 copy];
        [a1 setInputLanguage:v28];
      }
      if (a3) {
        v29 = @"userCredentials";
      }
      else {
        v29 = @"user_credentials";
      }
      v30 = [v5 objectForKeyedSubscript:v29];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v31 = [GEORPUserCredentials alloc];
        if (a3) {
          uint64_t v32 = [(GEORPUserCredentials *)v31 initWithJSON:v30];
        }
        else {
          uint64_t v32 = [(GEORPUserCredentials *)v31 initWithDictionary:v30];
        }
        v33 = (void *)v32;
        [a1 setUserCredentials:v32];
      }
      if (a3) {
        v34 = @"devicePushToken";
      }
      else {
        v34 = @"device_push_token";
      }
      v35 = [v5 objectForKeyedSubscript:v34];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v36 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v35 options:0];
        [a1 setDevicePushToken:v36];
      }
      if (a3) {
        v37 = @"userEmail";
      }
      else {
        v37 = @"user_email";
      }
      v38 = [v5 objectForKeyedSubscript:v37];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v39 = (void *)[v38 copy];
        [a1 setUserEmail:v39];
      }
      if (a3) {
        long long v40 = @"userLocation";
      }
      else {
        long long v40 = @"user_location";
      }
      long long v41 = [v5 objectForKeyedSubscript:v40];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v42 = [GEOLocation alloc];
        if (a3) {
          uint64_t v43 = [(GEOLocation *)v42 initWithJSON:v41];
        }
        else {
          uint64_t v43 = [(GEOLocation *)v42 initWithDictionary:v41];
        }
        v44 = (void *)v43;
        [a1 setUserLocation:v43];
      }
      if (a3) {
        uint64_t v45 = @"debugSettings";
      }
      else {
        uint64_t v45 = @"debug_settings";
      }
      v46 = [v5 objectForKeyedSubscript:v45];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v47 = [GEORPDebugSettings alloc];
        if (a3) {
          uint64_t v48 = [(GEORPDebugSettings *)v47 initWithJSON:v46];
        }
        else {
          uint64_t v48 = [(GEORPDebugSettings *)v47 initWithDictionary:v46];
        }
        v49 = (void *)v48;
        [a1 setDebugSettings:v48];
      }
    }
  }

  return a1;
}

- (GEORPProblemCollectionRequest)initWithJSON:(id)a3
{
  return (GEORPProblemCollectionRequest *)-[GEORPProblemCollectionRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_2144;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_2145;
    }
    GEORPProblemCollectionRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPProblemCollectionRequestCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPProblemCollectionRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemCollectionRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPProblemCollectionRequestIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPProblemCollectionRequest *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_requestElements;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_hwMachine) {
      PBDataWriterWriteStringField();
    }
    if (self->_osRelease) {
      PBDataWriterWriteStringField();
    }
    if (self->_countryCode) {
      PBDataWriterWriteStringField();
    }
    if (self->_inputLanguage) {
      PBDataWriterWriteStringField();
    }
    if (self->_userCredentials) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_devicePushToken) {
      PBDataWriterWriteDataField();
    }
    if (self->_userEmail) {
      PBDataWriterWriteStringField();
    }
    if (self->_userLocation) {
      PBDataWriterWriteSubmessage();
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
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[GEORPProblemCollectionRequest _readRequestElements]((uint64_t)self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_requestElements;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (void)v11))
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  -[GEORPProblemCollectionRequest _readUserLocation]((uint64_t)self);
  return [(GEOLocation *)self->_userLocation hasGreenTeaWithValue:v3];
}

- (unsigned)requestTypeCode
{
  return 1009;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEORPProblemCollectionRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 24) = self->_readerMarkPos;
  *((_DWORD *)v9 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORPProblemCollectionRequest *)self requestElementsCount])
  {
    [v9 clearRequestElements];
    unint64_t v4 = [(GEORPProblemCollectionRequest *)self requestElementsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPProblemCollectionRequest *)self requestElementAtIndex:i];
        [v9 addRequestElement:v7];
      }
    }
  }
  if (self->_hwMachine) {
    objc_msgSend(v9, "setHwMachine:");
  }
  uint64_t v8 = v9;
  if (self->_osRelease)
  {
    objc_msgSend(v9, "setOsRelease:");
    uint64_t v8 = v9;
  }
  if (self->_countryCode)
  {
    objc_msgSend(v9, "setCountryCode:");
    uint64_t v8 = v9;
  }
  if (self->_inputLanguage)
  {
    objc_msgSend(v9, "setInputLanguage:");
    uint64_t v8 = v9;
  }
  if (self->_userCredentials)
  {
    objc_msgSend(v9, "setUserCredentials:");
    uint64_t v8 = v9;
  }
  if (self->_devicePushToken)
  {
    objc_msgSend(v9, "setDevicePushToken:");
    uint64_t v8 = v9;
  }
  if (self->_userEmail)
  {
    objc_msgSend(v9, "setUserEmail:");
    uint64_t v8 = v9;
  }
  if (self->_userLocation)
  {
    objc_msgSend(v9, "setUserLocation:");
    uint64_t v8 = v9;
  }
  if (self->_debugSettings)
  {
    objc_msgSend(v9, "setDebugSettings:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPProblemCollectionRequestReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPProblemCollectionRequest *)self readAll:0];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v8 = self->_requestElements;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "copyWithZone:", a3, (void)v32);
        [v5 addRequestElement:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(NSString *)self->_hwMachine copyWithZone:a3];
  long long v14 = (void *)v5[5];
  v5[5] = v13;

  uint64_t v15 = [(NSString *)self->_osRelease copyWithZone:a3];
  uint64_t v16 = (void *)v5[7];
  v5[7] = v15;

  uint64_t v17 = [(NSString *)self->_countryCode copyWithZone:a3];
  v18 = (void *)v5[2];
  v5[2] = v17;

  uint64_t v19 = [(NSString *)self->_inputLanguage copyWithZone:a3];
  v20 = (void *)v5[6];
  v5[6] = v19;

  id v21 = [(GEORPUserCredentials *)self->_userCredentials copyWithZone:a3];
  v22 = (void *)v5[9];
  v5[9] = v21;

  uint64_t v23 = [(NSData *)self->_devicePushToken copyWithZone:a3];
  v24 = (void *)v5[4];
  v5[4] = v23;

  uint64_t v25 = [(NSString *)self->_userEmail copyWithZone:a3];
  v26 = (void *)v5[10];
  v5[10] = v25;

  id v27 = [(GEOLocation *)self->_userLocation copyWithZone:a3];
  v28 = (void *)v5[11];
  v5[11] = v27;

  id v29 = [(GEORPDebugSettings *)self->_debugSettings copyWithZone:a3];
  v30 = (void *)v5[3];
  v5[3] = v29;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  [(GEORPProblemCollectionRequest *)self readAll:1];
  [v4 readAll:1];
  requestElements = self->_requestElements;
  if ((unint64_t)requestElements | v4[8])
  {
    if (!-[NSMutableArray isEqual:](requestElements, "isEqual:")) {
      goto LABEL_22;
    }
  }
  hwMachine = self->_hwMachine;
  if ((unint64_t)hwMachine | v4[5] && !-[NSString isEqual:](hwMachine, "isEqual:")) {
    goto LABEL_22;
  }
  if (((osRelease = self->_osRelease, !((unint64_t)osRelease | v4[7]))
     || -[NSString isEqual:](osRelease, "isEqual:"))
    && ((countryCode = self->_countryCode, !((unint64_t)countryCode | v4[2]))
     || -[NSString isEqual:](countryCode, "isEqual:"))
    && ((inputLanguage = self->_inputLanguage, !((unint64_t)inputLanguage | v4[6]))
     || -[NSString isEqual:](inputLanguage, "isEqual:"))
    && ((userCredentials = self->_userCredentials, !((unint64_t)userCredentials | v4[9]))
     || -[GEORPUserCredentials isEqual:](userCredentials, "isEqual:"))
    && ((devicePushToken = self->_devicePushToken, !((unint64_t)devicePushToken | v4[4]))
     || -[NSData isEqual:](devicePushToken, "isEqual:"))
    && ((userEmail = self->_userEmail, !((unint64_t)userEmail | v4[10]))
     || -[NSString isEqual:](userEmail, "isEqual:"))
    && ((userLocation = self->_userLocation, !((unint64_t)userLocation | v4[11]))
     || -[GEOLocation isEqual:](userLocation, "isEqual:")))
  {
    debugSettings = self->_debugSettings;
    if ((unint64_t)debugSettings | v4[3]) {
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
  [(GEORPProblemCollectionRequest *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_requestElements hash];
  NSUInteger v4 = [(NSString *)self->_hwMachine hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_osRelease hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_countryCode hash];
  NSUInteger v7 = [(NSString *)self->_inputLanguage hash];
  unint64_t v8 = v7 ^ [(GEORPUserCredentials *)self->_userCredentials hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSData *)self->_devicePushToken hash];
  NSUInteger v10 = [(NSString *)self->_userEmail hash];
  unint64_t v11 = v10 ^ [(GEOLocation *)self->_userLocation hash];
  return v9 ^ v11 ^ [(GEORPDebugSettings *)self->_debugSettings hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = (id *)a3;
  [v4 readAll:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4[8];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEORPProblemCollectionRequest addRequestElement:](self, "addRequestElement:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  if (v4[5]) {
    -[GEORPProblemCollectionRequest setHwMachine:](self, "setHwMachine:");
  }
  if (v4[7]) {
    -[GEORPProblemCollectionRequest setOsRelease:](self, "setOsRelease:");
  }
  if (v4[2]) {
    -[GEORPProblemCollectionRequest setCountryCode:](self, "setCountryCode:");
  }
  if (v4[6]) {
    -[GEORPProblemCollectionRequest setInputLanguage:](self, "setInputLanguage:");
  }
  userCredentials = self->_userCredentials;
  id v11 = v4[9];
  if (userCredentials)
  {
    if (v11) {
      -[GEORPUserCredentials mergeFrom:](userCredentials, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEORPProblemCollectionRequest setUserCredentials:](self, "setUserCredentials:");
  }
  if (v4[4]) {
    -[GEORPProblemCollectionRequest setDevicePushToken:](self, "setDevicePushToken:");
  }
  if (v4[10]) {
    -[GEORPProblemCollectionRequest setUserEmail:](self, "setUserEmail:");
  }
  userLocation = self->_userLocation;
  id v13 = v4[11];
  if (userLocation)
  {
    if (v13) {
      -[GEOLocation mergeFrom:](userLocation, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEORPProblemCollectionRequest setUserLocation:](self, "setUserLocation:");
  }
  debugSettings = self->_debugSettings;
  id v15 = v4[3];
  if (debugSettings)
  {
    if (v15) {
      -[GEORPDebugSettings mergeFrom:](debugSettings, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEORPProblemCollectionRequest setDebugSettings:](self, "setDebugSettings:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_userEmail, 0);
  objc_storeStrong((id *)&self->_userCredentials, 0);
  objc_storeStrong((id *)&self->_requestElements, 0);
  objc_storeStrong((id *)&self->_osRelease, 0);
  objc_storeStrong((id *)&self->_inputLanguage, 0);
  objc_storeStrong((id *)&self->_hwMachine, 0);
  objc_storeStrong((id *)&self->_devicePushToken, 0);
  objc_storeStrong((id *)&self->_debugSettings, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end