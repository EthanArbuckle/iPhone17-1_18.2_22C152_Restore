@interface HFEventBuilderItem
+ (id)eventBuilderItemForEventBuilders:(id)a3;
- (HFEventBuilder)representativeEventBuilder;
- (HFEventBuilderItem)initWithEventBuilders:(id)a3;
- (HFTriggerNaturalLanguageOptions)naturalLanguageOptions;
- (NSSet)eventBuilders;
- (NSString)comparisonKey;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)setComparisonKey:(id)a3;
- (void)setEventBuilders:(id)a3;
- (void)setNaturalLanguageOptions:(id)a3;
- (void)setRepresentativeEventBuilder:(id)a3;
@end

@implementation HFEventBuilderItem

- (HFEventBuilderItem)initWithEventBuilders:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFEventBuilderItem;
  v6 = [(HFEventBuilderItem *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventBuilders, a3);
    uint64_t v8 = [v5 count];
    if (v8 == 1)
    {
      v9 = [v5 anyObject];
    }
    else
    {
      v9 = 0;
    }
    objc_storeStrong((id *)&v7->_representativeEventBuilder, v9);
    if (v8 == 1) {
  }
    }
  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  id v5 = [(HFEventBuilderItem *)self representativeEventBuilder];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [(HFEventBuilderItem *)self eventBuilders];
    id v7 = [v8 anyObject];
  }
  v9 = [(HFEventBuilderItem *)self naturalLanguageOptions];
  if (!v9)
  {
    v10 = [HFTriggerNaturalLanguageOptions alloc];
    objc_super v11 = +[HFHomeKitDispatcher sharedDispatcher];
    v12 = [v11 home];
    v9 = [(HFTriggerNaturalLanguageOptions *)v10 initWithHome:v12 nameType:1];
  }
  v13 = [(HFEventBuilderItem *)self naturalLanguageOptions];
  v14 = [v7 naturalLanguageNameWithOptions:v13];
  [v4 setObject:v14 forKeyedSubscript:@"title"];

  v15 = (void *)MEMORY[0x263F58190];
  v16 = +[HFItemUpdateOutcome outcomeWithResults:v4];
  v17 = [v15 futureWithResult:v16];

  return v17;
}

+ (id)eventBuilderItemForEventBuilders:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_206);
  if ([v4 count] == 1)
  {
    if ([v4 containsObject:@"HFEventTypeCharacteristic"])
    {
      id v5 = off_26408AEE8;
LABEL_8:
      v6 = (void *)[objc_alloc(*v5) initWithEventBuilders:v3];
      goto LABEL_10;
    }
    if ([v4 containsObject:@"HFEventTypeTime"])
    {
      id v5 = off_26408B960;
      goto LABEL_8;
    }
    if ([v4 containsObject:@"HFEventTypeLocation"])
    {
      id v5 = off_26408B360;
      goto LABEL_8;
    }
  }
  v6 = 0;
LABEL_10:

  return v6;
}

uint64_t __55__HFEventBuilderItem_eventBuilderItemForEventBuilders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 eventType];
}

- (NSSet)eventBuilders
{
  return self->_eventBuilders;
}

- (void)setEventBuilders:(id)a3
{
}

- (HFEventBuilder)representativeEventBuilder
{
  return self->_representativeEventBuilder;
}

- (void)setRepresentativeEventBuilder:(id)a3
{
}

- (HFTriggerNaturalLanguageOptions)naturalLanguageOptions
{
  return self->_naturalLanguageOptions;
}

- (void)setNaturalLanguageOptions:(id)a3
{
}

- (NSString)comparisonKey
{
  return self->_comparisonKey;
}

- (void)setComparisonKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparisonKey, 0);
  objc_storeStrong((id *)&self->_naturalLanguageOptions, 0);
  objc_storeStrong((id *)&self->_representativeEventBuilder, 0);
  objc_storeStrong((id *)&self->_eventBuilders, 0);
}

@end