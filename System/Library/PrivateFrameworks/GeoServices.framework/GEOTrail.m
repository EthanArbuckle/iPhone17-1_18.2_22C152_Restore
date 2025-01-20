@interface GEOTrail
+ (id)factoidsFromFactoidData:(id)a3;
- (BOOL)shouldHighlight;
- (GEOFeatureStyleAttributes)styleAttributes;
- (GEOMapItemIdentifier)trailIdentifier;
- (GEOMapItemPhoto)photo;
- (GEOTrail)initWithTrail:(id)a3;
- (NSArray)factoids;
- (NSString)categoryName;
- (NSString)name;
- (unint64_t)trailId;
@end

@implementation GEOTrail

- (GEOTrail)initWithTrail:(id)a3
{
  v4 = (id *)a3;
  v40.receiver = self;
  v40.super_class = (Class)GEOTrail;
  v5 = [(GEOTrail *)&v40 init];
  if (!v5)
  {
LABEL_10:
    v37 = v5;
    goto LABEL_11;
  }
  v6 = objc_opt_class();
  v7 = -[GEOPDTrail factoid](v4);
  uint64_t v8 = [v6 factoidsFromFactoidData:v7];
  factoids = v5->_factoids;
  v5->_factoids = (NSArray *)v8;

  v10 = -[GEOPDTrail mapsIds](v4);
  v11 = [v10 firstObject];

  if (v11)
  {
    v12 = [v11 shardedId];
    v5->_trailId = [v12 muid];

    v13 = [[GEOMapItemIdentifier alloc] initWithMapsIdentifier:v11];
    trailIdentifier = v5->_trailIdentifier;
    v5->_trailIdentifier = v13;

    v15 = -[GEOPDTrail entity](v4);
    v16 = [v15 bestLocalizedName];
    uint64_t v17 = [v16 stringValue];
    name = v5->_name;
    v5->_name = (NSString *)v17;

    v19 = -[GEOPDTrail entity](v4);
    v20 = [v19 localizedCategorys];
    v21 = [v20 firstObject];
    uint64_t v22 = [v21 bestLocalizedCategoryName];
    categoryName = v5->_categoryName;
    v5->_categoryName = (NSString *)v22;

    v24 = -[GEOPDTrail photo](v4);

    if (v24)
    {
      v25 = [_GEOPlaceDataPhoto alloc];
      v26 = -[GEOPDTrail photo](v4);
      uint64_t v27 = [(_GEOPlaceDataPhoto *)v25 initWithPhoto:v26];
      photo = v5->_photo;
      v5->_photo = (GEOMapItemPhoto *)v27;
    }
    v29 = -[GEOPDTrail entity](v4);
    v30 = [v29 styleAttributes];

    if (v30)
    {
      v31 = [GEOFeatureStyleAttributes alloc];
      v32 = -[GEOPDTrail entity](v4);
      v33 = [v32 styleAttributes];
      uint64_t v34 = [(GEOFeatureStyleAttributes *)v31 initWithPlaceDataStyleAttributes:v33];
      styleAttributes = v5->_styleAttributes;
      v5->_styleAttributes = (GEOFeatureStyleAttributes *)v34;
    }
    if (v4) {
      BOOL v36 = *((unsigned char *)v4 + 84) != 0;
    }
    else {
      BOOL v36 = 0;
    }
    v5->_shouldHighlight = v36;

    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v39 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: identifier != ((void *)0)", v39, 2u);
  }
  v37 = 0;
LABEL_11:

  return v37;
}

+ (id)factoidsFromFactoidData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = (id *)a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  if (v3) {
    uint64_t v5 = [v3[2] count];
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = (void *)[v4 initWithCapacity:v5];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v7 = -[GEOPDTrailHeadTrailFactoidData factoids](v3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v13 = [GEOFactoid alloc];
        v14 = -[GEOFactoid initWithFactoid:](v13, "initWithFactoid:", v12, (void)v16);
        if (v14) {
          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (NSArray)factoids
{
  return self->_factoids;
}

- (unint64_t)trailId
{
  return self->_trailId;
}

- (NSString)name
{
  return self->_name;
}

- (GEOMapItemPhoto)photo
{
  return self->_photo;
}

- (GEOMapItemIdentifier)trailIdentifier
{
  return self->_trailIdentifier;
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (BOOL)shouldHighlight
{
  return self->_shouldHighlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
  objc_storeStrong((id *)&self->_trailIdentifier, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_factoids, 0);
}

@end