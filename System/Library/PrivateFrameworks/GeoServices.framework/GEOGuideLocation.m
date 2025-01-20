@interface GEOGuideLocation
+ (id)guideLocationsForEntries:(id)a3 mapsResults:(id)a4;
- (BOOL)isEqual:(id)a3;
- (GEOGuideLocation)initWithChildAction:(id)a3;
- (GEOGuideLocation)initWithGuideLocation:(id)a3;
- (GEOGuideLocation)initWithGuideLocation:(id)a3 mapsResult:(id)a4;
- (GEOGuideLocation)initWithWorldwideGuideLocation:(id)a3;
- (GEOMapItemIdentifier)guideLocationIdentifier;
- (NSString)country;
- (NSString)title;
- (id)description;
- (id)pdLocationEntry;
- (id)pdWorldwideLocationEntry;
- (id)photosForType:(int64_t)a3;
- (int64_t)type;
- (unint64_t)numberOfGuides;
@end

@implementation GEOGuideLocation

- (GEOGuideLocation)initWithChildAction:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  v5 = v4;
  if (v4 && (-[GEOPDChildAction _readChildActionGuides]((uint64_t)v4), v5[6]))
  {
    v15.receiver = self;
    v15.super_class = (Class)GEOGuideLocation;
    v6 = [(GEOGuideLocation *)&v15 init];
    if (v6)
    {
      -[GEOPDChildAction childActionGuides](v5);
      v7 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = -[GEOPDChildActionGuides guidesLocationEntry](v7);
      guideLocation = v6->_guideLocation;
      v6->_guideLocation = (GEOPDGuidesLocationEntry *)v8;

      v10 = GEOGetCuratedCollectionsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = -[GEOPDGuidesLocationEntry placeId]((id *)&v6->_guideLocation->super.super.isa);
        v12 = [(GEOPDEntity *)v6->_placeEntity bestLocalizedName];
        *(_DWORD *)buf = 138412546;
        v17 = v11;
        __int16 v18 = 2112;
        v19 = v12;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "Succesfully initialized Guide Location with Id: %@, Title: %@", buf, 0x16u);
      }
    }
    self = v6;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (GEOGuideLocation)initWithWorldwideGuideLocation:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  if (-[GEOPDGuidesLocationEntry type]((uint64_t)v4) != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: guideLocation.type == GEOPDGuidesLocationEntry_GuidesLocationEntryType_GUIDES_LOCATION_ENTRY_TYPE_WORLDWIDE", buf, 2u);
    }
    goto LABEL_23;
  }
  if (v4)
  {
    -[GEOPDGuidesLocationEntry _readWorldwide]((uint64_t)v4);
    BOOL v5 = v4[9] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  uint64_t v6 = -[GEOPDGuidesLocationEntry worldwide](v4);
  v7 = (void *)v6;
  if (v6)
  {
    -[GEOPDGuidesLocationEntryTypeWorldWide _readName](v6);
    BOOL v8 = v7[4] != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  uint64_t v9 = -[GEOPDGuidesLocationEntry worldwide](v4);
  if (!v9
    || (v10 = (void *)v9,
        -[GEOPDGuidesLocationEntryTypeWorldWide _readPhoto](v9),
        uint64_t v11 = v10[5],
        v10,
        !v11))
  {
    v12 = GEOGetCuratedCollectionsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "NO";
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEBUG, "Worldwide Guide Location is missing some data .\n, hasPhoto: %s", buf, 0xCu);
    }
  }
  if (!v5 || !v8)
  {
    v17 = GEOGetCuratedCollectionsLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = "NO";
      if (v5) {
        v19 = "YES";
      }
      else {
        v19 = "NO";
      }
      if (v8) {
        __int16 v18 = "YES";
      }
      *(_DWORD *)buf = 136315394;
      v23 = v19;
      __int16 v24 = 2080;
      v25 = v18;
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_ERROR, "Worldwide Guide Location could not be initialized because some data is missing.\n, hasWorldwide:%s, hasName: %s", buf, 0x16u);
    }

LABEL_23:
    v16 = 0;
    goto LABEL_24;
  }
  v21.receiver = self;
  v21.super_class = (Class)GEOGuideLocation;
  v13 = [(GEOGuideLocation *)&v21 init];
  if (v13)
  {
    uint64_t v14 = -[GEOPDGuidesLocationEntry worldwide](v4);
    worldwideGuideLocation = v13->_worldwideGuideLocation;
    v13->_worldwideGuideLocation = (GEOPDGuidesLocationEntryTypeWorldWide *)v14;
  }
  self = v13;
  v16 = self;
