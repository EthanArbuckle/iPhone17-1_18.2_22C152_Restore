@interface GEOGuidesHomeResult
- (GEOGuidesHomeFixedSection)featuredGuidesSection;
- (GEOGuidesHomeFixedSection)filteredGuidesSection;
- (GEOGuidesHomeFixedSection)filtersSection;
- (GEOGuidesHomeResult)initWithGuidesHomeFixedSection:(id)a3 mapsResults:(id)a4;
- (NSArray)repeatableSections;
- (id)guideLocationName:(id)a3;
@end

@implementation GEOGuidesHomeResult

- (GEOGuidesHomeResult)initWithGuidesHomeFixedSection:(id)a3 mapsResults:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOGuidesHomeResult;
  v9 = [(GEOGuidesHomeResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pdGuideHomeResult, a3);
    objc_storeStrong((id *)&v10->_mapsResults, a4);
  }

  return v10;
}

- (id)guideLocationName:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  mapsResults = self->_mapsResults;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __41__GEOGuidesHomeResult_guideLocationName___block_invoke;
  v15[3] = &unk_1E53D78A8;
  id v8 = v6;
  id v16 = v8;
  [(NSArray *)mapsResults enumerateObjectsUsingBlock:v15];
  v9 = [v5 guideLocationIdentifier];

  v10 = [v8 objectForKey:v9];

  if (v10)
  {
    v11 = [v10 place];
    objc_super v12 = +[GEOPDEntity entityForPlaceData:v11];

    v13 = [v12 bestLocalizedString];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __41__GEOGuidesHomeResult_guideLocationName___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 resultType] == 1 && objc_msgSend(v7, "hasPlace"))
  {
    v3 = [GEOMapItemIdentifier alloc];
    v4 = [v7 place];
    id v5 = [v4 mapsId];
    id v6 = [(GEOMapItemIdentifier *)v3 initWithMapsIdentifier:v5];

    [*(id *)(a1 + 32) setObject:v7 forKey:v6];
  }
}

- (GEOGuidesHomeFixedSection)featuredGuidesSection
{
  pdGuideHomeResult = self->_pdGuideHomeResult;
  if (pdGuideHomeResult
    && (-[GEOPDGuidesHomeResult _readFeaturedGuides]((uint64_t)self->_pdGuideHomeResult),
        pdGuideHomeResult->_featuredGuides))
  {
    v4 = [GEOGuidesHomeFixedSection alloc];
    id v5 = -[GEOPDGuidesHomeResult featuredGuides]((id *)&self->_pdGuideHomeResult->super.super.isa);
    id v6 = [(GEOGuidesHomeFixedSection *)v4 initWithGuidesHomeFixedSection:v5 mapsResults:self->_mapsResults];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (GEOGuidesHomeFixedSection)filtersSection
{
  pdGuideHomeResult = self->_pdGuideHomeResult;
  if (pdGuideHomeResult
    && (-[GEOPDGuidesHomeResult _readFilters]((uint64_t)self->_pdGuideHomeResult), pdGuideHomeResult->_filters))
  {
    v4 = [GEOGuidesHomeFixedSection alloc];
    id v5 = -[GEOPDGuidesHomeResult filters]((id *)&self->_pdGuideHomeResult->super.super.isa);
    id v6 = [(GEOGuidesHomeFixedSection *)v4 initWithGuidesHomeFixedSection:v5 mapsResults:self->_mapsResults];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (GEOGuidesHomeFixedSection)filteredGuidesSection
{
  v3 = -[GEOPDGuidesHomeResult filteredGuides]((id *)&self->_pdGuideHomeResult->super.super.isa);

  if (v3)
  {
    v4 = [GEOGuidesHomeFixedSection alloc];
    id v5 = -[GEOPDGuidesHomeResult filteredGuides]((id *)&self->_pdGuideHomeResult->super.super.isa);
    id v6 = [(GEOGuidesHomeFixedSection *)v4 initWithGuidesHomeFixedSection:v5 mapsResults:self->_mapsResults];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSArray)repeatableSections
{
  v3 = -[GEOPDGuidesHomeResult repeatableSections]((id *)&self->_pdGuideHomeResult->super.super.isa);
  if ([v3 count])
  {
    v4 = -[GEOPDGuidesHomeResult repeatableSections]((id *)&self->_pdGuideHomeResult->super.super.isa);

    if (v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v6 = -[GEOPDGuidesHomeResult repeatableSections]((id *)&self->_pdGuideHomeResult->super.super.isa);
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      objc_super v12 = __41__GEOGuidesHomeResult_repeatableSections__block_invoke;
      v13 = &unk_1E53F72C8;
      v14 = self;
      id v15 = v5;
      id v7 = v5;
      [v6 enumerateObjectsUsingBlock:&v10];

      id v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v8 = 0;
LABEL_6:

  return (NSArray *)v8;
}

void __41__GEOGuidesHomeResult_repeatableSections__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[GEOGuidesHomeRepeatableSection alloc] initWithGuidesHomeRepeatableSection:v3 mapsResults:*(void *)(*(void *)(a1 + 32) + 16)];

  v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 40) addObject:v5];
    v4 = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsResults, 0);

  objc_storeStrong((id *)&self->_pdGuideHomeResult, 0);
}

@end