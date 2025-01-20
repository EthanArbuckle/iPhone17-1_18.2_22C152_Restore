@interface NLCProfileDetailController
- (BOOL)isValid:(id)a3 format:(id)a4;
- (NLCProfileDetailController)init;
- (id)getDNSDelay:(id)a3;
- (id)getInBandwidth:(id)a3;
- (id)getInDelay:(id)a3;
- (id)getInPLR:(id)a3;
- (id)getInterfaceName:(id)a3;
- (id)getOutBandwidth:(id)a3;
- (id)getOutDelay:(id)a3;
- (id)getOutPLR:(id)a3;
- (id)getProfileName:(id)a3;
- (id)getProtocolFamily:(id)a3;
- (id)specifiers;
- (void)cancelButtonClicked:(id)a3;
- (void)deleteConfirm:(id)a3;
- (void)deleteNLCProfile:(id)a3;
- (void)dupProfile:(id)a3;
- (void)loadValuesFromCurrentProfile;
- (void)loadView;
- (void)saveButtonClicked:(id)a3;
- (void)saveValuesToCurrentProfile;
- (void)setDNSDelay:(id)a3 specifier:(id)a4;
- (void)setInBandwidth:(id)a3 specifier:(id)a4;
- (void)setInDelay:(id)a3 specifier:(id)a4;
- (void)setInPLR:(id)a3 specifier:(id)a4;
- (void)setInterfaceName:(id)a3 specifier:(id)a4;
- (void)setOutBandwidth:(id)a3 specifier:(id)a4;
- (void)setOutDelay:(id)a3 specifier:(id)a4;
- (void)setOutPLR:(id)a3 specifier:(id)a4;
- (void)setProfileName:(id)a3 specifier:(id)a4;
- (void)setProtocolFamily:(id)a3 specifier:(id)a4;
- (void)updateDoneButton;
@end

@implementation NLCProfileDetailController

- (NLCProfileDetailController)init
{
  if (dword_412E8) {
    NSLog(@"%s %p", a2, "-[NLCProfileDetailController init]", self);
  }
  v33.receiver = self;
  v33.super_class = (Class)NLCProfileDetailController;
  v3 = [(NLCProfileDetailController *)&v33 init];
  v4 = v3;
  if (v3)
  {
    v3->_dirty = 0;
    v3->_isNew = 0;
    v3->_isPreset = 0;
    inBandwidth = v3->_inBandwidth;
    v3->_inBandwidth = (NSString *)@"0";

    inPLR = v4->_inPLR;
    v4->_inPLR = (NSString *)@"0";

    inDelay = v4->_inDelay;
    v4->_inDelay = (NSString *)@"0";

    outBandwidth = v4->_outBandwidth;
    v4->_outBandwidth = (NSString *)@"0";

    outPLR = v4->_outPLR;
    v4->_outPLR = (NSString *)@"0";

    outDelay = v4->_outDelay;
    v4->_outDelay = (NSString *)@"0";

    dnsDelay = v4->_dnsDelay;
    v4->_dnsDelay = (NSString *)@"0";

    uint64_t v12 = +[NSString stringWithFormat:@"%d", 0];
    protocolFamily = v4->_protocolFamily;
    v4->_protocolFamily = (NSString *)v12;

    interfaceName = v4->_interfaceName;
    v4->_interfaceName = (NSString *)&stru_35910;

    v15 = +[NLCSettings sharedInstance];
    uint64_t v16 = [v15 currentProfile];
    profileName = v4->_profileName;
    v4->_profileName = (NSString *)v16;

    v18 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
    bwFmtr = v4->_bwFmtr;
    v4->_bwFmtr = v18;

    [(NSNumberFormatter *)v4->_bwFmtr setNumberStyle:1];
    v20 = v4->_bwFmtr;
    v21 = +[NSNumber numberWithInt:0];
    [(NSNumberFormatter *)v20 setMinimum:v21];

    [(NSNumberFormatter *)v4->_bwFmtr setGroupingSize:0];
    v22 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
    plrFmtr = v4->_plrFmtr;
    v4->_plrFmtr = v22;

    [(NSNumberFormatter *)v4->_plrFmtr setNumberStyle:1];
    v24 = v4->_plrFmtr;
    v25 = +[NSNumber numberWithInt:0];
    [(NSNumberFormatter *)v24 setMinimum:v25];

    v26 = v4->_plrFmtr;
    v27 = +[NSNumber numberWithInt:100];
    [(NSNumberFormatter *)v26 setMaximum:v27];

    [(NSNumberFormatter *)v4->_plrFmtr setGroupingSize:0];
    [(NSNumberFormatter *)v4->_plrFmtr setAlwaysShowsDecimalSeparator:1];
    v28 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
    delayFmtr = v4->_delayFmtr;
    v4->_delayFmtr = v28;

    [(NSNumberFormatter *)v4->_delayFmtr setNumberStyle:1];
    v30 = v4->_delayFmtr;
    v31 = +[NSNumber numberWithInt:0];
    [(NSNumberFormatter *)v30 setMinimum:v31];

    [(NSNumberFormatter *)v4->_delayFmtr setGroupingSize:0];
    [(NLCProfileDetailController *)v4 loadValuesFromCurrentProfile];
    if ([(NSString *)v4->_profileName isEqualToString:&stru_35910]) {
      v4->_isNew = 1;
    }
  }
  return v4;
}

