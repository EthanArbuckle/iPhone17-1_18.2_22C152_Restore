@interface _HFObservedAccessorySettingState
+ (NAIdentity)na_identity;
+ (id)stateWithSettings:(id)a3 forSetting:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HMSetting)setting;
- (HMSettings)settings;
- (NSSet)selectionOptions;
- (_HFObservedAccessorySettingState)init;
- (_HFObservedAccessorySettingState)initWithSettings:(id)a3 setting:(id)a4;
- (unint64_t)hash;
@end

@implementation _HFObservedAccessorySettingState

+ (id)stateWithSettings:(id)a3 forSetting:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSettings:v6 setting:v5];

  return v7;
}

- (_HFObservedAccessorySettingState)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithSettings_setting_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessorySettingAdapter.m", 36, @"%s is unavailable; use %@ instead",
    "-[_HFObservedAccessorySettingState init]",
    v5);

  return 0;
}

- (_HFObservedAccessorySettingState)initWithSettings:(id)a3 setting:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"HFAccessorySettingAdapter.m", 41, @"Invalid parameter not satisfying: %@", @"settings" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v25 = [MEMORY[0x263F08690] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"HFAccessorySettingAdapter.m", 42, @"Invalid parameter not satisfying: %@", @"setting" object file lineNumber description];

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)_HFObservedAccessorySettingState;
  v11 = [(_HFObservedAccessorySettingState *)&v26 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_settings, a3);
    objc_storeStrong((id *)&v12->_setting, a4);
    objc_opt_class();
    id v13 = v10;
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    v16 = (void *)MEMORY[0x263EFFA08];
    v17 = [v15 items];
    v18 = objc_msgSend(v17, "na_map:", &__block_literal_global_35);
    v19 = [v16 setWithArray:v18];
    v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      v21 = [MEMORY[0x263EFFA08] set];
    }
    selectionOptions = v12->_selectionOptions;
    v12->_selectionOptions = v21;
  }
  return v12;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_229 != -1) {
    dispatch_once(&_MergedGlobals_229, &__block_literal_global_23_0);
  }
  v2 = (void *)qword_26AB2EE28;
  return (NAIdentity *)v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (HMSettings)settings
{
  return self->_settings;
}

- (HMSetting)setting
{
  return self->_setting;
}

- (NSSet)selectionOptions
{
  return self->_selectionOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionOptions, 0);
  objc_storeStrong((id *)&self->_setting, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end