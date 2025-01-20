@interface GEOAllGuidesLocationsSection
- (BOOL)isWorldwideSection;
- (GEOAllGuidesLocationsSection)initWithAllGuidesLocationSection:(id)a3 mapsResults:(id)a4;
- (NSArray)guideLocationIdentifiers;
- (NSArray)guideLocations;
- (NSDictionary)pdGuideLocationEntries;
- (NSString)sectionTitle;
- (id)placeResultForSection:(id)a3 mapsResults:(id)a4;
@end

@implementation GEOAllGuidesLocationsSection

- (GEOAllGuidesLocationsSection)initWithAllGuidesLocationSection:(id)a3 mapsResults:(id)a4
{
  v7 = (id *)a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GEOAllGuidesLocationsSection;
  v9 = [(GEOAllGuidesLocationsSection *)&v17 init];
  if (v9)
  {
    v10 = -[GEOPDAllGuidesLocationsSection entrys](v7);
    v11 = [v10 firstObject];

    if (v11 && (-[GEOPDGuidesLocationEntry _readWorldwide]((uint64_t)v11), v11[9]))
    {
      v9->_isWorldwideSection = 1;
    }
    else
    {
      if (v7)
      {
        -[GEOPDAllGuidesLocationsSection _readSectionHeader]((uint64_t)v7);
        BOOL v12 = v7[4] != 0;
      }
      else
      {
        BOOL v12 = 0;
      }
      v13 = -[GEOPDAllGuidesLocationsSection sectionHeader](v7);
      int v14 = -[GEOPDAllGuidesLocationsSectionHeader sectionHeaderType]((uint64_t)v13);

      if (!v12 || !v14)
      {

        v15 = 0;
        goto LABEL_11;
      }
    }
    objc_storeStrong((id *)&v9->_section, a3);
    objc_storeStrong((id *)&v9->_mapsResults, a4);
  }
  v15 = v9;
LABEL_11:

  return v15;
}

- (NSString)sectionTitle
{
  v3 = -[GEOPDAllGuidesLocationsSection entrys]((id *)&self->_section->super.super.isa);
  v4 = [v3 firstObject];

  if (v4)
  {
    -[GEOPDGuidesLocationEntry _readWorldwide]((uint64_t)v4);
    if (v4[9]) {
      goto LABEL_6;
    }
  }
  v5 = -[GEOPDAllGuidesLocationsSection sectionHeader]((id *)&self->_section->super.super.isa);
  int v6 = -[GEOPDAllGuidesLocationsSectionHeader sectionHeaderType]((uint64_t)v5);

  if (v6 != 2)
  {
    if (v6 == 1)
    {
      -[GEOPDAllGuidesLocationsSection sectionHeader]((id *)&self->_section->super.super.isa);
      v7 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = -[GEOPDAllGuidesLocationsSectionHeader headerString](v7);
      goto LABEL_9;
    }
LABEL_6:
    v9 = 0;
    goto LABEL_12;
  }
  if (!self->_place)
  {
    v7 = [(GEOAllGuidesLocationsSection *)self placeResultForSection:self->_section mapsResults:self->_mapsResults];
    v10 = [v7 place];
    place = self->_place;
    self->_place = v10;

    BOOL v12 = +[GEOPDEntity entityForPlaceData:self->_place];
    v9 = [v12 bestLocalizedString];

    goto LABEL_11;
  }
  +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:");
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 bestLocalizedString];
LABEL_9:
  v9 = (void *)v8;
LABEL_11:

LABEL_12:

  return (NSString *)v9;
}

- (NSArray)guideLocationIdentifiers
{
  v2 = -[GEOPDAllGuidesLocationsSection entrys]((id *)&self->_section->super.super.isa);
  v3 = objc_msgSend(v2, "_geo_compactMap:", &__block_literal_global_89);

  return (NSArray *)v3;
}

