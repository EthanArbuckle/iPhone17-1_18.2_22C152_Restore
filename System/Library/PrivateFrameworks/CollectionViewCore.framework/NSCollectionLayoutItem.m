@interface NSCollectionLayoutItem
+ (NSCollectionLayoutItem)itemWithLayoutSize:(NSCollectionLayoutSize *)layoutSize;
+ (NSCollectionLayoutItem)itemWithLayoutSize:(NSCollectionLayoutSize *)layoutSize supplementaryItems:(NSArray *)supplementaryItems;
+ (NSCollectionLayoutItem)itemWithSize:(id)a3 decorationItems:(id)a4;
- (BOOL)containsEstimatedSizeItem;
- (BOOL)containsItemWithAxesUniformAcrossSiblings;
- (BOOL)hasCustomGroupItemProvider;
- (BOOL)ignoresRTL;
- (BOOL)isAuxillary;
- (BOOL)isBackgroundDecoration;
- (BOOL)isCustomGroup;
- (BOOL)isDecoration;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroup;
- (BOOL)isSupplementary;
- (CGSize)_insetSizeForContainer:(id)a3 displayScale:(double)a4;
- (CVCDirectionalEdgeInsets)_effectiveContentInsets;
- (NSArray)decorationItems;
- (NSArray)supplementaryItems;
- (NSCollectionLayoutEdgeSpacing)edgeSpacing;
- (NSCollectionLayoutItem)initWithSize:(id)a3 contentInsets:(CVCDirectionalEdgeInsets)a4 edgeSpacing:(id)a5 supplementaryItems:(id)a6 decorationItems:(id)a7 name:(id)a8 identifier:(id)a9;
- (NSCollectionLayoutSize)layoutSize;
- (NSCollectionLayoutSize)size;
- (NSDirectionalEdgeInsets)contentInsets;
- (NSString)name;
- (NSUUID)identifier;
- (id)_externalDescription;
- (id)auxillaryItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_enumerateItemsWithHandler:(id)a3;
- (void)_enumerateSupplementaryItemsWithHandler:(id)a3;
- (void)setContentInsets:(NSDirectionalEdgeInsets)contentInsets;
- (void)setDecorationItems:(id)a3;
- (void)setEdgeSpacing:(NSCollectionLayoutEdgeSpacing *)edgeSpacing;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setSize:(id)a3;
- (void)setSupplementaryItems:(id)a3;
@end

@implementation NSCollectionLayoutItem

- (NSCollectionLayoutSize)layoutSize
{
  return self->_size;
}

+ (NSCollectionLayoutItem)itemWithSize:(id)a3 decorationItems:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v9 = +[NSCollectionLayoutEdgeSpacing defaultSpacing];
  v10 = [MEMORY[0x263F08C38] UUID];
  v11 = objc_msgSend(v8, "initWithSize:contentInsets:edgeSpacing:supplementaryItems:decorationItems:name:identifier:", v7, v9, MEMORY[0x263EFFA68], v6, 0, v10, 0.0, 0.0, 0.0, 0.0);

  return (NSCollectionLayoutItem *)v11;
}

- (BOOL)containsEstimatedSizeItem
{
  unsigned int itemFlags = self->_itemFlags;
  if ((itemFlags & 1) == 0)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__NSCollectionLayoutItem_containsEstimatedSizeItem__block_invoke;
    v8[3] = &unk_2640B2C08;
    v8[4] = self;
    [(NSCollectionLayoutItem *)self _enumerateItemsWithHandler:v8];
    $B58A67D313DA4EDD16236AB18C2D9045 v4 = self->_itemFlags;
    if ((*(unsigned char *)&v4 & 2) == 0)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __51__NSCollectionLayoutItem_containsEstimatedSizeItem__block_invoke_2;
      v7[3] = &unk_2640B2C30;
      v7[4] = self;
      [(NSCollectionLayoutItem *)self _enumerateSupplementaryItemsWithHandler:v7];
      $B58A67D313DA4EDD16236AB18C2D9045 v4 = self->_itemFlags;
    }
    unsigned int itemFlags = *(_DWORD *)&v4 | 1;
    *(unsigned char *)&self->_unsigned int itemFlags = itemFlags;
  }
  return (itemFlags >> 1) & 1;
}