- (id)specifiers
{
  if (dword_412E8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController]);
    NSLog(@"%s %p parent %p", "-[NLCProfileDetailController specifiers]", self, WeakRetained);
  }
  id v116 = objc_alloc_init((Class)NSMutableArray);
  if (!self->_isPreset)
  {
    v4 = +[PSSpecifier preferenceSpecifierNamed:&stru_35910 target:self set:0 get:0 detail:0 cell:0 edit:0];
    [v116 addObject:v4];
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = LocalizableGTStringKeyForKey();
    v7 = [v5 localizedStringForKey:v6 value:&stru_35910 table:@"NLCSettings"];
    v8 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v7 target:self set:"setProfileName:specifier:" get:"getProfileName:" detail:0 cell:8 edit:0];

    if (self->_isNew)
    {
      v9 = +[NSBundle bundleForClass:objc_opt_class()];
      v10 = LocalizableGTStringKeyForKey();
      v11 = [v9 localizedStringForKey:v10 value:&stru_35910 table:@"NLCSettings"];
      [v8 setPlaceholder:v11];
    }
    *(void *)&v8[OBJC_IVAR___PSSpecifier_keyboardType] = 0;
    *(void *)&v8[OBJC_IVAR___PSSpecifier_autoCapsType] = 0;
    *(void *)&v8[OBJC_IVAR___PSSpecifier_autoCorrectionType] = 1;
    [v8 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v116 addObject:v8];
    if (dword_412E8)
    {
      uint64_t v12 = [v8 placeholder];
      NSLog(@"nameCell placeHolder: %@", v12);
    }
  }
  v13 = +[PSSpecifier preferenceSpecifierNamed:&stru_35910 target:self set:0 get:0 detail:0 cell:0 edit:0];
  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = LocalizableGTStringKeyForKey();
  uint64_t v16 = [v14 localizedStringForKey:v15 value:&stru_35910 table:@"NLCSettings"];
  [v13 setProperty:v16 forKey:PSFooterTextGroupKey];

  v113 = v13;
  [v116 addObject:v13];
  v112 = +[PSSpecifier preferenceSpecifierNamed:&stru_35910 target:self set:0 get:0 detail:0 cell:0 edit:0];
  objc_msgSend(v116, "addObject:");
  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = LocalizableGTStringKeyForKey();
  v19 = [v17 localizedStringForKey:v18 value:&stru_35910 table:@"NLCSettings"];
  if (self->_isPreset) {
    v20 = 0;
  }
  else {
    v20 = "setInBandwidth:specifier:";
  }
  if (self->_isPreset) {
    uint64_t v21 = 4;
  }
  else {
    uint64_t v21 = 8;
  }
  v22 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:v20 get:"getInBandwidth:" detail:0 cell:v21 edit:0];

  *(void *)&v22[OBJC_IVAR___PSSpecifier_textFieldType] = 2;
  if (!self->_isPreset) {
    [v22 setProperty:objc_opt_class() forKey:PSCellClassKey];
  }
  v111 = v22;
  [v116 addObject:v22];
  v23 = +[NSBundle bundleForClass:objc_opt_class()];
  v24 = LocalizableGTStringKeyForKey();
  v25 = [v23 localizedStringForKey:v24 value:&stru_35910 table:@"NLCSettings"];
  if (self->_isPreset) {
    v26 = 0;
  }
  else {
    v26 = "setInPLR:specifier:";
  }
  if (self->_isPreset) {
    uint64_t v27 = 4;
  }
  else {
    uint64_t v27 = 8;
  }
  v28 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:v26 get:"getInPLR:" detail:0 cell:v27 edit:0];

  *(void *)&v28[OBJC_IVAR___PSSpecifier_textFieldType] = 6;
  if (!self->_isPreset) {
    [v28 setProperty:objc_opt_class() forKey:PSCellClassKey];
  }
  v110 = v28;
  [v116 addObject:v28];
  v29 = +[NSBundle bundleForClass:objc_opt_class()];
  v30 = LocalizableGTStringKeyForKey();
  v31 = [v29 localizedStringForKey:v30 value:&stru_35910 table:@"NLCSettings"];
  if (self->_isPreset) {
    v32 = 0;
  }
  else {
    v32 = "setInDelay:specifier:";
  }
  if (self->_isPreset) {
    uint64_t v33 = 4;
  }
  else {
    uint64_t v33 = 8;
  }
  v34 = +[PSSpecifier preferenceSpecifierNamed:v31 target:self set:v32 get:"getInDelay:" detail:0 cell:v33 edit:0];

  *(void *)&v34[OBJC_IVAR___PSSpecifier_textFieldType] = 2;
  if (!self->_isPreset) {
    [v34 setProperty:objc_opt_class() forKey:PSCellClassKey];
  }
  v109 = v34;
  [v116 addObject:v34];
  v35 = +[NSBundle bundleForClass:objc_opt_class()];
  v36 = LocalizableGTStringKeyForKey();
  v37 = [v35 localizedStringForKey:v36 value:&stru_35910 table:@"NLCSettings"];
  if (self->_isPreset) {
    v38 = 0;
  }
  else {
    v38 = "setOutBandwidth:specifier:";
  }
  if (self->_isPreset) {
    uint64_t v39 = 4;
  }
  else {
    uint64_t v39 = 8;
  }
  v40 = +[PSSpecifier preferenceSpecifierNamed:v37 target:self set:v38 get:"getOutBandwidth:" detail:0 cell:v39 edit:0];

  *(void *)&v40[OBJC_IVAR___PSSpecifier_textFieldType] = 2;
  if (!self->_isPreset) {
    [v40 setProperty:objc_opt_class() forKey:PSCellClassKey];
  }
  v108 = v40;
  [v116 addObject:v40];
  v41 = +[NSBundle bundleForClass:objc_opt_class()];
  v42 = LocalizableGTStringKeyForKey();
  v43 = [v41 localizedStringForKey:v42 value:&stru_35910 table:@"NLCSettings"];
  if (self->_isPreset) {
    v44 = 0;
  }
  else {
    v44 = "setOutPLR:specifier:";
  }
  if (self->_isPreset) {
    uint64_t v45 = 4;
  }
  else {
    uint64_t v45 = 8;
  }
  v46 = +[PSSpecifier preferenceSpecifierNamed:v43 target:self set:v44 get:"getOutPLR:" detail:0 cell:v45 edit:0];

  *(void *)&v46[OBJC_IVAR___PSSpecifier_textFieldType] = 6;
  if (!self->_isPreset) {
    [v46 setProperty:objc_opt_class() forKey:PSCellClassKey];
  }
  v107 = v46;
  [v116 addObject:v46];
  v47 = +[NSBundle bundleForClass:objc_opt_class()];
  v48 = LocalizableGTStringKeyForKey();
  v49 = [v47 localizedStringForKey:v48 value:&stru_35910 table:@"NLCSettings"];
  if (self->_isPreset) {
    v50 = 0;
  }
  else {
    v50 = "setOutDelay:specifier:";
  }
  if (self->_isPreset) {
    uint64_t v51 = 4;
  }
  else {
    uint64_t v51 = 8;
  }
  v52 = +[PSSpecifier preferenceSpecifierNamed:v49 target:self set:v50 get:"getOutDelay:" detail:0 cell:v51 edit:0];

  *(void *)&v52[OBJC_IVAR___PSSpecifier_textFieldType] = 2;
  if (!self->_isPreset) {
    [v52 setProperty:objc_opt_class() forKey:PSCellClassKey];
  }
  v106 = v52;
  [v116 addObject:v52];
  v53 = +[NSBundle bundleForClass:objc_opt_class()];
  v54 = LocalizableGTStringKeyForKey();
  v55 = [v53 localizedStringForKey:v54 value:&stru_35910 table:@"NLCSettings"];
  if (self->_isPreset) {
    v56 = 0;
  }
  else {
    v56 = "setDNSDelay:specifier:";
  }
  if (self->_isPreset) {
    uint64_t v57 = 4;
  }
  else {
    uint64_t v57 = 8;
  }
  v58 = +[PSSpecifier preferenceSpecifierNamed:v55 target:self set:v56 get:"getDNSDelay:" detail:0 cell:v57 edit:0];

  *(void *)&v58[OBJC_IVAR___PSSpecifier_textFieldType] = 2;
  if (!self->_isPreset) {
    [v58 setProperty:objc_opt_class() forKey:PSCellClassKey];
  }
  [v116 addObject:v58];
  BOOL isPreset = self->_isPreset;
  v60 = +[NSBundle bundleForClass:objc_opt_class()];
  v61 = LocalizableGTStringKeyForKey();
  v62 = [v60 localizedStringForKey:v61 value:&stru_35910 table:@"NLCSettings"];
  if (isPreset)
  {
    uint64_t v63 = +[PSSpecifier preferenceSpecifierNamed:v62 target:self set:0 get:"getProtocolFamily:" detail:0 cell:4 edit:0];
  }
  else
  {
    v114 = +[PSSpecifier preferenceSpecifierNamed:v62 target:self set:"setProtocolFamily:specifier:" get:"getProtocolFamily:" detail:objc_opt_class() cell:2 edit:0];

    v60 = +[NSMutableArray arrayWithCapacity:3];
    v64 = +[NSBundle bundleForClass:objc_opt_class()];
    v65 = LocalizableGTStringKeyForKey();
    v66 = [v64 localizedStringForKey:v65 value:&stru_35910 table:@"NLCSettings"];
    [v60 insertObject:v66 atIndex:0];

    v67 = +[NSBundle bundleForClass:objc_opt_class()];
    v68 = LocalizableGTStringKeyForKey();
    v69 = [v67 localizedStringForKey:v68 value:&stru_35910 table:@"NLCSettings"];
    [v60 insertObject:v69 atIndex:1];

    v70 = +[NSBundle bundleForClass:objc_opt_class()];
    v71 = LocalizableGTStringKeyForKey();
    v72 = [v70 localizedStringForKey:v71 value:&stru_35910 table:@"NLCSettings"];
    [v60 insertObject:v72 atIndex:2];

    v61 = +[NSMutableArray arrayWithCapacity:3];
    v73 = +[NSString stringWithFormat:@"%d", 0];
    [v61 insertObject:v73 atIndex:0];

    v74 = +[NSString stringWithFormat:@"%d", 2];
    [v61 insertObject:v74 atIndex:1];

    v75 = +[NSString stringWithFormat:@"%d", 30];
    [v61 insertObject:v75 atIndex:2];

    uint64_t v63 = (uint64_t)v114;
    [v114 setValues:v61 titles:v60 shortTitles:0];
  }

  v115 = (void *)v63;
  [v116 addObject:v63];
  BOOL v76 = self->_isPreset;
  v77 = +[NSBundle bundleForClass:objc_opt_class()];
  v78 = LocalizableGTStringKeyForKey();
  v79 = [v77 localizedStringForKey:v78 value:&stru_35910 table:@"NLCSettings"];
  if (v76)
  {
    v80 = +[PSSpecifier preferenceSpecifierNamed:v79 target:self set:0 get:"getInterfaceName:" detail:0 cell:4 edit:0];
  }
  else
  {
    v105 = +[PSSpecifier preferenceSpecifierNamed:v79 target:self set:"setInterfaceName:specifier:" get:"getInterfaceName:" detail:objc_opt_class() cell:2 edit:0];

    v77 = +[NSMutableArray arrayWithCapacity:3];
    v81 = +[NSBundle bundleForClass:objc_opt_class()];
    v82 = LocalizableGTStringKeyForKey();
    v83 = [v81 localizedStringForKey:v82 value:&stru_35910 table:@"NLCSettings"];
    [v77 insertObject:v83 atIndex:0];

    v84 = +[NSBundle bundleForClass:objc_opt_class()];
    v85 = LocalizableGTStringKeyForKey();
    v86 = [v84 localizedStringForKey:v85 value:&stru_35910 table:@"NLCSettings"];
    [v77 insertObject:v86 atIndex:1];

    v80 = v105;
    v87 = +[NSBundle bundleForClass:objc_opt_class()];
    v88 = LocalizableGTStringKeyForKey();
    v89 = [v87 localizedStringForKey:v88 value:&stru_35910 table:@"NLCSettings"];
    [v77 insertObject:v89 atIndex:2];

    v78 = +[NSMutableArray arrayWithCapacity:3];
    [v78 insertObject:&stru_35910 atIndex:0];
    [v78 insertObject:@"en0" atIndex:1];
    [v78 insertObject:@"pdp_ip0" atIndex:2];
    [v105 setValues:v78 titles:v77 shortTitles:0];
  }

  [v116 addObject:v80];
  if (!self->_isNew)
  {
    v90 = +[PSSpecifier emptyGroupSpecifier];
    [v116 addObject:v90];

    v91 = +[NSBundle bundleForClass:objc_opt_class()];
    v92 = LocalizableGTStringKeyForKey();
    v93 = [v91 localizedStringForKey:v92 value:&stru_35910 table:@"NLCSettings"];
    v94 = +[PSSpecifier preferenceSpecifierNamed:v93 target:self set:0 get:0 detail:0 cell:13 edit:0];

    *(void *)&v94[OBJC_IVAR___PSSpecifier_action] = "dupProfile:";
    [v116 addObject:v94];
  }
  if (!self->_isPreset && !self->_isNew)
  {
    v95 = +[PSSpecifier preferenceSpecifierNamed:&stru_35910 target:self set:0 get:0 detail:0 cell:0 edit:0];
    [v116 addObject:v95];
    v96 = +[NSBundle bundleForClass:objc_opt_class()];
    v97 = LocalizableGTStringKeyForKey();
    v98 = [v96 localizedStringForKey:v97 value:&stru_35910 table:@"NLCSettings"];
    v99 = +[PSSpecifier deleteButtonSpecifierWithName:v98 target:self action:"deleteConfirm:"];

    [v116 addObject:v99];
  }
  uint64_t v100 = OBJC_IVAR___PSListController__specifiers;
  v101 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v116;
  id v102 = v116;

  id v103 = *(id *)&self->PSListController_opaque[v100];
  return v103;
}

