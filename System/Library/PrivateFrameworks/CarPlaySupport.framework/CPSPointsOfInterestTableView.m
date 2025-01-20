@interface CPSPointsOfInterestTableView
- (BOOL)accessibilityViewIsModal;
- (CPSPointsOfInterestTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (UIEdgeInsets)_tableContentInset;
- (id)accessoryViewAtEdge:(int64_t)a3;
- (id)visibleCells;
- (void)setAccessoryView:(id)a3 atEdge:(int64_t)a4;
@end

@implementation CPSPointsOfInterestTableView

- (CPSPointsOfInterestTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  CGRect v10 = a3;
  SEL v8 = a2;
  int64_t v7 = a4;
  v9 = 0;
  v6.receiver = self;
  v6.super_class = (Class)CPSPointsOfInterestTableView;
  v9 = -[CPSPointsOfInterestTableView initWithFrame:style:](&v6, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v9, v9);
  if (v9) {
    [(CPSPointsOfInterestTableView *)v9 setScrollEnabled:1];
  }
  v5 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (UIEdgeInsets)_tableContentInset
{
  UIEdgeInsetsMake_8();
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setAccessoryView:(id)a3 atEdge:(int64_t)a4
{
  v36[4] = *MEMORY[0x263EF8340];
  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v32 = a4;
  v31.receiver = v34;
  v31.super_class = (Class)CPSPointsOfInterestTableView;
  [(CPSPointsOfInterestTableView *)&v31 setAccessoryView:location[0] atEdge:4];
  if (location[0])
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    id v30 = (id)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v10 = (id)[MEMORY[0x263F1C550] tableBackgroundColor];
    objc_msgSend(v30, "setBackgroundColor:");

    [location[0] insertSubview:v30 atIndex:0];
    id v11 = location[0];
    id v24 = (id)[v30 topAnchor];
    id v23 = (id)[location[0] topAnchor];
    id v22 = (id)objc_msgSend(v24, "constraintEqualToAnchor:");
    v36[0] = v22;
    id v21 = (id)[v30 leftAnchor];
    id v20 = (id)[location[0] leftAnchor];
    id v19 = (id)objc_msgSend(v21, "constraintEqualToAnchor:");
    v36[1] = v19;
    id v18 = (id)[v30 rightAnchor];
    id v17 = (id)[location[0] rightAnchor];
    id v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
    v36[2] = v16;
    id v15 = (id)[v30 bottomAnchor];
    id v14 = (id)[location[0] bottomAnchor];
    id v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
    v36[3] = v13;
    id v12 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:4];
    objc_msgSend(v11, "addConstraints:");

    memset(__b, 0, sizeof(__b));
    id obj = (id)objc_msgSend(location[0], "_CPS_recursiveSubviewsWithClass:", objc_opt_class());
    uint64_t v26 = [obj countByEnumeratingWithState:__b objects:v35 count:16];
    if (v26)
    {
      uint64_t v7 = *(void *)__b[2];
      uint64_t v8 = 0;
      uint64_t v9 = v26;
      while (1)
      {
        uint64_t v6 = v8;
        if (*(void *)__b[2] != v7) {
          objc_enumerationMutation(obj);
        }
        id v29 = *(id *)(__b[1] + 8 * v8);
        objc_msgSend(v29, "setCharge:", 0.0, v9);
        ++v8;
        uint64_t v9 = v5;
        if (v6 + 1 >= v5)
        {
          uint64_t v8 = 0;
          uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v35 count:16];
          if (!v9) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v30, 0);
  }
  objc_storeStrong(location, 0);
}

- (id)accessoryViewAtEdge:(int64_t)a3
{
  uint64_t v7 = self;
  SEL v6 = a2;
  int64_t v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)CPSPointsOfInterestTableView;
  return [(CPSPointsOfInterestTableView *)&v4 accessoryViewAtEdge:4];
}

- (id)visibleCells
{
  v35 = self;
  v34[1] = (id)a2;
  v33.receiver = self;
  v33.super_class = (Class)CPSPointsOfInterestTableView;
  v34[0] = [(CPSPointsOfInterestTableView *)&v33 visibleCells];
  if (v34[0] && [v34[0] count])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    [(CPSPointsOfInterestTableView *)v35 frame];
    double v26 = v2;
    double v27 = v3;
    double v28 = v4;
    double v29 = v5;
    [(CPSPointsOfInterestTableView *)v35 _sectionContentInset];
    v25[9] = v6;
    v25[10] = v7;
    v25[11] = v8;
    v25[12] = v9;
    *(void *)&long long v30 = UIEdgeInsetsInsetRect(v26, v27, v28, v29, *(double *)&v6, *(double *)&v7);
    *((void *)&v30 + 1) = v10;
    *(void *)&long long v31 = v11;
    *((void *)&v31 + 1) = v12;
    [(CPSPointsOfInterestTableView *)v35 contentOffset];
    v25[3] = v13;
    v25[4] = v14;
    [(CPSPointsOfInterestTableView *)v35 contentOffset];
    v25[1] = v15;
    v25[2] = v16;
    CGRectMake_9();
    v25[5] = v17;
    v25[6] = v18;
    v25[7] = v19;
    v25[8] = v20;
    id v23 = v34[0];
    id v24 = (id)objc_msgSend(v34[0], "indexesOfObjectsPassingTest:");
    v25[0] = (id)objc_msgSend(v23, "objectsAtIndexes:");

    id v36 = v25[0];
    int v32 = 1;
    objc_storeStrong(v25, 0);
  }
  else
  {
    id v36 = MEMORY[0x263EFFA68];
    int v32 = 1;
  }
  objc_storeStrong(v34, 0);
  id v21 = v36;

  return v21;
}

BOOL __44__CPSPointsOfInterestTableView_visibleCells__block_invoke(CGRect *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] frame];
  BOOL v4 = CGRectIntersectsRect(v6, a1[1]);
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end