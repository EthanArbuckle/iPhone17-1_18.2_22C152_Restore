@interface LPiTunesMediaSoftwareUnresolvedMetadata
- (LPiTunesMediaAsset)icon;
- (LPiTunesMediaAsset)messagesAppIcon;
- (LPiTunesMediaAsset)previewVideo;
- (NSArray)screenshots;
- (NSNumber)hasMessagesExtension;
- (NSNumber)isHiddenFromSpringboard;
- (NSString)genre;
- (NSString)name;
- (NSString)platform;
- (NSString)storeFrontIdentifier;
- (NSString)storeIdentifier;
- (NSString)subtitle;
- (id)assetsToFetch;
- (id)resolve;
- (void)setGenre:(id)a3;
- (void)setHasMessagesExtension:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIsHiddenFromSpringboard:(id)a3;
- (void)setMessagesAppIcon:(id)a3;
- (void)setName:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setPreviewVideo:(id)a3;
- (void)setScreenshots:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation LPiTunesMediaSoftwareUnresolvedMetadata

- (id)resolve
{
  v3 = objc_alloc_init(LPiTunesMediaSoftwareMetadata);
  [(LPiTunesMediaSoftwareMetadata *)v3 setStoreFrontIdentifier:self->_storeFrontIdentifier];
  [(LPiTunesMediaSoftwareMetadata *)v3 setStoreIdentifier:self->_storeIdentifier];
  [(LPiTunesMediaSoftwareMetadata *)v3 setName:self->_name];
  [(LPiTunesMediaSoftwareMetadata *)v3 setSubtitle:self->_subtitle];
  [(LPiTunesMediaSoftwareMetadata *)v3 setGenre:self->_genre];
  [(LPiTunesMediaSoftwareMetadata *)v3 setPlatform:self->_platform];
  if ([(NSNumber *)self->_hasMessagesExtension BOOLValue]) {
    BOOL v4 = [(NSNumber *)self->_isHiddenFromSpringboard BOOLValue];
  }
  else {
    BOOL v4 = 0;
  }
  [(LPiTunesMediaSoftwareMetadata *)v3 setIsMessagesOnlyApp:v4];
  if (self->_screenshots) {
    [(LPiTunesMediaSoftwareMetadata *)v3 setScreenshots:MEMORY[0x1E4F1CBF0]];
  }

  return v3;
}

- (id)assetsToFetch
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", self->_icon, 0);
  BOOL v4 = v3;
  if (self->_messagesAppIcon) {
    objc_msgSend(v3, "addObject:");
  }
  if ([(NSArray *)self->_screenshots count])
  {
    v5 = [(NSArray *)self->_screenshots firstObject];
    [v4 addObject:v5];
  }
  if (self->_previewVideo) {
    objc_msgSend(v4, "addObject:");
  }

  return v4;
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreFrontIdentifier:(id)a3
{
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
}

- (NSString)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (NSNumber)isHiddenFromSpringboard
{
  return self->_isHiddenFromSpringboard;
}

- (void)setIsHiddenFromSpringboard:(id)a3
{
}

- (NSNumber)hasMessagesExtension
{
  return self->_hasMessagesExtension;
}

- (void)setHasMessagesExtension:(id)a3
{
}

- (LPiTunesMediaAsset)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (LPiTunesMediaAsset)messagesAppIcon
{
  return self->_messagesAppIcon;
}

- (void)setMessagesAppIcon:(id)a3
{
}

- (NSArray)screenshots
{
  return self->_screenshots;
}

- (void)setScreenshots:(id)a3
{
}

- (LPiTunesMediaAsset)previewVideo
{
  return self->_previewVideo;
}

- (void)setPreviewVideo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewVideo, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_messagesAppIcon, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_hasMessagesExtension, 0);
  objc_storeStrong((id *)&self->_isHiddenFromSpringboard, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end