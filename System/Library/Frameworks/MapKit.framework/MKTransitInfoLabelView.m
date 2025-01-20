@interface MKTransitInfoLabelView
+ (id)stringAttributesForFont:(id)a3 lineBreakMode:(int64_t)a4;
+ (int64_t)iconSizeForContentSizeCategory:(id)a3;
+ (int64_t)shieldSizeForContentSizeCategory:(id)a3;
- (MKArtworkDataSourceCache)artworkCache;
- (MKTransitInfoLabelView)init;
- (MKTransitInfoLabelView)initWithLabelItems:(id)a3 iconSize:(int64_t)a4 shieldSize:(int64_t)a5 spaceBetweenShields:(double)a6 maxWidth:(double)a7;
- (MKTransitInfoLabelView)initWithMapItem:(id)a3;
- (MKTransitInfoLabelView)initWithMapItem:(id)a3 maxWidth:(double)a4;
- (NSArray)labelItems;
- (double)maxShieldHeight;
- (double)spaceBetweenShields;
- (id)_generateText;
- (id)_imageForArtworkDataSource:(id)a3;
- (id)_imageForLabelItem:(id)a3;
- (id)_imageForShieldDataSource:(id)a3;
- (id)_stringAttributes;
- (int64_t)iconSize;
- (int64_t)shieldSize;
- (void)_contentSizeCategoryDidChange;
- (void)_setFont:(id)a3 custom:(BOOL)a4;
- (void)_setupLabelInfo;
- (void)dealloc;
- (void)setArtworkCache:(id)a3;
- (void)setFont:(id)a3;
- (void)setIconSize:(int64_t)a3;
- (void)setLabelItems:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setMaxShieldHeight:(double)a3;
- (void)setMaxWidth:(double)a3 textForTruncationGenerator:(id)a4;
- (void)setShieldSize:(int64_t)a3;
- (void)setSpaceBetweenIcons:(double)a3;
- (void)setSpaceBetweenShields:(double)a3;
@end

@implementation MKTransitInfoLabelView

- (MKTransitInfoLabelView)init
{
  return [(MKTransitInfoLabelView *)self initWithMapItem:0];
}

- (MKTransitInfoLabelView)initWithMapItem:(id)a3
{
  return [(MKTransitInfoLabelView *)self initWithMapItem:a3 maxWidth:-1.0];
}

- (MKTransitInfoLabelView)initWithMapItem:(id)a3 maxWidth:(double)a4
{
  v6 = [a3 _transitInfo];
  uint64_t v7 = [v6 labelItems];
  v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
  }
  v10 = [(MKTransitInfoLabelView *)self initWithLabelItems:v9 iconSize:0x8000000000000000 shieldSize:0x8000000000000000 spaceBetweenShields:4.0 maxWidth:a4];

  return v10;
}

- (MKTransitInfoLabelView)initWithLabelItems:(id)a3 iconSize:(int64_t)a4 shieldSize:(int64_t)a5 spaceBetweenShields:(double)a6 maxWidth:(double)a7
{
  id v12 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MKTransitInfoLabelView;
  v13 = -[MKTransitInfoLabelView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v14 = v13;
  if (v13)
  {
    v13->_hasCustomShieldSize = a5 != 0x8000000000000000;
    v13->_hasCustomIconSize = a4 != 0x8000000000000000;
    v15 = [MEMORY[0x1E4F42738] sharedApplication];
    v16 = [v15 preferredContentSizeCategory];

    if (!v14->_hasCustomShieldSize) {
      a5 = [(id)objc_opt_class() shieldSizeForContentSizeCategory:v16];
    }
    if (!v14->_hasCustomIconSize) {
      a4 = [(id)objc_opt_class() iconSizeForContentSizeCategory:v16];
    }
    v14->_iconSize = a4;
    v14->_shieldSize = a5;
    v14->_maxWidth = a7;
    v14->_spaceBetweenShields = a6;
    v14->_spaceBetweenIcons = 5.0;
    uint64_t v17 = [&__block_literal_global_8 copy];
    id textForTruncationGenerator = v14->_textForTruncationGenerator;
    v14->_id textForTruncationGenerator = (id)v17;

    v19 = +[MKFontManager sharedManager];
    v20 = [v19 smallAttributionFont];
    [(MKTransitInfoLabelView *)v14 _setFont:v20 custom:0];

    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v14 selector:sel__contentSizeCategoryDidChange name:*MEMORY[0x1E4F43788] object:0];

    [(MKTransitInfoLabelView *)v14 setLabelItems:v12];
  }

  return v14;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43788] object:0];

  v4.receiver = self;
  v4.super_class = (Class)MKTransitInfoLabelView;
  [(MKTransitInfoLabelView *)&v4 dealloc];
}

