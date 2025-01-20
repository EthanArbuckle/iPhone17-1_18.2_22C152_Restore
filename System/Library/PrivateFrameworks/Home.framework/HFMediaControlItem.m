@interface HFMediaControlItem
+ (Class)valueClass;
- (HFMediaActionSetting)mediaActionSetting;
- (HFMediaControlItem)initWithMediaRoutingIdentifier:(id)a3 deviceName:(id)a4 mediaAccessoryItemType:(int64_t)a5;
- (HFMediaControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5;
- (HFMediaControlItem)initWithValueSource:(id)a3 mediaProfileContainer:(id)a4 mediaAccessoryItemType:(int64_t)a5 displayResults:(id)a6;
- (HFMediaProfileContainer)mediaProfileContainer;
- (HFMediaValueSource)mediaValueSource;
- (NSString)deviceName;
- (NSString)mediaRoutingIdentifier;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)normalizedValueForValue:(id)a3;
- (id)readValueAndPopulateStandardResults;
- (id)toggleValue;
- (id)valueForCharacteristicValues:(id)a3;
- (id)writePrimaryState:(int64_t)a3;
- (id)writeValue:(id)a3;
- (int64_t)mapToHMMediaPlaybackState:(int64_t)a3;
- (int64_t)mediaAccessoryItemType;
- (int64_t)sortPriority;
- (int64_t)toggledSceneStateFromPrimaryState:(int64_t)a3;
- (void)setDeviceName:(id)a3;
- (void)setMediaActionSetting:(id)a3;
- (void)setMediaRoutingIdentifier:(id)a3;
@end

@implementation HFMediaControlItem

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFMediaControlItem)initWithValueSource:(id)a3 mediaProfileContainer:(id)a4 mediaAccessoryItemType:(int64_t)a5 displayResults:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HFMediaControlItem.m", 87, @"Invalid parameter not satisfying: %@", @"valueSource" object file lineNumber description];
  }
  v14 = objc_msgSend(v12, "hf_home");
  if (!v14)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"HFMediaControlItem.m", 90, @"Invalid parameter not satisfying: %@", @"home != nil" object file lineNumber description];
  }
  v15 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  v16 = objc_msgSend(v14, "hf_characteristicValueManager");
  v17 = [MEMORY[0x263EFFA08] set];
  v18 = [(HFSimpleAggregatedCharacteristicValueSource *)v15 initWithValueSource:v16 characteristics:v17 primaryServiceDescriptor:0];

  v19 = objc_alloc_init(HFControlItemCharacteristicOptions);
  v25.receiver = self;
  v25.super_class = (Class)HFMediaControlItem;
  v20 = [(HFControlItem *)&v25 initWithValueSource:v18 characteristicOptions:v19 displayResults:v13];

  if (v20)
  {
    objc_storeStrong((id *)&v20->_mediaValueSource, a3);
    objc_storeStrong((id *)&v20->_mediaProfileContainer, a4);
    v20->_mediaAccessoryItemType = a5;
  }

  return v20;
}