- (void)_enumerateSupplementaryItemsWithHandler:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  $B58A67D313DA4EDD16236AB18C2D9045 v4 = (void (**)(id, void, char *))a3;
  char v25 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = [(NSCollectionLayoutItem *)self supplementaryItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v21 + 1) + 8 * v9), &v25);
      if (v25) {
        goto LABEL_17;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if ([(NSCollectionLayoutItem *)self isGroup])
  {
    v5 = [(NSCollectionLayoutItem *)self subitems];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v10 = [v5 countByEnumeratingWithState:&v17 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v5);
          }
          v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = __66__NSCollectionLayoutItem__enumerateSupplementaryItemsWithHandler___block_invoke;
          v15[3] = &unk_2640B2C58;
          v16 = v4;
          [v14 _enumerateSupplementaryItemsWithHandler:v15];
        }
        uint64_t v11 = [v5 countByEnumeratingWithState:&v17 objects:v26 count:16];
      }
      while (v11);
    }
LABEL_17:
  }
}

- (BOOL)hasCustomGroupItemProvider
{
  if (![(NSCollectionLayoutItem *)self isGroup]) {
    return 0;
  }
  v3 = [(NSCollectionLayoutItem *)self customGroupItemProvider];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (NSCollectionLayoutItem)itemWithLayoutSize:(NSCollectionLayoutSize *)layoutSize
{
  BOOL v4 = layoutSize;
  id v5 = objc_alloc((Class)a1);
  uint64_t v6 = +[NSCollectionLayoutEdgeSpacing defaultSpacing];
  uint64_t v7 = [MEMORY[0x263F08C38] UUID];
  uint64_t v8 = objc_msgSend(v5, "initWithSize:contentInsets:edgeSpacing:supplementaryItems:decorationItems:name:identifier:", v4, v6, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], 0, v7, 0.0, 0.0, 0.0, 0.0);

  return (NSCollectionLayoutItem *)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorationItems, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_supplementaryItems, 0);
  objc_storeStrong((id *)&self->_edgeSpacing, 0);
}

- (void)_enumerateItemsWithHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(id, NSCollectionLayoutItem *, unsigned char *))a3;
  char v17 = 0;
  v4[2](v4, self, &v17);
  if (!v17 && [(NSCollectionLayoutItem *)self isGroup])
  {
    id v5 = [(NSCollectionLayoutItem *)self subitems];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v11[0] = MEMORY[0x263EF8330];
          v11[1] = 3221225472;
          v11[2] = __53__NSCollectionLayoutItem__enumerateItemsWithHandler___block_invoke;
          v11[3] = &unk_2640B2C80;
          uint64_t v12 = v4;
          [v10 _enumerateItemsWithHandler:v11];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)isGroup
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(NSCollectionLayoutItem *)self size];
  [(NSCollectionLayoutItem *)self contentInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  long long v14 = [(NSCollectionLayoutItem *)self edgeSpacing];
  long long v15 = [(NSCollectionLayoutItem *)self supplementaryItems];
  long long v16 = [(NSCollectionLayoutItem *)self decorationItems];
  char v17 = [(NSCollectionLayoutItem *)self name];
  long long v18 = [MEMORY[0x263F08C38] UUID];
  uint64_t v19 = objc_msgSend(v4, "initWithSize:contentInsets:edgeSpacing:supplementaryItems:decorationItems:name:identifier:", v5, v14, v15, v16, v17, v18, v7, v9, v11, v13);

  return v19;
}

- (NSString)name
{
  return self->_name;
}

