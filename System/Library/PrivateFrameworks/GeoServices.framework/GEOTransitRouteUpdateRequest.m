@interface GEOTransitRouteUpdateRequest
+ (BOOL)isValid:(id)a3;
+ (Class)originalWaypointType;
+ (Class)routeIdentifierType;
+ (Class)serviceTagType;
+ (id)mergedTransitRouteUpdateRequests:(id)a3;
+ (id)splitTransitRouteUpdateRequests:(id)a3;
+ (id)transitRouteUpdateRequestWithDirectionsRequest:(id)a3 directionsResponse:(id)a4;
+ (id)transitRouteUpdateRequestWithDirectionsRequest:(id)a3 directionsResponse:(id)a4 composedRoutes:(id)a5;
- (BOOL)hasAbClientMetadata;
- (BOOL)hasDirectionsResponseId;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasOriginalAdditionalEnabledMarkets;
- (BOOL)hasOriginalClientCapabilities;
- (BOOL)hasOriginalRouteAttributes;
- (BOOL)hasPrivacyMetadata;
- (BOOL)hasRequestingAppId;
- (BOOL)hasSessionId;
- (BOOL)hasSessionRelativeTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOAdditionalEnabledMarkets)originalAdditionalEnabledMarkets;
- (GEOClientCapabilities)originalClientCapabilities;
- (GEOPDABClientDatasetMetadata)abClientMetadata;
- (GEOPrivacyMetadata)privacyMetadata;
- (GEORouteAttributes)originalRouteAttributes;
- (GEOSessionID)sessionId;
- (GEOTransitRouteUpdateRequest)init;
- (GEOTransitRouteUpdateRequest)initWithData:(id)a3;
- (GEOTransitRouteUpdateRequest)initWithDictionary:(id)a3;
- (GEOTransitRouteUpdateRequest)initWithJSON:(id)a3;
- (NSArray)allClientRouteIDs;
- (NSData)directionsResponseId;
- (NSMutableArray)originalWaypoints;
- (NSMutableArray)routeIdentifiers;
- (NSMutableArray)serviceTags;
- (NSString)requestingAppId;
- (NSUUID)clientRouteID;
- (PBUnknownFields)unknownFields;
- (double)sessionRelativeTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)originalWaypointAtIndex:(unint64_t)a3;
- (id)routeIdentifierAtIndex:(unint64_t)a3;
- (id)serviceTagAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)originalWaypointsCount;
- (unint64_t)routeIdentifiersCount;
- (unint64_t)serviceTagsCount;
- (unsigned)requestTypeCode;
- (void)_addNoFlagsOriginalWaypoint:(uint64_t)a1;
- (void)_addNoFlagsRouteIdentifier:(uint64_t)a1;
- (void)_addNoFlagsServiceTag:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAbClientMetadata;
- (void)_readDirectionsResponseId;
- (void)_readOriginalAdditionalEnabledMarkets;
- (void)_readOriginalClientCapabilities;
- (void)_readOriginalRouteAttributes;
- (void)_readOriginalWaypoints;
- (void)_readPrivacyMetadata;
- (void)_readRequestingAppId;
- (void)_readRouteIdentifiers;
- (void)_readServiceTags;
- (void)addOriginalWaypoint:(id)a3;
- (void)addRouteIdentifier:(id)a3;
- (void)addServiceTag:(id)a3;
- (void)clearOriginalWaypoints;
- (void)clearRouteIdentifiers;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearServiceTags;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbClientMetadata:(id)a3;
- (void)setDirectionsResponseId:(id)a3;
- (void)setHasSessionId:(BOOL)a3;
- (void)setHasSessionRelativeTimestamp:(BOOL)a3;
- (void)setOriginalAdditionalEnabledMarkets:(id)a3;
- (void)setOriginalClientCapabilities:(id)a3;
- (void)setOriginalRouteAttributes:(id)a3;
- (void)setOriginalWaypoints:(id)a3;
- (void)setPrivacyMetadata:(id)a3;
- (void)setRequestingAppId:(id)a3;
- (void)setRouteIdentifiers:(id)a3;
- (void)setServiceTags:(id)a3;
- (void)setSessionId:(GEOSessionID)a3;
- (void)setSessionRelativeTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitRouteUpdateRequest

- (GEOTransitRouteUpdateRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitRouteUpdateRequest;
  v2 = [(GEOTransitRouteUpdateRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitRouteUpdateRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitRouteUpdateRequest;
  v3 = [(GEOTransitRouteUpdateRequest *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRouteIdentifiers
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteIdentifiers_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)routeIdentifiers
{
  -[GEOTransitRouteUpdateRequest _readRouteIdentifiers]((uint64_t)self);
  routeIdentifiers = self->_routeIdentifiers;

  return routeIdentifiers;
}

- (void)setRouteIdentifiers:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  routeIdentifiers = self->_routeIdentifiers;
  self->_routeIdentifiers = v4;
}

- (void)clearRouteIdentifiers
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  routeIdentifiers = self->_routeIdentifiers;

  [(NSMutableArray *)routeIdentifiers removeAllObjects];
}

- (void)addRouteIdentifier:(id)a3
{
  id v4 = a3;
  -[GEOTransitRouteUpdateRequest _readRouteIdentifiers]((uint64_t)self);
  -[GEOTransitRouteUpdateRequest _addNoFlagsRouteIdentifier:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsRouteIdentifier:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 104);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v5;

      id v4 = *(void **)(a1 + 104);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)routeIdentifiersCount
{
  -[GEOTransitRouteUpdateRequest _readRouteIdentifiers]((uint64_t)self);
  routeIdentifiers = self->_routeIdentifiers;

  return [(NSMutableArray *)routeIdentifiers count];
}

- (id)routeIdentifierAtIndex:(unint64_t)a3
{
  -[GEOTransitRouteUpdateRequest _readRouteIdentifiers]((uint64_t)self);
  routeIdentifiers = self->_routeIdentifiers;

  return (id)[(NSMutableArray *)routeIdentifiers objectAtIndex:a3];
}

+ (Class)routeIdentifierType
{
  return (Class)objc_opt_class();
}

- (void)_readOriginalClientCapabilities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalClientCapabilities_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasOriginalClientCapabilities
{
  return self->_originalClientCapabilities != 0;
}

- (GEOClientCapabilities)originalClientCapabilities
{
  -[GEOTransitRouteUpdateRequest _readOriginalClientCapabilities]((uint64_t)self);
  originalClientCapabilities = self->_originalClientCapabilities;

  return originalClientCapabilities;
}

- (void)setOriginalClientCapabilities:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2040u;
  objc_storeStrong((id *)&self->_originalClientCapabilities, a3);
}

- (void)_readAbClientMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbClientMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasAbClientMetadata
{
  return self->_abClientMetadata != 0;
}

- (GEOPDABClientDatasetMetadata)abClientMetadata
{
  -[GEOTransitRouteUpdateRequest _readAbClientMetadata]((uint64_t)self);
  abClientMetadata = self->_abClientMetadata;

  return abClientMetadata;
}

- (void)setAbClientMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2008u;
  objc_storeStrong((id *)&self->_abClientMetadata, a3);
}

