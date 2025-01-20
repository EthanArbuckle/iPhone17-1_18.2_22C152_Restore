@interface HFCharacteristicEventBuilderItem
- (BOOL)wouldFireForCharacteristic:(id)a3 value:(id)a4;
- (NSSet)characteristics;
- (id)_characteristicEventBuilderForCharacteristic:(id)a3 triggerValue:(id)a4;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)setCharacteristics:(id)a3 triggerValue:(id)a4;
@end

@implementation HFCharacteristicEventBuilderItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HFCharacteristicEventBuilderItem;
  v4 = [(HFEventBuilderItem *)&v8 _subclass_updateWithOptions:a3];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__HFCharacteristicEventBuilderItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_26408E470;
  v7[4] = self;
  v5 = [v4 flatMap:v7];

  return v5;
}

id __64__HFCharacteristicEventBuilderItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)[v3 mutableCopy];
  v5 = [v3 results];

  v6 = (void *)[v5 mutableCopy];
  v7 = objc_msgSend(MEMORY[0x263F0E248], "hf_sensingCharacteristicTypes");
  objc_super v8 = [*(id *)(a1 + 32) characteristics];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __64__HFCharacteristicEventBuilderItem__subclass_updateWithOptions___block_invoke_2;
  v18[3] = &unk_2640903A0;
  id v19 = v7;
  id v9 = v7;
  LODWORD(v7) = objc_msgSend(v8, "na_any:", v18);

  v10 = HFImageIconIdentifierTriggerCharacteristic;
  if (v7) {
    v10 = HFImageIconIdentifierTriggerSensor;
  }
  v11 = *v10;
  v12 = [[HFImageIconDescriptor alloc] initWithImageIdentifier:v11];
  [v6 setObject:v12 forKeyedSubscript:@"icon"];

  v13 = (void *)[v6 copy];
  [v4 setResults:v13];

  v14 = (void *)MEMORY[0x263F58190];
  v15 = (void *)[v4 copy];
  v16 = [v14 futureWithResult:v15];

  return v16;
}

uint64_t __64__HFCharacteristicEventBuilderItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (NSSet)characteristics
{
  v2 = [(HFEventBuilderItem *)self eventBuilders];
  id v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_47_5);

  return (NSSet *)v3;
}

uint64_t __51__HFCharacteristicEventBuilderItem_characteristics__block_invoke(uint64_t a1, void *a2)
{
  return [a2 characteristic];
}

- (id)setCharacteristics:(id)a3 triggerValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(HFEventBuilderItem *)self eventBuilders];
  id v9 = objc_msgSend(v8, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_50_3);

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __68__HFCharacteristicEventBuilderItem_setCharacteristics_triggerValue___block_invoke_2;
  v27[3] = &unk_26409AB70;
  id v10 = v9;
  id v28 = v10;
  v29 = self;
  id v11 = v6;
  id v30 = v11;
  v12 = objc_msgSend(v7, "na_map:", v27);

  v13 = [(HFEventBuilderItem *)self eventBuilders];
  v14 = [(HFEventBuilderItem *)self representativeEventBuilder];
  int v15 = [v13 containsObject:v14];

  v16 = [(HFEventBuilderItem *)self eventBuilders];
  v17 = +[HFSetDiff diffFromSet:v16 toSet:v12];

  v18 = (void *)[v12 copy];
  [(HFEventBuilderItem *)self setEventBuilders:v18];

  id v19 = [(HFEventBuilderItem *)self eventBuilders];
  uint64_t v20 = [v19 count];

  if (v20 == 1)
  {
    v21 = [(HFEventBuilderItem *)self eventBuilders];
    v22 = [v21 anyObject];
    [(HFEventBuilderItem *)self setRepresentativeEventBuilder:v22];
  }
  else if (v15)
  {
    v23 = [(HFEventBuilderItem *)self eventBuilders];
    v24 = [(HFEventBuilderItem *)self representativeEventBuilder];
    char v25 = [v23 containsObject:v24];

    if ((v25 & 1) == 0) {
      [(HFEventBuilderItem *)self setRepresentativeEventBuilder:0];
    }
  }

  return v17;
}

id __68__HFCharacteristicEventBuilderItem_setCharacteristics_triggerValue___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 characteristic];
  id v3 = [v2 uniqueIdentifier];

  return v3;
}

id __68__HFCharacteristicEventBuilderItem_setCharacteristics_triggerValue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v4 uniqueIdentifier];
  id v6 = [v3 objectForKeyedSubscript:v5];

  id v7 = [*(id *)(a1 + 40) _characteristicEventBuilderForCharacteristic:v4 triggerValue:*(void *)(a1 + 48)];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __68__HFCharacteristicEventBuilderItem_setCharacteristics_triggerValue___block_invoke_3;
  v19[3] = &unk_26409AB48;
  id v8 = v7;
  id v20 = v8;
  id v9 = objc_msgSend(v6, "na_firstObjectPassingTest:", v19);
  if (!v9)
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __68__HFCharacteristicEventBuilderItem_setCharacteristics_triggerValue___block_invoke_4;
    v17 = &unk_26409AB48;
    id v10 = v8;
    id v18 = v10;
    id v9 = objc_msgSend(v6, "na_firstObjectPassingTest:", &v14);
    objc_msgSend(v9, "copyValuesFromCharacteristicEventBuilder:", v10, v14, v15, v16, v17);
  }
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = v8;
  }
  id v12 = v11;

  return v12;
}

uint64_t __68__HFCharacteristicEventBuilderItem_setCharacteristics_triggerValue___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

uint64_t __68__HFCharacteristicEventBuilderItem_setCharacteristics_triggerValue___block_invoke_4()
{
  v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  return [v0 isEqual:v1];
}

- (BOOL)wouldFireForCharacteristic:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HFEventBuilderItem *)self eventBuilders];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__HFCharacteristicEventBuilderItem_wouldFireForCharacteristic_value___block_invoke;
  v13[3] = &unk_26409AB98;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  char v11 = objc_msgSend(v8, "na_any:", v13);

  return v11;
}

uint64_t __69__HFCharacteristicEventBuilderItem_wouldFireForCharacteristic_value___block_invoke(uint64_t a1, void *a2)
{
  return [a2 wouldFireForCharacteristic:*(void *)(a1 + 32) value:*(void *)(a1 + 40)];
}

- (id)_characteristicEventBuilderForCharacteristic:(id)a3 triggerValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = [[HFCharacteristicThresholdRangeEventBuilder alloc] initWithCharacteristic:v5 thresholdRange:v9];
  }
  else
  {
    if (v7)
    {
      id v12 = objc_msgSend(MEMORY[0x263F0E310], "hf_allTriggerValuesForCharacteristic:similarToValue:", v5, v7);
      if ([v12 count] == 1)
      {
        v13 = [HFCharacteristicValueEventBuilder alloc];
        id v14 = [v12 anyObject];
        char v11 = [(HFCharacteristicValueEventBuilder *)v13 initWithCharacteristic:v5 triggerValue:v14];
      }
      else
      {
        char v11 = [[HFCharacteristicMultiValueEventBuilder alloc] initWithCharacteristic:v5 values:v12];
      }

      goto LABEL_13;
    }
    id v10 = [[HFCharacteristicValueEventBuilder alloc] initWithCharacteristic:v5 triggerValue:0];
  }
  char v11 = (HFCharacteristicMultiValueEventBuilder *)v10;
LABEL_13:

  return v11;
}

@end