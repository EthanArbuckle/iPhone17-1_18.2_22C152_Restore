@interface CNVisualIdentityAvatarLayoutManager
- (BOOL)hasMediaContextBadge;
- (CGRect)adHocAvatarFrameInBounds:(CGRect)a3 forItemCount:(int64_t)a4;
- (CGRect)adHocAvatarFrameInView:(id)a3 forItemCount:(int64_t)a4;
- (CGRect)avatarFrameForFocusedAvatarInView:(id)a3;
- (CGRect)avatarFrameInBounds:(CGRect)a3 forItemCount:(int64_t)a4;
- (CGRect)avatarFrameInBounds:(CGRect)a3 forItemCount:(int64_t)a4 withConfiguration:(id)a5;
- (CNAvatarAccessoryView)mediaContextBadge;
- (CNGroupAvatarLayerLayoutDelegate)layoutDelegate;
- (CNVisualIdentityAvatarLayoutManager)init;
- (CNVisualIdentityAvatarLayoutManager)initWithLayoutType:(unint64_t)a3;
- (CNVisualIdentityAvatarLayoutManager)initWithLayoutType:(unint64_t)a3 withLayoutDelegate:(id)a4;
- (NSArray)avatarLayerItems;
- (NSArray)avatarViewAdHocLayoutConfiguration;
- (NSArray)avatarViewLayoutConfiguration;
- (id)layoutConfigurationForIndex:(int64_t)a3 inItemCount:(int64_t)a4 withLayoutType:(unint64_t)a5;
- (id)rearrangedLayersItemsFor:(id)a3;
- (int64_t)maxAvatarCount;
- (void)setAvatarLayerItems:(id)a3;
- (void)setAvatarViewAdHocLayoutConfiguration:(id)a3;
- (void)setAvatarViewLayoutConfiguration:(id)a3;
- (void)setLayoutDelegate:(id)a3;
- (void)setMediaContextBadge:(id)a3;
- (void)updateAvatarLayersForItemCount:(int64_t)a3 inView:(id)a4 identifiers:(id)a5;
- (void)updateAvatarLayersForItemCount:(int64_t)a3 inView:(id)a4 withLayoutType:(unint64_t)a5;
- (void)updateAvatarLayersWithPrimaryAvatarForItemCount:(int64_t)a3 inView:(id)a4;
- (void)updateLayer:(id)a3 forItemCount:(int64_t)a4 atIndex:(int64_t)a5 inView:(id)a6 withLayoutType:(unint64_t)a7;
@end

@implementation CNVisualIdentityAvatarLayoutManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutDelegate);
  objc_storeStrong((id *)&self->_avatarViewLayoutConfiguration, 0);
  objc_storeStrong((id *)&self->_avatarViewAdHocLayoutConfiguration, 0);
  objc_storeStrong((id *)&self->_mediaContextBadge, 0);

  objc_storeStrong((id *)&self->_avatarLayerItems, 0);
}

- (void)setLayoutDelegate:(id)a3
{
}

- (CNGroupAvatarLayerLayoutDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);

  return (CNGroupAvatarLayerLayoutDelegate *)WeakRetained;
}

- (void)setAvatarViewLayoutConfiguration:(id)a3
{
}

- (NSArray)avatarViewLayoutConfiguration
{
  return self->_avatarViewLayoutConfiguration;
}

- (void)setAvatarViewAdHocLayoutConfiguration:(id)a3
{
}

- (NSArray)avatarViewAdHocLayoutConfiguration
{
  return self->_avatarViewAdHocLayoutConfiguration;
}

- (void)setMediaContextBadge:(id)a3
{
}

- (CNAvatarAccessoryView)mediaContextBadge
{
  return self->_mediaContextBadge;
}

- (void)setAvatarLayerItems:(id)a3
{
}

- (NSArray)avatarLayerItems
{
  return self->_avatarLayerItems;
}

- (int64_t)maxAvatarCount
{
  return self->_maxAvatarCount;
}

