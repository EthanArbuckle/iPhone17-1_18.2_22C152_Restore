@interface GEORRRequestResponseEvent
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAppId;
- (BOOL)hasEncoded;
- (BOOL)hasError;
- (BOOL)hasEventId;
- (BOOL)hasEventType;
- (BOOL)hasRequestType;
- (BOOL)hasTimestamp;
- (BOOL)hasUrl;
- (BOOL)hasWithARPC;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)withARPC;
- (GEORRRequestResponseEvent)init;
- (GEORRRequestResponseEvent)initWithData:(id)a3;
- (GEORRRequestResponseEvent)initWithDictionary:(id)a3;
- (GEORRRequestResponseEvent)initWithJSON:(id)a3;
- (NSData)encoded;
- (NSString)appId;
- (NSString)error;
- (NSString)eventId;
- (NSString)url;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodeEvent;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (id)requestTypeAsString:(int)a3;
- (int)StringAsEventType:(id)a3;
- (int)StringAsRequestType:(id)a3;
- (int)eventType;
- (int)requestType;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAppId;
- (void)_readEncoded;
- (void)_readError;
- (void)_readEventId;
- (void)_readUrl;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAppId:(id)a3;
- (void)setEncoded:(id)a3;
- (void)setError:(id)a3;
- (void)setEventId:(id)a3;
- (void)setEventType:(int)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasRequestType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWithARPC:(BOOL)a3;
- (void)setRequestType:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUrl:(id)a3;
- (void)setWithARPC:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORRRequestResponseEvent

- (NSString)error
{
  -[GEORRRequestResponseEvent _readError]((uint64_t)self);
  error = self->_error;

  return error;
}

- (NSData)encoded
{
  -[GEORRRequestResponseEvent _readEncoded]((uint64_t)self);
  encoded = self->_encoded;

  return encoded;
}

- (void)_readError
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORRRequestResponseEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readError_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)_readEncoded
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORRRequestResponseEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEncoded_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v5 = *(_WORD *)(a1 + 88);
    if ((v5 & 2) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 76);
      if (v6 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53DAA98[v6];
      }
      if (a2) {
        v8 = @"eventType";
      }
      else {
        v8 = @"event_type";
      }
      [v4 setObject:v7 forKey:v8];

      __int16 v5 = *(_WORD *)(a1 + 88);
    }
    if ((v5 & 4) != 0)
    {
      int v9 = *(_DWORD *)(a1 + 80);
      switch(v9)
      {
        case 1005:
          v10 = @"GEOPlaceSearchFeedback";
          break;
        case 1006:
        case 1007:
        case 1008:
        case 1011:
        case 1012:
        case 1018:
        case 1019:
        case 1020:
        case 1022:
        case 1023:
LABEL_17:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 80));
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
        case 1009:
          v10 = @"GEORPProblemCollection";
          break;
        case 1010:
          v10 = @"GEORPProblemStatus";
          break;
        case 1013:
          v10 = @"GEORPProblemOptIn";
          break;
        case 1014:
          v10 = @"GEORPProblem";
          break;
        case 1015:
          v10 = @"GEORPFeedback";
          break;
        case 1016:
          v10 = @"GEOABAssignment";
          break;
        case 1017:
          v10 = @"GEOLogCollection";
          break;
        case 1021:
          v10 = @"GEOSpatialLookupBatch";
          break;
        case 1024:
          v10 = @"GEOImageService";
          break;
        case 1025:
          v10 = @"GEOWiFiQualityService";
          break;
        case 1026:
          v10 = @"GEOTransitRouteUpdate";
          break;
        case 1027:
          v10 = @"GEOAddressCorrectionTaggedLocation";
          break;
        case 1028:
          v10 = @"GEOPBOfflineDataKeys";
          break;
        default:
          switch(v9)
          {
            case '+':
              v10 = @"GEOPlaceSearch";
              break;
            case ',':
              v10 = @"GEODirections";
              break;
            case '-':
            case '/':
            case '3':
            case '7':
            case '8':
            case '9':
            case ';':
              goto LABEL_17;
            case '.':
              v10 = @"GEOLocationShift";
              break;
            case '0':
              v10 = @"GEOETATrafficUpdate";
              break;
            case '1':
              v10 = @"GEOBatchRevGeocode";
              break;
            case '2':
              v10 = @"GEOPolyLocationShift";
              break;
            case '4':
              v10 = @"GEOETA";
              break;
            case '5':
              v10 = @"GEOAddressCorrectionInit";
              break;
            case '6':
              v10 = @"GEOAddressCorrectionUpdate";
              break;
            case ':':
              v10 = @"GEOBusinessResolution";
              break;
            case '<':
              v10 = @"GEOPDPlace";
              break;
            default:
              if (v9) {
                goto LABEL_17;
              }
              v10 = @"Unknown";
              break;
          }
          break;
      }
      if (a2) {
        v11 = @"requestType";
      }
      else {
        v11 = @"request_type";
      }
      [v4 setObject:v10 forKey:v11];

      __int16 v5 = *(_WORD *)(a1 + 88);
    }
    if (v5)
    {
      v12 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
      [v4 setObject:v12 forKey:@"timestamp"];
    }
    v13 = [(id)a1 eventId];
    if (v13)
    {
      if (a2) {
        v14 = @"eventId";
      }
      else {
        v14 = @"event_id";
      }
      [v4 setObject:v13 forKey:v14];
    }

    v15 = [(id)a1 url];
    if (v15) {
      [v4 setObject:v15 forKey:@"url"];
    }

    if ((*(_WORD *)(a1 + 88) & 8) != 0)
    {
      v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 84)];
      [v4 setObject:v16 forKey:@"withARPC"];
    }
    v17 = [(id)a1 error];
    if (v17) {
      [v4 setObject:v17 forKey:@"error"];
    }

    v18 = [(id)a1 encoded];
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 base64EncodedStringWithOptions:0];
        [v4 setObject:v20 forKey:@"encoded"];
      }
      else
      {
        [v4 setObject:v18 forKey:@"encoded"];
      }
    }

    v21 = [(id)a1 appId];
    if (v21) {
      [v4 setObject:v21 forKey:@"appId"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (GEORRRequestResponseEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORRRequestResponseEvent;
  v2 = [(GEORRRequestResponseEvent *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORRRequestResponseEvent)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORRRequestResponseEvent;
  id v3 = [(GEORRRequestResponseEvent *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    __int16 v5 = v3;
  }

  return v4;
}

- (int)eventType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_eventType;
  }
  else {
    return 0;
  }
}

- (void)setEventType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 514;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasEventType
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53DAA98[a3];
  }

  return v3;
}