- (void)_readOriginalWaypoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalWaypoints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)originalWaypoints
{
  -[GEOTransitRouteUpdateRequest _readOriginalWaypoints]((uint64_t)self);
  originalWaypoints = self->_originalWaypoints;

  return originalWaypoints;
}

- (void)setOriginalWaypoints:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  originalWaypoints = self->_originalWaypoints;
  self->_originalWaypoints = v4;
}

- (void)clearOriginalWaypoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  originalWaypoints = self->_originalWaypoints;

  [(NSMutableArray *)originalWaypoints removeAllObjects];
}

- (void)addOriginalWaypoint:(id)a3
{
  id v4 = a3;
  -[GEOTransitRouteUpdateRequest _readOriginalWaypoints]((uint64_t)self);
  -[GEOTransitRouteUpdateRequest _addNoFlagsOriginalWaypoint:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsOriginalWaypoint:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 80);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v5;

      id v4 = *(void **)(a1 + 80);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)originalWaypointsCount
{
  -[GEOTransitRouteUpdateRequest _readOriginalWaypoints]((uint64_t)self);
  originalWaypoints = self->_originalWaypoints;

  return [(NSMutableArray *)originalWaypoints count];
}

- (id)originalWaypointAtIndex:(unint64_t)a3
{
  -[GEOTransitRouteUpdateRequest _readOriginalWaypoints]((uint64_t)self);
  originalWaypoints = self->_originalWaypoints;

  return (id)[(NSMutableArray *)originalWaypoints objectAtIndex:a3];
}

+ (Class)originalWaypointType
{
  return (Class)objc_opt_class();
}

- (void)_readOriginalRouteAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalRouteAttributes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasOriginalRouteAttributes
{
  return self->_originalRouteAttributes != 0;
}

- (GEORouteAttributes)originalRouteAttributes
{
  -[GEOTransitRouteUpdateRequest _readOriginalRouteAttributes]((uint64_t)self);
  originalRouteAttributes = self->_originalRouteAttributes;

  return originalRouteAttributes;
}

- (void)setOriginalRouteAttributes:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2080u;
  objc_storeStrong((id *)&self->_originalRouteAttributes, a3);
}

- (void)_readOriginalAdditionalEnabledMarkets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalAdditionalEnabledMarkets_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasOriginalAdditionalEnabledMarkets
{
  return self->_originalAdditionalEnabledMarkets != 0;
}

- (GEOAdditionalEnabledMarkets)originalAdditionalEnabledMarkets
{
  -[GEOTransitRouteUpdateRequest _readOriginalAdditionalEnabledMarkets]((uint64_t)self);
  originalAdditionalEnabledMarkets = self->_originalAdditionalEnabledMarkets;

  return originalAdditionalEnabledMarkets;
}

- (void)setOriginalAdditionalEnabledMarkets:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2020u;
  objc_storeStrong((id *)&self->_originalAdditionalEnabledMarkets, a3);
}

- (void)_readDirectionsResponseId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsResponseId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasDirectionsResponseId
{
  return self->_directionsResponseId != 0;
}

- (NSData)directionsResponseId
{
  -[GEOTransitRouteUpdateRequest _readDirectionsResponseId]((uint64_t)self);
  directionsResponseId = self->_directionsResponseId;

  return directionsResponseId;
}

- (void)setDirectionsResponseId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  objc_storeStrong((id *)&self->_directionsResponseId, a3);
}

- (void)_readRequestingAppId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestingAppId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasRequestingAppId
{
  return self->_requestingAppId != 0;
}

- (NSString)requestingAppId
{
  -[GEOTransitRouteUpdateRequest _readRequestingAppId]((uint64_t)self);
  requestingAppId = self->_requestingAppId;

  return requestingAppId;
}

- (void)setRequestingAppId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2400u;
  objc_storeStrong((id *)&self->_requestingAppId, a3);
}

- (void)_readPrivacyMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrivacyMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasPrivacyMetadata
{
  return self->_privacyMetadata != 0;
}

- (GEOPrivacyMetadata)privacyMetadata
{
  -[GEOTransitRouteUpdateRequest _readPrivacyMetadata]((uint64_t)self);
  privacyMetadata = self->_privacyMetadata;

  return privacyMetadata;
}

- (void)setPrivacyMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2200u;
  objc_storeStrong((id *)&self->_privacyMetadata, a3);
}

- (GEOSessionID)sessionId
{
  p_sessionId = &self->_sessionId;
  unint64_t high = self->_sessionId._high;
  unint64_t low = p_sessionId->_low;
  result._unint64_t low = low;
  result._unint64_t high = high;
  return result;
}

- (void)setSessionId:(GEOSessionID)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_sessionId = a3;
}

