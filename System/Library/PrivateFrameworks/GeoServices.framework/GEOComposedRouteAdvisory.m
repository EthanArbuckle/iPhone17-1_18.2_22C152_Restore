@interface GEOComposedRouteAdvisory
+ (BOOL)supportsSecureCoding;
+ (id)_fallbackAdvisoryArtwork;
- (BOOL)isClickable;
- (GEOComposedRouteAdvisory)initWithCoder:(id)a3;
- (GEOComposedRouteAdvisory)initWithGeoAdvisoryNotice:(id)a3 incidents:(id)a4;
- (GEOComposedRouteAdvisory)initWithGeoAdvisoryNotice:(id)a3 transitIncidents:(id)a4;
- (GEOComposedString)detailCardTitle;
- (GEOComposedString)titleString;
- (GEOPBTransitArtwork)artwork;
- (GEOServerFormattedString)title;
- (NSArray)advisoryItems;
- (NSArray)analyticsMessageValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_commonInitWithAdvisoryNotice:(id)a3 artwork:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedRouteAdvisory

- (GEOComposedRouteAdvisory)initWithGeoAdvisoryNotice:(id)a3 incidents:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)GEOComposedRouteAdvisory;
  v8 = [(GEOComposedRouteAdvisory *)&v28 init];
  if (v8)
  {
    v9 = [v6 noticeArtwork];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [(id)objc_opt_class() _fallbackAdvisoryArtwork];
    }
    v12 = v11;

    [(GEOComposedRouteAdvisory *)v8 _commonInitWithAdvisoryNotice:v6 artwork:v12];
    v13 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v23 = v6;
    v14 = [v6 advisoryItems];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [[GEOComposedRouteAdvisoryItem alloc] initWithAdvisoryItem:*(void *)(*((void *)&v24 + 1) + 8 * i) routeIncidents:v7 fallbackIcon:v12];
          [v13 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v16);
    }

    uint64_t v20 = [v13 copy];
    advisoryItems = v8->_advisoryItems;
    v8->_advisoryItems = (NSArray *)v20;

    id v6 = v23;
  }

  return v8;
}

- (GEOComposedRouteAdvisory)initWithGeoAdvisoryNotice:(id)a3 transitIncidents:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)GEOComposedRouteAdvisory;
  v8 = [(GEOComposedRouteAdvisory *)&v29 init];
  v9 = v8;
  if (v8)
  {
    v8->_initialisedForTransit = 1;
    v10 = [v6 noticeArtwork];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [(id)objc_opt_class() _fallbackAdvisoryArtwork];
    }
    v13 = v12;

    [(GEOComposedRouteAdvisory *)v9 _commonInitWithAdvisoryNotice:v6 artwork:v13];
    v14 = objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v24 = v6;
    uint64_t v15 = [v6 advisoryItems];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [[GEOComposedRouteAdvisoryItem alloc] initWithAdvisoryItem:*(void *)(*((void *)&v25 + 1) + 8 * i) transitIncidents:v7 fallbackIcon:v13];
          [v14 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v17);
    }

    uint64_t v21 = [v14 copy];
    advisoryItems = v9->_advisoryItems;
    v9->_advisoryItems = (NSArray *)v21;

    id v6 = v24;
  }

  return v9;
}

- (void)_commonInitWithAdvisoryNotice:(id)a3 artwork:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 noticeText];
  title = self->_title;
  self->_title = v8;

  v10 = [GEOComposedString alloc];
  id v11 = [v6 noticeText];
  id v12 = [(GEOComposedString *)v10 initWithGeoFormattedString:v11];
  titleString = self->_titleString;
  self->_titleString = v12;

  if (!self->_titleString && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v21 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _titleString != nil", v21, 2u);
  }
  self->_isClickable = [v6 shouldAlwaysShowAdvisoryCard];
  objc_storeStrong((id *)&self->_artwork, a4);
  v14 = [v6 analyticsMessageValues];
  uint64_t v15 = (NSArray *)[v14 copy];
  analyticsMessageValues = self->_analyticsMessageValues;
  self->_analyticsMessageValues = v15;

  if ([v6 hasDetailCardTitle])
  {
    uint64_t v17 = [GEOComposedString alloc];
    uint64_t v18 = [v6 detailCardTitle];
    v19 = [(GEOComposedString *)v17 initWithGeoFormattedString:v18];
    detailCardTitle = self->_detailCardTitle;
    self->_detailCardTitle = v19;
  }
}

