@interface GEOPlaceDataRequestConfig
- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (BOOL)supportsOffline;
- (BOOL)usesBackgroundURL;
- (GEOPlaceDataRequestConfig)initWithTimeout:(double)a3 request:(id)a4 traits:(id)a5;
- (double)timeout;
- (id)additionalHTTPHeaders;
- (id)additionalStatesForNetworkEvent;
- (id)serviceTypeNumber;
- (unint64_t)multipathServiceType;
- (unint64_t)urlType;
@end

@implementation GEOPlaceDataRequestConfig

- (GEOPlaceDataRequestConfig)initWithTimeout:(double)a3 request:(id)a4 traits:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)GEOPlaceDataRequestConfig;
  v11 = [(GEOPlaceDataRequestConfig *)&v25 init];
  v12 = v11;
  if (v11)
  {
    v11->_timeout = a3;
    unint64_t v13 = [(GEOPlaceDataRequestConfig *)v11 dataRequestKindForRequest:v9 traits:v10];
    int v14 = v13;
    unint64_t v15 = HIDWORD(v13);
    objc_storeStrong((id *)&v12->_placeRequest, a4);
    if (v15 == 26)
    {
      uint64_t v16 = 55;
      goto LABEL_17;
    }
    if (v15 == 6
      && [v10 hasContainsSensitiveData]
      && [v10 containsSensitiveData])
    {
      uint64_t v16 = 63;
LABEL_17:
      v12->_urlType = v16;
      goto LABEL_27;
    }
    if (v14 != 1280)
    {
      if (v15 == 32)
      {
        GEOConfigGetBOOL(GeoServicesConfig_BackgroundBluePOIURLEnabled, (uint64_t)off_1E9113CC8);
        goto LABEL_27;
      }
      uint64_t v16 = 24;
      goto LABEL_17;
    }
    switch(v15)
    {
      case 0x31:
        v18 = _GEOGetURLWithSource(34, 0, 1, 0);
        uint64_t v19 = 24;
        if (v18) {
          uint64_t v19 = 34;
        }
        v12->_urlType = v19;

LABEL_27:
        if ([v10 hasHttpRequestPriority])
        {
          uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "httpRequestPriority"));
          requestPriority = v12->_requestPriority;
          v12->_requestPriority = (NSNumber *)v20;
        }
        if (v15 > 0xD || ((1 << v15) & 0x3402) == 0)
        {
          if ([v10 requestPurpose] != 1) {
            goto LABEL_35;
          }
          v23 = &GeoServicesConfig_DirectionsMPTCPServiceType;
        }
        else
        {
          v23 = &GeoServicesConfig_SearchACMPTCPServiceType;
        }
        v12->_multipathServiceType = GEOConfigGetInteger(*v23, v23[1]);
LABEL_35:
        v12->_usesBackgroundURL = [v10 requestPriority] == 1;
        v12->_supportsOffline = (v15 < 0x3D) & (0x1004108000881E86uLL >> v15);
        goto LABEL_36;
      case 0x20:
        if (GEOConfigGetBOOL(GeoServicesConfig_BackgroundBluePOIURLEnabled, (uint64_t)off_1E9113CC8))
        {
          GEOConfigGetBOOL(GeoServicesConfig_BackgroundURLForegroundFallbackEnabled, (uint64_t)off_1E9113CF8);
          uint64_t v17 = 35;
          goto LABEL_26;
        }
        break;
      case 4:
        if (GEOConfigGetBOOL(GeoServicesConfig_BackgroundRevGeoURLEnabled, (uint64_t)off_1E9113CE8))
        {
          GEOConfigGetBOOL(GeoServicesConfig_BackgroundURLForegroundFallbackEnabled, (uint64_t)off_1E9113CF8);
          uint64_t v17 = 36;
LABEL_26:
          v12->_urlType = v17;
          goto LABEL_27;
        }
        break;
      default:
        if (GEOConfigGetBOOL(GeoServicesConfig_BackgroundDispatcherURLEnabled, (uint64_t)off_1E9113CD8))
        {
          GEOConfigGetBOOL(GeoServicesConfig_BackgroundURLForegroundFallbackEnabled, (uint64_t)off_1E9113CF8);
          uint64_t v17 = 34;
          goto LABEL_26;
        }
        break;
    }
    uint64_t v17 = 24;
    goto LABEL_26;
  }
LABEL_36:

  return v12;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v8 = [v6 requestPriority];
    if (v8 == 1)
    {
      uint64_t v9 = 1280;
    }
    else if (v8 == 2)
    {
      uint64_t v9 = 1792;
    }
    else if ([v7 requestType] == 32)
    {
      if ([v6 requestPriority] == 2) {
        uint64_t v9 = 1792;
      }
      else {
        uint64_t v9 = 1280;
      }
    }
    else
    {
      uint64_t v9 = 768;
    }
    uint64_t v10 = v9 | ([v7 requestType] << 32);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return ($C4D369C9F02205611300857CFD58F739)v10;
}

- (BOOL)supportsOffline
{
  return self->_supportsOffline;
}

- (id)additionalStatesForNetworkEvent
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(GEOLogMsgState);
  [(GEOLogMsgState *)v3 setStateType:707];
  v4 = objc_alloc_init(GEOLogMsgStatePlaceRequest);
  [(GEOLogMsgState *)v3 setPlaceRequest:v4];

  uint64_t v5 = [(GEOPDPlaceRequest *)self->_placeRequest requestType];
  id v6 = [(GEOLogMsgState *)v3 placeRequest];
  [v6 setPlaceRequestType:v5];

  v9[0] = v3;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

- (BOOL)usesBackgroundURL
{
  return self->_usesBackgroundURL;
}

- (id)serviceTypeNumber
{
  return (id)[NSNumber numberWithInt:13];
}

- (unint64_t)urlType
{
  return self->_urlType;
}

- (double)timeout
{
  return self->_timeout;
}

- (unint64_t)multipathServiceType
{
  return self->_multipathServiceType;
}

- (id)additionalHTTPHeaders
{
  v7[1] = *MEMORY[0x1E4F143B8];
  requestPriority = self->_requestPriority;
  if (requestPriority)
  {
    v3 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[NSNumber unsignedIntegerValue](requestPriority, "unsignedIntegerValue"));
    id v6 = @"x-msg-priority";
    v7[0] = v3;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeRequest, 0);

  objc_storeStrong((id *)&self->_requestPriority, 0);
}

@end