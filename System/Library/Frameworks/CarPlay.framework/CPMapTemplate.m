@interface CPMapTemplate
+ (BOOL)supportsSecureCoding;
- (BOOL)automaticallyHidesNavigationBar;
- (BOOL)hidesButtonsWithNavigationBar;
- (BOOL)isPanningInterfaceVisible;
- (BOOL)mapButton:(id)a3 setFocusedImage:(id)a4;
- (BOOL)mapButton:(id)a3 setHidden:(BOOL)a4;
- (BOOL)mapButton:(id)a3 setImageSet:(id)a4;
- (CPBannerProviding)bannerProvider;
- (CPMapTemplate)init;
- (CPMapTemplate)initWithCoder:(id)a3;
- (CPNavigationAlert)currentNavigationAlert;
- (CPNavigationSession)startNavigationSessionForTrip:(CPTrip *)trip;
- (CPNavigationSessionProviding)navigationSessionProvider;
- (CPTripEstimateStyle)tripEstimateStyle;
- (NAFuture)navigationSessionProviderFuture;
- (NSArray)mapButtons;
- (NSArray)tripPreviews;
- (NSMutableDictionary)postedBannerObjects;
- (UIColor)guidanceBackgroundColor;
- (id)mapDelegate;
- (int64_t)_displayStyleForManeuver:(id)a3;
- (void)_postBannerIfNecessaryForManeuver:(id)a3;
- (void)_postBannerIfNecessaryForNavigationAlert:(id)a3;
- (void)_resolveTrip:(id)a3 routeChoice:(id)a4 completion:(id)a5;
- (void)_updateBannerIfNecessaryForManeuver:(id)a3 travelEstimates:(id)a4;
- (void)_updateNavigationAlert:(id)a3;
- (void)bannerDidDisappearWithIdentifier:(id)a3;
- (void)bannerTappedWithIdentifier:(id)a3;
- (void)clientNavigationAlertDidAppear:(id)a3;
- (void)clientNavigationAlertDidDisappear:(id)a3 context:(unint64_t)a4;
- (void)clientNavigationAlertWillAppear:(id)a3;
- (void)clientNavigationAlertWillDisappear:(id)a3 context:(unint64_t)a4;
- (void)clientPanBeganWithDirection:(int64_t)a3;
- (void)clientPanEndedWithDirection:(int64_t)a3;
- (void)clientPanGestureBegan;
- (void)clientPanGestureEndedWithVelocity:(CGPoint)a3;
- (void)clientPanGestureWithDeltaPoint:(CGPoint)a3 velocity:(CGPoint)a4;
- (void)clientPanViewDidAppear;
- (void)clientPanViewDidDisappear;
- (void)clientPanViewWillDisappear;
- (void)clientPanWithDirection:(int64_t)a3;
- (void)clientTripAlreadyStartedException;
- (void)clientTripCanceledByExternalNavigation;
- (void)dismissNavigationAlertAnimated:(BOOL)animated completion:(void *)completion;
- (void)dismissPanningInterfaceAnimated:(BOOL)animated;
- (void)encodeWithCoder:(id)a3;
- (void)handleActionForControlIdentifier:(id)a3;
- (void)hideTripPreviews;
- (void)presentNavigationAlert:(CPNavigationAlert *)navigationAlert animated:(BOOL)animated;
- (void)previewTripIdentifier:(id)a3 usingRouteIdentifier:(id)a4;
- (void)setAutomaticallyHidesNavigationBar:(BOOL)automaticallyHidesNavigationBar;
- (void)setBannerProvider:(id)a3;
- (void)setGuidanceBackgroundColor:(UIColor *)guidanceBackgroundColor;
- (void)setHidesButtonsWithNavigationBar:(BOOL)hidesButtonsWithNavigationBar;
- (void)setMapButtons:(NSArray *)mapButtons;
- (void)setMapDelegate:(id)mapDelegate;
- (void)setNavigationSessionProvider:(id)a3;
- (void)setNavigationSessionProviderFuture:(id)a3;
- (void)setPostedBannerObjects:(id)a3;
- (void)setTripEstimateStyle:(CPTripEstimateStyle)tripEstimateStyle;
- (void)showPanningInterfaceAnimated:(BOOL)animated;
- (void)showRouteChoicesPreviewForTrip:(CPTrip *)tripPreview textConfiguration:(CPTripPreviewTextConfiguration *)textConfiguration;
- (void)showTripPreviews:(NSArray *)tripPreviews selectedTrip:(CPTrip *)selectedTrip textConfiguration:(CPTripPreviewTextConfiguration *)textConfiguration;
- (void)showTripPreviews:(NSArray *)tripPreviews textConfiguration:(CPTripPreviewTextConfiguration *)textConfiguration;
- (void)startTripIdentifier:(id)a3 usingRouteIdentifier:(id)a4;
- (void)updateTravelEstimates:(CPTravelEstimates *)estimates forTrip:(CPTrip *)trip;
- (void)updateTravelEstimates:(CPTravelEstimates *)estimates forTrip:(CPTrip *)trip withTimeRemainingColor:(CPTimeRemainingColor)timeRemainingColor;
@end

