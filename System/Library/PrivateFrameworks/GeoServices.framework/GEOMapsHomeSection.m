@interface GEOMapsHomeSection
- (GEOCollectionSuggestionResult)collectionSuggestionResult;
- (GEOMapsHomeSection)initWithMapsHomeSection:(id)a3 mapsResults:(id)a4;
- (NSString)name;
- (int64_t)sectionType;
@end

@implementation GEOMapsHomeSection

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (GEOCollectionSuggestionResult)collectionSuggestionResult
{
  return self->_collectionSuggestionResult;
}

- (NSString)name
{
  return self->_name;
}

void __58__GEOMapsHomeSection_initWithMapsHomeSection_mapsResults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 resultType] == 2 && objc_msgSend(v3, "hasCollection")) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (GEOMapsHomeSection)initWithMapsHomeSection:(id)a3 mapsResults:(id)a4
{
  v6 = (id *)a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)GEOMapsHomeSection;
  v8 = [(GEOMapsHomeSection *)&v23 init];
  if (v8)
  {
    v9 = -[GEOPDMapsHomeSection name](v6);
    uint64_t v10 = [v9 copy];
    name = v8->_name;
    v8->_name = (NSString *)v10;

    int v12 = -[GEOPDMapsHomeSection sectionType]((uint64_t)v6);
    if (v12 == 1)
    {
      v8->_sectionType = 1;
      v13 = [MEMORY[0x1E4F1CA48] array];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __58__GEOMapsHomeSection_initWithMapsHomeSection_mapsResults___block_invoke;
      v21[3] = &unk_1E53D78A8;
      id v14 = v13;
      id v22 = v14;
      [v7 enumerateObjectsUsingBlock:v21];
      if (v6)
      {
        -[GEOPDMapsHomeSection _readCollectionSuggestionResult]((uint64_t)v6);
        if (v6[3])
        {
          v15 = [GEOCollectionSuggestionResult alloc];
          v16 = -[GEOPDMapsHomeSection collectionSuggestionResult](v6);
          v17 = (void *)[v14 copy];
          uint64_t v18 = [(GEOCollectionSuggestionResult *)v15 initWithCollectionSuggestionResult:v16 mapsResults:v17];
          collectionSuggestionResult = v8->_collectionSuggestionResult;
          v8->_collectionSuggestionResult = (GEOCollectionSuggestionResult *)v18;
        }
      }
    }
    else if (!v12)
    {
      v8->_sectionType = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionSuggestionResult, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end