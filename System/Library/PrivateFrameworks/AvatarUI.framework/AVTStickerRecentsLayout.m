@interface AVTStickerRecentsLayout
+ (CGSize)buttonSizeForContainerSize:(CGSize)a3 imageSize:(CGSize)a4;
- (AVTStickerRecentsLayout)initWithNumberOfItemsPerRow:(int64_t)a3 numberOfItemsPerColumn:(int64_t)a4 interitemPadding:(double)a5 appButtonIndex:(int64_t)a6 laysOutVertically:(BOOL)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)laysOutVertically;
- (int64_t)appButtonIndex;
- (int64_t)interitemPadding;
- (int64_t)numberOfItems;
- (int64_t)numberOfItemsPerColumn;
- (int64_t)numberOfItemsPerRow;
- (unint64_t)hash;
@end

@implementation AVTStickerRecentsLayout

+ (CGSize)buttonSizeForContainerSize:(CGSize)a3 imageSize:(CGSize)a4
{
  double v4 = a3.height * 0.3;
  double v5 = v4 * a4.width / a4.height;
  result.height = v4;
  result.width = v5;
  return result;
}

- (AVTStickerRecentsLayout)initWithNumberOfItemsPerRow:(int64_t)a3 numberOfItemsPerColumn:(int64_t)a4 interitemPadding:(double)a5 appButtonIndex:(int64_t)a6 laysOutVertically:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)AVTStickerRecentsLayout;
  CGSize result = [(AVTStickerRecentsLayout *)&v13 init];
  if (result)
  {
    result->_numberOfItems = a4 * a3;
    result->_numberOfItemsPerRow = a3;
    result->_numberOfItemsPerColumn = a4;
    result->_interitemPadding = (uint64_t)a5;
    result->_appButtonIndex = a6;
    result->_laysOutVertically = a7;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(AVTStickerRecentsLayout *)self numberOfItemsPerRow];
    if (v6 == [v5 numberOfItemsPerRow]
      && (int64_t v7 = [(AVTStickerRecentsLayout *)self numberOfItemsPerColumn],
          v7 == [v5 numberOfItemsPerColumn])
      && (int64_t v8 = [(AVTStickerRecentsLayout *)self interitemPadding],
          v8 == [v5 interitemPadding])
      && (int64_t v9 = [(AVTStickerRecentsLayout *)self appButtonIndex],
          v9 == [v5 appButtonIndex]))
    {
      BOOL v10 = [(AVTStickerRecentsLayout *)self laysOutVertically];
      int v11 = v10 ^ [v5 laysOutVertically] ^ 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  *((void *)&v4 + 1) = [(AVTStickerRecentsLayout *)self numberOfItemsPerRow];
  *(void *)&long long v4 = [(AVTStickerRecentsLayout *)self numberOfItemsPerRow];
  uint64_t v3 = v4 >> 52;
  *((void *)&v4 + 1) = [(AVTStickerRecentsLayout *)self numberOfItemsPerColumn];
  *(void *)&long long v4 = [(AVTStickerRecentsLayout *)self numberOfItemsPerColumn];
  uint64_t v5 = (v4 >> 48) ^ v3;
  *((void *)&v4 + 1) = [(AVTStickerRecentsLayout *)self interitemPadding];
  *(void *)&long long v4 = [(AVTStickerRecentsLayout *)self interitemPadding];
  uint64_t v6 = v4 >> 43;
  *((void *)&v4 + 1) = [(AVTStickerRecentsLayout *)self appButtonIndex];
  *(void *)&long long v4 = [(AVTStickerRecentsLayout *)self appButtonIndex];
  return v5 ^ v6 ^ (v4 >> 32) ^ [(AVTStickerRecentsLayout *)self laysOutVertically];
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (int64_t)numberOfItemsPerRow
{
  return self->_numberOfItemsPerRow;
}

- (int64_t)numberOfItemsPerColumn
{
  return self->_numberOfItemsPerColumn;
}

- (int64_t)interitemPadding
{
  return self->_interitemPadding;
}

- (int64_t)appButtonIndex
{
  return self->_appButtonIndex;
}

- (BOOL)laysOutVertically
{
  return self->_laysOutVertically;
}

@end