- (id)layoutConfigurationForIndex:(int64_t)a3 inItemCount:(int64_t)a4 withLayoutType:(unint64_t)a5
{
  if ((a5 | 2) == 2) {
    [(CNVisualIdentityAvatarLayoutManager *)self avatarViewLayoutConfiguration];
  }
  else {
  v7 = [(CNVisualIdentityAvatarLayoutManager *)self avatarViewAdHocLayoutConfiguration];
  }
  v8 = [v7 objectAtIndexedSubscript:a4 - 1];

  v9 = [v8 objectAtIndexedSubscript:a3];

  return v9;
}

- (CGRect)avatarFrameInBounds:(CGRect)a3 forItemCount:(int64_t)a4 withConfiguration:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  v11 = v10;
  if (a4 <= 0)
  {
    CGFloat v28 = *MEMORY[0x1E4F1DB28];
    CGFloat v29 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v30 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v31 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    v12 = [v10 objectAtIndexedSubscript:a4 - 1];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v15 = 0;
      v16 = 0;
      uint64_t v17 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v41 != v17) {
            objc_enumerationMutation(v12);
          }
          v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if (!v15
            || ([*(id *)(*((void *)&v40 + 1) + 8 * i) x], double v21 = v20, objc_msgSend(v15, "x"), v21 < v22))
          {
            id v23 = v19;

            v15 = v23;
          }
          if (v16)
          {
            [v19 x];
            double v25 = v24;
            [v16 x];
            if (v25 <= v26) {
              continue;
            }
          }
          id v27 = v19;

          v16 = v27;
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v14);
    }
    else
    {
      v15 = 0;
      v16 = 0;
    }
    objc_msgSend(v16, "itemFrameInContainingBounds:isRTL:", 0, x, y, width, height);
    double v33 = v32;
    double v35 = v34;
    objc_msgSend(v15, "itemFrameInContainingBounds:isRTL:", 0, x, y, width, height);
    v46.size.double width = v33 + v35 - v46.origin.x;
    v46.origin.double y = y;
    v46.size.double height = height;
    CGRect v47 = CGRectIntegral(v46);
    CGFloat v28 = v47.origin.x;
    CGFloat v29 = v47.origin.y;
    CGFloat v30 = v47.size.width;
    CGFloat v31 = v47.size.height;
  }
  double v36 = v28;
  double v37 = v29;
  double v38 = v30;
  double v39 = v31;
  result.size.double height = v39;
  result.size.double width = v38;
  result.origin.double y = v37;
  result.origin.double x = v36;
  return result;
}

