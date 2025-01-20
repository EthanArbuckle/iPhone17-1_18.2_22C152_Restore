@interface MPPlaceholderAVItem
+ (BOOL)isPlaceholder;
- (BOOL)isExplicitTrack;
- (BOOL)isLikedStateEnabled;
- (BOOL)isValidPlayerSubstituteForItem:(id)a3;
- (BOOL)supportsLikedState;
- (BOOL)supportsRateChange;
- (MPPlaceholderAVItem)init;
- (NSString)album;
- (NSString)artist;
- (NSString)mainTitle;
- (double)durationFromExternalMetadata;
- (id)artworkCatalogBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)storeItemInt64ID;
- (void)loadAssetAndPlayerItemWithTask:(id)a3 completion:(id)a4;
- (void)setAlbum:(id)a3;
- (void)setArtist:(id)a3;
- (void)setArtworkCatalogBlock:(id)a3;
- (void)setDurationFromExternalMetadata:(double)a3;
- (void)setExplicitTrack:(BOOL)a3;
- (void)setMainTitle:(id)a3;
- (void)setStoreItemInt64ID:(int64_t)a3;
- (void)setSupportsLikedState:(BOOL)a3;
@end

@implementation MPPlaceholderAVItem

- (MPPlaceholderAVItem)init
{
  v7.receiver = self;
  v7.super_class = (Class)MPPlaceholderAVItem;
  v2 = [(MPAVItem *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    uint64_t v4 = [v3 localizedStringForKey:@"LOADING_AUDIO_LABEL" value:&stru_1EE680640 table:@"MediaPlayer"];
    mainTitle = v2->_mainTitle;
    v2->_mainTitle = (NSString *)v4;
  }
  return v2;
}

+ (BOOL)isPlaceholder
{
  return 1;
}

- (int64_t)storeItemInt64ID
{
  return self->_storeItemInt64ID;
}

- (id)artworkCatalogBlock
{
  return self->_artworkCatalogBlock;
}

- (BOOL)isExplicitTrack
{
  return *(&self->_supportsLikedState + 3);
}

- (NSString)artist
{
  return self->_artist;
}

- (NSString)album
{
  return self->_album;
}

- (double)durationFromExternalMetadata
{
  return self->_durationFromExternalMetadata;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MPPlaceholderAVItem;
  uint64_t v4 = [(MPAVItem *)&v8 description];
  v5 = [(MPPlaceholderAVItem *)self mainTitle];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (NSString)mainTitle
{
  return self->_mainTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_artworkCatalogBlock, 0);
  objc_storeStrong((id *)&self->_mainTitle, 0);
  objc_storeStrong((id *)&self->_artist, 0);

  objc_storeStrong((id *)&self->_album, 0);
}

- (void)setArtworkCatalogBlock:(id)a3
{
}

- (BOOL)supportsLikedState
{
  return *(&self->_supportsLikedState + 5);
}

- (BOOL)isLikedStateEnabled
{
  return *(&self->_supportsLikedState + 4);
}

- (void)loadAssetAndPlayerItemWithTask:(id)a3 completion:(id)a4
{
}

- (BOOL)isValidPlayerSubstituteForItem:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (BOOL)supportsRateChange
{
  return 0;
}

- (void)setSupportsLikedState:(BOOL)a3
{
  if (*(&self->_supportsLikedState + 5) != a3) {
    *(&self->_supportsLikedState + 5) = a3;
  }
}

- (void)setStoreItemInt64ID:(int64_t)a3
{
  if (self->_storeItemInt64ID != a3) {
    self->_storeItemInt64ID = a3;
  }
}

- (void)setMainTitle:(id)a3
{
  char v4 = (NSString *)a3;
  mainTitle = self->_mainTitle;
  if (mainTitle != v4)
  {
    v10 = v4;
    BOOL v6 = [(NSString *)mainTitle isEqualToString:v4];
    char v4 = v10;
    if (!v6)
    {
      objc_super v7 = (NSString *)[(NSString *)v10 copy];
      objc_super v8 = self->_mainTitle;
      self->_mainTitle = v7;

      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 postNotificationName:@"MPAVItemTitlesDidChangeNotification" object:self];

      char v4 = v10;
    }
  }
}

- (void)setExplicitTrack:(BOOL)a3
{
  if (*(&self->_supportsLikedState + 3) != a3)
  {
    *(&self->_supportsLikedState + 3) = a3;
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"MPAVItemIsExplicitDidChangeNotification" object:self];
  }
}

- (void)setDurationFromExternalMetadata:(double)a3
{
  if (vabdd_f64(self->_durationFromExternalMetadata, a3) > 2.22044605e-16)
  {
    self->_durationFromExternalMetadata = a3;
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"MPAVItemDurationAvailableNotification" object:self];
  }
}

- (void)setArtist:(id)a3
{
  id v4 = (NSString *)a3;
  artist = self->_artist;
  if (artist != v4)
  {
    v10 = v4;
    BOOL v6 = [(NSString *)artist isEqualToString:v4];
    id v4 = v10;
    if (!v6)
    {
      objc_super v7 = (NSString *)[(NSString *)v10 copy];
      objc_super v8 = self->_artist;
      self->_artist = v7;

      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 postNotificationName:@"MPAVItemTitlesDidChangeNotification" object:self];

      id v4 = v10;
    }
  }
}

- (void)setAlbum:(id)a3
{
  id v4 = (NSString *)a3;
  album = self->_album;
  if (album != v4)
  {
    v10 = v4;
    BOOL v6 = [(NSString *)album isEqualToString:v4];
    id v4 = v10;
    if (!v6)
    {
      objc_super v7 = (NSString *)[(NSString *)v10 copy];
      objc_super v8 = self->_album;
      self->_album = v7;

      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 postNotificationName:@"MPAVItemTitlesDidChangeNotification" object:self];

      id v4 = v10;
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(MPPlaceholderAVItem *)self album];
  BOOL v6 = (void *)v4[67];
  v4[67] = v5;

  uint64_t v7 = [(MPPlaceholderAVItem *)self artist];
  objc_super v8 = (void *)v4[68];
  v4[68] = v7;

  [(MPPlaceholderAVItem *)self durationFromExternalMetadata];
  v4[69] = v9;
  *((unsigned char *)v4 + 533) = [(MPPlaceholderAVItem *)self isExplicitTrack];
  *((unsigned char *)v4 + 534) = [(MPPlaceholderAVItem *)self isLikedStateEnabled];
  uint64_t v10 = [(MPPlaceholderAVItem *)self mainTitle];
  v11 = (void *)v4[70];
  v4[70] = v10;

  *((unsigned char *)v4 + 535) = [(MPPlaceholderAVItem *)self supportsLikedState];
  v4[71] = [(MPPlaceholderAVItem *)self storeItemInt64ID];
  uint64_t v12 = [(MPPlaceholderAVItem *)self artworkCatalogBlock];
  v13 = (void *)v4[72];
  v4[72] = v12;

  return v4;
}

@end