LABEL_24:

  return v16;
}

- (GEOGuideLocation)initWithGuideLocation:(id)a3
{
  id v5 = a3;
  if (-[GEOPDGuidesLocationEntry type]((uint64_t)v5) == 2)
  {
    uint64_t v6 = [(GEOGuideLocation *)self initWithWorldwideGuideLocation:v5];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOGuideLocation;
    v7 = [(GEOGuideLocation *)&v10 init];
    uint64_t v6 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_guideLocation, a3);
    }
  }
  BOOL v8 = v6;

  return v8;
}

- (GEOGuideLocation)initWithGuideLocation:(id)a3 mapsResult:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v7 = (id *)a3;
  id v8 = a4;
  if (-[GEOPDGuidesLocationEntry type]((uint64_t)v7) == 2)
  {
    self = [(GEOGuideLocation *)self initWithWorldwideGuideLocation:v7];
    uint64_t v9 = self;
  }
  else
  {
    objc_super v10 = [v8 place];
    if (v10)
    {
      uint64_t v11 = [[GEOMapItemIdentifier alloc] initWithPlace:v10];
      v12 = [GEOMapItemIdentifier alloc];
      v13 = -[GEOPDGuidesLocationEntry placeId](v7);
      uint64_t v14 = [(GEOMapItemIdentifier *)v12 initWithMapsIdentifier:v13];

      v42 = v14;
      v43 = v11;
      BOOL v15 = [(GEOMapItemIdentifier *)v14 isEqual:v11];
      uint64_t v16 = +[GEOPDEntity entityForPlaceData:v10];
      v17 = +[GEOPDGuideGroup guideGroupComponentFromPlaceData:v10];
      __int16 v18 = +[GEOAddressObject addressObjectForPlaceData:v10];
      v19 = [v18 countryName];

      obj = v17;
      uint64_t v20 = -[GEOPDGuideGroup guideLocationImages](v17);
      uint64_t v21 = [v20 count];

      v22 = (void *)v16;
      if (v15 && v16 && v19)
      {
        v45.receiver = self;
        v45.super_class = (Class)GEOGuideLocation;
        v23 = [(GEOGuideLocation *)&v45 init];
        p_isa = (id *)&v23->super.isa;
        if (v23)
        {
          p_placeEntity = (id *)&v23->_placeEntity;
          objc_storeStrong((id *)&v23->_placeEntity, v22);
          objc_storeStrong(p_isa + 4, obj);
          objc_storeStrong(p_isa + 5, v19);
          objc_storeStrong(p_isa + 1, a3);
          if (!v21)
          {
            uint64_t v26 = GEOGetCuratedCollectionsLog();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              [p_isa description];
              v27 = v19;
              v28 = v22;
              v29 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v47 = v29;
              _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_INFO, "Warning. %@ does not contain any photos.", buf, 0xCu);

              v22 = v28;
              v19 = v27;
              p_placeEntity = p_isa + 3;
            }
          }
          v30 = GEOGetCuratedCollectionsLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            -[GEOPDGuidesLocationEntry placeId]((id *)p_isa[1]);
            v31 = (char *)objc_claimAutoreleasedReturnValue();
            [*p_placeEntity bestLocalizedName];
            v32 = v19;
            v33 = v22;
            v34 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v47 = v31;
            __int16 v48 = 2112;
            v49 = v34;
            _os_log_impl(&dword_188D96000, v30, OS_LOG_TYPE_DEBUG, "Succesfully initialized Guide Location with Id: %@, Title: %@", buf, 0x16u);

            v22 = v33;
            v19 = v32;
          }
        }
        self = p_isa;
        uint64_t v9 = self;
      }
      else
      {
        v36 = GEOGetCuratedCollectionsLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v37 = "NO";
          if (v15) {
            v38 = "YES";
          }
          else {
            v38 = "NO";
          }
          if (v16) {
            v39 = "YES";
          }
          else {
            v39 = "NO";
          }
          *(_DWORD *)buf = 136315906;
          v47 = v38;
          if (v21) {
            v40 = "YES";
          }
          else {
            v40 = "NO";
          }
          __int16 v48 = 2080;
          v49 = v39;
          __int16 v50 = 2080;
          v51 = v40;
          if (v19) {
            v37 = "YES";
          }
          __int16 v52 = 2080;
          v53 = v37;
          _os_log_impl(&dword_188D96000, v36, OS_LOG_TYPE_ERROR, "Guide Location could not be initialized because some data is missing.\n Guide Location hasCorrectIdentifiers: %s, hasEntity: %s, hasPhotos: %s, hasCountry: %s", buf, 0x2Au);
        }

        uint64_t v9 = 0;
      }

      p_super = &v43->super;
    }
    else
    {
      p_super = GEOGetCuratedCollectionsLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, p_super, OS_LOG_TYPE_ERROR, "Guide Location could not be initialized because some data is missing.\n Guide Location hasPlace: NO", buf, 2u);
      }
      uint64_t v9 = 0;
    }
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (GEOGuideLocation *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    if ([(GEOGuideLocation *)self type] == 2 && [(GEOGuideLocation *)v6 type] == 2)
    {
      char v7 = 1;
    }
    else
    {
      id v8 = [(GEOGuideLocation *)self guideLocationIdentifier];
      uint64_t v9 = [(GEOGuideLocation *)v6 guideLocationIdentifier];
      char v7 = [v8 isEqualToGEOMapItemIdentifier:v9];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = [(GEOGuideLocation *)self guideLocationIdentifier];
  uint64_t v5 = [v4 muid];
  uint64_t v6 = [(GEOGuideLocation *)self title];
  char v7 = [v3 stringWithFormat:@"Guide Location: %llu : %@", v5, v6];

  return v7;
}

- (int64_t)type
{
  if (self->_worldwideGuideLocation) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)pdWorldwideLocationEntry
{
  return self->_worldwideGuideLocation;
}

- (id)pdLocationEntry
{
  return self->_guideLocation;
}

- (NSString)title
{
  worldwideGuideLocation = self->_worldwideGuideLocation;
  if (worldwideGuideLocation) {
    -[GEOPDGuidesLocationEntryTypeWorldWide name]((id *)&worldwideGuideLocation->super.super.isa);
  }
  else {
  v4 = [(GEOPDEntity *)self->_placeEntity bestLocalizedString];
  }

  return (NSString *)v4;
}

- (unint64_t)numberOfGuides
{
  if (self->_worldwideGuideLocation) {
    return 0;
  }
  guideLocation = self->_guideLocation;
  if (!guideLocation) {
    return 0;
  }
  else {
    return guideLocation->_numGuides;
  }
}

- (id)photosForType:(int64_t)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    int v4 = 2;
  }
  else {
    int v4 = 1;
  }
  if ([(GEOGuideLocation *)self type] == 2)
  {
    uint64_t v5 = -[GEOPDGuidesLocationEntryTypeWorldWide guideLocationImages]((id *)&self->_worldwideGuideLocation->super.super.isa);
    uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __34__GEOGuideLocation_photosForType___block_invoke;
    __int16 v24 = &__block_descriptor_36_e50_B24__0__GEOPDGuideLocationImage_8__NSDictionary_16l;
    LODWORD(v25) = v4;
    char v7 = &v21;
  }
  else
  {
    uint64_t v5 = -[GEOPDGuideGroup guideLocationImages]((id *)&self->_guideGroup->super.super.isa);
    uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    __int16 v18 = __34__GEOGuideLocation_photosForType___block_invoke_2;
    v19 = &__block_descriptor_36_e50_B24__0__GEOPDGuideLocationImage_8__NSDictionary_16l;
    LODWORD(v20) = v4;
    char v7 = &v16;
  }
  id v8 = objc_msgSend(v6, "predicateWithBlock:", v7, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);
  uint64_t v9 = [v5 filteredArrayUsingPredicate:v8];
  objc_super v10 = [v9 firstObject];
  uint64_t v11 = -[GEOPDGuideLocationImage image](v10);

  if (v11
    && (v12 = [[_GEOPlaceDataPhoto alloc] initWithCaptionedPhoto:v11]) != 0)
  {
    v13 = v12;
    v26[0] = v12;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

BOOL __34__GEOGuideLocation_photosForType___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 && (*(unsigned char *)(a2 + 28) & 1) != 0) {
    int v2 = *(_DWORD *)(a2 + 24);
  }
  else {
    int v2 = 0;
  }
  return v2 == *(_DWORD *)(a1 + 32);
}

