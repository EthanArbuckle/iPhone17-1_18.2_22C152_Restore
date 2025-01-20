@interface DCNewGoogleMapsLink
+ (BOOL)isMapsURL:(id)a3;
+ (id)mapsLinkWithURL:(id)a3;
- (BOOL)parsed;
- (BOOL)showsBicycling;
- (BOOL)showsStreetView;
- (BOOL)showsTraffic;
- (BOOL)showsTransit;
- (DCNewGoogleMapsLink)initWithURL:(id)a3;
- (NSArray)mapsURLComponents;
- (NSString)location;
- (NSURL)URL;
- (id)centerLocation;
- (id)dataString;
- (id)destinationAddress;
- (id)latLonZoomString;
- (id)mapsURLComponentAtIndex:(int64_t)a3;
- (id)searchLocation;
- (id)searchNearQuery;
- (id)searchQuery;
- (id)startAddress;
- (id)streetViewLocation;
- (int)linkType;
- (int64_t)zoomLevel;
- (unint64_t)directionsMode;
- (unint64_t)mapType;
- (void)parse;
- (void)parseLatLonZoom;
- (void)parseLinkType;
- (void)parseMapsData;
- (void)setLocation:(id)a3;
- (void)setMapsURLComponents:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation DCNewGoogleMapsLink

+ (id)mapsLinkWithURL:(id)a3
{
  id v4 = a3;
  if ([a1 isMapsURL:v4]) {
    v5 = (void *)[objc_alloc((Class)a1) initWithURL:v4];
  }
  else {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isMapsURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 host];
  v5 = [v4 componentsSeparatedByString:@"."];

  if ((unint64_t)([v5 count] - 5) >= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = [v5 objectAtIndex:0];
    v8 = [v5 objectAtIndex:1];
    v9 = [v3 pathComponents];
    if ((unint64_t)[v9 count] >= 3)
    {
      v10 = [v9 objectAtIndex:1];
      v11 = [v9 objectAtIndex:2];
      BOOL v6 = [v10 isEqualToString:@"maps"]
        && (([v11 isEqualToString:@"dir"] & 1) != 0
         || ([v11 isEqualToString:@"place"] & 1) != 0
         || ([v11 isEqualToString:@"search"] & 1) != 0
         || [v11 hasPrefix:@"@"])
        && (([v7 isEqualToString:@"google"] & 1) != 0
         || [v7 isEqualToString:@"www"]
         && ([v8 isEqualToString:@"google"] & 1) != 0);
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_mapsURLComponents, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (BOOL)parsed
{
  return self->_parsed;
}

- (void)setLocation:(id)a3
{
}

- (NSString)location
{
  return self->_location;
}

- (void)setMapsURLComponents:(id)a3
{
}

- (void)setURL:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)parseMapsData
{
  id v3 = [(DCNewGoogleMapsLink *)self dataString];
  if (v3)
  {
    id v27 = v3;
    id v4 = [v3 componentsSeparatedByString:@"!"];
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"1m%d", 0);
    BOOL v6 = [v4 arrayByAddingObject:v5];

    uint64_t v7 = [v6 count];
    v26 = self;
    self->_mapType = 1;
    if (v7 >= 1)
    {
      uint64_t v8 = v7;
      unsigned int v9 = 0;
      int v10 = 0;
      uint64_t v11 = 0;
      while (1)
      {
        v12 = [v6 objectAtIndex:v11];
        if ((unint64_t)[v12 length] >= 3) {
          break;
        }
LABEL_65:

        if (v8 == ++v11) {
          goto LABEL_66;
        }
      }
      int v28 = 0;
      v13 = [MEMORY[0x263F08B08] scannerWithString:v12];
      if (![v13 scanInt:&v28])
      {
        v16 = 0;
        goto LABEL_64;
      }
      int v14 = objc_msgSend(v12, "characterAtIndex:", objc_msgSend(v13, "scanLocation"));
      v15 = objc_msgSend(v12, "substringFromIndex:", objc_msgSend(v13, "scanLocation") + 1);
      v16 = v15;
      if (v14 == 109)
      {
        int v17 = [v15 intValue];
        if (v28 == 1)
        {
          int v10 = 1;
        }
        else
        {
          if (v28 != 3 || (v17 >= 1 ? (BOOL v18 = v17 < 5) : (BOOL v18 = 0), !v18))
          {
            if (v17 == 1) {
              int v22 = v28;
            }
            else {
              int v22 = v10;
            }
            if (v17 == 1) {
              int v23 = 1;
            }
            else {
              int v23 = v9;
            }
            if (v28 == 5)
            {
              int v10 = v22;
              unsigned int v9 = v23;
            }
            goto LABEL_64;
          }
          int v10 = v28;
        }
        unsigned int v9 = v17;
        goto LABEL_64;
      }
      if (v10 != 5)
      {
        if (v10 != 3)
        {
          if (v10 == 1)
          {
            int v10 = 1;
            if (v9 <= 6 && ((1 << v9) & 0x66) != 0)
            {
              int v10 = 1;
              if (v14 == 101 && v28 == 3)
              {
                if ([v15 length])
                {
                  switch([v16 intValue])
                  {
                    case 0u:
                      int v10 = 1;
                      v26->_directionsMode = 1;
                      goto LABEL_64;
                    case 1u:
                      v24 = v26;
                      uint64_t v25 = 2;
                      goto LABEL_62;
                    case 2u:
                      v24 = v26;
                      uint64_t v25 = 3;
                      goto LABEL_62;
                    case 3u:
                      v24 = v26;
                      uint64_t v25 = 4;
                      goto LABEL_62;
                    case 4u:
                      v24 = v26;
                      uint64_t v25 = 5;
LABEL_62:
                      v24->_directionsMode = v25;
                      break;
                    default:
                      break;
                  }
                }
                int v10 = 1;
              }
            }
          }
          goto LABEL_64;
        }
        int v10 = 3;
        if (v9 - 1 <= 3 && v14 == 101 && v28 == 1)
        {
          if ([v15 length])
          {
            int v19 = [v16 intValue];
            if (v19 == 3)
            {
              int v10 = 3;
              v26->_mapType = 3;
              goto LABEL_64;
            }
            if (v19 == 1) {
              v26->_showsStreetView = 1;
            }
          }
          int v10 = 3;
        }
LABEL_64:

        goto LABEL_65;
      }
      int v10 = 5;
      if (v9 != 1 || v14 != 101 || v28 != 1) {
        goto LABEL_64;
      }
      if ([v15 length])
      {
        int v20 = [v16 intValue];
        unsigned int v9 = 1;
        switch(v20)
        {
          case 3:
            uint64_t v21 = 9;
            goto LABEL_56;
          case 2:
            uint64_t v21 = 8;
            goto LABEL_56;
          case 1:
            uint64_t v21 = 11;
LABEL_56:
            *((unsigned char *)&v26->super.super.isa + v21) = 1;
            break;
        }
      }
      else
      {
        unsigned int v9 = 1;
      }
      int v10 = 5;
      goto LABEL_64;
    }
LABEL_66:

    id v3 = v27;
  }
}

- (id)dataString
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(DCNewGoogleMapsLink *)self mapsURLComponents];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 hasPrefix:@"data="])
        {
          uint64_t v8 = [v7 substringFromIndex:objc_msgSend(@"data=", "length")];
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_11:

  return v8;
}

