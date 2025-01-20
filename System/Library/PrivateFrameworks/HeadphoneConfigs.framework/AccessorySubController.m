@interface AccessorySubController
- (AccessorySubController)init;
- (id)specifiers;
- (void)dealloc;
- (void)listItemSelected:(id)a3;
- (void)specifiers;
@end

@implementation AccessorySubController

- (AccessorySubController)init
{
  v3.receiver = self;
  v3.super_class = (Class)AccessorySubController;
  result = [(AccessorySubController *)&v3 init];
  if (result) {
    *((unsigned char *)&result->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F00]) = 0;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AccessorySubController;
  [(PSListItemsController *)&v2 dealloc];
}

- (id)specifiers
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA48];
  v31.receiver = self;
  v31.super_class = (Class)AccessorySubController;
  v4 = [(PSListItemsController *)&v31 specifiers];
  v5 = [v3 arrayWithArray:v4];

  uint64_t v6 = (int)*MEMORY[0x1E4F92FA0];
  v7 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v6) userInfo];
  v8 = [v7 objectForKeyedSubscript:@"bt-device"];
  p_currentDevice = &self->_currentDevice;
  currentDevice = self->_currentDevice;
  self->_currentDevice = v8;

  if (objc_opt_respondsToSelector())
  {
    v11 = [(BluetoothDeviceProtocol *)*p_currentDevice classicDevice];
  }
  else
  {
    v12 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(AccessorySubController *)(uint64_t)&self->_currentDevice specifiers];
    }

    if ((objc_opt_respondsToSelector() & 1) == 0) {
      -[AccessorySubController specifiers]();
    }
    v11 = *p_currentDevice;
  }
  v13 = v11;
  v14 = (void *)MEMORY[0x1E4F92E70];
  v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:&stru_1F4097960 value:&stru_1F4097960 table:@"DeviceConfig"];
  v17 = [v14 preferenceSpecifierNamed:v16 target:self set:0 get:0 detail:0 cell:0 edit:0];

  uint64_t v30 = 0;
  [(BluetoothDeviceProtocol *)v13 clickHoldMode:(char *)&v30 + 4 rightAction:&v30];
  v18 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v6) identifier];
  LODWORD(v16) = [v18 isEqualToString:@"LEFT_ID"];

  if (v16)
  {
    if (HIDWORD(v30) == 7)
    {
      [(BluetoothDeviceProtocol *)v13 setClickHoldMode:7 rightMode:6];
      v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v20 = v19;
      v21 = @"FOOTER_VOLUME_UP_RIGHT_BUD";
    }
    else
    {
      if (HIDWORD(v30) != 6) {
        goto LABEL_18;
      }
      [(BluetoothDeviceProtocol *)v13 setClickHoldMode:6 rightMode:7];
      v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v20 = v19;
      v21 = @"FOOTER_VOLUME_DOWN_RIGHT_BUD";
    }
  }
  else
  {
    v22 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v6) identifier];
    int v23 = [v22 isEqualToString:@"RIGHT_ID"];

    if (!v23) {
      goto LABEL_18;
    }
    if (v30 == 7)
    {
      [(BluetoothDeviceProtocol *)v13 setClickHoldMode:6 rightMode:7];
      v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v20 = v19;
      v21 = @"FOOTER_VOLUME_UP_LEFT_BUD";
    }
    else
    {
      if (v30 != 6) {
        goto LABEL_18;
      }
      [(BluetoothDeviceProtocol *)v13 setClickHoldMode:7 rightMode:6];
      v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v20 = v19;
      v21 = @"FOOTER_VOLUME_DOWN_LEFT_BUD";
    }
  }
  v24 = [v19 localizedStringForKey:v21 value:&stru_1F4097960 table:@"DeviceConfig-B494"];
  [v17 setProperty:v24 forKey:*MEMORY[0x1E4F93170]];

LABEL_18:
  [v5 addObject:v17];
  v25 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];
  uint64_t v26 = (int)*MEMORY[0x1E4F92F08];
  v27 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v26);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v26) = v25;

  id v28 = *(id *)((char *)&self->super.super.super.super.super.super.isa + v26);

  return v28;
}

- (void)listItemSelected:(id)a3
{
  id v4 = a3;
  if (![v4 section])
  {
    v5.receiver = self;
    v5.super_class = (Class)AccessorySubController;
    [(PSListItemsController *)&v5 listItemSelected:v4];
    [(AccessorySubController *)self reloadSpecifiers];
  }
}

- (void).cxx_destruct
{
}

- (void)specifiers
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1E4BFE000, a2, OS_LOG_TYPE_ERROR, " AccessorySubController does not respond to classicDevice, currentDevice is %@", (uint8_t *)&v5, 0xCu);
}

@end