@implementation CPMapTemplate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPMapTemplate)init
{
  v9.receiver = self;
  v9.super_class = (Class)CPMapTemplate;
  v2 = [(CPTemplate *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_automaticallyHidesNavigationBar = 1;
    v2->_hidesButtonsWithNavigationBar = 1;
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    postedBannerObjects = v3->_postedBannerObjects;
    v3->_postedBannerObjects = (NSMutableDictionary *)v4;

    v3->_tripEstimateStyle = 1;
    v6 = (NAFuture *)objc_alloc_init(MEMORY[0x263F58190]);
    navigationSessionProviderFuture = v3->_navigationSessionProviderFuture;
    v3->_navigationSessionProviderFuture = v6;
  }
  return v3;
}

- (CPMapTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPMapTemplate;
  v5 = [(CPTemplate *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kCPMapTemplateMapButtonsKey"];
    mapButtons = v5->_mapButtons;
    v5->_mapButtons = (NSArray *)v9;

    v5->_automaticallyHidesNavigationBar = [v4 decodeBoolForKey:@"kCPMapTemplateAutoHidesNavigationBarKey"];
    v5->_hidesButtonsWithNavigationBar = [v4 decodeBoolForKey:@"kCPMapTemplateHidesButtonsWithNavigationBarKey"];
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPMapTemplateGuidanceBackgroundColorKey"];
    v12 = v11;
    if (v11)
    {
      uint64_t v13 = CPSanitizedBackgroundColor(v11);
      guidanceBackgroundColor = v5->_guidanceBackgroundColor;
      v5->_guidanceBackgroundColor = (UIColor *)v13;
    }
    v5->_tripEstimateStyle = [v4 decodeIntegerForKey:@"kCPMapTemplateTripEstimateStyleKey"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPMapTemplate;
  id v4 = a3;
  [(CPTemplate *)&v7 encodeWithCoder:v4];
  v5 = [(CPMapTemplate *)self mapButtons];
  [v4 encodeObject:v5 forKey:@"kCPMapTemplateMapButtonsKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[CPMapTemplate automaticallyHidesNavigationBar](self, "automaticallyHidesNavigationBar"), @"kCPMapTemplateAutoHidesNavigationBarKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[CPMapTemplate hidesButtonsWithNavigationBar](self, "hidesButtonsWithNavigationBar"), @"kCPMapTemplateHidesButtonsWithNavigationBarKey");
  v6 = [(CPMapTemplate *)self guidanceBackgroundColor];
  [v4 encodeObject:v6 forKey:@"kCPMapTemplateGuidanceBackgroundColorKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[CPMapTemplate tripEstimateStyle](self, "tripEstimateStyle"), @"kCPMapTemplateTripEstimateStyleKey");
}

- (void)setGuidanceBackgroundColor:(UIColor *)guidanceBackgroundColor
{
  if (self->_guidanceBackgroundColor != guidanceBackgroundColor)
  {
    CPSanitizedBackgroundColor(guidanceBackgroundColor);
    id v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_guidanceBackgroundColor;
    self->_guidanceBackgroundColor = v4;

    v6 = self->_guidanceBackgroundColor;
    objc_super v7 = [(CPTemplate *)self templateProviderFuture];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__CPMapTemplate_setGuidanceBackgroundColor___block_invoke;
    v10[3] = &unk_26430A248;
    v11 = v6;
    v8 = v6;
    id v9 = (id)[v7 addSuccessBlock:v10];
  }
}

uint64_t __44__CPMapTemplate_setGuidanceBackgroundColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHostGuidanceBackgroundColor:*(void *)(a1 + 32)];
}

- (void)setTripEstimateStyle:(CPTripEstimateStyle)tripEstimateStyle
{
  if (self->_tripEstimateStyle != tripEstimateStyle)
  {
    self->_tripEstimateStyle = tripEstimateStyle;
    id v4 = [(CPTemplate *)self templateProviderFuture];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __38__CPMapTemplate_setTripEstimateStyle___block_invoke;
    v6[3] = &__block_descriptor_40_e34_v16__0___CPMapTemplateProviding__8l;
    v6[4] = tripEstimateStyle;
    id v5 = (id)[v4 addSuccessBlock:v6];
  }
}

uint64_t __38__CPMapTemplate_setTripEstimateStyle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHostTripEstimateStyle:*(void *)(a1 + 32)];
}

- (void)setAutomaticallyHidesNavigationBar:(BOOL)automaticallyHidesNavigationBar
{
  BOOL v3 = automaticallyHidesNavigationBar;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [NSNumber numberWithBool:v3];
    *(_DWORD *)buf = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_DEFAULT, "%@: Set automatically hides navigation bar: %@", buf, 0x16u);
  }
  objc_super v7 = [(CPTemplate *)self templateProviderFuture];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__CPMapTemplate_setAutomaticallyHidesNavigationBar___block_invoke;
  v9[3] = &__block_descriptor_33_e34_v16__0___CPMapTemplateProviding__8l;
  BOOL v10 = v3;
  id v8 = (id)[v7 addSuccessBlock:v9];

  self->_automaticallyHidesNavigationBar = v3;
}

uint64_t __52__CPMapTemplate_setAutomaticallyHidesNavigationBar___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHostAutoHidesNavigationBar:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setHidesButtonsWithNavigationBar:(BOOL)hidesButtonsWithNavigationBar
{
  BOOL v3 = hidesButtonsWithNavigationBar;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [NSNumber numberWithBool:v3];
    *(_DWORD *)buf = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_DEFAULT, "%@: Set hides buttons with navigation bar: %@", buf, 0x16u);
  }
  objc_super v7 = [(CPTemplate *)self templateProviderFuture];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__CPMapTemplate_setHidesButtonsWithNavigationBar___block_invoke;
  v9[3] = &__block_descriptor_33_e34_v16__0___CPMapTemplateProviding__8l;
  BOOL v10 = v3;
  id v8 = (id)[v7 addSuccessBlock:v9];

  self->_hidesButtonsWithNavigationBar = v3;
}

uint64_t __50__CPMapTemplate_setHidesButtonsWithNavigationBar___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHostHidesButtonsWithNavigationBar:*(unsigned __int8 *)(a1 + 32)];
}

- (void)showTripPreviews:(NSArray *)tripPreviews textConfiguration:(CPTripPreviewTextConfiguration *)textConfiguration
{
}