uint64_t __53__NSCollectionLayoutItem__enumerateItemsWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSCollectionLayoutItem)initWithSize:(id)a3 contentInsets:(CVCDirectionalEdgeInsets)a4 edgeSpacing:(id)a5 supplementaryItems:(id)a6 decorationItems:(id)a7 name:(id)a8 identifier:(id)a9
{
  double trailing = a4.trailing;
  double bottom = a4.bottom;
  double leading = a4.leading;
  double top = a4.top;
  id v19 = a3;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  v37.receiver = self;
  v37.super_class = (Class)NSCollectionLayoutItem;
  char v25 = [(NSCollectionLayoutItem *)&v37 init];
  if (v25)
  {
    uint64_t v26 = [v19 copy];
    size = v25->_size;
    v25->_size = (NSCollectionLayoutSize *)v26;

    uint64_t v28 = [v20 copy];
    edgeSpacing = v25->_edgeSpacing;
    v25->_edgeSpacing = (NSCollectionLayoutEdgeSpacing *)v28;

    uint64_t v30 = [v21 copy];
    supplementaryItems = v25->_supplementaryItems;
    v25->_supplementaryItems = (NSArray *)v30;

    uint64_t v32 = [v22 copy];
    decorationItems = v25->_decorationItems;
    v25->_decorationItems = (NSArray *)v32;

    uint64_t v34 = [v23 copy];
    name = v25->_name;
    v25->_name = (NSString *)v34;

    objc_storeStrong((id *)&v25->_identifier, a9);
    -[NSCollectionLayoutItem setContentInsets:](v25, "setContentInsets:", top, leading, bottom, trailing);
  }

  return v25;
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)contentInsets
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  self->_contentInsets = (CVCDirectionalEdgeInsets)contentInsets;
  if (contentInsets.leading != 0.0
    || contentInsets.top != 0.0
    || contentInsets.trailing != 0.0
    || contentInsets.bottom != 0.0)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __43__NSCollectionLayoutItem_setContentInsets___block_invoke;
    v9[3] = &unk_2640B2BE0;
    v9[4] = self;
    NSDirectionalEdgeInsets v10 = contentInsets;
    BOOL v4 = (uint64_t (**)(void, void))MEMORY[0x21053FCB0](v9, a2);
    char v5 = v4[2](v4, 2);
    int v6 = v4[2](v4, 1);
    if ((v5 & 1) != 0 || v6)
    {
      double v7 = _compLayoutLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        double v8 = [(NSCollectionLayoutItem *)self _externalDescription];
        *(_DWORD *)buf = 138412290;
        double v12 = v8;
        _os_log_error_impl(&dword_20BE1D000, v7, OS_LOG_TYPE_ERROR, "Attempting to add contentInsets to an item's dimension along an estimated axis. Insets along any estimated axes will be ignored. Use the item's edgeSpacing or the containing group's interItemSpacing instead. Item: %@", buf, 0xCu);
      }
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (NSCollectionLayoutItem *)a3;
  if (self == v4)
  {
    char v16 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  [(NSCollectionLayoutItem *)self contentInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(NSCollectionLayoutItem *)v4 contentInsets];
  char v16 = 0;
  if (v8 == v17 && v6 == v13 && v12 == v15 && v10 == v14)
  {
    long long v18 = [(NSCollectionLayoutItem *)self edgeSpacing];
    id v19 = [(NSCollectionLayoutItem *)v4 edgeSpacing];
    int v20 = __objectEqual(v18, v19);

    if (v20)
    {
      id v21 = [(NSCollectionLayoutItem *)self supplementaryItems];
      id v22 = [(NSCollectionLayoutItem *)v4 supplementaryItems];
      int v23 = __objectEqual(v21, v22);

      if (v23)
      {
        id v24 = [(NSCollectionLayoutItem *)self decorationItems];
        char v25 = [(NSCollectionLayoutItem *)v4 decorationItems];
        int v26 = __objectEqual(v24, v25);

        if (v26)
        {
          v27 = [(NSCollectionLayoutItem *)self size];
          uint64_t v28 = [(NSCollectionLayoutItem *)v4 size];
          char v16 = __objectEqual(v27, v28);

          goto LABEL_13;
        }
      }
    }
LABEL_11:
    char v16 = 0;
  }
LABEL_13:

  return v16;
}

- (NSCollectionLayoutEdgeSpacing)edgeSpacing
{
  return self->_edgeSpacing;
}

- (NSArray)supplementaryItems
{
  return self->_supplementaryItems;
}

- (NSArray)decorationItems
{
  return self->_decorationItems;
}

- (CVCDirectionalEdgeInsets)_effectiveContentInsets
{
  v3 = [(NSCollectionLayoutItem *)self size];
  char v4 = [v3 _isEstimatedForAxis:2];
  char v5 = [v3 _isEstimatedForAxis:1];
  [(NSCollectionLayoutItem *)self contentInsets];
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  if ((v4 & 1) == 0)
  {
    _CVCDirectionalInsetsForInsetsAlongAxis(2);
    double v7 = v11;
    double v8 = v12;
    double v9 = v13;
    double v10 = v14;
  }
  double v15 = 0.0;
  double v16 = 0.0;
  double v17 = 0.0;
  if ((v5 & 1) == 0)
  {
    _CVCDirectionalInsetsForInsetsAlongAxis(1);
    double v6 = v18;
  }
  double v19 = v7 + v6;
  double v20 = v8 + v15;
  double v21 = v9 + v16;
  double v22 = v10 + v17;

  double v23 = v19;
  double v24 = v20;
  double v25 = v21;
  double v26 = v22;
  result.double trailing = v26;
  result.double bottom = v25;
  result.double leading = v24;
  result.double top = v23;
  return result;
}

