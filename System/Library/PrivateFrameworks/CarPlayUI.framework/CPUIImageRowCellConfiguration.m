@interface CPUIImageRowCellConfiguration
+ (id)configurationWithText:(id)a3 artworkCatalogs:(id)a4 imageTitles:(id)a5 selectGridItemBlock:(id)a6 selectTitleBlock:(id)a7 showActivityIndicator:(BOOL)a8 enabled:(BOOL)a9;
+ (id)configurationWithText:(id)a3 artworkCatalogs:(id)a4 imageTitles:(id)a5 selectGridItemBlock:(id)a6 selectTitleBlock:(id)a7 showActivityIndicator:(BOOL)a8 enabled:(BOOL)a9 bundleIdentifier:(id)a10;
+ (id)configurationWithText:(id)a3 artworkCatalogs:(id)a4 selectGridItemBlock:(id)a5 selectTitleBlock:(id)a6;
+ (id)configurationWithText:(id)a3 artworkCatalogs:(id)a4 selectGridItemBlock:(id)a5 selectTitleBlock:(id)a6 showActivityIndicator:(BOOL)a7;
+ (id)configurationWithText:(id)a3 artworkCatalogs:(id)a4 selectGridItemBlock:(id)a5 selectTitleBlock:(id)a6 showActivityIndicator:(BOOL)a7 enabled:(BOOL)a8;
+ (id)configurationWithText:(id)a3 images:(id)a4 imageTitles:(id)a5 selectGridItemBlock:(id)a6 selectTitleBlock:(id)a7 showActivityIndicator:(BOOL)a8 enabled:(BOOL)a9;
+ (id)configurationWithText:(id)a3 images:(id)a4 imageTitles:(id)a5 selectGridItemBlock:(id)a6 selectTitleBlock:(id)a7 showActivityIndicator:(BOOL)a8 enabled:(BOOL)a9 bundleIdentifier:(id)a10;
+ (id)configurationWithText:(id)a3 images:(id)a4 selectGridItemBlock:(id)a5 selectTitleBlock:(id)a6 showActivityIndicator:(BOOL)a7;
+ (id)configurationWithText:(id)a3 images:(id)a4 selectGridItemBlock:(id)a5 selectTitleBlock:(id)a6 showActivityIndicator:(BOOL)a7 enabled:(BOOL)a8;
- (BOOL)enabled;
- (BOOL)showActivityIndicator;
- (NSArray)artworkCatalogs;
- (NSArray)imageTitles;
- (NSArray)images;
- (NSString)bundleIdentifier;
- (NSString)title;
- (id)selectGridItemBlock;
- (id)selectTitleBlock;
- (void)setArtworkCatalogs:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImageTitles:(id)a3;
- (void)setImages:(id)a3;
- (void)setSelectGridItemBlock:(id)a3;
- (void)setSelectTitleBlock:(id)a3;
- (void)setShowActivityIndicator:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation CPUIImageRowCellConfiguration

+ (id)configurationWithText:(id)a3 images:(id)a4 selectGridItemBlock:(id)a5 selectTitleBlock:(id)a6 showActivityIndicator:(BOOL)a7
{
  return (id)[a1 configurationWithText:a3 images:a4 selectGridItemBlock:a5 selectTitleBlock:a6 showActivityIndicator:a7 enabled:1];
}

+ (id)configurationWithText:(id)a3 images:(id)a4 selectGridItemBlock:(id)a5 selectTitleBlock:(id)a6 showActivityIndicator:(BOOL)a7 enabled:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return (id)[a1 configurationWithText:a3 images:a4 imageTitles:0 selectGridItemBlock:a5 selectTitleBlock:a6 showActivityIndicator:a7 enabled:v9];
}