- (void)setHasSessionId:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasSessionId
{
  return *(_WORD *)&self->_flags & 1;
}

- (double)sessionRelativeTimestamp
{
  return self->_sessionRelativeTimestamp;
}

- (void)setSessionRelativeTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_sessionRelativeTimestamp = a3;
}

- (void)setHasSessionRelativeTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8194;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasSessionRelativeTimestamp
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readServiceTags
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServiceTags_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)serviceTags
{
  -[GEOTransitRouteUpdateRequest _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return serviceTags;
}

- (void)setServiceTags:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  serviceTags = self->_serviceTags;
  self->_serviceTags = v4;
}

- (void)clearServiceTags
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  serviceTags = self->_serviceTags;

  [(NSMutableArray *)serviceTags removeAllObjects];
}

- (void)addServiceTag:(id)a3
{
  id v4 = a3;
  -[GEOTransitRouteUpdateRequest _readServiceTags]((uint64_t)self);
  -[GEOTransitRouteUpdateRequest _addNoFlagsServiceTag:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsServiceTag:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 112);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v5;

      id v4 = *(void **)(a1 + 112);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)serviceTagsCount
{
  -[GEOTransitRouteUpdateRequest _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return [(NSMutableArray *)serviceTags count];
}

- (id)serviceTagAtIndex:(unint64_t)a3
{
  -[GEOTransitRouteUpdateRequest _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return (id)[(NSMutableArray *)serviceTags objectAtIndex:a3];
}

+ (Class)serviceTagType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitRouteUpdateRequest;
  id v4 = [(GEOTransitRouteUpdateRequest *)&v8 description];
  id v5 = [(GEOTransitRouteUpdateRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitRouteUpdateRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 104) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v6 = *(id *)(a1 + 104);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v79 objects:v85 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v80;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v80 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v79 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v79 objects:v85 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"routeIdentifier";
      }
      else {
        v13 = @"route_identifier";
      }
      [v4 setObject:v5 forKey:v13];
    }
    v14 = [(id)a1 originalClientCapabilities];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"originalClientCapabilities";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"original_client_capabilities";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = [(id)a1 abClientMetadata];
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"abClientMetadata";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"ab_client_metadata";
      }
      [v4 setObject:v20 forKey:v21];
    }
    if ([*(id *)(a1 + 80) count])
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v23 = *(id *)(a1 + 80);
      uint64_t v24 = [v23 countByEnumeratingWithState:&v75 objects:v84 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v76;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v76 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v75 + 1) + 8 * j);
            if (a2) {
              [v28 jsonRepresentation];
            }
            else {
            v29 = [v28 dictionaryRepresentation];
            }
            [v22 addObject:v29];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v75 objects:v84 count:16];
        }
        while (v25);
      }

      if (a2) {
        v30 = @"originalWaypoint";
      }
      else {
        v30 = @"original_waypoint";
      }
      [v4 setObject:v22 forKey:v30];
    }
    v31 = [(id)a1 originalRouteAttributes];
    v32 = v31;
    if (v31)
    {
      if (a2)
      {
        v33 = [v31 jsonRepresentation];
        v34 = @"originalRouteAttributes";
      }
      else
      {
        v33 = [v31 dictionaryRepresentation];
        v34 = @"original_route_attributes";
      }
      [v4 setObject:v33 forKey:v34];
    }
    v35 = [(id)a1 originalAdditionalEnabledMarkets];
    v36 = v35;
    if (v35)
    {
      if (a2)
      {
        v37 = [v35 jsonRepresentation];
        v38 = @"originalAdditionalEnabledMarkets";
      }
      else
      {
        v37 = [v35 dictionaryRepresentation];
        v38 = @"original_additional_enabled_markets";
      }
      [v4 setObject:v37 forKey:v38];
    }
    v39 = [(id)a1 directionsResponseId];
    v40 = v39;
    if (v39)
    {
      if (a2)
      {
        v41 = [v39 base64EncodedStringWithOptions:0];
        [v4 setObject:v41 forKey:@"directionsResponseId"];
      }
      else
      {
        [v4 setObject:v39 forKey:@"directions_response_id"];
      }
    }

    v42 = [(id)a1 requestingAppId];
    if (v42)
    {
      if (a2) {
        v43 = @"requestingAppId";
      }
      else {
        v43 = @"requesting_app_id";
      }
      [v4 setObject:v42 forKey:v43];
    }

    v44 = [(id)a1 privacyMetadata];
    v45 = v44;
    if (v44)
    {
      if (a2)
      {
        v46 = [v44 jsonRepresentation];
        v47 = @"privacyMetadata";
      }
      else
      {
        v46 = [v44 dictionaryRepresentation];
        v47 = @"privacy_metadata";
      }
      [v4 setObject:v46 forKey:v47];
    }
    __int16 v48 = *(_WORD *)(a1 + 140);
    if (v48)
    {
      v49 = _GEOSessionIDDictionaryRepresentation((void *)(a1 + 24));
      if (a2) {
        v50 = @"sessionId";
      }
      else {
        v50 = @"session_id";
      }
      [v4 setObject:v49 forKey:v50];

      __int16 v48 = *(_WORD *)(a1 + 140);
    }
    if ((v48 & 2) != 0)
    {
      v51 = [NSNumber numberWithDouble:*(double *)(a1 + 120)];
      if (a2) {
        v52 = @"sessionRelativeTimestamp";
      }
      else {
        v52 = @"session_relative_timestamp";
      }
      [v4 setObject:v51 forKey:v52];
    }
    if ([*(id *)(a1 + 112) count])
    {
      v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v54 = *(id *)(a1 + 112);
      uint64_t v55 = [v54 countByEnumeratingWithState:&v71 objects:v83 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = *(void *)v72;
        do
        {
          for (uint64_t k = 0; k != v56; ++k)
          {
            if (*(void *)v72 != v57) {
              objc_enumerationMutation(v54);
            }
            v59 = *(void **)(*((void *)&v71 + 1) + 8 * k);
            if (a2) {
              [v59 jsonRepresentation];
            }
            else {
            v60 = [v59 dictionaryRepresentation];
            }
            [v53 addObject:v60];
          }
          uint64_t v56 = [v54 countByEnumeratingWithState:&v71 objects:v83 count:16];
        }
        while (v56);
      }

      if (a2) {
        v61 = @"serviceTag";
      }
      else {
        v61 = @"service_tag";
      }
      [v4 setObject:v53 forKey:v61];
    }
    v62 = *(void **)(a1 + 16);
    if (v62)
    {
      v63 = [v62 dictionaryRepresentation];
      v64 = v63;
      if (a2)
      {
        v65 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v63, "count"));
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __58__GEOTransitRouteUpdateRequest__dictionaryRepresentation___block_invoke;
        v69[3] = &unk_1E53D8860;
        id v66 = v65;
        id v70 = v66;
        [v64 enumerateKeysAndObjectsUsingBlock:v69];
        id v67 = v66;

        v64 = v67;
      }
      [v4 setObject:v64 forKey:@"Unknown Fields"];
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
  return -[GEOTransitRouteUpdateRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __58__GEOTransitRouteUpdateRequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOTransitRouteUpdateRequest)initWithDictionary:(id)a3
{
  return (GEOTransitRouteUpdateRequest *)-[GEOTransitRouteUpdateRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"routeIdentifier";
      }
      else {
        id v6 = @"route_identifier";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v75 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v86 objects:v92 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v87;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v87 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v86 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEOTransitRouteIdentifier alloc];
                if (a3) {
                  uint64_t v15 = [(GEOTransitRouteIdentifier *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOTransitRouteIdentifier *)v14 initWithDictionary:v13];
                }
                v16 = (void *)v15;
                [a1 addRouteIdentifier:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v86 objects:v92 count:16];
          }
          while (v10);
        }

        id v5 = v75;
      }

      if (a3) {
        v17 = @"originalClientCapabilities";
      }
      else {
        v17 = @"original_client_capabilities";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [GEOClientCapabilities alloc];
        if (a3) {
          uint64_t v20 = [(GEOClientCapabilities *)v19 initWithJSON:v18];
        }
        else {
          uint64_t v20 = [(GEOClientCapabilities *)v19 initWithDictionary:v18];
        }
        v21 = (void *)v20;
        [a1 setOriginalClientCapabilities:v20];
      }
      if (a3) {
        v22 = @"abClientMetadata";
      }
      else {
        v22 = @"ab_client_metadata";
      }
      id v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v24 = [GEOPDABClientDatasetMetadata alloc];
        if (a3) {
          uint64_t v25 = [(GEOPDABClientDatasetMetadata *)v24 initWithJSON:v23];
        }
        else {
          uint64_t v25 = [(GEOPDABClientDatasetMetadata *)v24 initWithDictionary:v23];
        }
        uint64_t v26 = (void *)v25;
        [a1 setAbClientMetadata:v25];
      }
      if (a3) {
        v27 = @"originalWaypoint";
      }
      else {
        v27 = @"original_waypoint";
      }
      v28 = [v5 objectForKeyedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id v29 = v28;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v82 objects:v91 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v83;
          do
          {
            for (uint64_t j = 0; j != v31; ++j)
            {
              if (*(void *)v83 != v32) {
                objc_enumerationMutation(v29);
              }
              uint64_t v34 = *(void *)(*((void *)&v82 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v35 = [GEOWaypointTyped alloc];
                if (a3) {
                  uint64_t v36 = [(GEOWaypointTyped *)v35 initWithJSON:v34];
                }
                else {
                  uint64_t v36 = [(GEOWaypointTyped *)v35 initWithDictionary:v34];
                }
                v37 = (void *)v36;
                [a1 addOriginalWaypoint:v36];
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v82 objects:v91 count:16];
          }
          while (v31);
        }

        id v5 = v75;
      }

      if (a3) {
        v38 = @"originalRouteAttributes";
      }
      else {
        v38 = @"original_route_attributes";
      }
      v39 = [v5 objectForKeyedSubscript:v38];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v40 = [GEORouteAttributes alloc];
        if (a3) {
          uint64_t v41 = [(GEORouteAttributes *)v40 initWithJSON:v39];
        }
        else {
          uint64_t v41 = [(GEORouteAttributes *)v40 initWithDictionary:v39];
        }
        v42 = (void *)v41;
        [a1 setOriginalRouteAttributes:v41];
      }
      if (a3) {
        v43 = @"originalAdditionalEnabledMarkets";
      }
      else {
        v43 = @"original_additional_enabled_markets";
      }
      v44 = [v5 objectForKeyedSubscript:v43];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v45 = [GEOAdditionalEnabledMarkets alloc];
        if (a3) {
          uint64_t v46 = [(GEOAdditionalEnabledMarkets *)v45 initWithJSON:v44];
        }
        else {
          uint64_t v46 = [(GEOAdditionalEnabledMarkets *)v45 initWithDictionary:v44];
        }
        v47 = (void *)v46;
        [a1 setOriginalAdditionalEnabledMarkets:v46];
      }
      if (a3) {
        __int16 v48 = @"directionsResponseId";
      }
      else {
        __int16 v48 = @"directions_response_id";
      }
      v49 = [v5 objectForKeyedSubscript:v48];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v50 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v49 options:0];
        [a1 setDirectionsResponseId:v50];
      }
      if (a3) {
        v51 = @"requestingAppId";
      }
      else {
        v51 = @"requesting_app_id";
      }
      v52 = [v5 objectForKeyedSubscript:v51];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v53 = (void *)[v52 copy];
        [a1 setRequestingAppId:v53];
      }
      if (a3) {
        id v54 = @"privacyMetadata";
      }
      else {
        id v54 = @"privacy_metadata";
      }
      uint64_t v55 = [v5 objectForKeyedSubscript:v54];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v56 = [GEOPrivacyMetadata alloc];
        if (a3) {
          uint64_t v57 = [(GEOPrivacyMetadata *)v56 initWithJSON:v55];
        }
        else {
          uint64_t v57 = [(GEOPrivacyMetadata *)v56 initWithDictionary:v55];
        }
        v58 = (void *)v57;
        [a1 setPrivacyMetadata:v57];
      }
      if (a3) {
        v59 = @"sessionId";
      }
      else {
        v59 = @"session_id";
      }
      v60 = [v5 objectForKeyedSubscript:v59];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v80 = 0;
        uint64_t v81 = 0;
        _GEOSessionIDFromDictionaryRepresentation(v60, &v80);
        objc_msgSend(a1, "setSessionId:", v80, v81);
      }

      if (a3) {
        v61 = @"sessionRelativeTimestamp";
      }
      else {
        v61 = @"session_relative_timestamp";
      }
      v62 = [v5 objectForKeyedSubscript:v61];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v62 doubleValue];
        objc_msgSend(a1, "setSessionRelativeTimestamp:");
      }

      if (a3) {
        v63 = @"serviceTag";
      }
      else {
        v63 = @"service_tag";
      }
      v64 = [v5 objectForKeyedSubscript:v63];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v65 = v64;
        uint64_t v66 = [v65 countByEnumeratingWithState:&v76 objects:v90 count:16];
        if (v66)
        {
          uint64_t v67 = v66;
          uint64_t v68 = *(void *)v77;
          do
          {
            for (uint64_t k = 0; k != v67; ++k)
            {
              if (*(void *)v77 != v68) {
                objc_enumerationMutation(v65);
              }
              uint64_t v70 = *(void *)(*((void *)&v76 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v71 = [GEOGeoServiceTag alloc];
                if (a3) {
                  uint64_t v72 = [(GEOGeoServiceTag *)v71 initWithJSON:v70];
                }
                else {
                  uint64_t v72 = [(GEOGeoServiceTag *)v71 initWithDictionary:v70];
                }
                long long v73 = (void *)v72;
                [a1 addServiceTag:v72];
              }
            }
            uint64_t v67 = [v65 countByEnumeratingWithState:&v76 objects:v90 count:16];
          }
          while (v67);
        }

        id v5 = v75;
      }
    }
  }

  return a1;
}