- (int)StringAsEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Request"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Response"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)requestType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_requestType;
  }
  else {
    return 0;
  }
}

- (void)setRequestType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_requestType = a3;
}

- (void)setHasRequestType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 516;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasRequestType
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)requestTypeAsString:(int)a3
{
  switch(a3)
  {
    case 1005:
      int v4 = @"GEOPlaceSearchFeedback";
      break;
    case 1006:
    case 1007:
    case 1008:
    case 1011:
    case 1012:
    case 1018:
    case 1019:
    case 1020:
    case 1022:
    case 1023:
LABEL_13:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 1009:
      int v4 = @"GEORPProblemCollection";
      break;
    case 1010:
      int v4 = @"GEORPProblemStatus";
      break;
    case 1013:
      int v4 = @"GEORPProblemOptIn";
      break;
    case 1014:
      int v4 = @"GEORPProblem";
      break;
    case 1015:
      int v4 = @"GEORPFeedback";
      break;
    case 1016:
      int v4 = @"GEOABAssignment";
      break;
    case 1017:
      int v4 = @"GEOLogCollection";
      break;
    case 1021:
      int v4 = @"GEOSpatialLookupBatch";
      break;
    case 1024:
      int v4 = @"GEOImageService";
      break;
    case 1025:
      int v4 = @"GEOWiFiQualityService";
      break;
    case 1026:
      int v4 = @"GEOTransitRouteUpdate";
      break;
    case 1027:
      int v4 = @"GEOAddressCorrectionTaggedLocation";
      break;
    case 1028:
      int v4 = @"GEOPBOfflineDataKeys";
      break;
    default:
      switch(a3)
      {
        case '+':
          int v4 = @"GEOPlaceSearch";
          break;
        case ',':
          int v4 = @"GEODirections";
          break;
        case '-':
        case '/':
        case '3':
        case '7':
        case '8':
        case '9':
        case ';':
          goto LABEL_13;
        case '.':
          int v4 = @"GEOLocationShift";
          break;
        case '0':
          int v4 = @"GEOETATrafficUpdate";
          break;
        case '1':
          int v4 = @"GEOBatchRevGeocode";
          break;
        case '2':
          int v4 = @"GEOPolyLocationShift";
          break;
        case '4':
          int v4 = @"GEOETA";
          break;
        case '5':
          int v4 = @"GEOAddressCorrectionInit";
          break;
        case '6':
          int v4 = @"GEOAddressCorrectionUpdate";
          break;
        case ':':
          int v4 = @"GEOBusinessResolution";
          break;
        case '<':
          int v4 = @"GEOPDPlace";
          break;
        default:
          if (a3) {
            goto LABEL_13;
          }
          int v4 = @"Unknown";
          break;
      }
      break;
  }
  return v4;
}

