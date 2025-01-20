@interface HMTestOcclusionViewController
- (id)datePickerForSpecifier:(id)a3;
- (id)specifiers;
- (void)datePickerChanged:(id)a3;
- (void)listItemSelected:(id)a3;
- (void)postOcclusionData;
- (void)viewDidLoad;
@end

@implementation HMTestOcclusionViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)HMTestOcclusionViewController;
  [(PSListItemsController *)&v2 viewDidLoad];
}

- (id)specifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) userInfo];
  v5 = [v4 objectForKeyedSubscript:@"bt-address"];
  address = self->_address;
  self->_address = v5;

  v56 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Left Bud" target:self set:0 get:0 detail:0 cell:0 edit:0];
  [v3 addObject:v56];
  v55 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Bottom Mic" target:self set:0 get:0 detail:0 cell:3 edit:0];
  uint64_t v7 = *MEMORY[0x263F60138];
  [v55 setProperty:@"bottom-mic-left" forKey:*MEMORY[0x263F60138]];
  [v3 addObject:v55];
  v54 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Frequency Accuracy" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v54 setProperty:@"freq-left" forKey:v7];
  [v3 addObject:v54];
  v53 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Front Vent" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v53 setProperty:@"front-vent-left" forKey:v7];
  [v3 addObject:v53];
  v52 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Inner Mic" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v52 setProperty:@"inner-mic-left" forKey:v7];
  [v3 addObject:v52];
  v51 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Rear Vent" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v51 setProperty:@"rear-vent-left" forKey:v7];
  [v3 addObject:v51];
  v50 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Speaker" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v50 setProperty:@"speaker-left" forKey:v7];
  [v3 addObject:v50];
  v49 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Top Mic" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v49 setProperty:@"top-mic-left" forKey:v7];
  [v3 addObject:v49];
  v48 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Total Harmonic Distribution" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v48 setProperty:@"thd-left" forKey:v7];
  [v3 addObject:v48];
  v47 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"NO UTP Connection" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v47 setProperty:@"no-utp-left" forKey:v7];
  [v3 addObject:v47];
  v46 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"NO measurement + >1 year out of factory" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v46 setProperty:@"no-msr-left" forKey:v7];
  [v3 addObject:v46];
  v8 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Measurement time" target:self set:0 get:0 detail:0 cell:4 edit:0];
  uint64_t v9 = *MEMORY[0x263F60060];
  [v8 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60060]];
  v45 = v8;
  [v8 setProperty:@"timestamp-left" forKey:v7];
  v10 = NSNumber;
  [MEMORY[0x263F5FB58] preferredHeight];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  uint64_t v12 = *MEMORY[0x263F602A8];
  uint64_t v37 = *MEMORY[0x263F602A8];
  [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x263F602A8]];

  uint64_t v13 = objc_opt_class();
  uint64_t v14 = *MEMORY[0x263F5FFE0];
  uint64_t v38 = *MEMORY[0x263F5FFE0];
  [v8 setObject:v13 forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  [v3 addObject:v8];
  v15 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"First time use" target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v15 setProperty:MEMORY[0x263EFFA88] forKey:v9];
  [v15 setProperty:@"first-time-use-left" forKey:v7];
  v16 = NSNumber;
  [MEMORY[0x263F5FB58] preferredHeight];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  [v15 setObject:v17 forKeyedSubscript:v12];

  [v15 setObject:objc_opt_class() forKeyedSubscript:v14];
  [v3 addObject:v15];
  v44 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Right Bud" target:self set:0 get:0 detail:0 cell:0 edit:0];
  [v3 addObject:v44];
  v43 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Bottom Mic" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v43 setProperty:@"bottom-mic-right" forKey:v7];
  [v3 addObject:v43];
  v42 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Frequency Accuracy" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v42 setProperty:@"freq-right" forKey:v7];
  [v3 addObject:v42];
  v41 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Front Vent" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v41 setProperty:@"front-vent-right" forKey:v7];
  [v3 addObject:v41];
  v40 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Inner Mic" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v40 setProperty:@"inner-mic-right" forKey:v7];
  [v3 addObject:v40];
  v39 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Rear Vent" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v39 setProperty:@"rear-vent-right" forKey:v7];
  [v3 addObject:v39];
  v36 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Speaker" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v36 setProperty:@"speaker-right" forKey:v7];
  [v3 addObject:v36];
  v35 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Top Mic" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v35 setProperty:@"top-mic-right" forKey:v7];
  [v3 addObject:v35];
  v34 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Total Harmonic Distribution" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v34 setProperty:@"thd-right" forKey:v7];
  [v3 addObject:v34];
  v33 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"NO UTP Connection" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v33 setProperty:@"no-utp-right" forKey:v7];
  [v3 addObject:v33];
  v32 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"NO measurement + >1 year out of factory" target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v32 setProperty:@"no-msr-right" forKey:v7];
  [v3 addObject:v32];
  v18 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Measurement time" target:self set:0 get:0 detail:0 cell:4 edit:0];
  uint64_t v19 = v9;
  [v18 setProperty:MEMORY[0x263EFFA88] forKey:v9];
  [v18 setProperty:@"timestamp-right" forKey:v7];
  v20 = NSNumber;
  [MEMORY[0x263F5FB58] preferredHeight];
  v21 = objc_msgSend(v20, "numberWithDouble:");
  [v18 setObject:v21 forKeyedSubscript:v37];

  [v18 setObject:objc_opt_class() forKeyedSubscript:v38];
  [v3 addObject:v18];
  v22 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"First time use" target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v22 setProperty:MEMORY[0x263EFFA88] forKey:v19];
  [v22 setProperty:@"first-time-use-right" forKey:v7];
  v23 = NSNumber;
  [MEMORY[0x263F5FB58] preferredHeight];
  v24 = objc_msgSend(v23, "numberWithDouble:");
  [v22 setObject:v24 forKeyedSubscript:v37];

  [v22 setObject:objc_opt_class() forKeyedSubscript:v38];
  [v3 addObject:v22];
  v25 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Send" target:self set:0 get:0 detail:0 cell:0 edit:0];
  [v3 addObject:v25];
  v26 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Send Occlusion Data" target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v26 setProperty:@"send-button" forKey:v7];
  [v3 addObject:v26];
  v27 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];
  uint64_t v28 = (int)*MEMORY[0x263F5FDB8];
  v29 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v28);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v28) = v27;

  id v30 = *(id *)((char *)&self->super.super.super.super.super.super.isa + v28);
  return v30;
}

