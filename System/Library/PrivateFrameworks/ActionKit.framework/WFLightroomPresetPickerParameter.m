@interface WFLightroomPresetPickerParameter
+ (id)presetsByGroup;
- (BOOL)isHidden;
- (Class)singleStateClass;
- (NSArray)possibleStates;
- (WFAction)action;
- (id)localizedLabelForPossibleState:(id)a3;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)possibleStatesDidChange;
- (void)setAction:(id)a3;
@end

@implementation WFLightroomPresetPickerParameter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (WFAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (WFAction *)WeakRetained;
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5 = a4;
  v6 = [(WFLightroomPresetPickerParameter *)self definition];
  v7 = [v6 objectForKey:@"PresetGroupKey"];
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    [(WFLightroomPresetPickerParameter *)self possibleStatesDidChange];
  }
}

- (id)localizedLabelForPossibleState:(id)a3
{
  v3 = [a3 value];
  v4 = [v3 displayString];

  return v4;
}

- (NSArray)possibleStates
{
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    v4 = [(WFLightroomPresetPickerParameter *)self action];
    id v5 = [(WFLightroomPresetPickerParameter *)self definition];
    v6 = [v5 objectForKey:@"PresetGroupKey"];
    v7 = [v4 parameterStateForKey:v6];

    int v8 = [(id)objc_opt_class() presetsByGroup];
    v9 = [v7 value];
    v10 = [v8 objectForKey:v9];

    objc_msgSend(v10, "if_compactMap:", &__block_literal_global_1201);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v12 = self->_possibleStates;
    self->_possibleStates = v11;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

id __50__WFLightroomPresetPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86C20];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

- (BOOL)isHidden
{
  v2 = [(WFLightroomPresetPickerParameter *)self possibleStates];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void)possibleStatesDidChange
{
  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFLightroomPresetPickerParameter;
  [(WFLightroomPresetPickerParameter *)&v4 possibleStatesDidChange];
}

- (void)setAction:(id)a3
{
  p_action = &self->_action;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_action);
  [WeakRetained removeEventObserver:self];

  objc_storeWeak((id *)p_action, v5);
  [v5 addEventObserver:self];

  [(WFLightroomPresetPickerParameter *)self possibleStatesDidChange];
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

