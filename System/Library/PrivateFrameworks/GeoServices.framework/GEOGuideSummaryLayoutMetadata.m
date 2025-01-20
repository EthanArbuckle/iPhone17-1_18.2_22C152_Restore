@interface GEOGuideSummaryLayoutMetadata
- (BOOL)guideSummaryUsesRichLayout;
- (GEOGuideSummaryLayoutMetadata)initWithGuideSummaryLayoutMetadata:(id)a3;
@end

@implementation GEOGuideSummaryLayoutMetadata

- (GEOGuideSummaryLayoutMetadata)initWithGuideSummaryLayoutMetadata:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOGuideSummaryLayoutMetadata;
  v6 = [(GEOGuideSummaryLayoutMetadata *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_metadata, a3);
  }

  return v7;
}

- (BOOL)guideSummaryUsesRichLayout
{
  metadata = self->_metadata;
  return metadata && (*(unsigned char *)&metadata->_flags & 1) != 0 && metadata->_guideSummaryType == 1;
}

- (void).cxx_destruct
{
}

@end