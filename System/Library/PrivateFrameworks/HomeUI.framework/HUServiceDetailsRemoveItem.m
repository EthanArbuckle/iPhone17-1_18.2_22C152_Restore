@interface HUServiceDetailsRemoveItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUServiceDetailsRemoveItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if ([(HUServiceDetailsAbstractItem *)self isCamera])
  {
    v4 = @"HUServiceDetailsRemoveCameraName";
  }
  else if ([(HUServiceDetailsAbstractItem *)self isItemGroup])
  {
    v4 = @"HUServiceDetailsRemoveServiceGroupName";
  }
  else if ([(HUServiceDetailsAbstractItem *)self isVisibleAsBridge])
  {
    v4 = @"HUServiceDetailsRemoveBridgeName";
  }
  else
  {
    v4 = @"HUServiceDetailsRemoveDeviceName";
  }
  v5 = _HULocalizedStringWithDefaultValue(v4, v4, 1);
  uint64_t v6 = *MEMORY[0x1E4F68928];
  v16[0] = *MEMORY[0x1E4F68AB8];
  v16[1] = v6;
  v17[0] = v5;
  v17[1] = @"AccessoryDetails.RemoveAccessory";
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v8 = (void *)[v7 mutableCopy];

  BOOL v9 = [(HUServiceDetailsAbstractItem *)self canShowAsIndividualTiles];
  v10 = (void *)MEMORY[0x1E4F68B10];
  if (v9)
  {
    BOOL v11 = [(HUServiceDetailsAbstractItem *)self isSensorService];
    if ([(HUServiceDetailsAbstractItem *)self isContainedInAParent] && !v11) {
      [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*v10];
    }
  }
  else
  {
    [(HUServiceDetailsAbstractItem *)self isContainedInAParent];
  }
  if ([(HUServiceDetailsAbstractItem *)self isBridged]) {
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*v10];
  }
  if ([(HUServiceDetailsAbstractItem *)self isNetworkRouterSatellite]) {
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*v10];
  }
  v12 = (void *)MEMORY[0x1E4F7A0D8];
  v13 = [MEMORY[0x1E4F69228] outcomeWithResults:v8];
  v14 = [v12 futureWithResult:v13];

  return v14;
}

@end