@interface NSCollectionLayoutGroup
+ (NSCollectionLayoutGroup)customGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize itemProvider:(NSCollectionLayoutGroupCustomItemProvider)itemProvider;
+ (NSCollectionLayoutGroup)horizontalGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize repeatingSubitem:(NSCollectionLayoutItem *)subitem count:(NSInteger)count;
+ (NSCollectionLayoutGroup)horizontalGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize subitem:(NSCollectionLayoutItem *)subitem count:(NSInteger)count;
+ (NSCollectionLayoutGroup)horizontalGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize subitems:(NSArray *)subitems;
+ (NSCollectionLayoutGroup)layoutGroupWithSize:(id)a3 visualFormats:(id)a4 itemProvider:(id)a5;
+ (NSCollectionLayoutGroup)verticalGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize repeatingSubitem:(NSCollectionLayoutItem *)subitem count:(NSInteger)count;
+ (NSCollectionLayoutGroup)verticalGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize subitem:(NSCollectionLayoutItem *)subitem count:(NSInteger)count;
+ (NSCollectionLayoutGroup)verticalGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize subitems:(NSArray *)subitems;
+ (id)_effectiveCopiedSubitemsForSubitems:(id)a3 count:(int64_t)a4 layoutDirection:(int64_t)a5;
+ (id)_effectiveSizeForSize:(id)a3 count:(int64_t)a4 layoutDirection:(int64_t)a5;
+ (id)horizontalGroupWithSize:(id)a3 subitemsProvider:(id)a4;
+ (id)verticalGroupWithSize:(id)a3 subitemsProvider:(id)a4;
- (BOOL)_hasDecorationItemRequiringRegistration;
- (BOOL)_isListSolverCompatibleForLayoutAxis:(unint64_t)a3;
- (BOOL)hasItemProvider;
- (BOOL)hasVisualFormat;
- (BOOL)isCustomGroup;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHorizontalGroup;
- (BOOL)isVerticalGroup;
- (NSArray)subitems;
- (NSArray)visualFormats;
- (NSCollectionLayoutGroup)initWithSize:(id)a3 subitems:(id)a4 count:(int64_t)a5 interItemSpacing:(id)a6 contentInsets:(CVCDirectionalEdgeInsets)a7 edgeSpacing:(id)a8 layoutDirection:(int64_t)a9 supplementaryItems:(id)a10 customGroupItemProvider:(id)a11 name:(id)a12 identifier:(id)a13;
- (NSCollectionLayoutGroup)initWithSize:(id)a3 subitems:(id)a4 count:(int64_t)a5 interItemSpacing:(id)a6 contentInsets:(CVCDirectionalEdgeInsets)a7 edgeSpacing:(id)a8 layoutDirection:(int64_t)a9 supplementaryItems:(id)a10 visualFormats:(id)a11 itemsProvider:(id)a12 visualFormatItemProvider:(id)a13 customGroupItemProvider:(id)a14 options:(int64_t)a15 name:(id)a16 identifier:(id)a17;
- (NSCollectionLayoutSpacing)interItemSpacing;
- (id)_externalDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customGroupItemProvider;
- (id)description;
- (id)itemsProvider;
- (id)visualFormatItemProvider;
- (int64_t)count;
- (int64_t)groupOptions;
- (int64_t)layoutDirection;
- (unint64_t)layoutAxis;
- (void)setCount:(int64_t)a3;
- (void)setCustomGroupItemProvider:(id)a3;
- (void)setInterItemSpacing:(NSCollectionLayoutSpacing *)interItemSpacing;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setSubitems:(id)a3;
- (void)set_hasDecorationItemRequiringRegistration:(BOOL)a3;
@end

@implementation NSCollectionLayoutGroup

- (void).cxx_destruct
{
  objc_storeStrong(&self->_visualFormatItemProvider, 0);
  objc_storeStrong(&self->_itemsProvider, 0);
  objc_storeStrong((id *)&self->_visualFormats, 0);
  objc_storeStrong(&self->_customGroupItemProvider, 0);
  objc_storeStrong((id *)&self->_subitems, 0);
  objc_storeStrong((id *)&self->_interItemSpacing, 0);
}

