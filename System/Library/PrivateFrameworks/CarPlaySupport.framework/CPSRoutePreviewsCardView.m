@interface CPSRoutePreviewsCardView
- (CPSAlternateRoutesView)alternatesView;
- (CPSRoutePreviewsCardView)initWithTripDelegate:(id)a3 trips:(id)a4 textConfiguration:(id)a5;
- (id)_linearFocusItems;
- (id)preferredFocusEnvironments;
- (void)alternateRoutesView:(id)a3 didSelectRouteChoice:(id)a4;
- (void)setSelectedTrip:(id)a3;
@end

@implementation CPSRoutePreviewsCardView

- (CPSRoutePreviewsCardView)initWithTripDelegate:(id)a3 trips:(id)a4 textConfiguration:(id)a5
{
  v61[3] = *MEMORY[0x263EF8340];
  v59 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v57 = 0;
  objc_storeStrong(&v57, a4);
  id v56 = 0;
  objc_storeStrong(&v56, a5);
  v5 = v59;
  v59 = 0;
  v55.receiver = v5;
  v55.super_class = (Class)CPSRoutePreviewsCardView;
  v59 = [(CPSTripPreviewsCardView *)&v55 initWithTripDelegate:location[0] trips:v57 textConfiguration:v56];
  objc_storeStrong((id *)&v59, v59);
  if (v59)
  {
    v10 = [(CPSTripPreviewsCardView *)v59 containerView];
    v54 = [(UIView *)v10 topAnchor];

    v53 = objc_alloc_init(CPSAlternateRoutesView);
    [(CPSAlternateRoutesView *)v53 setSelectionDelegate:v59];
    objc_storeStrong((id *)&v59->_alternatesView, v53);
    v11 = [(CPSTripPreviewsCardView *)v59 containerView];
    [(UIView *)v11 addSubview:v53];

    v12 = (void *)MEMORY[0x263F08938];
    id v23 = (id)[(CPSAlternateRoutesView *)v53 leadingAnchor];
    v22 = [(CPSTripPreviewsCardView *)v59 containerView];
    v21 = [(UIView *)v22 leadingAnchor];
    id v20 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
    v61[0] = v20;
    id v19 = (id)[(CPSAlternateRoutesView *)v53 trailingAnchor];
    v18 = [(CPSTripPreviewsCardView *)v59 containerView];
    v17 = [(UIView *)v18 trailingAnchor];
    id v16 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
    v61[1] = v16;
    id v15 = (id)[(CPSAlternateRoutesView *)v53 topAnchor];
    id v14 = (id)[v15 constraintEqualToAnchor:v54];
    v61[2] = v14;
    id v13 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:3];
    objc_msgSend(v12, "activateConstraints:");

    v6 = (NSLayoutYAxisAnchor *)(id)[(CPSAlternateRoutesView *)v53 bottomAnchor];
    v7 = v54;
    v54 = v6;

    [(CPSTripPreviewsCardView *)v59 setupGoButton];
    v25 = [(CPSTripPreviewsCardView *)v59 containerView];
    v24 = [(CPSTripPreviewsCardView *)v59 goButton];
    -[UIView addSubview:](v25, "addSubview:");

    v26 = (void *)MEMORY[0x263F08938];
    v48 = [(CPSTripPreviewsCardView *)v59 goButton];
    id v47 = (id)[(UIButton *)v48 leadingAnchor];
    v46 = [(CPSTripPreviewsCardView *)v59 containerView];
    v45 = [(UIView *)v46 leadingAnchor];
    id v44 = (id)objc_msgSend(v47, "constraintEqualToAnchor:");
    v60[0] = v44;
    v43 = [(CPSTripPreviewsCardView *)v59 goButton];
    id v42 = (id)[(UIButton *)v43 trailingAnchor];
    v41 = [(CPSTripPreviewsCardView *)v59 containerView];
    v40 = [(UIView *)v41 trailingAnchor];
    id v39 = (id)objc_msgSend(v42, "constraintEqualToAnchor:");
    v60[1] = v39;
    v38 = [(CPSTripPreviewsCardView *)v59 goButton];
    id v37 = (id)[(UIButton *)v38 topAnchor];
    id v36 = (id)[v37 constraintEqualToAnchor:v54 constant:2.0];
    v60[2] = v36;
    v35 = [(CPSTripPreviewsCardView *)v59 goButton];
    id v34 = (id)[(UIButton *)v35 heightAnchor];
    id v33 = (id)[v34 constraintEqualToConstant:29.0];
    v60[3] = v33;
    v32 = [(CPSTripPreviewsCardView *)v59 goButton];
    id v31 = (id)[(UIButton *)v32 bottomAnchor];
    v30 = [(CPSTripPreviewsCardView *)v59 containerView];
    v29 = [(UIView *)v30 bottomAnchor];
    id v28 = (id)objc_msgSend(v31, "constraintEqualToAnchor:");
    v60[4] = v28;
    id v27 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:5];
    objc_msgSend(v26, "activateConstraints:");

    v49 = v59;
    id v50 = (id)[v57 firstObject];
    -[CPSRoutePreviewsCardView setSelectedTrip:](v49, "setSelectedTrip:");

    objc_storeStrong((id *)&v53, 0);
    objc_storeStrong((id *)&v54, 0);
  }
  v9 = v59;
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v59, 0);
  return v9;
}