GEOMapItemIdentifier *__56__GEOAllGuidesLocationsSection_guideLocationIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  v3 = [GEOMapItemIdentifier alloc];
  v4 = -[GEOPDGuidesLocationEntry placeId](v2);

  v5 = [(GEOMapItemIdentifier *)v3 initWithMapsIdentifier:v4];

  return v5;
}

- (NSDictionary)pdGuideLocationEntries
{
  if ([(GEOAllGuidesLocationsSection *)self isWorldwideSection])
  {
    v3 = 0;
  }
  else
  {
    entriesDictionary = self->_entriesDictionary;
    if (entriesDictionary)
    {
      v3 = entriesDictionary;
    }
    else
    {
      id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
      int v6 = -[GEOPDAllGuidesLocationsSection entrys]((id *)&self->_section->super.super.isa);
      v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

      uint64_t v8 = -[GEOPDAllGuidesLocationsSection entrys]((id *)&self->_section->super.super.isa);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __54__GEOAllGuidesLocationsSection_pdGuideLocationEntries__block_invoke;
      v13[3] = &unk_1E53D7880;
      id v14 = v7;
      id v9 = v7;
      [v8 enumerateObjectsUsingBlock:v13];

      v10 = (NSDictionary *)[v9 copy];
      v11 = self->_entriesDictionary;
      self->_entriesDictionary = v10;

      v3 = self->_entriesDictionary;
    }
  }

  return v3;
}

void __54__GEOAllGuidesLocationsSection_pdGuideLocationEntries__block_invoke(uint64_t a1, void *a2)
{
  int v6 = a2;
  v3 = [GEOMapItemIdentifier alloc];
  v4 = -[GEOPDGuidesLocationEntry placeId](v6);
  id v5 = [(GEOMapItemIdentifier *)v3 initWithMapsIdentifier:v4];

  if (v5) {
    [*(id *)(a1 + 32) setObject:v6 forKey:v5];
  }
}

- (NSArray)guideLocations
{
  v3 = -[GEOPDAllGuidesLocationsSection entrys]((id *)&self->_section->super.super.isa);
  v4 = +[GEOGuideLocation guideLocationsForEntries:v3 mapsResults:self->_mapsResults];

  return (NSArray *)v4;
}

- (id)placeResultForSection:(id)a3 mapsResults:(id)a4
{
  id v5 = (id *)a3;
  id v6 = a4;
  v7 = -[GEOPDAllGuidesLocationsSection sectionHeader](v5);
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  objc_super v17 = __Block_byref_object_copy__44;
  v18 = __Block_byref_object_dispose__44;
  id v19 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__GEOAllGuidesLocationsSection_placeResultForSection_mapsResults___block_invoke;
  v11[3] = &unk_1E53DEB30;
  id v8 = v7;
  id v12 = v8;
  v13 = &v14;
  [v6 enumerateObjectsUsingBlock:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v9;
}

void __66__GEOAllGuidesLocationsSection_placeResultForSection_mapsResults___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  if ([v15 resultType] == 1)
  {
    if ([v15 hasPlace])
    {
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7)
      {
        -[GEOPDAllGuidesLocationsSectionHeader _readPlaceId](*(void *)(a1 + 32));
        if (*(void *)(v7 + 32))
        {
          id v8 = [GEOMapItemIdentifier alloc];
          id v9 = [v15 place];
          v10 = [v9 mapsId];
          v11 = [(GEOMapItemIdentifier *)v8 initWithMapsIdentifier:v10];

          id v12 = [GEOMapItemIdentifier alloc];
          v13 = -[GEOPDAllGuidesLocationsSectionHeader placeId](*(id **)(a1 + 32));
          uint64_t v14 = [(GEOMapItemIdentifier *)v12 initWithMapsIdentifier:v13];

          if ([(GEOMapItemIdentifier *)v11 isEqualToGEOMapItemIdentifier:v14])
          {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
            *a4 = 1;
          }
        }
      }
    }
  }
}

- (BOOL)isWorldwideSection
{
  return self->_isWorldwideSection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_entriesDictionary, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_mapsResults, 0);

  objc_storeStrong((id *)&self->_section, 0);
}

@end