- (void)setMapItem:(id)a3
{
  objc_super v4 = [a3 _transitInfo];
  uint64_t v5 = [v4 labelItems];
  v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
  }
  [(MKTransitInfoLabelView *)self setLabelItems:v7];

  [(MKTransitInfoLabelView *)self _setupLabelInfo];
}

- (void)setLabelItems:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_labelItems, "isEqualToArray:"))
  {
    objc_super v4 = (NSArray *)[v6 copy];
    labelItems = self->_labelItems;
    self->_labelItems = v4;

    [(MKTransitInfoLabelView *)self _setupLabelInfo];
  }
}

- (void)setShieldSize:(int64_t)a3
{
  self->_hasCustomShieldSize = 1;
  if (self->_shieldSize != a3)
  {
    self->_shieldSize = a3;
    [(MKTransitInfoLabelView *)self _setupLabelInfo];
  }
}

- (void)setSpaceBetweenShields:(double)a3
{
  if (a3 >= 0.0 && self->_spaceBetweenShields != a3)
  {
    self->_spaceBetweenShields = a3;
    [(MKTransitInfoLabelView *)self _setupLabelInfo];
  }
}

- (void)setMaxWidth:(double)a3 textForTruncationGenerator:(id)a4
{
  id v6 = a4;
  id textForTruncationGenerator = self->_textForTruncationGenerator;
  id v14 = v6;
  if (self->_maxWidth == a3)
  {
    if (textForTruncationGenerator == v6) {
      goto LABEL_10;
    }
    goto LABEL_5;
  }
  self->_maxWidth = a3;
  if (textForTruncationGenerator != v6)
  {
LABEL_5:
    uint64_t v8 = [v6 copy];
    uint64_t v9 = (void *)v8;
    if (v8)
    {
      v10 = (void *)MEMORY[0x18C139AE0](v8);
      id v11 = self->_textForTruncationGenerator;
      self->_id textForTruncationGenerator = v10;
    }
    else
    {
      id v11 = (id)[&__block_literal_global_8 copy];
      id v12 = (void *)MEMORY[0x18C139AE0]();
      id v13 = self->_textForTruncationGenerator;
      self->_id textForTruncationGenerator = v12;
    }
  }
  [(MKTransitInfoLabelView *)self _setupLabelInfo];
  id v6 = v14;
LABEL_10:
}

- (void)_setupLabelInfo
{
  id v3 = [(MKTransitInfoLabelView *)self _generateText];
  [(MKTransitInfoLabelView *)self setAttributedText:v3];
}

