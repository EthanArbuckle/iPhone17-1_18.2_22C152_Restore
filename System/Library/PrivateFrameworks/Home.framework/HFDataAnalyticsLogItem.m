@interface HFDataAnalyticsLogItem
+ (NAIdentity)na_identity;
- (BOOL)isDisplayDisabled;
- (BOOL)isEqual:(id)a3;
- (HFDataAnalyticsLogItem)init;
- (HFDataAnalyticsLogItem)initWithMediaProfileContainer:(id)a3 name:(id)a4;
- (HFMediaProfileContainer)mediaProfileContainer;
- (NSString)name;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)fetchLog;
- (unint64_t)hash;
@end

@implementation HFDataAnalyticsLogItem

- (HFDataAnalyticsLogItem)initWithMediaProfileContainer:(id)a3 name:(id)a4
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
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HFDataAnalyticsLogItem.m", 27, @"Invalid parameter not satisfying: %@", @"mediaProfileContainer" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"HFDataAnalyticsLogItem.m", 28, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HFDataAnalyticsLogItem;
  v11 = [(HFDataAnalyticsLogItem *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaProfileContainer, a3);
    uint64_t v13 = [v10 copy];
    name = v12->_name;
    v12->_name = (NSString *)v13;
  }
  return v12;
}

- (HFDataAnalyticsLogItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithMediaProfileContainer_name_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFDataAnalyticsLogItem.m", 40, @"%s is unavailable; use %@ instead",
    "-[HFDataAnalyticsLogItem init]",
    v5);

  return 0;
}

- (id)fetchLog
{
  v3 = [(HFDataAnalyticsLogItem *)self mediaProfileContainer];
  v4 = [(HFDataAnalyticsLogItem *)self name];
  v5 = objc_msgSend(v3, "hf_fetchLog:timeout:", v4, *(double *)&kHFDataAnalyticsFetchLogTimeout);
  v6 = [v5 flatMap:&__block_literal_global_230];

  return v6;
}

id __34__HFDataAnalyticsLogItem_fetchLog__block_invoke(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = [v2 pathExtension];
  if ([v3 isEqualToString:@"metriclog"])
  {

LABEL_4:
    setupAWDConnection();
    v6 = createDescriptionForMetriclogFile();
    teardownAWDConnection();
LABEL_5:
    v7 = (void *)MEMORY[0x263F58190];
    id v8 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v19 = *MEMORY[0x263F1C240];
    id v9 = [MEMORY[0x263F1C550] labelColor];
    v20[0] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v11 = (void *)[v8 initWithString:v6 attributes:v10];
    v12 = [v7 futureWithResult:v11];

    goto LABEL_6;
  }
  v4 = [v2 pathExtension];
  int v5 = [v4 isEqualToString:@"metriclog.anon"];

  if (v5) {
    goto LABEL_4;
  }
  v14 = [v2 pathExtension];
  int v15 = [v14 isEqualToString:@"plist"];

  if (v15)
  {
    v16 = [NSDictionary dictionaryWithContentsOfFile:v2];
    v6 = [v16 description];

    goto LABEL_5;
  }
  id v18 = 0;
  v6 = [NSString stringWithContentsOfFile:v2 encoding:4 error:&v18];
  id v17 = v18;
  if (!v17) {
    goto LABEL_5;
  }
  id v9 = v17;
  v12 = [MEMORY[0x263F58190] futureWithError:v17];
LABEL_6:

  return v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  int v5 = (void *)MEMORY[0x263F58190];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__HFDataAnalyticsLogItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_26408F0F0;
  objc_copyWeak(&v9, &location);
  v6 = [v5 futureWithBlock:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __54__HFDataAnalyticsLogItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = objc_alloc_init(HFMutableItemUpdateOutcome);
  int v5 = [WeakRetained name];
  v6 = [v5 lastPathComponent];
  [(HFMutableItemUpdateOutcome *)v4 setObject:v6 forKeyedSubscript:@"title"];

  v7 = [WeakRetained mediaProfileContainer];
  id v8 = objc_msgSend(v7, "hf_dependentHomeKitObjectsForDownstreamItems");
  [(HFMutableItemUpdateOutcome *)v4 setObject:v8 forKeyedSubscript:@"dependentHomeKitObjects"];

  id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "isDisplayDisabled"));
  [(HFMutableItemUpdateOutcome *)v4 setObject:v9 forKeyedSubscript:@"isDisabled"];

  [v3 finishWithResult:v4];
}

- (BOOL)isDisplayDisabled
{
  id v2 = [(HFDataAnalyticsLogItem *)self mediaProfileContainer];
  id v3 = [v2 settings];

  if (v3)
  {
    id v4 = [v2 settings];
    LODWORD(v3) = [v4 isControllable] ^ 1;
  }
  return (char)v3;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_2_7 != -1) {
    dispatch_once(&_MergedGlobals_2_7, &__block_literal_global_41_6);
  }
  id v2 = (void *)qword_26AB2EA78;
  return (NAIdentity *)v2;
}

void __37__HFDataAnalyticsLogItem_na_identity__block_invoke_2()
{
  id v4 = [MEMORY[0x263F58198] builder];
  v0 = [v4 appendCharacteristic:&__block_literal_global_45_3];
  v1 = [v0 appendCharacteristic:&__block_literal_global_47_6];
  uint64_t v2 = [v1 build];
  id v3 = (void *)qword_26AB2EA78;
  qword_26AB2EA78 = v2;
}

id __37__HFDataAnalyticsLogItem_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 mediaProfileContainer];
  id v3 = [v2 uniqueIdentifier];

  return v3;
}

uint64_t __37__HFDataAnalyticsLogItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (unint64_t)hash
{
  id v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end