- (int)StringAsRequestType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GEOPlaceSearch"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"GEODirections"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"GEOLocationShift"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"GEOETATrafficUpdate"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"GEOBatchRevGeocode"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"GEOPolyLocationShift"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"GEOETA"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"GEOAddressCorrectionInit"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"GEOAddressCorrectionUpdate"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"GEOBusinessResolution"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"GEOPDPlace"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"GEOPlaceSearchFeedback"])
  {
    int v4 = 1005;
  }
  else if ([v3 isEqualToString:@"GEORPProblemCollection"])
  {
    int v4 = 1009;
  }
  else if ([v3 isEqualToString:@"GEORPProblemStatus"])
  {
    int v4 = 1010;
  }
  else if ([v3 isEqualToString:@"GEORPProblemOptIn"])
  {
    int v4 = 1013;
  }
  else if ([v3 isEqualToString:@"GEORPProblem"])
  {
    int v4 = 1014;
  }
  else if ([v3 isEqualToString:@"GEORPFeedback"])
  {
    int v4 = 1015;
  }
  else if ([v3 isEqualToString:@"GEOABAssignment"])
  {
    int v4 = 1016;
  }
  else if ([v3 isEqualToString:@"GEOLogCollection"])
  {
    int v4 = 1017;
  }
  else if ([v3 isEqualToString:@"GEOSpatialLookupBatch"])
  {
    int v4 = 1021;
  }
  else if ([v3 isEqualToString:@"GEOImageService"])
  {
    int v4 = 1024;
  }
  else if ([v3 isEqualToString:@"GEOWiFiQualityService"])
  {
    int v4 = 1025;
  }
  else if ([v3 isEqualToString:@"GEOTransitRouteUpdate"])
  {
    int v4 = 1026;
  }
  else if ([v3 isEqualToString:@"GEOAddressCorrectionTaggedLocation"])
  {
    int v4 = 1027;
  }
  else if ([v3 isEqualToString:@"GEOPBOfflineDataKeys"])
  {
    int v4 = 1028;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readEventId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORRRequestResponseEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEventId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasEventId
{
  return self->_eventId != 0;
}

- (NSString)eventId
{
  -[GEORRRequestResponseEvent _readEventId]((uint64_t)self);
  eventId = self->_eventId;

  return eventId;
}

- (void)setEventId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_eventId, a3);
}

- (void)_readUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORRRequestResponseEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrl_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (NSString)url
{
  -[GEORRRequestResponseEvent _readUrl]((uint64_t)self);
  url = self->_url;

  return url;
}

- (void)setUrl:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_url, a3);
}

- (BOOL)withARPC
{
  return self->_withARPC;
}

- (void)setWithARPC:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  self->_withARPC = a3;
}

- (void)setHasWithARPC:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 520;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasWithARPC
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)setError:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)hasEncoded
{
  return self->_encoded != 0;
}

- (void)setEncoded:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  objc_storeStrong((id *)&self->_encoded, a3);
}

- (void)_readAppId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORRRequestResponseEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasAppId
{
  return self->_appId != 0;
}

- (NSString)appId
{
  -[GEORRRequestResponseEvent _readAppId]((uint64_t)self);
  appId = self->_appId;

  return appId;
}