- (void)listItemSelected:(id)a3
{
  id v81 = a3;
  if ([v81 section] == 2)
  {
    [(HMTestOcclusionViewController *)self postOcclusionData];
    [(HMTestOcclusionViewController *)self reloadSpecifiers];
    self->_unsigned int measurementResultLeft = 0;
    self->_unsigned int measurementResultRight = 0;
    leftMeasurementTimestamp = self->_leftMeasurementTimestamp;
    self->_leftMeasurementTimestamp = 0;

    rightMeasurementTimestamp = self->_rightMeasurementTimestamp;
    self->_rightMeasurementTimestamp = 0;

    firstTimeUseLeftTimestamp = self->_firstTimeUseLeftTimestamp;
    self->_firstTimeUseLeftTimestamp = 0;

    firstTimeUseRightTimestamp = self->_firstTimeUseRightTimestamp;
    self->_firstTimeUseRightTimestamp = 0;
  }
  else
  {
    firstTimeUseRightTimestamp = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) cellForRowAtIndexPath:v81];
    v8 = [(HMTestOcclusionViewController *)self specifierAtIndexPath:v81];
    objc_msgSend(firstTimeUseRightTimestamp, "setChecked:", objc_msgSend(firstTimeUseRightTimestamp, "isChecked") ^ 1);
    uint64_t v9 = [v8 identifier];
    int v10 = [v9 isEqualToString:@"bottom-mic-left"];

    if (v10)
    {
      if ([firstTimeUseRightTimestamp isChecked]) {
        int v11 = 4096;
      }
      else {
        int v11 = 0;
      }
      self->_unsigned int measurementResultLeft = self->_measurementResultLeft & 0xFFFFEFFF | v11;
    }
    uint64_t v12 = [v8 identifier];
    int v13 = [v12 isEqualToString:@"freq-left"];

    if (v13)
    {
      if ([firstTimeUseRightTimestamp isChecked]) {
        int v14 = 256;
      }
      else {
        int v14 = 0;
      }
      self->_unsigned int measurementResultLeft = self->_measurementResultLeft & 0xFFFFFEFF | v14;
    }
    v15 = [v8 identifier];
    int v16 = [v15 isEqualToString:@"front-vent-left"];

    if (v16)
    {
      if ([firstTimeUseRightTimestamp isChecked]) {
        int v17 = 2048;
      }
      else {
        int v17 = 0;
      }
      self->_unsigned int measurementResultLeft = self->_measurementResultLeft & 0xFFFFF7FF | v17;
    }
    v18 = [v8 identifier];
    int v19 = [v18 isEqualToString:@"inner-mic-left"];

    if (v19)
    {
      if ([firstTimeUseRightTimestamp isChecked]) {
        int v20 = 0x4000;
      }
      else {
        int v20 = 0;
      }
      self->_unsigned int measurementResultLeft = self->_measurementResultLeft & 0xFFFFBFFF | v20;
    }
    v21 = [v8 identifier];
    int v22 = [v21 isEqualToString:@"rear-vent-left"];

    if (v22)
    {
      if ([firstTimeUseRightTimestamp isChecked]) {
        int v23 = 1024;
      }
      else {
        int v23 = 0;
      }
      self->_unsigned int measurementResultLeft = self->_measurementResultLeft & 0xFFFFFBFF | v23;
    }
    v24 = [v8 identifier];
    int v25 = [v24 isEqualToString:@"speaker-left"];

    if (v25)
    {
      if ([firstTimeUseRightTimestamp isChecked]) {
        int v26 = 512;
      }
      else {
        int v26 = 0;
      }
      self->_unsigned int measurementResultLeft = self->_measurementResultLeft & 0xFFFFFDFF | v26;
    }
    v27 = [v8 identifier];
    int v28 = [v27 isEqualToString:@"top-mic-left"];

    if (v28)
    {
      if ([firstTimeUseRightTimestamp isChecked]) {
        int v29 = 0x2000;
      }
      else {
        int v29 = 0;
      }
      self->_unsigned int measurementResultLeft = self->_measurementResultLeft & 0xFFFFDFFF | v29;
    }
    id v30 = [v8 identifier];
    int v31 = [v30 isEqualToString:@"thd-left"];

    if (v31)
    {
      if ([firstTimeUseRightTimestamp isChecked]) {
        int v32 = 128;
      }
      else {
        int v32 = 0;
      }
      self->_unsigned int measurementResultLeft = self->_measurementResultLeft & 0xFFFFFF7F | v32;
    }
    v33 = [v8 identifier];
    int v34 = [v33 isEqualToString:@"no-utp-left"];

    if (v34)
    {
      int v35 = [firstTimeUseRightTimestamp isChecked];
      unsigned int measurementResultLeft = self->_measurementResultLeft;
      int v37 = measurementResultLeft | 3;
      unsigned int v38 = measurementResultLeft & 0xFFFFFFF8;
      if (v35) {
        unsigned int v38 = v37;
      }
      self->_unsigned int measurementResultLeft = v38;
    }
    v39 = [v8 identifier];
    int v40 = [v39 isEqualToString:@"no-msr-left"];

    if (v40)
    {
      int v41 = [firstTimeUseRightTimestamp isChecked];
      unsigned int v42 = self->_measurementResultLeft;
      int v43 = v42 | 4;
      unsigned int v44 = v42 & 0xFFFFFFF8;
      if (v41) {
        unsigned int v44 = v43;
      }
      self->_unsigned int measurementResultLeft = v44;
    }
    v45 = [v8 identifier];
    int v46 = [v45 isEqualToString:@"bottom-mic-right"];

    if (v46)
    {
      if ([firstTimeUseRightTimestamp isChecked]) {
        int v47 = 4096;
      }
      else {
        int v47 = 0;
      }
      self->_unsigned int measurementResultRight = self->_measurementResultRight & 0xFFFFEFFF | v47;
    }
    v48 = [v8 identifier];
    int v49 = [v48 isEqualToString:@"freq-right"];

    if (v49)
    {
      if ([firstTimeUseRightTimestamp isChecked]) {
        int v50 = 256;
      }
      else {
        int v50 = 0;
      }
      self->_unsigned int measurementResultRight = self->_measurementResultRight & 0xFFFFFEFF | v50;
    }
    v51 = [v8 identifier];
    int v52 = [v51 isEqualToString:@"front-vent-right"];

    if (v52)
    {
      if ([firstTimeUseRightTimestamp isChecked]) {
        int v53 = 2048;
      }
      else {
        int v53 = 0;
      }
      self->_unsigned int measurementResultRight = self->_measurementResultRight & 0xFFFFF7FF | v53;
    }
    v54 = [v8 identifier];
    int v55 = [v54 isEqualToString:@"inner-mic-right"];

    if (v55)
    {
      if ([firstTimeUseRightTimestamp isChecked]) {
        int v56 = 0x4000;
      }
      else {
        int v56 = 0;
      }
      self->_unsigned int measurementResultRight = self->_measurementResultRight & 0xFFFFBFFF | v56;
    }
    v57 = [v8 identifier];
    int v58 = [v57 isEqualToString:@"rear-vent-right"];

    if (v58)
    {
      if ([firstTimeUseRightTimestamp isChecked]) {
        int v59 = 1024;
      }
      else {
        int v59 = 0;
      }
      self->_unsigned int measurementResultRight = self->_measurementResultRight & 0xFFFFFBFF | v59;
    }
    v60 = [v8 identifier];
    int v61 = [v60 isEqualToString:@"speaker-right"];

    if (v61)
    {
      if ([firstTimeUseRightTimestamp isChecked]) {
        int v62 = 512;
      }
      else {
        int v62 = 0;
      }
      self->_unsigned int measurementResultRight = self->_measurementResultRight & 0xFFFFFDFF | v62;
    }
    v63 = [v8 identifier];
    int v64 = [v63 isEqualToString:@"top-mic-right"];

    if (v64)
    {
      if ([firstTimeUseRightTimestamp isChecked]) {
        int v65 = 0x2000;
      }
      else {
        int v65 = 0;
      }
      self->_unsigned int measurementResultRight = self->_measurementResultRight & 0xFFFFDFFF | v65;
    }
    v66 = [v8 identifier];
    int v67 = [v66 isEqualToString:@"thd-right"];

    if (v67)
    {
      if ([firstTimeUseRightTimestamp isChecked]) {
        int v68 = 128;
      }
      else {
        int v68 = 0;
      }
      self->_unsigned int measurementResultRight = self->_measurementResultRight & 0xFFFFFF7F | v68;
    }
    v69 = [v8 identifier];
    int v70 = [v69 isEqualToString:@"no-utp-right"];

    if (v70)
    {
      int v71 = [firstTimeUseRightTimestamp isChecked];
      unsigned int measurementResultRight = self->_measurementResultRight;
      int v73 = measurementResultRight | 3;
      unsigned int v74 = measurementResultRight & 0xFFFFFFF8;
      if (v71) {
        unsigned int v74 = v73;
      }
      self->_unsigned int measurementResultRight = v74;
    }
    v75 = [v8 identifier];
    int v76 = [v75 isEqualToString:@"no-msr-right"];

    if (v76)
    {
      int v77 = [firstTimeUseRightTimestamp isChecked];
      unsigned int v78 = self->_measurementResultRight;
      int v79 = v78 | 4;
      unsigned int v80 = v78 & 0xFFFFFFF8;
      if (v77) {
        unsigned int v80 = v79;
      }
      self->_unsigned int measurementResultRight = v80;
    }
  }
}

