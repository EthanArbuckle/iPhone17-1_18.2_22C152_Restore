@interface GEOGuidesHomeRepeatableSection
- (GEOGuidesHomeRepeatableSection)initWithGuidesHomeRepeatableSection:(id)a3 mapsResults:(id)a4;
- (NSArray)curatedGuides;
- (NSArray)guideLocations;
- (NSArray)publishers;
- (NSString)title;
- (int64_t)contentType;
- (int64_t)sectionType;
@end

@implementation GEOGuidesHomeRepeatableSection

- (GEOGuidesHomeRepeatableSection)initWithGuidesHomeRepeatableSection:(id)a3 mapsResults:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOGuidesHomeRepeatableSection;
  v9 = [(GEOGuidesHomeRepeatableSection *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pdRepeatableSection, a3);
    objc_storeStrong((id *)&v10->_mapsResults, a4);
  }

  return v10;
}

- (NSArray)guideLocations
{
  v3 = -[GEOPDGuidesHomeRepeatableSection guidesLocationEntrys]((id *)&self->_pdRepeatableSection->super.super.isa);
  v4 = +[GEOGuideLocation guideLocationsForEntries:v3 mapsResults:self->_mapsResults];

  return (NSArray *)v4;
}

- (NSArray)curatedGuides
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = (void *)MEMORY[0x1E4F1CA48];
  v5 = -[GEOPDGuidesHomeRepeatableSection carouselGuideIds]((id *)&self->_pdRepeatableSection->super.super.isa);
  v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

  mapsResults = self->_mapsResults;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__GEOGuidesHomeRepeatableSection_curatedGuides__block_invoke;
  v17[3] = &unk_1E53D78A8;
  id v8 = v3;
  id v18 = v8;
  [(NSArray *)mapsResults enumerateObjectsUsingBlock:v17];
  v9 = -[GEOPDGuidesHomeRepeatableSection carouselGuideIds]((id *)&self->_pdRepeatableSection->super.super.isa);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__GEOGuidesHomeRepeatableSection_curatedGuides__block_invoke_2;
  v14[3] = &unk_1E53F63E0;
  id v15 = v8;
  id v16 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 enumerateObjectsUsingBlock:v14];

  objc_super v12 = (void *)[v10 copy];

  return (NSArray *)v12;
}

void __47__GEOGuidesHomeRepeatableSection_curatedGuides__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9 resultType] == 2 && objc_msgSend(v9, "hasCollection"))
  {
    id v3 = [GEOMapItemIdentifier alloc];
    v4 = [v9 collection];
    v5 = -[GEOPDCollectionResult collectionId](v4);
    v6 = [(GEOMapItemIdentifier *)v3 initWithMapsIdentifier:v5];

    id v7 = *(void **)(a1 + 32);
    id v8 = [v9 collection];
    [v7 setObject:v8 forKey:v6];
  }
}

void __47__GEOGuidesHomeRepeatableSection_curatedGuides__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6 = [[GEOMapItemIdentifier alloc] initWithMapsIdentifier:v3];

  v4 = [*(id *)(a1 + 32) objectForKey:v6];
  v5 = [[GEOCollectionResult alloc] initWithCollectionResult:v4];
  if (v5) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (NSArray)publishers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = (void *)MEMORY[0x1E4F1CA48];
  v5 = -[GEOPDGuidesHomeRepeatableSection publisherIds]((id *)&self->_pdRepeatableSection->super.super.isa);
  v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

  mapsResults = self->_mapsResults;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __44__GEOGuidesHomeRepeatableSection_publishers__block_invoke;
  v17[3] = &unk_1E53D78A8;
  id v8 = v3;
  id v18 = v8;
  [(NSArray *)mapsResults enumerateObjectsUsingBlock:v17];
  id v9 = -[GEOPDGuidesHomeRepeatableSection publisherIds]((id *)&self->_pdRepeatableSection->super.super.isa);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__GEOGuidesHomeRepeatableSection_publishers__block_invoke_2;
  v14[3] = &unk_1E53F63E0;
  id v15 = v8;
  id v16 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 enumerateObjectsUsingBlock:v14];

  objc_super v12 = (void *)[v10 copy];

  return (NSArray *)v12;
}

void __44__GEOGuidesHomeRepeatableSection_publishers__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9 resultType] == 3 && objc_msgSend(v9, "hasPublisher"))
  {
    id v3 = [GEOMapItemIdentifier alloc];
    v4 = [v9 publisher];
    v5 = -[GEOPDPublisherResult publisherId](v4);
    v6 = [(GEOMapItemIdentifier *)v3 initWithMapsIdentifier:v5];

    id v7 = *(void **)(a1 + 32);
    id v8 = [v9 publisher];
    [v7 setObject:v8 forKey:v6];
  }
}

void __44__GEOGuidesHomeRepeatableSection_publishers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6 = [[GEOMapItemIdentifier alloc] initWithMapsIdentifier:v3];

  v4 = [*(id *)(a1 + 32) objectForKey:v6];
  v5 = [[GEOPublisherResult alloc] initWithPublisherResult:v4];
  if (v5) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (int64_t)sectionType
{
  unsigned int v2 = -[GEOPDGuidesHomeRepeatableSection sectionType]((uint64_t)self->_pdRepeatableSection) - 1;
  if (v2 > 3) {
    return 0;
  }
  else {
    return qword_18A640EC0[v2];
  }
}

- (int64_t)contentType
{
  int v2 = -[GEOPDGuidesHomeRepeatableSection contentType]((uint64_t)self->_pdRepeatableSection);
  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (NSString)title
{
  return -[GEOPDGuidesHomeRepeatableSection name]((id *)&self->_pdRepeatableSection->super.super.isa);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsResults, 0);

  objc_storeStrong((id *)&self->_pdRepeatableSection, 0);
}

@end