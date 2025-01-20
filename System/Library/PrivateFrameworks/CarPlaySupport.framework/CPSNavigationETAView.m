@interface CPSNavigationETAView
+ (id)createPlatterView;
- (CPSCardPlatterView)cardPlatterView;
- (CPSNavigationETAView)initWithTrip:(id)a3 style:(unint64_t)a4;
- (CPSRouteEstimatesView)routeEstimatesView;
- (CPTrip)trip;
- (UIVisualEffectView)material;
- (id)backgroundColorFromEstimatesStyle;
- (unint64_t)tripEstimateStyle;
- (void)_updateStyle;
- (void)setCardPlatterView:(id)a3;
- (void)setMaterial:(id)a3;
- (void)setTripEstimateStyle:(unint64_t)a3;
- (void)showManeuvers:(id)a3;
- (void)updateEstimates:(id)a3 forManeuver:(id)a4;
@end

@implementation CPSNavigationETAView

- (CPSNavigationETAView)initWithTrip:(id)a3 style:(unint64_t)a4
{
  v56[4] = *MEMORY[0x263EF8340];
  v54 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v52 = a4;
  v4 = v54;
  v54 = 0;
  v51.receiver = v4;
  v51.super_class = (Class)CPSNavigationETAView;
  v47 = -[CPSNavigationETAView initWithFrame:](&v51, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v54 = v47;
  objc_storeStrong((id *)&v54, v47);
  if (v47)
  {
    objc_storeStrong((id *)&v54->_trip, location[0]);
    v54->_tripEstimateStyle = v52;
    id v50 = (id)[(id)objc_opt_class() createPlatterView];
    id v31 = [(CPSNavigationETAView *)v54 backgroundColorFromEstimatesStyle];
    objc_msgSend(v50, "setBackgroundColor:");

    [v50 setShadowWithRadius:20.0 opacity:0.18];
    objc_storeStrong((id *)&v54->_cardPlatterView, v50);
    [(CPSNavigationETAView *)v54 addSubview:v50];
    v32 = (void *)MEMORY[0x263F08938];
    id v45 = (id)[v50 leadingAnchor];
    id v44 = (id)[(CPSNavigationETAView *)v54 leadingAnchor];
    id v43 = (id)objc_msgSend(v45, "constraintEqualToAnchor:");
    v56[0] = v43;
    id v42 = (id)[v50 topAnchor];
    id v41 = (id)[(CPSNavigationETAView *)v54 topAnchor];
    id v40 = (id)objc_msgSend(v42, "constraintEqualToAnchor:");
    v56[1] = v40;
    id v39 = (id)[v50 trailingAnchor];
    id v38 = (id)[(CPSNavigationETAView *)v54 trailingAnchor];
    id v37 = (id)objc_msgSend(v39, "constraintEqualToAnchor:");
    v56[2] = v37;
    id v36 = (id)[v50 bottomAnchor];
    id v35 = (id)[(CPSNavigationETAView *)v54 bottomAnchor];
    id v34 = (id)objc_msgSend(v36, "constraintEqualToAnchor:");
    v56[3] = v34;
    id v33 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:4];
    objc_msgSend(v32, "activateConstraints:");

    [(CPSNavigationETAView *)v54 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v49 = (id)[location[0] destination];
    v5 = [CPSRouteEstimatesView alloc];
    uint64_t v6 = [(CPSRouteEstimatesView *)v5 initWithStyle:v52];
    routeEstimatesView = v54->_routeEstimatesView;
    v54->_routeEstimatesView = (CPSRouteEstimatesView *)v6;

    id v48 = (id)[v49 timeZone];
    if (v48)
    {
      v30 = [(CPSNavigationETAView *)v54 routeEstimatesView];
      [(CPSRouteEstimatesView *)v30 setArrivalTimeZone:v48];
    }
    v10 = v54;
    v11 = [(CPSNavigationETAView *)v54 routeEstimatesView];
    -[CPSNavigationETAView addSubview:](v10, "addSubview:");

    v12 = (void *)MEMORY[0x263F08938];
    v29 = [(CPSNavigationETAView *)v54 routeEstimatesView];
    id v28 = (id)[(CPSRouteEstimatesView *)v29 leadingAnchor];
    id v27 = (id)[(CPSNavigationETAView *)v54 leadingAnchor];
    id v26 = (id)objc_msgSend(v28, "constraintEqualToAnchor:");
    v55[0] = v26;
    v25 = [(CPSNavigationETAView *)v54 routeEstimatesView];
    id v24 = (id)[(CPSRouteEstimatesView *)v25 trailingAnchor];
    id v23 = (id)[(CPSNavigationETAView *)v54 trailingAnchor];
    id v22 = (id)objc_msgSend(v24, "constraintEqualToAnchor:");
    v55[1] = v22;
    v21 = [(CPSNavigationETAView *)v54 routeEstimatesView];
    id v20 = (id)[(CPSRouteEstimatesView *)v21 centerYAnchor];
    id v19 = (id)[(CPSNavigationETAView *)v54 centerYAnchor];
    id v18 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
    v55[2] = v18;
    v17 = [(CPSNavigationETAView *)v54 routeEstimatesView];
    id v16 = (id)[(CPSRouteEstimatesView *)v17 bottomAnchor];
    id v15 = (id)[(CPSNavigationETAView *)v54 bottomAnchor];
    id v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:constant:", 8.0);
    v55[3] = v14;
    id v13 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:4];
    objc_msgSend(v12, "activateConstraints:");

    objc_storeStrong(&v48, 0);
    objc_storeStrong(&v49, 0);
    objc_storeStrong(&v50, 0);
  }
  v9 = v54;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v54, 0);
  return v9;
}

