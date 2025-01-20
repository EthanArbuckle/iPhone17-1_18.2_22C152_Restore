@interface FUFlightInfoView
+ (id)flightViewForStyle:(unint64_t)a3 compact:(BOOL)a4;
- (FUFlight)flight;
- (FUFlightInfoViewProtocol)delegate;
- (FUFlightLeg)leg;
- (FULabel)labelAirlineName;
- (FULabel)labelArrivalCity;
- (FULabel)labelArrivalCode;
- (FULabel)labelArrivalDate;
- (FULabel)labelArrivalDelay;
- (FULabel)labelArrivalInfo1;
- (FULabel)labelArrivalInfo2;
- (FULabel)labelArrivalTime;
- (FULabel)labelArrivalTitle;
- (FULabel)labelBaggageClaimTitle;
- (FULabel)labelBaggageClaimValue;
- (FULabel)labelDepartureCity;
- (FULabel)labelDepartureCode;
- (FULabel)labelDepartureDate;
- (FULabel)labelDepartureDelay;
- (FULabel)labelDepartureInfo1;
- (FULabel)labelDepartureInfo2;
- (FULabel)labelDepartureTime;
- (FULabel)labelDepartureTitle;
- (FULabel)labelDurationComplete;
- (FULabel)labelDurationTitle;
- (FULabel)labelDurationValue;
- (FULabel)labelFlightCode;
- (FULabel)labelStatus;
- (FULabel)labelStatusTitle;
- (FUSeparator)sep5;
- (NSLayoutConstraint)arrivalDelayConstraint;
- (NSLayoutConstraint)arrivalGateConstraint;
- (NSLayoutConstraint)arrivalTerminalConstraint;
- (NSLayoutConstraint)bottomMargin;
- (NSLayoutConstraint)departureDelayConstraint;
- (NSLayoutConstraint)departureGateConstraint;
- (NSLayoutConstraint)departureTerminalConstraint;
- (NSLayoutConstraint)leadingInset;
- (NSLayoutConstraint)trailingInset;
- (NSLayoutConstraint)trailingSeparatorsInset;
- (UIButton)flightButton;
- (double)standardTableCellContentInset;
- (id)formattedDurationForDuration:(double)a3;
- (int64_t)currentFocus;
- (unint64_t)style;
- (void)addDateTimeAttributesToString:(id)a3 striked:(BOOL)a4 alignment:(int64_t)a5;
- (void)awakeFromNib;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)flightButtonTapped:(id)a3;
- (void)setArrivalDelayConstraint:(id)a3;
- (void)setArrivalGateConstraint:(id)a3;
- (void)setArrivalTerminalConstraint:(id)a3;
- (void)setBottomMargin:(id)a3;
- (void)setCurrentFocus:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDepartureDelayConstraint:(id)a3;
- (void)setDepartureGateConstraint:(id)a3;
- (void)setDepartureTerminalConstraint:(id)a3;
- (void)setFlight:(id)a3 legIndex:(unint64_t)a4 multiFlights:(BOOL)a5 spotlightMode:(BOOL)a6;
- (void)setFlightButton:(id)a3;
- (void)setLabelAirlineName:(id)a3;
- (void)setLabelArrivalCity:(id)a3;
- (void)setLabelArrivalCode:(id)a3;
- (void)setLabelArrivalDate:(id)a3;
- (void)setLabelArrivalDelay:(id)a3;
- (void)setLabelArrivalInfo1:(id)a3;
- (void)setLabelArrivalInfo2:(id)a3;
- (void)setLabelArrivalTime:(id)a3;
- (void)setLabelArrivalTitle:(id)a3;
- (void)setLabelBaggageClaimTitle:(id)a3;
- (void)setLabelBaggageClaimValue:(id)a3;
- (void)setLabelDepartureCity:(id)a3;
- (void)setLabelDepartureCode:(id)a3;
- (void)setLabelDepartureDate:(id)a3;
- (void)setLabelDepartureDelay:(id)a3;
- (void)setLabelDepartureInfo1:(id)a3;
- (void)setLabelDepartureInfo2:(id)a3;
- (void)setLabelDepartureTime:(id)a3;
- (void)setLabelDepartureTitle:(id)a3;
- (void)setLabelDurationComplete:(id)a3;
- (void)setLabelDurationTitle:(id)a3;
- (void)setLabelDurationValue:(id)a3;
- (void)setLabelFlightCode:(id)a3;
- (void)setLabelStatus:(id)a3;
- (void)setLabelStatusTitle:(id)a3;
- (void)setLeadingInset:(id)a3;
- (void)setSep5:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTrailingInset:(id)a3;
- (void)setTrailingSeparatorsInset:(id)a3;
- (void)setupLabelStylesWithStyle:(unint64_t)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAirlineInformation;
- (void)updateDateTimeForDeparture:(BOOL)a3;
- (void)updateDelayInfo;
- (void)updateFlightButtonIcon;
- (void)updateFlightDates;
- (void)updateFlightStatus;
- (void)updateFlightTerminalInfo;
- (void)updateForFollowupContent:(BOOL)a3;
- (void)updateLabelVisibility:(id)a3 constraint:(id)a4;
- (void)updateLocationInfo;
- (void)updateTimeLabel:(id)a3 constraint:(id)a4 withString:(id)a5;
@end

@implementation FUFlightInfoView

+ (id)flightViewForStyle:(unint64_t)a3 compact:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 loadNibNamed:@"FUFlightInfoView" owner:0 options:0];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  id v8 = (id)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = v11;
          objc_msgSend(v8, "setupLabelStylesWithStyle:", a3, (void)v13);
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3) {
    -[FUFlightInfoView setupLabelStylesWithStyle:](self, "setupLabelStylesWithStyle:");
  }
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)FUFlightInfoView;
  [(FUFlightInfoView *)&v3 awakeFromNib];
  self->_awake = 1;
  if (self->_style) {
    -[FUFlightInfoView setupLabelStylesWithStyle:](self, "setupLabelStylesWithStyle:");
  }
}

- (double)standardTableCellContentInset
{
  v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 _referenceBounds];
  if (CGRectGetWidth(v5) < 414.0) {
    double v3 = 16.0;
  }
  else {
    double v3 = 20.0;
  }

  return v3;
}