- (void)deleteConfirm:(id)a3
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = LocalizableGTStringKeyForKey();
  v5 = [v3 localizedStringForKey:v4 value:&stru_35910 table:@"NLCSettings"];
  v6 = +[UIAlertController alertControllerWithTitle:v5 message:0 preferredStyle:1];

  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = LocalizableGTStringKeyForKey();
  v9 = [v7 localizedStringForKey:v8 value:&stru_35910 table:@"NLCSettings"];
  v10 = +[UIAlertAction actionWithTitle:v9 style:1 handler:0];

  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v12 = LocalizableGTStringKeyForKey();
  v13 = [v11 localizedStringForKey:v12 value:&stru_35910 table:@"NLCSettings"];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_145FC;
  v16[3] = &unk_35010;
  v16[4] = self;
  v14 = +[UIAlertAction actionWithTitle:v13 style:2 handler:v16];

  [v6 addAction:v10];
  [v6 addAction:v14];
  [(NLCProfileDetailController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)dupProfile:(id)a3
{
  id v23 = a3;
  if (dword_412E8) {
    NSLog(@"%s name: %@", "-[NLCProfileDetailController dupProfile:]", self->_profileName);
  }
  p_profileName = &self->_profileName;
  v5 = [(NSString *)self->_profileName componentsSeparatedByString:@" "];
  v6 = [v5 lastObject];

  id v7 = [v6 integerValue];
  unint64_t v8 = (unint64_t)v7;
  if (v7)
  {
    uint64_t v9 = (uint64_t)v7 + 1;
    v10 = [(NSString *)*p_profileName substringToIndex:(char *)[(NSString *)*p_profileName length]- (uint64_t)(log((double)((uint64_t)v7 + 1)) / 2.30258509 + 2.0)];
  }
  else
  {
    v10 = *p_profileName;
    uint64_t v9 = 2;
  }
  v11 = [(NSString *)v10 stringByAppendingFormat:@" %ld", v9];
  uint64_t v12 = [(id)qword_412F0 profileDictionaryWithName:v11];

  if (v12)
  {
    if (v8 <= 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v8;
    }
    uint64_t v14 = v13 + 2;
    do
    {
      v15 = [(NSString *)v10 stringByAppendingFormat:@" %ld", v14];

      uint64_t v16 = [(id)qword_412F0 profileDictionaryWithName:v15];

      ++v14;
      v11 = v15;
    }
    while (v16);
  }
  else
  {
    v15 = v11;
  }
  if (dword_412E8) {
    NSLog(@"%s new name: %@", "-[NLCProfileDetailController dupProfile:]", v15);
  }
  objc_storeStrong((id *)p_profileName, v15);
  self->_BOOL isPreset = 0;
  v17 = [(id)qword_412F0 addNewProfile:*p_profileName];

  if (v17)
  {
    [(id)qword_412F0 setSelectedProfileName:*p_profileName];
    [(NLCProfileDetailController *)self saveValuesToCurrentProfile];
    v18 = +[NLCSettings sharedInstance];
    [v18 setCurrentProfile:*p_profileName];
  }
  v19 = objc_alloc_init(NLCProfileDetailController);
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__rootController]);
  [(NLCProfileDetailController *)v19 setRootController:WeakRetained];

  id v21 = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController]);
  [(NLCProfileDetailController *)v19 setParentController:v21];

  v22 = +[PSSpecifier preferenceSpecifierNamed:*p_profileName target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
  [(NLCProfileDetailController *)v19 setSpecifier:v22];
  [(NLCProfileDetailController *)self showController:v19];
}