- (void)showTripPreviews:(NSArray *)tripPreviews selectedTrip:(CPTrip *)selectedTrip textConfiguration:(CPTripPreviewTextConfiguration *)textConfiguration
{
  id v9 = tripPreviews;
  BOOL v10 = selectedTrip;
  v11 = textConfiguration;
  if ([(NSArray *)v9 containsObject:v10])
  {
    uint64_t v12 = [(NSArray *)v9 indexOfObject:v10];
    if (!v11) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v12 = 0;
  if (v11)
  {
LABEL_5:
    uint64_t v13 = objc_opt_class();
    CPAssertAllowedClass(v11, v13, a2);
  }
LABEL_6:
  v14 = [(CPTemplate *)self templateProviderFuture];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __65__CPMapTemplate_showTripPreviews_selectedTrip_textConfiguration___block_invoke;
  v20[3] = &unk_26430AAE0;
  uint64_t v15 = v9;
  v21 = v15;
  v22 = v11;
  uint64_t v23 = v12;
  objc_super v16 = v11;
  id v17 = (id)[v14 addSuccessBlock:v20];

  v18 = self->_tripPreviews;
  self->_tripPreviews = v15;
  v19 = v15;
}

uint64_t __65__CPMapTemplate_showTripPreviews_selectedTrip_textConfiguration___block_invoke(void *a1, void *a2)
{
  return [a2 setHostTripPreviews:a1[4] textConfiguration:a1[5] previewOnlyRouteChoices:0 selectedIndex:a1[6]];
}

- (void)showRouteChoicesPreviewForTrip:(CPTrip *)tripPreview textConfiguration:(CPTripPreviewTextConfiguration *)textConfiguration
{
  v23[1] = *MEMORY[0x263EF8340];
  objc_super v7 = tripPreview;
  id v8 = textConfiguration;
  uint64_t v9 = objc_opt_class();
  CPAssertAllowedClass(v7, v9, a2);
  if (v8)
  {
    uint64_t v10 = objc_opt_class();
    CPAssertAllowedClass(v8, v10, a2);
  }
  v11 = [(CPTemplate *)self templateProviderFuture];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __66__CPMapTemplate_showRouteChoicesPreviewForTrip_textConfiguration___block_invoke;
  v20 = &unk_26430AB08;
  v21 = v7;
  v22 = v8;
  uint64_t v12 = v8;
  uint64_t v13 = v7;
  id v14 = (id)[v11 addSuccessBlock:&v17];

  v23[0] = v13;
  objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v23, 1, v17, v18, v19, v20);
  uint64_t v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  tripPreviews = self->_tripPreviews;
  self->_tripPreviews = v15;
}

void __66__CPMapTemplate_showRouteChoicesPreviewForTrip_textConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a1 + 32);
  BOOL v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v6 count:1];
  objc_msgSend(v4, "setHostTripPreviews:textConfiguration:previewOnlyRouteChoices:selectedIndex:", v5, *(void *)(a1 + 40), 1, 0, v6, v7);
}

- (void)hideTripPreviews
{
  BOOL v3 = [(CPTemplate *)self templateProviderFuture];
  id v4 = (id)[v3 addSuccessBlock:&__block_literal_global_13];

  tripPreviews = self->_tripPreviews;
  self->_tripPreviews = (NSArray *)MEMORY[0x263EFFA68];
}

uint64_t __33__CPMapTemplate_hideTripPreviews__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHostTripPreviews:MEMORY[0x263EFFA68] textConfiguration:0 previewOnlyRouteChoices:0 selectedIndex:0];
}

- (void)updateTravelEstimates:(CPTravelEstimates *)estimates forTrip:(CPTrip *)trip
{
}

- (void)updateTravelEstimates:(CPTravelEstimates *)estimates forTrip:(CPTrip *)trip withTimeRemainingColor:(CPTimeRemainingColor)timeRemainingColor
{
  id v8 = estimates;
  uint64_t v9 = trip;
  [(CPTravelEstimates *)v8 setTimeRemainingColor:timeRemainingColor];
  uint64_t v10 = [(CPTemplate *)self templateProviderFuture];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__CPMapTemplate_updateTravelEstimates_forTrip_withTimeRemainingColor___block_invoke;
  v14[3] = &unk_26430AB08;
  uint64_t v15 = v8;
  objc_super v16 = v9;
  v11 = v9;
  uint64_t v12 = v8;
  id v13 = (id)[v10 addSuccessBlock:v14];
}

void __70__CPMapTemplate_updateTravelEstimates_forTrip_withTimeRemainingColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 hostUpdateTravelEstimates:v2 forTripIdentifier:v5];
}

- (CPNavigationSession)startNavigationSessionForTrip:(CPTrip *)trip
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = trip;
  id v5 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v4;
    _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_DEFAULT, "Starting navigation session for trip: %@.", buf, 0xCu);
  }

  uint64_t v6 = [[CPNavigationSession alloc] initWithTrip:v4 mapTemplate:self];
  uint64_t v7 = [(CPMapTemplate *)self mapDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(CPMapTemplate *)self mapDelegate];
    uint64_t v10 = [v9 mapTemplateShouldProvideNavigationMetadata:self];

    [(CPNavigationSession *)v6 setSendsNavigationMetadata:v10];
    [(CPTrip *)v4 setSendsNavigationMetadata:v10];
  }
  v11 = [(CPTrip *)v4 destinationNameVariants];
  [(CPNavigationSession *)v6 setDestinationNameVariants:v11];

  uint64_t v12 = [(CPMapTemplate *)self navigationSessionProviderFuture];
  int v13 = [v12 isFinished];

  id v14 = CarPlayFrameworkGeneralLogging();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      objc_super v16 = "Navigation session provider already connected";
LABEL_10:
      _os_log_impl(&dword_2181A5000, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    }
  }
  else if (v15)
  {
    *(_WORD *)buf = 0;
    objc_super v16 = "Navigation session provider not connected";
    goto LABEL_10;
  }

  uint64_t v17 = [(CPMapTemplate *)self navigationSessionProviderFuture];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __47__CPMapTemplate_startNavigationSessionForTrip___block_invoke;
  v24[3] = &unk_26430AB50;
  v25 = v4;
  v26 = self;
  uint64_t v18 = v6;
  v27 = v18;
  v19 = v4;
  id v20 = (id)[v17 addSuccessBlock:v24];

  v21 = v27;
  v22 = v18;

  return v22;
}

void __47__CPMapTemplate_startNavigationSessionForTrip___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2181A5000, v4, OS_LOG_TYPE_DEFAULT, "Starting navigation session on host", buf, 2u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__CPMapTemplate_startNavigationSessionForTrip___block_invoke_30;
  v7[3] = &unk_264309FB0;
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  id v9 = *(id *)(a1 + 48);
  [v3 hostStartNavigationSessionForTrip:v5 reply:v7];
}