- (void)postOcclusionData
{
  char v23 = 5;
  if (!self->_leftMeasurementTimestamp)
  {
    id v3 = [MEMORY[0x263EFF910] now];
    leftMeasurementTimestamp = self->_leftMeasurementTimestamp;
    self->_leftMeasurementTimestamp = v3;
  }
  if (!self->_rightMeasurementTimestamp)
  {
    v5 = [MEMORY[0x263EFF910] now];
    rightMeasurementTimestamp = self->_rightMeasurementTimestamp;
    self->_rightMeasurementTimestamp = v5;
  }
  if (!self->_firstTimeUseLeftTimestamp)
  {
    uint64_t v7 = [MEMORY[0x263EFF910] now];
    firstTimeUseLeftTimestamp = self->_firstTimeUseLeftTimestamp;
    self->_firstTimeUseLeftTimestamp = v7;
  }
  if (!self->_firstTimeUseRightTimestamp)
  {
    uint64_t v9 = [MEMORY[0x263EFF910] now];
    firstTimeUseRightTimestamp = self->_firstTimeUseRightTimestamp;
    self->_firstTimeUseRightTimestamp = v9;
  }
  uint64_t v27 = 0;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  [(NSDate *)self->_leftMeasurementTimestamp timeIntervalSince1970];
  *(void *)&long long v24 = (unint64_t)v11;
  [(NSDate *)self->_rightMeasurementTimestamp timeIntervalSince1970];
  *((void *)&v24 + 1) = (unint64_t)v12;
  [(NSDate *)self->_firstTimeUseLeftTimestamp timeIntervalSince1970];
  LODWORD(v26) = v13;
  [(NSDate *)self->_firstTimeUseRightTimestamp timeIntervalSince1970];
  DWORD1(v26) = v14;
  unsigned int measurementResultRight = self->_measurementResultRight;
  LODWORD(v25) = self->_measurementResultLeft;
  DWORD1(v25) = measurementResultRight;
  id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v16 setObject:@"occlusion-test" forKeyedSubscript:@"msg-identifier"];
  [v16 setObject:self->_address forKeyedSubscript:@"bt-address"];
  int v17 = [MEMORY[0x263EFF8F8] dataWithBytes:&v23 length:57];
  [v16 setObject:v17 forKeyedSubscript:@"msg-data"];

  v18 = [MEMORY[0x263F087C8] defaultCenter];
  [v18 postNotificationName:@"com.apple.HearingModeService" object:0 userInfo:v16 options:2];

  int v19 = (void *)MEMORY[0x263F82418];
  int v20 = [NSString stringWithFormat:@"Sent to HearingModeService!"];
  v21 = [v19 alertControllerWithTitle:@"Occlusion Data" message:v20 preferredStyle:0];

  int v22 = [MEMORY[0x263F82400] actionWithTitle:@"Done" style:1 handler:0];
  [v21 addAction:v22];
  [(HMTestOcclusionViewController *)self presentViewController:v21 animated:1 completion:0];
}

