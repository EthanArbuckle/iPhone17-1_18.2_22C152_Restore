@interface GEOTileRequest
- (BOOL)shouldParticipateInBalancer;
- (GEOApplicationAuditToken)auditToken;
- (GEOResourceManifestConfiguration)manifestConfiguration;
- (GEOTileKeyList)keyList;
- (GEOTileKeyMap)additionalInfos;
- (GEOTileKeyMap)cachedData;
- (GEOTileKeyMap)cachedEtags;
- (GEOTileKeyMap)createTimes;
- (GEOTileKeyMap)priorities;
- (GEOTileKeyMap)signpostIDs;
- (GEOTileRequest)init;
- (GEOTileRequest)initWithKeyList:(id)a3 manifestConfiguration:(id)a4 locale:(id)a5;
- (GEOTileRequest)initWithKeyList:(id)a3 manifestConfiguration:(id)a4 locale:(id)a5 cachedEtags:(id)a6 cachedData:(id)a7 priorities:(id)a8 signpostIDs:(id)a9 createTimes:(id)a10 additionalInfos:(id)a11 auditToken:(id)a12 constraints:(unint64_t)a13 backgroundSessionIdentifier:(id)a14 shouldParticipateInBalancer:(BOOL)a15 reason:(unsigned __int8)a16;
- (NSLocale)locale;
- (NSString)backgroundSessionIdentifier;
- (id)description;
- (unint64_t)constraints;
- (unsigned)loadReason;
@end

@implementation GEOTileRequest

- (GEOTileRequest)initWithKeyList:(id)a3 manifestConfiguration:(id)a4 locale:(id)a5 cachedEtags:(id)a6 cachedData:(id)a7 priorities:(id)a8 signpostIDs:(id)a9 createTimes:(id)a10 additionalInfos:(id)a11 auditToken:(id)a12 constraints:(unint64_t)a13 backgroundSessionIdentifier:(id)a14 shouldParticipateInBalancer:(BOOL)a15 reason:(unsigned __int8)a16
{
  id v40 = a3;
  id v39 = a4;
  id v31 = a5;
  id v38 = a5;
  id v37 = a6;
  id v32 = a7;
  id v36 = a7;
  id v35 = a8;
  id v34 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  id v24 = a14;
  v41.receiver = self;
  v41.super_class = (Class)GEOTileRequest;
  v25 = [(GEOTileRequest *)&v41 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_keyList, a3);
    objc_storeStrong((id *)&v26->_manifestConfiguration, a4);
    objc_storeStrong((id *)&v26->_locale, v31);
    objc_storeStrong((id *)&v26->_cachedEtags, a6);
    objc_storeStrong((id *)&v26->_cachedData, v32);
    objc_storeStrong((id *)&v26->_priorities, a8);
    objc_storeStrong((id *)&v26->_signpostIDs, a9);
    objc_storeStrong((id *)&v26->_createTimes, a10);
    objc_storeStrong((id *)&v26->_additionalInfos, a11);
    objc_storeStrong((id *)&v26->_auditToken, a12);
    v26->_constraints = a13 & 0xF0;
    uint64_t v27 = [v24 copy];
    backgroundSessionIdentifier = v26->_backgroundSessionIdentifier;
    v26->_backgroundSessionIdentifier = (NSString *)v27;

    v26->_shouldParticipateInBalancer = a15;
    v26->_loadReason = a16;
  }

  return v26;
}

- (GEOResourceManifestConfiguration)manifestConfiguration
{
  return self->_manifestConfiguration;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (GEOTileKeyList)keyList
{
  return self->_keyList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_additionalInfos, 0);
  objc_storeStrong((id *)&self->_createTimes, 0);
  objc_storeStrong((id *)&self->_signpostIDs, 0);
  objc_storeStrong((id *)&self->_priorities, 0);
  objc_storeStrong((id *)&self->_cachedData, 0);
  objc_storeStrong((id *)&self->_cachedEtags, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);

  objc_storeStrong((id *)&self->_keyList, 0);
}

- (GEOTileKeyMap)signpostIDs
{
  return self->_signpostIDs;
}

