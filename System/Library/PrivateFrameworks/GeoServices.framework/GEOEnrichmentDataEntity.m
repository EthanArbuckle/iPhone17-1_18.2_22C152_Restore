@interface GEOEnrichmentDataEntity
- (BOOL)isEqual:(id)a3;
- (GEOEnrichmentDataEntity)initWithEnrichmentDataEntity:(id)a3;
- (GEOEnrichmentInfo)enrichmentInfo;
- (NSArray)appAdamIds;
- (NSData)enrichmentMetadata;
- (NSString)enrichmentHtml;
- (id)description;
- (unint64_t)hash;
@end

@implementation GEOEnrichmentDataEntity

- (GEOEnrichmentDataEntity)initWithEnrichmentDataEntity:(id)a3
{
  v5 = (id *)a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOEnrichmentDataEntity;
  v6 = [(GEOEnrichmentDataEntity *)&v19 init];
  if (v6)
  {
    v7 = [GEOEnrichmentInfo alloc];
    v8 = -[GEOPDEnrichmentDataEntity enrichmentInfo](v5);
    uint64_t v9 = [(GEOEnrichmentInfo *)v7 initWithEnrichmentInfo:v8];
    enrichmentInfo = v6->_enrichmentInfo;
    v6->_enrichmentInfo = (GEOEnrichmentInfo *)v9;

    uint64_t v11 = -[GEOPDEnrichmentDataEntity html](v5);
    enrichmentHtml = v6->_enrichmentHtml;
    v6->_enrichmentHtml = (NSString *)v11;

    uint64_t v13 = -[GEOPDEnrichmentDataEntity enrichmentMetadata](v5);
    enrichmentMetadata = v6->_enrichmentMetadata;
    v6->_enrichmentMetadata = (NSData *)v13;

    objc_storeStrong((id *)&v6->_enrichmentDataEntity, a3);
    v15 = -[GEOPDEnrichmentDataEntity adamIds](v5);
    uint64_t v16 = [v15 copy];
    appAdamIds = v6->_appAdamIds;
    v6->_appAdamIds = (NSArray *)v16;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (GEOEnrichmentDataEntity *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(GEOPDEnrichmentDataEntity *)self->_enrichmentDataEntity isEqual:v5->_enrichmentDataEntity];

  return v6;
}

- (unint64_t)hash
{
  return [(GEOPDEnrichmentDataEntity *)self->_enrichmentDataEntity hash];
}

- (id)description
{
  v3 = NSString;
  v4 = [(GEOEnrichmentInfo *)self->_enrichmentInfo showcaseId];
  v5 = [(NSArray *)self->_appAdamIds description];
  BOOL v6 = [v3 stringWithFormat:@"Showcase Id: %@, App Adam IDs: %@", v4, v5];

  return v6;
}

- (GEOEnrichmentInfo)enrichmentInfo
{
  return self->_enrichmentInfo;
}

- (NSString)enrichmentHtml
{
  return self->_enrichmentHtml;
}

- (NSData)enrichmentMetadata
{
  return self->_enrichmentMetadata;
}

- (NSArray)appAdamIds
{
  return self->_appAdamIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appAdamIds, 0);
  objc_storeStrong((id *)&self->_enrichmentMetadata, 0);
  objc_storeStrong((id *)&self->_enrichmentHtml, 0);
  objc_storeStrong((id *)&self->_enrichmentInfo, 0);

  objc_storeStrong((id *)&self->_enrichmentDataEntity, 0);
}

@end