- (id)_generateText
{
  if ([(NSArray *)self->_labelItems count])
  {
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    char v45 = 0;
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x2020000000;
    char v43 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    char v41 = 0;
    id v3 = [MEMORY[0x1E4F1CA80] set];
    objc_super v4 = [(MKTransitInfoLabelView *)self _stringAttributes];
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__4;
    v38 = __Block_byref_object_dispose__4;
    id v5 = objc_alloc(MEMORY[0x1E4F28E48]);
    if (MKApplicationLayoutDirectionIsRightToLeft()) {
      id v6 = @"\u200F";
    }
    else {
      id v6 = @"\u200E";
    }
    id v39 = (id)[v5 initWithString:v6 attributes:v4];
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__4;
    v32[4] = __Block_byref_object_dispose__4;
    id v33 = 0;
    id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v8 = objc_msgSend(NSString, "_mapkit_commaListDelimiter");
    uint64_t v9 = (void *)[v7 initWithString:v8 attributes:v4];

    v10 = [(MKTransitInfoLabelView *)self font];
    [v10 capHeight];
    uint64_t v12 = v11;

    id v13 = [MEMORY[0x1E4F1CA80] set];
    labelItems = self->_labelItems;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __39__MKTransitInfoLabelView__generateText__block_invoke;
    v21[3] = &unk_1E54B8F30;
    v21[4] = self;
    id v15 = v13;
    id v22 = v15;
    v26 = v40;
    v27 = v44;
    v28 = v42;
    uint64_t v31 = v12;
    id v16 = v3;
    id v23 = v16;
    v29 = &v34;
    id v17 = v9;
    id v24 = v17;
    id v18 = v4;
    id v25 = v18;
    v30 = v32;
    [(NSArray *)labelItems enumerateObjectsWithOptions:0 usingBlock:v21];
    id v19 = (id)v35[5];

    _Block_object_dispose(v32, 8);
    _Block_object_dispose(&v34, 8);

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(v42, 8);
    _Block_object_dispose(v44, 8);
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

void __39__MKTransitInfoLabelView__generateText__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __39__MKTransitInfoLabelView__generateText__block_invoke_2;
  v26[3] = &unk_1E54B8F08;
  uint64_t v8 = *(void **)(a1 + 40);
  v26[4] = *(void *)(a1 + 32);
  id v27 = v8;
  long long v32 = *(_OWORD *)(a1 + 72);
  uint64_t v33 = *(void *)(a1 + 88);
  id v9 = v7;
  id v28 = v9;
  uint64_t v36 = *(void *)(a1 + 112);
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 96);
  id v29 = v10;
  uint64_t v34 = v11;
  id v30 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 104);
  id v31 = v12;
  uint64_t v35 = v13;
  uint64_t v37 = a4;
  id v14 = (void (**)(void, void, void, void, void))MEMORY[0x18C139AE0](v26);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v21 = v9;
    id v15 = v9;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v38 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v23;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v15);
          }
          v14[2](v14, *(void *)(*((void *)&v22 + 1) + 8 * v20), a3, 1, v18 + v20);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
          ++v20;
        }
        while (v17 != v20);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v38 count:16];
        v18 += v20;
      }
      while (v17);
    }

    id v9 = v21;
  }
  else
  {
    ((void (**)(void, id, uint64_t, void, uint64_t))v14)[2](v14, v9, a3, 0, 0x7FFFFFFFFFFFFFFFLL);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
  }
}