- (GEOTileRequest)init
{
  result = (GEOTileRequest *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOTileRequest)initWithKeyList:(id)a3 manifestConfiguration:(id)a4 locale:(id)a5
{
  LOWORD(v6) = 1;
  return -[GEOTileRequest initWithKeyList:manifestConfiguration:locale:cachedEtags:cachedData:priorities:signpostIDs:createTimes:additionalInfos:auditToken:constraints:backgroundSessionIdentifier:shouldParticipateInBalancer:reason:](self, "initWithKeyList:manifestConfiguration:locale:cachedEtags:cachedData:priorities:signpostIDs:createTimes:additionalInfos:auditToken:constraints:backgroundSessionIdentifier:shouldParticipateInBalancer:reason:", a3, a4, a5, 0, 0, 0, 0, 0, 0, 0, 0, 0, v6);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  keyList = self->_keyList;
  if (keyList)
  {
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"key list: %p (%zu)", keyList, -[GEOTileKeyList count](self->_keyList, "count"));
    [v3 addObject:v5];
  }
  if (self->_manifestConfiguration)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"manifest: %p", self->_manifestConfiguration);
    [v3 addObject:v6];
  }
  locale = self->_locale;
  if (locale)
  {
    v8 = NSString;
    v9 = [(NSLocale *)locale localeIdentifier];
    v10 = [v8 stringWithFormat:@"locale: %@", v9];
    [v3 addObject:v10];
  }
  cachedEtags = self->_cachedEtags;
  if (cachedEtags)
  {
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"cached Etags: %p (%zu)", cachedEtags, -[GEOTileKeyMap count](self->_cachedEtags, "count"));
    [v3 addObject:v12];
  }
  cachedData = self->_cachedData;
  if (cachedData)
  {
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"cached data: %p (%zu)", cachedData, -[GEOTileKeyMap count](self->_cachedData, "count"));
    [v3 addObject:v14];
  }
  priorities = self->_priorities;
  if (priorities)
  {
    v16 = objc_msgSend(NSString, "stringWithFormat:", @"priorities: %p (%zu)", priorities, -[GEOTileKeyMap count](self->_priorities, "count"));
    [v3 addObject:v16];
  }
  createTimes = self->_createTimes;
  if (createTimes)
  {
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"create times: %p (%zu)", createTimes, -[GEOTileKeyMap count](self->_createTimes, "count"));
    [v3 addObject:v18];
  }
  additionalInfos = self->_additionalInfos;
  if (additionalInfos)
  {
    v20 = objc_msgSend(NSString, "stringWithFormat:", @"additional infos: %p (%zu)", additionalInfos, -[GEOTileKeyMap count](self->_additionalInfos, "count"));
    [v3 addObject:v20];
  }
  if (self->_auditToken)
  {
    id v21 = objc_msgSend(NSString, "stringWithFormat:", @"audit token: %p", self->_auditToken);
    [v3 addObject:v21];
  }
  unint64_t constraints = self->_constraints;
  if ((constraints & 0x10) != 0)
  {
    [v3 addObject:@"requires inexpensive network"];
    unint64_t constraints = self->_constraints;
    if ((constraints & 0x20) == 0)
    {
LABEL_21:
      if ((constraints & 0x40) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((constraints & 0x20) == 0)
  {
    goto LABEL_21;
  }
  [v3 addObject:@"requires power"];
  if ((self->_constraints & 0x40) != 0) {
LABEL_22:
  }
    [v3 addObject:@"requires unconstrained"];
LABEL_23:
  if (self->_backgroundSessionIdentifier)
  {
    id v23 = [NSString stringWithFormat:@"background session: %@", self->_backgroundSessionIdentifier];
    [v3 addObject:v23];
  }
  id v24 = NSString;
  uint64_t v25 = objc_opt_class();
  v26 = [v3 componentsJoinedByString:@", "];
  uint64_t v27 = [v24 stringWithFormat:@"<%@: %p> %@", v25, self, v26];

  return v27;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (GEOTileKeyMap)cachedEtags
{
  return self->_cachedEtags;
}

- (GEOTileKeyMap)cachedData
{
  return self->_cachedData;
}

- (GEOTileKeyMap)priorities
{
  return self->_priorities;
}

- (GEOTileKeyMap)createTimes
{
  return self->_createTimes;
}

- (GEOTileKeyMap)additionalInfos
{
  return self->_additionalInfos;
}

- (unint64_t)constraints
{
  return self->_constraints;
}

- (NSString)backgroundSessionIdentifier
{
  return self->_backgroundSessionIdentifier;
}

- (BOOL)shouldParticipateInBalancer
{
  return self->_shouldParticipateInBalancer;
}

- (unsigned)loadReason
{
  return self->_loadReason;
}

@end