- (GEOTransitRouteUpdateRequest)initWithJSON:(id)a3
{
  return (GEOTransitRouteUpdateRequest *)-[GEOTransitRouteUpdateRequest _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_296;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_297;
    }
    GEOTransitRouteUpdateRequestReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTransitRouteUpdateRequestCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitRouteUpdateRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitRouteUpdateRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitRouteUpdateRequestIsDirty((uint64_t)self) & 1) == 0)
  {
    v19 = self->_reader;
    objc_sync_enter(v19);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v20 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v20];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitRouteUpdateRequest *)self readAll:0];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v6 = self->_routeIdentifiers;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v7);
    }

    if (self->_originalClientCapabilities) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_abClientMetadata) {
      PBDataWriterWriteSubmessage();
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v10 = self->_originalWaypoints;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v11);
    }

    if (self->_originalRouteAttributes) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_originalAdditionalEnabledMarkets) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_directionsResponseId) {
      PBDataWriterWriteDataField();
    }
    if (self->_requestingAppId) {
      PBDataWriterWriteStringField();
    }
    if (self->_privacyMetadata) {
      PBDataWriterWriteSubmessage();
    }
    __int16 flags = (__int16)self->_flags;
    if (flags)
    {
      uint64_t v25 = 0;
      PBDataWriterPlaceMark();
      PBDataWriterWriteUint64Field();
      PBDataWriterWriteUint64Field();
      PBDataWriterRecallMark();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteDoubleField();
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v15 = self->_serviceTags;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t k = 0; k != v16; ++k)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v15);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v34 count:16];
      }
      while (v16);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v21);
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOTransitRouteUpdateRequest _readOriginalWaypoints]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_originalWaypoints;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (unsigned)requestTypeCode
{
  return 1026;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  v18 = (id *)a3;
  [(GEOTransitRouteUpdateRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v18 + 1, self->_reader);
  *((_DWORD *)v18 + 32) = self->_readerMarkPos;
  *((_DWORD *)v18 + 33) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOTransitRouteUpdateRequest *)self routeIdentifiersCount])
  {
    [v18 clearRouteIdentifiers];
    unint64_t v4 = [(GEOTransitRouteUpdateRequest *)self routeIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOTransitRouteUpdateRequest *)self routeIdentifierAtIndex:i];
        [v18 addRouteIdentifier:v7];
      }
    }
  }
  if (self->_originalClientCapabilities) {
    objc_msgSend(v18, "setOriginalClientCapabilities:");
  }
  if (self->_abClientMetadata) {
    objc_msgSend(v18, "setAbClientMetadata:");
  }
  if ([(GEOTransitRouteUpdateRequest *)self originalWaypointsCount])
  {
    [v18 clearOriginalWaypoints];
    unint64_t v8 = [(GEOTransitRouteUpdateRequest *)self originalWaypointsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOTransitRouteUpdateRequest *)self originalWaypointAtIndex:j];
        [v18 addOriginalWaypoint:v11];
      }
    }
  }
  if (self->_originalRouteAttributes) {
    objc_msgSend(v18, "setOriginalRouteAttributes:");
  }
  long long v12 = v18;
  if (self->_originalAdditionalEnabledMarkets)
  {
    objc_msgSend(v18, "setOriginalAdditionalEnabledMarkets:");
    long long v12 = v18;
  }
  if (self->_directionsResponseId)
  {
    objc_msgSend(v18, "setDirectionsResponseId:");
    long long v12 = v18;
  }
  if (self->_requestingAppId)
  {
    objc_msgSend(v18, "setRequestingAppId:");
    long long v12 = v18;
  }
  if (self->_privacyMetadata)
  {
    objc_msgSend(v18, "setPrivacyMetadata:");
    long long v12 = v18;
  }
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *(GEOSessionID *)(v12 + 3) = self->_sessionId;
    *((_WORD *)v12 + 70) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v12[15] = *(id *)&self->_sessionRelativeTimestamp;
    *((_WORD *)v12 + 70) |= 2u;
  }
  if ([(GEOTransitRouteUpdateRequest *)self serviceTagsCount])
  {
    [v18 clearServiceTags];
    unint64_t v14 = [(GEOTransitRouteUpdateRequest *)self serviceTagsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        uint64_t v17 = [(GEOTransitRouteUpdateRequest *)self serviceTagAtIndex:k];
        [v18 addServiceTag:v17];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x2000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTransitRouteUpdateRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_31;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitRouteUpdateRequest *)self readAll:0];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  unint64_t v9 = self->_routeIdentifiers;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v49 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addRouteIdentifier:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v10);
  }

  id v14 = [(GEOClientCapabilities *)self->_originalClientCapabilities copyWithZone:a3];
  unint64_t v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  id v16 = [(GEOPDABClientDatasetMetadata *)self->_abClientMetadata copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v16;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v18 = self->_originalWaypoints;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v46 != v20) {
          objc_enumerationMutation(v18);
        }
        long long v22 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addOriginalWaypoint:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v19);
  }

  id v23 = [(GEORouteAttributes *)self->_originalRouteAttributes copyWithZone:a3];
  long long v24 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v23;

  id v25 = [(GEOAdditionalEnabledMarkets *)self->_originalAdditionalEnabledMarkets copyWithZone:a3];
  long long v26 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v25;

  uint64_t v27 = [(NSData *)self->_directionsResponseId copyWithZone:a3];
  long long v28 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v27;

  uint64_t v29 = [(NSString *)self->_requestingAppId copyWithZone:a3];
  long long v30 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v29;

  id v31 = [(GEOPrivacyMetadata *)self->_privacyMetadata copyWithZone:a3];
  long long v32 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v31;

  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *(GEOSessionID *)(v5 + 24) = self->_sessionId;
    *(_WORD *)(v5 + 140) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(double *)(v5 + 120) = self->_sessionRelativeTimestamp;
    *(_WORD *)(v5 + 140) |= 2u;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v34 = self->_serviceTags;
  uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v42;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(v34);
        }
        v38 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * k), "copyWithZone:", a3, (void)v41);
        [(id)v5 addServiceTag:v38];
      }
      uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v35);
  }

  v39 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v39;