BOOL __34__GEOGuideLocation_photosForType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 && (*(unsigned char *)(a2 + 28) & 1) != 0) {
    int v2 = *(_DWORD *)(a2 + 24);
  }
  else {
    int v2 = 0;
  }
  return v2 == *(_DWORD *)(a1 + 32);
}

- (GEOMapItemIdentifier)guideLocationIdentifier
{
  if (self->_worldwideGuideLocation)
  {
    int v2 = 0;
  }
  else
  {
    int v4 = [GEOMapItemIdentifier alloc];
    uint64_t v5 = -[GEOPDGuidesLocationEntry placeId]((id *)&self->_guideLocation->super.super.isa);
    int v2 = [(GEOMapItemIdentifier *)v4 initWithMapsIdentifier:v5];
  }

  return v2;
}

+ (id)guideLocationsForEntries:(id)a3 mapsResults:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v8 = [v5 firstObject];
  if (v8 && (uint64_t v9 = (void *)v8, -[GEOPDGuidesLocationEntry _readWorldwide](v8), v10 = v9[9], v9, v10))
  {
    uint64_t v11 = [v5 firstObject];
    v12 = [[GEOGuideLocation alloc] initWithGuideLocation:v11 mapsResult:0];
    if (v12) {
      [v7 addObject:v12];
    }
    id v13 = v7;
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global];
    uint64_t v11 = [v6 filteredArrayUsingPredicate:v14];

    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __57__GEOGuideLocation_guideLocationsForEntries_mapsResults___block_invoke_2;
    v29[3] = &unk_1E53D7880;
    id v16 = v15;
    id v30 = v16;
    [v5 enumerateObjectsUsingBlock:v29];
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __57__GEOGuideLocation_guideLocationsForEntries_mapsResults___block_invoke_3;
    v27[3] = &unk_1E53D78A8;
    id v18 = v17;
    id v28 = v18;
    [v11 enumerateObjectsUsingBlock:v27];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __57__GEOGuideLocation_guideLocationsForEntries_mapsResults___block_invoke_4;
    v23[3] = &unk_1E53D78D0;
    id v24 = v18;
    id v25 = v16;
    id v19 = v7;
    id v26 = v19;
    id v20 = v16;
    id v21 = v18;
    [v5 enumerateObjectsUsingBlock:v23];
    id v13 = (id)[v19 copy];
  }

  return v13;
}

