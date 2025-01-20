@interface INCallRecordTypeOptionsResolutionResult
+ (INCallRecordTypeOptionsResolutionResult)confirmationRequiredWithCallRecordTypeOptionsToConfirm:(INCallRecordTypeOptions)callRecordTypeOptionsToConfirm;
+ (INCallRecordTypeOptionsResolutionResult)successWithResolvedCallRecordTypeOptions:(INCallRecordTypeOptions)resolvedCallRecordTypeOptions;
- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4;
- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4;
@end

@implementation INCallRecordTypeOptionsResolutionResult

+ (INCallRecordTypeOptionsResolutionResult)confirmationRequiredWithCallRecordTypeOptionsToConfirm:(INCallRecordTypeOptions)callRecordTypeOptionsToConfirm
{
  v4 = [NSNumber numberWithUnsignedInteger:callRecordTypeOptionsToConfirm];
  v5 = [a1 resolutionResultConfirmationRequiredWithItemToConfirm:v4];

  return (INCallRecordTypeOptionsResolutionResult *)v5;
}

+ (INCallRecordTypeOptionsResolutionResult)successWithResolvedCallRecordTypeOptions:(INCallRecordTypeOptions)resolvedCallRecordTypeOptions
{
  v4 = [NSNumber numberWithUnsignedInteger:resolvedCallRecordTypeOptions];
  v5 = [a1 resolutionResultSuccessWithResolvedValue:v4];

  return (INCallRecordTypeOptionsResolutionResult *)v5;
}

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 description];
  v8 = [MEMORY[0x1E4F1CA20] systemLocale];
  v9 = [v8 groupingSeparator];
  uint64_t v10 = [v6 valueType];

  if (v10 == 72)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = INCallRecordTypeOptionsGetNames([v5 unsignedIntegerValue]);
      uint64_t v12 = objc_msgSend(v11, "if_escapedComponentsJoinedByString:forLocale:", v9, v8);

      v7 = (void *)v12;
    }
  }

  return v7;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  uint64_t v8 = [v6 valueType];

  if (v8 == 72)
  {
    [(_INPBIntentSlotValue *)v7 setType:1000];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v5 unsignedIntegerValue];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __85__INCallRecordTypeOptionsResolutionResult__intentSlotValueForObject_slotDescription___block_invoke;
      v11[3] = &unk_1E5520C28;
      uint64_t v12 = v7;
      INCallRecordTypeOptionsEnumerateBackingTypes(v9, v11);
    }
  }

  return v7;
}

uint64_t __85__INCallRecordTypeOptionsResolutionResult__intentSlotValueForObject_slotDescription___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addPayloadCallRecordType:a2];
}

@end