- (void)deleteNLCProfile:(id)a3
{
  id v6 = a3;
  if (dword_412E8) {
    NSLog(@"%s name: %@", "-[NLCProfileDetailController deleteNLCProfile:]", self->_profileName);
  }
  if (![(NSString *)self->_profileName isEqualToString:&stru_35910])
  {
    [(id)qword_412F0 removeProfileWithName:self->_profileName];
    [(id)qword_412F0 applyChanges];
    v4 = +[NLCSettings sharedInstance];
    [v4 performSelector:"updateNLCProfilesList" withObject:0];

    id WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController]);
    [WeakRetained dismiss];
  }
}

- (void)saveButtonClicked:(id)a3
{
  id v34 = a3;
  if (dword_412E8) {
    NSLog(@"%s", "-[NLCProfileDetailController saveButtonClicked:]");
  }
  if ([(NSString *)self->_profileName isEqualToString:&stru_35910])
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = LocalizableGTStringKeyForKey();
    id v6 = [v4 localizedStringForKey:v5 value:&stru_35910 table:@"NLCSettings"];
    id v7 = +[UIAlertController alertControllerWithTitle:v6 message:0 preferredStyle:1];

    unint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v9 = LocalizableGTStringKeyForKey();
    v10 = [v8 localizedStringForKey:v9 value:&stru_35910 table:@"NLCSettings"];
    v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];

    [v7 addAction:v11];
    [(NLCProfileDetailController *)self presentViewController:v7 animated:1 completion:0];