void __47__CPMapTemplate_startNavigationSessionForTrip___block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_2181A5000, v4, OS_LOG_TYPE_DEFAULT, "Navigation session started", (uint8_t *)&v9, 2u);
  }

  if ([*(id *)(*(void *)(a1 + 32) + 184) count])
  {
    id v5 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_DEFAULT, "Hiding trip previews card for trip %@.", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    int8x16_t v8 = *(void **)(v7 + 184);
    *(void *)(v7 + 184) = MEMORY[0x263EFFA68];
  }
  [*(id *)(a1 + 48) setManager:v3];
}

- (void)setNavigationSessionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_navigationSessionProvider, a3);
  id v5 = a3;
  id v6 = [(CPMapTemplate *)self navigationSessionProviderFuture];
  [v6 finishWithResult:v5];
}

- (BOOL)mapButton:(id)a3 setHidden:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(CPTemplate *)self templateProviderFuture];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __37__CPMapTemplate_mapButton_setHidden___block_invoke;
  v11[3] = &unk_26430AB78;
  id v12 = v6;
  BOOL v13 = a4;
  id v8 = v6;
  id v9 = (id)[v7 addSuccessBlock:v11];

  return 1;
}

void __37__CPMapTemplate_mapButton_setHidden___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 setMapButton:v5 hidden:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)mapButton:(id)a3 setImageSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CPTemplate *)self templateProviderFuture];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __39__CPMapTemplate_mapButton_setImageSet___block_invoke;
  v13[3] = &unk_26430AB08;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = (id)[v8 addSuccessBlock:v13];

  return 1;
}

void __39__CPMapTemplate_mapButton_setImageSet___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 hostSetMapButton:v5 imageSet:*(void *)(a1 + 40)];
}

- (BOOL)mapButton:(id)a3 setFocusedImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CPTemplate *)self templateProviderFuture];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __43__CPMapTemplate_mapButton_setFocusedImage___block_invoke;
  v13[3] = &unk_26430AB08;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = (id)[v8 addSuccessBlock:v13];

  return 1;
}

void __43__CPMapTemplate_mapButton_setFocusedImage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 setMapButton:v5 focusedImage:*(void *)(a1 + 40)];
}

- (void)presentNavigationAlert:(CPNavigationAlert *)navigationAlert animated:(BOOL)animated
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = navigationAlert;
  [(CPNavigationAlert *)v7 setNavigationAlertUpdateTarget:self];
  objc_storeStrong((id *)&self->_currentNavigationAlert, navigationAlert);
  id v8 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v19 = self;
    __int16 v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_2181A5000, v8, OS_LOG_TYPE_INFO, "%@: Presenting navigation alert: %@", buf, 0x16u);
  }

  id v9 = [(CPTemplate *)self templateProviderFuture];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __49__CPMapTemplate_presentNavigationAlert_animated___block_invoke;
  id v15 = &unk_26430AB78;
  objc_super v16 = v7;
  BOOL v17 = animated;
  id v10 = v7;
  id v11 = (id)[v9 addSuccessBlock:&v12];

  -[CPMapTemplate _postBannerIfNecessaryForNavigationAlert:](self, "_postBannerIfNecessaryForNavigationAlert:", v10, v12, v13, v14, v15);
}

uint64_t __49__CPMapTemplate_presentNavigationAlert_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 showNavigationAlert:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)dismissNavigationAlertAnimated:(BOOL)animated completion:(void *)completion
{
  id v6 = completion;
  id v7 = [(CPTemplate *)self templateProviderFuture];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__CPMapTemplate_dismissNavigationAlertAnimated_completion___block_invoke;
  v10[3] = &unk_26430ABF0;
  BOOL v12 = animated;
  id v11 = v6;
  id v8 = v6;
  id v9 = (id)[v7 addSuccessBlock:v10];
}

void __59__CPMapTemplate_dismissNavigationAlertAnimated_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__CPMapTemplate_dismissNavigationAlertAnimated_completion___block_invoke_2;
  v4[3] = &unk_26430ABC8;
  id v5 = *(id *)(a1 + 32);
  [a2 dismissNavigationAlertAnimated:v3 completion:v4];
}

void __59__CPMapTemplate_dismissNavigationAlertAnimated_completion___block_invoke_2(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__CPMapTemplate_dismissNavigationAlertAnimated_completion___block_invoke_3;
  v3[3] = &unk_26430ABA0;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __59__CPMapTemplate_dismissNavigationAlertAnimated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (void)_updateNavigationAlert:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = self;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_INFO, "%@: Updating navigation alert: %@", buf, 0x16u);
  }

  id v6 = [v4 identifier];
  id v7 = [(CPMapTemplate *)self currentNavigationAlert];
  id v8 = [v7 identifier];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    id v10 = [(CPTemplate *)self templateProviderFuture];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __40__CPMapTemplate__updateNavigationAlert___block_invoke;
    v12[3] = &unk_26430A248;
    id v13 = v4;
    id v11 = (id)[v10 addSuccessBlock:v12];
  }
}

uint64_t __40__CPMapTemplate__updateNavigationAlert___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateNavigationAlert:*(void *)(a1 + 32)];
}

- (void)setMapButtons:(NSArray *)mapButtons
{
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __31__CPMapTemplate_setMapButtons___block_invoke;
  v17[3] = &__block_descriptor_40_e28_v32__0__CPMapButton_8Q16_B24l;
  v17[4] = a2;
  id v4 = mapButtons;
  [(NSArray *)v4 enumerateObjectsUsingBlock:v17];
  [(NSArray *)self->_mapButtons makeObjectsPerformSelector:sel_setControlDelegate_ withObject:0];
  char v5 = [MEMORY[0x263EFF980] array];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __31__CPMapTemplate_setMapButtons___block_invoke_2;
  v15[3] = &unk_26430AC38;
  v15[4] = self;
  id v16 = v5;
  id v6 = v5;
  [(NSArray *)v4 enumerateObjectsUsingBlock:v15];

  id v7 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];
  id v8 = self->_mapButtons;
  self->_mapButtons = v7;

  int v9 = self->_mapButtons;
  id v10 = [(CPTemplate *)self templateProviderFuture];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __31__CPMapTemplate_setMapButtons___block_invoke_3;
  v13[3] = &unk_26430A248;
  id v14 = v9;
  id v11 = v9;
  id v12 = (id)[v10 addSuccessBlock:v13];
}