- (CGRect)avatarFrameInBounds:(CGRect)a3 forItemCount:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = [(CNVisualIdentityAvatarLayoutManager *)self avatarViewLayoutConfiguration];
  -[CNVisualIdentityAvatarLayoutManager avatarFrameInBounds:forItemCount:withConfiguration:](self, "avatarFrameInBounds:forItemCount:withConfiguration:", a4, v10, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (CGRect)adHocAvatarFrameInBounds:(CGRect)a3 forItemCount:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = [(CNVisualIdentityAvatarLayoutManager *)self avatarViewAdHocLayoutConfiguration];
  -[CNVisualIdentityAvatarLayoutManager avatarFrameInBounds:forItemCount:withConfiguration:](self, "avatarFrameInBounds:forItemCount:withConfiguration:", a4, v10, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (CGRect)adHocAvatarFrameInView:(id)a3 forItemCount:(int64_t)a4
{
  [a3 bounds];

  -[CNVisualIdentityAvatarLayoutManager adHocAvatarFrameInBounds:forItemCount:](self, "adHocAvatarFrameInBounds:forItemCount:", a4);
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (CGRect)avatarFrameForFocusedAvatarInView:(id)a3
{
  id v4 = a3;
  v5 = [(CNVisualIdentityAvatarLayoutManager *)self layoutConfigurationForIndex:0 inItemCount:1 withLayoutType:0];
  [v4 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v5, "itemFrameInContainingBounds:isRTL:", 0, v7, v9, v11, v13);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (void)updateAvatarLayersWithPrimaryAvatarForItemCount:(int64_t)a3 inView:(id)a4
{
}

- (BOOL)hasMediaContextBadge
{
  v2 = [(CNVisualIdentityAvatarLayoutManager *)self mediaContextBadge];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)updateLayer:(id)a3 forItemCount:(int64_t)a4 atIndex:(int64_t)a5 inView:(id)a6 withLayoutType:(unint64_t)a7
{
  id v20 = a3;
  id v12 = a6;
  double v13 = [(CNVisualIdentityAvatarLayoutManager *)self layoutConfigurationForIndex:a5 inItemCount:a4 withLayoutType:a7];
  uint64_t v14 = [v12 effectiveUserInterfaceLayoutDirection];
  double v15 = [(CNVisualIdentityAvatarLayoutManager *)self layoutDelegate];
  [v13 setLayoutDelegate:v15];

  [v12 bounds];
  objc_msgSend(v13, "updateLayer:inBounds:atIndex:isRTL:", v20, a5, v14 == 1);
  if (!a7)
  {
    if ([(CNVisualIdentityAvatarLayoutManager *)self hasMediaContextBadge])
    {
      [v13 x];
      if (v16 > 0.0)
      {
        [(CNVisualIdentityAvatarLayoutManager *)self avatarFrameForFocusedAvatarInView:v12];
        objc_msgSend(MEMORY[0x1E4F5A618], "avatarBadgeRectForAvatarInRect:badgeType:isRTL:", 2, v14 == 1);
        if (v14 == 1) {
          double v18 = -(v17 * 0.75);
        }
        else {
          double v18 = v17 * 0.75;
        }
        [v20 frame];
        [v20 setFrame:v19 + v18];
      }
    }
  }
}

- (void)updateAvatarLayersForItemCount:(int64_t)a3 inView:(id)a4 withLayoutType:(unint64_t)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  double v9 = [(CNVisualIdentityAvatarLayoutManager *)self avatarLayerItems];
  uint64_t v10 = [v9 count];

  uint64_t v11 = v10 - a3;
  if (v10 == a3)
  {
    id v12 = [(CNVisualIdentityAvatarLayoutManager *)self avatarLayerItems];
    objc_msgSend(v12, "_cn_each:", &__block_literal_global_33903);
  }
  if (v11 >= 1)
  {
    double v13 = [(CNVisualIdentityAvatarLayoutManager *)self avatarLayerItems];
    uint64_t v14 = objc_msgSend(v13, "_cn_takeLast:", v11);

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          double v21 = objc_msgSend(v20, "layer", (void)v32);
          [v21 removeFromSuperlayer];

          [v20 resetToken];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v17);
    }

    double v22 = [(CNVisualIdentityAvatarLayoutManager *)self avatarLayerItems];
    double v23 = objc_msgSend(v22, "_cn_take:", a3);
    [(CNVisualIdentityAvatarLayoutManager *)self setAvatarLayerItems:v23];
  }
  if (a3 >= 1)
  {
    uint64_t v24 = 0;
    do
    {
      double v25 = [(CNVisualIdentityAvatarLayoutManager *)self avatarLayerItems];
      uint64_t v26 = [v25 count];

      if (v24 >= v26)
      {
        CGFloat v29 = [MEMORY[0x1E4F39BE8] layer];
        CGFloat v28 = (void *)[objc_alloc(MEMORY[0x1E4F5A610]) initWithLayer:v29];
        CGFloat v30 = [(CNVisualIdentityAvatarLayoutManager *)self avatarLayerItems];
        CGFloat v31 = [v30 arrayByAddingObject:v28];
        [(CNVisualIdentityAvatarLayoutManager *)self setAvatarLayerItems:v31];
      }
      else
      {
        id v27 = [(CNVisualIdentityAvatarLayoutManager *)self avatarLayerItems];
        CGFloat v28 = [v27 objectAtIndexedSubscript:v24];

        CGFloat v29 = [v28 layer];
      }
      [v28 resetToken];
      [(CNVisualIdentityAvatarLayoutManager *)self updateLayer:v29 forItemCount:a3 atIndex:v24 inView:v8 withLayoutType:a5];

      ++v24;
    }
    while (a3 != v24);
  }
}

uint64_t __92__CNVisualIdentityAvatarLayoutManager_updateAvatarLayersForItemCount_inView_withLayoutType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 resetToken];
}