- (void)setupLabelStylesWithStyle:(unint64_t)a3
{
  self->_style = a3;
  if (self->_awake)
  {
    v4 = +[FUStyleProvider providerForStyle:](FUStyleProvider, "providerForStyle:");
    objc_storeStrong((id *)&self->_styleProvider, v4);
    CGRect v5 = [(FUFlightInfoView *)self labelAirlineName];
    [v5 setStyleProvider:v4 primaryStyle:1];

    v6 = [(FUFlightInfoView *)self labelFlightCode];
    [v6 setStyleProvider:v4 primaryStyle:0];

    id v7 = [(FUFlightInfoView *)self labelStatusTitle];
    [v7 setStyleProvider:v4 primaryStyle:1];

    id v8 = [(FUFlightInfoView *)self labelStatus];
    [v8 setStyleProvider:v4 primaryStyle:1];

    uint64_t v9 = [(FUFlightInfoView *)self labelDepartureCity];
    [v9 setStyleProvider:v4 primaryStyle:0];

    v10 = [(FUFlightInfoView *)self labelDepartureCode];
    [v10 setStyleProvider:v4 primaryStyle:1];

    v11 = [(FUFlightInfoView *)self labelDepartureInfo1];
    [v11 setStyleProvider:v4 primaryStyle:0];

    v12 = [(FUFlightInfoView *)self labelDepartureInfo2];
    [v12 setStyleProvider:v4 primaryStyle:0];

    long long v13 = [(FUFlightInfoView *)self labelArrivalCity];
    [v13 setStyleProvider:v4 primaryStyle:0];

    long long v14 = [(FUFlightInfoView *)self labelArrivalCode];
    [v14 setStyleProvider:v4 primaryStyle:1];

    long long v15 = [(FUFlightInfoView *)self labelArrivalInfo1];
    [v15 setStyleProvider:v4 primaryStyle:0];

    long long v16 = [(FUFlightInfoView *)self labelArrivalInfo2];
    [v16 setStyleProvider:v4 primaryStyle:0];

    v17 = [(FUFlightInfoView *)self labelDepartureTitle];
    [v17 setStyleProvider:v4 primaryStyle:1];

    uint64_t v18 = [(FUFlightInfoView *)self labelArrivalTitle];
    [v18 setStyleProvider:v4 primaryStyle:1];

    v19 = [(FUFlightInfoView *)self labelDepartureDate];
    [v19 setStyleProvider:v4 primaryStyle:1];

    v20 = [(FUFlightInfoView *)self labelArrivalDate];
    [v20 setStyleProvider:v4 primaryStyle:1];

    v21 = [(FUFlightInfoView *)self labelDepartureTime];
    [v21 setStyleProvider:v4 primaryStyle:1];

    v22 = [(FUFlightInfoView *)self labelArrivalTime];
    [v22 setStyleProvider:v4 primaryStyle:1];

    v23 = [(FUFlightInfoView *)self labelDepartureDelay];
    [v23 setStyleProvider:v4 primaryStyle:0];

    v24 = [(FUFlightInfoView *)self labelArrivalDelay];
    [v24 setStyleProvider:v4 primaryStyle:0];

    v25 = [(FUFlightInfoView *)self labelDurationTitle];
    [v25 setStyleProvider:v4 primaryStyle:1];

    v26 = [(FUFlightInfoView *)self labelDurationValue];
    [v26 setStyleProvider:v4 primaryStyle:1];

    v27 = [(FUFlightInfoView *)self labelDurationComplete];
    [v27 setStyleProvider:v4 primaryStyle:0];

    v28 = [(FUFlightInfoView *)self labelBaggageClaimTitle];
    [v28 setStyleProvider:v4 primaryStyle:1];

    v29 = [(FUFlightInfoView *)self labelBaggageClaimValue];
    [v29 setStyleProvider:v4 primaryStyle:1];

    v30 = [(FUFlightInfoView *)self labelStatusTitle];
    v31 = [(FUFlightInfoView *)self labelAirlineName];
    [v31 setAssociatedScalingLabel:v30];

    v32 = [(FUFlightInfoView *)self labelAirlineName];
    v33 = [(FUFlightInfoView *)self labelStatusTitle];
    [v33 setAssociatedScalingLabel:v32];

    v34 = [(FUFlightInfoView *)self labelStatus];
    v35 = [(FUFlightInfoView *)self labelFlightCode];
    [v35 setAssociatedScalingLabel:v34];

    v36 = [(FUFlightInfoView *)self labelFlightCode];
    v37 = [(FUFlightInfoView *)self labelStatus];
    [v37 setAssociatedScalingLabel:v36];

    v38 = [(FUFlightInfoView *)self labelArrivalCity];
    v39 = [(FUFlightInfoView *)self labelDepartureCity];
    [v39 setAssociatedScalingLabel:v38];

    v40 = [(FUFlightInfoView *)self labelDepartureCity];
    v41 = [(FUFlightInfoView *)self labelArrivalCity];
    [v41 setAssociatedScalingLabel:v40];

    v42 = [(FUFlightInfoView *)self labelDepartureCode];
    v43 = [(FUFlightInfoView *)self labelArrivalCode];
    [v43 setAssociatedScalingLabel:v42];

    v44 = [(FUFlightInfoView *)self labelArrivalCode];
    v45 = [(FUFlightInfoView *)self labelDepartureCode];
    [v45 setAssociatedScalingLabel:v44];

    v46 = [(FUFlightInfoView *)self labelArrivalInfo1];
    v47 = [(FUFlightInfoView *)self labelDepartureInfo1];
    [v47 setAssociatedScalingLabel:v46];

    v48 = [(FUFlightInfoView *)self labelDepartureInfo1];
    v49 = [(FUFlightInfoView *)self labelArrivalInfo1];
    [v49 setAssociatedScalingLabel:v48];

    v50 = [(FUFlightInfoView *)self labelArrivalInfo2];
    v51 = [(FUFlightInfoView *)self labelDepartureInfo2];
    [v51 setAssociatedScalingLabel:v50];

    v52 = [(FUFlightInfoView *)self labelDepartureInfo2];
    v53 = [(FUFlightInfoView *)self labelArrivalInfo2];
    [v53 setAssociatedScalingLabel:v52];

    v54 = [(FUFlightInfoView *)self labelDepartureTime];
    v55 = [(FUFlightInfoView *)self labelDepartureTitle];
    [v55 setAssociatedScalingLabel:v54];

    v56 = [(FUFlightInfoView *)self labelDepartureTitle];
    v57 = [(FUFlightInfoView *)self labelDepartureTime];
    [v57 setAssociatedScalingLabel:v56];

    v58 = [(FUFlightInfoView *)self labelDepartureDate];
    v59 = [(FUFlightInfoView *)self labelDepartureDelay];
    [v59 setAssociatedScalingLabel:v58];

    v60 = [(FUFlightInfoView *)self labelDepartureDelay];
    v61 = [(FUFlightInfoView *)self labelDepartureDate];
    [v61 setAssociatedScalingLabel:v60];

    v62 = [(FUFlightInfoView *)self labelArrivalTime];
    v63 = [(FUFlightInfoView *)self labelArrivalTitle];
    [v63 setAssociatedScalingLabel:v62];

    v64 = [(FUFlightInfoView *)self labelArrivalTitle];
    v65 = [(FUFlightInfoView *)self labelArrivalTime];
    [v65 setAssociatedScalingLabel:v64];

    v66 = [(FUFlightInfoView *)self labelArrivalDate];
    v67 = [(FUFlightInfoView *)self labelArrivalDelay];
    [v67 setAssociatedScalingLabel:v66];

    v68 = [(FUFlightInfoView *)self labelArrivalDelay];
    v69 = [(FUFlightInfoView *)self labelArrivalDate];
    [v69 setAssociatedScalingLabel:v68];

    v70 = [(FUFlightInfoView *)self labelDurationValue];
    v71 = [(FUFlightInfoView *)self labelDurationTitle];
    [v71 setAssociatedScalingLabel:v70];

    v72 = [(FUFlightInfoView *)self labelDurationTitle];
    v73 = [(FUFlightInfoView *)self labelDurationValue];
    [v73 setAssociatedScalingLabel:v72];

    v74 = [(FUFlightInfoView *)self labelBaggageClaimValue];
    v75 = [(FUFlightInfoView *)self labelBaggageClaimTitle];
    [v75 setAssociatedScalingLabel:v74];

    v76 = [(FUFlightInfoView *)self labelBaggageClaimTitle];
    v77 = [(FUFlightInfoView *)self labelBaggageClaimValue];
    [v77 setAssociatedScalingLabel:v76];

    [(FUFlightInfoView *)self standardTableCellContentInset];
    double v79 = v78;
    v80 = [(FUFlightInfoView *)self leadingInset];
    [v80 setConstant:v79];

    v81 = [(FUFlightInfoView *)self trailingInset];
    [v81 setConstant:v79];

    if (self->_spotlightMode) {
      double v79 = 0.0;
    }
    v82 = [(FUFlightInfoView *)self trailingSeparatorsInset];
    [v82 setConstant:v79];

    v83 = [MEMORY[0x263F08A00] defaultCenter];
    [v83 addObserver:self selector:sel_updateFlightDates name:*MEMORY[0x263EFF458] object:0];

    objc_initWeak(&location, self);
    v88[0] = MEMORY[0x263EF8330];
    v88[1] = 3221225472;
    v88[2] = __46__FUFlightInfoView_setupLabelStylesWithStyle___block_invoke;
    v88[3] = &unk_264BDD6B0;
    objc_copyWeak(&v89, &location);
    v84 = [(FUFlightInfoView *)self labelDepartureCode];
    [v84 setOnTap:v88];

    v86[0] = MEMORY[0x263EF8330];
    v86[1] = 3221225472;
    v86[2] = __46__FUFlightInfoView_setupLabelStylesWithStyle___block_invoke_2;
    v86[3] = &unk_264BDD6B0;
    objc_copyWeak(&v87, &location);
    v85 = [(FUFlightInfoView *)self labelArrivalCode];
    [v85 setOnTap:v86];

    [(FUFlightInfoView *)self updateFlightStatus];
    objc_destroyWeak(&v87);
    objc_destroyWeak(&v89);
    objc_destroyWeak(&location);
  }
}

