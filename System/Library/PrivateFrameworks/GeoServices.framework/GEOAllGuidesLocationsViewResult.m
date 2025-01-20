@interface GEOAllGuidesLocationsViewResult
- (GEOAllGuidesLocationsViewResult)initWithAllGuidesLocationsViewResult:(id)a3 mapsResults:(id)a4;
- (NSArray)sections;
- (NSString)title;
@end

@implementation GEOAllGuidesLocationsViewResult

- (GEOAllGuidesLocationsViewResult)initWithAllGuidesLocationsViewResult:(id)a3 mapsResults:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOAllGuidesLocationsViewResult;
  v9 = [(GEOAllGuidesLocationsViewResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapsResults, a4);
    objc_storeStrong((id *)&v10->_viewResult, a3);
  }

  return v10;
}

- (NSString)title
{
  return -[GEOPDAllGuidesLocationsViewResult header]((id *)&self->_viewResult->super.super.isa);
}

- (NSArray)sections
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = -[GEOPDAllGuidesLocationsViewResult allGuidesLocationsSections]((id *)&self->_viewResult->super.super.isa);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __43__GEOAllGuidesLocationsViewResult_sections__block_invoke;
  v11 = &unk_1E53E2048;
  objc_super v12 = self;
  id v13 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:&v8];

  v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

void __43__GEOAllGuidesLocationsViewResult_sections__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[GEOAllGuidesLocationsSection alloc] initWithAllGuidesLocationSection:v3 mapsResults:*(void *)(*(void *)(a1 + 32) + 16)];

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

  objc_storeStrong((id *)&self->_viewResult, 0);
}

@end