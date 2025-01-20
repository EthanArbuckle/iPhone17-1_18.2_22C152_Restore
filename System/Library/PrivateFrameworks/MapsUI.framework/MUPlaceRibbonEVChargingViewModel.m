@interface MUPlaceRibbonEVChargingViewModel
+ (id)attributedStringFromString:(id)a3 color:(id)a4;
- (MUPlaceRibbonEVChargingViewModel)initWithAvailabilityProvider:(id)a3;
- (_TtC6MapsUI31MUEVChargerAvailabilityProvider)availabilityProvider;
- (id)typeStringForAX;
- (void)_updateStringProviders;
- (void)dealloc;
- (void)evChargerAvailabilityProvider:(id)a3 didUpdateAvailability:(id)a4;
- (void)setAvailabilityProvider:(id)a3;
@end

@implementation MUPlaceRibbonEVChargingViewModel

- (MUPlaceRibbonEVChargingViewModel)initWithAvailabilityProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MUPlaceRibbonEVChargingViewModel;
  v5 = [(MUPlaceRibbonEVChargingViewModel *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(MUPlaceRibbonEVChargingViewModel *)v5 setAvailabilityProvider:v4];
    [(MUPlaceRibbonEVChargingViewModel *)v6 _updateStringProviders];
    [v4 registerObserver:v6];
  }

  return v6;
}

- (void)dealloc
{
  v3 = [(MUPlaceRibbonEVChargingViewModel *)self availabilityProvider];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MUPlaceRibbonEVChargingViewModel;
  [(MUPlaceRibbonEVChargingViewModel *)&v4 dealloc];
}