- (void)setAppId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_appId, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORRRequestResponseEvent;
  int v4 = [(GEORRRequestResponseEvent *)&v8 description];
  __int16 v5 = [(GEORRRequestResponseEvent *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORRRequestResponseEvent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEORRRequestResponseEvent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORRRequestResponseEvent)initWithDictionary:(id)a3
{
  return (GEORRRequestResponseEvent *)-[GEORRRequestResponseEvent _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_97;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_97;
  }
  if (a3) {
    objc_super v6 = @"eventType";
  }
  else {
    objc_super v6 = @"event_type";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"Unknown"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"Request"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"Response"])
    {
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_18;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setEventType:v9];
LABEL_18:

  if (a3) {
    v10 = @"requestType";
  }
  else {
    v10 = @"request_type";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"Unknown"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"GEOPlaceSearch"])
    {
      uint64_t v13 = 43;
    }
    else if ([v12 isEqualToString:@"GEODirections"])
    {
      uint64_t v13 = 44;
    }
    else if ([v12 isEqualToString:@"GEOLocationShift"])
    {
      uint64_t v13 = 46;
    }
    else if ([v12 isEqualToString:@"GEOETATrafficUpdate"])
    {
      uint64_t v13 = 48;
    }
    else if ([v12 isEqualToString:@"GEOBatchRevGeocode"])
    {
      uint64_t v13 = 49;
    }
    else if ([v12 isEqualToString:@"GEOPolyLocationShift"])
    {
      uint64_t v13 = 50;
    }
    else if ([v12 isEqualToString:@"GEOETA"])
    {
      uint64_t v13 = 52;
    }
    else if ([v12 isEqualToString:@"GEOAddressCorrectionInit"])
    {
      uint64_t v13 = 53;
    }
    else if ([v12 isEqualToString:@"GEOAddressCorrectionUpdate"])
    {
      uint64_t v13 = 54;
    }
    else if ([v12 isEqualToString:@"GEOBusinessResolution"])
    {
      uint64_t v13 = 58;
    }
    else if ([v12 isEqualToString:@"GEOPDPlace"])
    {
      uint64_t v13 = 60;
    }
    else if ([v12 isEqualToString:@"GEOPlaceSearchFeedback"])
    {
      uint64_t v13 = 1005;
    }
    else if ([v12 isEqualToString:@"GEORPProblemCollection"])
    {
      uint64_t v13 = 1009;
    }
    else if ([v12 isEqualToString:@"GEORPProblemStatus"])
    {
      uint64_t v13 = 1010;
    }
    else if ([v12 isEqualToString:@"GEORPProblemOptIn"])
    {
      uint64_t v13 = 1013;
    }
    else if ([v12 isEqualToString:@"GEORPProblem"])
    {
      uint64_t v13 = 1014;
    }
    else if ([v12 isEqualToString:@"GEORPFeedback"])
    {
      uint64_t v13 = 1015;
    }
    else if ([v12 isEqualToString:@"GEOABAssignment"])
    {
      uint64_t v13 = 1016;
    }
    else if ([v12 isEqualToString:@"GEOLogCollection"])
    {
      uint64_t v13 = 1017;
    }
    else if ([v12 isEqualToString:@"GEOSpatialLookupBatch"])
    {
      uint64_t v13 = 1021;
    }
    else if ([v12 isEqualToString:@"GEOImageService"])
    {
      uint64_t v13 = 1024;
    }
    else if ([v12 isEqualToString:@"GEOWiFiQualityService"])
    {
      uint64_t v13 = 1025;
    }
    else if ([v12 isEqualToString:@"GEOTransitRouteUpdate"])
    {
      uint64_t v13 = 1026;
    }
    else if ([v12 isEqualToString:@"GEOAddressCorrectionTaggedLocation"])
    {
      uint64_t v13 = 1027;
    }
    else if ([v12 isEqualToString:@"GEOPBOfflineDataKeys"])
    {
      uint64_t v13 = 1028;
    }
    else
    {
      uint64_t v13 = 0;
    }

    goto LABEL_78;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v11 intValue];