void __31__CPMapTemplate_setMapButtons___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = objc_opt_class();
  CPAssertAllowedClass(v4, v3, *(const char **)(a1 + 32));
}

void __31__CPMapTemplate_setMapButtons___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a3 == 4)
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = a2;
    [v6 setControlDelegate:v5];
    [*(id *)(a1 + 40) addObject:v6];
  }
}

uint64_t __31__CPMapTemplate_setMapButtons___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 hostSetMapButtons:*(void *)(a1 + 32)];
}

- (void)handleActionForControlIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__CPMapTemplate_handleActionForControlIdentifier___block_invoke;
  v6[3] = &unk_264309F38;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __50__CPMapTemplate_handleActionForControlIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) currentNavigationAlert];

  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) currentNavigationAlert];
    id v5 = [v4 primaryAction];
    id v6 = [v5 identifier];
    LODWORD(v3) = [v3 isEqual:v6];

    if (v3)
    {
      id v7 = CarPlayFrameworkGeneralLogging();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        _os_log_impl(&dword_2181A5000, v7, OS_LOG_TYPE_INFO, "%@: Activated navigation alert primary action with control identifier: %@", buf, 0x16u);
      }

      id v10 = [*(id *)(a1 + 32) currentNavigationAlert];
      id v11 = [v10 primaryAction];
LABEL_10:
      v19 = v11;
      __50__CPMapTemplate_handleActionForControlIdentifier___block_invoke_2((uint64_t)v11, v11);

      return;
    }
    id v12 = *(void **)(a1 + 40);
    id v13 = [*(id *)(a1 + 32) currentNavigationAlert];
    id v14 = [v13 secondaryAction];
    id v15 = [v14 identifier];
    LODWORD(v12) = [v12 isEqual:v15];

    if (v12)
    {
      id v16 = CarPlayFrameworkGeneralLogging();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v18 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        _os_log_impl(&dword_2181A5000, v16, OS_LOG_TYPE_INFO, "%@: Activated navigation alert secondary action with control identifier: %@", buf, 0x16u);
      }

      id v10 = [*(id *)(a1 + 32) currentNavigationAlert];
      id v11 = [v10 secondaryAction];
      goto LABEL_10;
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v37 = __Block_byref_object_copy__5;
  v38 = __Block_byref_object_dispose__5;
  id v39 = 0;
  __int16 v20 = [*(id *)(a1 + 32) mapButtons];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __50__CPMapTemplate_handleActionForControlIdentifier___block_invoke_43;
  v27[3] = &unk_26430AC60;
  id v28 = *(id *)(a1 + 40);
  v29 = buf;
  [v20 enumerateObjectsUsingBlock:v27];

  if (*(void *)(*(void *)&buf[8] + 40))
  {
    v21 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = *(void *)(*(void *)&buf[8] + 40);
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = *(void *)(a1 + 40);
      *(_DWORD *)uint64_t v30 = 138412802;
      uint64_t v31 = v23;
      __int16 v32 = 2112;
      uint64_t v33 = v22;
      __int16 v34 = 2112;
      uint64_t v35 = v24;
      _os_log_impl(&dword_2181A5000, v21, OS_LOG_TYPE_INFO, "%@: Activated button: %@ for control identifier: %@", v30, 0x20u);
    }

    [*(id *)(*(void *)&buf[8] + 40) handlePrimaryAction];
  }
  else
  {
    uint64_t v25 = *(void *)(a1 + 40);
    v26.receiver = *(id *)(a1 + 32);
    v26.super_class = (Class)CPMapTemplate;
    objc_msgSendSuper2(&v26, sel_handleActionForControlIdentifier_, v25);
  }

  _Block_object_dispose(buf, 8);
}

void __50__CPMapTemplate_handleActionForControlIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 handler];

  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__CPMapTemplate_handleActionForControlIdentifier___block_invoke_3;
    block[3] = &unk_264309D80;
    id v5 = v2;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __50__CPMapTemplate_handleActionForControlIdentifier___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handler];
  v2[2](v2, *(void *)(a1 + 32));
}

void __50__CPMapTemplate_handleActionForControlIdentifier___block_invoke_43(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 identifier];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_resolveTrip:(id)a3 routeChoice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void *))a5;
  id v11 = [(CPMapTemplate *)self tripPreviews];
  id v12 = (void *)MEMORY[0x263F08A98];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __53__CPMapTemplate__resolveTrip_routeChoice_completion___block_invoke;
  v29[3] = &unk_26430AC88;
  id v13 = v8;
  id v30 = v13;
  id v14 = [v12 predicateWithBlock:v29];
  id v15 = [v11 filteredArrayUsingPredicate:v14];
  id v16 = [v15 firstObject];

  uint64_t v17 = [v16 routeChoices];
  uint64_t v18 = (void *)MEMORY[0x263F08A98];
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  objc_super v26 = __53__CPMapTemplate__resolveTrip_routeChoice_completion___block_invoke_2;
  v27 = &unk_26430ACB0;
  id v19 = v9;
  id v28 = v19;
  __int16 v20 = [v18 predicateWithBlock:&v24];
  v21 = objc_msgSend(v17, "filteredArrayUsingPredicate:", v20, v24, v25, v26, v27);
  uint64_t v22 = [v21 firstObject];

  if (v16 && v22)
  {
    if (v10) {
      v10[2](v10, v16, v22);
    }
  }
  else
  {
    uint64_t v23 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[CPMapTemplate _resolveTrip:routeChoice:completion:]((uint64_t)v13, (uint64_t)v19, v23);
    }
  }
}

uint64_t __53__CPMapTemplate__resolveTrip_routeChoice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

uint64_t __53__CPMapTemplate__resolveTrip_routeChoice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (void)previewTripIdentifier:(id)a3 usingRouteIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CPMapTemplate_previewTripIdentifier_usingRouteIdentifier___block_invoke;
  block[3] = &unk_26430AD00;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__CPMapTemplate_previewTripIdentifier_usingRouteIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapDelegate];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__CPMapTemplate_previewTripIdentifier_usingRouteIdentifier___block_invoke_2;
  v7[3] = &unk_26430ACD8;
  id v5 = *(void **)(a1 + 32);
  id v8 = v2;
  id v9 = v5;
  id v6 = v2;
  [v5 _resolveTrip:v3 routeChoice:v4 completion:v7];
}

