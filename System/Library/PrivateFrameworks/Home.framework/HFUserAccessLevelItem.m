@interface HFUserAccessLevelItem
- (id)_subclass_updateWithOptions:(id)a3;
- (unint64_t)cameraAccessLevel;
@end

@implementation HFUserAccessLevelItem

- (unint64_t)cameraAccessLevel
{
  v3 = [(HFUserItem *)self home];
  v4 = [(HFUserItem *)self user];
  v5 = [v3 homeAccessControlForUser:v4];
  unint64_t v6 = [v5 camerasAccessLevel];

  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HFUserAccessLevelItem;
  v5 = [(HFUserItem *)&v10 _subclass_updateWithOptions:v4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__HFUserAccessLevelItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_26408FB70;
  objc_copyWeak(&v9, &location);
  unint64_t v6 = [v5 flatMap:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

id __53__HFUserAccessLevelItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)[v3 mutableCopy];

  unint64_t v6 = HFLocalizedStringFromHMUserCameraAccessLevel([WeakRetained cameraAccessLevel]);
  [v5 setObject:v6 forKeyedSubscript:@"cameraAccessLevel"];

  v7 = [MEMORY[0x263F58190] futureWithResult:v5];

  return v7;
}

@end