@interface GEOMapItemAttribution
+ (GEOMapItemAttribution)attributionWithDataAttribution:(id)a3 searchInfo:(id)a4 class:(Class)a5;
- (BOOL)requiresAttributionInCallout;
- (BOOL)requiresAttributionInDeveloperPlaceCard;
- (BOOL)shouldOpenInAppStore;
- (GEOMapItemAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4;
- (GEOMapItemAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 poiID:(id)a5;
- (GEOMapItemAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 yelpID:(id)a5;
- (NSArray)attributionApps;
- (NSArray)attributionURLs;
- (NSString)appAdamID;
- (NSString)captionDisplayName;
- (NSString)providerID;
- (NSString)providerName;
- (NSString)webBaseActionURL;
- (id)_yelpHTTPURLForRequirement:(int)a3 withUID:(id)a4 writeAReview:(BOOL)a5;
- (id)providerLogoPathForScale:(double)a3;
- (id)providerSnippetLogoPathForScale:(double)a3;
@end

@implementation GEOMapItemAttribution

+ (GEOMapItemAttribution)attributionWithDataAttribution:(id)a3 searchInfo:(id)a4 class:(Class)a5
{
  v7 = (id *)a3;
  id v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    if ([v8 supportsActionURLs])
    {
      id v11 = [a5 alloc];
      v12 = -[GEOPDAttribution attributionUrls](v7);
      v13 = -[GEOPDAttribution externalItemId](v7);
      uint64_t v14 = [v11 initWithSearchAttributionInfo:v9 attributionURLs:v12 poiID:v13];
    }
    else
    {
      int v15 = [v7 _isYelp];
      id v16 = [a5 alloc];
      v12 = -[GEOPDAttribution attributionUrls](v7);
      if (!v15)
      {
        v10 = (void *)[v16 initWithSearchAttributionInfo:v9 attributionURLs:v12];
        goto LABEL_9;
      }
      v13 = -[GEOPDAttribution externalItemId](v7);
      uint64_t v14 = [v16 initWithSearchAttributionInfo:v9 attributionURLs:v12 yelpID:v13];
    }
    v10 = (void *)v14;

LABEL_9:
  }

  return (GEOMapItemAttribution *)v10;
}

- (GEOMapItemAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 poiID:(id)a5
{
  id v8 = a5;
  v9 = [(GEOMapItemAttribution *)self initWithSearchAttributionInfo:a3 attributionURLs:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    poiID = v9->_poiID;
    v9->_poiID = (NSString *)v10;
  }
  return v9;
}

- (GEOMapItemAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapItemAttribution;
  v9 = [(GEOMapItemAttribution *)&v15 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_info, a3);
    uint64_t v11 = [v8 copy];
    attributionURLs = v10->_attributionURLs;
    v10->_attributionURLs = (NSArray *)v11;

    v13 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiID, 0);
  objc_storeStrong((id *)&self->_yelpID, 0);
  objc_storeStrong((id *)&self->_attributionURLs, 0);

  objc_storeStrong((id *)&self->_info, 0);
}

- (GEOMapItemAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 yelpID:(id)a5
{
  id v8 = a5;
  v9 = [(GEOMapItemAttribution *)self initWithSearchAttributionInfo:a3 attributionURLs:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    yelpID = v9->_yelpID;
    v9->_yelpID = (NSString *)v10;

    v12 = v9;
  }

  return v9;
}

- (BOOL)shouldOpenInAppStore
{
  return [(GEOSearchAttributionInfo *)self->_info shouldOpenInAppStore];
}

- (NSString)providerName
{
  return [(GEOSearchAttributionInfo *)self->_info displayName];
}

- (NSString)providerID
{
  return [(GEOSearchAttributionInfo *)self->_info identifier];
}

- (NSString)captionDisplayName
{
  v3 = [(GEOSearchAttributionInfo *)self->_info captionDisplayName];
  uint64_t v4 = [v3 length];

  if (v4) {
    [(GEOSearchAttributionInfo *)self->_info captionDisplayName];
  }
  else {
  v5 = [(GEOMapItemAttribution *)self providerName];
  }

  return (NSString *)v5;
}

- (NSArray)attributionApps
{
  return [(GEOSearchAttributionInfo *)self->_info attributionApps];
}

- (NSString)webBaseActionURL
{
  return [(GEOSearchAttributionInfo *)self->_info webBaseActionURL];
}

- (id)providerLogoPathForScale:(double)a3
{
  return [(GEOSearchAttributionInfo *)self->_info logoPathForScale:a3];
}

- (id)providerSnippetLogoPathForScale:(double)a3
{
  return [(GEOSearchAttributionInfo *)self->_info snippetLogoPathForScale:a3];
}

- (BOOL)requiresAttributionInCallout
{
  return [(GEOSearchAttributionInfo *)self->_info hasAttributionRequirement:5];
}

- (BOOL)requiresAttributionInDeveloperPlaceCard
{
  v2 = [(GEOSearchAttributionInfo *)self->_info source];
  if (v2) {
    BOOL v3 = v2[136] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (NSString)appAdamID
{
  return [(GEOSearchAttributionInfo *)self->_info appAdamID];
}

- (id)_yelpHTTPURLForRequirement:(int)a3 withUID:(id)a4 writeAReview:(BOOL)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = self->_info;
  if (!v9)
  {
    v17 = 0;
    goto LABEL_38;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v10 = [(GEOMapItemAttribution *)self attributionURLs];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (!v11)
  {
    v17 = 0;
    v18 = v10;
    goto LABEL_37;
  }
  uint64_t v12 = v11;
  BOOL v45 = a5;
  id v13 = v8;
  uint64_t v14 = *(void *)v47;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v47 != v14) {
        objc_enumerationMutation(v10);
      }
      id v16 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      if (([v16 hasPrefix:@"http://"] & 1) != 0
        || ([v16 hasPrefix:@"https://"] & 1) != 0)
      {
        v19 = (void *)MEMORY[0x1E4F1CB10];
        v20 = [v16 stringByAddingPercentEscapesUsingEncoding:4];
        v18 = [v19 URLWithString:v20];

        if (!v18)
        {
          v17 = 0;
          id v8 = v13;
          goto LABEL_38;
        }
        v21 = [v18 host];
        id v8 = v13;
        if (!v21) {
          goto LABEL_35;
        }
        v22 = [v18 scheme];
        if (!v22) {
          goto LABEL_35;
        }
        v23 = v22;
        if (v45)
        {
        }
        else
        {
          v24 = [v18 pathComponents];
          unint64_t v25 = [v24 count];

          if (v25 < 3) {
            goto LABEL_35;
          }
        }
        if (([v21 hasPrefix:@"www."] & 1) == 0)
        {
          uint64_t v26 = [@"www." stringByAppendingString:v21];

          v21 = (void *)v26;
        }
        switch(a3)
        {
          case 1:
            goto LABEL_35;
          case 2:
            v34 = NSString;
            v35 = [v18 pathComponents];
            v31 = v35;
            if (v45)
            {
              v36 = [v35 objectAtIndex:2];
              uint64_t v30 = [v34 stringWithFormat:@"writeareview/biz/%@", v36];

              uint64_t v37 = 0;
LABEL_32:

LABEL_33:
              if (v30 | v37)
              {
                id v41 = objc_alloc_init(MEMORY[0x1E4F29088]);
                v42 = [v18 scheme];
                [v41 setScheme:v42];

                [v41 setHost:v21];
                [v41 setPath:v30];
                [v41 setQueryItems:v37];
                v43 = [v41 URL];
                v17 = [v43 absoluteString];

LABEL_36:
                goto LABEL_37;
              }
LABEL_35:
              v17 = [v18 absoluteString];
              goto LABEL_36;
            }
            v38 = [v35 objectAtIndex:1];
            v39 = [v18 pathComponents];
            v40 = [v39 objectAtIndex:2];
            uint64_t v30 = [v34 stringWithFormat:@"%@/%@", v38, v40];

            v31 = [MEMORY[0x1E4F290C8] queryItemWithName:@"hrid" value:v8];
            v50 = v31;
            v32 = (void *)MEMORY[0x1E4F1C978];
            v33 = &v50;
            break;
          case 3:
            v27 = NSString;
            v28 = [v18 pathComponents];
            v29 = [v28 objectAtIndex:2];
            uint64_t v30 = [v27 stringWithFormat:@"biz_photos/%@", v29];

            v31 = [MEMORY[0x1E4F290C8] queryItemWithName:@"select" value:v8];
            v51 = v31;
            v32 = (void *)MEMORY[0x1E4F1C978];
            v33 = &v51;
            break;
          default:
            uint64_t v30 = 0;
            uint64_t v37 = 0;
            goto LABEL_33;
        }
        uint64_t v37 = [v32 arrayWithObjects:v33 count:1];
        goto LABEL_32;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v12) {
      continue;
    }
    break;
  }
  v17 = 0;
  v18 = v10;
  id v8 = v13;
LABEL_37:

LABEL_38:

  return v17;
}

- (NSArray)attributionURLs
{
  return self->_attributionURLs;
}

@end