- (BOOL)_isListSolverCompatibleForLayoutAxis:(unint64_t)a3
{
  if (a3 - 1 <= 1)
  {
    v5 = [(NSCollectionLayoutGroup *)self subitems];
    uint64_t v6 = [v5 count];

    if (v6 == 1 && ![(NSCollectionLayoutGroup *)self isCustomGroup])
    {
      if (a3 == 1) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = a3 == 2;
      }
      v10 = [(NSCollectionLayoutGroup *)self subitems];
      v11 = [v10 firstObject];

      char v12 = [v11 isGroup];
      v13 = [v11 size];
      char v14 = [v13 _isEstimatedForAxis:v9];

      v15 = [v11 size];
      v16 = v15;
      if (a3 == 2) {
        [v15 widthDimension];
      }
      else {
      v17 = [v15 heightDimension];
      }

      [v17 dimension];
      if (v18 > 0.5 && ([v17 dimension], v19 <= 1.0))
      {
        char v20 = 1;
        if (v12) {
          goto LABEL_15;
        }
      }
      else
      {
        char v20 = 0;
        if (v12)
        {
LABEL_15:
          char v7 = 0;
LABEL_18:

          return v7;
        }
      }
      char v7 = v20 & (v14 ^ 1);
      goto LABEL_18;
    }
  }
  return 0;
}

- (BOOL)isHorizontalGroup
{
  return ![(NSCollectionLayoutGroup *)self isCustomGroup]
      && [(NSCollectionLayoutGroup *)self layoutDirection] == 2;
}

- (BOOL)isVerticalGroup
{
  return ![(NSCollectionLayoutGroup *)self isCustomGroup]
      && [(NSCollectionLayoutGroup *)self layoutDirection] == 1;
}