- (NSCollectionLayoutSize)size
{
  return self->_size;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double leading = self->_contentInsets.leading;
  double bottom = self->_contentInsets.bottom;
  double trailing = self->_contentInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

void __51__NSCollectionLayoutItem_containsEstimatedSizeItem__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  char v5 = [a2 size];
  int v6 = [v5 isEstimated];

  if (v6)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 8) |= 2u;
    *a3 = 1;
  }
}

BOOL __43__NSCollectionLayoutItem_setContentInsets___block_invoke(uint64_t a1, uint64_t a2)
{
  char v4 = [*(id *)(a1 + 32) size];
  int v5 = [v4 _isEstimatedForAxis:a2];

  return v5
      && fabs(_CVCTotalEdgeDimensionsForLayoutAxis(a2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64))) >= 2.22044605e-16;
}

- (id)_externalDescription
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@ %p size=%@>", objc_opt_class(), self, self->_size];
  double top = self->_contentInsets.top;
  double leading = self->_contentInsets.leading;
  double bottom = self->_contentInsets.bottom;
  if (leading != 0.0 || top != 0.0 || self->_contentInsets.trailing != 0.0 || bottom != 0.0)
  {
    double v7 = (__CFString *)CFStringCreateWithFormat(0, 0, @"{%.*g, %.*g, %.*g, %.*g}", 17, *(void *)&top, 17, *(void *)&leading, 17, *(void *)&bottom, 17, *(void *)&self->_contentInsets.trailing);
    [v3 appendFormat:@"\n\tcontentInsets=%@", v7];
  }
  if ([(NSCollectionLayoutEdgeSpacing *)self->_edgeSpacing _hasSpacing])
  {
    double v8 = [(NSCollectionLayoutEdgeSpacing *)self->_edgeSpacing _externalDescription];
    [v3 appendFormat:@"\n\tedgeSpacing=%@", v8];
  }
  v27 = v3;
  if ([(NSArray *)self->_supplementaryItems count])
  {
    double v9 = [MEMORY[0x263F089D8] stringWithString:@"\n\tsupplementaryItems="];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    double v26 = self;
    double v10 = self->_supplementaryItems;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = [*(id *)(*((void *)&v32 + 1) + 8 * i) _externalDescription];
          double v16 = [v15 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
          [v9 appendFormat:@"\n\t\t%@", v16];
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v12);
    }

    v3 = v27;
    [v27 appendString:v9];

    self = v26;
  }
  if ([(NSArray *)self->_decorationItems count])
  {
    double v17 = [MEMORY[0x263F089D8] stringWithString:@"\n\tdecorationItems="];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    double v18 = self->_decorationItems;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          double v23 = [*(id *)(*((void *)&v28 + 1) + 8 * j) _externalDescription];
          double v24 = [v23 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
          [v17 appendFormat:@"\n\t\t%@", v24];
        }
        uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v20);
    }

    v3 = v27;
    [v27 appendString:v17];
  }
  return v3;
}

- (void)setSize:(id)a3
{
}

- (void)setEdgeSpacing:(NSCollectionLayoutEdgeSpacing *)edgeSpacing
{
}

+ (NSCollectionLayoutItem)itemWithLayoutSize:(NSCollectionLayoutSize *)layoutSize supplementaryItems:(NSArray *)supplementaryItems
{
  int v6 = supplementaryItems;
  double v7 = layoutSize;
  id v8 = objc_alloc((Class)a1);
  double v9 = +[NSCollectionLayoutEdgeSpacing defaultSpacing];
  double v10 = [MEMORY[0x263F08C38] UUID];
  uint64_t v11 = objc_msgSend(v8, "initWithSize:contentInsets:edgeSpacing:supplementaryItems:decorationItems:name:identifier:", v7, v9, v6, MEMORY[0x263EFFA68], 0, v10, 0.0, 0.0, 0.0, 0.0);

  return (NSCollectionLayoutItem *)v11;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@ %p; name=%@; size=%@;\n\t edgeSpacing=%@;\n\t identfier=%@;\n\t contentInsets={%g,%g,%g,%g}>",
               objc_opt_class(),
               self,
               self->_name,
               self->_size,
               self->_edgeSpacing,
               self->_identifier,
               *(void *)&self->_contentInsets.top,
               *(void *)&self->_contentInsets.leading,
               *(void *)&self->_contentInsets.bottom,
               *(void *)&self->_contentInsets.trailing);
}