void __60__CPMapTemplate_previewTripIdentifier_usingRouteIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    [*(id *)(a1 + 32) mapTemplate:*(void *)(a1 + 40) selectedPreviewForTrip:v5 usingRouteChoice:v6];
  }
  else
  {
    id v7 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__CPMapTemplate_previewTripIdentifier_usingRouteIdentifier___block_invoke_2_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)startTripIdentifier:(id)a3 usingRouteIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CPMapTemplate_startTripIdentifier_usingRouteIdentifier___block_invoke;
  block[3] = &unk_26430AD00;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__CPMapTemplate_startTripIdentifier_usingRouteIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapDelegate];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__CPMapTemplate_startTripIdentifier_usingRouteIdentifier___block_invoke_2;
  v7[3] = &unk_26430ACD8;
  id v5 = *(void **)(a1 + 32);
  id v8 = v2;
  id v9 = v5;
  id v6 = v2;
  [v5 _resolveTrip:v3 routeChoice:v4 completion:v7];
}

void __58__CPMapTemplate_startTripIdentifier_usingRouteIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    [*(id *)(a1 + 32) mapTemplate:*(void *)(a1 + 40) startedTrip:v5 usingRouteChoice:v6];
  }
  else
  {
    id v7 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__CPMapTemplate_startTripIdentifier_usingRouteIdentifier___block_invoke_2_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)showPanningInterfaceAnimated:(BOOL)animated
{
  uint64_t v4 = [(CPTemplate *)self templateProviderFuture];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__CPMapTemplate_showPanningInterfaceAnimated___block_invoke;
  v6[3] = &__block_descriptor_33_e34_v16__0___CPMapTemplateProviding__8l;
  BOOL v7 = animated;
  id v5 = (id)[v4 addSuccessBlock:v6];
}

uint64_t __46__CPMapTemplate_showPanningInterfaceAnimated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hostSetPanInterfaceVisible:1 animated:*(unsigned __int8 *)(a1 + 32)];
}

- (void)dismissPanningInterfaceAnimated:(BOOL)animated
{
  uint64_t v4 = [(CPTemplate *)self templateProviderFuture];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__CPMapTemplate_dismissPanningInterfaceAnimated___block_invoke;
  v6[3] = &__block_descriptor_33_e34_v16__0___CPMapTemplateProviding__8l;
  BOOL v7 = animated;
  id v5 = (id)[v4 addSuccessBlock:v6];
}

uint64_t __49__CPMapTemplate_dismissPanningInterfaceAnimated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hostSetPanInterfaceVisible:0 animated:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)isPanningInterfaceVisible
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v4 = [(CPTemplate *)self templateProviderFuture];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__CPMapTemplate_isPanningInterfaceVisible__block_invoke;
  v9[3] = &unk_26430AD50;
  uint64_t v11 = &v12;
  id v5 = v3;
  uint64_t v10 = v5;
  id v6 = (id)[v4 addSuccessBlock:v9];

  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v7);
  LOBYTE(v4) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

void __42__CPMapTemplate_isPanningInterfaceVisible__block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__CPMapTemplate_isPanningInterfaceVisible__block_invoke_2;
  v5[3] = &unk_26430AD28;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [a2 hostPanInterfaceVisible:v5];
}

intptr_t __42__CPMapTemplate_isPanningInterfaceVisible__block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)clientTripAlreadyStartedException
{
}

void __50__CPMapTemplate_clientTripAlreadyStartedException__block_invoke()
{
}

- (void)clientPanViewDidAppear
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__CPMapTemplate_clientPanViewDidAppear__block_invoke;
  block[3] = &unk_264309D80;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __39__CPMapTemplate_clientPanViewDidAppear__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) mapDelegate];
    [v4 mapTemplateDidShowPanningInterface:*(void *)(a1 + 32)];
  }
}

- (void)clientPanViewWillDisappear
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__CPMapTemplate_clientPanViewWillDisappear__block_invoke;
  block[3] = &unk_264309D80;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __43__CPMapTemplate_clientPanViewWillDisappear__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) mapDelegate];
    [v4 mapTemplateWillDismissPanningInterface:*(void *)(a1 + 32)];
  }
}

- (void)clientPanViewDidDisappear
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__CPMapTemplate_clientPanViewDidDisappear__block_invoke;
  block[3] = &unk_264309D80;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __42__CPMapTemplate_clientPanViewDidDisappear__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) mapDelegate];
    [v4 mapTemplateDidDismissPanningInterface:*(void *)(a1 + 32)];
  }
}

- (void)clientPanBeganWithDirection:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__CPMapTemplate_clientPanBeganWithDirection___block_invoke;
  v3[3] = &unk_264309F10;
  void v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __45__CPMapTemplate_clientPanBeganWithDirection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) mapDelegate];
    [v4 mapTemplate:*(void *)(a1 + 32) panBeganWithDirection:*(void *)(a1 + 40)];
  }
}

- (void)clientPanEndedWithDirection:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__CPMapTemplate_clientPanEndedWithDirection___block_invoke;
  v3[3] = &unk_264309F10;
  void v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __45__CPMapTemplate_clientPanEndedWithDirection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) mapDelegate];
    [v4 mapTemplate:*(void *)(a1 + 32) panEndedWithDirection:*(void *)(a1 + 40)];
  }
}

- (void)clientPanGestureBegan
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__CPMapTemplate_clientPanGestureBegan__block_invoke;
  block[3] = &unk_264309D80;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __38__CPMapTemplate_clientPanGestureBegan__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) mapDelegate];
    [v4 mapTemplateDidBeginPanGesture:*(void *)(a1 + 32)];
  }
}

- (void)clientPanGestureWithDeltaPoint:(CGPoint)a3 velocity:(CGPoint)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__CPMapTemplate_clientPanGestureWithDeltaPoint_velocity___block_invoke;
  block[3] = &unk_26430A3D0;
  void block[4] = self;
  CGPoint v5 = a3;
  CGPoint v6 = a4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __57__CPMapTemplate_clientPanGestureWithDeltaPoint_velocity___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) mapDelegate];
    objc_msgSend(v4, "mapTemplate:didUpdatePanGestureWithTranslation:velocity:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
}

