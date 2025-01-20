@interface CPSTripPreviewsCardView
- (CPRouteChoice)selectedRouteChoice;
- (CPSCardPlatterView)backgroundPlatterView;
- (CPSTripInitiating)tripDelegate;
- (CPSTripPreviewsCardView)initWithTripDelegate:(id)a3 trips:(id)a4 textConfiguration:(id)a5;
- (CPTrip)selectedTrip;
- (CPTripPreviewTextConfiguration)textConfiguration;
- (NSArray)trips;
- (UIButton)goButton;
- (UIView)containerView;
- (id)_linearFocusItems;
- (void)_updateButtonColors;
- (void)notifyDidSelectRouteChoice:(id)a3;
- (void)setSelectedRouteChoice:(id)a3;
- (void)setSelectedTrip:(id)a3;
- (void)setTextConfiguration:(id)a3;
- (void)setupGoButton;
- (void)startTripButtonPressed:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateEstimates:(id)a3 forTripIdentifier:(id)a4;
@end

@implementation CPSTripPreviewsCardView

- (CPSTripPreviewsCardView)initWithTripDelegate:(id)a3 trips:(id)a4 textConfiguration:(id)a5
{
  v48[4] = *MEMORY[0x263EF8340];
  v46 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v44 = 0;
  objc_storeStrong(&v44, a4);
  id v43 = 0;
  objc_storeStrong(&v43, a5);
  v5 = v46;
  v46 = 0;
  v42.receiver = v5;
  v42.super_class = (Class)CPSTripPreviewsCardView;
  v46 = [(CPSTripPreviewsCardView *)&v42 init];
  objc_storeStrong((id *)&v46, v46);
  if (v46)
  {
    objc_storeWeak((id *)&v46->_tripDelegate, location[0]);
    objc_storeStrong((id *)&v46->_trips, v44);
    objc_storeStrong((id *)&v46->_textConfiguration, v43);
    [(CPSTripPreviewsCardView *)v46 setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [CPSCardPlatterView alloc];
    v23 = (double *)MEMORY[0x263F001A8];
    v41 = -[CPSCardPlatterView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(CPSCardPlatterView *)v41 setShadowWithRadius:20.0 opacity:0.18];
    [(CPSCardPlatterView *)v41 setClipsToBounds:0];
    [(CPSTripPreviewsCardView *)v46 addSubview:v41];
    objc_storeStrong((id *)&v46->_backgroundPlatterView, v41);
    v9 = (void *)MEMORY[0x263F08938];
    id v22 = (id)[(CPSCardPlatterView *)v46->_backgroundPlatterView leadingAnchor];
    id v21 = (id)[(CPSTripPreviewsCardView *)v46 leadingAnchor];
    id v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:");
    v48[0] = v20;
    id v19 = (id)[(CPSCardPlatterView *)v46->_backgroundPlatterView topAnchor];
    id v18 = (id)[(CPSTripPreviewsCardView *)v46 topAnchor];
    id v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
    v48[1] = v17;
    id v16 = (id)[(CPSCardPlatterView *)v46->_backgroundPlatterView trailingAnchor];
    id v15 = (id)[(CPSTripPreviewsCardView *)v46 trailingAnchor];
    id v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
    v48[2] = v14;
    id v13 = (id)[(CPSCardPlatterView *)v46->_backgroundPlatterView bottomAnchor];
    id v12 = (id)[(CPSTripPreviewsCardView *)v46 bottomAnchor];
    id v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
    v48[3] = v11;
    id v10 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v48);
    objc_msgSend(v9, "activateConstraints:");

    id v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", *v23, v23[1], v23[2], v23[3]);
    [v40 setClipsToBounds:0];
    [v40 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPSCardPlatterView *)v41 addSubview:v40];
    objc_storeStrong((id *)&v46->_containerView, v40);
    v24 = (void *)MEMORY[0x263F08938];
    id v37 = (id)[v40 leadingAnchor];
    id v36 = (id)[(CPSCardPlatterView *)v41 leadingAnchor];
    id v35 = (id)objc_msgSend(v37, "constraintEqualToAnchor:constant:");
    v47[0] = v35;
    id v34 = (id)[v40 topAnchor];
    id v33 = (id)[(CPSCardPlatterView *)v41 topAnchor];
    id v32 = (id)objc_msgSend(v34, "constraintEqualToAnchor:constant:", 5.0);
    v47[1] = v32;
    id v31 = (id)[v40 trailingAnchor];
    id v30 = (id)[(CPSCardPlatterView *)v41 trailingAnchor];
    id v29 = (id)objc_msgSend(v31, "constraintEqualToAnchor:constant:");
    v47[2] = v29;
    id v28 = (id)[v40 bottomAnchor];
    id v27 = (id)[(CPSCardPlatterView *)v41 bottomAnchor];
    id v26 = (id)objc_msgSend(v28, "constraintEqualToAnchor:constant:", -5.0);
    v47[3] = v26;
    id v25 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:4];
    objc_msgSend(v24, "activateConstraints:");

    [v40 setClipsToBounds:1];
    objc_storeStrong(&v40, 0);
    objc_storeStrong((id *)&v41, 0);
  }
  v8 = v46;
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v46, 0);
  return v8;
}