- (HFMediaControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  v8 = NSStringFromSelector(sel_initWithValueSource_displayResults_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFMediaControlItem.m", 109, @"%s is unavailable; use %@ instead",
    "-[HFMediaControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (HFMediaControlItem)initWithMediaRoutingIdentifier:(id)a3 deviceName:(id)a4 mediaAccessoryItemType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  id v11 = +[HFHomeKitDispatcher sharedDispatcher];
  id v12 = [v11 home];
  id v13 = objc_msgSend(v12, "hf_characteristicValueManager");
  v14 = [MEMORY[0x263EFFA08] set];
  v15 = [(HFSimpleAggregatedCharacteristicValueSource *)v10 initWithValueSource:v13 characteristics:v14 primaryServiceDescriptor:0];

  v16 = objc_alloc_init(HFControlItemCharacteristicOptions);
  v20.receiver = self;
  v20.super_class = (Class)HFMediaControlItem;
  v17 = [(HFControlItem *)&v20 initWithValueSource:v15 characteristicOptions:v16 displayResults:0];

  if (v17)
  {
    objc_storeStrong((id *)&v17->_mediaRoutingIdentifier, a3);
    objc_storeStrong((id *)&v17->_deviceName, a4);
    v17->_mediaAccessoryItemType = a5;
  }

  return v17;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  uint64_t v5 = [(HFMediaControlItem *)self mediaValueSource];
  if (v5
    && (v6 = (void *)v5,
        [(HFMediaControlItem *)self mediaProfileContainer],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    id v8 = objc_alloc((Class)objc_opt_class());
    id v9 = [(HFMediaControlItem *)self mediaValueSource];
    v10 = [(HFMediaControlItem *)self mediaProfileContainer];
    int64_t v11 = [(HFMediaControlItem *)self mediaAccessoryItemType];
    id v12 = [(HFControlItem *)self displayResults];
    id v13 = (void *)[v8 initWithValueSource:v9 mediaProfileContainer:v10 mediaAccessoryItemType:v11 displayResults:v12];
  }
  else
  {
    v14 = [(HFMediaControlItem *)self mediaRoutingIdentifier];

    if (!v14)
    {
      id v13 = 0;
      goto LABEL_8;
    }
    id v15 = objc_alloc((Class)objc_opt_class());
    id v9 = [(HFMediaControlItem *)self mediaRoutingIdentifier];
    v10 = [(HFMediaControlItem *)self deviceName];
    id v13 = objc_msgSend(v15, "initWithMediaRoutingIdentifier:deviceName:mediaAccessoryItemType:", v9, v10, -[HFMediaControlItem mediaAccessoryItemType](self, "mediaAccessoryItemType"));
  }

LABEL_8:
  v16 = [(HFMediaControlItem *)self mediaActionSetting];
  [v13 setMediaActionSetting:v16];

  [v13 copyLatestResultsFromItem:self];
  return v13;
}

- (id)readValueAndPopulateStandardResults
{
  v31.receiver = self;
  v31.super_class = (Class)HFMediaControlItem;
  v3 = [(HFControlItem *)&v31 readValueAndPopulateStandardResults];
  v4 = [(HFMediaControlItem *)self mediaValueSource];
  uint64_t v5 = [(HFMediaControlItem *)self mediaProfileContainer];
  v6 = objc_msgSend(v5, "hf_mediaRouteIdentifier");
  uint64_t v7 = [v4 lastPlaybackStateForProfileForRouteID:v6];

  id v8 = [(HFMediaControlItem *)self mediaActionSetting];
  [v8 updatePlaybackState:v7];

  id v9 = [MEMORY[0x263EFF9A0] dictionary];
  v10 = v9;
  if (v7 == 2) {
    goto LABEL_8;
  }
  if (v7 == 1)
  {
    id v15 = &unk_26C0F6948;
    goto LABEL_10;
  }
  if (v7)
  {
LABEL_8:
    id v15 = &unk_26C0F6930;
LABEL_10:
    [v9 setObject:v15 forKeyedSubscript:@"value"];
    goto LABEL_11;
  }
  int64_t v11 = NSNumber;
  id v12 = [(HFMediaControlItem *)self mediaActionSetting];
  if (v12) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  v14 = [v11 numberWithInteger:v13];
  [v10 setObject:v14 forKeyedSubscript:@"value"];

LABEL_11:
  [v10 setObject:&unk_26C0F6960 forKeyedSubscript:@"controlItemPurpose"];
  v16 = [(HFMediaControlItem *)self mediaProfileContainer];
  v17 = objc_msgSend(v16, "hf_mediaRouteIdentifier");
  [v10 setObject:v17 forKeyedSubscript:@"HFMediaControlItemRouteIdentifierKey"];

  v18 = [(HFMediaControlItem *)self mediaProfileContainer];
  v19 = objc_msgSend(v18, "hf_dependentHomeKitObjectsForDownstreamItems");
  objc_super v20 = (void *)[v19 copy];
  [v10 setObject:v20 forKeyedSubscript:@"dependentHomeKitObjects"];

  v21 = [(HFMediaControlItem *)self mediaProfileContainer];
  v22 = objc_msgSend(v21, "hf_serviceNameComponents");

  if (v22)
  {
    [v10 setObject:v22 forKeyedSubscript:@"serviceNameComponents"];
    v23 = [v22 composedString];
    if (v23) {
      [v10 setObject:v23 forKeyedSubscript:@"title"];
    }
  }
  v24 = [(HFMediaControlItem *)self mediaProfileContainer];
  objc_super v25 = objc_msgSend(v24, "hf_categoryCapitalizedLocalizedDescription");
  [v10 setObject:v25 forKeyedSubscript:@"HFMediaControlItemCategoryLocalizedDescriptionKey"];

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __57__HFMediaControlItem_readValueAndPopulateStandardResults__block_invoke;
  v29[3] = &unk_26408E098;
  id v30 = v10;
  id v26 = v10;
  v27 = [v3 flatMap:v29];

  return v27;
}

id __57__HFMediaControlItem_readValueAndPopulateStandardResults__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a2];
  [v3 addEntriesFromDictionary:*(void *)(a1 + 32)];
  v4 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v4;
}

