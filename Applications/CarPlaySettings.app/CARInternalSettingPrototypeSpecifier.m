@interface CARInternalSettingPrototypeSpecifier
- (CARInternalSettingPrototypeSpecifier)initWithInternalSettingPrototype:(id)a3;
- (CARPrototypePref)prototype;
- (void)_performAction:(id)a3;
- (void)setPrototype:(id)a3;
@end

@implementation CARInternalSettingPrototypeSpecifier

- (CARInternalSettingPrototypeSpecifier)initWithInternalSettingPrototype:(id)a3
{
  id v5 = a3;
  v6 = [v5 title];
  v16.receiver = self;
  v16.super_class = (Class)CARInternalSettingPrototypeSpecifier;
  v7 = [(CARSettingsSwitchCellSpecifier *)&v16 initWithTitle:v6 image:0];

  objc_storeStrong((id *)&v7->_prototype, a3);
  objc_initWeak(&location, v7);
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_10002A7AC;
  v13 = &unk_100092008;
  objc_copyWeak(&v14, &location);
  [(CARSettingsCellSpecifier *)v7 setActionBlock:&v10];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  v8 = [NSNumber numberWithBool:[v5 internalSettingsState:v10, v11, v12, v13]];
  [(CARSettingsCellSpecifier *)v7 setCellValue:v8];

  return v7;
}

- (void)_performAction:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (v4)
  {
    id v5 = [v4 BOOLValue];
  }
  else
  {
    v6 = [(CARInternalSettingPrototypeSpecifier *)self prototype];
    id v5 = (id)([v6 state] ^ 1);
  }
  v7 = [(CARInternalSettingPrototypeSpecifier *)self prototype];
  v8 = +[CARPrototypePref nowPlayingAlbumArt];

  v9 = [(CARInternalSettingPrototypeSpecifier *)self prototype];
  v10 = v9;
  if (v7 == v8) {
    [v9 setInternalSettingsState:v5];
  }
  else {
    [v9 setState:v5];
  }

  uint64_t v11 = +[NSNumber numberWithBool:v5];
  [(CARSettingsCellSpecifier *)self setCellValue:v11];
}

- (CARPrototypePref)prototype
{
  return self->_prototype;
}

- (void)setPrototype:(id)a3
{
}

- (void).cxx_destruct
{
}

@end