- (void)datePickerChanged:(id)a3
{
  id v15 = a3;
  v4 = [v15 accessibilityIdentifier];
  int v5 = [v4 isEqualToString:@"left"];

  if (v5)
  {
    v6 = [v15 date];
    uint64_t v7 = 1432;
  }
  else
  {
    v8 = [v15 accessibilityIdentifier];
    int v9 = [v8 isEqualToString:@"right"];

    if (v9)
    {
      v6 = [v15 date];
      uint64_t v7 = 1440;
    }
    else
    {
      int v10 = [v15 accessibilityIdentifier];
      int v11 = [v10 isEqualToString:@"first-left"];

      if (v11)
      {
        v6 = [v15 date];
        uint64_t v7 = 1448;
      }
      else
      {
        double v12 = [v15 accessibilityIdentifier];
        int v13 = [v12 isEqualToString:@"first-right"];

        if (!v13) {
          goto LABEL_10;
        }
        v6 = [v15 date];
        uint64_t v7 = 1456;
      }
    }
  }
  double v14 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v7);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v7) = v6;

LABEL_10:
}

- (id)datePickerForSpecifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F82650]);
  int v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v5 setDatePickerMode:2];
  [v5 setPreferredDatePickerStyle:2];
  v6 = [v3 identifier];
  char v7 = [v6 isEqualToString:@"timestamp-left"];

  if (v7)
  {
    v8 = @"left";
  }
  else
  {
    int v9 = [v3 identifier];
    char v10 = [v9 isEqualToString:@"timestamp-right"];

    if (v10)
    {
      v8 = @"right";
    }
    else
    {
      int v11 = [v3 identifier];
      char v12 = [v11 isEqualToString:@"first-time-use-left"];

      if (v12)
      {
        v8 = @"first-left";
      }
      else
      {
        int v13 = [v3 identifier];
        int v14 = [v13 isEqualToString:@"first-time-use-right"];

        if (!v14) {
          goto LABEL_10;
        }
        v8 = @"first-right";
      }
    }
  }
  [v5 setAccessibilityIdentifier:v8];
LABEL_10:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstTimeUseRightTimestamp, 0);
  objc_storeStrong((id *)&self->_firstTimeUseLeftTimestamp, 0);
  objc_storeStrong((id *)&self->_rightMeasurementTimestamp, 0);
  objc_storeStrong((id *)&self->_leftMeasurementTimestamp, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end