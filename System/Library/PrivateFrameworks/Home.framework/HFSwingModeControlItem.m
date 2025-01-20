@interface HFSwingModeControlItem
- (HFSwingModeControlItem)initWithValueSource:(id)a3;
- (HFSwingModeControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 valueTransformer:(id)a5 displayResults:(id)a6;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
@end

@implementation HFSwingModeControlItem

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6 = a4;
  if ([(HFPrimaryStateControlItem *)self canCopyWithCharacteristicOptions:a3])
  {
    v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValueSource:v6];
    [v7 copyLatestResultsFromItem:self];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __46__HFSwingModeControlItem_initWithValueSource___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    if ([a2 integerValue] == 1) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 1;
    }
    v4 = [NSNumber numberWithInteger:v3];
  }
  else
  {
    v4 = &unk_26C0F6648;
  }
  return v4;
}

- (HFSwingModeControlItem)initWithValueSource:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[HFValueTransformer transformerForValueClass:objc_opt_class() transformBlock:&__block_literal_global_62 reverseTransformBlock:&__block_literal_global_10_2];
  v12 = @"title";
  id v6 = _HFLocalizedStringWithDefaultValue(@"HFControlShortTitleSwingMode", @"HFControlShortTitleSwingMode", 1);
  v13[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];

  uint64_t v8 = *MEMORY[0x263F0C488];
  v11.receiver = self;
  v11.super_class = (Class)HFSwingModeControlItem;
  v9 = [(HFPrimaryStateControlItem *)&v11 initWithValueSource:v4 characteristicType:v8 valueTransformer:v5 displayResults:v7];

  return v9;
}

- (HFSwingModeControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 valueTransformer:(id)a5 displayResults:(id)a6
{
  uint64_t v8 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithValueSource_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFSwingModeControlItem.m", 23, @"%s is unavailable; use %@ instead",
    "-[HFSwingModeControlItem initWithValueSource:characteristicType:valueTransformer:displayResults:]",
    v9);

  return 0;
}

uint64_t __46__HFSwingModeControlItem_initWithValueSource___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 isEqualToNumber:&unk_26C0F6660];
  return [v2 numberWithInteger:v3];
}

@end