- (void)_updateStringProviders
{
  v3 = [(MUPlaceRibbonEVChargingViewModel *)self availabilityProvider];
  objc_super v4 = [v3 availability];

  v5 = [v4 aggregatedInfo];
  int v6 = [v5 status];

  if (v6) {
    v7 = @"Available Now [Placecard ribbon item title]";
  }
  else {
    v7 = @"Chargers [EV Charging]";
  }
  _MULocalizedStringFromThisBundle(v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___defaultTitleAttributedStringForString_block_invoke;
  aBlock[3] = &unk_1E57505C8;
  id v14 = v8;
  v9 = _Block_copy(aBlock);

  [(MUPlaceRibbonItemViewModel *)self setTitleStringProvider:v9];
  [(MUPlaceRibbonItemViewModel *)self setTypeStringForAX:@"EVChargingAvailability"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__MUPlaceRibbonEVChargingViewModel__updateStringProviders__block_invoke;
  v11[3] = &unk_1E57505C8;
  id v12 = v4;
  id v10 = v4;
  [(MUPlaceRibbonItemViewModel *)self setValueStringProvider:v11];
}

id __58__MUPlaceRibbonEVChargingViewModel__updateStringProviders__block_invoke(uint64_t a1)
{
  v60[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4FB1830];
  v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
  objc_super v4 = objc_msgSend(v3, "_mapkit_fontWithWeight:", 1.0);
  v5 = [v2 configurationWithFont:v4 scale:1];
  int v6 = +[MURealTimeEVChargerUtility evPlugIconWithConfiguration:v5];

  v7 = [MEMORY[0x1E4FB1618] systemGrayColor];
  id v8 = +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:v7];
  v9 = (objc_class *)MEMORY[0x1E4FB0870];
  id v10 = v6;
  id v11 = objc_alloc_init(v9);
  id v12 = [v10 imageWithRenderingMode:2];
  v58 = v10;

  [v11 setImage:v12];
  v13 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v11];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v13];
  uint64_t v57 = *MEMORY[0x1E4FB0700];
  uint64_t v59 = *MEMORY[0x1E4FB0700];
  v60[0] = v8;
  v15 = (void *)MEMORY[0x1E4F1C9E8];
  id v16 = v8;
  v17 = [v15 dictionaryWithObjects:v60 forKeys:&v59 count:1];

  objc_msgSend(v14, "addAttributes:range:", v17, 0, objc_msgSend(v14, "length"));
  v18 = (void *)[v14 copy];

  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v19 addObject:v18];
  v20 = [*(id *)(a1 + 32) aggregatedInfo];
  int v21 = [v20 status];

  if (v21)
  {
    v22 = [*(id *)(a1 + 32) aggregatedInfo];
    uint64_t v23 = [v22 available];
    v24 = [*(id *)(a1 + 32) aggregatedInfo];
    v25 = +[MUEVChargingHelper localizedStringForAvailableChargers:outOfTotal:](MUEVChargingHelper, "localizedStringForAvailableChargers:outOfTotal:", v23, [v24 total]);

    v26 = [*(id *)(a1 + 32) aggregatedInfo];
    v56 = v18;
    int v55 = v21;
    if ([v26 available]) {
      [MEMORY[0x1E4FB1618] systemGreenColor];
    }
    else {
    v33 = [MEMORY[0x1E4FB1618] systemGrayColor];
    }

    v35 = (void *)MEMORY[0x1E4FB1818];
    v36 = (void *)MEMORY[0x1E4FB1830];
    v37 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    v38 = [v36 configurationWithFont:v37 scale:1];
    v39 = [v35 systemImageNamed:@"dot.radiowaves.up.forward" withConfiguration:v38];

    v40 = [v39 imageWithRenderingMode:2];

    id v41 = [MEMORY[0x1E4FB1618] systemGreenColor];
    v42 = (objc_class *)MEMORY[0x1E4FB0870];
    id v34 = v40;
    id v43 = objc_alloc_init(v42);
    v44 = [v34 imageWithRenderingMode:2];

    [v43 setImage:v44];
    v45 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v43];
    v46 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v45];
    uint64_t v59 = v57;
    v60[0] = v41;
    v47 = (void *)MEMORY[0x1E4F1C9E8];
    id v48 = v41;
    v49 = [v47 dictionaryWithObjects:v60 forKeys:&v59 count:1];

    objc_msgSend(v46, "addAttributes:range:", v49, 0, objc_msgSend(v46, "length"));
    v50 = (void *)[v46 copy];

    v51 = +[MUPlaceRibbonEVChargingViewModel attributedStringFromString:@" " color:v33];
    [v19 addObject:v51];
    v52 = +[MUPlaceRibbonEVChargingViewModel attributedStringFromString:v25 color:v33];
    [v19 addObject:v52];

    [v19 addObject:v51];
    [v19 addObject:v50];

    v18 = v56;
    int v21 = v55;
  }
  else
  {
    v27 = (void *)MEMORY[0x1E4F28EE0];
    v28 = NSNumber;
    v29 = [*(id *)(a1 + 32) aggregatedInfo];
    v30 = objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v29, "total"));
    v25 = [v27 localizedStringFromNumber:v30 numberStyle:0];

    v31 = [MEMORY[0x1E4FB1618] labelColor];
    v32 = +[MUPlaceRibbonEVChargingViewModel attributedStringFromString:@" " color:v31];
    [v19 addObject:v32];

    v33 = [MEMORY[0x1E4FB1618] labelColor];
    id v34 = +[MUPlaceRibbonEVChargingViewModel attributedStringFromString:v25 color:v33];
    [v19 addObject:v34];
  }

  v53 = +[MapsUILayout buildAttributedDisplayStringForComponents:v19 reverseIfRTLLayout:v21 == 0];

  return v53;
}

+ (id)attributedStringFromString:(id)a3 color:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = (objc_class *)MEMORY[0x1E4F28B18];
  id v7 = a3;
  id v8 = [v6 alloc];
  v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  uint64_t v10 = *MEMORY[0x1E4FB0700];
  v16[0] = *MEMORY[0x1E4FB06F8];
  v16[1] = v10;
  v17[0] = v9;
  v17[1] = v5;
  id v11 = (void *)MEMORY[0x1E4F1C9E8];
  id v12 = v5;
  v13 = [v11 dictionaryWithObjects:v17 forKeys:v16 count:2];

  id v14 = (void *)[v8 initWithString:v7 attributes:v13];
  return v14;
}

- (void)evChargerAvailabilityProvider:(id)a3 didUpdateAvailability:(id)a4
{
  [(MUPlaceRibbonEVChargingViewModel *)self _updateStringProviders];
  id v5 = [(MUPlaceRibbonItemViewModel *)self updateDelegate];
  [v5 ribbonItemViewModelDidUpdate:self];
}

- (id)typeStringForAX
{
  return @"EVCharging";
}

- (_TtC6MapsUI31MUEVChargerAvailabilityProvider)availabilityProvider
{
  return self->_availabilityProvider;
}

- (void)setAvailabilityProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end