uint64_t __46__FUFlightInfoView_setupLabelStylesWithStyle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if ([WeakRetained currentFocus])
    {
      [v4 setCurrentFocus:0];
      v2 = [v4 delegate];
      objc_msgSend(v2, "flightInfoView:didUpdateFocus:", v4, objc_msgSend(v4, "currentFocus"));
    }
  }

  return MEMORY[0x270F9A758]();
}

void __46__FUFlightInfoView_setupLabelStylesWithStyle___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    BOOL v2 = [WeakRetained currentFocus] == 1;
    id WeakRetained = v4;
    if (!v2)
    {
      [v4 setCurrentFocus:1];
      double v3 = [v4 delegate];
      objc_msgSend(v3, "flightInfoView:didUpdateFocus:", v4, objc_msgSend(v4, "currentFocus"));

      id WeakRetained = v4;
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FUFlightInfoView;
  [(FUFlightInfoView *)&v9 traitCollectionDidChange:v4];
  CGRect v5 = [(FUFlightInfoView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(FUFlightInfoView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  v6 = [(FUFlightInfoView *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)FUFlightInfoView;
  [(FUFlightInfoView *)&v3 didMoveToWindow];
  [(FUFlightInfoView *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4 = a3;
  CGRect v5 = [v4 secondaryColor];
  v6 = [(FUFlightInfoView *)self flightButton];
  [v6 setTintColor:v5];

  id v7 = [(FUFlightInfoView *)self flightButton];
  [v4 enableAppearanceForView:v7];
}

- (void)updateFlightButtonIcon
{
  v29[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F1C6B0] systemImageNamed:@"airplane"];
  id v4 = (void *)[v3 copy];

  [v4 size];
  v30.double width = v7 * 1.69;
  double width = v30.width;
  v30.double height = v8 * 1.69;
  double height = v30.height;
  UIGraphicsBeginImageContextWithOptions(v30, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  UIGraphicsPushContext(CurrentContext);
  CGContextSetCompositeOperation();
  objc_msgSend(v4, "drawInRect:", 0.0, 0.0, width, height);
  v10 = [MEMORY[0x263F1C550] clearColor];
  [v10 setFill];

  v11 = [MEMORY[0x263F1C550] blackColor];
  [v11 setStroke];

  if (self->_displayedLegId)
  {
    if ([(id)*MEMORY[0x263F1D020] userInterfaceLayoutDirection] == 1) {
      double v12 = width * 0.5 + -14.0;
    }
    else {
      double v12 = width * 0.5 + 1.25;
    }
    double v13 = height * 0.5 + -14.0 + -1.25;
    long long v14 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", v12, v13, 14.0, 14.0);
    [v14 setLineWidth:1.25];
    long long v15 = (void *)MEMORY[0x263F08A30];
    long long v16 = [NSNumber numberWithUnsignedInteger:self->_displayedLegId];
    v17 = [v15 localizedStringFromNumber:v16 numberStyle:0];

    uint64_t v28 = *MEMORY[0x263F1C238];
    uint64_t v18 = [MEMORY[0x263F1C658] systemFontOfSize:11.0 weight:*MEMORY[0x263F1D340]];
    v29[0] = v18;
    v19 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];

    [v17 sizeWithAttributes:v19];
    double v21 = v12 + (14.0 - v20) * 0.5;
    double v23 = v13 + (14.0 - v22) * 0.5;
    [v14 fill];
    [v14 stroke];
    objc_msgSend(v17, "drawAtPoint:withAttributes:", v19, v21, v23);
  }
  UIGraphicsPopContext();
  v24 = UIGraphicsGetImageFromCurrentImageContext();

  UIGraphicsEndImageContext();
  v25 = [v24 imageWithRenderingMode:2];

  v26 = [(FUFlightInfoView *)self flightButton];
  [v26 setImage:v25 forState:0];

  v27 = [(FUFlightInfoView *)self flightButton];
  [v27 _setCornerRadius:20.0];
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FUFlightInfoView;
  [(FUFlightInfoView *)&v4 dealloc];
}

- (void)updateForFollowupContent:(BOOL)a3
{
  self->_BOOL spotlightMode = a3;
  double v5 = 1.0;
  if (a3 || self->_multiFlights)
  {
    int v6 = 0;
  }
  else
  {
    objc_super v3 = [(FUFlight *)self->_flight legs];
    if ((unint64_t)[v3 count] <= 1) {
      double v5 = 0.0;
    }
    else {
      double v5 = 1.0;
    }
    int v6 = 1;
  }
  double v7 = [(FUFlightInfoView *)self sep5];
  [v7 setAlpha:v5];

  if (v6) {
  BOOL spotlightMode = self->_spotlightMode;
  }
  if (self->_spotlightMode)
  {
    double v9 = 0.0;
  }
  else
  {
    id v12 = [(FUFlightInfoView *)self trailingInset];
    [v12 constant];
    double v9 = v10;
  }
  v11 = [(FUFlightInfoView *)self trailingSeparatorsInset];
  [v11 setConstant:v9];

  if (!spotlightMode)
  {
  }
}

- (void)setFlight:(id)a3 legIndex:(unint64_t)a4 multiFlights:(BOOL)a5 spotlightMode:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v27 = (FUFlight *)a3;
  v11 = [(FUFlight *)v27 legs];
  unint64_t v12 = [v11 count];

  double v13 = v27;
  if (v12 > a4)
  {
    if (self->_flight != v27) {
      goto LABEL_4;
    }
    leg = self->_leg;
    long long v15 = [(FUFlight *)v27 legs];
    long long v16 = [v15 objectAtIndexedSubscript:a4];

    double v13 = v27;
    if (leg != v16)
    {
LABEL_4:
      if (v12 > 1) {
        unint64_t v17 = a4 + 1;
      }
      else {
        unint64_t v17 = 0;
      }
      self->_displayedLegId = v17;
      objc_storeStrong((id *)&self->_flight, a3);
      uint64_t v18 = [(FUFlight *)v27 legs];
      v19 = [v18 objectAtIndexedSubscript:a4];
      double v20 = self->_leg;
      self->_leg = v19;

      self->_multiFlights = v7;
      double v21 = [(FUFlightInfoView *)self bottomMargin];
      [v21 constant];
      double v23 = v22;

      if (v12 > 1 || v7)
      {
        if (v23 != 30.0)
        {
          v24 = [(FUFlightInfoView *)self bottomMargin];
          v25 = v24;
          double v26 = 30.0;
          goto LABEL_13;
        }
      }
      else if (v23 != 0.0)
      {
        v24 = [(FUFlightInfoView *)self bottomMargin];
        v25 = v24;
        double v26 = 0.0;
LABEL_13:
        [v24 setConstant:v26];
      }
      [(FUFlightInfoView *)self updateForFollowupContent:v6];
      [(FUFlightInfoView *)self updateAirlineInformation];
      [(FUFlightInfoView *)self updateLocationInfo];
      [(FUFlightInfoView *)self updateFlightTerminalInfo];
      [(FUFlightInfoView *)self updateFlightStatus];
      [(FUFlightInfoView *)self updateFlightDates];
      [(FUFlightInfoView *)self updateDelayInfo];
      [(FUFlightInfoView *)self updateFlightButtonIcon];
      [(FUFlightInfoView *)self setNeedsLayout];
      double v13 = v27;
    }
  }
}

- (void)updateAirlineInformation
{
  objc_super v3 = [(FUFlight *)self->_flight displayAirline];
  objc_super v4 = [v3 name];
  double v5 = [(FUFlightInfoView *)self labelAirlineName];
  [v5 setText:v4];

  id v7 = [(FUFlight *)self->_flight displayFlightCode];
  BOOL v6 = [(FUFlightInfoView *)self labelFlightCode];
  [v6 setText:v7];
}

- (void)updateLocationInfo
{
  objc_super v3 = [(FUFlightLeg *)self->_leg departure];
  objc_super v4 = [v3 airport];
  double v5 = [v4 city];

  if (v5)
  {
    BOOL v6 = [(FUFlightLeg *)self->_leg departure];
    id v7 = [v6 airport];
    double v8 = [v7 city];
    double v9 = [(FUFlightInfoView *)self labelDepartureCity];
    [v9 setText:v8];
  }
  else
  {
    BOOL v6 = [(FUFlightInfoView *)self labelDepartureCity];
    [v6 setText:&stru_26E6B8080];
  }

  double v10 = [(FUFlightLeg *)self->_leg arrival];
  v11 = [v10 airport];
  unint64_t v12 = [v11 city];

  if (v12)
  {
    double v13 = [(FUFlightLeg *)self->_leg arrival];
    long long v14 = [v13 airport];
    long long v15 = [v14 city];
    long long v16 = [(FUFlightInfoView *)self labelArrivalCity];
    [v16 setText:v15];
  }
  else
  {
    double v13 = [(FUFlightInfoView *)self labelArrivalCity];
    [v13 setText:&stru_26E6B8080];
  }

  unint64_t v17 = [(FUFlightLeg *)self->_leg departure];
  uint64_t v18 = [v17 airport];
  v19 = [v18 IATACode];
  double v20 = [(FUFlightInfoView *)self labelDepartureCode];
  [v20 setText:v19];

  id v24 = [(FUFlightLeg *)self->_leg arrival];
  double v21 = [v24 airport];
  double v22 = [v21 IATACode];
  double v23 = [(FUFlightInfoView *)self labelArrivalCode];
  [v23 setText:v22];
}

- (void)updateTimeLabel:(id)a3 constraint:(id)a4 withString:(id)a5
{
  if (a5) {
    id v7 = (__CFString *)a5;
  }
  else {
    id v7 = &stru_26E6B8080;
  }
  id v8 = a4;
  id v9 = a3;
  [v9 setText:v7];
  [(FUFlightInfoView *)self updateLabelVisibility:v9 constraint:v8];
}

- (id)formattedDurationForDuration:(double)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F08780]);
  [v4 setAllowedUnits:112];
  [v4 setFormattingContext:1];
  [v4 setMaximumUnitCount:2];
  if ((uint64_t)a3 > 3599) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 3;
  }
  [v4 setUnitsStyle:v5];
  BOOL v6 = [v4 stringFromTimeInterval:a3];

  return v6;
}

