@interface CPSAlternateRoutesView
- (CPSAlternateRouteSelecting)selectionDelegate;
- (CPSAlternateRoutesScrollView)scrollView;
- (CPSAlternateRoutesView)initWithFrame:(CGRect)a3;
- (NSArray)availableRouteChoices;
- (NSLayoutConstraint)bottomConstraint;
- (NSMutableArray)routeRowViews;
- (id)_linearFocusItems;
- (id)preferredFocusEnvironments;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)indexForSelectedRoute;
- (void)didSelectRow:(id)a3 representingRouteChoice:(id)a4;
- (void)setAvailableRouteChoices:(id)a3;
- (void)setIndexForSelectedRoute:(unint64_t)a3;
- (void)setRouteRowViews:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setSelectionDelegate:(id)a3;
@end

@implementation CPSAlternateRoutesView

- (CPSAlternateRoutesView)initWithFrame:(CGRect)a3
{
  v39[4] = *MEMORY[0x263EF8340];
  CGRect v38 = a3;
  SEL v36 = a2;
  v37 = 0;
  v35.receiver = self;
  v35.super_class = (Class)CPSAlternateRoutesView;
  v37 = -[CPSAlternateRoutesView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v37, v37);
  if (v37)
  {
    [(CPSAlternateRoutesView *)v37 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPSAlternateRoutesView *)v37 setIndexForSelectedRoute:0x7FFFFFFFFFFFFFFFLL];
    v3 = [CPSAlternateRoutesScrollView alloc];
    v6 = -[CPSAlternateRoutesScrollView initWithFrame:style:](v3, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    -[CPSAlternateRoutesView setScrollView:](v37, "setScrollView:");

    v7 = v37;
    v8 = [(CPSAlternateRoutesView *)v37 scrollView];
    [(CPSAlternateRoutesScrollView *)v8 setDataSource:v7];

    v11 = [(CPSAlternateRoutesView *)v37 scrollView];
    uint64_t v9 = objc_opt_class();
    id v10 = +[CPSRouteRowCell identifier];
    -[CPSAlternateRoutesScrollView registerClass:forCellReuseIdentifier:](v11, "registerClass:forCellReuseIdentifier:", v9);

    v12 = [(CPSAlternateRoutesView *)v37 scrollView];
    [(CPSAlternateRoutesScrollView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    v13 = v37;
    v14 = [(CPSAlternateRoutesView *)v37 scrollView];
    -[CPSAlternateRoutesView addSubview:](v13, "addSubview:");

    v16 = [(CPSAlternateRoutesView *)v37 scrollView];
    id v15 = (id)[MEMORY[0x263F1C550] clearColor];
    -[CPSAlternateRoutesScrollView setBackgroundColor:](v16, "setBackgroundColor:");

    v17 = (void *)MEMORY[0x263F08938];
    v34 = [(CPSAlternateRoutesView *)v37 scrollView];
    id v33 = (id)[(CPSAlternateRoutesScrollView *)v34 topAnchor];
    id v32 = (id)[(CPSAlternateRoutesView *)v37 topAnchor];
    id v31 = (id)objc_msgSend(v33, "constraintEqualToAnchor:");
    v39[0] = v31;
    v30 = [(CPSAlternateRoutesView *)v37 scrollView];
    id v29 = (id)[(CPSAlternateRoutesScrollView *)v30 leadingAnchor];
    id v28 = (id)[(CPSAlternateRoutesView *)v37 leadingAnchor];
    id v27 = (id)objc_msgSend(v29, "constraintEqualToAnchor:");
    v39[1] = v27;
    v26 = [(CPSAlternateRoutesView *)v37 scrollView];
    id v25 = (id)[(CPSAlternateRoutesScrollView *)v26 trailingAnchor];
    id v24 = (id)[(CPSAlternateRoutesView *)v37 trailingAnchor];
    id v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
    v39[2] = v23;
    v22 = [(CPSAlternateRoutesView *)v37 scrollView];
    id v21 = (id)[(CPSAlternateRoutesScrollView *)v22 bottomAnchor];
    id v20 = (id)[(CPSAlternateRoutesView *)v37 bottomAnchor];
    id v19 = (id)objc_msgSend(v21, "constraintEqualToAnchor:");
    v39[3] = v19;
    id v18 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:4];
    objc_msgSend(v17, "activateConstraints:");
  }
  v5 = v37;
  objc_storeStrong((id *)&v37, 0);
  return v5;
}

- (void)setAvailableRouteChoices:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((unint64_t)[location[0] count] <= 3)
  {
    objc_storeStrong((id *)&v13->_availableRouteChoices, location[0]);
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v14 = 3;
    uint64_t v16 = 0;
    uint64_t v17 = 3;
    v10[1] = 0;
    v10[2] = (id)3;
    id v11 = (id)objc_msgSend(location[0], "subarrayWithRange:", 0, 3);
    objc_storeStrong((id *)&v13->_availableRouteChoices, v11);
    objc_storeStrong(&v11, 0);
  }
  id v3 = (id)objc_opt_new();
  [(CPSAlternateRoutesView *)v13 setRouteRowViews:"setRouteRowViews:"];

  v4 = [(CPSAlternateRoutesView *)v13 availableRouteChoices];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __51__CPSAlternateRoutesView_setAvailableRouteChoices___block_invoke;
  uint64_t v9 = &unk_2648A49C0;
  v10[0] = v13;
  [(NSArray *)v4 enumerateObjectsUsingBlock:&v5];

  objc_storeStrong(v10, 0);
  objc_storeStrong(location, 0);
}