LABEL_13:
    goto LABEL_18;
  }
  if (self->_isNew)
  {
    uint64_t v12 = [(id)qword_412F0 addNewProfile:self->_profileName];

    if (v12)
    {
      [(id)qword_412F0 setSelectedProfileName:self->_profileName];
LABEL_16:
      [(NLCProfileDetailController *)self saveValuesToCurrentProfile];
      goto LABEL_17;
    }
LABEL_12:
    id v17 = objc_alloc((Class)NSString);
    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    v19 = LocalizableGTStringKeyForKey();
    v20 = [v18 localizedStringForKey:v19 value:&stru_35910 table:@"NLCSettings"];
    id v7 = objc_msgSend(v17, "initWithFormat:", v20, self->_profileName);

    id v21 = +[NSBundle bundleForClass:objc_opt_class()];
    v22 = LocalizableGTStringKeyForKey();
    id v23 = [v21 localizedStringForKey:v22 value:&stru_35910 table:@"NLCSettings"];
    v24 = +[UIAlertController alertControllerWithTitle:v7 message:v23 preferredStyle:1];

    v25 = +[NSBundle bundleForClass:objc_opt_class()];
    v26 = LocalizableGTStringKeyForKey();
    uint64_t v27 = [v25 localizedStringForKey:v26 value:&stru_35910 table:@"NLCSettings"];
    v28 = +[UIAlertAction actionWithTitle:v27 style:1 handler:0];

    [v24 addAction:v28];
    [(NLCProfileDetailController *)self presentViewController:v24 animated:1 completion:0];

    goto LABEL_13;
  }
  profileName = self->_profileName;
  uint64_t v14 = +[NLCSettings sharedInstance];
  v15 = [v14 currentProfile];
  LOBYTE(profileName) = [(NSString *)profileName isEqualToString:v15];

  if (profileName)
  {
    if (!self->_dirty) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  uint64_t v16 = [(id)qword_412F0 profileDictionaryWithName:self->_profileName];

  if (v16) {
    goto LABEL_12;
  }
  v29 = [(id)qword_412F0 addNewProfile:self->_profileName];

  if (v29)
  {
    v30 = (void *)qword_412F0;
    v31 = +[NLCSettings sharedInstance];
    v32 = [v31 currentProfile];
    [v30 removeProfileWithName:v32];

    [(id)qword_412F0 setSelectedProfileName:self->_profileName];
    uint64_t v33 = +[NLCSettings sharedInstance];
    [v33 setCurrentProfile:self->_profileName];

    goto LABEL_16;
  }
LABEL_17:
  [(NLCProfileDetailController *)self dismissViewControllerAnimated:1 completion:0];
LABEL_18:
}

- (void)cancelButtonClicked:(id)a3
{
  if (dword_412E8) {
    NSLog(@"%s", a2, a3, "-[NLCProfileDetailController cancelButtonClicked:]");
  }

  [(NLCProfileDetailController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)updateDoneButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__rootController]);
  id v7 = [WeakRetained navigationBar];

  BOOL dirty = self->_dirty;
  v5 = [v7 topItem];
  id v6 = [v5 rightBarButtonItem];
  [v6 setEnabled:dirty];
}