- (void)updateDelayInfo
{
  objc_super v3 = [(FUFlightLeg *)self->_leg departure];
  id v4 = [v3 delayFromSchedule];

  if (!v4)
  {
    id v40 = 0;
    goto LABEL_19;
  }
  uint64_t v5 = [(FUFlightLeg *)self->_leg departure];
  uint64_t v6 = [v5 status];

  if (v6 != 4) {
    goto LABEL_4;
  }
  id v7 = [(FUFlightLeg *)self->_leg departure];
  id v8 = [v7 delayFromSchedule];
  [v8 doubleValue];
  double v10 = v9;

  if (v10 >= 60.0)
  {
    v11 = NSString;
    unint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v13 = [v12 localizedStringForKey:@"Delayed %@" value:@"Delayed %@" table:@"Localizable"];
    long long v14 = [(FUFlightInfoView *)self formattedDurationForDuration:v10];
    objc_msgSend(v11, "stringWithFormat:", v13, v14);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    id v40 = 0;
  }
  if ([(FUFlightLeg *)self->_leg status] == 2 || [(FUFlightLeg *)self->_leg status] == 3)
  {
    long long v15 = [(FUFlightLeg *)self->_leg arrival];
    long long v16 = [v15 time];
    [v16 timeIntervalSinceNow];
    double v18 = v17;

    if (v18 < 60.0)
    {
      v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v20 = v19;
      double v21 = @"Arriving now";
LABEL_17:
      id v4 = [v19 localizedStringForKey:v21 value:v21 table:@"Localizable"];
      goto LABEL_18;
    }
    double v22 = NSString;
    double v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v20 = v23;
    id v24 = @"%@ remaining";
LABEL_12:
    v25 = [v23 localizedStringForKey:v24 value:v24 table:@"Localizable"];
    double v26 = [(FUFlightInfoView *)self formattedDurationForDuration:v18];
    id v4 = objc_msgSend(v22, "stringWithFormat:", v25, v26);

LABEL_18:
    goto LABEL_19;
  }
  if ([(FUFlightLeg *)self->_leg status] == 4 || [(FUFlightLeg *)self->_leg status] == 4)
  {
    v27 = [(FUFlightLeg *)self->_leg arrival];
    uint64_t v28 = [v27 status];

    if (v28 == 3)
    {
      v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v20 = v19;
      double v21 = @"On time";
      goto LABEL_17;
    }
    v33 = [(FUFlightLeg *)self->_leg arrival];
    v34 = [v33 delayFromSchedule];
    [v34 doubleValue];
    double v18 = fabs(v35);

    if (v18 >= 60.0)
    {
      v36 = [(FUFlightLeg *)self->_leg arrival];
      uint64_t v37 = [v36 status];

      if (v37 == 4)
      {
        double v22 = NSString;
        double v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        double v20 = v23;
        id v24 = @"Late %@";
        goto LABEL_12;
      }
      v38 = [(FUFlightLeg *)self->_leg arrival];
      uint64_t v39 = [v38 status];

      if (v39 == 2)
      {
        double v22 = NSString;
        double v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        double v20 = v23;
        id v24 = @"Early %@";
        goto LABEL_12;
      }
    }
  }
  id v4 = 0;
LABEL_19:
  v29 = [(FUFlightInfoView *)self labelDepartureDelay];
  CGSize v30 = [(FUFlightInfoView *)self departureDelayConstraint];
  [(FUFlightInfoView *)self updateTimeLabel:v29 constraint:v30 withString:v40];

  v31 = [(FUFlightInfoView *)self labelArrivalDelay];
  v32 = [(FUFlightInfoView *)self arrivalDelayConstraint];
  [(FUFlightInfoView *)self updateTimeLabel:v31 constraint:v32 withString:v4];
}

