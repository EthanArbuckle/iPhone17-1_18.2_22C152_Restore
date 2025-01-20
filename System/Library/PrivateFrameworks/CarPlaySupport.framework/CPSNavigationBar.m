@interface CPSNavigationBar
- (CPSNavigationBar)initWithFrame:(CGRect)a3;
- (NSMapTable)lastFocusedItems;
- (id)_linearFocusItems;
- (id)popNavigationItemAnimated:(BOOL)a3;
- (id)preferredFocusEnvironments;
- (void)didMoveToSuperview;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setLastFocusedItems:(id)a3;
@end

@implementation CPSNavigationBar

- (CPSNavigationBar)initWithFrame:(CGRect)a3
{
  CGRect v10 = a3;
  SEL v8 = a2;
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)CPSNavigationBar;
  v9 = -[CPSNavigationBar initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    v3 = (NSMapTable *)(id)objc_msgSend(MEMORY[0x263F08968], "mapTableWithKeyOptions:valueOptions:", 517);
    lastFocusedItems = v9->_lastFocusedItems;
    v9->_lastFocusedItems = v3;
  }
  v6 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v6;
}

- (void)didMoveToSuperview
{
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  v12.receiver = v15;
  v12.super_class = (Class)CPSNavigationBar;
  [(CPSNavigationBar *)&v12 didUpdateFocusInContext:location[0] withAnimationCoordinator:v13];
  id v8 = (id)[location[0] nextFocusedView];
  char v10 = 0;
  char v9 = 0;
  if (v8)
  {
    id v11 = (id)[location[0] nextFocusedView];
    char v10 = 1;
    char v9 = [v11 isDescendantOfView:v15];
  }
  if (v10) {

  }
  if (v9)
  {
    v6 = [(CPSNavigationBar *)v15 lastFocusedItems];
    id v5 = (id)[location[0] nextFocusedItem];
    id v4 = (id)[(CPSNavigationBar *)v15 topItem];
    -[NSMapTable setObject:forKey:](v6, "setObject:forKey:", v5);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (id)popNavigationItemAnimated:(BOOL)a3
{
  char v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CPSNavigationBar;
  id v7 = [(CPSNavigationBar *)&v6 popNavigationItemAnimated:a3];
  id v4 = [(CPSNavigationBar *)v10 lastFocusedItems];
  [(NSMapTable *)v4 removeObjectForKey:v7];

  id v5 = v7;
  objc_storeStrong(&v7, 0);

  return v5;
}

- (id)preferredFocusEnvironments
{
  id v13 = self;
  v12[1] = (id)a2;
  v12[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  char v10 = [(CPSNavigationBar *)v13 lastFocusedItems];
  id v9 = (id)[(CPSNavigationBar *)v13 topItem];
  id v11 = -[NSMapTable objectForKey:](v10, "objectForKey:");

  if (v11)
  {
    BOOL v8 = [(CPSNavigationBar *)v13 lastFocusedItems];
    id v7 = (id)[(CPSNavigationBar *)v13 topItem];
    id v6 = -[NSMapTable objectForKey:](v8, "objectForKey:");
    objc_msgSend(v12[0], "addObject:");
  }
  id v3 = v12[0];
  id v4 = [(CPSNavigationBar *)v13 _linearFocusItems];
  objc_msgSend(v3, "addObjectsFromArray:");

  id v5 = (id)[v12[0] copy];
  objc_storeStrong(v12, 0);

  return v5;
}

- (id)_linearFocusItems
{
  v16 = self;
  v15[1] = (id)a2;
  v15[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = (id)[(CPSNavigationBar *)v16 items];
  id v4 = (id)[v5 firstObject];
  id v3 = (id)[v4 leftBarButtonItems];
  id v14 = (id)objc_msgSend(v3, "cps_map:", &__block_literal_global_18);

  id v8 = (id)[(CPSNavigationBar *)v16 items];
  id v7 = (id)[v8 firstObject];
  id v6 = (id)[v7 rightBarButtonItems];
  id v13 = (id)objc_msgSend(v6, "cps_map:", &__block_literal_global_7);

  [v15[0] addObjectsFromArray:v14];
  id v9 = v15[0];
  id v11 = (id)[v13 reverseObjectEnumerator];
  id v10 = (id)[v11 allObjects];
  objc_msgSend(v9, "addObjectsFromArray:");

  id v12 = v15[0];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v15, 0);

  return v12;
}

id __37__CPSNavigationBar__linearFocusItems__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[location[0] customView];
  objc_storeStrong(location, 0);

  return v3;
}

id __37__CPSNavigationBar__linearFocusItems__block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[location[0] customView];
  objc_storeStrong(location, 0);

  return v3;
}

- (NSMapTable)lastFocusedItems
{
  return self->_lastFocusedItems;
}

- (void)setLastFocusedItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end