- (void)traitCollectionDidChange:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSTripPreviewsCardView;
  [(CPSTripPreviewsCardView *)&v3 traitCollectionDidChange:location[0]];
  [(CPSTripPreviewsCardView *)v5 _updateButtonColors];
  objc_storeStrong(location, 0);
}

- (void)_updateButtonColors
{
  objc_super v3 = [(CPSTripPreviewsCardView *)self goButton];
  id v2 = (id)[MEMORY[0x263F1C550] systemGreenColor];
  -[UIButton cps_setBackgroundColor:forState:](v3, "cps_setBackgroundColor:forState:");

  v6 = [(CPSTripPreviewsCardView *)self goButton];
  id v5 = (id)[MEMORY[0x263F1C550] systemGreenColor];
  id v4 = (id)[v5 colorWithAlphaComponent:0.12];
  -[UIButton cps_setBackgroundColor:forState:](v6, "cps_setBackgroundColor:forState:");

  v9 = [(CPSTripPreviewsCardView *)self goButton];
  id v8 = (id)[MEMORY[0x263F1C550] systemGreenColor];
  id v7 = (id)[v8 colorWithAlphaComponent:0.8];
  -[UIButton cps_setBackgroundColor:forState:](v9, "cps_setBackgroundColor:forState:");
}