void __51__NSCollectionLayoutItem_containsEstimatedSizeItem__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  int v5 = [a2 size];
  int v6 = [v5 isEstimated];

  if (v6)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 8) |= 2u;
    *a3 = 1;
  }
}

- (BOOL)containsItemWithAxesUniformAcrossSiblings
{
  unsigned int itemFlags = self->_itemFlags;
  if ((itemFlags & 4) == 0)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __67__NSCollectionLayoutItem_containsItemWithAxesUniformAcrossSiblings__block_invoke;
    v6[3] = &unk_2640B2C08;
    v6[4] = self;
    [(NSCollectionLayoutItem *)self _enumerateItemsWithHandler:v6];
    unsigned int itemFlags = *(unsigned char *)&self->_itemFlags | 4;
    *(unsigned char *)&self->_itemFlags |= 4u;
  }
  return (itemFlags >> 3) & 1;
}

void __67__NSCollectionLayoutItem_containsItemWithAxesUniformAcrossSiblings__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  int v5 = [a2 size];
  uint64_t v6 = [v5 _axesUniformAcrossSiblings];

  if (v6)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 8) |= 8u;
    *a3 = 1;
  }
}

uint64_t __66__NSCollectionLayoutItem__enumerateSupplementaryItemsWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGSize)_insetSizeForContainer:(id)a3 displayScale:(double)a4
{
  id v6 = a3;
  double v7 = [(NSCollectionLayoutItem *)self size];
  [v7 _effectiveSizeForContainer:v6 displayScale:0 ignoringInsets:a4];
  double v9 = v8;
  double v11 = v10;

  [(NSCollectionLayoutItem *)self _effectiveContentInsets];
  if (v13 >= 0.5) {
    double v16 = 1.0;
  }
  else {
    double v16 = v9;
  }
  double v17 = v13 * v16;
  if (v15 >= 0.5) {
    double v18 = 1.0;
  }
  else {
    double v18 = v9;
  }
  double v19 = v15 * v18;
  if (v12 >= 0.5) {
    double v20 = 1.0;
  }
  else {
    double v20 = v11;
  }
  double v21 = v12 * v20;
  if (v14 >= 0.5) {
    double v22 = 1.0;
  }
  else {
    double v22 = v11;
  }
  double v23 = v14 * v22;
  double v24 = v9 - (v17 + v19);
  double v25 = v11 - (v21 + v23);
  result.height = v25;
  result.width = v24;
  return result;
}

- (BOOL)isCustomGroup
{
  BOOL v3 = [(NSCollectionLayoutItem *)self isGroup];
  if (v3)
  {
    LOBYTE(v3) = [(NSCollectionLayoutItem *)self hasCustomGroupItemProvider];
  }
  return v3;
}

- (BOOL)isAuxillary
{
  if ([(NSCollectionLayoutItem *)self isDecoration]) {
    return 1;
  }
  return [(NSCollectionLayoutItem *)self isSupplementary];
}

- (BOOL)isSupplementary
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isDecoration
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isBackgroundDecoration
{
  return 0;
}

- (id)auxillaryItems
{
  supplementaryItems = self->_supplementaryItems;
  if (!supplementaryItems) {
    supplementaryItems = (NSArray *)MEMORY[0x263EFFA68];
  }
  if (self->_decorationItems) {
    decorationItems = self->_decorationItems;
  }
  else {
    decorationItems = (NSArray *)MEMORY[0x263EFFA68];
  }
  char v4 = supplementaryItems;
  int v5 = [(NSArray *)v4 arrayByAddingObjectsFromArray:decorationItems];

  return v5;
}

- (BOOL)ignoresRTL
{
  BOOL v3 = [(NSCollectionLayoutItem *)self isGroup];
  if (v3) {
    LOBYTE(v3) = [(NSCollectionLayoutItem *)self groupOptions] & 1;
  }
  return v3;
}

- (void)setSupplementaryItems:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setDecorationItems:(id)a3
{
}

@end