- (void)clientPanGestureEndedWithVelocity:(CGPoint)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__CPMapTemplate_clientPanGestureEndedWithVelocity___block_invoke;
  block[3] = &unk_26430AD78;
  void block[4] = self;
  CGPoint v4 = a3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __51__CPMapTemplate_clientPanGestureEndedWithVelocity___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) mapDelegate];
    objc_msgSend(v4, "mapTemplate:didEndPanGestureWithVelocity:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
}

- (void)clientPanWithDirection:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__CPMapTemplate_clientPanWithDirection___block_invoke;
  v3[3] = &unk_264309F10;
  void v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __40__CPMapTemplate_clientPanWithDirection___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) mapDelegate];
  char v3 = objc_opt_respondsToSelector();

  id v4 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    CGPoint v6 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
    dispatch_time_t v7 = [NSNumber numberWithBool:v3 & 1];
    int v9 = 138412802;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_2181A5000, v4, OS_LOG_TYPE_DEFAULT, "%@: Pan button pressed with direction: %@. Delegate responds to panWithDirection: %@", (uint8_t *)&v9, 0x20u);
  }
  if (v3)
  {
    uint64_t v8 = [*(id *)(a1 + 32) mapDelegate];
    [v8 mapTemplate:*(void *)(a1 + 32) panWithDirection:*(void *)(a1 + 40)];
  }
}

- (void)clientNavigationAlertWillAppear:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__CPMapTemplate_clientNavigationAlertWillAppear___block_invoke;
  v6[3] = &unk_264309F38;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __49__CPMapTemplate_clientNavigationAlertWillAppear___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v7 = [*(id *)(a1 + 32) mapDelegate];
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 currentNavigationAlert];
    CGPoint v6 = v5;
    if (!v5) {
      CGPoint v6 = *(void **)(a1 + 40);
    }
    [v7 mapTemplate:v4 willShowNavigationAlert:v6];
  }
}

- (void)clientNavigationAlertDidAppear:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__CPMapTemplate_clientNavigationAlertDidAppear___block_invoke;
  v6[3] = &unk_264309F38;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __48__CPMapTemplate_clientNavigationAlertDidAppear___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v7 = [*(id *)(a1 + 32) mapDelegate];
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 currentNavigationAlert];
    CGPoint v6 = v5;
    if (!v5) {
      CGPoint v6 = *(void **)(a1 + 40);
    }
    [v7 mapTemplate:v4 didShowNavigationAlert:v6];
  }
}

- (void)clientNavigationAlertWillDisappear:(id)a3 context:(unint64_t)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CPMapTemplate_clientNavigationAlertWillDisappear_context___block_invoke;
  block[3] = &unk_26430A4F8;
  void block[4] = self;
  id v9 = v6;
  unint64_t v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__CPMapTemplate_clientNavigationAlertWillDisappear_context___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v7 = [*(id *)(a1 + 32) mapDelegate];
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 currentNavigationAlert];
    id v6 = v5;
    if (!v5) {
      id v6 = *(void **)(a1 + 40);
    }
    [v7 mapTemplate:v4 willDismissNavigationAlert:v6 dismissalContext:*(void *)(a1 + 48)];
  }
}

- (void)clientNavigationAlertDidDisappear:(id)a3 context:(unint64_t)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CPMapTemplate_clientNavigationAlertDidDisappear_context___block_invoke;
  block[3] = &unk_26430A4F8;
  void block[4] = self;
  id v9 = v6;
  unint64_t v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __59__CPMapTemplate_clientNavigationAlertDidDisappear_context___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) mapDelegate];
    id v5 = *(void **)(a1 + 32);
    id v6 = [v5 currentNavigationAlert];
    id v7 = v6;
    if (!v6) {
      id v7 = *(void **)(a1 + 40);
    }
    [v4 mapTemplate:v5 didDismissNavigationAlert:v7 dismissalContext:*(void *)(a1 + 48)];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 144);
  *(void *)(v8 + 144) = 0;

  unint64_t v10 = [*(id *)(a1 + 40) identifier];

  if (v10)
  {
    id v20 = [*(id *)(a1 + 32) postedBannerObjects];
    __int16 v11 = [*(id *)(a1 + 40) identifier];
    [v20 removeObjectForKey:v11];
  }
  else
  {
    uint64_t v12 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __59__CPMapTemplate_clientNavigationAlertDidDisappear_context___block_invoke_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)clientTripCanceledByExternalNavigation
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CPMapTemplate_clientTripCanceledByExternalNavigation__block_invoke;
  block[3] = &unk_264309D80;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __55__CPMapTemplate_clientTripCanceledByExternalNavigation__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) mapDelegate];
    [v4 mapTemplateDidCancelNavigation:*(void *)(a1 + 32)];
  }
  id v5 = [*(id *)(a1 + 32) postedBannerObjects];
  [v5 removeAllObjects];
}

- (int64_t)_displayStyleForManeuver:(id)a3
{
  id v4 = a3;
  id v5 = [(CPMapTemplate *)self mapDelegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v6 = [v5 mapTemplate:self displayStyleForManeuver:v4];
    [v4 setDisplayStyle:v6];
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)bannerDidDisappearWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CPMapTemplate *)self postedBannerObjects];
  [v5 removeObjectForKey:v4];
}