LABEL_31:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  [(GEOTransitRouteUpdateRequest *)self readAll:1];
  [v4 readAll:1];
  routeIdentifiers = self->_routeIdentifiers;
  if ((unint64_t)routeIdentifiers | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](routeIdentifiers, "isEqual:")) {
      goto LABEL_36;
    }
  }
  originalClientCapabilities = self->_originalClientCapabilities;
  if ((unint64_t)originalClientCapabilities | *((void *)v4 + 8))
  {
    if (!-[GEOClientCapabilities isEqual:](originalClientCapabilities, "isEqual:")) {
      goto LABEL_36;
    }
  }
  abClientMetadata = self->_abClientMetadata;
  if ((unint64_t)abClientMetadata | *((void *)v4 + 5))
  {
    if (!-[GEOPDABClientDatasetMetadata isEqual:](abClientMetadata, "isEqual:")) {
      goto LABEL_36;
    }
  }
  originalWaypoints = self->_originalWaypoints;
  if ((unint64_t)originalWaypoints | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](originalWaypoints, "isEqual:")) {
      goto LABEL_36;
    }
  }
  originalRouteAttributes = self->_originalRouteAttributes;
  if ((unint64_t)originalRouteAttributes | *((void *)v4 + 9))
  {
    if (!-[GEORouteAttributes isEqual:](originalRouteAttributes, "isEqual:")) {
      goto LABEL_36;
    }
  }
  originalAdditionalEnabledMarkets = self->_originalAdditionalEnabledMarkets;
  if ((unint64_t)originalAdditionalEnabledMarkets | *((void *)v4 + 7))
  {
    if (!-[GEOAdditionalEnabledMarkets isEqual:](originalAdditionalEnabledMarkets, "isEqual:")) {
      goto LABEL_36;
    }
  }
  directionsResponseId = self->_directionsResponseId;
  if ((unint64_t)directionsResponseId | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](directionsResponseId, "isEqual:")) {
      goto LABEL_36;
    }
  }
  requestingAppId = self->_requestingAppId;
  if ((unint64_t)requestingAppId | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](requestingAppId, "isEqual:")) {
      goto LABEL_36;
    }
  }
  privacyMetadata = self->_privacyMetadata;
  if ((unint64_t)privacyMetadata | *((void *)v4 + 11))
  {
    if (!-[GEOPrivacyMetadata isEqual:](privacyMetadata, "isEqual:")) {
      goto LABEL_36;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v15 = *((_WORD *)v4 + 70);
  if (flags)
  {
    if ((v15 & 1) == 0) {
      goto LABEL_36;
    }
    if (self->_sessionId._high != *((void *)v4 + 3) || self->_sessionId._low != *((void *)v4 + 4)) {
      goto LABEL_36;
    }
  }
  else if (v15)
  {
LABEL_36:
    char v18 = 0;
    goto LABEL_37;
  }
  if ((flags & 2) != 0)
  {
    if ((v15 & 2) == 0 || self->_sessionRelativeTimestamp != *((double *)v4 + 15)) {
      goto LABEL_36;
    }
  }
  else if ((v15 & 2) != 0)
  {
    goto LABEL_36;
  }
  serviceTags = self->_serviceTags;
  if ((unint64_t)serviceTags | *((void *)v4 + 14)) {
    char v18 = -[NSMutableArray isEqual:](serviceTags, "isEqual:");
  }
  else {
    char v18 = 1;
  }
LABEL_37:

  return v18;
}

- (unint64_t)hash
{
  [(GEOTransitRouteUpdateRequest *)self readAll:1];
  uint64_t v19 = [(NSMutableArray *)self->_routeIdentifiers hash];
  unint64_t v18 = [(GEOClientCapabilities *)self->_originalClientCapabilities hash];
  unint64_t v3 = [(GEOPDABClientDatasetMetadata *)self->_abClientMetadata hash];
  uint64_t v4 = [(NSMutableArray *)self->_originalWaypoints hash];
  unint64_t v5 = [(GEORouteAttributes *)self->_originalRouteAttributes hash];
  unint64_t v6 = [(GEOAdditionalEnabledMarkets *)self->_originalAdditionalEnabledMarkets hash];
  uint64_t v7 = [(NSData *)self->_directionsResponseId hash];
  NSUInteger v8 = [(NSString *)self->_requestingAppId hash];
  unint64_t v9 = [(GEOPrivacyMetadata *)self->_privacyMetadata hash];
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    uint64_t v11 = PBHashBytes();
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v16 = 0;
    return v18 ^ v19 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v16 ^ [(NSMutableArray *)self->_serviceTags hash];
  }
  uint64_t v11 = 0;
  if ((flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double sessionRelativeTimestamp = self->_sessionRelativeTimestamp;
  double v13 = -sessionRelativeTimestamp;
  if (sessionRelativeTimestamp >= 0.0) {
    double v13 = self->_sessionRelativeTimestamp;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  unint64_t v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  if (v15 >= 0.0)
  {
    if (v15 > 0.0) {
      v16 += (unint64_t)v15;
    }
  }
  else
  {
    v16 -= (unint64_t)fabs(v15);
  }
  return v18 ^ v19 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v16 ^ [(NSMutableArray *)self->_serviceTags hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (char *)a3;
  [v4 readAll:0];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = *((id *)v4 + 13);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOTransitRouteUpdateRequest *)self addRouteIdentifier:*(void *)(*((void *)&v39 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v7);
  }

  originalClientCapabilities = self->_originalClientCapabilities;
  uint64_t v11 = *((void *)v4 + 8);
  if (originalClientCapabilities)
  {
    if (v11) {
      -[GEOClientCapabilities mergeFrom:](originalClientCapabilities, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOTransitRouteUpdateRequest setOriginalClientCapabilities:](self, "setOriginalClientCapabilities:");
  }
  abClientMetadata = self->_abClientMetadata;
  uint64_t v13 = *((void *)v4 + 5);
  if (abClientMetadata)
  {
    if (v13) {
      -[GEOPDABClientDatasetMetadata mergeFrom:](abClientMetadata, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEOTransitRouteUpdateRequest setAbClientMetadata:](self, "setAbClientMetadata:");
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v14 = *((id *)v4 + 10);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v14);
        }
        [(GEOTransitRouteUpdateRequest *)self addOriginalWaypoint:*(void *)(*((void *)&v35 + 1) + 8 * j)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v16);
  }

  originalRouteAttributes = self->_originalRouteAttributes;
  uint64_t v20 = *((void *)v4 + 9);
  if (originalRouteAttributes)
  {
    if (v20) {
      -[GEORouteAttributes mergeFrom:](originalRouteAttributes, "mergeFrom:");
    }
  }
  else if (v20)
  {
    [(GEOTransitRouteUpdateRequest *)self setOriginalRouteAttributes:"setOriginalRouteAttributes:"];
  }
  originalAdditionalEnabledMarkets = self->_originalAdditionalEnabledMarkets;
  uint64_t v22 = *((void *)v4 + 7);
  if (originalAdditionalEnabledMarkets)
  {
    if (v22) {
      -[GEOAdditionalEnabledMarkets mergeFrom:](originalAdditionalEnabledMarkets, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[GEOTransitRouteUpdateRequest setOriginalAdditionalEnabledMarkets:](self, "setOriginalAdditionalEnabledMarkets:");
  }
  if (*((void *)v4 + 6)) {
    -[GEOTransitRouteUpdateRequest setDirectionsResponseId:](self, "setDirectionsResponseId:");
  }
  if (*((void *)v4 + 12)) {
    -[GEOTransitRouteUpdateRequest setRequestingAppId:](self, "setRequestingAppId:");
  }
  privacyMetadata = self->_privacyMetadata;
  uint64_t v24 = *((void *)v4 + 11);
  if (privacyMetadata)
  {
    if (v24) {
      -[GEOPrivacyMetadata mergeFrom:](privacyMetadata, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[GEOTransitRouteUpdateRequest setPrivacyMetadata:](self, "setPrivacyMetadata:");
  }
  __int16 v25 = *((_WORD *)v4 + 70);
  if (v25)
  {
    self->_sessionId = *(GEOSessionID *)(v4 + 24);
    *(_WORD *)&self->_flags |= 1u;
    __int16 v25 = *((_WORD *)v4 + 70);
  }
  if ((v25 & 2) != 0)
  {
    self->_double sessionRelativeTimestamp = *((double *)v4 + 15);
    *(_WORD *)&self->_flags |= 2u;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v26 = *((id *)v4 + 14);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v26);
        }
        -[GEOTransitRouteUpdateRequest addServiceTag:](self, "addServiceTag:", *(void *)(*((void *)&v31 + 1) + 8 * k), (void)v31);
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v28);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOTransitRouteUpdateRequestReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_302);
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
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2004u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitRouteUpdateRequest *)self readAll:0];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v7 = self->_routeIdentifiers;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v9);
    }

    [(GEOClientCapabilities *)self->_originalClientCapabilities clearUnknownFields:1];
    [(GEOPDABClientDatasetMetadata *)self->_abClientMetadata clearUnknownFields:1];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v12 = self->_originalWaypoints;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v14);
    }

    [(GEORouteAttributes *)self->_originalRouteAttributes clearUnknownFields:1];
    [(GEOAdditionalEnabledMarkets *)self->_originalAdditionalEnabledMarkets clearUnknownFields:1];
    [(GEOPrivacyMetadata *)self->_privacyMetadata clearUnknownFields:1];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v17 = self->_serviceTags;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v23;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v21++), "clearUnknownFields:", 1, (void)v22);
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v19);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceTags, 0);
  objc_storeStrong((id *)&self->_routeIdentifiers, 0);
  objc_storeStrong((id *)&self->_requestingAppId, 0);
  objc_storeStrong((id *)&self->_privacyMetadata, 0);
  objc_storeStrong((id *)&self->_originalWaypoints, 0);
  objc_storeStrong((id *)&self->_originalRouteAttributes, 0);
  objc_storeStrong((id *)&self->_originalClientCapabilities, 0);
  objc_storeStrong((id *)&self->_originalAdditionalEnabledMarkets, 0);
  objc_storeStrong((id *)&self->_directionsResponseId, 0);
  objc_storeStrong((id *)&self->_abClientMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

+ (id)transitRouteUpdateRequestWithDirectionsRequest:(id)a3 directionsResponse:(id)a4
{
  return (id)[a1 transitRouteUpdateRequestWithDirectionsRequest:a3 directionsResponse:a4 composedRoutes:0];
}

+ (id)transitRouteUpdateRequestWithDirectionsRequest:(id)a3 directionsResponse:(id)a4 composedRoutes:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = 0;
  if (v7 && v8)
  {
    uint64_t v10 = objc_alloc_init(GEOTransitRouteUpdateRequest);
    uint64_t v11 = [v7 clientCapabilities];
    [(GEOTransitRouteUpdateRequest *)v10 setOriginalClientCapabilities:v11];

    long long v12 = +[GEOExperimentConfiguration sharedConfiguration];
    uint64_t v13 = [v12 _mapsAbClientMetadata];
    uint64_t v14 = [v13 clientDatasetMetadata];
    [(GEOTransitRouteUpdateRequest *)v10 setAbClientMetadata:v14];

    uint64_t v15 = [v7 waypointTypeds];
    [(GEOTransitRouteUpdateRequest *)v10 setOriginalWaypoints:v15];

    uint64_t v16 = [v7 additionalEnabledMarkets];
    [(GEOTransitRouteUpdateRequest *)v10 setOriginalAdditionalEnabledMarkets:v16];

    uint64_t v17 = [v8 directionsResponseID];
    [(GEOTransitRouteUpdateRequest *)v10 setDirectionsResponseId:v17];

    uint64_t v18 = [v7 routeAttributes];
    uint64_t v19 = (void *)[v18 copy];

    long long v35 = 0uLL;
    uint64_t v36 = 0;
    [v8 timepointUsed];
    BYTE4(v36) &= ~1u;
    long long v33 = v35;
    uint64_t v34 = v36;
    [v19 setTimepoint:&v33];
    [(GEOTransitRouteUpdateRequest *)v10 setOriginalRouteAttributes:v19];
    if ([v9 count])
    {
      long long v28 = v19;
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v21 = v9;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v30 != v24) {
              objc_enumerationMutation(v21);
            }
            long long v26 = +[GEOTransitRouteIdentifier routeIdentiferForComposedRoute:](GEOTransitRouteIdentifier, "routeIdentiferForComposedRoute:", *(void *)(*((void *)&v29 + 1) + 8 * i), v28);
            [v20 addObject:v26];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v23);
      }

      [(GEOTransitRouteUpdateRequest *)v10 setRouteIdentifiers:v20];
      uint64_t v19 = v28;
    }
  }

  return v10;
}