+ (id)presetsByGroup
{
  v62[7] = *MEMORY[0x263EF8340];
  v61[0] = @"B&W";
  v53 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"19271F2DDD66BC545C6190F4B84A36F0" displayString:@"Punch"];
  v60[0] = v53;
  v52 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"1CFE55E8E69B5ACE9873EF4AA90E8B4D" displayString:@"High Contrast"];
  v60[1] = v52;
  v51 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"33C9D95D9699BFAFC894C2040B26F8D3" displayString:@"Sepia Tone"];
  v60[2] = v51;
  v50 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"4F0AAD59434D2B8A9A97FF18B7DA9A9F" displayString:@"Infrared"];
  v60[3] = v50;
  v49 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"A0E0A57F977717F5A5D58D93EEFCDE80" displayString:@"Selenium Tone"];
  v60[4] = v49;
  v48 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"ACA9F103CE197414B5D2FB044214A1F6" displayString:@"Split Tone"];
  v60[5] = v48;
  v47 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"BC40F013813101E79FA77C52AF2C24EA" displayString:@"Landscape"];
  v60[6] = v47;
  v46 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"D6FD323773F16CA6E39CD151831EDD57" displayString:@"Soft"];
  v60[7] = v46;
  v45 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"D858F1679E126E7B88F477259C932EE8" displayString:@"Flat"];
  v60[8] = v45;
  v44 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"F6E61E9487CF280BA0F78E85B8291EEE" displayString:@"Low Contrast"];
  v60[9] = v44;
  v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:10];
  v62[0] = v43;
  v61[1] = @"Color";
  v42 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"24411B29DA6F03858BD4604A6772D3B7" displayString:@"High Contrast"];
  v59[0] = v42;
  v41 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"94A7B12F170D65F5F86DF16A8165EDB8" displayString:@"Matte"];
  v59[1] = v41;
  v40 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"A8400A4F84CEFC90DFDC3F0598A3E80F" displayString:@"Natural"];
  v59[2] = v40;
  v39 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"B4DF7CAAC3DC5851334749CD66C6E093" displayString:@"Vivid"];
  v59[3] = v39;
  v38 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"D7878D40EEE6081C516E9F49732DE1A3" displayString:@"High Contrast & Detail"];
  v59[4] = v38;
  v37 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"D9DBEEE928A264244D00B9960351DD85" displayString:@"Bright"];
  v59[5] = v37;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:6];
  v62[1] = v36;
  v61[2] = @"Creative";
  v35 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"0F011E395F1F535B9C22C9FD317FF541" displayString:@"Flat & Green"];
  v58[0] = v35;
  v34 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"1F87275D229A17F59AC6AEEB07740A8B" displayString:@"Warm Shadows"];
  v58[1] = v34;
  v33 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"4CE218B784FD9FA45A901D74AA9473B1" displayString:@"Cool Light"];
  v58[2] = v33;
  v32 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"62A3A4F10DEFAB5DB96E2E819695AE45" displayString:@"Turquoise & Red"];
  v58[3] = v32;
  v31 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"ACA35E0D0E9604A00E57A3DE7CC349D4" displayString:@"Red Lift Matte"];
  v58[4] = v31;
  v30 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"CED5E9863E3821FFE0A1B691A63A3D31" displayString:@"Warm Contrast"];
  v58[5] = v30;
  v29 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"CFB23A1F4CC9954DB4D5BABB76B1837A" displayString:@"Desaturated Contrast"];
  v58[6] = v29;
  v28 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"E28022BE507EB904FAC12AF4D9020EF2" displayString:@"Soft Mist"];
  v58[7] = v28;
  v27 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"E9F14D340EE517BAE40885B2C75179E3" displayString:@"Vintage Instant"];
  v58[8] = v27;
  v26 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"F2519E32E9412F082845648CCAE463EC" displayString:@"Aged Photo"];
  v58[9] = v26;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:10];
  v62[2] = v25;
  v61[3] = @"Curve";
  v24 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"34B01A80E7C1D5D9066012B6EF3FDC18" displayString:@"Flat"];
  v57[0] = v24;
  v23 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"63A97DC6094C1DA30C06339BABF88894" displayString:@"Strong S Curve"];
  v57[1] = v23;
  v22 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"69FE229AD75B5BB3A8579C3B854C5B48" displayString:@"None"];
  v57[2] = v22;
  v21 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"7B538D900711C300BE09C022DABF1363" displayString:@"Lift Shadows"];
  v57[3] = v21;
  v20 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"BD3BD3746830FD852159955AB11EEE21" displayString:@"Cross Process"];
  v57[4] = v20;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:5];
  v62[3] = v19;
  v61[4] = @"Grain";
  v18 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"26974227534FC2BE01BA2FEA23B0B1CA" displayString:@"Medium"];
  v56[0] = v18;
  v17 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"54E8B33AF99FF270CA5063C498BD3C90" displayString:@"Heavy"];
  v56[1] = v17;
  v16 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"65099705565294D471733DF04B6EFF81" displayString:@"None"];
  v56[2] = v16;
  v15 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"95FB372852D2646A914E82BAF810A621" displayString:@"Light"];
  v56[3] = v15;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:4];
  v62[4] = v14;
  v61[5] = @"Sharpening";
  v2 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"1A5330A7529B1FDCB1B2747AD29A7D37" displayString:@"Medium"];
  v55[0] = v2;
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"606E77E300EA35C7C7F54A0D01217A3C" displayString:@"None"];
  v55[1] = v3;
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"B9F499526A62395B4B74670B1A42F1C9" displayString:@"Heavy"];
  v55[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"DAEFD428A1FABB512C2FC55653E43823" displayString:@"Light"];
  v55[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:4];
  v62[5] = v6;
  v61[6] = @"Vignetting";
  v7 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"3E6450B5D15D661006AD72C79EC6FB6E" displayString:@"Medium"];
  v54[0] = v7;
  int v8 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"B10E60EFE17E2A501068449B3374EED4" displayString:@"Heavy"];
  v54[1] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"B172B4349A640AD8EFFCF1747FF1D96F" displayString:@"None"];
  v54[2] = v9;
  v10 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:@"BC38A4949BDF6AD56FD42D6E5563C9C3" displayString:@"Light"];
  v54[3] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:4];
  v62[6] = v11;
  id v13 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:7];

  return v13;
}

@end