void __39__MKTransitInfoLabelView__generateText__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4, uint64_t a5)
{
  id v52 = a2;
  if ([v52 conformsToProtocol:&unk_1EDA432B8])
  {
    id v9 = v52;
    if ([v9 type] == 1 || objc_msgSend(v9, "type") == 3)
    {
      id v10 = [*(id *)(a1 + 32) _imageForLabelItem:v9];
      if ([v9 type] == 3)
      {
        id v11 = 0;
        BOOL v12 = 1;
      }
      else
      {
        uint64_t v13 = [v9 labelArtwork];
        BOOL v12 = [v13 artworkSourceType] == 2;

        id v11 = 0;
      }
    }
    else
    {
      if ([v9 type] == 2)
      {
        id v11 = [v9 labelString];
        BOOL v12 = 0;
      }
      else
      {
        BOOL v12 = 0;
        id v11 = 0;
      }
      id v10 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v52;
      id v10 = 0;
LABEL_37:
      id v14 = 0;
LABEL_38:
      if ([v11 length] && (objc_msgSend(*(id *)(a1 + 56), "containsObject:", v11) & 1) == 0)
      {
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
          [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) appendAttributedString:*(void *)(a1 + 64)];
        }
        id v22 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v11 attributes:*(void *)(a1 + 72)];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
        [*(id *)(a1 + 56) addObject:v11];
        if (v22) {
          goto LABEL_57;
        }
      }
      goto LABEL_70;
    }
    if ([v52 conformsToProtocol:&unk_1ED9FF960])
    {
      id v10 = [*(id *)(a1 + 32) _imageForArtworkDataSource:v52];
      id v11 = 0;
      BOOL v12 = [v52 artworkSourceType] == 2;
    }
    else
    {
      if (![v52 conformsToProtocol:&unk_1ED9FFBD0])
      {
        id v10 = 0;
        id v11 = 0;
        goto LABEL_37;
      }
      id v10 = [*(id *)(a1 + 32) _imageForShieldDataSource:v52];
      BOOL v12 = 0;
      id v11 = 0;
    }
  }
  if (!v10) {
    goto LABEL_37;
  }
  id v14 = UIImagePNGRepresentation(v10);
  if (!v14 || ([*(id *)(a1 + 40) containsObject:v14] & 1) != 0) {
    goto LABEL_38;
  }
  [*(id *)(a1 + 40) addObject:v14];
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = 5;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
    uint64_t v16 = 6;
  }
  double v17 = *(double *)(v15 + OBJC_IVAR___MKTransitInfoLabelView__hasCustomShieldSize[v16]);
  BOOL v50 = v12;
  if (a4)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
        double v18 = v17 * 0.5;
      }
      else {
        double v18 = *(double *)(v15 + OBJC_IVAR___MKTransitInfoLabelView__hasCustomShieldSize[v16]);
      }
    }
    else
    {
      double v18 = 0.0;
    }
    uint64_t v23 = 5;
    if (v12) {
      uint64_t v23 = 6;
    }
    double v19 = *(double *)(v15 + OBJC_IVAR___MKTransitInfoLabelView__hasCustomShieldSize[v23]);
    if (a5 + 1 == [*(id *)(a1 + 48) count])
    {
      if (a3 + 1 == [*(id *)(*(void *)(a1 + 32) + 856) count]) {
        double v19 = 0.0;
      }
    }
    else
    {
      double v19 = v19 * 0.5;
    }
  }
  else
  {
    double v19 = 0.0;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
      double v18 = *(double *)(v15 + OBJC_IVAR___MKTransitInfoLabelView__hasCustomShieldSize[v16]);
    }
    else {
      double v18 = 0.0;
    }
    uint64_t v20 = 5;
    if (v12) {
      uint64_t v20 = 6;
    }
    double v21 = *(double *)(v15 + OBJC_IVAR___MKTransitInfoLabelView__hasCustomShieldSize[v20]);
    if (a3 + 1 != objc_msgSend(*(id *)(v15 + 856), "count", v17)) {
      double v19 = v21;
    }
  }
  v51 = [[MKEmptyTextAttachment alloc] initWithWidth:v18];
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28B18], "attributedStringWithAttachment:");
  v49 = [[MKEmptyTextAttachment alloc] initWithWidth:v19];
  long long v25 = objc_msgSend(MEMORY[0x1E4F28B18], "attributedStringWithAttachment:");
  [(UIImage *)v10 size];
  [*(id *)(a1 + 32) maxShieldHeight];
  if (v26 > 0.0) {
    [*(id *)(a1 + 32) maxShieldHeight];
  }
  UIRoundToViewScale();
  id v28 = [[MKImageTextAttachment alloc] initWithImage:v10 verticalOffset:v27];
  [*(id *)(a1 + 32) maxShieldHeight];
  if (v29 > 0.0)
  {
    [*(id *)(a1 + 32) maxShieldHeight];
    -[MKImageTextAttachment setMaxHeight:](v28, "setMaxHeight:");
  }
  id v30 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v28];
  id v22 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  [v22 appendAttributedString:v24];
  [v22 appendAttributedString:v30];
  [v22 appendAttributedString:v25];
  v48 = (void *)v24;
  uint64_t v31 = *MEMORY[0x1E4F42510];
  long long v32 = [MEMORY[0x1E4F428B8] blackColor];
  objc_msgSend(v22, "addAttribute:value:range:", v31, v32, 0, objc_msgSend(v22, "length"));

  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v50;

  if (v22)
  {
LABEL_57:
    uint64_t v33 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
    if (*(double *)(*(void *)(a1 + 32) + 816) <= 0.0)
    {
      [v33 appendAttributedString:v22];
    }
    else
    {
      [v33 size];
      double v35 = v34;
      [v22 size];
      double v37 = v36;
      [*(id *)(*(void *)(a1 + 32) + 856) count];
      uint64_t v38 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 832) + 16))();
      if (v38) {
        uint64_t v39 = (__CFString *)v38;
      }
      else {
        uint64_t v39 = @"…";
      }
      v40 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v39 attributes:*(void *)(a1 + 72)];
      char v41 = v40;
      double v42 = v35 + v37;
      if (!*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40))
      {
        double v43 = *(double *)(*(void *)(a1 + 32) + 816);
        [v40 size];
        if (v42 > v43 - v44)
        {
          uint64_t v45 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) mutableCopy];
          uint64_t v46 = *(void *)(*(void *)(a1 + 112) + 8);
          v47 = *(void **)(v46 + 40);
          *(void *)(v46 + 40) = v45;

          [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) appendAttributedString:v41];
        }
      }
      if (v42 <= *(double *)(*(void *)(a1 + 32) + 816))
      {
        [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) appendAttributedString:v22];
      }
      else
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40));
        **(unsigned char **)(a1 + 128) = 1;
      }
    }
  }
