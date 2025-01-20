@interface GEOEnrichmentData
- (BOOL)isEqual:(id)a3;
- (GEOEnrichmentData)initWithEnrichmentData:(id)a3;
- (NSArray)enrichmentEntities;
- (NSData)placecardEnrichmentMetadata;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation GEOEnrichmentData

- (GEOEnrichmentData)initWithEnrichmentData:(id)a3
{
  v5 = (id *)a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOEnrichmentData;
  v6 = [(GEOEnrichmentData *)&v19 init];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v8 = -[GEOPDEnrichmentData entitys](v5);
    v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

    v10 = -[GEOPDEnrichmentData entitys](v5);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __44__GEOEnrichmentData_initWithEnrichmentData___block_invoke;
    v17[3] = &unk_1E53E2000;
    id v18 = v9;
    id v11 = v9;
    [v10 enumerateObjectsUsingBlock:v17];

    objc_storeStrong((id *)&v6->_enrichmentData, a3);
    uint64_t v12 = [v11 copy];
    enrichmentEntities = v6->_enrichmentEntities;
    v6->_enrichmentEntities = (NSArray *)v12;

    uint64_t v14 = -[GEOPDEnrichmentData placecardEnrichmentMetadata](v5);
    placecardEnrichmentMetadata = v6->_placecardEnrichmentMetadata;
    v6->_placecardEnrichmentMetadata = (NSData *)v14;
  }
  return v6;
}

void __44__GEOEnrichmentData_initWithEnrichmentData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5 = [[GEOEnrichmentDataEntity alloc] initWithEnrichmentDataEntity:v3];

  v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    v4 = v5;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (GEOEnrichmentData *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(GEOPDEnrichmentData *)self->_enrichmentData isEqual:v5->_enrichmentData];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  BOOL v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(NSArray *)v6->_enrichmentEntities copyWithZone:a3];
  v8 = (void *)v5[2];
  v5[2] = v7;

  uint64_t v9 = [(NSData *)v6->_placecardEnrichmentMetadata copyWithZone:a3];
  v10 = (void *)v5[3];
  v5[3] = v9;

  objc_sync_exit(v6);
  return v5;
}

- (NSArray)enrichmentEntities
{
  return self->_enrichmentEntities;
}

- (NSData)placecardEnrichmentMetadata
{
  return self->_placecardEnrichmentMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placecardEnrichmentMetadata, 0);
  objc_storeStrong((id *)&self->_enrichmentEntities, 0);

  objc_storeStrong((id *)&self->_enrichmentData, 0);
}

@end