void __51__CPSAlternateRoutesView_setAvailableRouteChoices___block_invoke(id *a1, void *a2, uint64_t a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v13 = a3;
  v12[2] = a4;
  v12[1] = a1;
  v12[0] = objc_alloc_init(CPSRouteRowView);
  [v12[0] setRepresentedRouteChoice:location[0]];
  [v12[0] setInteractionDelegate:a1[4]];
  objc_msgSend(v12[0], "setSelected:", v13 == objc_msgSend(a1[4], "indexForSelectedRoute"));
  id v6 = (id)[v12[0] layer];
  [v6 setCornerCurve:*MEMORY[0x263F15A20]];

  id v7 = (id)[v12[0] layer];
  [v7 setCornerRadius:6.0];

  id v8 = v12[0];
  id v9 = (id)[MEMORY[0x263F1C550] _carSystemQuaternaryColor];
  objc_msgSend(v8, "setBackgroundColor:");

  id v11 = (id)[a1[4] routeRowViews];
  [v11 addObject:v12[0]];

  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);
}

- (void)setIndexForSelectedRoute:(unint64_t)a3
{
  id v19 = self;
  SEL v18 = a2;
  unint64_t v17 = a3;
  self->_indexForSelectedRoute = a3;
  uint64_t v5 = [(CPSAlternateRoutesView *)v19 availableRouteChoices];
  char v14 = 0;
  char v12 = 0;
  if (v17 >= [(NSArray *)v5 count])
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v15 = [(CPSAlternateRoutesView *)v19 availableRouteChoices];
    char v14 = 1;
    id v13 = [(NSArray *)v15 objectAtIndex:v17];
    char v12 = 1;
    id v3 = v13;
  }
  id v16 = v3;
  if (v12) {

  }
  if (v14) {
  v4 = [(CPSAlternateRoutesView *)v19 routeRowViews];
  }
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __51__CPSAlternateRoutesView_setIndexForSelectedRoute___block_invoke;
  id v10 = &unk_2648A3BB8;
  id v11 = v16;
  [(NSMutableArray *)v4 enumerateObjectsUsingBlock:&v6];

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v16, 0);
}