BOOL __57__GEOGuideLocation_guideLocationsForEntries_mapsResults___block_invoke(uint64_t a1, void *a2)
{
  return [a2 resultType] == 1;
}

void __57__GEOGuideLocation_guideLocationsForEntries_mapsResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v7 = v3;
    -[GEOPDGuidesLocationEntry _readPlaceId]((uint64_t)v3);
    id v3 = v7;
    if (*((void *)v7 + 8))
    {
      int v4 = [GEOMapItemIdentifier alloc];
      id v5 = -[GEOPDGuidesLocationEntry placeId]((id *)v7);
      id v6 = [(GEOMapItemIdentifier *)v4 initWithMapsIdentifier:v5];

      if (v6) {
        [*(id *)(a1 + 32) setObject:v6 forKey:v7];
      }

      id v3 = v7;
    }
  }
}

void __57__GEOGuideLocation_guideLocationsForEntries_mapsResults___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [GEOMapItemIdentifier alloc];
  int v4 = [v7 place];
  id v5 = [v4 mapsId];
  id v6 = [(GEOMapItemIdentifier *)v3 initWithMapsIdentifier:v5];

  if (v6) {
    [*(id *)(a1 + 32) setObject:v7 forKey:v6];
  }
}

void __57__GEOGuideLocation_guideLocationsForEntries_mapsResults___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) objectForKey:v3];
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    id v7 = [[GEOGuideLocation alloc] initWithGuideLocation:v3 mapsResult:v6];
    if (v7) {
      [*(id *)(a1 + 48) addObject:v7];
    }
  }
  else
  {
    uint64_t v8 = GEOGetCuratedCollectionsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "Missing place map result for guide location entry: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (NSString)country
{
  return self->_country;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_guideGroup, 0);
  objc_storeStrong((id *)&self->_placeEntity, 0);
  objc_storeStrong((id *)&self->_worldwideGuideLocation, 0);

  objc_storeStrong((id *)&self->_guideLocation, 0);
}

@end