- (void)updateFlightTerminalInfo
{
  objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v81 = [v3 localizedStringForKey:@"Terminal %@" value:@"Terminal %@" table:@"Localizable"];

  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"Gate %@" value:@"Gate %@" table:@"Localizable"];

  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v80 = [v6 localizedStringForKey:@"Terminal %@, Gate %@", @"Terminal %@, Gate %@", @"Localizable" value table];

  id v7 = [(FUFlightInfoView *)self labelDepartureInfo2];

  id v8 = [(FUFlightLeg *)self->_leg departure];
  double v9 = [v8 terminal];
  double v10 = (__CFString *)[v9 length];

  unint64_t v11 = 0x263F08000uLL;
  if (!v7)
  {
    if (v10)
    {
      id v24 = [(FUFlightLeg *)self->_leg departure];
      v25 = [v24 gate];
      uint64_t v26 = [v25 length];

      v27 = NSString;
      double v20 = [(FUFlightLeg *)self->_leg departure];
      double v21 = [v20 terminal];
      uint64_t v28 = [v21 localizedTerminalOrGateID];
      double v22 = (void *)v28;
      if (v26)
      {
        v29 = [(FUFlightLeg *)self->_leg departure];
        CGSize v30 = [v29 gate];
        [v30 localizedTerminalOrGateID];
        v32 = v31 = v5;
        objc_msgSend(v27, "stringWithFormat:", v80, v22, v32);
        double v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        uint64_t v5 = v31;
        unint64_t v11 = 0x263F08000;
      }
      else
      {
        objc_msgSend(v27, "stringWithFormat:", v81, v28);
        double v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      double v23 = 0;
      goto LABEL_12;
    }
LABEL_9:
    double v23 = 0;
    goto LABEL_13;
  }
  if (v10)
  {
    unint64_t v12 = NSString;
    double v13 = [(FUFlightLeg *)self->_leg departure];
    long long v14 = [v13 terminal];
    long long v15 = [v14 localizedTerminalOrGateID];
    objc_msgSend(v12, "stringWithFormat:", v81, v15);
    double v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  long long v16 = [(FUFlightLeg *)self->_leg departure];
  double v17 = [v16 gate];
  uint64_t v18 = [v17 length];

  if (!v18) {
    goto LABEL_9;
  }
  v19 = NSString;
  double v20 = [(FUFlightLeg *)self->_leg departure];
  double v21 = [v20 gate];
  double v22 = [v21 localizedTerminalOrGateID];
  objc_msgSend(v19, "stringWithFormat:", v5, v22);
  double v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:

LABEL_13:
  v33 = [(FUFlightInfoView *)self labelDepartureInfo1];
  v34 = v33;
  if (v10) {
    double v35 = v10;
  }
  else {
    double v35 = v23;
  }
  if (v10) {
    v36 = v23;
  }
  else {
    v36 = &stru_26E6B8080;
  }
  [v33 setText:v35];

  uint64_t v37 = [(FUFlightInfoView *)self labelDepartureInfo2];
  [v37 setText:v36];

  v38 = [(FUFlightInfoView *)self labelArrivalInfo2];

  uint64_t v39 = [(FUFlightLeg *)self->_leg arrival];
  id v40 = [v39 terminal];
  v41 = (__CFString *)[v40 length];

  if (!v38)
  {
    if (v41)
    {
      double v79 = v10;
      v47 = v5;
      v48 = [(FUFlightLeg *)self->_leg arrival];
      v49 = [v48 gate];
      unint64_t v50 = v11;
      uint64_t v51 = [v49 length];

      v52 = *(void **)(v50 + 2880);
      v53 = [(FUFlightLeg *)self->_leg arrival];
      v54 = [v53 terminal];
      uint64_t v55 = [v54 localizedTerminalOrGateID];
      v56 = (void *)v55;
      if (v51)
      {
        v57 = [(FUFlightLeg *)self->_leg arrival];
        v58 = [v57 gate];
        v59 = [v58 localizedTerminalOrGateID];
        objc_msgSend(v52, "stringWithFormat:", v80, v56, v59);
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v52, "stringWithFormat:", v81, v55);
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v62 = 0;
      goto LABEL_31;
    }
    v62 = 0;
LABEL_28:
    v66 = &stru_26E6B8080;
    goto LABEL_32;
  }
  unint64_t v42 = v11;
  if (v41)
  {
    v43 = *(void **)(v11 + 2880);
    v44 = [(FUFlightLeg *)self->_leg arrival];
    v45 = [v44 terminal];
    v46 = [v45 localizedTerminalOrGateID];
    objc_msgSend(v43, "stringWithFormat:", v81, v46);
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v60 = [(FUFlightLeg *)self->_leg arrival];
  v61 = [v60 gate];
  v62 = (__CFString *)[v61 length];

  if (!v62) {
    goto LABEL_28;
  }
  double v79 = v10;
  v63 = *(void **)(v42 + 2880);
  v53 = [(FUFlightLeg *)self->_leg arrival];
  v54 = [v53 gate];
  uint64_t v64 = [v54 localizedTerminalOrGateID];
  v65 = v5;
  v56 = (void *)v64;
  v47 = v65;
  v62 = [v63 stringWithFormat:v64];
LABEL_31:
  v66 = &stru_26E6B8080;

  uint64_t v5 = v47;
  double v10 = v79;
LABEL_32:
  v67 = [(FUFlightInfoView *)self labelArrivalInfo1];
  v68 = v67;
  if (v41) {
    v69 = v41;
  }
  else {
    v69 = v62;
  }
  if (v41) {
    v66 = v62;
  }
  [v67 setText:v69];

  v70 = [(FUFlightInfoView *)self labelArrivalInfo2];
  [v70 setText:v66];

  v71 = [(FUFlightInfoView *)self labelDepartureInfo1];
  v72 = [(FUFlightInfoView *)self departureTerminalConstraint];
  [(FUFlightInfoView *)self updateLabelVisibility:v71 constraint:v72];

  v73 = [(FUFlightInfoView *)self labelDepartureInfo2];
  v74 = [(FUFlightInfoView *)self departureGateConstraint];
  [(FUFlightInfoView *)self updateLabelVisibility:v73 constraint:v74];

  v75 = [(FUFlightInfoView *)self labelArrivalInfo1];
  v76 = [(FUFlightInfoView *)self arrivalTerminalConstraint];
  [(FUFlightInfoView *)self updateLabelVisibility:v75 constraint:v76];

  v77 = [(FUFlightInfoView *)self labelArrivalInfo2];
  double v78 = [(FUFlightInfoView *)self arrivalGateConstraint];
  [(FUFlightInfoView *)self updateLabelVisibility:v77 constraint:v78];
}

- (void)addDateTimeAttributesToString:(id)a3 striked:(BOOL)a4 alignment:(int64_t)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v7 = [v11 string];
  uint64_t v8 = [v7 length];

  if (v6) {
    objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x263F1C298], &unk_26E6BB098, 0, v8);
  }
  double v9 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  double v10 = (void *)[v9 mutableCopy];

  [v10 setAlignment:a5];
  objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x263F1C268], v10, 0, v8);
}

- (void)updateDateTimeForDeparture:(BOOL)a3
{
  if (a3)
  {
    id v58 = [(FUFlightInfoView *)self labelDepartureDate];
    v57 = [(FUFlightInfoView *)self labelDepartureTime];
    uint64_t v5 = [(FUFlightLeg *)self->_leg departure];
    BOOL v6 = [v5 time];
    uint64_t v55 = [v6 date];

    [(FUFlightLeg *)self->_leg departure];
  }
  else
  {
    id v58 = [(FUFlightInfoView *)self labelArrivalDate];
    v57 = [(FUFlightInfoView *)self labelArrivalTime];
    id v7 = [(FUFlightLeg *)self->_leg arrival];
    uint64_t v8 = [v7 time];
    uint64_t v55 = [v8 date];

    [(FUFlightLeg *)self->_leg arrival];
  double v9 = };
  double v10 = [v9 airport];
  v56 = [v10 timeZone];

  id v11 = [MEMORY[0x263EFF960] currentLocale];
  unint64_t v12 = v11;
  double v13 = (void *)updateDateTimeForDeparture__sLocaleIdentifier;
  if (!updateDateTimeForDeparture__sLocaleIdentifier
    || !v11
    || ([v11 localeIdentifier],
        long long v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v13 isEqualToString:v14],
        v14,
        (v15 & 1) == 0))
  {
    if (!updateDateTimeForDeparture__sTimeFormatter)
    {
      id v16 = objc_alloc_init(MEMORY[0x263F08790]);
      double v17 = (void *)updateDateTimeForDeparture__sTimeFormatter;
      updateDateTimeForDeparture__sTimeFormatter = (uint64_t)v16;
    }
    if (!updateDateTimeForDeparture__sDateFormatter)
    {
      id v18 = objc_alloc_init(MEMORY[0x263F08790]);
      v19 = (void *)updateDateTimeForDeparture__sDateFormatter;
      updateDateTimeForDeparture__sDateFormatter = (uint64_t)v18;
    }
    uint64_t v20 = [v12 localeIdentifier];
    double v21 = (void *)updateDateTimeForDeparture__sLocaleIdentifier;
    updateDateTimeForDeparture__sLocaleIdentifier = v20;

    double v22 = (void *)updateDateTimeForDeparture__sTimeFormatter;
    if (v57) {
      double v23 = @"h:mm j z";
    }
    else {
      double v23 = @"h:mm j";
    }
    id v24 = [MEMORY[0x263F08790] dateFormatFromTemplate:v23 options:0 locale:v12];
    [v22 setDateFormat:v24];

    [(id)updateDateTimeForDeparture__sTimeFormatter setLocale:v12];
    v25 = (void *)updateDateTimeForDeparture__sDateFormatter;
    uint64_t v26 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"EE, MMM d", 0, v12 options locale];
    [v25 setDateFormat:v26];

    [(id)updateDateTimeForDeparture__sDateFormatter setLocale:v12];
  }
  [(id)updateDateTimeForDeparture__sDateFormatter setTimeZone:v56];
  [(id)updateDateTimeForDeparture__sTimeFormatter setTimeZone:v56];
  v27 = (void *)v55;
  uint64_t v28 = [(id)updateDateTimeForDeparture__sTimeFormatter stringFromDate:v55];
  v53 = [(id)updateDateTimeForDeparture__sDateFormatter stringFromDate:v55];
  v29 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v53];
  v54 = (void *)v28;
  CGSize v30 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v28];
  uint64_t v31 = [(FUFlightLeg *)self->_leg status];
  v32 = v58;
  if (v31)
  {
    if (v31 == 1)
    {
      if (a3)
      {
        v33 = [(FUFlightLeg *)self->_leg departure];
LABEL_23:
        v34 = v33;
        if ([v33 status] == 4)
        {
          uint64_t v35 = *MEMORY[0x263F1C240];
          v36 = [(FUStyleProvider *)self->_styleProvider orangeColor];
          objc_msgSend(v30, "addAttribute:value:range:", v35, v36, 0, objc_msgSend(v54, "length"));
        }
        v32 = v58;
        goto LABEL_26;
      }
    }
    else if (v31 == 6 || a3)
    {
      goto LABEL_26;
    }
    v33 = [(FUFlightLeg *)self->_leg arrival];
    goto LABEL_23;
  }