+ (NSCollectionLayoutGroup)verticalGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize subitems:(NSArray *)subitems
{
  uint64_t v6 = subitems;
  char v7 = layoutSize;
  id v8 = objc_alloc((Class)a1);
  uint64_t v9 = +[NSCollectionLayoutSpacing defaultSpacing];
  v10 = +[NSCollectionLayoutEdgeSpacing defaultSpacing];
  v11 = [MEMORY[0x263F08C38] UUID];
  char v12 = objc_msgSend(v8, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:", v7, v6, 0, v9, v10, 1, 0.0, 0.0, 0.0, 0.0, MEMORY[0x263EFFA68], 0, 0, v11);

  return (NSCollectionLayoutGroup *)v12;
}

+ (NSCollectionLayoutGroup)horizontalGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize subitems:(NSArray *)subitems
{
  uint64_t v6 = subitems;
  char v7 = layoutSize;
  id v8 = objc_alloc((Class)a1);
  uint64_t v9 = +[NSCollectionLayoutSpacing defaultSpacing];
  v10 = +[NSCollectionLayoutEdgeSpacing defaultSpacing];
  v11 = [MEMORY[0x263F08C38] UUID];
  char v12 = objc_msgSend(v8, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:", v7, v6, 0, v9, v10, 2, 0.0, 0.0, 0.0, 0.0, MEMORY[0x263EFFA68], 0, 0, v11);

  return (NSCollectionLayoutGroup *)v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NSCollectionLayoutGroup *)a3;
  if (self == v4)
  {
    BOOL v26 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_13;
    }
    int64_t v5 = [(NSCollectionLayoutGroup *)self count];
    if (v5 != [(NSCollectionLayoutGroup *)v4 count]) {
      goto LABEL_13;
    }
    int64_t v6 = [(NSCollectionLayoutGroup *)self layoutDirection];
    if (v6 != [(NSCollectionLayoutGroup *)v4 layoutDirection]) {
      goto LABEL_13;
    }
    char v7 = [(NSCollectionLayoutGroup *)self customGroupItemProvider];
    id v8 = [(NSCollectionLayoutGroup *)v4 customGroupItemProvider];
    char v9 = (v7 == 0) ^ (v8 == 0);

    if (v9) {
      goto LABEL_13;
    }
    v10 = [(NSCollectionLayoutGroup *)self interItemSpacing];
    v11 = [(NSCollectionLayoutGroup *)v4 interItemSpacing];
    int v12 = __objectEqual(v10, v11);

    if (!v12) {
      goto LABEL_13;
    }
    v13 = [(NSCollectionLayoutGroup *)self subitems];
    char v14 = [(NSCollectionLayoutGroup *)v4 subitems];
    int v15 = __objectEqual(v13, v14);

    if (!v15) {
      goto LABEL_13;
    }
    int64_t v16 = [(NSCollectionLayoutGroup *)self groupOptions];
    if (v16 != [(NSCollectionLayoutGroup *)v4 groupOptions]) {
      goto LABEL_13;
    }
    v17 = [(NSCollectionLayoutGroup *)self itemsProvider];
    double v18 = [(NSCollectionLayoutGroup *)v4 itemsProvider];
    char v19 = (v17 == 0) ^ (v18 == 0);

    if (v19) {
      goto LABEL_13;
    }
    char v20 = [(NSCollectionLayoutGroup *)self visualFormatItemProvider];
    v21 = [(NSCollectionLayoutGroup *)v4 visualFormatItemProvider];
    char v22 = (v20 == 0) ^ (v21 == 0);

    if (v22) {
      goto LABEL_13;
    }
    v23 = [(NSCollectionLayoutGroup *)self visualFormats];
    v24 = [(NSCollectionLayoutGroup *)v4 visualFormats];
    int v25 = __objectEqual(v23, v24);

    if (v25)
    {
      v28.receiver = self;
      v28.super_class = (Class)NSCollectionLayoutGroup;
      BOOL v26 = [(NSCollectionLayoutItem *)&v28 isEqual:v4];
    }
    else
    {
LABEL_13:
      BOOL v26 = 0;
    }
  }

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v5 = [(NSCollectionLayoutItem *)self size];
  v33 = [(NSCollectionLayoutGroup *)self subitems];
  int64_t v32 = [(NSCollectionLayoutGroup *)self count];
  int64_t v6 = [(NSCollectionLayoutGroup *)self interItemSpacing];
  [(NSCollectionLayoutItem *)self contentInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  int v15 = [(NSCollectionLayoutItem *)self edgeSpacing];
  int64_t v16 = [(NSCollectionLayoutGroup *)self layoutDirection];
  v17 = [(NSCollectionLayoutItem *)self supplementaryItems];
  double v18 = [(NSCollectionLayoutGroup *)self customGroupItemProvider];
  char v19 = [(NSCollectionLayoutItem *)self name];
  char v20 = [(NSCollectionLayoutItem *)self identifier];
  v21 = objc_msgSend(v4, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:", v5, v33, v32, v6, v15, v16, v8, v10, v12, v14, v17, v18, v19, v20);

  v21[21] = [(NSCollectionLayoutGroup *)self groupOptions];
  char v22 = [(NSCollectionLayoutGroup *)self visualFormats];
  uint64_t v23 = [v22 copy];
  v24 = (void *)v21[18];
  v21[18] = v23;

  int v25 = [(NSCollectionLayoutGroup *)self itemsProvider];
  uint64_t v26 = [v25 copy];
  v27 = (void *)v21[19];
  v21[19] = v26;

  objc_super v28 = [(NSCollectionLayoutGroup *)self visualFormatItemProvider];
  uint64_t v29 = [v28 copy];
  v30 = (void *)v21[20];
  v21[20] = v29;

  return v21;
}

- (NSCollectionLayoutSpacing)interItemSpacing
{
  return self->_interItemSpacing;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (NSArray)subitems
{
  return self->_subitems;
}

- (int64_t)count
{
  return self->_count;
}

- (NSArray)visualFormats
{
  return self->_visualFormats;
}

- (id)visualFormatItemProvider
{
  return self->_visualFormatItemProvider;
}

- (id)itemsProvider
{
  return self->_itemsProvider;
}

- (int64_t)groupOptions
{
  return self->_groupOptions;
}

- (BOOL)isCustomGroup
{
  v2 = [(NSCollectionLayoutGroup *)self customGroupItemProvider];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)customGroupItemProvider
{
  return self->_customGroupItemProvider;
}

- (NSCollectionLayoutGroup)initWithSize:(id)a3 subitems:(id)a4 count:(int64_t)a5 interItemSpacing:(id)a6 contentInsets:(CVCDirectionalEdgeInsets)a7 edgeSpacing:(id)a8 layoutDirection:(int64_t)a9 supplementaryItems:(id)a10 customGroupItemProvider:(id)a11 name:(id)a12 identifier:(id)a13
{
  double trailing = a7.trailing;
  double bottom = a7.bottom;
  double leading = a7.leading;
  double top = a7.top;
  id v22 = a3;
  id v23 = a4;
  id v24 = a6;
  id v25 = a8;
  id v26 = a10;
  id v27 = a11;
  id v28 = a12;
  id v29 = a13;
  if (v22)
  {
    if (v27) {
      goto LABEL_8;
    }
  }
  else
  {
    v39 = [MEMORY[0x263F08690] currentHandler];
    [v39 handleFailureInMethod:a2 object:self file:@"NSCollectionLayoutItem.m" lineNumber:483 description:@"A size is required."];

    if (v27) {
      goto LABEL_8;
    }
  }
  if (![v23 count])
  {
    v40 = [MEMORY[0x263F08690] currentHandler];
    [v40 handleFailureInMethod:a2 object:self file:@"NSCollectionLayoutItem.m" lineNumber:486 description:@"At least 1 subitem is required for a group"];
  }
  if (a5 >= 1 && [v23 count] != 1)
  {
    v41 = [MEMORY[0x263F08690] currentHandler];
    v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
    [v41 handleFailureInMethod:a2, self, @"NSCollectionLayoutItem.m", 489, @"A single item is required for a repeating item group, %@ were supplied", v38 object file lineNumber description];
  }
LABEL_8:
  v44.receiver = self;
  v44.super_class = (Class)NSCollectionLayoutGroup;
  v30 = -[NSCollectionLayoutItem initWithSize:contentInsets:edgeSpacing:supplementaryItems:decorationItems:name:identifier:](&v44, sel_initWithSize_contentInsets_edgeSpacing_supplementaryItems_decorationItems_name_identifier_, v22, v25, v26, MEMORY[0x263EFFA68], v28, v29, top, leading, bottom, trailing);
  if (v30)
  {
    uint64_t v31 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v23 copyItems:1];
    subitems = v30->_subitems;
    v30->_subitems = (NSArray *)v31;

    v30->_count = a5;
    uint64_t v33 = [v24 copy];
    interItemSpacing = v30->_interItemSpacing;
    v30->_interItemSpacing = (NSCollectionLayoutSpacing *)v33;

    v30->_layoutDirection = a9;
    uint64_t v35 = [v27 copy];
    id customGroupItemProvider = v30->_customGroupItemProvider;
    v30->_id customGroupItemProvider = (id)v35;
  }
  return v30;
}

void __66__NSCollectionLayoutGroup__hasDecorationItemRequiringRegistration__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int64_t v5 = objc_msgSend(a2, "decorationItems", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * v9) _registrationViewClass])
        {
          *(unsigned char *)(*(void *)(a1 + 32) + 97) = 1;
          *a3 = 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_externalDescription
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)NSCollectionLayoutGroup;
  double v18 = [(NSCollectionLayoutItem *)&v23 _externalDescription];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v17 = self;
  v4 = self->_subitems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v19 + 1) + 8 * i) _externalDescription];
        long long v10 = [v9 stringByReplacingOccurrencesOfString:@"\n\t" withString:@"\n\t\t"];

        [v3 appendFormat:@"\n\t\t %@", v10];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  if (v17->_customGroupItemProvider)
  {
    long long v11 = (void *)MEMORY[0x21053FCB0]();
    [v3 appendFormat:@"\n\t customGroupItemProvider: %@", v11];
  }
  unint64_t layoutDirection = v17->_layoutDirection;
  if (layoutDirection > 2) {
    long long v13 = &stru_26C0F8F98;
  }
  else {
    long long v13 = off_2640B2D80[layoutDirection];
  }
  double v14 = [(NSCollectionLayoutSpacing *)v17->_interItemSpacing _externalDescription];
  uint64_t v15 = [v18 stringByAppendingFormat:@"\n\t layoutDirection: %@\n\t interItemSpacing=%@\n\t subitems=%@", v13, v14, v3];

  return v15;
}