- (void)parse
{
  self->_parsed = 1;
  [(DCNewGoogleMapsLink *)self parseLinkType];
  [(DCNewGoogleMapsLink *)self parseMapsData];
  [(DCNewGoogleMapsLink *)self parseLatLonZoom];
}

- (void)parseLatLonZoom
{
  uint64_t v3 = [(DCNewGoogleMapsLink *)self latLonZoomString];
  uint64_t v4 = [MEMORY[0x263F08B08] scannerWithString:v3];
  [v4 scanString:@"@" intoString:0];
  id v12 = 0;
  [v4 scanUpToString:@"," intoString:&v12];
  id v5 = v12;
  [v4 scanString:@"," intoString:0];
  id v11 = 0;
  [v4 scanUpToString:@"," intoString:&v11];
  id v6 = v11;
  [v4 scanString:@"," intoString:0];
  uint64_t v7 = [NSString stringWithFormat:@"%@,%@", v5, v6];

  [(DCNewGoogleMapsLink *)self setLocation:v7];
  uint64_t v10 = 0;
  [v4 scanInteger:&v10];
  uint64_t v8 = objc_msgSend(v3, "substringWithRange:", objc_msgSend(v4, "scanLocation"), 1);
  if ([v8 isEqualToString:@"z"])
  {
    int64_t v9 = v10;
LABEL_5:
    self->_zoomLevel = v9;
    goto LABEL_6;
  }
  if ([v8 isEqualToString:@"m"])
  {
    int64_t v9 = (uint64_t)(floor(8.0 - log2((double)v10 * 0.000000480304131)) + -1.0);
    goto LABEL_5;
  }
LABEL_6:
}

- (id)latLonZoomString
{
  unsigned int v3 = [(DCNewGoogleMapsLink *)self linkType];
  if (v3 <= 3)
  {
    uint64_t v4 = [(DCNewGoogleMapsLink *)self mapsURLComponentAtIndex:qword_216612D70[v3]];
  }
  return v4;
}

- (void)parseLinkType
{
  unsigned int v3 = [(DCNewGoogleMapsLink *)self mapsURLComponents];
  id v5 = [v3 firstObject];

  if ([v5 isEqualToString:@"search"])
  {
    int v4 = 1;
LABEL_7:
    self->_linkType = v4;
    goto LABEL_8;
  }
  if ([v5 isEqualToString:@"place"])
  {
    int v4 = 2;
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"dir"])
  {
    int v4 = 3;
    goto LABEL_7;
  }
  if ([v5 hasPrefix:@"@"])
  {
    int v4 = 0;
    goto LABEL_7;
  }
