@interface GEORPFeedbackRequest
+ (BOOL)isValid:(id)a3;
+ (Class)displayLanguageType;
+ (id)clientTestingDebugSettings;
+ (id)defaultDebugSettingsMergedWithSettings:(id)a3;
- (BOOL)hasAbClientMetadata;
- (BOOL)hasAnalyticMetadata;
- (BOOL)hasClientCapabilities;
- (BOOL)hasClientMetadata;
- (BOOL)hasDebugSettings;
- (BOOL)hasFeedbackRequestParameters;
- (BOOL)hasFeedbackRequestType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasUserInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPOIEnrichment;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOABSecondPartyPlaceRequestClientMetaData)abClientMetadata;
- (GEOPDAnalyticMetadata)analyticMetadata;
- (GEOPDClientMetadata)clientMetadata;
- (GEORPClientCapabilities)clientCapabilities;
- (GEORPDebugSettings)debugSettings;
- (GEORPFeedbackRequest)init;
- (GEORPFeedbackRequest)initWithData:(id)a3;
- (GEORPFeedbackRequest)initWithDictionary:(id)a3;
- (GEORPFeedbackRequest)initWithFeedbackRequestParameters:(id)a3 traits:(id)a4;
- (GEORPFeedbackRequest)initWithFeedbackRequestParameters:(id)a3 userCredentials:(id)a4 pushToken:(id)a5 allowContactBackAtEmailAddress:(id)a6 traits:(id)a7;
- (GEORPFeedbackRequest)initWithFeedbackRequestParameters:(id)a3 userInfo:(id)a4 traits:(id)a5;
- (GEORPFeedbackRequest)initWithFeedbackRequestParameters:(id)a3 userInfo:(id)a4 traits:(id)a5 debugSettings:(id)a6;
- (GEORPFeedbackRequest)initWithJSON:(id)a3;
- (GEORPFeedbackRequestParameters)feedbackRequestParameters;
- (GEORPFeedbackUserInfo)userInfo;
- (NSMutableArray)displayLanguages;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayLanguageAtIndex:(unint64_t)a3;
- (id)feedbackClientCapabilitiesAsString:(int)a3;
- (id)feedbackRequestTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsFeedbackClientCapabilities:(id)a3;
- (int)StringAsFeedbackRequestType:(id)a3;
- (int)feedbackClientCapabilities;
- (int)feedbackClientCapabilitiesAtIndex:(unint64_t)a3;
- (int)feedbackRequestType;
- (unint64_t)displayLanguagesCount;
- (unint64_t)feedbackClientCapabilitiesCount;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)_addNoFlagsDisplayLanguage:(uint64_t)a1;
- (void)_initForSubmissionParameters;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAbClientMetadata;
- (void)_readAnalyticMetadata;
- (void)_readClientCapabilities;
- (void)_readClientMetadata;
- (void)_readDebugSettings;
- (void)_readDisplayLanguages;
- (void)_readFeedbackClientCapabilities;
- (void)_readFeedbackRequestParameters;
- (void)_readUserInfo;
- (void)_setupSubmissionParameters;
- (void)_sharedInitWithRequestParameters:(id)a3 userInfo:(id)a4 traits:(id)a5 debugSettings:(id)a6;
- (void)addDisplayLanguage:(id)a3;
- (void)addFeedbackClientCapabilities:(int)a3;
- (void)clearDisplayLanguages;
- (void)clearFeedbackClientCapabilities;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbClientMetadata:(id)a3;
- (void)setAnalyticMetadata:(id)a3;
- (void)setClientCapabilities:(id)a3;
- (void)setClientMetadata:(id)a3;
- (void)setDebugSettings:(id)a3;
- (void)setDisplayLanguages:(id)a3;
- (void)setFeedbackClientCapabilities:(int *)a3 count:(unint64_t)a4;
- (void)setFeedbackRequestParameters:(id)a3;
- (void)setFeedbackRequestType:(int)a3;
- (void)setHasFeedbackRequestType:(BOOL)a3;
- (void)setUserInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackRequest

- (GEORPFeedbackRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackRequest;
  v2 = [(GEORPFeedbackRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackRequest;
  v3 = [(GEORPFeedbackRequest *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEORPFeedbackRequest;
  [(GEORPFeedbackRequest *)&v3 dealloc];
}

- (int)feedbackRequestType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_feedbackRequestType;
  }
  else {
    return 0;
  }
}

- (void)setFeedbackRequestType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_feedbackRequestType = a3;
}

- (void)setHasFeedbackRequestType:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasFeedbackRequestType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)feedbackRequestTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = off_1E53DBB60[a3];
  }

  return v3;
}

- (int)StringAsFeedbackRequestType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_REQUEST_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_REQUEST_TYPE_SUBMISSION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_REQUEST_TYPE_ID_LOOKUP"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_REQUEST_TYPE_QUERY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_REQUEST_TYPE_IMAGE_UPLOAD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_REQUEST_TYPE_LAYOUT_CONFIG"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_REQUEST_TYPE_TDM_FRAUD_NOTIFICATION"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_REQUEST_TYPE_LOG_EVENT"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readFeedbackRequestParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeedbackRequestParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasFeedbackRequestParameters
{
  return self->_feedbackRequestParameters != 0;
}