+ (NSCollectionLayoutGroup)verticalGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize subitem:(NSCollectionLayoutItem *)subitem count:(NSInteger)count
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = layoutSize;
  long long v10 = subitem;
  if (count <= 0)
  {
    long long v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2 object:a1 file:@"NSCollectionLayoutItem.m" lineNumber:725 description:@"A repeating vertical group should specify a count >= 1"];
  }
  v20[0] = v10;
  long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  long long v12 = [a1 _effectiveCopiedSubitemsForSubitems:v11 count:count layoutDirection:1];

  id v13 = objc_alloc((Class)a1);
  double v14 = +[NSCollectionLayoutSpacing defaultSpacing];
  uint64_t v15 = +[NSCollectionLayoutEdgeSpacing defaultSpacing];
  int64_t v16 = [MEMORY[0x263F08C38] UUID];
  v17 = objc_msgSend(v13, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:", v9, v12, count, v14, v15, 1, 0.0, 0.0, 0.0, 0.0, MEMORY[0x263EFFA68], 0, 0, v16);

  return (NSCollectionLayoutGroup *)v17;
}

+ (NSCollectionLayoutGroup)horizontalGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize repeatingSubitem:(NSCollectionLayoutItem *)subitem count:(NSInteger)count
{
  v22[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = layoutSize;
  long long v10 = subitem;
  long long v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"NSCollectionLayoutItem.m", 531, @"Invalid parameter not satisfying: %@", @"layoutSize != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  long long v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2, a1, @"NSCollectionLayoutItem.m", 532, @"Invalid parameter not satisfying: %@", @"subitem != nil" object file lineNumber description];

LABEL_3:
  if (count <= 0)
  {
    long long v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2 object:a1 file:@"NSCollectionLayoutItem.m" lineNumber:533 description:@"A repeating horizontal group should specify a count >= 1"];
  }
  id v12 = objc_alloc((Class)a1);
  v22[0] = v11;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  double v14 = +[NSCollectionLayoutSpacing defaultSpacing];
  uint64_t v15 = +[NSCollectionLayoutEdgeSpacing defaultSpacing];
  int64_t v16 = [MEMORY[0x263F08C38] UUID];
  v17 = objc_msgSend(v12, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:", v9, v13, count, v14, v15, 2, 0.0, 0.0, 0.0, 0.0, MEMORY[0x263EFFA68], 0, 0, v16);

  return (NSCollectionLayoutGroup *)v17;
}

+ (NSCollectionLayoutGroup)horizontalGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize subitem:(NSCollectionLayoutItem *)subitem count:(NSInteger)count
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = layoutSize;
  long long v10 = subitem;
  if (count <= 0)
  {
    long long v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2 object:a1 file:@"NSCollectionLayoutItem.m" lineNumber:707 description:@"A repeating horizontal group should specify a count >= 1"];
  }
  v20[0] = v10;
  long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  id v12 = [a1 _effectiveCopiedSubitemsForSubitems:v11 count:count layoutDirection:2];

  id v13 = objc_alloc((Class)a1);
  double v14 = +[NSCollectionLayoutSpacing defaultSpacing];
  uint64_t v15 = +[NSCollectionLayoutEdgeSpacing defaultSpacing];
  int64_t v16 = [MEMORY[0x263F08C38] UUID];
  v17 = objc_msgSend(v13, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:", v9, v12, count, v14, v15, 2, 0.0, 0.0, 0.0, 0.0, MEMORY[0x263EFFA68], 0, 0, v16);

  return (NSCollectionLayoutGroup *)v17;
}

