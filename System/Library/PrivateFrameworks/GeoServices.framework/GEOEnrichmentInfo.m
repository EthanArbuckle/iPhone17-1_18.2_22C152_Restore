@interface GEOEnrichmentInfo
- (BOOL)isEqual:(id)a3;
- (GEOEnrichmentInfo)initWithEnrichmentInfo:(id)a3;
- (NSString)showcaseId;
- (NSString)showcaseSharingImageUrl;
- (NSString)showcaseSharingSubtitle;
- (NSString)showcaseSharingTitle;
- (NSString)sourceId;
- (NSString)sourceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)pdEnrichmentInfo;
@end

@implementation GEOEnrichmentInfo

- (GEOEnrichmentInfo)initWithEnrichmentInfo:(id)a3
{
  v5 = (id *)a3;
  v24.receiver = self;
  v24.super_class = (Class)GEOEnrichmentInfo;
  v6 = [(GEOEnrichmentInfo *)&v24 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_enrichmentInfo, a3);
    uint64_t v8 = -[GEOPDEnrichmentInfo sourceName](v5);
    sourceName = v7->_sourceName;
    v7->_sourceName = (NSString *)v8;

    uint64_t v10 = -[GEOPDEnrichmentInfo sourceId](v5);
    sourceId = v7->_sourceId;
    v7->_sourceId = (NSString *)v10;

    uint64_t v12 = -[GEOPDEnrichmentInfo showcaseId](v5);
    showcaseId = v7->_showcaseId;
    v7->_showcaseId = (NSString *)v12;

    v14 = -[GEOPDEnrichmentInfo poiNames](v5);
    uint64_t v15 = +[GEOLocalizedString bestStringForCurrentLocale:v14 fallbackToFirstAvailable:1];
    showcaseSharingTitle = v7->_showcaseSharingTitle;
    v7->_showcaseSharingTitle = (NSString *)v15;

    v17 = -[GEOPDEnrichmentInfo showcaseTitles](v5);
    uint64_t v18 = +[GEOLocalizedString bestStringForCurrentLocale:v17 fallbackToFirstAvailable:1];
    showcaseSharingSubtitle = v7->_showcaseSharingSubtitle;
    v7->_showcaseSharingSubtitle = (NSString *)v18;

    v20 = -[GEOPDEnrichmentInfo showcaseImageUrls](v5);
    uint64_t v21 = [v20 firstObject];
    showcaseSharingImageUrl = v7->_showcaseSharingImageUrl;
    v7->_showcaseSharingImageUrl = (NSString *)v21;
  }
  return v7;
}

- (id)pdEnrichmentInfo
{
  return self->_enrichmentInfo;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Showcase ID: %@, Source Name: %@, Source ID: %@, Title: %@, Subtitle: %@, ImageURL:%@", self->_showcaseId, self->_sourceName, self->_sourceId, self->_showcaseSharingTitle, self->_showcaseSharingSubtitle, self->_showcaseSharingImageUrl];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (GEOEnrichmentInfo *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = [(GEOEnrichmentInfo *)self showcaseId];
    uint64_t v8 = [(GEOEnrichmentInfo *)v6 showcaseId];
    if ([v7 isEqualToString:v8])
    {
      v9 = [(GEOEnrichmentInfo *)self sourceId];
      uint64_t v10 = [(GEOEnrichmentInfo *)v6 sourceId];
      if ([v9 isEqualToString:v10])
      {
        v11 = [(GEOEnrichmentInfo *)self sourceName];
        uint64_t v12 = [(GEOEnrichmentInfo *)v6 sourceName];
        char v13 = [v11 isEqualToString:v12];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOPDEnrichmentInfo *)self->_enrichmentInfo copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_sourceName copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_sourceId copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSString *)self->_showcaseId copyWithZone:a3];
  char v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSString *)self->_showcaseSharingTitle copyWithZone:a3];
  uint64_t v15 = (void *)v5[5];
  v5[5] = v14;

  uint64_t v16 = [(NSString *)self->_showcaseSharingSubtitle copyWithZone:a3];
  v17 = (void *)v5[6];
  v5[6] = v16;

  uint64_t v18 = [(NSString *)self->_showcaseSharingImageUrl copyWithZone:a3];
  v19 = (void *)v5[7];
  v5[7] = v18;

  return v5;
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (NSString)sourceId
{
  return self->_sourceId;
}

- (NSString)showcaseId
{
  return self->_showcaseId;
}

- (NSString)showcaseSharingTitle
{
  return self->_showcaseSharingTitle;
}

- (NSString)showcaseSharingSubtitle
{
  return self->_showcaseSharingSubtitle;
}

- (NSString)showcaseSharingImageUrl
{
  return self->_showcaseSharingImageUrl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showcaseSharingImageUrl, 0);
  objc_storeStrong((id *)&self->_showcaseSharingSubtitle, 0);
  objc_storeStrong((id *)&self->_showcaseSharingTitle, 0);
  objc_storeStrong((id *)&self->_showcaseId, 0);
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);

  objc_storeStrong((id *)&self->_enrichmentInfo, 0);
}

@end