- (void)loadView
{
  if (dword_412E8) {
    NSLog(@"%s", a2, "-[NLCProfileDetailController loadView]");
  }
  v8.receiver = self;
  v8.super_class = (Class)NLCProfileDetailController;
  [(NLCProfileDetailController *)&v8 loadView];
  v3 = [(NLCProfileDetailController *)self navigationItem];
  BOOL isPreset = self->_isPreset;
  id v5 = objc_alloc((Class)UIBarButtonItem);
  if (isPreset)
  {
    id v6 = [v5 initWithBarButtonSystemItem:0 target:self action:"cancelButtonClicked:"];
    [v3 setLeftBarButtonItem:v6];
  }
  else
  {
    id v7 = [v5 initWithBarButtonSystemItem:1 target:self action:"cancelButtonClicked:"];
    [v3 setLeftBarButtonItem:v7];

    id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:3 target:self action:"saveButtonClicked:"];
    [v3 setRightBarButtonItem:v6];
  }
}

- (void)setProfileName:(id)a3 specifier:(id)a4
{
  id v8 = a3;
  id v7 = a4;
  if (dword_412E8) {
    NSLog(@"%s %@", "-[NLCProfileDetailController setProfileName:specifier:]", v8);
  }
  if (([v8 isEqualToString:self->_profileName] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_profileName, a3);
    self->_BOOL dirty = 1;
    [(NLCProfileDetailController *)self updateDoneButton];
  }
}

- (id)getProfileName:(id)a3
{
  if (dword_412E8) {
    NSLog(@"%s", a2, a3, "-[NLCProfileDetailController getProfileName:]");
  }
  profileName = self->_profileName;

  return profileName;
}

- (BOOL)isValid:(id)a3 format:(id)a4
{
  id v6 = a3;
  id v7 = (NSNumberFormatter *)a4;
  id v8 = [(NSNumberFormatter *)v7 numberFromString:v6];
  if (v8 || ([v6 isEqualToString:&stru_35910] & 1) != 0)
  {
    BOOL v9 = 1;
  }
  else
  {
    if (self->_bwFmtr == v7 || self->_plrFmtr == v7 || self->_delayFmtr == v7)
    {
      uint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v13 = LocalizableGTStringKeyForKey();
      uint64_t v11 = [v12 localizedStringForKey:v13 value:&stru_35910 table:@"NLCSettings"];
    }
    else
    {
      uint64_t v11 = 0;
    }
    id v14 = objc_alloc((Class)NSString);
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v16 = LocalizableGTStringKeyForKey();
    id v17 = [v15 localizedStringForKey:v16 value:&stru_35910 table:@"NLCSettings"];
    id v24 = objc_msgSend(v14, "initWithFormat:", v17, v6);

    v18 = (void *)v11;
    v19 = +[UIAlertController alertControllerWithTitle:v24 message:v11 preferredStyle:1];
    v20 = +[NSBundle bundleForClass:objc_opt_class()];
    id v21 = LocalizableGTStringKeyForKey();
    v22 = [v20 localizedStringForKey:v21 value:&stru_35910 table:@"NLCSettings"];
    id v23 = +[UIAlertAction actionWithTitle:v22 style:1 handler:0];

    [v19 addAction:v23];
    [(NLCProfileDetailController *)self presentViewController:v19 animated:1 completion:0];

    BOOL v9 = 0;
  }

  return v9;
}

- (void)setInBandwidth:(id)a3 specifier:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if ([(NLCProfileDetailController *)self isValid:v9 format:self->_bwFmtr])
  {
    if (([v9 isEqualToString:self->_inBandwidth] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_inBandwidth, a3);
      self->_BOOL dirty = 1;
      [(NLCProfileDetailController *)self updateDoneButton];
    }
  }
  else
  {
    id v8 = [v7 propertyForKey:PSTableCellKey];
    [v8 setValue:self->_inBandwidth];
    [v8 setNeedsDisplay];
  }
}

- (id)getInBandwidth:(id)a3
{
  return self->_inBandwidth;
}

- (void)setInPLR:(id)a3 specifier:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if ([(NLCProfileDetailController *)self isValid:v9 format:self->_plrFmtr])
  {
    if (([v9 isEqualToString:self->_inPLR] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_inPLR, a3);
      self->_BOOL dirty = 1;
      [(NLCProfileDetailController *)self updateDoneButton];
    }
  }
  else
  {
    id v8 = [v7 propertyForKey:PSTableCellKey];
    [v8 setValue:self->_inPLR];
    [v8 setNeedsDisplay];
  }
}

- (id)getInPLR:(id)a3
{
  return self->_inPLR;
}

- (void)setInDelay:(id)a3 specifier:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if ([(NLCProfileDetailController *)self isValid:v9 format:self->_delayFmtr])
  {
    if (([v9 isEqualToString:self->_inDelay] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_inDelay, a3);
      self->_BOOL dirty = 1;
      [(NLCProfileDetailController *)self updateDoneButton];
    }
  }
  else
  {
    id v8 = [v7 propertyForKey:PSTableCellKey];
    [v8 setValue:self->_inDelay];
    [v8 setNeedsDisplay];
  }
}

- (id)getInDelay:(id)a3
{
  return self->_inDelay;
}

- (void)setOutBandwidth:(id)a3 specifier:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if ([(NLCProfileDetailController *)self isValid:v9 format:self->_bwFmtr])
  {
    if (([v9 isEqualToString:self->_outBandwidth] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_outBandwidth, a3);
      self->_BOOL dirty = 1;
      [(NLCProfileDetailController *)self updateDoneButton];
    }
  }
  else
  {
    id v8 = [v7 propertyForKey:PSTableCellKey];
    [v8 setValue:self->_outBandwidth];
    [v8 setNeedsDisplay];
  }
}

