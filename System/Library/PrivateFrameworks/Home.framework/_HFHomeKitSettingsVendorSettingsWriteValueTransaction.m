@interface _HFHomeKitSettingsVendorSettingsWriteValueTransaction
- (BOOL)hasStarted;
- (HMSetting)setting;
- (NAFuture)settingWriteFuture;
- (NSDate)transactionStartDate;
- (NSError)error;
- (NSNumber)transactionNumber;
- (_HFHomeKitSettingsVendorSettingsWriteValueTransaction)init;
- (_HFHomeKitSettingsVendorSettingsWriteValueTransaction)initWithSetting:(id)a3 previousValue:(id)a4 value:(id)a5 changeType:(unint64_t)a6;
- (id)description;
- (id)descriptionBuilder;
- (id)previousValue;
- (id)value;
- (unint64_t)changeType;
- (void)setError:(id)a3;
- (void)setSettingWriteFuture:(id)a3;
- (void)setStarted:(BOOL)a3;
@end

@implementation _HFHomeKitSettingsVendorSettingsWriteValueTransaction

- (_HFHomeKitSettingsVendorSettingsWriteValueTransaction)initWithSetting:(id)a3 previousValue:(id)a4 value:(id)a5 changeType:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_HFHomeKitSettingsVendorSettingsWriteValueTransaction;
  v14 = [(_HFHomeKitSettingsVendorSettingsWriteValueTransaction *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_setting, a3);
    objc_storeStrong(&v15->_previousValue, a4);
    objc_storeStrong(&v15->_value, a5);
    ++initWithSetting_previousValue_value_changeType__i;
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    transactionNumber = v15->_transactionNumber;
    v15->_transactionNumber = (NSNumber *)v16;

    v18 = (NAFuture *)objc_alloc_init(MEMORY[0x263F58190]);
    settingWriteFuture = v15->_settingWriteFuture;
    v15->_settingWriteFuture = v18;

    v15->_changeType = a6;
  }

  return v15;
}

- (_HFHomeKitSettingsVendorSettingsWriteValueTransaction)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithSetting_previousValue_value_changeType_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFHomeKitSettingsValueManager.m", 69, @"%s is unavailable; use %@ instead",
    "-[_HFHomeKitSettingsVendorSettingsWriteValueTransaction init]",
    v5);

  return 0;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
  if (a3 && !self->_transactionStartDate)
  {
    v4 = [MEMORY[0x263EFF910] date];
    transactionStartDate = self->_transactionStartDate;
    self->_transactionStartDate = v4;
    MEMORY[0x270F9A758](v4, transactionStartDate);
  }
}

- (id)descriptionBuilder
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  v4 = [(_HFHomeKitSettingsVendorSettingsWriteValueTransaction *)self transactionNumber];
  id v5 = (id)[v3 appendObject:v4 withName:@"transactionNumber"];

  if ([(_HFHomeKitSettingsVendorSettingsWriteValueTransaction *)self changeType] == 1) {
    v6 = @"Atomic";
  }
  else {
    v6 = @"FullReplace";
  }
  id v7 = (id)[v3 appendObject:v6 withName:@"changeType"];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __75___HFHomeKitSettingsVendorSettingsWriteValueTransaction_descriptionBuilder__block_invoke;
  v26[3] = &unk_26408D648;
  v26[4] = self;
  v8 = __75___HFHomeKitSettingsVendorSettingsWriteValueTransaction_descriptionBuilder__block_invoke((uint64_t)v26);
  id v9 = (id)[v3 appendObject:v8 withName:@"status"];
  v10 = [(_HFHomeKitSettingsVendorSettingsWriteValueTransaction *)self setting];
  id v11 = [v10 keyPath];
  id v12 = (id)[v3 appendObject:v11 withName:@"setting"];

  id v13 = (void *)MEMORY[0x263F0E720];
  v14 = [(_HFHomeKitSettingsVendorSettingsWriteValueTransaction *)self previousValue];
  v15 = [(_HFHomeKitSettingsVendorSettingsWriteValueTransaction *)self setting];
  uint64_t v16 = [v15 keyPath];
  v17 = objc_msgSend(v13, "hf_debugDescriptionForValue:keyPath:", v14, v16);
  id v18 = (id)[v3 appendObject:v17 withName:@"previousValue"];

  v19 = (void *)MEMORY[0x263F0E720];
  v20 = [(_HFHomeKitSettingsVendorSettingsWriteValueTransaction *)self value];
  objc_super v21 = [(_HFHomeKitSettingsVendorSettingsWriteValueTransaction *)self setting];
  v22 = [v21 keyPath];
  v23 = objc_msgSend(v19, "hf_debugDescriptionForValue:keyPath:", v20, v22);
  id v24 = (id)[v3 appendObject:v23 withName:@"value"];

  return v3;
}

- (id)description
{
  v2 = [(_HFHomeKitSettingsVendorSettingsWriteValueTransaction *)self descriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (NAFuture)settingWriteFuture
{
  return self->_settingWriteFuture;
}

- (void)setSettingWriteFuture:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)hasStarted
{
  return self->_started;
}

- (NSDate)transactionStartDate
{
  return self->_transactionStartDate;
}

- (id)value
{
  return self->_value;
}

- (id)previousValue
{
  return self->_previousValue;
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (HMSetting)setting
{
  return self->_setting;
}

- (NSNumber)transactionNumber
{
  return self->_transactionNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionNumber, 0);
  objc_storeStrong((id *)&self->_setting, 0);
  objc_storeStrong(&self->_previousValue, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_transactionStartDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_settingWriteFuture, 0);
}

@end