+ (id)_effectiveCopiedSubitemsForSubitems:(id)a3 count:(int64_t)a4 layoutDirection:(int64_t)a5
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = (objc_class *)MEMORY[0x263EFF8C0];
  id v9 = a3;
  long long v10 = (void *)[[v8 alloc] initWithArray:v9 copyItems:1];

  if ([v10 count] == 1 && a4 > 0)
  {
    long long v11 = [v10 objectAtIndexedSubscript:0];
    id v12 = [v11 size];
    id v13 = [a1 _effectiveSizeForSize:v12 count:a4 layoutDirection:a5];

    [v11 setSize:v13];
    v16[0] = v11;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  }
  else
  {
    id v14 = v10;
  }

  return v14;
}

+ (id)_effectiveSizeForSize:(id)a3 count:(int64_t)a4 layoutDirection:(int64_t)a5
{
  id v7 = a3;
  uint64_t v8 = v7;
  if (!a4 || !a5)
  {
    id v14 = v7;
    goto LABEL_10;
  }
  double v9 = 1.0 / (double)a4;
  long long v10 = [v7 widthDimension];
  long long v11 = [v8 heightDimension];
  if (a5 == 1)
  {
    uint64_t v15 = +[NSCollectionLayoutDimension fractionalHeightDimension:v9];
    id v13 = v11;
    long long v11 = (void *)v15;
    goto LABEL_8;
  }
  if (a5 == 2)
  {
    uint64_t v12 = +[NSCollectionLayoutDimension fractionalWidthDimension:v9];
    id v13 = v10;
    long long v10 = (void *)v12;
LABEL_8:
  }
  id v14 = +[NSCollectionLayoutSize sizeWithWidthDimension:v10 heightDimension:v11];

LABEL_10:
  return v14;
}