LABEL_26:
  uint64_t v37 = [v32 font];
  uint64_t v38 = 2 * ([(id)*MEMORY[0x263F1D020] userInterfaceLayoutDirection] != 1);
  uint64_t v39 = [(FUFlightLeg *)self->_leg status];
  id v40 = v57;
  if (v57)
  {
    BOOL v41 = v39 == 6;
    [(FUFlightInfoView *)self addDateTimeAttributesToString:v29 striked:v41 alignment:v38];
    [(FUFlightInfoView *)self addDateTimeAttributesToString:v30 striked:v41 alignment:v38];
    v43 = v53;
    unint64_t v42 = v54;
    if (v37)
    {
      uint64_t v44 = *MEMORY[0x263F1C238];
      objc_msgSend(v29, "addAttribute:value:range:", *MEMORY[0x263F1C238], v37, 0, objc_msgSend(v53, "length"));
      objc_msgSend(v30, "addAttribute:value:range:", v44, v37, 0, objc_msgSend(v54, "length"));
    }
    [v58 setAttributedText:v29];
    [v57 setAttributedText:v30];
  }
  else
  {
    BOOL v52 = v39 == 6;
    id v45 = v29;
    id v46 = objc_alloc(MEMORY[0x263F086A0]);
    v47 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v48 = [v47 localizedStringForKey:@" at " value:@" at " table:@"Localizable"];
    v49 = (void *)[v46 initWithString:v48];
    [v45 appendAttributedString:v49];

    [v45 appendAttributedString:v30];
    [(FUFlightInfoView *)self addDateTimeAttributesToString:v45 striked:v52 alignment:v38];
    if (v37)
    {
      uint64_t v50 = *MEMORY[0x263F1C238];
      uint64_t v51 = [v45 string];
      objc_msgSend(v45, "addAttribute:value:range:", v50, v37, 0, objc_msgSend(v51, "length"));
    }
    [v58 setAttributedText:v45];

    id v40 = 0;
    unint64_t v42 = v54;
    v27 = (void *)v55;
    v43 = v53;
  }
}

- (void)updateFlightDates
{
  BOOL v4 = 1;
  [(FUFlightInfoView *)self updateDateTimeForDeparture:1];
  [(FUFlightInfoView *)self updateDateTimeForDeparture:0];
  uint64_t v5 = (void *)[(FUFlightLeg *)self->_leg status];
  unint64_t v6 = (unint64_t)v5;
  if (v5) {
    BOOL v7 = v5 == (void *)6;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    BOOL v2 = [(FUFlightLeg *)self->_leg departure];
    uint64_t v5 = [v2 delayFromSchedule];
    BOOL v4 = v5 == 0;
  }
  if (v6) {
    BOOL v8 = v6 == 6;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
  }
  if (v4)
  {
    double v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v10 = [v9 localizedStringForKey:@"Departure" value:@"Departure" table:@"Localizable"];
    id v11 = [(FUFlightInfoView *)self labelDepartureTitle];
    [v11 setText:v10];

    unint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v13 = v12;
    long long v14 = @"Arrival";
    char v15 = @"Arrival";
    goto LABEL_26;
  }
  if (v6 != 1) {
    goto LABEL_15;
  }
  id v16 = [(FUFlightLeg *)self->_leg departure];
  double v17 = [v16 time];
  [v17 timeIntervalSinceNow];
  double v19 = v18;

  if (v19 >= 0.0)
  {
    double v23 = [(FUFlightLeg *)self->_leg departure];
    uint64_t v24 = [v23 status];

    if (v24 == 4)
    {
      v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v26 = v25;
      v27 = @"Delayed";
    }
    else
    {
      uint64_t v28 = [(FUFlightLeg *)self->_leg departure];
      uint64_t v29 = [v28 status];

      v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v26 = v25;
      if (v29 == 2) {
        v27 = @"Departing early";
      }
      else {
        v27 = @"Departing";
      }
    }
    CGSize v30 = [v25 localizedStringForKey:v27 value:v27 table:@"Localizable"];
    uint64_t v31 = [(FUFlightInfoView *)self labelDepartureTitle];
    [v31 setText:v30];
  }
  else
  {
LABEL_15:
    uint64_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v21 = [v20 localizedStringForKey:@"Departed" value:@"Departed" table:@"Localizable"];
    double v22 = [(FUFlightInfoView *)self labelDepartureTitle];
    [v22 setText:v21];

    if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 4) {
      goto LABEL_24;
    }
  }
  v32 = [(FUFlightLeg *)self->_leg arrival];
  v33 = [v32 time];
  [v33 timeIntervalSinceNow];
  double v35 = v34;

  if (v35 >= 0.0)
  {
    v69 = [(FUFlightLeg *)self->_leg arrival];
    uint64_t v70 = [v69 status];

    if (v70 == 4)
    {
      unint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v13 = v12;
      long long v14 = @"Arriving late";
    }
    else
    {
      v71 = [(FUFlightLeg *)self->_leg arrival];
      uint64_t v72 = [v71 status];

      unint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v13 = v12;
      if (v72 == 2) {
        long long v14 = @"Arriving early";
      }
      else {
        long long v14 = @"Arriving";
      }
    }
    goto LABEL_25;
  }
LABEL_24:
  unint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v13 = v12;
  long long v14 = @"Arrived";
LABEL_25:
  char v15 = v14;
LABEL_26:
  v36 = [v12 localizedStringForKey:v14 value:v15 table:@"Localizable"];
  uint64_t v37 = [(FUFlightInfoView *)self labelArrivalTitle];
  [v37 setText:v36];

  if ((v6 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    goto LABEL_32;
  }
  uint64_t v38 = [(FUFlightLeg *)self->_leg departure];
  int v39 = [v38 taxiing];

  if (v39)
  {
    id v40 = [(FUFlightInfoView *)self labelDepartureTitle];
    BOOL v41 = [v40 text];
    unint64_t v42 = NSString;
    v43 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v44 = v43;
    id v45 = @"DEPARTURE_RUNWAY";
  }
  else
  {
    id v46 = [(FUFlightLeg *)self->_leg arrival];
    int v47 = [v46 taxiing];

    if (!v47) {
      goto LABEL_32;
    }
    id v40 = [(FUFlightInfoView *)self labelArrivalTitle];
    BOOL v41 = [v40 text];
    unint64_t v42 = NSString;
    v43 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v44 = v43;
    id v45 = @"ARRIVAL_RUNWAY";
  }
  v48 = [v43 localizedStringForKey:v45 value:@"Runway" table:@"Localizable"];
  v49 = [v42 localizedStringWithFormat:@" (%@)", v48];
  uint64_t v50 = [v41 stringByAppendingString:v49];
  [v40 setText:v50];

LABEL_32:
  [(FUFlightLeg *)self->_leg duration];
  if (v51 >= 60.0)
  {
    -[FUFlightInfoView formattedDurationForDuration:](self, "formattedDurationForDuration:");
    BOOL v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v52 = @"–";
  }
  v73 = v52;
  v53 = [(FUFlightInfoView *)self labelDurationComplete];

  if (v53)
  {
    v54 = NSString;
    uint64_t v55 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v56 = [v55 localizedStringForKey:@"Duration: %@" value:@"Duration: %@" table:@"Localizable"];
    v57 = objc_msgSend(v54, "stringWithFormat:", v56, v73);
    id v58 = [(FUFlightInfoView *)self labelDurationComplete];
    [v58 setText:v57];
  }
  else
  {
    v59 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v60 = [v59 localizedStringForKey:@"Duration" value:@"Duration" table:@"Localizable"];
    v61 = [(FUFlightInfoView *)self labelDurationTitle];
    [v61 setText:v60];

    uint64_t v55 = [(FUFlightInfoView *)self labelDurationValue];
    [v55 setText:v73];
  }

  v62 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v63 = [v62 localizedStringForKey:@"Baggage Claim" value:@"Baggage Claim" table:@"Localizable"];
  uint64_t v64 = [(FUFlightInfoView *)self labelBaggageClaimTitle];
  [v64 setText:v63];

  v65 = [(FUFlightLeg *)self->_leg baggageClaim];
  uint64_t v66 = [v65 length];
  if (v66)
  {
    v67 = [(FUFlightLeg *)self->_leg baggageClaim];
  }
  else
  {
    v67 = @"–";
  }
  v68 = [(FUFlightInfoView *)self labelBaggageClaimValue];
  [v68 setText:v67];

  if (v66) {
}
  }