- (void)setSelectedTrip:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)CPSRoutePreviewsCardView;
  [(CPSTripPreviewsCardView *)&v6 setSelectedTrip:location[0]];
  v3 = [(CPSRoutePreviewsCardView *)v8 alternatesView];
  [(CPSAlternateRoutesView *)v3 setIndexForSelectedRoute:0];

  v5 = [(CPSRoutePreviewsCardView *)v8 alternatesView];
  id v4 = (id)[location[0] routeChoices];
  [(CPSAlternateRoutesView *)v5 setAvailableRouteChoices:"setAvailableRouteChoices:"];

  objc_storeStrong(location, 0);
}

- (void)alternateRoutesView:(id)a3 didSelectRouteChoice:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(CPSTripPreviewsCardView *)v7 setSelectedRouteChoice:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (id)preferredFocusEnvironments
{
  v9 = self;
  v8[1] = (id)a2;
  v8[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  v7 = [(CPSRoutePreviewsCardView *)v9 alternatesView];

  if (v7)
  {
    objc_super v6 = [(CPSRoutePreviewsCardView *)v9 alternatesView];
    objc_msgSend(v8[0], "addObject:");
  }
  id v5 = [(CPSTripPreviewsCardView *)v9 goButton];

  if (v5)
  {
    id v4 = [(CPSTripPreviewsCardView *)v9 goButton];
    objc_msgSend(v8[0], "addObject:");
  }
  id v3 = v8[0];
  objc_storeStrong(v8, 0);

  return v3;
}

- (id)_linearFocusItems
{
  id v13 = self;
  v12[1] = (id)a2;
  v12[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  v9 = [(CPSRoutePreviewsCardView *)v13 alternatesView];

  if (v9)
  {
    v8 = [(CPSRoutePreviewsCardView *)v13 alternatesView];
    id v7 = [(CPSAlternateRoutesView *)v8 _linearFocusItems];
    objc_msgSend(v12[0], "addObjectsFromArray:");
  }
  id v5 = [(CPSTripPreviewsCardView *)v13 goButton];
  char v10 = 0;
  LOBYTE(v6) = 0;
  if (v5)
  {
    v11 = [(CPSTripPreviewsCardView *)v13 goButton];
    char v10 = 1;
    int v6 = [(UIButton *)v11 isHidden] ^ 1;
  }
  if (v10) {

  }
  if (v6)
  {
    id v4 = [(CPSTripPreviewsCardView *)v13 goButton];
    objc_msgSend(v12[0], "addObject:");
  }
  id v3 = v12[0];
  objc_storeStrong(v12, 0);

  return v3;
}

- (CPSAlternateRoutesView)alternatesView
{
  return self->_alternatesView;
}

- (void).cxx_destruct
{
}

@end