- (void)setInterItemSpacing:(NSCollectionLayoutSpacing *)interItemSpacing
{
}

- (BOOL)_hasDecorationItemRequiringRegistration
{
  if (!self->_hasCheckedIfDecorationItemRequiresRegistration)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __66__NSCollectionLayoutGroup__hasDecorationItemRequiringRegistration__block_invoke;
    v4[3] = &unk_2640B2C08;
    v4[4] = self;
    [(NSCollectionLayoutItem *)self _enumerateItemsWithHandler:v4];
    self->_hasCheckedIfDecorationItemRequiresRegistration = 1;
  }
  return self->__hasDecorationItemRequiringRegistration;
}

+ (NSCollectionLayoutGroup)customGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize itemProvider:(NSCollectionLayoutGroupCustomItemProvider)itemProvider
{
  NSCollectionLayoutGroupCustomItemProvider v6 = itemProvider;
  id v7 = layoutSize;
  id v8 = objc_alloc((Class)a1);
  double v9 = +[NSCollectionLayoutSpacing defaultSpacing];
  long long v10 = +[NSCollectionLayoutEdgeSpacing defaultSpacing];
  long long v11 = [MEMORY[0x263F08C38] UUID];
  uint64_t v12 = objc_msgSend(v8, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:", v7, 0.0, 0.0, 0.0, 0.0, MEMORY[0x263EFFA68], v6, 0, v11);

  return (NSCollectionLayoutGroup *)v12;
}

- (id)description
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)NSCollectionLayoutGroup;
  int64_t v16 = [(NSCollectionLayoutItem *)&v21 description];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v15 = self;
  v4 = self->_subitems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) description];
        long long v10 = [v9 stringByReplacingOccurrencesOfString:@"\n\t" withString:@"\n\t\t"];

        [v3 appendFormat:@"\n\t\t %@", v10];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v6);
  }

  unint64_t layoutDirection = v15->_layoutDirection;
  if (layoutDirection > 2) {
    uint64_t v12 = &stru_26C0F8F98;
  }
  else {
    uint64_t v12 = off_2640B2D80[layoutDirection];
  }
  objc_msgSend(v16, "stringByAppendingFormat:", @"\n\t group: subitems=%@\n\t interItemSpacing=%@;\n\t layoutDirection=%@>",
    v3,
    v15->_interItemSpacing,
  id v13 = v12);

  return v13;
}