- (void)setTripEstimateStyle:(unint64_t)a3
{
  if (self->_tripEstimateStyle != a3)
  {
    self->_tripEstimateStyle = a3;
    [(CPSNavigationETAView *)self _updateStyle];
  }
}

- (void)_updateStyle
{
  id v3 = [(CPSNavigationETAView *)self backgroundColorFromEstimatesStyle];
  v2 = [(CPSNavigationETAView *)self cardPlatterView];
  [(CPSCardPlatterView *)v2 setBackgroundColor:v3];

  v4 = [(CPSNavigationETAView *)self routeEstimatesView];
  [(CPSRouteEstimatesView *)v4 setTripEstimateStyle:[(CPSNavigationETAView *)self tripEstimateStyle]];
}

- (id)backgroundColorFromEstimatesStyle
{
  if ([(CPSNavigationETAView *)self tripEstimateStyle] == 1)
  {
    id v4 = (id)[MEMORY[0x263F1C550] blackColor];
    id v5 = (id)[v4 colorWithAlphaComponent:0.65];
  }
  else
  {
    id v3 = (id)[MEMORY[0x263F1C550] whiteColor];
    id v5 = (id)[v3 colorWithAlphaComponent:0.75];
  }

  return v5;
}

- (void)showManeuvers:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forManeuver:(id)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  id v5 = [(CPSNavigationETAView *)v8 routeEstimatesView];
  [(CPSRouteEstimatesView *)v5 setCurrentTravelEstimates:location[0]];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

+ (id)createPlatterView
{
  v2 = [CPSCardPlatterView alloc];
  id v3 = -[CPSCardPlatterView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  return v3;
}

- (CPSCardPlatterView)cardPlatterView
{
  return self->_cardPlatterView;
}

- (void)setCardPlatterView:(id)a3
{
}

- (CPTrip)trip
{
  return self->_trip;
}

- (CPSRouteEstimatesView)routeEstimatesView
{
  return self->_routeEstimatesView;
}

- (unint64_t)tripEstimateStyle
{
  return self->_tripEstimateStyle;
}

- (UIVisualEffectView)material
{
  return self->_material;
}

- (void)setMaterial:(id)a3
{
}

- (void).cxx_destruct
{
}

@end