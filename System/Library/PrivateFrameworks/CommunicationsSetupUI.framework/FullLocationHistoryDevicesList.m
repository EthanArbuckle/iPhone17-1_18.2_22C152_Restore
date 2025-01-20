@interface FullLocationHistoryDevicesList
- (FullLocationHistoryDevicesList)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (_TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList)devicesList;
- (void)setDevicesList:(id)a3;
- (void)setUpConstraints;
@end

@implementation FullLocationHistoryDevicesList

- (FullLocationHistoryDevicesList)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)FullLocationHistoryDevicesList;
  v5 = [(PSTableCell *)&v9 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = [[_TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList alloc] initWithFullDataSharing:1];
    devicesList = v5->_devicesList;
    v5->_devicesList = v6;

    [(FullLocationHistoryDevicesList *)v5 setUpConstraints];
  }
  return v5;
}

- (void)setUpConstraints
{
  v31[4] = *MEMORY[0x263EF8340];
  v3 = [(FullLocationHistoryDevicesList *)self devicesList];
  v4 = [v3 getView];

  v5 = [v4 view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(FullLocationHistoryDevicesList *)self inputViewController];
  [v6 addChildViewController:v4];

  v7 = [(FullLocationHistoryDevicesList *)self contentView];
  v8 = [v4 view];
  [v7 addSubview:v8];

  v21 = (void *)MEMORY[0x263F08938];
  v30 = [v4 view];
  v28 = [v30 centerYAnchor];
  v29 = [(FullLocationHistoryDevicesList *)self contentView];
  v27 = [v29 centerYAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v31[0] = v26;
  v25 = [v4 view];
  v23 = [v25 centerXAnchor];
  v24 = [(FullLocationHistoryDevicesList *)self contentView];
  v22 = [v24 centerXAnchor];
  v20 = [v23 constraintEqualToAnchor:v22];
  v31[1] = v20;
  v19 = [v4 view];
  v18 = [v19 widthAnchor];
  objc_super v9 = [(FullLocationHistoryDevicesList *)self contentView];
  v10 = [v9 widthAnchor];
  v11 = [v18 constraintEqualToAnchor:v10];
  v31[2] = v11;
  v12 = [(FullLocationHistoryDevicesList *)self contentView];
  v13 = [v12 heightAnchor];
  v14 = [v4 view];
  v15 = [v14 heightAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v31[3] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];
  [v21 activateConstraints:v17];
}

- (_TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList)devicesList
{
  return self->_devicesList;
}

- (void)setDevicesList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end