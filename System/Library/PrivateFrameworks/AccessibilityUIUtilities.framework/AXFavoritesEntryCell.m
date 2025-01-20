@interface AXFavoritesEntryCell
- (AXFavoritesEntryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (BOOL)_shouldShowDetailForActionType:(id)a3;
- (id)_favoritesEntryForSpecifier:(id)a3;
- (id)_imageForActionType:(id)a3;
@end

@implementation AXFavoritesEntryCell

- (AXFavoritesEntryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v28.receiver = self;
  v28.super_class = (Class)AXFavoritesEntryCell;
  v9 = [(PSTableCell *)&v28 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [(AXFavoritesEntryCell *)v9 _favoritesEntryForSpecifier:v8];
    v12 = [v8 propertyForKey:@"favoritesController"];
    v13 = [v11 actionType];
    if ([(AXFavoritesEntryCell *)v10 _shouldShowDetailForActionType:v13])
    {
      v14 = objc_opt_new();
      v15 = [(AXFavoritesEntryCell *)v10 _imageForActionType:v13];
      v16 = [(AXFavoritesEntryCell *)v10 detailTextLabel];
      v17 = [v16 textColor];
      v18 = [v15 imageWithTintColor:v17];
      [v14 setImage:v18];

      v19 = [MEMORY[0x1E4F28E48] attributedStringWithAttachment:v14];
      v20 = (void *)[v19 mutableCopy];

      v21 = [v12 transportNameForFavoritesEntry:v11];
      if ([v21 length])
      {
        id v22 = objc_alloc(MEMORY[0x1E4F28B18]);
        v23 = AXUILocalizedStringForKey(@"FAVORITES_TRANSPORT_SEPARATOR");
        v24 = (void *)[v22 initWithString:v23];
        [v20 appendAttributedString:v24];

        v25 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v21];
        [v20 appendAttributedString:v25];
      }
      v26 = [(AXFavoritesEntryCell *)v10 detailTextLabel];
      [v26 setAttributedText:v20];
    }
  }

  return v10;
}

- (id)_favoritesEntryForSpecifier:(id)a3
{
  return (id)[a3 propertyForKey:@"favoritesEntry"];
}

- (BOOL)_shouldShowDetailForActionType:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4F1AD40]] ^ 1;
}

- (id)_imageForActionType:(id)a3
{
  id v3 = a3;
  if ([(id)*MEMORY[0x1E4F1AD18] isEqualToString:v3])
  {
    uint64_t v4 = [MEMORY[0x1E4FB1818] favoritesAudioGlyphImage];
LABEL_9:
    v5 = (void *)v4;
    goto LABEL_10;
  }
  if ([(id)*MEMORY[0x1E4F1AD58] isEqualToString:v3])
  {
    uint64_t v4 = [MEMORY[0x1E4FB1818] favoritesTTYDirectGlyphImage];
    goto LABEL_9;
  }
  if ([(id)*MEMORY[0x1E4F1AD70] isEqualToString:v3])
  {
    uint64_t v4 = [MEMORY[0x1E4FB1818] favoritesTTYRelayGlyphImage];
    goto LABEL_9;
  }
  if ([(id)*MEMORY[0x1E4F1AD80] isEqualToString:v3])
  {
    uint64_t v4 = [MEMORY[0x1E4FB1818] favoritesVideoGlyphImage];
    goto LABEL_9;
  }
  v5 = 0;
LABEL_10:

  return v5;
}

@end