- (GEORPFeedbackRequestParameters)feedbackRequestParameters
{
  -[GEORPFeedbackRequest _readFeedbackRequestParameters]((uint64_t)self);
  feedbackRequestParameters = self->_feedbackRequestParameters;

  return feedbackRequestParameters;
}

- (void)setFeedbackRequestParameters:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_feedbackRequestParameters, a3);
}

- (void)_readUserInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasUserInfo
{
  return self->_userInfo != 0;
}

- (GEORPFeedbackUserInfo)userInfo
{
  -[GEORPFeedbackRequest _readUserInfo]((uint64_t)self);
  userInfo = self->_userInfo;

  return userInfo;
}

- (void)setUserInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC00u;
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void)_readAnalyticMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnalyticMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasAnalyticMetadata
{
  return self->_analyticMetadata != 0;
}

- (GEOPDAnalyticMetadata)analyticMetadata
{
  -[GEORPFeedbackRequest _readAnalyticMetadata]((uint64_t)self);
  analyticMetadata = self->_analyticMetadata;

  return analyticMetadata;
}

- (void)setAnalyticMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  objc_storeStrong((id *)&self->_analyticMetadata, a3);
}

- (void)_readClientMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasClientMetadata
{
  return self->_clientMetadata != 0;
}

- (GEOPDClientMetadata)clientMetadata
{
  -[GEORPFeedbackRequest _readClientMetadata]((uint64_t)self);
  clientMetadata = self->_clientMetadata;

  return clientMetadata;
}

- (void)setClientMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  objc_storeStrong((id *)&self->_clientMetadata, a3);
}

- (void)_readClientCapabilities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientCapabilities_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasClientCapabilities
{
  return self->_clientCapabilities != 0;
}

- (GEORPClientCapabilities)clientCapabilities
{
  -[GEORPFeedbackRequest _readClientCapabilities]((uint64_t)self);
  clientCapabilities = self->_clientCapabilities;

  return clientCapabilities;
}

- (void)setClientCapabilities:(id)a3
{
  *(_WORD *)&self->_flags |= 0x820u;
  objc_storeStrong((id *)&self->_clientCapabilities, a3);
}

- (void)_readDisplayLanguages
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayLanguages_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)displayLanguages
{
  -[GEORPFeedbackRequest _readDisplayLanguages]((uint64_t)self);
  displayLanguages = self->_displayLanguages;

  return displayLanguages;
}

- (void)setDisplayLanguages:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  displayLanguages = self->_displayLanguages;
  self->_displayLanguages = v4;
}

- (void)clearDisplayLanguages
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  displayLanguages = self->_displayLanguages;

  [(NSMutableArray *)displayLanguages removeAllObjects];
}

- (void)addDisplayLanguage:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackRequest _readDisplayLanguages]((uint64_t)self);
  -[GEORPFeedbackRequest _addNoFlagsDisplayLanguage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsDisplayLanguage:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      id v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)displayLanguagesCount
{
  -[GEORPFeedbackRequest _readDisplayLanguages]((uint64_t)self);
  displayLanguages = self->_displayLanguages;

  return [(NSMutableArray *)displayLanguages count];
}

- (id)displayLanguageAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackRequest _readDisplayLanguages]((uint64_t)self);
  displayLanguages = self->_displayLanguages;

  return (id)[(NSMutableArray *)displayLanguages objectAtIndex:a3];
}

+ (Class)displayLanguageType
{
  return (Class)objc_opt_class();
}

- (void)_readAbClientMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbClientMetadata_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasAbClientMetadata
{
  return self->_abClientMetadata != 0;
}

- (GEOABSecondPartyPlaceRequestClientMetaData)abClientMetadata
{
  -[GEORPFeedbackRequest _readAbClientMetadata]((uint64_t)self);
  abClientMetadata = self->_abClientMetadata;

  return abClientMetadata;
}

- (void)setAbClientMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  objc_storeStrong((id *)&self->_abClientMetadata, a3);
}

- (void)_readFeedbackClientCapabilities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeedbackClientCapabilities_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)feedbackClientCapabilitiesCount
{
  return self->_feedbackClientCapabilities.count;
}

- (int)feedbackClientCapabilities
{
  return self->_feedbackClientCapabilities.list;
}

- (void)clearFeedbackClientCapabilities
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;

  PBRepeatedInt32Clear();
}

- (void)addFeedbackClientCapabilities:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (int)feedbackClientCapabilitiesAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackRequest _readFeedbackClientCapabilities]((uint64_t)self);
  p_feedbackClientCapabilities = &self->_feedbackClientCapabilities;
  unint64_t count = self->_feedbackClientCapabilities.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_feedbackClientCapabilities->list[a3];
}

- (void)setFeedbackClientCapabilities:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;

  MEMORY[0x1F4147390](&self->_feedbackClientCapabilities, a3, a4);
}

- (id)feedbackClientCapabilitiesAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"FEEDBACK_CLIENT_CAPABILITIES_COMMUNITY_ID";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"FEEDBACK_CLIENT_CAPABILITIES_UNKNOWN";
  }
  return v4;
}

- (int)StringAsFeedbackClientCapabilities:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_CLIENT_CAPABILITIES_UNKNOWN"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"FEEDBACK_CLIENT_CAPABILITIES_COMMUNITY_ID"];
  }

  return v4;
}

- (void)_readDebugSettings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDebugSettings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasDebugSettings
{
  return self->_debugSettings != 0;
}