- (id)characteristicValuesForValue:(id)a3
{
  return (id)objc_msgSend(NSDictionary, "dictionary", a3);
}

- (id)valueForCharacteristicValues:(id)a3
{
  return &unk_26C0F6978;
}

- (id)normalizedValueForValue:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)writeValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [v7 integerValue];
  id v9 = [(HFMediaControlItem *)self mediaActionSetting];
  if (v9) {
    int64_t v10 = [(HFMediaControlItem *)self toggledSceneStateFromPrimaryState:v8];
  }
  else {
    int64_t v10 = [(HFMediaControlItem *)self mapToHMMediaPlaybackState:v8];
  }
  int64_t v11 = v10;

  id v12 = [(HFMediaControlItem *)self mediaValueSource];
  uint64_t v13 = [(HFMediaControlItem *)self mediaActionSetting];
  v14 = [v13 playbackArchive];
  id v15 = [(HFMediaControlItem *)self mediaProfileContainer];
  v16 = objc_msgSend(v15, "hf_mediaRouteIdentifier");
  v17 = [v12 writePlaybackState:v11 playbackArchive:v14 forRouteID:v16];
  v18 = [v17 flatMap:&__block_literal_global_82];

  return v18;
}

uint64_t __33__HFMediaControlItem_writeValue___block_invoke()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

- (int64_t)toggledSceneStateFromPrimaryState:(int64_t)a3
{
  if ((unint64_t)a3 < 2) {
    return 2;
  }
  if (a3 != 2) {
    return 0;
  }
  id v4 = [(HFMediaControlItem *)self mediaActionSetting];
  int64_t v5 = [v4 originalHMNonPausePlaybackState];

  return v5;
}

- (int64_t)mapToHMMediaPlaybackState:(int64_t)a3
{
  if ((unint64_t)a3 >= 2) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)writePrimaryState:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  int64_t v5 = [(HFMediaControlItem *)self writeValue:v4];

  return v5;
}

- (id)toggleValue
{
  objc_initWeak(&location, self);
  id v3 = [(HFMediaControlItem *)self readValueAndPopulateStandardResults];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__HFMediaControlItem_toggleValue__block_invoke;
  v6[3] = &unk_264093FC8;
  objc_copyWeak(&v7, &location);
  id v4 = [v3 flatMap:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

id __33__HFMediaControlItem_toggleValue__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = [v3 objectForKeyedSubscript:@"value"];

  if (objc_opt_isKindOfClass()) {
    int64_t v5 = v4;
  }
  else {
    int64_t v5 = 0;
  }
  id v6 = v5;
  uint64_t v7 = [v6 integerValue];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (v7 == 2) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2 * (v7 == 1);
  }
  int64_t v11 = [WeakRetained writePrimaryState:v10];

  return v11;
}

- (int64_t)sortPriority
{
  return 1000;
}

- (HFMediaValueSource)mediaValueSource
{
  return self->_mediaValueSource;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (int64_t)mediaAccessoryItemType
{
  return self->_mediaAccessoryItemType;
}

- (HFMediaActionSetting)mediaActionSetting
{
  return self->_mediaActionSetting;
}

- (void)setMediaActionSetting:(id)a3
{
}

- (NSString)mediaRoutingIdentifier
{
  return self->_mediaRoutingIdentifier;
}

- (void)setMediaRoutingIdentifier:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_mediaRoutingIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaActionSetting, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_storeStrong((id *)&self->_mediaValueSource, 0);
}

@end