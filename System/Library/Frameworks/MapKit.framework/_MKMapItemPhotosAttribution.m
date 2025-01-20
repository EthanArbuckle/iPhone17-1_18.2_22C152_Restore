@interface _MKMapItemPhotosAttribution
- (BOOL)isBusinessOwned;
- (BOOL)isUserSubmitted;
- (BOOL)requiresAttributionInPhotoViewerHeader;
- (BOOL)shouldAddPhotosLocally;
- (BOOL)shouldHandlePhotosLocally;
- (BOOL)shouldSuppressPhotoAttribution;
- (BOOL)supportsReportingIssue;
- (NSArray)addPhotoURLs;
- (_MKMapItemPhotosAttribution)initWithGEOMapItemAttribution:(id)a3;
- (id)urlsForPhotoWithIdentifier:(id)a3;
@end

@implementation _MKMapItemPhotosAttribution

- (_MKMapItemPhotosAttribution)initWithGEOMapItemAttribution:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MKMapItemPhotosAttribution;
  v6 = [(_MKMapItemAttribution *)&v10 initWithGEOMapItemAttribution:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_geoPhotosAttribution, a3);
    v8 = v7;
  }

  return v7;
}

- (NSArray)addPhotoURLs
{
  return (NSArray *)[(GEOMapItemPhotosAttribution *)self->_geoPhotosAttribution addPhotoURLs];
}

- (id)urlsForPhotoWithIdentifier:(id)a3
{
  return (id)[(GEOMapItemPhotosAttribution *)self->_geoPhotosAttribution urlsForPhotoWithIdentifier:a3];
}

- (BOOL)shouldSuppressPhotoAttribution
{
  return [(GEOMapItemPhotosAttribution *)self->_geoPhotosAttribution shouldSuppressPhotoAttribution];
}

- (BOOL)shouldHandlePhotosLocally
{
  return [(GEOMapItemPhotosAttribution *)self->_geoPhotosAttribution canShowPhotosLocally];
}

- (BOOL)shouldAddPhotosLocally
{
  return [(GEOMapItemPhotosAttribution *)self->_geoPhotosAttribution canAddPhotosLocally];
}

- (BOOL)supportsReportingIssue
{
  return [(GEOMapItemPhotosAttribution *)self->_geoPhotosAttribution supportsReportingIssue];
}

- (BOOL)isUserSubmitted
{
  v2 = [(_MKMapItemAttribution *)self providerID];
  v3 = GEOConfigGetString();
  char v4 = [v2 isEqualToString:v3];

  return v4;
}

- (BOOL)isBusinessOwned
{
  v2 = [(_MKMapItemAttribution *)self providerID];
  v3 = GEOConfigGetString();
  char v4 = [v2 isEqualToString:v3];

  return v4;
}

- (BOOL)requiresAttributionInPhotoViewerHeader
{
  return [(GEOMapItemPhotosAttribution *)self->_geoPhotosAttribution requiresAttributionInPhotoViewerHeader];
}

- (void).cxx_destruct
{
}

@end