+ (id)mergedTransitRouteUpdateRequests:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E10]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, objc_msgSend(v3, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v10 = (void *)MEMORY[0x18C1203C0]();
        uint64_t v11 = (void *)[v9 copy];
        [v11 clearRouteIdentifiers];
        long long v12 = [v4 objectForKey:v11];
        if (!v12)
        {
          long long v12 = (void *)[v11 copy];
          [v4 setObject:v12 forKey:v11];
        }
        uint64_t v13 = (void *)MEMORY[0x1E4F1CA80];
        uint64_t v14 = [v12 routeIdentifiers];
        uint64_t v15 = [v13 setWithArray:v14];

        uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v17 = [v9 routeIdentifiers];
        uint64_t v18 = [v16 setWithArray:v17];
        [v15 unionSet:v18];

        id v19 = objc_alloc(MEMORY[0x1E4F1CA48]);
        id v20 = [v15 allObjects];
        id v21 = (void *)[v19 initWithArray:v20];
        [v12 setRouteIdentifiers:v21];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  uint64_t v22 = [v4 objectEnumerator];
  uint64_t v23 = [v22 allObjects];

  return v23;
}

+ (id)splitTransitRouteUpdateRequests:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v3;
  uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v7 = (void *)MEMORY[0x18C1203C0]();
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v8 = [v6 routeIdentifiers];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v21 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * j);
              uint64_t v14 = (void *)[v6 copy];
              [v14 clearRouteIdentifiers];
              [v14 addRouteIdentifier:v13];
              [v4 addObject:v14];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v10);
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v19);
  }

  uint64_t v15 = (void *)[v4 copy];

  return v15;
}

- (NSUUID)clientRouteID
{
  if ([(GEOTransitRouteUpdateRequest *)self routeIdentifiersCount])
  {
    id v3 = [(GEOTransitRouteUpdateRequest *)self routeIdentifiers];
    id v4 = [v3 firstObject];
    uint64_t v5 = [v4 clientRouteHandle];

    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F29128], "_maps_UUIDWithData:", v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSUUID *)v6;
}

- (NSArray)allClientRouteIDs
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(GEOTransitRouteUpdateRequest *)self routeIdentifiersCount])
  {
    id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[GEOTransitRouteUpdateRequest routeIdentifiersCount](self, "routeIdentifiersCount"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = [(GEOTransitRouteUpdateRequest *)self routeIdentifiers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) clientRouteID];
          if (v9) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    uint64_t v10 = (void *)[v3 copy];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v10;
}

@end