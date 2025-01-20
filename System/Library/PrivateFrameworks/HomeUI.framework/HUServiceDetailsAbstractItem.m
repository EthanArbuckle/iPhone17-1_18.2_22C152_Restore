@interface HUServiceDetailsAbstractItem
- (BOOL)canShowAsIndividualTiles;
- (BOOL)isAccessory;
- (BOOL)isAccessoryDisplayedAsIndividualTiles;
- (BOOL)isAudioAnalysisSupportedDevice;
- (BOOL)isBridge;
- (BOOL)isBridged;
- (BOOL)isCHIPAccessory;
- (BOOL)isCamera;
- (BOOL)isContainedInAParent;
- (BOOL)isContainedWithinItemGroup;
- (BOOL)isItemGroup;
- (BOOL)isMediaAccessory;
- (BOOL)isMediaAccessoryGroup;
- (BOOL)isMultiServiceAccessory;
- (BOOL)isNetworkRouter;
- (BOOL)isNetworkRouterSatellite;
- (BOOL)isNotificationSupportedCamera;
- (BOOL)isSensorService;
- (BOOL)isService;
- (BOOL)isVisibleAsBridge;
- (HFServiceLikeItem)sourceServiceItem;
- (HMHome)home;
- (HUServiceDetailsAbstractItem)initWithSourceServiceItem:(id)a3 home:(id)a4;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sourceAccessory;
- (void)setHome:(id)a3;
- (void)setSourceServiceItem:(id)a3;
@end

@implementation HUServiceDetailsAbstractItem

- (HUServiceDetailsAbstractItem)initWithSourceServiceItem:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUServiceDetailsAbstractItem;
  v8 = [(HUServiceDetailsAbstractItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(HUServiceDetailsAbstractItem *)v8 setSourceServiceItem:v6];
    [(HUServiceDetailsAbstractItem *)v9 setHome:v7];
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  id v6 = [(HUServiceDetailsAbstractItem *)self home];
  id v7 = (void *)[v4 initWithSourceServiceItem:v5 home:v6];

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HUServiceDetailsAbstractItem.m", 40, @"%s is an abstract method that must be overriden by subclass %@", "-[HUServiceDetailsAbstractItem _subclass_updateWithOptions:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (BOOL)isItemGroup
{
  v2 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  if ([v2 conformsToProtocol:&unk_1F1A3D6E8]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  char v5 = [v4 isItemGroup];
  return v5;
}

- (BOOL)isContainedWithinItemGroup
{
  v2 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  if ([v2 conformsToProtocol:&unk_1F1A3D6E8]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  char v5 = [v4 isContainedWithinItemGroup];
  return v5;
}

- (BOOL)isAccessory
{
  v3 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  id v4 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_5:

LABEL_6:
    return 1;
  }
  char v5 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    goto LABEL_5;
  }
  id v7 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) != 0
      || [(HUServiceDetailsAbstractItem *)self isMediaAccessory]
      && ![(HUServiceDetailsAbstractItem *)self isMediaAccessoryGroup];
}

- (id)sourceAccessory
{
  v2 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  v3 = [v2 accessories];

  if ([v3 count] == 1)
  {
    id v4 = [v3 anyObject];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)isMultiServiceAccessory
{
  v2 = [(HUServiceDetailsAbstractItem *)self sourceAccessory];
  char v3 = objc_msgSend(v2, "hf_isMultiServiceAccessory");

  return v3;
}

- (BOOL)isService
{
  v2 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isMediaAccessory
{
  v2 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isMediaAccessoryGroup
{
  BOOL v3 = [(HUServiceDetailsAbstractItem *)self isMediaAccessory];
  if (v3)
  {
    LOBYTE(v3) = [(HUServiceDetailsAbstractItem *)self isItemGroup];
  }
  return v3;
}

- (BOOL)isCamera
{
  v2 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isNotificationSupportedCamera
{
  objc_opt_class();
  BOOL v3 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 profile];

  id v7 = [v6 accessory];
  char v8 = objc_msgSend(v7, "hf_isNotificationSupportedCamera");

  return v8;
}

- (BOOL)isBridge
{
  v2 = [(HUServiceDetailsAbstractItem *)self sourceAccessory];
  char v3 = objc_msgSend(v2, "hf_isBridge");

  return v3;
}

- (BOOL)isBridged
{
  v2 = [(HUServiceDetailsAbstractItem *)self sourceAccessory];
  char v3 = [v2 isBridged];

  return v3;
}

- (BOOL)isVisibleAsBridge
{
  v2 = [(HUServiceDetailsAbstractItem *)self sourceAccessory];
  char v3 = objc_msgSend(v2, "hf_isVisibleAsBridge");

  return v3;
}

- (BOOL)isAccessoryDisplayedAsIndividualTiles
{
  v2 = [(HUServiceDetailsAbstractItem *)self sourceAccessory];
  char v3 = objc_msgSend(v2, "hf_showAsIndividualServices");

  return v3;
}

- (BOOL)isContainedInAParent
{
  if ([(HUServiceDetailsAbstractItem *)self isMediaAccessory])
  {
    LOBYTE(v3) = [(HUServiceDetailsAbstractItem *)self isContainedWithinItemGroup];
  }
  else
  {
    BOOL v3 = [(HUServiceDetailsAbstractItem *)self isService];
    if (v3)
    {
      BOOL v3 = [(HUServiceDetailsAbstractItem *)self isMultiServiceAccessory];
      if (v3) {
        LOBYTE(v3) = ![(HUServiceDetailsAbstractItem *)self isAccessoryDisplayedAsIndividualTiles];
      }
    }
  }
  return v3;
}

- (BOOL)isNetworkRouter
{
  v2 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  BOOL v3 = [v2 services];
  char v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_205);

  return v4;
}

uint64_t __47__HUServiceDetailsAbstractItem_isNetworkRouter__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isNetworkRouter");
}

- (BOOL)isNetworkRouterSatellite
{
  v2 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  BOOL v3 = [v2 services];
  char v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_67_2);

  return v4;
}

uint64_t __56__HUServiceDetailsAbstractItem_isNetworkRouterSatellite__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isNetworkRouterSatellite");
}

- (BOOL)isSensorService
{
  v2 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)canShowAsIndividualTiles
{
  objc_opt_class();
  BOOL v3 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    char v4 = v3;
  }
  else {
    char v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [v5 accessory];
    LOBYTE(v7) = objc_msgSend(v6, "hf_canShowAsIndividualServices");
  }
  else
  {
    objc_opt_class();
    id v6 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
    if (objc_opt_isKindOfClass()) {
      char v8 = v6;
    }
    else {
      char v8 = 0;
    }
    id v7 = v8;

    if (v7)
    {
      v9 = [v7 service];
      v10 = [v9 accessory];
      LOBYTE(v7) = objc_msgSend(v10, "hf_canShowAsIndividualServices");
    }
    else
    {
      id v6 = 0;
    }
  }

  return (char)v7;
}

- (BOOL)isAudioAnalysisSupportedDevice
{
  objc_opt_class();
  BOOL v3 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    char v4 = v3;
  }
  else {
    char v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F692A8];
    id v7 = [v5 mediaProfileContainer];
    char v8 = [v6 isAudioAnalysisSupportedDevice:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isCHIPAccessory
{
  v2 = [(HUServiceDetailsAbstractItem *)self sourceAccessory];
  char v3 = [v2 supportsCHIP];

  return v3;
}

- (HFServiceLikeItem)sourceServiceItem
{
  return self->_sourceServiceItem;
}

- (void)setSourceServiceItem:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_sourceServiceItem, 0);
}

@end