+ (NSCollectionLayoutGroup)verticalGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize repeatingSubitem:(NSCollectionLayoutItem *)subitem count:(NSInteger)count
{
  v22[1] = *MEMORY[0x263EF8340];
  double v9 = layoutSize;
  long long v10 = subitem;
  long long v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"NSCollectionLayoutItem.m", 563, @"Invalid parameter not satisfying: %@", @"layoutSize != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  long long v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2, a1, @"NSCollectionLayoutItem.m", 564, @"Invalid parameter not satisfying: %@", @"subitem != nil" object file lineNumber description];

LABEL_3:
  if (count <= 0)
  {
    objc_super v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2 object:a1 file:@"NSCollectionLayoutItem.m" lineNumber:565 description:@"A repeating vertical group should specify a count >= 1"];
  }
  id v12 = objc_alloc((Class)a1);
  v22[0] = v11;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  id v14 = +[NSCollectionLayoutSpacing defaultSpacing];
  uint64_t v15 = +[NSCollectionLayoutEdgeSpacing defaultSpacing];
  int64_t v16 = [MEMORY[0x263F08C38] UUID];
  long long v17 = objc_msgSend(v12, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:", v9, v13, count, v14, v15, 1, 0.0, 0.0, 0.0, 0.0, MEMORY[0x263EFFA68], 0, 0, v16);

  return (NSCollectionLayoutGroup *)v17;
}

- (unint64_t)layoutAxis
{
  if ([(NSCollectionLayoutGroup *)self isVerticalGroup]) {
    return 2;
  }
  else {
    return [(NSCollectionLayoutGroup *)self isHorizontalGroup];
  }
}

- (NSCollectionLayoutGroup)initWithSize:(id)a3 subitems:(id)a4 count:(int64_t)a5 interItemSpacing:(id)a6 contentInsets:(CVCDirectionalEdgeInsets)a7 edgeSpacing:(id)a8 layoutDirection:(int64_t)a9 supplementaryItems:(id)a10 visualFormats:(id)a11 itemsProvider:(id)a12 visualFormatItemProvider:(id)a13 customGroupItemProvider:(id)a14 options:(int64_t)a15 name:(id)a16 identifier:(id)a17
{
  double trailing = a7.trailing;
  double bottom = a7.bottom;
  double leading = a7.leading;
  double top = a7.top;
  id v51 = a3;
  id v24 = a4;
  id v50 = a6;
  id v49 = a8;
  id v25 = a10;
  id v26 = a11;
  unint64_t v27 = (unint64_t)a12;
  id v28 = a13;
  unint64_t v29 = (unint64_t)a14;
  id v30 = a16;
  id v31 = a17;
  if (!(v27 | v29))
  {
    int64_t v32 = [v26 lastObject];

    if (!v32)
    {
      if (![v24 count])
      {
        v42 = [MEMORY[0x263F08690] currentHandler];
        [v42 handleFailureInMethod:a2 object:self file:@"NSCollectionLayoutItem.m" lineNumber:761 description:@"At least 1 subitem is required for a group"];
      }
      if (a5 >= 1 && [v24 count] != 1)
      {
        objc_super v44 = [MEMORY[0x263F08690] currentHandler];
        v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
        [v44 handleFailureInMethod:a2, self, @"NSCollectionLayoutItem.m", 764, @"A single item is required for a repeating item group, %@ were supplied", v43 object file lineNumber description];
      }
    }
  }
  uint64_t v33 = -[NSCollectionLayoutGroup initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:](self, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:", v51, v24, a5, v50, v49, a9, top, leading, bottom, trailing, v25, v29, v30, v31);
  v34 = v33;
  if (v33)
  {
    v33->_groupOptions = a15;
    uint64_t v35 = [v26 copy];
    visualFormats = v34->_visualFormats;
    v34->_visualFormats = (NSArray *)v35;

    uint64_t v37 = [(id)v27 copy];
    id itemsProvider = v34->_itemsProvider;
    v34->_id itemsProvider = (id)v37;

    uint64_t v39 = [v28 copy];
    id visualFormatItemProvider = v34->_visualFormatItemProvider;
    v34->_id visualFormatItemProvider = (id)v39;
  }
  return v34;
}

+ (id)horizontalGroupWithSize:(id)a3 subitemsProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"NSCollectionLayoutItem.m", 780, @"Invalid parameter not satisfying: %@", @"subitemsProvider" object file lineNumber description];
  }
  id v9 = objc_alloc((Class)a1);
  long long v10 = +[NSCollectionLayoutSpacing defaultSpacing];
  long long v11 = +[NSCollectionLayoutEdgeSpacing defaultSpacing];
  id v12 = [MEMORY[0x263F08C38] UUID];
  id v13 = objc_msgSend(v9, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:visualFormats:itemsProvider:visualFormatItemProvider:customGroupItemProvider:options:name:identifier:", v7, 0.0, 0.0, 0.0, 0.0, MEMORY[0x263EFFA68], 0, v8, 0, 0, 0, 0, v12);

  return v13;
}