LABEL_78:
    [a1 setRequestType:v13];
  }

  v14 = [v5 objectForKeyedSubscript:@"timestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTimestamp:", objc_msgSend(v14, "unsignedLongLongValue"));
  }

  if (a3) {
    v15 = @"eventId";
  }
  else {
    v15 = @"event_id";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = (void *)[v16 copy];
    [a1 setEventId:v17];
  }
  v18 = [v5 objectForKeyedSubscript:@"url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = (void *)[v18 copy];
    [a1 setUrl:v19];
  }
  v20 = [v5 objectForKeyedSubscript:@"withARPC"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWithARPC:", objc_msgSend(v20, "BOOLValue"));
  }

  v21 = [v5 objectForKeyedSubscript:@"error"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = (void *)[v21 copy];
    [a1 setError:v22];
  }
  v23 = [v5 objectForKeyedSubscript:@"encoded"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v23 options:0];
    [a1 setEncoded:v24];
  }
  v25 = [v5 objectForKeyedSubscript:@"appId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26 = (void *)[v25 copy];
    [a1 setAppId:v26];
  }
LABEL_97:

  return a1;
}

- (GEORRRequestResponseEvent)initWithJSON:(id)a3
{
  return (GEORRRequestResponseEvent *)-[GEORRRequestResponseEvent _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_2;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_2;
    }
    GEORRRequestResponseEventReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORRRequestResponseEventIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORRRequestResponseEventReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x3F0) == 0)
    {
      objc_super v6 = self->_reader;
      objc_sync_enter(v6);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v8 writeData:v7];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v6);
      goto LABEL_23;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORRRequestResponseEvent *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
LABEL_20:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_20;
  }
LABEL_5:
  if (flags) {
LABEL_6:
  }
    PBDataWriterWriteUint64Field();
LABEL_7:
  if (self->_eventId) {
    PBDataWriterWriteStringField();
  }
  if (self->_url) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_error) {
    PBDataWriterWriteStringField();
  }
  if (self->_encoded) {
    PBDataWriterWriteDataField();
  }
  if (self->_appId) {
    PBDataWriterWriteStringField();
  }
LABEL_23:
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEORRRequestResponseEvent *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 16) = self->_readerMarkPos;
  *((_DWORD *)v6 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v6;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 19) = self->_eventType;
    *((_WORD *)v6 + 44) |= 2u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 20) = self->_requestType;
  *((_WORD *)v6 + 44) |= 4u;
  if (*(_WORD *)&self->_flags)
  {
LABEL_4:
    v6[6] = self->_timestamp;
    *((_WORD *)v6 + 44) |= 1u;
  }
LABEL_5:
  if (self->_eventId)
  {
    objc_msgSend(v6, "setEventId:");
    int v4 = v6;
  }
  if (self->_url)
  {
    objc_msgSend(v6, "setUrl:");
    int v4 = v6;
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((unsigned char *)v4 + 84) = self->_withARPC;
    *((_WORD *)v4 + 44) |= 8u;
  }
  if (self->_error)
  {
    objc_msgSend(v6, "setError:");
    int v4 = v6;
  }
  if (self->_encoded)
  {
    objc_msgSend(v6, "setEncoded:");
    int v4 = v6;
  }
  if (self->_appId)
  {
    objc_msgSend(v6, "setAppId:");
    int v4 = v6;
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
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORRRequestResponseEventReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORRRequestResponseEvent *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 4) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    *(_DWORD *)(v5 + 80) = self->_requestType;
    *(_WORD *)(v5 + 88) |= 4u;
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 76) = self->_eventType;
  *(_WORD *)(v5 + 88) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if (flags)
  {
LABEL_8:
    *(void *)(v5 + 48) = self->_timestamp;
    *(_WORD *)(v5 + 88) |= 1u;
  }
LABEL_9:
  uint64_t v10 = [(NSString *)self->_eventId copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_url copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(unsigned char *)(v5 + 84) = self->_withARPC;
    *(_WORD *)(v5 + 88) |= 8u;
  }
  uint64_t v14 = [(NSString *)self->_error copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  uint64_t v16 = [(NSData *)self->_encoded copyWithZone:a3];
  v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  uint64_t v18 = [(NSString *)self->_appId copyWithZone:a3];
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v18;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  [(GEORRRequestResponseEvent *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 19)) {
      goto LABEL_35;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_35;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_requestType != *((_DWORD *)v4 + 20)) {
      goto LABEL_35;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_35;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 6)) {
      goto LABEL_35;
    }
  }
  else if (v6)
  {
    goto LABEL_35;
  }
  eventId = self->_eventId;
  if ((unint64_t)eventId | *((void *)v4 + 5) && !-[NSString isEqual:](eventId, "isEqual:")) {
    goto LABEL_35;
  }
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](url, "isEqual:")) {
      goto LABEL_35;
    }
  }
  __int16 v9 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    if ((v9 & 8) != 0)
    {
      if (self->_withARPC)
      {
        if (!*((unsigned char *)v4 + 84)) {
          goto LABEL_35;
        }
        goto LABEL_29;
      }
      if (!*((unsigned char *)v4 + 84)) {
        goto LABEL_29;
      }
    }
