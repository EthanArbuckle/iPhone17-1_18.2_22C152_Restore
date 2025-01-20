@interface INCodableCurrencyAmountAttributeMetadata
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (INCodableCurrencyAmountAttributeMetadata)initWithCoder:(id)a3;
- (NSArray)currencyCodes;
- (NSString)currencyCode;
- (id)__INCodableDescriptionCurrencyCodeKey;
- (id)__INCodableDescriptionCurrencyCodesKey;
- (id)__INIntentResponseCodableDescriptionCurrencyCodeKey;
- (id)__INIntentResponseCodableDescriptionCurrencyCodesKey;
- (id)__INTypeCodableDescriptionCurrencyCodeKey;
- (id)__INTypeCodableDescriptionCurrencyCodesKey;
- (id)defaultValueForIntentDefaultValueProvider;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableCurrencyAmountAttributeMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCodes, 0);

  objc_storeStrong((id *)&self->_currencyCode, 0);
}

- (NSArray)currencyCodes
{
  return self->_currencyCodes;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (INCodableCurrencyAmountAttributeMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INCodableCurrencyAmountAttributeMetadata;
  v5 = [(INCodableNumberAttributeMetadata *)&v15 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"currencyCodes"];
    currencyCodes = v5->_currencyCodes;
    v5->_currencyCodes = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INCodableCurrencyAmountAttributeMetadata;
  id v4 = a3;
  [(INCodableNumberAttributeMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_currencyCodes, @"currencyCodes", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_currencyCode forKey:@"currencyCode"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)INCodableCurrencyAmountAttributeMetadata;
  id v12 = 0;
  v6 = [(INCodableNumberAttributeMetadata *)&v11 widgetPlistableRepresentationWithParameters:a3 error:&v12];
  id v7 = v12;
  uint64_t v8 = v7;
  if (v7)
  {
    v9 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_currencyCodes, @"currencyCodes");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_currencyCode, @"currencyCode");
    v9 = (void *)[v6 copy];
  }

  return v9;
}

- (id)defaultValueForIntentDefaultValueProvider
{
  v3 = [(INCodableNumberAttributeMetadata *)self defaultValue];
  id v4 = [(INCodableCurrencyAmountAttributeMetadata *)self currencyCode];
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(INCodableCurrencyAmountAttributeMetadata *)self currencyCodes];
    id v6 = [v7 firstObject];
  }
  uint64_t v8 = 0;
  if (v3 && v6)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28C28]);
    [v3 decimalValue];
    uint64_t v10 = (void *)[v9 initWithDecimal:v12];
    uint64_t v8 = [[INCurrencyAmount alloc] initWithAmount:v10 currencyCode:v6];
  }

  return v8;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)INCodableCurrencyAmountAttributeMetadata;
  id v4 = [(INCodableNumberAttributeMetadata *)&v15 dictionaryRepresentationWithLocalizer:a3];
  objc_super v5 = [(INCodableCurrencyAmountAttributeMetadata *)self __INCodableDescriptionCurrencyCodesKey];
  v16[0] = v5;
  id v6 = [(INCodableCurrencyAmountAttributeMetadata *)self currencyCodes];
  id v7 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v7;
  uint64_t v8 = [(INCodableCurrencyAmountAttributeMetadata *)self __INCodableDescriptionCurrencyCodeKey];
  v16[1] = v8;
  id v9 = [(INCodableCurrencyAmountAttributeMetadata *)self currencyCode];
  uint64_t v10 = v9;
  if (!v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v10;
  objc_super v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  id v12 = objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v11);

  if (!v9) {
  if (!v6)
  }

  v13 = objc_msgSend(v12, "if_dictionaryWithNonEmptyValues");

  return v13;
}

- (void)updateWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)INCodableCurrencyAmountAttributeMetadata;
  [(INCodableNumberAttributeMetadata *)&v26 updateWithDictionary:v4];
  v21 = self;
  objc_super v5 = [(INCodableCurrencyAmountAttributeMetadata *)self __INCodableDescriptionCurrencyCodesKey];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(id *)(*((void *)&v22 + 1) + 8 * i);
        if (v15)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v16 = v15;
          }
          else {
            v16 = 0;
          }
        }
        else
        {
          v16 = 0;
        }
        id v17 = v16;

        v18 = [v17 objectForKey:@"CurrencyCode"];

        if (v18)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v9 addObject:v18];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v12);
  }

  uint64_t v19 = [v9 copy];
  currencyCodes = v21->_currencyCodes;
  v21->_currencyCodes = (NSArray *)v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___INCodableCurrencyAmountAttributeMetadata;
  id v17 = 0;
  id v7 = objc_msgSendSuper2(&v16, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v17);
  id v8 = v17;
  id v9 = v8;
  if (v8)
  {
    id v10 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    uint64_t v11 = objc_msgSend(v6, "intents_safeObjectForKey:ofType:", @"currencyCodes", objc_opt_class());
    uint64_t v12 = (void *)v7[10];
    v7[10] = v11;

    uint64_t v13 = objc_msgSend(v6, "intents_stringForKey:", @"currencyCode");
    v14 = (void *)v7[9];
    v7[9] = v13;

    id v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionCurrencyCodesKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableCurrencyAmountAttributeMetadataCurrencyCodesKey");

  return v3;
}

- (id)__INTypeCodableDescriptionCurrencyCodeKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableCurrencyAmountAttributeMetadataCurrencyCodeKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionCurrencyCodesKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableCurrencyAmountAttributeMetadataCurrencyCodesKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionCurrencyCodeKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableCurrencyAmountAttributeMetadataCurrencyCodeKey");

  return v3;
}

- (id)__INCodableDescriptionCurrencyCodesKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableCurrencyAmountAttributeMetadataCurrencyCodesKey");

  return v3;
}

- (id)__INCodableDescriptionCurrencyCodeKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableCurrencyAmountAttributeMetadataCurrencyCodeKey");

  return v3;
}

@end