+ (id)configurationWithText:(id)a3 images:(id)a4 imageTitles:(id)a5 selectGridItemBlock:(id)a6 selectTitleBlock:(id)a7 showActivityIndicator:(BOOL)a8 enabled:(BOOL)a9
{
  BOOL v28 = a8;
  HIDWORD(v26) = a9;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v29 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [MEMORY[0x263EFF980] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v18 = v13;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = [MEMORY[0x263F11D30] staticArtworkCatalogWithImage:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        [v17 addObject:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v20);
  }

  LOBYTE(v26) = BYTE4(v26);
  v24 = [a1 configurationWithText:v29 artworkCatalogs:v17 imageTitles:v14 selectGridItemBlock:v15 selectTitleBlock:v16 showActivityIndicator:v28 enabled:v26];

  return v24;
}

+ (id)configurationWithText:(id)a3 artworkCatalogs:(id)a4 selectGridItemBlock:(id)a5 selectTitleBlock:(id)a6
{
  return (id)[a1 configurationWithText:a3 artworkCatalogs:a4 selectGridItemBlock:a5 selectTitleBlock:a6 showActivityIndicator:0 enabled:1];
}

+ (id)configurationWithText:(id)a3 artworkCatalogs:(id)a4 selectGridItemBlock:(id)a5 selectTitleBlock:(id)a6 showActivityIndicator:(BOOL)a7
{
  return (id)[a1 configurationWithText:a3 artworkCatalogs:a4 selectGridItemBlock:a5 selectTitleBlock:a6 showActivityIndicator:a7 enabled:1];
}

+ (id)configurationWithText:(id)a3 artworkCatalogs:(id)a4 selectGridItemBlock:(id)a5 selectTitleBlock:(id)a6 showActivityIndicator:(BOOL)a7 enabled:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return (id)[a1 configurationWithText:a3 artworkCatalogs:a4 imageTitles:0 selectGridItemBlock:a5 selectTitleBlock:a6 showActivityIndicator:a7 enabled:v9];
}

+ (id)configurationWithText:(id)a3 artworkCatalogs:(id)a4 imageTitles:(id)a5 selectGridItemBlock:(id)a6 selectTitleBlock:(id)a7 showActivityIndicator:(BOOL)a8 enabled:(BOOL)a9
{
  LOBYTE(v10) = a9;
  return (id)[a1 configurationWithText:a3 artworkCatalogs:a4 imageTitles:a5 selectGridItemBlock:a6 selectTitleBlock:a7 showActivityIndicator:a8 enabled:v10 bundleIdentifier:0];
}

+ (id)configurationWithText:(id)a3 artworkCatalogs:(id)a4 imageTitles:(id)a5 selectGridItemBlock:(id)a6 selectTitleBlock:(id)a7 showActivityIndicator:(BOOL)a8 enabled:(BOOL)a9 bundleIdentifier:(id)a10
{
  BOOL v23 = a8;
  id v15 = a10;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  uint64_t v21 = objc_opt_new();
  [v21 setTitle:v20];

  [v21 setArtworkCatalogs:v19];
  [v21 setSelectGridItemBlock:v17];

  [v21 setSelectTitleBlock:v16];
  [v21 setShowActivityIndicator:v23];
  [v21 setEnabled:a9];
  [v21 setImageTitles:v18];

  [v21 setBundleIdentifier:v15];
  return v21;
}

+ (id)configurationWithText:(id)a3 images:(id)a4 imageTitles:(id)a5 selectGridItemBlock:(id)a6 selectTitleBlock:(id)a7 showActivityIndicator:(BOOL)a8 enabled:(BOOL)a9 bundleIdentifier:(id)a10
{
  BOOL v30 = a8;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v14 = a4;
  id v29 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a10;
  id v18 = [MEMORY[0x263EFF980] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v19 = v14;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = [MEMORY[0x263F11D30] staticArtworkCatalogWithImage:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        [v18 addObject:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v21);
  }

  LOBYTE(v27) = a9;
  v25 = [a1 configurationWithText:v31 artworkCatalogs:v18 imageTitles:v29 selectGridItemBlock:v15 selectTitleBlock:v16 showActivityIndicator:v30 enabled:v27 bundleIdentifier:v17];

  return v25;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (id)selectGridItemBlock
{
  return self->_selectGridItemBlock;
}

- (void)setSelectGridItemBlock:(id)a3
{
}

- (id)selectTitleBlock
{
  return self->_selectTitleBlock;
}

- (void)setSelectTitleBlock:(id)a3
{
}

- (NSArray)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
}

- (NSArray)artworkCatalogs
{
  return self->_artworkCatalogs;
}

- (void)setArtworkCatalogs:(id)a3
{
}

- (NSArray)imageTitles
{
  return self->_imageTitles;
}

- (void)setImageTitles:(id)a3
{
}

- (BOOL)showActivityIndicator
{
  return self->_showActivityIndicator;
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  self->_showActivityIndicator = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_imageTitles, 0);
  objc_storeStrong((id *)&self->_artworkCatalogs, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong(&self->_selectTitleBlock, 0);
  objc_storeStrong(&self->_selectGridItemBlock, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end