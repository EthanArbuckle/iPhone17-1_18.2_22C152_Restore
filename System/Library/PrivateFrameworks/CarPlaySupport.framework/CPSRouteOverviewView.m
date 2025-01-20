@interface CPSRouteOverviewView
+ (id)_multilineLabel;
+ (id)_nameForMapItem:(id)a3;
+ (id)_shortenedAddressForAddress:(id)a3;
+ (void)_applySemiBoldText:(id)a3 fontSize:(double)a4 color:(id)a5 toLabel:(id)a6;
+ (void)_applyText:(id)a3 fontSize:(double)a4 color:(id)a5 toLabel:(id)a6;
- (CPSHidingLabel)destinationAddress;
- (CPSHidingLabel)routeNoteLabel;
- (CPSRouteEstimatesView)estimatesView;
- (CPSRouteOverviewView)initWithFrame:(CGRect)a3;
- (CPTravelEstimates)currentTravelEstimates;
- (CPTrip)representedTrip;
- (NSString)routeNote;
- (UILabel)destinationName;
- (void)_updateTripEstimateStyle;
- (void)setCurrentTravelEstimates:(id)a3;
- (void)setRepresentedTrip:(id)a3;
- (void)setRouteNote:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSRouteOverviewView

+ (id)_multilineLabel
{
  v4[2] = a1;
  v4[1] = (id)a2;
  v4[0] = objc_alloc_init(MEMORY[0x263F1C768]);
  [v4[0] setNumberOfLines:0];
  [v4[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = v4[0];
  objc_storeStrong(v4, 0);

  return v3;
}

+ (void)_applySemiBoldText:(id)a3 fontSize:(double)a4 color:(id)a5 toLabel:(id)a6
{
  v19[2] = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v16 = a4;
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  id v14 = 0;
  objc_storeStrong(&v14, a6);
  if (location[0])
  {
    id v7 = objc_alloc(MEMORY[0x263F086A0]);
    id v6 = location[0];
    v18[0] = *MEMORY[0x263F1C238];
    id v9 = (id)[MEMORY[0x263F1C658] systemFontOfSize:v16 weight:*MEMORY[0x263F1D340]];
    v19[0] = v9;
    v18[1] = *MEMORY[0x263F1C240];
    v19[1] = v15;
    id v8 = (id)[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    id v13 = (id)objc_msgSend(v7, "initWithString:attributes:", v6);

    [v14 setAttributedText:v13];
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

+ (void)_applyText:(id)a3 fontSize:(double)a4 color:(id)a5 toLabel:(id)a6
{
  v19[2] = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v16 = a4;
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  id v14 = 0;
  objc_storeStrong(&v14, a6);
  if (location[0])
  {
    id v7 = objc_alloc(MEMORY[0x263F086A0]);
    id v6 = location[0];
    v18[0] = *MEMORY[0x263F1C238];
    id v9 = (id)[MEMORY[0x263F1C658] systemFontOfSize:v16];
    v19[0] = v9;
    v18[1] = *MEMORY[0x263F1C240];
    v19[1] = v15;
    id v8 = (id)[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    id v13 = (id)objc_msgSend(v7, "initWithString:attributes:", v6);

    [v14 setAttributedText:v13];
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

+ (id)_shortenedAddressForAddress:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)[location[0] mutableCopy];
  objc_msgSend(v5, "setSubAdministrativeArea:");
  [v5 setState:&stru_26DEE39C0];
  [v5 setPostalCode:&stru_26DEE39C0];
  [v5 setCountry:&stru_26DEE39C0];
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);

  return v4;
}

+ (id)_nameForMapItem:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = (id)[location[0] name];

  if (!v6)
  {
    id v5 = (id)[location[0] placemark];
    id v6 = (id)[v5 name];
  }
  id v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (CPSRouteOverviewView)initWithFrame:(CGRect)a3
{
  v58[13] = *MEMORY[0x263EF8340];
  CGRect v57 = a3;
  SEL v55 = a2;
  v56 = 0;
  v54.receiver = self;
  v54.super_class = (Class)CPSRouteOverviewView;
  v56 = -[CPSRouteOverviewView initWithFrame:](&v54, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v56, v56);
  if (v56)
  {
    [(CPSRouteOverviewView *)v56 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v53 = (id)[(id)objc_opt_class() _multilineLabel];
    [(CPSRouteOverviewView *)v56 addSubview:v53];
    objc_msgSend(v53, "setContentCompressionResistancePriority:forAxis:");
    objc_storeStrong((id *)&v56->_destinationName, v53);
    v52 = objc_alloc_init(CPSHidingLabel);
    -[CPSHidingLabel setNumberOfLines:](v52, "setNumberOfLines:");
    [(CPSHidingLabel *)v52 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v3) = 1132134400;
    [(CPSHidingLabel *)v52 setContentCompressionResistancePriority:1 forAxis:v3];
    [(CPSRouteOverviewView *)v56 addSubview:v52];
    objc_storeStrong((id *)&v56->_destinationAddress, v52);
    v51 = objc_alloc_init(CPSHidingLabel);
    [(CPSHidingLabel *)v51 setNumberOfLines:0];
    [(CPSHidingLabel *)v51 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v4) = 1132068864;
    [(CPSHidingLabel *)v51 setContentCompressionResistancePriority:1 forAxis:v4];
    [(CPSRouteOverviewView *)v56 addSubview:v51];
    objc_storeStrong((id *)&v56->_routeNoteLabel, v51);
    id v5 = [[CPSRouteEstimatesView alloc] initWithStyle:1];
    LODWORD(v6) = 1148846080;
    v50 = v5;
    [(CPSRouteEstimatesView *)v5 setContentCompressionResistancePriority:1 forAxis:v6];
    [(CPSRouteOverviewView *)v56 addSubview:v50];
    objc_storeStrong((id *)&v56->_estimatesView, v50);
    [(CPSRouteOverviewView *)v56 _updateTripEstimateStyle];
    id v9 = (void *)MEMORY[0x263F08938];
    id v49 = (id)[v53 leadingAnchor];
    id v48 = (id)[(CPSRouteOverviewView *)v56 leadingAnchor];
    id v47 = (id)objc_msgSend(v49, "constraintEqualToSystemSpacingAfterAnchor:multiplier:");
    v58[0] = v47;
    id v46 = (id)[(CPSRouteOverviewView *)v56 trailingAnchor];
    id v45 = (id)[v53 trailingAnchor];
    id v44 = (id)objc_msgSend(v46, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", 1.0);
    v58[1] = v44;
    id v43 = (id)[(CPSHidingLabel *)v52 leadingAnchor];
    id v42 = (id)[(CPSRouteOverviewView *)v56 leadingAnchor];
    id v41 = (id)objc_msgSend(v43, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", 1.0);
    v58[2] = v41;
    id v40 = (id)[(CPSRouteOverviewView *)v56 trailingAnchor];
    id v39 = (id)[(CPSHidingLabel *)v52 trailingAnchor];
    id v38 = (id)objc_msgSend(v40, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", 1.0);
    v58[3] = v38;
    id v37 = (id)[(CPSHidingLabel *)v51 leadingAnchor];
    id v36 = (id)[(CPSRouteOverviewView *)v56 leadingAnchor];
    id v35 = (id)objc_msgSend(v37, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", 1.0);
    v58[4] = v35;
    id v34 = (id)[(CPSRouteOverviewView *)v56 trailingAnchor];
    id v33 = (id)[(CPSHidingLabel *)v51 trailingAnchor];
    id v32 = (id)objc_msgSend(v34, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", 1.0);
    v58[5] = v32;
    id v31 = (id)[(CPSRouteEstimatesView *)v50 leadingAnchor];
    id v30 = (id)[(CPSRouteOverviewView *)v56 leadingAnchor];
    id v29 = (id)objc_msgSend(v31, "constraintEqualToAnchor:");
    v58[6] = v29;
    id v28 = (id)[(CPSRouteOverviewView *)v56 trailingAnchor];
    id v27 = (id)[(CPSRouteEstimatesView *)v50 trailingAnchor];
    id v26 = (id)objc_msgSend(v28, "constraintEqualToAnchor:");
    v58[7] = v26;
    id v25 = (id)[v53 topAnchor];
    id v24 = (id)[(CPSRouteOverviewView *)v56 topAnchor];
    id v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
    v58[8] = v23;
    id v22 = (id)[(CPSHidingLabel *)v52 topAnchor];
    id v21 = (id)[v53 bottomAnchor];
    id v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:constant:");
    v58[9] = v20;
    id v19 = (id)[(CPSHidingLabel *)v51 topAnchor];
    id v18 = (id)[(CPSHidingLabel *)v52 bottomAnchor];
    id v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:constant:", 2.0);
    v58[10] = v17;
    id v16 = (id)[(CPSRouteEstimatesView *)v50 topAnchor];
    id v15 = (id)[(CPSHidingLabel *)v51 bottomAnchor];
    id v14 = (id)objc_msgSend(v16, "constraintGreaterThanOrEqualToAnchor:");
    v58[11] = v14;
    id v13 = (id)[(CPSRouteOverviewView *)v56 bottomAnchor];
    id v12 = (id)[(CPSRouteEstimatesView *)v50 bottomAnchor];
    id v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:constant:", 2.0);
    v58[12] = v11;
    id v10 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:13];
    objc_msgSend(v9, "activateConstraints:");

    objc_storeStrong((id *)&v50, 0);
    objc_storeStrong((id *)&v51, 0);
    objc_storeStrong((id *)&v52, 0);
    objc_storeStrong(&v53, 0);
  }
  id v8 = v56;
  objc_storeStrong((id *)&v56, 0);
  return v8;
}

- (void)_updateTripEstimateStyle
{
  id v4 = (id)[(CPSRouteOverviewView *)self traitCollection];
  BOOL v5 = [v4 userInterfaceStyle] != 1;

  if (v5)
  {
    v2 = [(CPSRouteOverviewView *)self estimatesView];
    [(CPSRouteEstimatesView *)v2 setTripEstimateStyle:1];
  }
  else
  {
    double v3 = [(CPSRouteOverviewView *)self estimatesView];
    [(CPSRouteEstimatesView *)v3 setTripEstimateStyle:0];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  BOOL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSRouteOverviewView;
  [(CPSRouteOverviewView *)&v3 traitCollectionDidChange:location[0]];
  [(CPSRouteOverviewView *)v5 _updateTripEstimateStyle];
  objc_storeStrong(location, 0);
}

- (void)setRepresentedTrip:(id)a3
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v19->_representedTrip, location[0]);
  id v17 = (id)[location[0] destination];
  id v16 = (id)[(id)objc_opt_class() _nameForMapItem:v17];
  id v4 = objc_opt_class();
  id v3 = v16;
  id v6 = (id)[MEMORY[0x263F1C550] labelColor];
  BOOL v5 = [(CPSRouteOverviewView *)v19 destinationName];
  objc_msgSend(v4, "_applySemiBoldText:fontSize:color:toLabel:", v3, v6, 16.0);

  id v7 = objc_opt_class();
  id v9 = (id)[v17 placemark];
  id v8 = (id)[v9 postalAddress];
  id v15 = (id)objc_msgSend(v7, "_shortenedAddressForAddress:");

  id v14 = (id)[MEMORY[0x263EFEB38] stringFromPostalAddress:v15 style:0];
  id v11 = objc_opt_class();
  id v10 = v14;
  id v13 = (id)[MEMORY[0x263F1C550] _carSystemSecondaryColor];
  id v12 = [(CPSRouteOverviewView *)v19 destinationAddress];
  objc_msgSend(v11, "_applyText:fontSize:color:toLabel:", v10, v13, 12.0);

  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)setRouteNote:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v12->_routeNote, location[0]);
  if (location[0])
  {
    id v5 = objc_alloc(MEMORY[0x263F086A0]);
    id v4 = location[0];
    v13[0] = *MEMORY[0x263F1C238];
    id v8 = (id)[MEMORY[0x263F1C658] systemFontOfSize:12.0];
    v14[0] = v8;
    v13[1] = *MEMORY[0x263F1C240];
    id v7 = (id)[MEMORY[0x263F1C550] labelColor];
    v14[1] = v7;
    id v6 = (id)[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    id v10 = (id)objc_msgSend(v5, "initWithString:attributes:", v4);

    id v9 = [(CPSRouteOverviewView *)v12 routeNoteLabel];
    [(CPSHidingLabel *)v9 setAttributedText:v10];

    objc_storeStrong(&v10, 0);
  }
  else
  {
    id v3 = [(CPSRouteOverviewView *)v12 routeNoteLabel];
    [(CPSHidingLabel *)v3 setAttributedText:0];
  }
  objc_storeStrong(location, 0);
}

- (void)setCurrentTravelEstimates:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v9->_currentTravelEstimates, location[0]);
  id v6 = [(CPSRouteOverviewView *)v9 representedTrip];
  id v5 = [(CPTrip *)v6 destination];
  id v7 = [(MKMapItem *)v5 timeZone];

  if (v7)
  {
    id v4 = [(CPSRouteOverviewView *)v9 estimatesView];
    [(CPSRouteEstimatesView *)v4 setArrivalTimeZone:v7];
  }
  id v3 = [(CPSRouteOverviewView *)v9 estimatesView];
  [(CPSRouteEstimatesView *)v3 setCurrentTravelEstimates:location[0]];

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (CPTrip)representedTrip
{
  return self->_representedTrip;
}

- (UILabel)destinationName
{
  return self->_destinationName;
}

- (CPSHidingLabel)destinationAddress
{
  return self->_destinationAddress;
}

- (CPSHidingLabel)routeNoteLabel
{
  return self->_routeNoteLabel;
}

- (NSString)routeNote
{
  return self->_routeNote;
}

- (CPTravelEstimates)currentTravelEstimates
{
  return self->_currentTravelEstimates;
}

- (CPSRouteEstimatesView)estimatesView
{
  return self->_estimatesView;
}

- (void).cxx_destruct
{
}

@end