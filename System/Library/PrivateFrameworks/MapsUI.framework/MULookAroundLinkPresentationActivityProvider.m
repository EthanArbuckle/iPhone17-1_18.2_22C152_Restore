@interface MULookAroundLinkPresentationActivityProvider
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)mapMetadataSpecialization;
@end

@implementation MULookAroundLinkPresentationActivityProvider

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  cachedMetadata = self->_cachedMetadata;
  if (!cachedMetadata)
  {
    v5 = [(MUPlaceActivityProvider *)self activityURL];
    metadataWithURL(v5);
    v6 = (LPLinkMetadata *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedMetadata;
    self->_cachedMetadata = v6;

    v8 = [(MULookAroundLinkPresentationActivityProvider *)self mapMetadataSpecialization];
    [(LPLinkMetadata *)self->_cachedMetadata setSpecialization:v8];

    cachedMetadata = self->_cachedMetadata;
  }
  return cachedMetadata;
}

- (id)mapMetadataSpecialization
{
  v13.receiver = self;
  v13.super_class = (Class)MULookAroundLinkPresentationActivityProvider;
  v3 = [(MUPlaceActivityProvider *)&v13 mapMetadataSpecialization];
  id v4 = objc_alloc(MEMORY[0x1E4F31118]);
  v5 = [(MUPlaceActivityProvider *)self activityURL];
  v6 = (void *)[v4 initWithURL:v5];

  [v6 parseIncludingCustomParameters:1];
  if ([v6 mapType] == 107)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F30F40]);
    objc_msgSend(v7, "setSize:", 300.0, 300.0);
    objc_msgSend(v7, "setMapType:", objc_msgSend(v6, "mapType"));
    v8 = [v6 mapCamera];
    [v7 setCamera:v8];

    objc_msgSend(v7, "setSize:", 300.0, 300.0);
    [v7 _setShowsPointLabels:0];
    [v7 _setShowsAppleLogo:0];
    v9 = createMapSnapshotImage(v7, 1);
    [v3 setImage:v9];

    v10 = createMapSnapshotImage(v7, 0);
    [v3 setDarkImage:v10];

    id v11 = v3;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
}

@end