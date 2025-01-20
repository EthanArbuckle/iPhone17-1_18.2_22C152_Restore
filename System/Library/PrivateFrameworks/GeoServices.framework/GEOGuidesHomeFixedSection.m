@interface GEOGuidesHomeFixedSection
- (GEOGuidesHomeFixedSection)initWithGuidesHomeFixedSection:(id)a3 mapsResults:(id)a4;
- (NSArray)featuredGuides;
- (NSArray)filteredGuideIds;
- (NSArray)filteredGuides;
- (NSArray)filters;
- (NSString)title;
- (id)guideResultsFromMapResults;
- (int64_t)sectionType;
@end

@implementation GEOGuidesHomeFixedSection

- (GEOGuidesHomeFixedSection)initWithGuidesHomeFixedSection:(id)a3 mapsResults:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOGuidesHomeFixedSection;
  v9 = [(GEOGuidesHomeFixedSection *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pdFixedSection, a3);
    objc_storeStrong((id *)&v10->_mapsResults, a4);
  }

  return v10;
}

- (int64_t)sectionType
{
  uint64_t v2 = -[GEOPDGuidesHomeFixedSection sectionType]((uint64_t)self->_pdFixedSection) - 1;
  if (v2 < 3) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

- (NSString)title
{
  return -[GEOPDGuidesHomeFixedSection name]((id *)&self->_pdFixedSection->super.super.isa);
}

- (NSArray)featuredGuides
{
  if ([(GEOGuidesHomeFixedSection *)self sectionType] == 1)
  {
    mapsResults = self->_mapsResults;
    v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_167];
    v5 = [(NSArray *)mapsResults filteredArrayUsingPredicate:v4];

    v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    id v7 = [GEOMapItemIdentifier alloc];
    id v8 = -[GEOPDGuidesHomeFixedSection featuredGuideIds]((id *)&self->_pdFixedSection->super.super.isa);
    v9 = [v8 firstObject];
    v10 = [(GEOMapItemIdentifier *)v7 initWithMapsIdentifier:v9];

    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __43__GEOGuidesHomeFixedSection_featuredGuides__block_invoke_2;
    v18 = &unk_1E53DE640;
    v19 = v10;
    id v20 = v6;
    id v11 = v6;
    objc_super v12 = v10;
    [v5 enumerateObjectsUsingBlock:&v15];
    v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: self.sectionType == GEOPDGuidesHomeFixedSectionType_GUIDES_HOME_FIXED_SECTION_TYPE_FEATURED_GUIDES", buf, 2u);
    }
    v13 = 0;
  }

  return (NSArray *)v13;
}

uint64_t __43__GEOGuidesHomeFixedSection_featuredGuides__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 resultType] == 2) {
    uint64_t v3 = [v2 hasCollection];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __43__GEOGuidesHomeFixedSection_featuredGuides__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  v6 = [GEOMapItemIdentifier alloc];
  id v7 = [v13 collection];
  id v8 = -[GEOPDCollectionResult collectionId](v7);
  v9 = [(GEOMapItemIdentifier *)v6 initWithMapsIdentifier:v8];

  if ([*(id *)(a1 + 32) isEqualToGEOMapItemIdentifier:v9])
  {
    v10 = [GEOCollectionResult alloc];
    id v11 = [v13 collection];
    objc_super v12 = [(GEOCollectionResult *)v10 initWithCollectionResult:v11];

    if (v12)
    {
      [*(id *)(a1 + 40) addObject:v12];
      *a4 = 1;
    }
  }
}

- (NSArray)filters
{
  if ([(GEOGuidesHomeFixedSection *)self sectionType] == 2)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
    v4 = -[GEOPDGuidesHomeFixedSection browseByInterestFilters]((id *)&self->_pdFixedSection->super.super.isa);
    v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

    v6 = -[GEOPDGuidesHomeFixedSection browseByInterestFilters]((id *)&self->_pdFixedSection->super.super.isa);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__GEOGuidesHomeFixedSection_filters__block_invoke;
    v10[3] = &unk_1E53EBA78;
    id v11 = v5;
    id v7 = v5;
    [v6 enumerateObjectsUsingBlock:v10];

    id v8 = (void *)[v7 copy];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: self.sectionType == GEOPDGuidesHomeFixedSectionType_GUIDES_HOME_FIXED_SECTION_TYPE_FILTERS", buf, 2u);
    }
    id v8 = 0;
  }

  return (NSArray *)v8;
}

void __36__GEOGuidesHomeFixedSection_filters__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5 = [[GEOGuidesHomeResultFilter alloc] initWithGuidesHomeResultFilter:v3];

  v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    v4 = v5;
  }
}

- (NSArray)filteredGuides
{
  if ([(GEOGuidesHomeFixedSection *)self sectionType] == 3)
  {
    id v3 = [(GEOGuidesHomeFixedSection *)self guideResultsFromMapResults];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: self.sectionType == GEOPDGuidesHomeFixedSectionType_GUIDES_HOME_FIXED_SECTION_TYPE_FILTERED_GUIDES", v5, 2u);
    }
    id v3 = 0;
  }

  return (NSArray *)v3;
}

- (NSArray)filteredGuideIds
{
  if ([(GEOGuidesHomeFixedSection *)self sectionType] != 3)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    __int16 v13 = 0;
    v9 = MEMORY[0x1E4F14500];
    v10 = "Assertion failed: self.sectionType == GEOPDGuidesHomeFixedSectionType_GUIDES_HOME_FIXED_SECTION_TYPE_FILTERED_GUIDES";
    id v11 = (uint8_t *)&v13;
LABEL_12:
    _os_log_fault_impl(&dword_188D96000, v9, OS_LOG_TYPE_FAULT, v10, v11, 2u);
    goto LABEL_10;
  }
  id v3 = -[GEOPDGuidesHomeFixedSection filteredGuideIds]((id *)&self->_pdFixedSection->super.super.isa);
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = -[GEOPDGuidesHomeFixedSection filteredGuideIds]((id *)&self->_pdFixedSection->super.super.isa);
    v6 = +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:v5];
    id v7 = (void *)[v6 copy];

    goto LABEL_4;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    __int16 v12 = 0;
    v9 = MEMORY[0x1E4F14500];
    v10 = "Assertion failed: _pdFixedSection.filteredGuideIds.count > 0";
    id v11 = (uint8_t *)&v12;
    goto LABEL_12;
  }
LABEL_10:
  id v7 = 0;
LABEL_4:

  return (NSArray *)v7;
}

- (id)guideResultsFromMapResults
{
  mapsResults = self->_mapsResults;
  id v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_8_3];
  uint64_t v4 = [(NSArray *)mapsResults filteredArrayUsingPredicate:v3];

  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__GEOGuidesHomeFixedSection_guideResultsFromMapResults__block_invoke_2;
  v9[3] = &unk_1E53D78A8;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];
  id v7 = (void *)[v6 copy];

  return v7;
}

uint64_t __55__GEOGuidesHomeFixedSection_guideResultsFromMapResults__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 resultType] == 2) {
    uint64_t v3 = [v2 hasCollection];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __55__GEOGuidesHomeFixedSection_guideResultsFromMapResults__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [GEOCollectionResult alloc];
  v5 = [v3 collection];

  id v7 = [(GEOCollectionResult *)v4 initWithCollectionResult:v5];
  id v6 = v7;
  if (v7)
  {
    [*(id *)(a1 + 32) addObject:v7];
    id v6 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsResults, 0);

  objc_storeStrong((id *)&self->_pdFixedSection, 0);
}

@end