@interface BMPhotosKnowledgeGraphEnrichmentStream
- (BMPhotosKnowledgeGraphEnrichmentStream)init;
- (id)identifier;
@end

@implementation BMPhotosKnowledgeGraphEnrichmentStream

- (id)identifier
{
  return (id)[MEMORY[0x1E4F4FBA8] libraryPathForStreamIdentifier:@"PhotosKnowledgeGraphEnrichment"];
}

- (BMPhotosKnowledgeGraphEnrichmentStream)init
{
  v3 = [(BMPhotosKnowledgeGraphEnrichmentStream *)self identifier];
  v4 = [(BMContentStream *)self initWithStreamIdentifier:v3 eventClass:objc_opt_class()];

  return v4;
}

@end