void __51__CPSAlternateRoutesView_setIndexForSelectedRoute___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v10[3] = a3;
  v10[2] = a4;
  v10[1] = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = objc_opt_class();
    v10[0] = CPSSafeCast_10(v4, location[0]);
    id v5 = (id)[v10[0] representedRouteChoice];
    char v6 = [v5 isEqual:a1[4]];

    [v10[0] setSelected:v6 & 1];
    objc_storeStrong(v10, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)didSelectRow:(id)a3 representingRouteChoice:(id)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  char v6 = [(CPSAlternateRoutesView *)v13 availableRouteChoices];
  uint64_t v7 = [(NSArray *)v6 indexOfObjectIdenticalTo:v11];

  uint64_t v10 = v7;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(CPSAlternateRoutesView *)v13 setIndexForSelectedRoute:v10];
    id v9 = [(CPSAlternateRoutesView *)v13 selectionDelegate];
    if (objc_opt_respondsToSelector()) {
      [v9 alternateRoutesView:v13 didSelectRouteChoice:v11];
    }
    id v8 = (id)[MEMORY[0x263F088C8] indexPathForRow:v10 inSection:0];
    v4 = [(CPSAlternateRoutesView *)v13 scrollView];
    [(CPSAlternateRoutesScrollView *)v4 selectRowAtIndexPath:v8 animated:1 scrollPosition:2];

    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (id)preferredFocusEnvironments
{
  v5[1] = *MEMORY[0x263EF8340];
  id v3 = [(CPSAlternateRoutesView *)self scrollView];
  v5[0] = v3;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v4;
}

- (id)_linearFocusItems
{
  uint64_t v7 = self;
  v6[1] = (id)a2;
  v6[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = [(CPSAlternateRoutesView *)v7 routeRowViews];
  id v5 = v6[0];
  -[NSMutableArray enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:");

  id v4 = v6[0];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);

  return v4;
}

void __43__CPSAlternateRoutesView__linearFocusItems__block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v10[3] = a3;
  v10[2] = a4;
  v10[1] = a1;
  id v4 = objc_opt_class();
  v10[0] = CPSSafeCast_10(v4, location[0]);
  if (v10[0])
  {
    id v5 = (void *)a1[4];
    id v6 = (id)[v10[0] rowButton];
    objc_msgSend(v5, "addObject:");
  }
  objc_storeStrong(v10, 0);
  objc_storeStrong(location, 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v33[4] = *MEMORY[0x263EF8340];
  id v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  id v6 = location[0];
  id v7 = +[CPSRouteRowCell identifier];
  id v29 = (id)objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:");

  [v29 setSelectionStyle:0];
  id v8 = [(CPSAlternateRoutesView *)v32 routeRowViews];
  id v28 = (id)-[NSMutableArray objectAtIndex:](v8, "objectAtIndex:", [v30 item]);

  id v9 = (id)[v29 contentView];
  [v9 addSubview:v28];

  id v10 = v29;
  id v11 = (id)[MEMORY[0x263F1C550] clearColor];
  objc_msgSend(v10, "setBackgroundColor:");

  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  char v12 = (void *)MEMORY[0x263F08938];
  id v26 = (id)[v28 topAnchor];
  id v25 = (id)[v29 topAnchor];
  id v24 = (id)objc_msgSend(v26, "constraintEqualToAnchor:");
  v33[0] = v24;
  id v23 = (id)[v28 leadingAnchor];
  id v22 = (id)[v29 safeAreaLayoutGuide];
  id v21 = (id)[v22 leadingAnchor];
  id v20 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
  v33[1] = v20;
  id v19 = (id)[v28 trailingAnchor];
  id v18 = (id)[v29 trailingAnchor];
  id v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
  v33[2] = v17;
  id v16 = (id)[v28 bottomAnchor];
  id v15 = (id)[v29 bottomAnchor];
  id v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v33[3] = v14;
  id v13 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  objc_msgSend(v12, "activateConstraints:");

  id v27 = v29;
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);

  return v27;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(CPSAlternateRoutesView *)v8 routeRowViews];
  int64_t v6 = [(NSMutableArray *)v5 count];

  objc_storeStrong(location, 0);
  return v6;
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (NSArray)availableRouteChoices
{
  return self->_availableRouteChoices;
}

- (unint64_t)indexForSelectedRoute
{
  return self->_indexForSelectedRoute;
}

- (CPSAlternateRouteSelecting)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);

  return (CPSAlternateRouteSelecting *)WeakRetained;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (CPSAlternateRoutesScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (NSMutableArray)routeRowViews
{
  return self->_routeRowViews;
}

- (void)setRouteRowViews:(id)a3
{
}

- (void).cxx_destruct
{
}

@end