@interface MUPlaceLinkPresentationActivityProvider
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation MUPlaceLinkPresentationActivityProvider

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  cachedMetadata = self->_cachedMetadata;
  if (!cachedMetadata)
  {
    v5 = [(MUPlaceActivityProvider *)self activityURL];
    metadataWithURL(v5);
    v6 = (LPLinkMetadata *)objc_claimAutoreleasedReturnValue();

    v14.receiver = self;
    v14.super_class = (Class)MUPlaceLinkPresentationActivityProvider;
    v7 = [(MUPlaceActivityProvider *)&v14 mapMetadataSpecialization];
    v8 = [(MUPlaceActivityProvider *)self mapItem];
    v15[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

    v10 = annotatedSnapshotImageWithMapItems(v9, 1);
    [v7 setImage:v10];

    v11 = annotatedSnapshotImageWithMapItems(v9, 0);
    [v7 setDarkImage:v11];

    [(LPLinkMetadata *)v6 setSpecialization:v7];
    v12 = self->_cachedMetadata;
    self->_cachedMetadata = v6;

    cachedMetadata = self->_cachedMetadata;
  }
  return cachedMetadata;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return 0;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
}

@end