- (void)updateFlightStatus
{
  uint64_t v4 = [(FUFlightLeg *)self->_leg status];
  uint64_t v5 = v4;
  switch(v4)
  {
    case 1:
      unint64_t v6 = [(FUFlightLeg *)self->_leg departure];
      uint64_t v7 = [v6 status];

      if (v7 == 4)
      {
        BOOL v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        double v9 = v8;
        double v10 = @"Delayed";
        goto LABEL_6;
      }
      id v16 = [(FUFlightLeg *)self->_leg departure];
      double v17 = [v16 delayFromSchedule];

      double v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v19 = v18;
      if (v17)
      {
        uint64_t v44 = [v18 localizedStringForKey:@"On time" value:@"On time" table:@"Localizable"];

        [(FUStyleProvider *)self->_styleProvider greenColor];
      }
      else
      {
        uint64_t v44 = [v18 localizedStringForKey:@"Scheduled" value:@"Scheduled" table:@"Localizable"];

        [(FUStyleProvider *)self->_styleProvider primaryTextColor];
      uint64_t v11 = };
      goto LABEL_32;
    case 3:
      BOOL v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v9 = v8;
      double v10 = @"Redirected";
      goto LABEL_6;
    case 5:
      BOOL v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v9 = v8;
      double v10 = @"Diverted";
LABEL_6:
      uint64_t v44 = [v8 localizedStringForKey:v10 value:v10 table:@"Localizable"];

      uint64_t v11 = [(FUStyleProvider *)self->_styleProvider orangeColor];
      goto LABEL_32;
    case 6:
      unint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v44 = [v12 localizedStringForKey:@"Canceled" value:@"Canceled" table:@"Localizable"];

      uint64_t v11 = [(FUStyleProvider *)self->_styleProvider redColor];
LABEL_32:
      uint64_t v24 = (void *)v11;
      goto LABEL_33;
    default:
      if (v4 != 4 && v4 != 2)
      {
        uint64_t v24 = [(FUStyleProvider *)self->_styleProvider blueColor];
        uint64_t v44 = &stru_26E6B8080;
        goto LABEL_33;
      }
      if (v4 == 2
        && ([(FUFlightLeg *)self->_leg departure],
            BOOL v2 = objc_claimAutoreleasedReturnValue(),
            [v2 taxiing]))
      {
        long long v14 = [(FUFlightLeg *)self->_leg departure];
        uint64_t v15 = [v14 status];
      }
      else
      {
        uint64_t v20 = [(FUFlightLeg *)self->_leg arrival];
        uint64_t v15 = [v20 status];

        if (v5 != 2) {
          goto LABEL_21;
        }
      }

LABEL_21:
      if (v15 == 2)
      {
        v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v26 = v25;
        v27 = @"Early";
      }
      else
      {
        if (v15 == 4)
        {
          double v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          double v22 = [v21 localizedStringForKey:@"Late" value:@"Late" table:@"Localizable"];

          uint64_t v23 = [(FUStyleProvider *)self->_styleProvider orangeColor];
          goto LABEL_27;
        }
        v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v26 = v25;
        v27 = @"On time";
      }
      double v22 = [v25 localizedStringForKey:v27 value:v27 table:@"Localizable"];

      uint64_t v23 = [(FUStyleProvider *)self->_styleProvider greenColor];
LABEL_27:
      uint64_t v24 = (void *)v23;
      if (v5 == 4)
      {
        uint64_t v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v29 = v28;
        CGSize v30 = @"Arrived";
      }
      else
      {
        uint64_t v31 = [(FUFlightLeg *)self->_leg arrival];
        int v32 = [v31 taxiing];

        if (v32)
        {
          uint64_t v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v29 = v28;
          CGSize v30 = @"Landed";
        }
        else
        {
          uint64_t v38 = [(FUFlightLeg *)self->_leg departure];
          int v39 = [v38 taxiing];

          uint64_t v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v29 = v28;
          if (v39) {
            CGSize v30 = @"Taxiing";
          }
          else {
            CGSize v30 = @"En route";
          }
        }
      }
      id v40 = [v28 localizedStringForKey:v30 value:v30 table:@"Localizable"];

      BOOL v41 = NSString;
      unint64_t v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v43 = [v42 localizedStringForKey:@"%@ – %@" value:@"%@ – %@" table:@"Localizable"];
      objc_msgSend(v41, "stringWithFormat:", v43, v40, v22);
      uint64_t v44 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_33:
      v33 = [(FUFlightInfoView *)self labelStatus];
      [v33 setText:v44];

      double v34 = [(FUFlightInfoView *)self labelStatus];
      [v34 setTextColor:v24];

      if ([(__CFString *)v44 isEqualToString:&stru_26E6B8080])
      {
        double v35 = [(FUFlightInfoView *)self labelStatusTitle];
        [v35 setText:&stru_26E6B8080];
      }
      else
      {
        double v35 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v36 = [v35 localizedStringForKey:@"Status" value:@"Status" table:@"Localizable"];
        uint64_t v37 = [(FUFlightInfoView *)self labelStatusTitle];
        [v37 setText:v36];
      }

      return;
  }
}

- (void)flightButtonTapped:(id)a3
{
  [(FUFlightInfoView *)self setCurrentFocus:2];
  id v4 = [(FUFlightInfoView *)self delegate];
  [v4 flightInfoView:self didUpdateFocus:2];
}

- (void)updateLabelVisibility:(id)a3 constraint:(id)a4
{
  id v5 = a4;
  id v6 = [a3 text];
  objc_msgSend(v5, "setActive:", objc_msgSend(v6, "length") != 0);
}

- (FUFlight)flight
{
  return self->_flight;
}

- (FUFlightLeg)leg
{
  return self->_leg;
}

- (FUFlightInfoViewProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FUFlightInfoViewProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)currentFocus
{
  return self->_currentFocus;
}

- (void)setCurrentFocus:(int64_t)a3
{
  self->_currentFocus = a3;
}

- (FULabel)labelAirlineName
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelAirlineName);

  return (FULabel *)WeakRetained;
}

- (void)setLabelAirlineName:(id)a3
{
}

- (FULabel)labelFlightCode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelFlightCode);

  return (FULabel *)WeakRetained;
}

- (void)setLabelFlightCode:(id)a3
{
}

- (FULabel)labelStatusTitle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelStatusTitle);

  return (FULabel *)WeakRetained;
}

- (void)setLabelStatusTitle:(id)a3
{
}

- (FULabel)labelStatus
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelStatus);

  return (FULabel *)WeakRetained;
}

- (void)setLabelStatus:(id)a3
{
}

- (FULabel)labelDepartureCity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelDepartureCity);

  return (FULabel *)WeakRetained;
}

- (void)setLabelDepartureCity:(id)a3
{
}