- (GEORPDebugSettings)debugSettings
{
  -[GEORPFeedbackRequest _readDebugSettings]((uint64_t)self);
  debugSettings = self->_debugSettings;

  return debugSettings;
}

- (void)setDebugSettings:(id)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  objc_storeStrong((id *)&self->_debugSettings, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackRequest;
  int v4 = [(GEORPFeedbackRequest *)&v8 description];
  id v5 = [(GEORPFeedbackRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(_WORD *)(a1 + 128))
    {
      uint64_t v5 = *(int *)(a1 + 124);
      if (v5 >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 124));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53DBB60[v5];
      }
      if (a2) {
        id v7 = @"feedbackRequestType";
      }
      else {
        id v7 = @"feedback_request_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 feedbackRequestParameters];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"feedbackRequestParameters";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"feedback_request_parameters";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = [(id)a1 userInfo];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"userInfo";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"user_info";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = [(id)a1 analyticMetadata];
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"analyticMetadata";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"analytic_metadata";
      }
      [v4 setObject:v18 forKey:v19];
    }
    v20 = [(id)a1 clientMetadata];
    v21 = v20;
    if (v20)
    {
      if (a2)
      {
        v22 = [v20 jsonRepresentation];
        v23 = @"clientMetadata";
      }
      else
      {
        v22 = [v20 dictionaryRepresentation];
        v23 = @"client_metadata";
      }
      [v4 setObject:v22 forKey:v23];
    }
    v24 = [(id)a1 clientCapabilities];
    v25 = v24;
    if (v24)
    {
      if (a2)
      {
        v26 = [v24 jsonRepresentation];
        v27 = @"clientCapabilities";
      }
      else
      {
        v26 = [v24 dictionaryRepresentation];
        v27 = @"client_capabilities";
      }
      [v4 setObject:v26 forKey:v27];
    }
    if (*(void *)(a1 + 88))
    {
      v28 = [(id)a1 displayLanguages];
      if (a2) {
        v29 = @"displayLanguage";
      }
      else {
        v29 = @"display_language";
      }
      [v4 setObject:v28 forKey:v29];
    }
    v30 = [(id)a1 abClientMetadata];
    v31 = v30;
    if (v30)
    {
      if (a2)
      {
        v32 = [v30 jsonRepresentation];
        v33 = @"abClientMetadata";
      }
      else
      {
        v32 = [v30 dictionaryRepresentation];
        v33 = @"ab_client_metadata";
      }
      [v4 setObject:v32 forKey:v33];
    }
    if (*(void *)(a1 + 32))
    {
      v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v35 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v36 = 0;
        do
        {
          uint64_t v37 = *(unsigned int *)(*v35 + 4 * v36);
          if (v37)
          {
            if (v37 == 1)
            {
              v38 = @"FEEDBACK_CLIENT_CAPABILITIES_COMMUNITY_ID";
            }
            else
            {
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v37);
              v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v38 = @"FEEDBACK_CLIENT_CAPABILITIES_UNKNOWN";
          }
          [v34 addObject:v38];

          ++v36;
          v35 = (void *)(a1 + 24);
        }
        while (v36 < *(void *)(a1 + 32));
      }
      if (a2) {
        v39 = @"feedbackClientCapabilities";
      }
      else {
        v39 = @"feedback_client_capabilities";
      }
      [v4 setObject:v34 forKey:v39];
    }
    v40 = [(id)a1 debugSettings];
    v41 = v40;
    if (v40)
    {
      if (a2)
      {
        v42 = [v40 jsonRepresentation];
        v43 = @"debugSettings";
      }
      else
      {
        v42 = [v40 dictionaryRepresentation];
        v43 = @"debug_settings";
      }
      [v4 setObject:v42 forKey:v43];
    }
    v44 = *(void **)(a1 + 16);
    if (v44)
    {
      v45 = [v44 dictionaryRepresentation];
      v46 = v45;
      if (a2)
      {
        v47 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v45, "count"));
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __50__GEORPFeedbackRequest__dictionaryRepresentation___block_invoke;
        v51[3] = &unk_1E53D8860;
        id v48 = v47;
        id v52 = v48;
        [v46 enumerateKeysAndObjectsUsingBlock:v51];
        id v49 = v48;

        v46 = v49;
      }
      [v4 setObject:v46 forKey:@"Unknown Fields"];
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
  return -[GEORPFeedbackRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEORPFeedbackRequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (GEORPFeedbackRequest)initWithDictionary:(id)a3
{
  return (GEORPFeedbackRequest *)-[GEORPFeedbackRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_119;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_119;
  }
  if (a3) {
    objc_super v6 = @"feedbackRequestType";
  }
  else {
    objc_super v6 = @"feedback_request_type";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"FEEDBACK_REQUEST_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_REQUEST_TYPE_SUBMISSION"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_REQUEST_TYPE_ID_LOOKUP"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_REQUEST_TYPE_QUERY"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_REQUEST_TYPE_IMAGE_UPLOAD"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_REQUEST_TYPE_LAYOUT_CONFIG"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_REQUEST_TYPE_TDM_FRAUD_NOTIFICATION"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_REQUEST_TYPE_LOG_EVENT"])
    {
      uint64_t v9 = 7;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_27:
    [a1 setFeedbackRequestType:v9];
  }

  if (a3) {
    id v10 = @"feedbackRequestParameters";
  }
  else {
    id v10 = @"feedback_request_parameters";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [GEORPFeedbackRequestParameters alloc];
    if (a3) {
      uint64_t v13 = [(GEORPFeedbackRequestParameters *)v12 initWithJSON:v11];
    }
    else {
      uint64_t v13 = [(GEORPFeedbackRequestParameters *)v12 initWithDictionary:v11];
    }
    v14 = (void *)v13;
    [a1 setFeedbackRequestParameters:v13];
  }
  if (a3) {
    v15 = @"userInfo";
  }
  else {
    v15 = @"user_info";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [GEORPFeedbackUserInfo alloc];
    if (a3) {
      uint64_t v18 = [(GEORPFeedbackUserInfo *)v17 initWithJSON:v16];
    }
    else {
      uint64_t v18 = [(GEORPFeedbackUserInfo *)v17 initWithDictionary:v16];
    }
    v19 = (void *)v18;
    [a1 setUserInfo:v18];
  }
  if (a3) {
    v20 = @"analyticMetadata";
  }
  else {
    v20 = @"analytic_metadata";
  }
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = [GEOPDAnalyticMetadata alloc];
    if (a3) {
      uint64_t v23 = [(GEOPDAnalyticMetadata *)v22 initWithJSON:v21];
    }
    else {
      uint64_t v23 = [(GEOPDAnalyticMetadata *)v22 initWithDictionary:v21];
    }
    v24 = (void *)v23;
    [a1 setAnalyticMetadata:v23];
  }
  if (a3) {
    v25 = @"clientMetadata";
  }
  else {
    v25 = @"client_metadata";
  }
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = [GEOPDClientMetadata alloc];
    if (a3) {
      uint64_t v28 = [(GEOPDClientMetadata *)v27 initWithJSON:v26];
    }
    else {
      uint64_t v28 = [(GEOPDClientMetadata *)v27 initWithDictionary:v26];
    }
    v29 = (void *)v28;
    [a1 setClientMetadata:v28];
  }
  if (a3) {
    v30 = @"clientCapabilities";
  }
  else {
    v30 = @"client_capabilities";
  }
  v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v32 = [GEORPClientCapabilities alloc];
    if (a3) {
      uint64_t v33 = [(GEORPClientCapabilities *)v32 initWithJSON:v31];
    }
    else {
      uint64_t v33 = [(GEORPClientCapabilities *)v32 initWithDictionary:v31];
    }
    v34 = (void *)v33;
    [a1 setClientCapabilities:v33];
  }
  if (a3) {
    v35 = @"displayLanguage";
  }
  else {
    v35 = @"display_language";
  }
  unint64_t v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v37 = a3;
    id v38 = v5;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v39 = v36;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v73 objects:v78 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v74 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v45 = (void *)[v44 copy];
            [a1 addDisplayLanguage:v45];
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v73 objects:v78 count:16];
      }
      while (v41);
    }

    id v5 = v38;
    a3 = v37;
  }

  if (a3) {
    v46 = @"abClientMetadata";
  }
  else {
    v46 = @"ab_client_metadata";
  }
  v47 = [v5 objectForKeyedSubscript:v46];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v48 = [GEOABSecondPartyPlaceRequestClientMetaData alloc];
    if (a3) {
      uint64_t v49 = [(GEOABSecondPartyPlaceRequestClientMetaData *)v48 initWithJSON:v47];
    }
    else {
      uint64_t v49 = [(GEOABSecondPartyPlaceRequestClientMetaData *)v48 initWithDictionary:v47];
    }
    v50 = (void *)v49;
    [a1 setAbClientMetadata:v49];
  }
  if (a3) {
    v51 = @"feedbackClientCapabilities";
  }
  else {
    v51 = @"feedback_client_capabilities";
  }
  id v52 = [v5 objectForKeyedSubscript:v51];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v67 = a3;
    id v68 = v5;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v53 = v52;
    uint64_t v54 = [v53 countByEnumeratingWithState:&v69 objects:v77 count:16];
    if (!v54) {
      goto LABEL_109;
    }
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v70;
    while (1)
    {
      for (uint64_t j = 0; j != v55; ++j)
      {
        if (*(void *)v70 != v56) {
          objc_enumerationMutation(v53);
        }
        v58 = *(void **)(*((void *)&v69 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v59 = v58;
          if ([v59 isEqualToString:@"FEEDBACK_CLIENT_CAPABILITIES_UNKNOWN"]) {
            uint64_t v60 = 0;
          }
          else {
            uint64_t v60 = [v59 isEqualToString:@"FEEDBACK_CLIENT_CAPABILITIES_COMMUNITY_ID"];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v60 = [v58 intValue];
        }
        [a1 addFeedbackClientCapabilities:v60];
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v69 objects:v77 count:16];
      if (!v55)
      {
LABEL_109:

        id v5 = v68;
        a3 = v67;
        break;
      }
    }
  }

  if (a3) {
    v61 = @"debugSettings";
  }
  else {
    v61 = @"debug_settings";
  }
  v62 = [v5 objectForKeyedSubscript:v61];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v63 = [GEORPDebugSettings alloc];
    if (a3) {
      uint64_t v64 = [(GEORPDebugSettings *)v63 initWithJSON:v62];
    }
    else {
      uint64_t v64 = [(GEORPDebugSettings *)v63 initWithDictionary:v62];
    }
    v65 = (void *)v64;
    [a1 setDebugSettings:v64];
  }