+ (id)verticalGroupWithSize:(id)a3 subitemsProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"NSCollectionLayoutItem.m", 800, @"Invalid parameter not satisfying: %@", @"subitemsProvider" object file lineNumber description];
  }
  id v9 = objc_alloc((Class)a1);
  long long v10 = +[NSCollectionLayoutSpacing defaultSpacing];
  long long v11 = +[NSCollectionLayoutEdgeSpacing defaultSpacing];
  id v12 = [MEMORY[0x263F08C38] UUID];
  id v13 = objc_msgSend(v9, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:visualFormats:itemsProvider:visualFormatItemProvider:customGroupItemProvider:options:name:identifier:", v7, 0.0, 0.0, 0.0, 0.0, MEMORY[0x263EFFA68], 0, v8, 0, 0, 0, 0, v12);

  return v13;
}

+ (NSCollectionLayoutGroup)layoutGroupWithSize:(id)a3 visualFormats:(id)a4 itemProvider:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  if (![v9 count])
  {
    long long v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"NSCollectionLayoutItem.m", 821, @"Invalid parameter not satisfying: %@", @"visualFormats.count" object file lineNumber description];
  }
  id v12 = [v9 firstObject];
  id v13 = [v12 uppercaseString];

  if (([v13 containsString:@"H:"] & 1) == 0
    && ([v13 containsString:@"V:"] & 1) == 0)
  {

    id v13 = [MEMORY[0x263F08690] currentHandler];
    objc_super v21 = [NSNumber numberWithUnsignedInteger:0];
    [v13 handleFailureInMethod:a2, a1, @"NSCollectionLayoutItem.m", 833, @"Unknown layout axis: %@ for formats %@", v21, v9 object file lineNumber description];
  }
  id v14 = objc_alloc((Class)a1);
  uint64_t v15 = +[NSCollectionLayoutSpacing defaultSpacing];
  int64_t v16 = +[NSCollectionLayoutEdgeSpacing defaultSpacing];
  long long v17 = [MEMORY[0x263F08C38] UUID];
  long long v18 = objc_msgSend(v14, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:visualFormats:itemsProvider:visualFormatItemProvider:customGroupItemProvider:options:name:identifier:", v11, 0.0, 0.0, 0.0, 0.0, MEMORY[0x263EFFA68], v9, 0, v10, 0, 0, 0, v17);

  return (NSCollectionLayoutGroup *)v18;
}

- (BOOL)hasItemProvider
{
  v2 = [(NSCollectionLayoutGroup *)self itemsProvider];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasVisualFormat
{
  v2 = [(NSCollectionLayoutGroup *)self visualFormats];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)setSubitems:(id)a3
{
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_unint64_t layoutDirection = a3;
}

- (void)setCustomGroupItemProvider:(id)a3
{
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (void)set_hasDecorationItemRequiringRegistration:(BOOL)a3
{
  self->__hasDecorationItemRequiringRegistration = a3;
}

@end