- (FULabel)labelDepartureCode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelDepartureCode);

  return (FULabel *)WeakRetained;
}

- (void)setLabelDepartureCode:(id)a3
{
}

- (FULabel)labelDepartureInfo1
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelDepartureInfo1);

  return (FULabel *)WeakRetained;
}

- (void)setLabelDepartureInfo1:(id)a3
{
}

- (FULabel)labelDepartureInfo2
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelDepartureInfo2);

  return (FULabel *)WeakRetained;
}

- (void)setLabelDepartureInfo2:(id)a3
{
}

- (FULabel)labelArrivalCity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelArrivalCity);

  return (FULabel *)WeakRetained;
}

- (void)setLabelArrivalCity:(id)a3
{
}

- (FULabel)labelArrivalCode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelArrivalCode);

  return (FULabel *)WeakRetained;
}

- (void)setLabelArrivalCode:(id)a3
{
}

- (FULabel)labelArrivalInfo1
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelArrivalInfo1);

  return (FULabel *)WeakRetained;
}

- (void)setLabelArrivalInfo1:(id)a3
{
}

- (FULabel)labelArrivalInfo2
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelArrivalInfo2);

  return (FULabel *)WeakRetained;
}

- (void)setLabelArrivalInfo2:(id)a3
{
}

- (FULabel)labelDepartureTitle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelDepartureTitle);

  return (FULabel *)WeakRetained;
}

- (void)setLabelDepartureTitle:(id)a3
{
}

- (FULabel)labelDepartureDate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelDepartureDate);

  return (FULabel *)WeakRetained;
}

- (void)setLabelDepartureDate:(id)a3
{
}

- (FULabel)labelDepartureTime
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelDepartureTime);

  return (FULabel *)WeakRetained;
}

- (void)setLabelDepartureTime:(id)a3
{
}

- (FULabel)labelDepartureDelay
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelDepartureDelay);

  return (FULabel *)WeakRetained;
}

- (void)setLabelDepartureDelay:(id)a3
{
}

- (FULabel)labelArrivalTitle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelArrivalTitle);

  return (FULabel *)WeakRetained;
}

- (void)setLabelArrivalTitle:(id)a3
{
}

- (FULabel)labelArrivalDate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelArrivalDate);

  return (FULabel *)WeakRetained;
}

- (void)setLabelArrivalDate:(id)a3
{
}

- (FULabel)labelArrivalTime
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelArrivalTime);

  return (FULabel *)WeakRetained;
}

- (void)setLabelArrivalTime:(id)a3
{
}

- (FULabel)labelArrivalDelay
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelArrivalDelay);

  return (FULabel *)WeakRetained;
}

- (void)setLabelArrivalDelay:(id)a3
{
}

- (FULabel)labelDurationTitle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelDurationTitle);

  return (FULabel *)WeakRetained;
}

- (void)setLabelDurationTitle:(id)a3
{
}

- (FULabel)labelDurationValue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelDurationValue);

  return (FULabel *)WeakRetained;
}

- (void)setLabelDurationValue:(id)a3
{
}

- (FULabel)labelDurationComplete
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelDurationComplete);

  return (FULabel *)WeakRetained;
}

- (void)setLabelDurationComplete:(id)a3
{
}

- (FULabel)labelBaggageClaimTitle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelBaggageClaimTitle);

  return (FULabel *)WeakRetained;
}

- (void)setLabelBaggageClaimTitle:(id)a3
{
}

- (FULabel)labelBaggageClaimValue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelBaggageClaimValue);

  return (FULabel *)WeakRetained;
}

- (void)setLabelBaggageClaimValue:(id)a3
{
}

- (FUSeparator)sep5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sep5);

  return (FUSeparator *)WeakRetained;
}

- (void)setSep5:(id)a3
{
}

- (NSLayoutConstraint)trailingSeparatorsInset
{
  return self->_trailingSeparatorsInset;
}

- (void)setTrailingSeparatorsInset:(id)a3
{
}

- (NSLayoutConstraint)leadingInset
{
  return self->_leadingInset;
}

- (void)setLeadingInset:(id)a3
{
}

- (NSLayoutConstraint)trailingInset
{
  return self->_trailingInset;
}

- (void)setTrailingInset:(id)a3
{
}

- (NSLayoutConstraint)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setBottomMargin:(id)a3
{
}

- (NSLayoutConstraint)departureDelayConstraint
{
  return self->_departureDelayConstraint;
}

- (void)setDepartureDelayConstraint:(id)a3
{
}

- (NSLayoutConstraint)departureTerminalConstraint
{
  return self->_departureTerminalConstraint;
}

- (void)setDepartureTerminalConstraint:(id)a3
{
}

- (NSLayoutConstraint)departureGateConstraint
{
  return self->_departureGateConstraint;
}

- (void)setDepartureGateConstraint:(id)a3
{
}

- (NSLayoutConstraint)arrivalDelayConstraint
{
  return self->_arrivalDelayConstraint;
}

- (void)setArrivalDelayConstraint:(id)a3
{
}

- (NSLayoutConstraint)arrivalTerminalConstraint
{
  return self->_arrivalTerminalConstraint;
}

- (void)setArrivalTerminalConstraint:(id)a3
{
}

- (NSLayoutConstraint)arrivalGateConstraint
{
  return self->_arrivalGateConstraint;
}

- (void)setArrivalGateConstraint:(id)a3
{
}

- (UIButton)flightButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flightButton);

  return (UIButton *)WeakRetained;
}

- (void)setFlightButton:(id)a3
{
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_flightButton);
  objc_storeStrong((id *)&self->_arrivalGateConstraint, 0);
  objc_storeStrong((id *)&self->_arrivalTerminalConstraint, 0);
  objc_storeStrong((id *)&self->_arrivalDelayConstraint, 0);
  objc_storeStrong((id *)&self->_departureGateConstraint, 0);
  objc_storeStrong((id *)&self->_departureTerminalConstraint, 0);
  objc_storeStrong((id *)&self->_departureDelayConstraint, 0);
  objc_storeStrong((id *)&self->_bottomMargin, 0);
  objc_storeStrong((id *)&self->_trailingInset, 0);
  objc_storeStrong((id *)&self->_leadingInset, 0);
  objc_storeStrong((id *)&self->_trailingSeparatorsInset, 0);
  objc_destroyWeak((id *)&self->_sep5);
  objc_destroyWeak((id *)&self->_labelBaggageClaimValue);
  objc_destroyWeak((id *)&self->_labelBaggageClaimTitle);
  objc_destroyWeak((id *)&self->_labelDurationComplete);
  objc_destroyWeak((id *)&self->_labelDurationValue);
  objc_destroyWeak((id *)&self->_labelDurationTitle);
  objc_destroyWeak((id *)&self->_labelArrivalDelay);
  objc_destroyWeak((id *)&self->_labelArrivalTime);
  objc_destroyWeak((id *)&self->_labelArrivalDate);
  objc_destroyWeak((id *)&self->_labelArrivalTitle);
  objc_destroyWeak((id *)&self->_labelDepartureDelay);
  objc_destroyWeak((id *)&self->_labelDepartureTime);
  objc_destroyWeak((id *)&self->_labelDepartureDate);
  objc_destroyWeak((id *)&self->_labelDepartureTitle);
  objc_destroyWeak((id *)&self->_labelArrivalInfo2);
  objc_destroyWeak((id *)&self->_labelArrivalInfo1);
  objc_destroyWeak((id *)&self->_labelArrivalCode);
  objc_destroyWeak((id *)&self->_labelArrivalCity);
  objc_destroyWeak((id *)&self->_labelDepartureInfo2);
  objc_destroyWeak((id *)&self->_labelDepartureInfo1);
  objc_destroyWeak((id *)&self->_labelDepartureCode);
  objc_destroyWeak((id *)&self->_labelDepartureCity);
  objc_destroyWeak((id *)&self->_labelStatus);
  objc_destroyWeak((id *)&self->_labelStatusTitle);
  objc_destroyWeak((id *)&self->_labelFlightCode);
  objc_destroyWeak((id *)&self->_labelAirlineName);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_leg, 0);
  objc_storeStrong((id *)&self->_flight, 0);

  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end