- (void)updateAvatarLayersForItemCount:(int64_t)a3 inView:(id)a4 identifiers:(id)a5
{
  id v11 = a4;
  id v8 = a5;
  double v9 = [(CNVisualIdentityAvatarLayoutManager *)self layoutDelegate];

  if (v9)
  {
    uint64_t v10 = [(CNVisualIdentityAvatarLayoutManager *)self rearrangedLayersItemsFor:v8];
    [(CNVisualIdentityAvatarLayoutManager *)self setAvatarLayerItems:v10];
  }
  [(CNVisualIdentityAvatarLayoutManager *)self updateAvatarLayersForItemCount:a3 inView:v11 withLayoutType:1];
}

- (id)rearrangedLayersItemsFor:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CNVisualIdentityAvatarLayoutManager *)self avatarLayerItems];
  double v6 = (void *)[v5 mutableCopy];

  double v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __64__CNVisualIdentityAvatarLayoutManager_rearrangedLayersItemsFor___block_invoke;
        v31[3] = &unk_1E5499598;
        v31[4] = v12;
        uint64_t v13 = [v6 indexOfObjectPassingTest:v31];
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v14 = objc_alloc(MEMORY[0x1E4F5A610]);
          id v15 = [MEMORY[0x1E4F39BE8] layer];
          uint64_t v16 = (void *)[v14 initWithLayer:v15];

          [v16 setIdentifier:v12];
          [v7 addObject:v16];
        }
        else
        {
          uint64_t v17 = v13;
          uint64_t v18 = [v6 objectAtIndexedSubscript:v13];
          [v7 addObject:v18];

          [v6 removeObjectAtIndex:v17];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v9);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v19 = v6;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = [*(id *)(*((void *)&v27 + 1) + 8 * j) layer];
        [v24 removeFromSuperlayer];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v21);
  }

  return v7;
}

uint64_t __64__CNVisualIdentityAvatarLayoutManager_rearrangedLayersItemsFor___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (CNVisualIdentityAvatarLayoutManager)initWithLayoutType:(unint64_t)a3 withLayoutDelegate:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNVisualIdentityAvatarLayoutManager;
  double v7 = [(CNVisualIdentityAvatarLayoutManager *)&v17 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F5A618] avatarViewLayoutConfigurationsForType:a3 withLayoutDelegate:v6];
    avatarViewLayoutConfiguration = v7->_avatarViewLayoutConfiguration;
    v7->_avatarViewLayoutConfiguration = (NSArray *)v8;

    avatarLayerItems = v7->_avatarLayerItems;
    v7->_avatarLayerItems = (NSArray *)MEMORY[0x1E4F1CBF0];

    v7->_maxAvatarCount = [MEMORY[0x1E4F5A618] maxAvatarCountForType:a3];
    objc_storeWeak((id *)&v7->_layoutDelegate, v6);
    if (a3 >= 2)
    {
      if (a3 != 2)
      {
LABEL_7:
        id v15 = v7;
        goto LABEL_8;
      }
      id v11 = (void *)MEMORY[0x1E4F5A618];
      uint64_t v12 = 2;
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4F5A618];
      uint64_t v12 = 1;
    }
    uint64_t v13 = [v11 avatarViewLayoutConfigurationsForType:v12 withLayoutDelegate:v6];
    avatarViewAdHocLayoutConfiguration = v7->_avatarViewAdHocLayoutConfiguration;
    v7->_avatarViewAdHocLayoutConfiguration = (NSArray *)v13;

    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (CNVisualIdentityAvatarLayoutManager)initWithLayoutType:(unint64_t)a3
{
  return [(CNVisualIdentityAvatarLayoutManager *)self initWithLayoutType:a3 withLayoutDelegate:0];
}

- (CNVisualIdentityAvatarLayoutManager)init
{
  return [(CNVisualIdentityAvatarLayoutManager *)self initWithLayoutType:0];
}

@end