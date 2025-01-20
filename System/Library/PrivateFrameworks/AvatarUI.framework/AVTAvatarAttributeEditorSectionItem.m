@interface AVTAvatarAttributeEditorSectionItem
- (AVTAvatarAttributeEditorSectionItem)initWithIdentifier:(id)a3 localizedName:(id)a4 thumbnailProvider:(id)a5 stickerResourceProvider:(id)a6 presetResourcesProvider:(id)a7 avatarUpdater:(id)a8 heightRatio:(double)a9 selected:(BOOL)a10;
- (BOOL)isSelected;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedName;
- (NSString)prefetchingIdentifier;
- (UIImage)cachedThumbnail;
- (double)heightRatio;
- (id)avatarUpdater;
- (id)discardableContentHandler;
- (id)presetResourcesProvider;
- (id)stickerResourceProvider;
- (id)thumbnailProvider;
- (void)discardContent;
- (void)setCachedThumbnail:(id)a3;
- (void)setDiscardableContentHandler:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation AVTAvatarAttributeEditorSectionItem

- (AVTAvatarAttributeEditorSectionItem)initWithIdentifier:(id)a3 localizedName:(id)a4 thumbnailProvider:(id)a5 stickerResourceProvider:(id)a6 presetResourcesProvider:(id)a7 avatarUpdater:(id)a8 heightRatio:(double)a9 selected:(BOOL)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  v37.receiver = self;
  v37.super_class = (Class)AVTAvatarAttributeEditorSectionItem;
  v23 = [(AVTAvatarAttributeEditorSectionItem *)&v37 init];
  if (v23)
  {
    uint64_t v24 = [v17 copy];
    identifier = v23->_identifier;
    v23->_identifier = (NSString *)v24;

    uint64_t v26 = [v18 copy];
    localizedName = v23->_localizedName;
    v23->_localizedName = (NSString *)v26;

    uint64_t v28 = [v19 copy];
    id thumbnailProvider = v23->_thumbnailProvider;
    v23->_id thumbnailProvider = (id)v28;

    uint64_t v30 = [v20 copy];
    id stickerResourceProvider = v23->_stickerResourceProvider;
    v23->_id stickerResourceProvider = (id)v30;

    uint64_t v32 = [v21 copy];
    id presetResourcesProvider = v23->_presetResourcesProvider;
    v23->_id presetResourcesProvider = (id)v32;

    uint64_t v34 = [v22 copy];
    id avatarUpdater = v23->_avatarUpdater;
    v23->_id avatarUpdater = (id)v34;

    v23->_heightRatio = a9;
    v23->_selected = a10;
  }

  return v23;
}

- (NSString)prefetchingIdentifier
{
  v2 = [(AVTAvatarAttributeEditorSectionItem *)self identifier];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarAttributeEditorSectionItem;
  v3 = [(AVTAvatarAttributeEditorSectionItem *)&v9 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(AVTAvatarAttributeEditorSectionItem *)self identifier];
  v6 = [(AVTAvatarAttributeEditorSectionItem *)self localizedName];
  [v4 appendFormat:@" identifier: %@ name: %@", v5, v6];

  if ([(AVTAvatarAttributeEditorSectionItem *)self isSelected]) {
    [v4 appendString:@" SELECTED"];
  }
  v7 = (void *)[v4 copy];

  return (NSString *)v7;
}

- (void)discardContent
{
  [(AVTAvatarAttributeEditorSectionItem *)self setCachedThumbnail:0];
  v3 = [(AVTAvatarAttributeEditorSectionItem *)self discardableContentHandler];

  if (v3)
  {
    v4 = [(AVTAvatarAttributeEditorSectionItem *)self discardableContentHandler];
    v4[2](v4, self);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (id)avatarUpdater
{
  return self->_avatarUpdater;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (id)thumbnailProvider
{
  return self->_thumbnailProvider;
}

- (id)presetResourcesProvider
{
  return self->_presetResourcesProvider;
}

- (id)stickerResourceProvider
{
  return self->_stickerResourceProvider;
}

- (id)discardableContentHandler
{
  return self->discardableContentHandler;
}

- (void)setDiscardableContentHandler:(id)a3
{
}

- (UIImage)cachedThumbnail
{
  return self->_cachedThumbnail;
}

- (void)setCachedThumbnail:(id)a3
{
}

- (double)heightRatio
{
  return self->_heightRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedThumbnail, 0);
  objc_storeStrong(&self->discardableContentHandler, 0);
  objc_storeStrong(&self->_stickerResourceProvider, 0);
  objc_storeStrong(&self->_presetResourcesProvider, 0);
  objc_storeStrong(&self->_thumbnailProvider, 0);
  objc_storeStrong(&self->_avatarUpdater, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end