LABEL_8:
  MEMORY[0x270F9A758]();
}

- (int)linkType
{
  if (![(DCNewGoogleMapsLink *)self parsed]) {
    [(DCNewGoogleMapsLink *)self parse];
  }
  return self->_linkType;
}

- (id)mapsURLComponentAtIndex:(int64_t)a3
{
  int v4 = [(DCNewGoogleMapsLink *)self mapsURLComponents];
  if ([v4 count] <= (unint64_t)a3)
  {
    id v6 = 0;
  }
  else
  {
    id v5 = [v4 objectAtIndex:a3];
    id v6 = [v5 stringByRemovingPercentEncoding];
  }
  return v6;
}

- (NSArray)mapsURLComponents
{
  mapsURLComponents = self->_mapsURLComponents;
  if (!mapsURLComponents)
  {
    int v4 = [(DCNewGoogleMapsLink *)self URL];
    id v5 = [v4 pathComponents];

    objc_msgSend(v5, "subarrayWithRange:", 2, objc_msgSend(v5, "count") - 2);
    id v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_mapsURLComponents;
    self->_mapsURLComponents = v6;

    mapsURLComponents = self->_mapsURLComponents;
  }
  return mapsURLComponents;
}

- (id)streetViewLocation
{
  if ([(DCNewGoogleMapsLink *)self showsStreetView])
  {
    unsigned int v3 = [(DCNewGoogleMapsLink *)self location];
  }
  else
  {
    unsigned int v3 = 0;
  }
  return v3;
}

- (BOOL)showsBicycling
{
  if (![(DCNewGoogleMapsLink *)self parsed]) {
    [(DCNewGoogleMapsLink *)self parse];
  }
  return self->_showsBicycling;
}

- (BOOL)showsStreetView
{
  if (![(DCNewGoogleMapsLink *)self parsed]) {
    [(DCNewGoogleMapsLink *)self parse];
  }
  return self->_showsStreetView;
}

- (BOOL)showsTransit
{
  if (![(DCNewGoogleMapsLink *)self parsed]) {
    [(DCNewGoogleMapsLink *)self parse];
  }
  return self->_showsTransit;
}

- (BOOL)showsTraffic
{
  if (![(DCNewGoogleMapsLink *)self parsed]) {
    [(DCNewGoogleMapsLink *)self parse];
  }
  return self->_showsTraffic;
}

- (unint64_t)mapType
{
  if (![(DCNewGoogleMapsLink *)self parsed]) {
    [(DCNewGoogleMapsLink *)self parse];
  }
  return self->_mapType;
}

- (int64_t)zoomLevel
{
  if (![(DCNewGoogleMapsLink *)self parsed]) {
    [(DCNewGoogleMapsLink *)self parse];
  }
  return self->_zoomLevel;
}

- (id)centerLocation
{
  if (![(DCNewGoogleMapsLink *)self parsed]) {
    [(DCNewGoogleMapsLink *)self parse];
  }
  return [(DCNewGoogleMapsLink *)self location];
}

- (unint64_t)directionsMode
{
  if ([(DCNewGoogleMapsLink *)self linkType] == 3) {
    return self->_directionsMode;
  }
  else {
    return 0;
  }
}

- (id)destinationAddress
{
  if ([(DCNewGoogleMapsLink *)self linkType] == 3)
  {
    unsigned int v3 = [(DCNewGoogleMapsLink *)self mapsURLComponentAtIndex:2];
    int v4 = [v3 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
  }
  else
  {
    int v4 = 0;
  }
  return v4;
}

- (id)startAddress
{
  if ([(DCNewGoogleMapsLink *)self linkType] == 3)
  {
    unsigned int v3 = [(DCNewGoogleMapsLink *)self mapsURLComponentAtIndex:1];
    int v4 = [v3 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
  }
  else
  {
    int v4 = 0;
  }
  return v4;
}

- (id)searchLocation
{
  if ([(DCNewGoogleMapsLink *)self linkType] == 1)
  {
    unsigned int v3 = [(DCNewGoogleMapsLink *)self location];
  }
  else
  {
    unsigned int v3 = 0;
  }
  return v3;
}

- (id)searchNearQuery
{
  return 0;
}

- (id)searchQuery
{
  if ([(DCNewGoogleMapsLink *)self linkType] - 1 > 1)
  {
    unsigned int v3 = 0;
  }
  else
  {
    unsigned int v3 = [(DCNewGoogleMapsLink *)self mapsURLComponentAtIndex:1];
  }
  return v3;
}

- (DCNewGoogleMapsLink)initWithURL:(id)a3
{
  id v5 = a3;
  id v6 = [(DCNewGoogleMapsLink *)self init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URL, a3);
    uint64_t v8 = v7;
  }

  return v7;
}

@end