LABEL_70:
}

- (void)setIconSize:(int64_t)a3
{
  self->_hasCustomIconSize = 1;
  if (self->_iconSize != a3)
  {
    self->_iconSize = a3;
    [(MKTransitInfoLabelView *)self _setupLabelInfo];
  }
}

- (void)setSpaceBetweenIcons:(double)a3
{
  if (a3 >= 0.0 && self->_spaceBetweenIcons != a3)
  {
    self->_spaceBetweenIcons = a3;
    [(MKTransitInfoLabelView *)self _setupLabelInfo];
  }
}

- (id)_stringAttributes
{
  id v3 = objc_opt_class();
  objc_super v4 = [(MKTransitInfoLabelView *)self font];
  id v5 = objc_msgSend(v3, "stringAttributesForFont:lineBreakMode:", v4, -[MKTransitInfoLabelView lineBreakMode](self, "lineBreakMode"));

  return v5;
}

- (id)_imageForLabelItem:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 1)
  {
    id v5 = [v4 labelArtwork];

    id v6 = [(MKTransitInfoLabelView *)self _imageForArtworkDataSource:v5];
  }
  else
  {
    uint64_t v7 = [v4 type];

    if (v7 == 3)
    {
      uint64_t v8 = [(MKTransitInfoLabelView *)self font];
      objc_msgSend(v8, "_mapkit_lineHeight");
      double v10 = v9;

      id v11 = [MEMORY[0x1E4F42D90] mainScreen];
      [v11 nativeScale];
      double v12 = 1.0;
      if (v13 > 1.0)
      {
        id v14 = [MEMORY[0x1E4F42D90] mainScreen];
        [v14 nativeScale];
        double v12 = v15;
      }
      CGFloat v16 = 1.0 / v12;
      double v17 = [MEMORY[0x1E4F42D90] mainScreen];
      [v17 scale];
      CGFloat v19 = v18;
      v24.width = v16;
      v24.height = v10;
      UIGraphicsBeginImageContextWithOptions(v24, 0, v19);

      uint64_t v20 = [MEMORY[0x1E4F428B8] lightGrayColor];
      [v20 setFill];

      CurrentContext = UIGraphicsGetCurrentContext();
      v25.origin.y = v10 * 0.125;
      v25.size.height = v10 * 0.75;
      v25.origin.x = 0.0;
      v25.size.width = v16;
      CGContextFillRect(CurrentContext, v25);
      id v6 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (id)_imageForArtworkDataSource:(id)a3
{
  id v4 = a3;
  id v5 = [(MKTransitInfoLabelView *)self window];
  id v6 = [v5 screen];
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 scale];
    double v9 = v8;
  }
  else
  {
    double v10 = [MEMORY[0x1E4F42D90] mainScreen];
    [v10 scale];
    double v9 = v11;
  }
  int v12 = [v4 artworkSourceType];
  uint64_t v13 = 3;
  if (v12 == 2) {
    uint64_t v13 = 2;
  }
  uint64_t v14 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR___MKTransitInfoLabelView__hasCustomShieldSize[v13]);
  double v15 = [(MKTransitInfoLabelView *)self artworkCache];
  CGFloat v16 = objc_msgSend(v15, "imageForArtwork:size:featureType:scale:nightMode:", v4, v14, 2, -[UIView _mapkit_isDarkModeEnabled](self, "_mapkit_isDarkModeEnabled"), v9);

  return v16;
}