- (id)getOutBandwidth:(id)a3
{
  return self->_outBandwidth;
}

- (void)setOutPLR:(id)a3 specifier:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if ([(NLCProfileDetailController *)self isValid:v9 format:self->_plrFmtr])
  {
    if (([v9 isEqualToString:self->_outPLR] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_outPLR, a3);
      self->_BOOL dirty = 1;
      [(NLCProfileDetailController *)self updateDoneButton];
    }
  }
  else
  {
    id v8 = [v7 propertyForKey:PSTableCellKey];
    [v8 setValue:self->_outPLR];
    [v8 setNeedsDisplay];
  }
}

- (id)getOutPLR:(id)a3
{
  return self->_outPLR;
}

- (void)setOutDelay:(id)a3 specifier:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if ([(NLCProfileDetailController *)self isValid:v9 format:self->_delayFmtr])
  {
    if (([v9 isEqualToString:self->_outDelay] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_outDelay, a3);
      self->_BOOL dirty = 1;
      [(NLCProfileDetailController *)self updateDoneButton];
    }
  }
  else
  {
    id v8 = [v7 propertyForKey:PSTableCellKey];
    [v8 setValue:self->_outDelay];
    [v8 setNeedsDisplay];
  }
}

- (id)getOutDelay:(id)a3
{
  return self->_outDelay;
}

- (void)setDNSDelay:(id)a3 specifier:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if ([(NLCProfileDetailController *)self isValid:v9 format:self->_delayFmtr])
  {
    if (([v9 isEqualToString:self->_dnsDelay] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dnsDelay, a3);
      self->_BOOL dirty = 1;
      [(NLCProfileDetailController *)self updateDoneButton];
    }
  }
  else
  {
    id v8 = [v7 propertyForKey:PSTableCellKey];
    [v8 setValue:self->_dnsDelay];
    [v8 setNeedsDisplay];
  }
}

- (id)getDNSDelay:(id)a3
{
  return self->_dnsDelay;
}

- (void)setProtocolFamily:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  if (([v6 isEqualToString:self->_protocolFamily] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_protocolFamily, a3);
    self->_BOOL dirty = 1;
    [(NLCProfileDetailController *)self updateDoneButton];
  }
}

- (id)getProtocolFamily:(id)a3
{
  protocolFamily = self->_protocolFamily;
  if (*(void *)((char *)a3 + OBJC_IVAR___PSSpecifier_cellType) == 4)
  {
    [(NSString *)protocolFamily intValue];
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = LocalizableGTStringKeyForKey();
    id v6 = [v4 localizedStringForKey:v5 value:&stru_35910 table:@"NLCSettings"];
  }
  else
  {
    id v6 = protocolFamily;
  }

  return v6;
}

- (void)setInterfaceName:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  if (([v6 isEqualToString:self->_interfaceName] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_interfaceName, a3);
    self->_BOOL dirty = 1;
    [(NLCProfileDetailController *)self updateDoneButton];
  }
}

- (id)getInterfaceName:(id)a3
{
  return self->_interfaceName;
}

- (void)saveValuesToCurrentProfile
{
  if (dword_412E8) {
    NSLog(@"%s currentProfileName: %@", a2, "-[NLCProfileDetailController saveValuesToCurrentProfile]", self->_profileName);
  }
  if (![(NSString *)self->_profileName isEqualToString:&stru_35910])
  {
    id v17 = [(id)qword_412F0 profileDictionaryWithName:self->_profileName];
    if (v17)
    {
      *(float *)&double v3 = (float)[(NSString *)self->_inBandwidth intValue];
      v4 = +[NSNumber numberWithFloat:v3];
      [v17 setValue:v4 forKey:@"DownlinkBandwidth"];

      [(NSString *)self->_inPLR floatValue];
      id v5 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v17 setValue:v5 forKey:@"DownlinkPacketLossRatio"];

      *(float *)&double v6 = (float)[(NSString *)self->_inDelay intValue];
      id v7 = +[NSNumber numberWithFloat:v6];
      [v17 setValue:v7 forKey:@"DownlinkDelay"];

      *(float *)&double v8 = (float)[(NSString *)self->_outBandwidth intValue];
      id v9 = +[NSNumber numberWithFloat:v8];
      [v17 setValue:v9 forKey:@"UplinkBandwidth"];

      [(NSString *)self->_outPLR floatValue];
      v10 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [v17 setValue:v10 forKey:@"UplinkPacketLossRatio"];

      *(float *)&double v11 = (float)[(NSString *)self->_outDelay intValue];
      uint64_t v12 = +[NSNumber numberWithFloat:v11];
      [v17 setValue:v12 forKey:@"UplinkDelay"];

      *(float *)&double v13 = (float)[(NSString *)self->_dnsDelay intValue];
      id v14 = +[NSNumber numberWithFloat:v13];
      [v17 setValue:v14 forKey:@"DNSDelayValue"];

      v15 = +[NSNumber numberWithInt:[(NSString *)self->_protocolFamily intValue]];
      [v17 setValue:v15 forKey:@"ProtocolFamily"];

      [v17 setValue:self->_interfaceName forKey:@"RunOnInterface"];
      [(id)qword_412F0 applyChanges];
      uint64_t v16 = +[NLCSettings sharedInstance];
      [v16 performSelector:"updateNLCProfilesList" withObject:0];
    }
  }
}