+ (id)_fallbackAdvisoryArtwork
{
  if (qword_1EB2A0330 != -1) {
    dispatch_once(&qword_1EB2A0330, &__block_literal_global_164);
  }
  v2 = (void *)_MergedGlobals_305;

  return v2;
}

void __52__GEOComposedRouteAdvisory__fallbackAdvisoryArtwork__block_invoke()
{
  v0 = objc_alloc_init(GEOPBTransitArtwork);
  v4 = objc_alloc_init(GEOPBTransitIcon);
  v1 = objc_alloc_init(GEOStyleAttributes);
  v2 = objc_alloc_init(GEOStyleAttribute);
  [(GEOStyleAttribute *)v2 setKey:65618];
  [(GEOStyleAttribute *)v2 setValue:4];
  [(GEOStyleAttributes *)v1 addAttribute:v2];
  [(GEOPBTransitIcon *)v4 setStyleAttributes:v1];
  [(GEOPBTransitArtwork *)v0 setIcon:v4];
  v3 = (void *)_MergedGlobals_305;
  _MergedGlobals_305 = (uint64_t)v0;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@ title: %@, artwork: %@, isClickable: %d, advisoryItems: %@, analyticsMessageValues: %@, initialisedForTransit: %d>", v5, self->_titleString, self->_artwork, self->_isClickable, self->_advisoryItems, self->_analyticsMessageValues, self->_initialisedForTransit];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteAdvisory)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOComposedRouteAdvisory;
  v5 = [(GEOComposedRouteAdvisory *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (GEOServerFormattedString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_titleString"];
    titleString = v5->_titleString;
    v5->_titleString = (GEOComposedString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_artwork"];
    artwork = v5->_artwork;
    v5->_artwork = (GEOPBTransitArtwork *)v10;

    v5->_isClickable = [v4 decodeBoolForKey:@"_isClickable"];
    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_advisoryItems"];
    advisoryItems = v5->_advisoryItems;
    v5->_advisoryItems = (NSArray *)v12;

    uint64_t v14 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_analyticsMessageValues"];
    analyticsMessageValues = v5->_analyticsMessageValues;
    v5->_analyticsMessageValues = (NSArray *)v14;

    v5->_initialisedForTransit = [v4 decodeBoolForKey:@"_initialisedForTransit"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_detailCardTitle"];
    detailCardTitle = v5->_detailCardTitle;
    v5->_detailCardTitle = (GEOComposedString *)v16;

    uint64_t v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"_title"];
  [v5 encodeObject:self->_titleString forKey:@"_titleString"];
  [v5 encodeObject:self->_artwork forKey:@"_artwork"];
  [v5 encodeBool:self->_isClickable forKey:@"_isClickable"];
  [v5 encodeObject:self->_advisoryItems forKey:@"_advisoryItems"];
  [v5 encodeObject:self->_analyticsMessageValues forKey:@"_analyticsMessageValues"];
  [v5 encodeBool:self->_initialisedForTransit forKey:@"_initialisedForTransit"];
  [v5 encodeObject:self->_detailCardTitle forKey:@"_detailCardTitle"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 8), self->_title);
  uint64_t v5 = [(GEOComposedString *)self->_titleString copy];
  uint64_t v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  objc_storeStrong((id *)(v4 + 24), self->_artwork);
  *(unsigned char *)(v4 + 32) = self->_isClickable;
  uint64_t v7 = [(NSArray *)self->_advisoryItems copy];
  uint64_t v8 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v7;

  uint64_t v9 = [(NSArray *)self->_analyticsMessageValues copy];
  uint64_t v10 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v9;

  *(unsigned char *)(v4 + 48) = self->_initialisedForTransit;
  uint64_t v11 = [(GEOComposedString *)self->_detailCardTitle copy];
  uint64_t v12 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v11;

  return (id)v4;
}

- (GEOServerFormattedString)title
{
  return self->_title;
}

- (GEOComposedString)titleString
{
  return self->_titleString;
}

- (GEOPBTransitArtwork)artwork
{
  return self->_artwork;
}

- (BOOL)isClickable
{
  return self->_isClickable;
}

- (NSArray)advisoryItems
{
  return self->_advisoryItems;
}

- (NSArray)analyticsMessageValues
{
  return self->_analyticsMessageValues;
}

- (GEOComposedString)detailCardTitle
{
  return self->_detailCardTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailCardTitle, 0);
  objc_storeStrong((id *)&self->_analyticsMessageValues, 0);
  objc_storeStrong((id *)&self->_advisoryItems, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_titleString, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end