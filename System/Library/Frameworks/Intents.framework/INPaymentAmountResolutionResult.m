@interface INPaymentAmountResolutionResult
- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4;
- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4;
@end

@implementation INPaymentAmountResolutionResult

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 description];
  if ([v6 valueType] == 62 && objc_msgSend(v6, "valueStyle") != 3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v5;
      v9 = [v8 amount];
      v10 = v9;
      if (v9)
      {
        v11 = NSString;
        v12 = [v9 amount];
        v13 = [v12 stringValue];
        v14 = [v10 currencyCode];
        v15 = [v11 stringWithFormat:@"%@ %@", v13, v14];

        v7 = v12;
      }
      else
      {
        v15 = 0;
      }

      uint64_t v16 = [v8 amountType];
      if ((unint64_t)(v16 - 1) > 5) {
        v17 = @"unknown";
      }
      else {
        v17 = off_1E5519570[v16 - 1];
      }
      v18 = v17;
      if (([(__CFString *)v18 isEqualToString:@"unknown"] & 1) == 0)
      {
        v19 = [NSString stringWithFormat:@" (%@)", v18];
        uint64_t v20 = [v15 stringByAppendingString:v19];

        v15 = (void *)v20;
      }

      v7 = v15;
    }
  }

  return v7;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if ([v6 valueType] == 62)
  {
    [(_INPBIntentSlotValue *)v7 setType:1000];
    if ([v6 valueStyle] == 3
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ([v5 firstObject],
          id v8 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v8,
          (isKindOfClass & 1) != 0))
    {
      id v10 = v5;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = INIntentSlotValueTransformToPaymentAmountValue(*(void **)(*((void *)&v17 + 1) + 8 * i));
            [(_INPBIntentSlotValue *)v7 addPayloadPaymentAmountValue:v15];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_17;
      }
      INIntentSlotValueTransformToPaymentAmountValue(v5);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10) {
        [(_INPBIntentSlotValue *)v7 addPayloadPaymentAmountValue:v10];
      }
    }
  }
LABEL_17:

  return v7;
}

@end