LABEL_119:

  return a1;
}

- (GEORPFeedbackRequest)initWithJSON:(id)a3
{
  return (GEORPFeedbackRequest *)-[GEORPFeedbackRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_1833;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_1834;
    }
    GEORPFeedbackRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPFeedbackRequestCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPFeedbackRequestIsDirty((uint64_t)self) & 1) == 0)
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackRequest *)self readAll:0];
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_feedbackRequestParameters) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_userInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_analyticMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_clientMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_clientCapabilities) {
      PBDataWriterWriteSubmessage();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v6 = self->_displayLanguages;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    if (self->_abClientMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_feedbackClientCapabilities.count)
    {
      PBDataWriterPlaceMark();
      if (self->_feedbackClientCapabilities.count)
      {
        unint64_t v10 = 0;
        do
        {
          PBDataWriterWriteInt32Field();
          ++v10;
        }
        while (v10 < self->_feedbackClientCapabilities.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_debugSettings) {
      PBDataWriterWriteSubmessage();
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v4];
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPFeedbackRequest _readClientMetadata]((uint64_t)self);
  if ([(GEOPDClientMetadata *)self->_clientMetadata hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPFeedbackRequest _readFeedbackRequestParameters]((uint64_t)self);
  feedbackRequestParameters = self->_feedbackRequestParameters;

  return [(GEORPFeedbackRequestParameters *)feedbackRequestParameters hasGreenTeaWithValue:v3];
}

- (unsigned)requestTypeCode
{
  return 1015;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  v11 = (id *)a3;
  [(GEORPFeedbackRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 28) = self->_readerMarkPos;
  *((_DWORD *)v11 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(_WORD *)&self->_flags)
  {
    *((_DWORD *)v11 + 31) = self->_feedbackRequestType;
    *((_WORD *)v11 + 64) |= 1u;
  }
  if (self->_feedbackRequestParameters) {
    objc_msgSend(v11, "setFeedbackRequestParameters:");
  }
  if (self->_userInfo) {
    objc_msgSend(v11, "setUserInfo:");
  }
  if (self->_analyticMetadata) {
    objc_msgSend(v11, "setAnalyticMetadata:");
  }
  if (self->_clientMetadata) {
    objc_msgSend(v11, "setClientMetadata:");
  }
  if (self->_clientCapabilities) {
    objc_msgSend(v11, "setClientCapabilities:");
  }
  if ([(GEORPFeedbackRequest *)self displayLanguagesCount])
  {
    [v11 clearDisplayLanguages];
    unint64_t v4 = [(GEORPFeedbackRequest *)self displayLanguagesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPFeedbackRequest *)self displayLanguageAtIndex:i];
        [v11 addDisplayLanguage:v7];
      }
    }
  }
  if (self->_abClientMetadata) {
    objc_msgSend(v11, "setAbClientMetadata:");
  }
  if ([(GEORPFeedbackRequest *)self feedbackClientCapabilitiesCount])
  {
    [v11 clearFeedbackClientCapabilities];
    unint64_t v8 = [(GEORPFeedbackRequest *)self feedbackClientCapabilitiesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        objc_msgSend(v11, "addFeedbackClientCapabilities:", -[GEORPFeedbackRequest feedbackClientCapabilitiesAtIndex:](self, "feedbackClientCapabilitiesAtIndex:", j));
    }
  }
  if (self->_debugSettings) {
    objc_msgSend(v11, "setDebugSettings:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPFeedbackRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackRequest *)self readAll:0];
  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 124) = self->_feedbackRequestType;
    *(_WORD *)(v5 + 128) |= 1u;
  }
  id v9 = [(GEORPFeedbackRequestParameters *)self->_feedbackRequestParameters copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v9;

  id v11 = [(GEORPFeedbackUserInfo *)self->_userInfo copyWithZone:a3];
  v12 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v11;

  id v13 = [(GEOPDAnalyticMetadata *)self->_analyticMetadata copyWithZone:a3];
  long long v14 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v13;

  id v15 = [(GEOPDClientMetadata *)self->_clientMetadata copyWithZone:a3];
  long long v16 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v15;

  id v17 = [(GEORPClientCapabilities *)self->_clientCapabilities copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v17;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v19 = self->_displayLanguages;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "copyWithZone:", a3, (void)v30);
        [(id)v5 addDisplayLanguage:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v20);
  }

  id v24 = [(GEOABSecondPartyPlaceRequestClientMetaData *)self->_abClientMetadata copyWithZone:a3];
  v25 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v24;

  PBRepeatedInt32Copy();
  id v26 = [(GEORPDebugSettings *)self->_debugSettings copyWithZone:a3];
  v27 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v26;

  uint64_t v28 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v28;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  [(GEORPFeedbackRequest *)self readAll:1];
  [v4 readAll:1];
  __int16 v5 = *((_WORD *)v4 + 64);
  if (*(_WORD *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_feedbackRequestType != *((_DWORD *)v4 + 31)) {
      goto LABEL_24;
    }
  }
  else if (v5)
  {
LABEL_24:
    char v14 = 0;
    goto LABEL_25;
  }
  feedbackRequestParameters = self->_feedbackRequestParameters;
  if ((unint64_t)feedbackRequestParameters | *((void *)v4 + 12)
    && !-[GEORPFeedbackRequestParameters isEqual:](feedbackRequestParameters, "isEqual:"))
  {
    goto LABEL_24;
  }
  userInfo = self->_userInfo;
  if ((unint64_t)userInfo | *((void *)v4 + 13))
  {
    if (!-[GEORPFeedbackUserInfo isEqual:](userInfo, "isEqual:")) {
      goto LABEL_24;
    }
  }
  analyticMetadata = self->_analyticMetadata;
  if ((unint64_t)analyticMetadata | *((void *)v4 + 7))
  {
    if (!-[GEOPDAnalyticMetadata isEqual:](analyticMetadata, "isEqual:")) {
      goto LABEL_24;
    }
  }
  clientMetadata = self->_clientMetadata;
  if ((unint64_t)clientMetadata | *((void *)v4 + 9))
  {
    if (!-[GEOPDClientMetadata isEqual:](clientMetadata, "isEqual:")) {
      goto LABEL_24;
    }
  }
  clientCapabilities = self->_clientCapabilities;
  if ((unint64_t)clientCapabilities | *((void *)v4 + 8))
  {
    if (!-[GEORPClientCapabilities isEqual:](clientCapabilities, "isEqual:")) {
      goto LABEL_24;
    }
  }
  displayLanguages = self->_displayLanguages;
  if ((unint64_t)displayLanguages | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](displayLanguages, "isEqual:")) {
      goto LABEL_24;
    }
  }
  abClientMetadata = self->_abClientMetadata;
  if ((unint64_t)abClientMetadata | *((void *)v4 + 6))
  {
    if (!-[GEOABSecondPartyPlaceRequestClientMetaData isEqual:](abClientMetadata, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_24;
  }
  debugSettings = self->_debugSettings;
  if ((unint64_t)debugSettings | *((void *)v4 + 10)) {
    char v14 = -[GEORPDebugSettings isEqual:](debugSettings, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_25:

  return v14;
}

- (unint64_t)hash
{
  [(GEORPFeedbackRequest *)self readAll:1];
  if (*(_WORD *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_feedbackRequestType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEORPFeedbackRequestParameters *)self->_feedbackRequestParameters hash] ^ v3;
  unint64_t v5 = [(GEORPFeedbackUserInfo *)self->_userInfo hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOPDAnalyticMetadata *)self->_analyticMetadata hash];
  unint64_t v7 = [(GEOPDClientMetadata *)self->_clientMetadata hash];
  unint64_t v8 = v7 ^ [(GEORPClientCapabilities *)self->_clientCapabilities hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableArray *)self->_displayLanguages hash];
  unint64_t v10 = [(GEOABSecondPartyPlaceRequestClientMetaData *)self->_abClientMetadata hash];
  uint64_t v11 = v10 ^ PBRepeatedInt32Hash();
  return v9 ^ v11 ^ [(GEORPDebugSettings *)self->_debugSettings hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((_WORD *)v4 + 64))
  {
    self->_feedbackRequestType = *((_DWORD *)v4 + 31);
    *(_WORD *)&self->_flags |= 1u;
  }
  feedbackRequestParameters = self->_feedbackRequestParameters;
  uint64_t v6 = *((void *)v4 + 12);
  if (feedbackRequestParameters)
  {
    if (v6) {
      -[GEORPFeedbackRequestParameters mergeFrom:](feedbackRequestParameters, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORPFeedbackRequest setFeedbackRequestParameters:](self, "setFeedbackRequestParameters:");
  }
  userInfo = self->_userInfo;
  uint64_t v8 = *((void *)v4 + 13);
  if (userInfo)
  {
    if (v8) {
      -[GEORPFeedbackUserInfo mergeFrom:](userInfo, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEORPFeedbackRequest setUserInfo:](self, "setUserInfo:");
  }
  analyticMetadata = self->_analyticMetadata;
  uint64_t v10 = *((void *)v4 + 7);
  if (analyticMetadata)
  {
    if (v10) {
      -[GEOPDAnalyticMetadata mergeFrom:](analyticMetadata, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[GEORPFeedbackRequest setAnalyticMetadata:](self, "setAnalyticMetadata:");
  }
  clientMetadata = self->_clientMetadata;
  uint64_t v12 = *((void *)v4 + 9);
  if (clientMetadata)
  {
    if (v12) {
      -[GEOPDClientMetadata mergeFrom:](clientMetadata, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[GEORPFeedbackRequest setClientMetadata:](self, "setClientMetadata:");
  }
  clientCapabilities = self->_clientCapabilities;
  uint64_t v14 = *((void *)v4 + 8);
  if (clientCapabilities)
  {
    if (v14) {
      -[GEORPClientCapabilities mergeFrom:](clientCapabilities, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[GEORPFeedbackRequest setClientCapabilities:](self, "setClientCapabilities:");
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = *((id *)v4 + 11);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        -[GEORPFeedbackRequest addDisplayLanguage:](self, "addDisplayLanguage:", *(void *)(*((void *)&v27 + 1) + 8 * i), (void)v27);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v17);
  }

  abClientMetadata = self->_abClientMetadata;
  uint64_t v21 = *((void *)v4 + 6);
  if (abClientMetadata)
  {
    if (v21) {
      -[GEOABSecondPartyPlaceRequestClientMetaData mergeFrom:](abClientMetadata, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[GEORPFeedbackRequest setAbClientMetadata:](self, "setAbClientMetadata:");
  }
  uint64_t v22 = objc_msgSend(v4, "feedbackClientCapabilitiesCount", (void)v27);
  if (v22)
  {
    uint64_t v23 = v22;
    for (uint64_t j = 0; j != v23; ++j)
      -[GEORPFeedbackRequest addFeedbackClientCapabilities:](self, "addFeedbackClientCapabilities:", [v4 feedbackClientCapabilitiesAtIndex:j]);
  }
  debugSettings = self->_debugSettings;
  uint64_t v26 = *((void *)v4 + 10);
  if (debugSettings)
  {
    if (v26) {
      -[GEORPDebugSettings mergeFrom:](debugSettings, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[GEORPFeedbackRequest setDebugSettings:](self, "setDebugSettings:");
  }
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
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1839);
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
  *(_WORD *)&self->_flags |= 0x802u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPFeedbackRequest *)self readAll:0];
    [(GEORPFeedbackRequestParameters *)self->_feedbackRequestParameters clearUnknownFields:1];
    [(GEORPFeedbackUserInfo *)self->_userInfo clearUnknownFields:1];
    [(GEOPDAnalyticMetadata *)self->_analyticMetadata clearUnknownFields:1];
    [(GEOPDClientMetadata *)self->_clientMetadata clearUnknownFields:1];
    abClientMetadata = self->_abClientMetadata;
    [(GEOABSecondPartyPlaceRequestClientMetaData *)abClientMetadata clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_feedbackRequestParameters, 0);
  objc_storeStrong((id *)&self->_displayLanguages, 0);
  objc_storeStrong((id *)&self->_debugSettings, 0);
  objc_storeStrong((id *)&self->_clientMetadata, 0);
  objc_storeStrong((id *)&self->_clientCapabilities, 0);
  objc_storeStrong((id *)&self->_analyticMetadata, 0);
  objc_storeStrong((id *)&self->_abClientMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEORPFeedbackRequest)initWithFeedbackRequestParameters:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(GEORPFeedbackRequest *)self init];
  uint64_t v9 = v8;
  if (v8) {
    [(GEORPFeedbackRequest *)v8 _sharedInitWithRequestParameters:v6 userInfo:0 traits:v7 debugSettings:0];
  }

  return v9;
}

- (GEORPFeedbackRequest)initWithFeedbackRequestParameters:(id)a3 userInfo:(id)a4 traits:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(GEORPFeedbackRequest *)self init];
  uint64_t v12 = v11;
  if (v11) {
    [(GEORPFeedbackRequest *)v11 _sharedInitWithRequestParameters:v8 userInfo:v9 traits:v10 debugSettings:0];
  }

  return v12;
}

- (GEORPFeedbackRequest)initWithFeedbackRequestParameters:(id)a3 userInfo:(id)a4 traits:(id)a5 debugSettings:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(GEORPFeedbackRequest *)self init];
  id v15 = v14;
  if (v14) {
    [(GEORPFeedbackRequest *)v14 _sharedInitWithRequestParameters:v10 userInfo:v11 traits:v12 debugSettings:v13];
  }

  return v15;
}

- (GEORPFeedbackRequest)initWithFeedbackRequestParameters:(id)a3 userCredentials:(id)a4 pushToken:(id)a5 allowContactBackAtEmailAddress:(id)a6 traits:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(GEORPFeedbackRequest *)self init];
  if (v17)
  {
    uint64_t v18 = objc_alloc_init(GEORPFeedbackUserInfo);
    [(GEORPFeedbackUserInfo *)v18 setUserCredentials:v13];
    [(GEORPFeedbackUserInfo *)v18 setUserEmail:v15];
    [(GEORPFeedbackUserInfo *)v18 setDevicePushToken:v14];
    [(GEORPFeedbackRequest *)v17 _sharedInitWithRequestParameters:v12 userInfo:v18 traits:v16 debugSettings:0];
  }
  return v17;
}

+ (id)clientTestingDebugSettings
{
  v2 = objc_alloc_init(GEORPDebugSettings);
  BOOL v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", @"CLIENT_TEST", 0);
  [(GEORPDebugSettings *)v2 setKeywords:v3];

  return v2;
}

+ (id)defaultDebugSettingsMergedWithSettings:(id)a3
{
  id v3 = a3;
  id v4 = _getValue(GeoServicesConfig_RAPDebugSubmissionKeywords, (uint64_t)off_1E9114DE8, 1, 0, 0, 0);
  unint64_t v5 = [v4 componentsSeparatedByString:@","];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__GEORPFeedbackRequest_GEORPProtoExtras__defaultDebugSettingsMergedWithSettings___block_invoke;
  v10[3] = &unk_1E53F64A0;
  id v7 = v6;
  id v11 = v7;
  [v5 enumerateObjectsUsingBlock:v10];
  if ([v7 count]
    && (id v8 = objc_alloc_init(GEORPDebugSettings),
        [(GEORPDebugSettings *)v8 setKeywords:v7],
        v8))
  {
    if (v3) {
      [(GEORPDebugSettings *)v8 mergeFrom:v3];
    }
  }
  else
  {
    id v8 = (GEORPDebugSettings *)v3;
  }

  return v8;
}

void __81__GEORPFeedbackRequest_GEORPProtoExtras__defaultDebugSettingsMergedWithSettings___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a2;
  id v6 = [v3 whitespaceCharacterSet];
  unint64_t v5 = [v4 stringByTrimmingCharactersInSet:v6];

  [v2 addObject:v5];
}

- (void)_sharedInitWithRequestParameters:(id)a3 userInfo:(id)a4 traits:(id)a5 debugSettings:(id)a6
{
  id v29 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [(GEORPFeedbackRequest *)self setFeedbackRequestParameters:v29];
  [(GEORPFeedbackRequest *)self setUserInfo:v10];
  id v13 = [[GEOPDAnalyticMetadata alloc] initWithTraits:v11];
  [(GEORPFeedbackRequest *)self setAnalyticMetadata:v13];

  id v14 = [v29 submissionParameters];
  int v15 = [v14 type];

  if (v15 != 11)
  {
    id v16 = [(GEORPFeedbackRequest *)self analyticMetadata];
    [v16 setHasSessionId:0];

    uint64_t v17 = [(GEORPFeedbackRequest *)self analyticMetadata];
    [v17 setHasSequenceNumber:0];

    uint64_t v18 = [(GEORPFeedbackRequest *)self analyticMetadata];
    [v18 setHasRelativeTimestamp:0];
  }
  v19 = +[GEOPlatform sharedPlatform];
  int v20 = [v19 isInternalInstall];

  if (v20) {
    [(GEORPFeedbackRequest *)self setDebugSettings:v12];
  }
  uint64_t v21 = [[GEOPDClientMetadata alloc] initWithTraits:v11];
  [(GEORPFeedbackRequest *)self setClientMetadata:v21];

  uint64_t v22 = [v11 deviceDisplayLanguages];
  uint64_t v23 = (void *)[v22 mutableCopy];
  [(GEORPFeedbackRequest *)self setDisplayLanguages:v23];

  id v24 = objc_alloc_init(GEORPClientCapabilities);
  [(GEORPClientCapabilities *)v24 setHasConstrainedProblemStatusSize:0];
  [(GEORPClientCapabilities *)v24 setHasNoOptInRequest:1];
  [(GEORPClientCapabilities *)v24 setHasSupportForIdsBasedNotifications:1];
  v25 = +[GEOPlatform sharedPlatform];
  uint64_t v26 = [v25 clientCapabilities];
  -[GEORPClientCapabilities setTransitMarketSupport:](v24, "setTransitMarketSupport:", [v26 transitMarketSupport]);

  [(GEORPFeedbackRequest *)self setClientCapabilities:v24];
  [(GEORPFeedbackRequest *)self addFeedbackClientCapabilities:1];
  if ((GEOConfigGetBOOL(GeoServicesConfig_IncludeSensitiveDataInRAP, (uint64_t)off_1E9113E38) & 1) == 0) {
    [v10 setUserEmail:0];
  }
  if ([v29 isPOIEnrichment])
  {
    if ([v29 hasQueryParameters])
    {
      long long v27 = [(GEORPFeedbackRequest *)self clientMetadata];
      [v27 setDeviceExtendedLocation:0];
    }
    [v10 setUserEmail:0];
    [v10 setPreferredEmail:0];
    long long v28 = [(GEORPFeedbackRequest *)self analyticMetadata];
    [v28 clearServiceTags];
  }
  [(GEORPFeedbackRequest *)self _initForSubmissionParameters];
}

- (void)_initForSubmissionParameters
{
  id v9 = [(GEORPFeedbackRequest *)self feedbackRequestParameters];
  id v3 = [v9 submissionParameters];

  if (v3)
  {
    [(GEORPFeedbackRequest *)self _setupSubmissionParameters];
    uint64_t v4 = 1;
  }
  else
  {
    unint64_t v5 = [v9 queryParameters];

    if (v5)
    {
      uint64_t v4 = 3;
    }
    else
    {
      id v6 = [v9 imageUploadParameters];

      if (v6)
      {
        uint64_t v4 = 4;
      }
      else
      {
        id v7 = [v9 layoutConfigParameters];

        if (v7)
        {
          uint64_t v4 = 5;
        }
        else
        {
          id v8 = [v9 tdmFraudNotificationParameters];

          if (v8) {
            uint64_t v4 = 6;
          }
          else {
            uint64_t v4 = 0;
          }
        }
      }
    }
  }
  [(GEORPFeedbackRequest *)self setFeedbackRequestType:v4];
}

- (void)_setupSubmissionParameters
{
  v2 = [(GEORPFeedbackRequest *)self feedbackRequestParameters];
  id v3 = [v2 submissionParameters];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
    unint64_t v5 = [v4 UUIDString];

    [v3 setClientSubmissionUuid:v5];
    id v6 = [v3 commonContext];

    if (!v6)
    {
      id v7 = objc_alloc_init(GEORPFeedbackCommonContext);
      [v3 setCommonContext:v7];
    }
    id v8 = [v3 commonContext];
    [v8 recordEnvironmentAndManifestURLs];

    double Current = CFAbsoluteTimeGetCurrent();
    id v10 = [v3 commonContext];
    [v10 setClientCreatedAt:Current];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: submissionParams != ((void *)0)", v11, 2u);
  }
}

- (BOOL)isPOIEnrichment
{
  v2 = [(GEORPFeedbackRequest *)self feedbackRequestParameters];
  char v3 = [v2 isPOIEnrichment];

  return v3;
}

@end