- (void)bannerTappedWithIdentifier:(id)a3
{
  id v19 = a3;
  id v4 = [(CPMapTemplate *)self postedBannerObjects];
  id v5 = [v4 objectForKeyedSubscript:v19];

  if (v5)
  {
    int64_t v6 = [(CPMapTemplate *)self postedBannerObjects];
    [v6 removeObjectForKey:v19];

    id v7 = +[CPTemplateApplicationScene activeTemplateScene];
    uint64_t v8 = [v7 delegate];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (objc_opt_respondsToSelector())
      {
        [v8 templateApplicationScene:v7 didSelectNavigationAlert:v5];
LABEL_13:

        goto LABEL_14;
      }
      id v9 = [MEMORY[0x263F1C408] sharedApplication];
      unint64_t v10 = [v9 delegate];
      char v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0) {
        goto LABEL_13;
      }
      uint64_t v12 = [MEMORY[0x263F1C408] sharedApplication];
      uint64_t v13 = [v12 delegate];

      uint64_t v14 = [MEMORY[0x263F1C408] sharedApplication];
      [v13 application:v14 didSelectNavigationAlert:v5];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_13;
      }
      if (objc_opt_respondsToSelector())
      {
        [v8 templateApplicationScene:v7 didSelectManeuver:v5];
        goto LABEL_13;
      }
      uint64_t v15 = [MEMORY[0x263F1C408] sharedApplication];
      uint64_t v16 = [v15 delegate];
      char v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) == 0) {
        goto LABEL_13;
      }
      uint64_t v18 = [MEMORY[0x263F1C408] sharedApplication];
      uint64_t v13 = [v18 delegate];

      uint64_t v14 = [MEMORY[0x263F1C408] sharedApplication];
      [v13 application:v14 didSelectManeuver:v5];
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (void)_postBannerIfNecessaryForManeuver:(id)a3
{
  id v12 = a3;
  id v4 = [(CPTemplate *)self templateDelegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0
    || ([(CPTemplate *)self templateDelegate],
        int64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isCarPlayCanvasActive],
        v6,
        (v7 & 1) == 0))
  {
    uint64_t v8 = [(CPMapTemplate *)self mapDelegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v8 mapTemplate:self shouldShowNotificationForManeuver:v12])
    {
      postedBannerObjects = self->_postedBannerObjects;
      unint64_t v10 = [v12 identifier];
      [(NSMutableDictionary *)postedBannerObjects setObject:v12 forKeyedSubscript:v10];

      char v11 = [(CPMapTemplate *)self bannerProvider];
      [v11 postBannerForManeuver:v12 travelEstimates:0];
    }
  }
}

- (void)_postBannerIfNecessaryForNavigationAlert:(id)a3
{
  id v12 = a3;
  id v4 = [(CPTemplate *)self templateDelegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0
    || ([(CPTemplate *)self templateDelegate],
        int64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isCarPlayCanvasActive],
        v6,
        (v7 & 1) == 0))
  {
    uint64_t v8 = [(CPMapTemplate *)self mapDelegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v8 mapTemplate:self shouldShowNotificationForNavigationAlert:v12])
    {
      postedBannerObjects = self->_postedBannerObjects;
      unint64_t v10 = [v12 identifier];
      [(NSMutableDictionary *)postedBannerObjects setObject:v12 forKeyedSubscript:v10];

      char v11 = [(CPMapTemplate *)self bannerProvider];
      [v11 postBannerForNavigationAlert:v12];
    }
  }
}

- (void)_updateBannerIfNecessaryForManeuver:(id)a3 travelEstimates:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  char v7 = [(CPTemplate *)self templateDelegate];
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0
    || ([(CPTemplate *)self templateDelegate],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isCarPlayCanvasActive],
        v9,
        (v10 & 1) == 0))
  {
    char v11 = [(CPMapTemplate *)self mapDelegate];
    if (objc_opt_respondsToSelector())
    {
      int v12 = [v11 mapTemplate:self shouldUpdateNotificationForManeuver:v16 withTravelEstimates:v6];
      if (v16)
      {
        if (v12)
        {
          postedBannerObjects = self->_postedBannerObjects;
          uint64_t v14 = [v16 identifier];
          [(NSMutableDictionary *)postedBannerObjects setObject:v16 forKeyedSubscript:v14];

          uint64_t v15 = [(CPMapTemplate *)self bannerProvider];
          [v15 postBannerForManeuver:v16 travelEstimates:v6];
        }
      }
    }
  }
}

- (UIColor)guidanceBackgroundColor
{
  return self->_guidanceBackgroundColor;
}

- (CPTripEstimateStyle)tripEstimateStyle
{
  return self->_tripEstimateStyle;
}

- (NSArray)mapButtons
{
  return self->_mapButtons;
}

- (BOOL)automaticallyHidesNavigationBar
{
  return self->_automaticallyHidesNavigationBar;
}

- (BOOL)hidesButtonsWithNavigationBar
{
  return self->_hidesButtonsWithNavigationBar;
}

- (id)mapDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapDelegate);

  return WeakRetained;
}

- (void)setMapDelegate:(id)mapDelegate
{
}

- (CPNavigationAlert)currentNavigationAlert
{
  return self->_currentNavigationAlert;
}

- (NSMutableDictionary)postedBannerObjects
{
  return self->_postedBannerObjects;
}

- (void)setPostedBannerObjects:(id)a3
{
}

- (NAFuture)navigationSessionProviderFuture
{
  return self->_navigationSessionProviderFuture;
}

- (void)setNavigationSessionProviderFuture:(id)a3
{
}

- (CPBannerProviding)bannerProvider
{
  return self->_bannerProvider;
}

- (void)setBannerProvider:(id)a3
{
}

- (CPNavigationSessionProviding)navigationSessionProvider
{
  return self->_navigationSessionProvider;
}

- (NSArray)tripPreviews
{
  return self->_tripPreviews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripPreviews, 0);
  objc_storeStrong((id *)&self->_navigationSessionProvider, 0);
  objc_storeStrong((id *)&self->_bannerProvider, 0);
  objc_storeStrong((id *)&self->_navigationSessionProviderFuture, 0);
  objc_storeStrong((id *)&self->_postedBannerObjects, 0);
  objc_storeStrong((id *)&self->_currentNavigationAlert, 0);
  objc_destroyWeak((id *)&self->_mapDelegate);
  objc_storeStrong((id *)&self->_mapButtons, 0);

  objc_storeStrong((id *)&self->_guidanceBackgroundColor, 0);
}

- (void)_resolveTrip:(uint64_t)a1 routeChoice:(uint64_t)a2 completion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2181A5000, log, OS_LOG_TYPE_ERROR, "failed to find matching objects for trip %@ and route %@", (uint8_t *)&v3, 0x16u);
}

void __60__CPMapTemplate_previewTripIdentifier_usingRouteIdentifier___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__CPMapTemplate_startTripIdentifier_usingRouteIdentifier___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59__CPMapTemplate_clientNavigationAlertDidDisappear_context___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end