- (void)setupGoButton
{
  v35[2] = *MEMORY[0x263EF8340];
  id v29 = self;
  v28[1] = (id)a2;
  v28[0] = (id)[MEMORY[0x263F1C488] buttonWithType:0];
  [v28[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v2) = 1148846080;
  [v28[0] setContentHuggingPriority:1 forAxis:v2];
  id v20 = [(CPTripPreviewTextConfiguration *)v29->_textConfiguration startButtonTitle];
  char v25 = 0;
  if (v20)
  {
    objc_super v3 = v20;
  }
  else
  {
    id v26 = CPSLocalizedStringForKey(@"GO");
    char v25 = 1;
    objc_super v3 = (NSString *)v26;
  }
  id v27 = v3;
  if (v25) {

  }
  id v24 = (id)[MEMORY[0x263F1C658] systemFontOfSize:15.0 weight:*MEMORY[0x263F1D340]];
  id v5 = objc_alloc(MEMORY[0x263F086A0]);
  id v4 = v27;
  id v12 = (void *)MEMORY[0x263F1C238];
  v34[0] = *MEMORY[0x263F1C238];
  v35[0] = v24;
  id v13 = (void *)MEMORY[0x263F1C240];
  v34[1] = *MEMORY[0x263F1C240];
  id v7 = (id)[MEMORY[0x263F1C550] externalSystemGreenColor];
  v35[1] = v7;
  id v6 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34);
  id v23 = (id)objc_msgSend(v5, "initWithString:attributes:", v4);

  [v28[0] setAttributedTitle:v23 forState:0];
  id v9 = objc_alloc(MEMORY[0x263F086A0]);
  id v8 = v27;
  v32[0] = *v12;
  v33[0] = v24;
  v32[1] = *v13;
  id v11 = (id)[MEMORY[0x263F1C550] labelColor];
  v33[1] = v11;
  id v10 = (id)[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  id v22 = (id)objc_msgSend(v9, "initWithString:attributes:", v8);

  [v28[0] setAttributedTitle:v22 forState:8];
  id v15 = objc_alloc(MEMORY[0x263F086A0]);
  id v14 = v27;
  v30[0] = *v12;
  v31[0] = v24;
  v30[1] = *v13;
  id v17 = (id)[MEMORY[0x263F1C550] labelColor];
  v31[1] = v17;
  id v16 = (id)[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  id v21 = (id)objc_msgSend(v15, "initWithString:attributes:", v14);

  [v28[0] setAttributedTitle:v21 forState:1];
  [v28[0] addTarget:v29 action:sel_startTripButtonPressed_ forControlEvents:0x2000];
  id v18 = (id)[v28[0] layer];
  [v18 setCornerRadius:6.0];

  id v19 = (id)[v28[0] layer];
  [v19 setCornerCurve:*MEMORY[0x263F15A20]];

  [v28[0] setClipsToBounds:1];
  objc_storeStrong((id *)&v29->_goButton, v28[0]);
  [(CPSTripPreviewsCardView *)v29 _updateButtonColors];
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong((id *)&v27, 0);
  objc_storeStrong(v28, 0);
}

- (void)setSelectedTrip:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v7->_selectedTrip, location[0]);
  id v5 = (id)[location[0] routeChoices];
  objc_super v3 = v7;
  id v4 = (id)[v5 firstObject];
  [(CPSTripPreviewsCardView *)v3 setSelectedRouteChoice:"setSelectedRouteChoice:"];

  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)setSelectedRouteChoice:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v4->_selectedRouteChoice, location[0]);
  [(CPSTripPreviewsCardView *)v4 notifyDidSelectRouteChoice:location[0]];
  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forTripIdentifier:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)startTripButtonPressed:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = [(CPSTripPreviewsCardView *)v9 selectedTrip];
  id v6 = [(CPSTripPreviewsCardView *)v9 selectedRouteChoice];
  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v10, (uint64_t)v7, (uint64_t)v6);
    _os_log_impl(&dword_22B689000, oslog, type, "start selected trip: %@ route: %@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v3 = [(CPSTripPreviewsCardView *)v9 tripDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 tripView:v9 startedTrip:v7 routeChoice:v6];
  }
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)notifyDidSelectRouteChoice:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = CarPlaySupportGeneralLogging();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)location[0]);
    _os_log_impl(&dword_22B689000, (os_log_t)v7, v6, "route selected: %@", v10, 0xCu);
  }
  objc_storeStrong(&v7, 0);
  id v5 = [(CPSTripPreviewsCardView *)v9 tripDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v3 = v9;
    id v4 = [(CPSTripPreviewsCardView *)v9 selectedTrip];
    objc_msgSend(v5, "tripView:selectedTrip:routeChoice:", v3);
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (id)_linearFocusItems
{
  return MEMORY[0x263EFFA68];
}

- (NSArray)trips
{
  return self->_trips;
}

- (UIButton)goButton
{
  return self->_goButton;
}

- (CPTripPreviewTextConfiguration)textConfiguration
{
  return self->_textConfiguration;
}

- (void)setTextConfiguration:(id)a3
{
}

- (CPTrip)selectedTrip
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedTrip);

  return (CPTrip *)WeakRetained;
}

- (CPRouteChoice)selectedRouteChoice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedRouteChoice);

  return (CPRouteChoice *)WeakRetained;
}

- (CPSCardPlatterView)backgroundPlatterView
{
  return self->_backgroundPlatterView;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (CPSTripInitiating)tripDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tripDelegate);

  return (CPSTripInitiating *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end