LABEL_35:
    char v13 = 0;
    goto LABEL_36;
  }
  if ((v9 & 8) != 0) {
    goto LABEL_35;
  }
LABEL_29:
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 4) && !-[NSString isEqual:](error, "isEqual:")) {
    goto LABEL_35;
  }
  encoded = self->_encoded;
  if ((unint64_t)encoded | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](encoded, "isEqual:")) {
      goto LABEL_35;
    }
  }
  appId = self->_appId;
  if ((unint64_t)appId | *((void *)v4 + 2)) {
    char v13 = -[NSString isEqual:](appId, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_36:

  return v13;
}

- (unint64_t)hash
{
  [(GEORRRequestResponseEvent *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    uint64_t v4 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if (flags) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v4 = 2654435761 * self->_eventType;
  if ((flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_requestType;
  if (flags)
  {
LABEL_4:
    unint64_t v6 = 2654435761u * self->_timestamp;
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v6 = 0;
LABEL_8:
  NSUInteger v7 = [(NSString *)self->_eventId hash];
  NSUInteger v8 = [(NSString *)self->_url hash];
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    uint64_t v9 = 2654435761 * self->_withARPC;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9;
  NSUInteger v11 = [(NSString *)self->_error hash];
  uint64_t v12 = v11 ^ [(NSData *)self->_encoded hash];
  return v10 ^ v12 ^ [(NSString *)self->_appId hash];
}

- (void)mergeFrom:(id)a3
{
  id v6 = a3;
  [v6 readAll:0];
  id v4 = v6;
  __int16 v5 = *((_WORD *)v6 + 44);
  if ((v5 & 2) != 0)
  {
    self->_eventType = *((_DWORD *)v6 + 19);
    *(_WORD *)&self->_flags |= 2u;
    __int16 v5 = *((_WORD *)v6 + 44);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_requestType = *((_DWORD *)v6 + 20);
  *(_WORD *)&self->_flags |= 4u;
  if (*((_WORD *)v6 + 44))
  {
LABEL_4:
    self->_timestamp = *((void *)v6 + 6);
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_5:
  if (*((void *)v6 + 5))
  {
    -[GEORRRequestResponseEvent setEventId:](self, "setEventId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[GEORRRequestResponseEvent setUrl:](self, "setUrl:");
    id v4 = v6;
  }
  if ((*((_WORD *)v4 + 44) & 8) != 0)
  {
    self->_withARPC = *((unsigned char *)v4 + 84);
    *(_WORD *)&self->_flags |= 8u;
  }
  if (*((void *)v4 + 4))
  {
    -[GEORRRequestResponseEvent setError:](self, "setError:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[GEORRRequestResponseEvent setEncoded:](self, "setEncoded:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[GEORRRequestResponseEvent setAppId:](self, "setAppId:");
    id v4 = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_encoded, 0);
  objc_storeStrong((id *)&self->_appId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)decodeEvent
{
  int v3 = [(GEORRRequestResponseEvent *)self eventType];
  if (v3 == 2)
  {
    id v4 = (objc_class *)_geo_responseClassForMessageType([(GEORRRequestResponseEvent *)self requestType]);
    if (v4)
    {
LABEL_4:
      id v5 = [v4 alloc];
      id v6 = [(GEORRRequestResponseEvent *)self encoded];
      NSUInteger v7 = (void *)[v5 initWithData:v6];

      goto LABEL_7;
    }
  }
  else if (v3 == 1)
  {
    id v4 = (objc_class *)_geo_requestClassForMessageType([(GEORRRequestResponseEvent *)self requestType]);
    if (v4) {
      goto LABEL_4;
    }
  }
  NSUInteger v7 = 0;
LABEL_7:

  return v7;
}

@end