- (void)loadValuesFromCurrentProfile
{
  double v3 = [(id)qword_412F0 profileDictionaryWithName:self->_profileName];
  id v67 = v3;
  if (dword_412E8)
  {
    NSLog(@"%s currentProfileName: %@ dict: %p", "-[NLCProfileDetailController loadValuesFromCurrentProfile]", self->_profileName, v3);
    double v3 = v67;
  }
  if (v3)
  {
    v4 = [v3 objectForKey:@"DownlinkBandwidth"];
    float v5 = (float)(int)[v4 intValue];

    double v6 = [v67 objectForKey:@"DownlinkBandwidthUnit"];
    unsigned int v7 = [v6 intValue];

    float v8 = v5 * 1000.0;
    if (!v7) {
      float v8 = v5;
    }
    bwFmtr = self->_bwFmtr;
    v10 = +[NSNumber numberWithInt:(int)v8];
    double v11 = [(NSNumberFormatter *)bwFmtr stringFromNumber:v10];
    inBandwidth = self->_inBandwidth;
    self->_inBandwidth = v11;

    double v13 = [v67 objectForKey:@"DownlinkPacketLossRatio"];
    [v13 floatValue];
    int v15 = v14;

    uint64_t v16 = self->_bwFmtr;
    LODWORD(v17) = v15;
    v18 = +[NSNumber numberWithFloat:v17];
    v19 = [(NSNumberFormatter *)v16 stringFromNumber:v18];
    inPLR = self->_inPLR;
    self->_inPLR = v19;

    id v21 = [v67 objectForKey:@"DownlinkDelay"];
    float v22 = (float)(int)[v21 intValue];

    id v23 = self->_bwFmtr;
    id v24 = +[NSNumber numberWithInt:(int)v22];
    v25 = [(NSNumberFormatter *)v23 stringFromNumber:v24];
    inDelay = self->_inDelay;
    self->_inDelay = v25;

    uint64_t v27 = [v67 objectForKey:@"UplinkBandwidth"];
    float v28 = (float)(int)[v27 intValue];

    v29 = [v67 objectForKey:@"UplinkBandwidthUnit"];
    LODWORD(v24) = [v29 intValue];

    float v30 = v28 * 1000.0;
    if (!v24) {
      float v30 = v28;
    }
    v31 = self->_bwFmtr;
    v32 = +[NSNumber numberWithInt:(int)v30];
    uint64_t v33 = [(NSNumberFormatter *)v31 stringFromNumber:v32];
    outBandwidth = self->_outBandwidth;
    self->_outBandwidth = v33;

    v35 = [v67 objectForKey:@"UplinkPacketLossRatio"];
    [v35 floatValue];
    int v37 = v36;

    v38 = self->_bwFmtr;
    LODWORD(v39) = v37;
    v40 = +[NSNumber numberWithFloat:v39];
    v41 = [(NSNumberFormatter *)v38 stringFromNumber:v40];
    outPLR = self->_outPLR;
    self->_outPLR = v41;

    v43 = [v67 objectForKey:@"UplinkDelay"];
    float v44 = (float)(int)[v43 intValue];

    uint64_t v45 = self->_bwFmtr;
    v46 = +[NSNumber numberWithInt:(int)v44];
    v47 = [(NSNumberFormatter *)v45 stringFromNumber:v46];
    outDelay = self->_outDelay;
    self->_outDelay = v47;

    v49 = [v67 objectForKey:@"DNSDelayValue"];
    float v50 = (float)(int)[v49 intValue];

    uint64_t v51 = self->_bwFmtr;
    v52 = +[NSNumber numberWithInt:(int)v50];
    v53 = [(NSNumberFormatter *)v51 stringFromNumber:v52];
    dnsDelay = self->_dnsDelay;
    self->_dnsDelay = v53;

    v55 = [v67 objectForKey:@"Preset"];
    v56 = v55;
    if (v55 && ([v55 BOOLValue] & 1) != 0)
    {
      uint64_t v57 = "YES";
      BOOL v58 = 1;
    }
    else
    {
      BOOL v58 = 0;
      uint64_t v57 = "NO";
    }
    self->_BOOL isPreset = v58;
    if (dword_412E8) {
      NSLog(@"%s currentProfileName: %@ isPreset %s", "-[NLCProfileDetailController loadValuesFromCurrentProfile]", self->_profileName, v57);
    }
    v59 = [v67 objectForKey:@"ProtocolFamily"];
    id v60 = [v59 intValue];

    v61 = +[NSString stringWithFormat:@"%d", v60];
    protocolFamily = self->_protocolFamily;
    self->_protocolFamily = v61;

    uint64_t v63 = [v67 objectForKey:@"RunOnInterface"];
    v64 = v63;
    if (v63 && ![v63 isEqualToString:&stru_35910])
    {
      v66 = v64;
      interfaceName = self->_interfaceName;
      self->_interfaceName = v66;
    }
    else
    {
      interfaceName = self->_interfaceName;
      self->_interfaceName = (NSString *)&stru_35910;
    }

    double v3 = v67;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayFmtr, 0);
  objc_storeStrong((id *)&self->_plrFmtr, 0);
  objc_storeStrong((id *)&self->_bwFmtr, 0);
  objc_storeStrong((id *)&self->_protocolFamily, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_dnsDelay, 0);
  objc_storeStrong((id *)&self->_outDelay, 0);
  objc_storeStrong((id *)&self->_outPLR, 0);
  objc_storeStrong((id *)&self->_outBandwidth, 0);
  objc_storeStrong((id *)&self->_inDelay, 0);
  objc_storeStrong((id *)&self->_inPLR, 0);
  objc_storeStrong((id *)&self->_inBandwidth, 0);

  objc_storeStrong((id *)&self->_profileName, 0);
}

@end