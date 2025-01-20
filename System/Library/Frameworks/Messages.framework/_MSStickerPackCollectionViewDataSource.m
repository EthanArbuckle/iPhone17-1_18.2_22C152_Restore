@interface _MSStickerPackCollectionViewDataSource
+ (int64_t)_stickerSizeFromString:(id)a3;
- (NSMutableArray)stickers;
- (_MSStickerPackCollectionViewDataSource)initWithStickerPackURL:(id)a3;
- (id)_allStickers;
- (id)stickerBrowserView:(id)a3 stickerAtIndex:(int64_t)a4;
- (int64_t)numberOfStickersInStickerBrowserView:(id)a3;
- (int64_t)stickerSize;
- (void)_loadStickerPackWithURL:(id)a3;
@end

@implementation _MSStickerPackCollectionViewDataSource

+ (int64_t)_stickerSizeFromString:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"MSStickerBrowserLayoutSparse"] & 1) != 0
    || ([v3 isEqualToString:@"MSStickerSizeLarge"] & 1) != 0
    || ([v3 isEqualToString:@"MSStickerSizeClassLarge"] & 1) != 0)
  {
    int64_t v4 = 2;
  }
  else if (([v3 isEqualToString:@"MSStickerBrowserLayoutCondensed"] & 1) != 0 {
         || ([v3 isEqualToString:@"MSStickerSizeSmall"] & 1) != 0)
  }
  {
    int64_t v4 = 0;
  }
  else
  {
    int64_t v4 = [v3 isEqualToString:@"MSStickerSizeClassSmall"] ^ 1;
  }

  return v4;
}

- (_MSStickerPackCollectionViewDataSource)initWithStickerPackURL:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_Initwithsticke.isa, v4);
  if (v4
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v4 path],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 fileExistsAtPath:v6],
        v6,
        v5,
        v7))
  {
    v13.receiver = self;
    v13.super_class = (Class)_MSStickerPackCollectionViewDataSource;
    v8 = [(_MSStickerPackCollectionViewDataSource *)&v13 init];
    if (v8)
    {
      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      stickers = v8->_stickers;
      v8->_stickers = v9;

      [(_MSStickerPackCollectionViewDataSource *)v8 _loadStickerPackWithURL:v4];
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_loadStickerPackWithURL:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleWithURL:v4];
    v6 = [v4 path];
    id v24 = v4;
    int v7 = [v4 URLByDeletingPathExtension];
    v30 = [v7 lastPathComponent];

    v8 = [v5 objectForInfoDictionaryKey:@"IMStickerPackLayout"];
    self->_stickerSize = +[_MSStickerPackCollectionViewDataSource _stickerSizeFromString:v8];

    [v5 objectForInfoDictionaryKey:@"IMStickers"];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v31)
    {
      uint64_t v29 = *(void *)v34;
      uint64_t v28 = *MEMORY[0x1E4F6EB80];
      uint64_t v27 = *MEMORY[0x1E4F6EB70];
      v25 = v6;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v11 = [v10 objectForKey:v28];
          v12 = [v11 stringByAppendingString:@".accessibilityLabel"];
          objc_super v13 = [v10 objectForKey:v27];
          v14 = [v5 localizedStringForKey:v12 value:v13 table:v30];

          v15 = (void *)MEMORY[0x1E4F1CB10];
          v16 = [v6 stringByAppendingPathComponent:v11];
          v17 = [v15 fileURLWithPath:v16];

          v18 = [MSSticker alloc];
          id v32 = 0;
          v19 = [(MSSticker *)v18 initWithContentsOfFileURL:v17 localizedDescription:v14 error:&v32];
          id v20 = v32;
          if (v19)
          {
            [(NSMutableArray *)self->_stickers addObject:v19];
          }
          else
          {
            [v17 lastPathComponent];
            v21 = v5;
            v23 = v22 = self;
            NSLog(&cfstr_FailedToLoadSt.isa, v23, v20);

            self = v22;
            v5 = v21;
            v6 = v25;
          }
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v31);
    }

    id v4 = v24;
  }
}

- (int64_t)numberOfStickersInStickerBrowserView:(id)a3
{
  return [(NSMutableArray *)self->_stickers count];
}

- (id)stickerBrowserView:(id)a3 stickerAtIndex:(int64_t)a4
{
  id v6 = a3;
  if (a4 < 0 || [(NSMutableArray *)self->_stickers count] <= (unint64_t)a4)
  {
    NSLog(&cfstr_WarningSticker.isa);
    int v7 = 0;
  }
  else
  {
    int v7 = [(NSMutableArray *)self->_stickers objectAtIndex:a4];
  }

  return v7;
}

- (int64_t)stickerSize
{
  return self->_stickerSize;
}

- (NSMutableArray)stickers
{
  return self->_stickers;
}

- (void).cxx_destruct
{
}

- (id)_allStickers
{
  return self->_stickers;
}

@end