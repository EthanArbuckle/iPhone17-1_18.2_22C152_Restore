@interface INBooleanResolutionResult
+ (INBooleanResolutionResult)successWithResolvedValue:(BOOL)resolvedValue;
- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4;
- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4;
@end

@implementation INBooleanResolutionResult

+ (INBooleanResolutionResult)successWithResolvedValue:(BOOL)resolvedValue
{
  v4 = [NSNumber numberWithBool:resolvedValue];
  v5 = [a1 resolutionResultSuccessWithResolvedValue:v4];

  return (INBooleanResolutionResult *)v5;
}

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 description];
  v8 = [MEMORY[0x1E4F1CA20] systemLocale];
  v9 = [v8 groupingSeparator];
  uint64_t v10 = [v6 valueType];

  if (v10 == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v5 firstObject],
          v11 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v11,
          (isKindOfClass & 1) != 0))
    {
      v13 = [v5 valueForKey:@"stringValue"];
      uint64_t v14 = objc_msgSend(v13, "if_escapedComponentsJoinedByString:forLocale:", v9, v8);

      v7 = v13;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_8;
      }
      uint64_t v14 = [v5 stringValue];
    }

    v7 = (void *)v14;
  }
LABEL_8:

  return v7;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if ([v6 valueType] == 1)
  {
    [(_INPBIntentSlotValue *)v7 setType:100];
    if ([v6 valueStyle] != 3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[_INPBIntentSlotValue addPayloadPrimitiveBool:](v7, "addPayloadPrimitiveBool:", [v5 BOOLValue]);
      }
    }
  }

  return v7;
}

@end