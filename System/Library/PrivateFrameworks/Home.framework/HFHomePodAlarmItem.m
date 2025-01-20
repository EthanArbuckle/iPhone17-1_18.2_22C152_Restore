@interface HFHomePodAlarmItem
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (HFHomePodAlarmItem)initWithMediaProfileContainer:(id)a3 alarm:(id)a4;
- (HFMediaProfileContainer)mediaProfileContainer;
- (HMMediaProfile)mediaProfile;
- (MTAlarm)alarm;
- (NSString)alarmIdentifier;
- (id)_subclass_updateWithOptions:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)_effectiveLoadingStateForSuggestedLoadingState:(unint64_t)a3;
- (unint64_t)hash;
- (void)setAlarm:(id)a3;
- (void)setAlarmIdentifier:(id)a3;
@end

@implementation HFHomePodAlarmItem

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_2_4 != -1) {
    dispatch_once(&_MergedGlobals_2_4, &__block_literal_global_4_13);
  }
  v2 = (void *)qword_26AB2EA48;
  return (NAIdentity *)v2;
}

void __33__HFHomePodAlarmItem_na_identity__block_invoke_2()
{
  id v4 = [MEMORY[0x263F58198] builder];
  v0 = [v4 appendCharacteristic:&__block_literal_global_7_12];
  v1 = [v0 appendCharacteristic:&__block_literal_global_9_10];
  uint64_t v2 = [v1 build];
  v3 = (void *)qword_26AB2EA48;
  qword_26AB2EA48 = v2;
}

uint64_t __33__HFHomePodAlarmItem_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 alarm];
}

id __33__HFHomePodAlarmItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 mediaProfileContainer];
  v3 = [v2 uniqueIdentifier];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (HFHomePodAlarmItem)initWithMediaProfileContainer:(id)a3 alarm:(id)a4
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
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HFHomePodAlarmItem.m", 64, @"Invalid parameter not satisfying: %@", @"mediaProfileContainer" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"HFHomePodAlarmItem.m", 65, @"Invalid parameter not satisfying: %@", @"alarm" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)HFHomePodAlarmItem;
  v11 = [(HFHomePodAlarmItem *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaProfileContainer, a3);
    objc_storeStrong((id *)&v12->_alarm, a4);
    v13 = [v10 alarmID];
    uint64_t v14 = [v13 copy];
    alarmIdentifier = v12->_alarmIdentifier;
    v12->_alarmIdentifier = (NSString *)v14;
  }
  return v12;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(HFHomePodAlarmItem *)self alarm];
  v6 = [v4 alarm];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (HMMediaProfile)mediaProfile
{
  uint64_t v2 = [(HFHomePodAlarmItem *)self mediaProfileContainer];
  v3 = [v2 mediaProfiles];
  id v4 = [v3 anyObject];

  return (HMMediaProfile *)v4;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(HFHomePodAlarmItem *)self mediaProfileContainer];
  v6 = objc_msgSend(v5, "hf_settingsAdapterManager");
  int64_t v7 = [v6 adapterForIdentifier:@"MobileTimerAdapter"];

  if (_os_feature_enabled_impl())
  {
    id v8 = objc_alloc_init(MEMORY[0x263F58190]);
    id v9 = [v7 allAlarmsFuture];
    objc_initWeak(location, self);
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __50__HFHomePodAlarmItem__subclass_updateWithOptions___block_invoke;
    v50[3] = &unk_264093D20;
    objc_copyWeak(&v52, location);
    id v10 = v8;
    id v51 = v10;
    id v11 = (id)[v9 addSuccessBlock:v50];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __50__HFHomePodAlarmItem__subclass_updateWithOptions___block_invoke_3;
    v48[3] = &unk_26408CDF0;
    id v12 = v10;
    id v49 = v12;
    id v13 = (id)[v9 addFailureBlock:v48];
    uint64_t v14 = v49;
    id v15 = v12;

    objc_destroyWeak(&v52);
    objc_destroyWeak(location);
    goto LABEL_16;
  }
  id v9 = [v7 allAlarms];
  v16 = (void *)MEMORY[0x263EFF9C0];
  v17 = [(HFHomePodAlarmItem *)self mediaProfileContainer];
  v18 = [(HFHomePodAlarmItem *)self mediaProfileContainer];
  objc_super v19 = [v18 settings];
  v20 = objc_msgSend(v16, "setWithObjects:", v17, v19, 0);

  v21 = [(HFHomePodAlarmItem *)self mediaProfileContainer];
  v22 = objc_msgSend(v21, "hf_dependentHomeKitObjectsForDownstreamItems");
  [v20 unionSet:v22];

  v23 = [(HFHomePodAlarmItem *)self mediaProfileContainer];
  v24 = &unk_26C12B8A0;
  id v25 = v23;
  v26 = v25;
  if (v25)
  {
    if ([v25 conformsToProtocol:v24]) {
      v27 = v26;
    }
    else {
      v27 = 0;
    }
    v28 = v26;
    if (v27) {
      goto LABEL_10;
    }
    v29 = [MEMORY[0x263F08690] currentHandler];
    v30 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v31 = NSStringFromProtocol((Protocol *)v24);
    [v29 handleFailureInFunction:v30, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v31 file lineNumber description];
  }
  v28 = 0;