- (id)_imageForShieldDataSource:(id)a3
{
  id v4 = a3;
  id v5 = [(MKTransitInfoLabelView *)self window];
  id v6 = [v5 screen];
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 scale];
    double v9 = v8;
  }
  else
  {
    double v10 = [MEMORY[0x1E4F42D90] mainScreen];
    [v10 scale];
    double v9 = v11;
  }
  int v12 = [MKTransitArtwork alloc];
  uint64_t v13 = [v4 shieldText];
  uint64_t v14 = [(MKTransitArtwork *)v12 initWithShield:v4 accessibilityText:v13];

  double v15 = [(MKTransitInfoLabelView *)self artworkCache];
  CGFloat v16 = objc_msgSend(v15, "imageForArtwork:size:featureType:scale:nightMode:", v14, -[MKTransitInfoLabelView shieldSize](self, "shieldSize"), 2, -[UIView _mapkit_isDarkModeEnabled](self, "_mapkit_isDarkModeEnabled"), v9);

  return v16;
}

- (MKArtworkDataSourceCache)artworkCache
{
  artworkCache = self->_artworkCache;
  if (!artworkCache)
  {
    id v4 = +[MKArtworkDataSourceCache sharedInstance];
    id v5 = self->_artworkCache;
    self->_artworkCache = v4;

    artworkCache = self->_artworkCache;
  }

  return artworkCache;
}

+ (id)stringAttributesForFont:(id)a3 lineBreakMode:(int64_t)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F42678] defaultParagraphStyle];
  uint64_t v7 = (void *)[v6 mutableCopy];

  [v7 setLineSpacing:2.0];
  [v7 setLineBreakMode:a4];
  double v8 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v7 forKey:*MEMORY[0x1E4F42540]];
  double v9 = v8;
  if (v5) {
    [v8 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F42508]];
  }

  return v9;
}

- (void)setFont:(id)a3
{
}

- (void)_setFont:(id)a3 custom:(BOOL)a4
{
  if (a4) {
    self->_hasCustomFont = 1;
  }
  id v5 = a3;
  id v6 = [(MKTransitInfoLabelView *)self font];
  v9.receiver = self;
  v9.super_class = (Class)MKTransitInfoLabelView;
  [(MKTransitInfoLabelView *)&v9 setFont:v5];

  uint64_t v7 = [(MKTransitInfoLabelView *)self font];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0) {
    [(MKTransitInfoLabelView *)self _setupLabelInfo];
  }
}

- (void)_contentSizeCategoryDidChange
{
  if (!self->_hasCustomFont)
  {
    id v3 = +[MKFontManager sharedManager];
    id v4 = [v3 smallAttributionFont];
    [(MKTransitInfoLabelView *)self _setFont:v4 custom:0];
  }
  id v5 = [MEMORY[0x1E4F42738] sharedApplication];
  id v6 = [v5 preferredContentSizeCategory];

  if (!self->_hasCustomShieldSize) {
    self->_shieldSize = [(id)objc_opt_class() shieldSizeForContentSizeCategory:v6];
  }
  if (!self->_hasCustomIconSize) {
    self->_iconSize = [(id)objc_opt_class() iconSizeForContentSizeCategory:v6];
  }
  [(MKTransitInfoLabelView *)self _setupLabelInfo];
}

+ (int64_t)shieldSizeForContentSizeCategory:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x1E4F437A0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F43798]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F43790]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F43770]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F43768]] & 1) != 0)
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F43760]])
  {
    int64_t v4 = 6;
  }
  else
  {
    int64_t v4 = 5;
  }

  return v4;
}

+ (int64_t)iconSizeForContentSizeCategory:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x1E4F437A0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F43798]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F43790]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F43770]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F43768]] & 1) != 0)
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F43760]])
  {
    int64_t v4 = 6;
  }
  else
  {
    int64_t v4 = 3;
  }

  return v4;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (int64_t)shieldSize
{
  return self->_shieldSize;
}

- (NSArray)labelItems
{
  return self->_labelItems;
}

- (double)spaceBetweenShields
{
  return self->_spaceBetweenShields;
}

- (double)maxShieldHeight
{
  return self->_maxShieldHeight;
}

- (void)setMaxShieldHeight:(double)a3
{
  self->_maxShieldHeight = a3;
}

- (void)setArtworkCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkCache, 0);
  objc_storeStrong((id *)&self->_labelItems, 0);

  objc_storeStrong(&self->_textForTruncationGenerator, 0);
}

@end