LABEL_10:

  v32 = [v28 settings];
  v33 = objc_msgSend(v32, "hf_accessorySettingAtKeyPath:", @"root.mobileTimer.alarms");

  if (v33)
  {
    v34 = [v28 settings];
    v35 = objc_msgSend(v34, "hf_accessorySettingAtKeyPath:", @"root.mobileTimer.alarms");
    [v20 addObject:v35];
  }
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __50__HFHomePodAlarmItem__subclass_updateWithOptions___block_invoke_4;
  v47[3] = &unk_264095EC8;
  v47[4] = self;
  v36 = objc_msgSend(v9, "na_firstObjectPassingTest:", v47);
  [(HFHomePodAlarmItem *)self setAlarm:v36];

  v37 = objc_opt_new();
  v38 = [(HFHomePodAlarmItem *)self alarm];

  if (v38)
  {
    v39 = [(HFHomePodAlarmItem *)self alarm];
    v40 = [v39 displayTitle];
    [v37 setObject:v40 forKeyedSubscript:@"title"];

    v41 = [(HFHomePodAlarmItem *)self alarm];
    [v37 setObject:v41 forKeyedSubscript:@"MTALARM"];

    [v37 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"remoteAccessDependency"];
    [v37 setObject:v20 forKeyedSubscript:@"dependentHomeKitObjects"];
    v42 = NSNumber;
    v43 = [(HFHomePodAlarmItem *)self mediaProfileContainer];
    v44 = [v43 settings];
    v45 = objc_msgSend(v42, "numberWithInt:", objc_msgSend(v44, "isControllable") ^ 1);
    [v37 setObject:v45 forKeyedSubscript:@"isDisabled"];
  }
  else
  {
    [v37 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
  }
  id v15 = [MEMORY[0x263F58190] futureWithResult:v37];

LABEL_16:
  return v15;
}

void __50__HFHomePodAlarmItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x263EFF9C0];
  v6 = [WeakRetained mediaProfileContainer];
  int64_t v7 = [WeakRetained mediaProfileContainer];
  id v8 = [v7 settings];
  id v9 = objc_msgSend(v5, "setWithObjects:", v6, v8, 0);

  id v10 = [WeakRetained mediaProfileContainer];
  id v11 = objc_msgSend(v10, "hf_dependentHomeKitObjectsForDownstreamItems");
  [v9 unionSet:v11];

  id v12 = [WeakRetained mediaProfileContainer];
  id v13 = &unk_26C12B8A0;
  id v14 = v12;
  id v15 = v14;
  if (!v14) {
    goto LABEL_7;
  }
  if ([v14 conformsToProtocol:v13]) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  v17 = v15;
  if (!v16)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    objc_super v19 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v20 = NSStringFromProtocol((Protocol *)v13);
    [v18 handleFailureInFunction:v19, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v20 file lineNumber description];

LABEL_7:
    v17 = 0;
  }

  v21 = [v17 settings];
  v22 = objc_msgSend(v21, "hf_accessorySettingAtKeyPath:", @"root.mobileTimer.alarms");

  if (v22)
  {
    v23 = [v17 settings];
    v24 = objc_msgSend(v23, "hf_accessorySettingAtKeyPath:", @"root.mobileTimer.alarms");
    [v9 addObject:v24];
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __50__HFHomePodAlarmItem__subclass_updateWithOptions___block_invoke_2;
  v35[3] = &unk_264095EC8;
  v35[4] = WeakRetained;
  id v25 = objc_msgSend(v3, "na_firstObjectPassingTest:", v35);
  [WeakRetained setAlarm:v25];

  v26 = objc_opt_new();
  v27 = [WeakRetained alarm];

  if (v27)
  {
    v28 = [WeakRetained alarm];
    v29 = [v28 displayTitle];
    [v26 setObject:v29 forKeyedSubscript:@"title"];

    v30 = [WeakRetained alarm];
    [v26 setObject:v30 forKeyedSubscript:@"MTALARM"];

    [v26 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"remoteAccessDependency"];
    [v26 setObject:v9 forKeyedSubscript:@"dependentHomeKitObjects"];
    v31 = NSNumber;
    v32 = [WeakRetained mediaProfileContainer];
    v33 = [v32 settings];
    v34 = objc_msgSend(v31, "numberWithInt:", objc_msgSend(v33, "isControllable") ^ 1);
    [v26 setObject:v34 forKeyedSubscript:@"isDisabled"];
  }
  else
  {
    [v26 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
  }
  [*(id *)(a1 + 32) finishWithResult:v26];
}

uint64_t __50__HFHomePodAlarmItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 alarmID];
  id v4 = [*(id *)(a1 + 32) alarmIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __50__HFHomePodAlarmItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

uint64_t __50__HFHomePodAlarmItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 alarmID];
  id v4 = [*(id *)(a1 + 32) alarmIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (unint64_t)_effectiveLoadingStateForSuggestedLoadingState:(unint64_t)a3
{
  uint64_t v5 = [(HFHomePodAlarmItem *)self mediaProfileContainer];
  v6 = objc_msgSend(v5, "hf_settingsAdapterManager");
  int64_t v7 = [v6 adapterForIdentifier:@"MobileTimerAdapter"];

  if (v7
    && ([(HFHomePodAlarmItem *)self alarm],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    id v9 = [v7 alarmsWithPendingEdits];
    id v10 = [(HFHomePodAlarmItem *)self alarm];
    int v11 = [v9 containsObject:v10];

    if (v11) {
      a3 = 2;
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HFHomePodAlarmItem;
    a3 = [(HFItem *)&v13 _effectiveLoadingStateForSuggestedLoadingState:a3];
  }

  return a3;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (MTAlarm)alarm
{
  return self->_alarm;
}

- (void)setAlarm:(id)a3
{
}

- (NSString)alarmIdentifier
{
  return self->_alarmIdentifier;
}

- (void)setAlarmIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmIdentifier, 0);
  objc_storeStrong((id *)&self->_alarm, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end