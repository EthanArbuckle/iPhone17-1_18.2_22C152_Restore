@interface INIntentResponseCodableDescription
+ (BOOL)supportsSecureCoding;
+ (id)__CodesKey;
+ (id)__INCodableAttributeArraySizeSizeClassKey;
+ (id)__INCodableAttributeArraySizeSizeKey;
+ (id)__INCodableAttributeArraySizesKey;
+ (id)__INCodableAttributeConfigurableKey;
+ (id)__INCodableAttributeDefaultKey;
+ (id)__INCodableAttributeDisplayNameIDKey;
+ (id)__INCodableAttributeDisplayNameKey;
+ (id)__INCodableAttributeDisplayPriorityKey;
+ (id)__INCodableAttributeEntityKeypathKey;
+ (id)__INCodableAttributeEnumTypeKey;
+ (id)__INCodableAttributeFixedSizeArrayKey;
+ (id)__INCodableAttributeMetadataKey;
+ (id)__INCodableAttributeMetadataPlaceholderIDKey;
+ (id)__INCodableAttributeMetadataPlaceholderKey;
+ (id)__INCodableAttributeNameKey;
+ (id)__INCodableAttributePromptDialogKey;
+ (id)__INCodableAttributePromptDialogTypeKey;
+ (id)__INCodableAttributePromptDialogsKey;
+ (id)__INCodableAttributeRelationshipKey;
+ (id)__INCodableAttributeRelationshipParentNameKey;
+ (id)__INCodableAttributeRelationshipPredicateNameKey;
+ (id)__INCodableAttributeRelationshipPredicateValueKey;
+ (id)__INCodableAttributeRelationshipPredicateValuesKey;
+ (id)__INCodableAttributeSupportsDynamicEnumerationKey;
+ (id)__INCodableAttributeSupportsMultipleValuesKey;
+ (id)__INCodableAttributeSupportsResolutionKey;
+ (id)__INCodableAttributeSupportsSearchKey;
+ (id)__INCodableAttributeTagKey;
+ (id)__INCodableAttributeTypeKey;
+ (id)__INCodableAttributeUnsupportedReasonCodeKey;
+ (id)__INCodableAttributeUnsupportedReasonKey;
+ (id)__INCodableAttributeUnsupportedReasonsKey;
+ (id)__INCodableAttributeWindowSizeKey;
+ (id)__INCodableBooleanAttributeMetadataDefaultValueKey;
+ (id)__INCodableBooleanAttributeMetadataFalseDisplayNameIDKey;
+ (id)__INCodableBooleanAttributeMetadataFalseDisplayNameKey;
+ (id)__INCodableBooleanAttributeMetadataTrueDisplayNameIDKey;
+ (id)__INCodableBooleanAttributeMetadataTrueDisplayNameKey;
+ (id)__INCodableCurrencyAmountAttributeMetadataCurrencyCodeKey;
+ (id)__INCodableCurrencyAmountAttributeMetadataCurrencyCodesKey;
+ (id)__INCodableCustomObjectAttributeObjectTypeKey;
+ (id)__INCodableCustomObjectAttributeObjectTypeNamespaceKey;
+ (id)__INCodableDateComponentsAttributeMetadataDateStyleKey;
+ (id)__INCodableDateComponentsAttributeMetadataFormatKey;
+ (id)__INCodableDateComponentsAttributeMetadataTemplateIDKey;
+ (id)__INCodableDateComponentsAttributeMetadataTemplateKey;
+ (id)__INCodableDateComponentsAttributeMetadataTimeStyleKey;
+ (id)__INCodableDateComponentsAttributeMetadataTypeKey;
+ (id)__INCodableEnumAttributeEnumTypeKey;
+ (id)__INCodableEnumAttributeEnumTypeNamespaceKey;
+ (id)__INCodableEnumAttributeMetadataDefaultValueKey;
+ (id)__INCodableEnumAttributeMetadataKey;
+ (id)__INCodableFileAttributeMetadataCustomUTIsKey;
+ (id)__INCodableFileAttributeMetadataTypeKey;
+ (id)__INCodableMeasurementAttributeMetadataDefaultUnitKey;
+ (id)__INCodableMeasurementAttributeMetadataDefaultValueKey;
+ (id)__INCodableMeasurementAttributeMetadataSupportsNegativeNumbersKey;
+ (id)__INCodableMeasurementAttributeMetadataUnitKey;
+ (id)__INCodableNumberAttributeMetadataDefaultValueKey;
+ (id)__INCodableNumberAttributeMetadataMaximumValueKey;
+ (id)__INCodableNumberAttributeMetadataMinimumValueKey;
+ (id)__INCodableNumberAttributeMetadataSupportsNegativeNumbersKey;
+ (id)__INCodableNumberAttributeMetadataTypeKey;
+ (id)__INCodableObjectAttributeKey;
+ (id)__INCodableObjectAttributeTypeKey;
+ (id)__INCodablePersonAttributeMetadataKey;
+ (id)__INCodablePersonAttributeMetadataTypeKey;
+ (id)__INCodablePlacemarkAttributeMetadataKey;
+ (id)__INCodablePlacemarkAttributeMetadataTypeKey;
+ (id)__INCodableScalarAttributeKey;
+ (id)__INCodableScalarAttributeTypeKey;
+ (id)__INCodableStringAttributeMetadataCapitalizationKey;
+ (id)__INCodableStringAttributeMetadataDefaultValueIDKey;
+ (id)__INCodableStringAttributeMetadataDefaultValueKey;
+ (id)__INCodableStringAttributeMetadataDisableAutocorrectKey;
+ (id)__INCodableStringAttributeMetadataDisableSmartDashesKey;
+ (id)__INCodableStringAttributeMetadataDisableSmartQuotesKey;
+ (id)__INCodableStringAttributeMetadataMultilineKey;
+ (id)__INCodableTimeIntervalAttributeMetadataDefaultUnitKey;
+ (id)__INCodableTimeIntervalAttributeMetadataDefaultValueKey;
+ (id)__INCodableTimeIntervalAttributeMetadataMaximumUnitKey;
+ (id)__INCodableTimeIntervalAttributeMetadataMaximumValueKey;
+ (id)__INCodableTimeIntervalAttributeMetadataMinimumUnitKey;
+ (id)__INCodableTimeIntervalAttributeMetadataMinimumValueKey;
+ (id)__INCodableTimeIntervalAttributeMetadataUnitKey;
+ (id)__INCodableURLAttributeMetadataDefaultValueKey;
+ (id)__INCodableURLAttributeMetadataKey;
+ (id)__Key;
+ (id)__NameKey;
+ (id)__OutputKey;
+ (id)__ParameterKey;
+ (id)__ParametersKey;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (INCodableAttribute)outputAttribute;
- (INIntentResponseCodableDescription)initWithCoder:(id)a3;
- (NSArray)responseCodes;
- (NSString)_outputAttributeName;
- (id)_attributeKey;
- (id)_attributesKey;
- (id)_ignoredAttributeTags;
- (id)attributes;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)intentResponseCodeWithCode:(int64_t)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)codableDescriptionType;
- (void)_setOutputAttributeName:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setResponseCodes:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INIntentResponseCodableDescription

+ (id)__INCodableObjectAttributeTypeKey
{
  return @"INIntentResponseParameterType";
}

+ (id)__INCodableScalarAttributeTypeKey
{
  return @"INIntentResponseParameterType";
}

- (id)_attributesKey
{
  v2 = objc_opt_class();

  return (id)objc_msgSend(v2, "__ParametersKey");
}

- (id)_attributeKey
{
  v2 = objc_opt_class();

  return (id)objc_msgSend(v2, "__ParameterKey");
}

+ (id)__ParametersKey
{
  return @"INIntentResponseParameters";
}

+ (id)__ParameterKey
{
  return @"INIntentResponseParameter";
}

+ (id)__NameKey
{
  return @"INIntentResponseName";
}

+ (id)__INCodableAttributeWindowSizeKey
{
  return @"INIntentResponseParameterWindowSize";
}

+ (id)__INCodableAttributeUnsupportedReasonsKey
{
  return @"INIntentResponseParameterUnsupportedReasons";
}

+ (id)__INCodableAttributeTagKey
{
  return @"INIntentResponseParameterTag";
}

+ (id)__INCodableAttributeSupportsSearchKey
{
  return @"INIntentResponseParameterSupportsSearch";
}

+ (id)__INCodableAttributeSupportsResolutionKey
{
  return @"INIntentResponseParameterSupportsResolution";
}

+ (id)__INCodableAttributeSupportsMultipleValuesKey
{
  return @"INIntentResponseParameterSupportsMultipleValues";
}

+ (id)__INCodableAttributeSupportsDynamicEnumerationKey
{
  return @"INIntentResponseParameterSupportsDynamicEnumeration";
}

+ (id)__INCodableAttributeRelationshipKey
{
  return @"INIntentResponseParameterRelationship";
}

+ (id)__INCodableAttributePromptDialogsKey
{
  return @"INIntentResponseParameterPromptDialogs";
}

+ (id)__INCodableAttributeNameKey
{
  return @"INIntentResponseParameterName";
}

+ (id)__INCodableAttributeMetadataKey
{
  return @"INIntentResponseParameterMetadata";
}

+ (id)__INCodableAttributeFixedSizeArrayKey
{
  return @"INIntentResponseParameterFixedSizeArray";
}

+ (id)__INCodableAttributeEnumTypeKey
{
  return @"INIntentResponseParameterEnumType";
}

+ (id)__INCodableAttributeEntityKeypathKey
{
  return @"INIntentResponseParameterEntityKeypath";
}

+ (id)__INCodableAttributeDisplayPriorityKey
{
  return @"INIntentResponseParameterDisplayPriority";
}

+ (id)__INCodableAttributeDisplayNameIDKey
{
  return @"INIntentResponseParameterDisplayNameID";
}

+ (id)__INCodableAttributeDisplayNameKey
{
  return @"INIntentResponseParameterDisplayName";
}

+ (id)__INCodableAttributeDefaultKey
{
  return @"INIntentResponseParameterDefault";
}

+ (id)__INCodableAttributeConfigurableKey
{
  return @"INIntentResponseParameterConfigurable";
}

+ (id)__INCodableAttributeArraySizesKey
{
  return @"INIntentResponseParameterArraySizes";
}

+ (id)__INCodableCustomObjectAttributeObjectTypeNamespaceKey
{
  return @"INIntentResponseParameterObjectTypeNamespace";
}

+ (id)__INCodableCustomObjectAttributeObjectTypeKey
{
  return @"INIntentResponseParameterObjectType";
}

+ (id)__INCodableStringAttributeMetadataMultilineKey
{
  return @"INIntentResponseParameterMetadataMultiline";
}

+ (id)__INCodableStringAttributeMetadataDisableSmartQuotesKey
{
  return @"INIntentResponseParameterMetadataDisableSmartQuotes";
}

+ (id)__INCodableStringAttributeMetadataDisableSmartDashesKey
{
  return @"INIntentResponseParameterMetadataDisableSmartDashes";
}

+ (id)__INCodableStringAttributeMetadataDisableAutocorrectKey
{
  return @"INIntentResponseParameterMetadataDisableAutocorrect";
}

+ (id)__INCodableStringAttributeMetadataDefaultValueIDKey
{
  return @"INIntentResponseParameterMetadataDefaultValueID";
}

+ (id)__INCodableStringAttributeMetadataDefaultValueKey
{
  return @"INIntentResponseParameterMetadataDefaultValue";
}

+ (id)__INCodableStringAttributeMetadataCapitalizationKey
{
  return @"INIntentResponseParameterMetadataCapitalization";
}

+ (id)__INCodableAttributeMetadataPlaceholderIDKey
{
  return @"INIntentResponseParameterMetadataPlaceholderID";
}

+ (id)__INCodableAttributeMetadataPlaceholderKey
{
  return @"INIntentResponseParameterMetadataPlaceholder";
}

- (id)attributes
{
  v9.receiver = self;
  v9.super_class = (Class)INIntentResponseCodableDescription;
  v3 = [(INCodableDescription *)&v9 attributes];
  v4 = [v3 objectForKeyedSubscript:&unk_1EDBA7480];

  if (!v4)
  {
    v5 = (void *)[v3 mutableCopy];
    v6 = objc_alloc_init(INCodableScalarAttribute);
    [(INCodableAttribute *)v6 setModifier:1];
    [(INCodableAttribute *)v6 setPropertyName:@"_code"];
    [(INCodableScalarAttribute *)v6 setType:2];
    [v5 setObject:v6 forKeyedSubscript:&unk_1EDBA7480];

    uint64_t v7 = [v5 copy];
    [(INCodableDescription *)self setAttributes:v7];

    v3 = (void *)v7;
  }

  return v3;
}

- (void)updateWithDictionary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)INIntentResponseCodableDescription;
  [(INCodableDescription *)&v29 updateWithDictionary:v4];
  v5 = objc_msgSend((id)objc_opt_class(), "__OutputKey");
  v6 = [v4 objectForKeyedSubscript:v5];
  [(INIntentResponseCodableDescription *)self _setOutputAttributeName:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v8 = objc_msgSend((id)objc_opt_class(), "__CodesKey");
  v23 = v4;
  objc_super v9 = [v4 objectForKeyedSubscript:v8];

  id obj = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    uint64_t v13 = 100;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v16 = objc_alloc_init(INIntentResponseCodableCode);
        [(INIntentResponseCodableCode *)v16 _setCodableDescription:self];
        [(INIntentResponseCodableCode *)v16 updateWithDictionary:v15];
        v17 = [(INIntentResponseCodableCode *)v16 name];
        int v18 = [v17 isEqualToString:@"failure"];

        v19 = v16;
        if (v18)
        {
          uint64_t v20 = 5;
LABEL_10:
          [(INIntentResponseCodableCode *)v19 setValue:v20];
          goto LABEL_12;
        }
        v21 = [(INIntentResponseCodableCode *)v16 name];
        int v22 = [v21 isEqualToString:@"success"];

        v19 = v16;
        if (v22)
        {
          uint64_t v20 = 4;
          goto LABEL_10;
        }
        [(INIntentResponseCodableCode *)v16 setValue:v13++];
LABEL_12:
        [v7 addObject:v16];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v11);
  }

  [(INIntentResponseCodableDescription *)self setResponseCodes:v7];
}

- (void)setResponseCodes:(id)a3
{
}

- (void)_setOutputAttributeName:(id)a3
{
}

+ (id)__OutputKey
{
  return @"INIntentResponseOutput";
}

+ (id)__CodesKey
{
  return @"INIntentResponseCodes";
}

+ (id)__INCodableAttributeUnsupportedReasonCodeKey
{
  return @"INIntentResponseParameterUnsupportedReasonCode";
}

+ (id)__INCodableAttributeUnsupportedReasonKey
{
  return @"INIntentResponseParameterUnsupportedReason";
}

+ (id)__INCodableFileAttributeMetadataTypeKey
{
  return @"INIntentResponseParameterMetadataType";
}

+ (id)__INCodableFileAttributeMetadataCustomUTIsKey
{
  return @"INIntentResponseParameterMetadataCustomUTIs";
}

+ (id)__Key
{
  return @"INIntentResponse";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseCodes, 0);
  objc_storeStrong((id *)&self->_outputAttributeName, 0);

  objc_storeStrong((id *)&self->_intentResponseCodableCodes, 0);
}

- (NSArray)responseCodes
{
  return self->_responseCodes;
}

- (NSString)_outputAttributeName
{
  return self->_outputAttributeName;
}

- (INIntentResponseCodableDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INIntentResponseCodableDescription;
  v5 = [(INRootCodableDescription *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    objc_super v9 = [v4 decodeObjectOfClasses:v8 forKey:@"responseCodes"];
    [(INIntentResponseCodableDescription *)v5 setResponseCodes:v9];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_outputAttributeName"];
    [(INIntentResponseCodableDescription *)v5 _setOutputAttributeName:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)INIntentResponseCodableDescription;
  id v4 = a3;
  [(INRootCodableDescription *)&v7 encodeWithCoder:v4];
  v5 = [(INIntentResponseCodableDescription *)self responseCodes];
  [v4 encodeObject:v5 forKey:@"responseCodes"];

  v6 = [(INIntentResponseCodableDescription *)self _outputAttributeName];
  [v4 encodeObject:v6 forKey:@"_outputAttributeName"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v14.receiver = self;
  v14.super_class = (Class)INIntentResponseCodableDescription;
  id v15 = 0;
  v6 = [(INRootCodableDescription *)&v14 widgetPlistableRepresentationWithParameters:a3 error:&v15];
  id v7 = v15;
  if (v7)
  {
    id v8 = v7;
    if (a4)
    {
LABEL_3:
      id v8 = v8;
      id v9 = 0;
      *a4 = v8;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  uint64_t v10 = [(INIntentResponseCodableDescription *)self responseCodes];
  id v13 = 0;
  objc_msgSend(v6, "intents_setArrayOfWidgetPlistRepresentable:forKey:error:", v10, @"responseCodes", &v13);
  id v8 = v13;

  if (v8)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    id v9 = 0;
    goto LABEL_8;
  }
  uint64_t v11 = [(INIntentResponseCodableDescription *)self _outputAttributeName];
  objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", v11, @"_outputAttributeName");

  id v9 = v6;
LABEL_8:

  return v9;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA48];
  v6 = [(INIntentResponseCodableDescription *)self responseCodes];
  id v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = [(INIntentResponseCodableDescription *)self responseCodes];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v24 + 1) + 8 * i) dictionaryRepresentationWithLocalizer:v4];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v10);
  }

  v23.receiver = self;
  v23.super_class = (Class)INIntentResponseCodableDescription;
  objc_super v14 = [(INCodableDescription *)&v23 dictionaryRepresentationWithLocalizer:v4];
  id v15 = objc_msgSend((id)objc_opt_class(), "__OutputKey");
  v28[0] = v15;
  v16 = [(INIntentResponseCodableDescription *)self _outputAttributeName];
  v17 = v16;
  if (!v16)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[0] = v17;
  int v18 = objc_msgSend((id)objc_opt_class(), "__CodesKey");
  v28[1] = v18;
  v29[1] = v7;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  uint64_t v20 = objc_msgSend(v14, "if_dictionaryByAddingEntriesFromDictionary:", v19);

  if (!v16) {
  v21 = objc_msgSend(v20, "if_dictionaryWithNonEmptyValues");
  }

  return v21;
}

- (id)_ignoredAttributeTags
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:&unk_1EDBA7480];
}

- (INCodableAttribute)outputAttribute
{
  v3 = [(INIntentResponseCodableDescription *)self _outputAttributeName];

  if (v3)
  {
    id v4 = [(INIntentResponseCodableDescription *)self _outputAttributeName];
    v5 = [(INCodableDescription *)self attributeByName:v4];
  }
  else
  {
    v5 = 0;
  }

  return (INCodableAttribute *)v5;
}

- (id)intentResponseCodeWithCode:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  intentResponseCodableCodes = self->_intentResponseCodableCodes;
  if (!intentResponseCodableCodes)
  {
    int64_t v18 = a3;
    v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](self->_responseCodes, "count"));
    v6 = self->_intentResponseCodableCodes;
    self->_intentResponseCodableCodes = v5;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = self->_responseCodes;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v13 = self->_intentResponseCodableCodes;
          objc_super v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "value"));
          [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    intentResponseCodableCodes = self->_intentResponseCodableCodes;
    a3 = v18;
  }
  id v15 = [NSNumber numberWithInteger:a3];
  v16 = [(NSMutableDictionary *)intentResponseCodableCodes objectForKeyedSubscript:v15];

  return v16;
}

- (int64_t)codableDescriptionType
{
  return 5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___INIntentResponseCodableDescription;
  id v16 = 0;
  id v7 = objc_msgSendSuper2(&v15, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v16);
  id v8 = v16;
  if (v8)
  {
    id v9 = v8;
    if (a4)
    {
LABEL_3:
      id v9 = v9;
      id v10 = 0;
      *a4 = v9;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  id v14 = 0;
  uint64_t v11 = +[NSObject intents_arrayOfWidgetPlistRepresentableInDict:v6 key:@"responseCodes" error:&v14 resultTransformer:0];
  id v9 = v14;
  [v7 setResponseCodes:v11];

  if (v9)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    id v10 = 0;
    goto LABEL_8;
  }
  objc_super v12 = objc_msgSend(v6, "intents_stringForKey:", @"_outputAttributeName");
  [v7 _setOutputAttributeName:v12];

  id v10 = v7;
LABEL_8:

  return v10;
}

+ (id)__INCodableObjectAttributeKey
{
  return @"INIntentResponseParameter";
}

+ (id)__INCodableScalarAttributeKey
{
  return @"INIntentResponseParameter";
}

+ (id)__INCodableEnumAttributeEnumTypeNamespaceKey
{
  return @"INIntentResponseParameterEnumTypeNamespace";
}

+ (id)__INCodableEnumAttributeEnumTypeKey
{
  return @"INIntentResponseParameterEnumType";
}

+ (id)__INCodableAttributeTypeKey
{
  return @"INIntentResponseParameterType";
}

+ (id)__INCodableAttributeArraySizeSizeClassKey
{
  return @"INIntentResponseParameterArraySizeSizeClass";
}

+ (id)__INCodableAttributeArraySizeSizeKey
{
  return @"INIntentResponseParameterArraySizeSize";
}

+ (id)__INCodableTimeIntervalAttributeMetadataUnitKey
{
  return @"INIntentResponseParameterMetadataUnit";
}

+ (id)__INCodableTimeIntervalAttributeMetadataMinimumValueKey
{
  return @"INIntentResponseParameterMetadataMinimumValue";
}

+ (id)__INCodableTimeIntervalAttributeMetadataMinimumUnitKey
{
  return @"INIntentResponseParameterMetadataMinimumUnit";
}

+ (id)__INCodableTimeIntervalAttributeMetadataMaximumValueKey
{
  return @"INIntentResponseParameterMetadataMaximumValue";
}

+ (id)__INCodableTimeIntervalAttributeMetadataMaximumUnitKey
{
  return @"INIntentResponseParameterMetadataMaximumUnit";
}

+ (id)__INCodableTimeIntervalAttributeMetadataDefaultValueKey
{
  return @"INIntentResponseParameterMetadataDefaultValue";
}

+ (id)__INCodableTimeIntervalAttributeMetadataDefaultUnitKey
{
  return @"INIntentResponseParameterMetadataDefaultUnit";
}

+ (id)__INCodableBooleanAttributeMetadataTrueDisplayNameIDKey
{
  return @"INIntentResponseParameterMetadataTrueDisplayNameID";
}

+ (id)__INCodableBooleanAttributeMetadataTrueDisplayNameKey
{
  return @"INIntentResponseParameterMetadataTrueDisplayName";
}

+ (id)__INCodableBooleanAttributeMetadataFalseDisplayNameIDKey
{
  return @"INIntentResponseParameterMetadataFalseDisplayNameID";
}

+ (id)__INCodableBooleanAttributeMetadataFalseDisplayNameKey
{
  return @"INIntentResponseParameterMetadataFalseDisplayName";
}

+ (id)__INCodableBooleanAttributeMetadataDefaultValueKey
{
  return @"INIntentResponseParameterMetadataDefaultValue";
}

+ (id)__INCodableCurrencyAmountAttributeMetadataCurrencyCodesKey
{
  return @"INIntentResponseParameterMetadataCurrencyCodes";
}

+ (id)__INCodableCurrencyAmountAttributeMetadataCurrencyCodeKey
{
  return @"INIntentResponseParameterMetadataCurrencyCode";
}

+ (id)__INCodableEnumAttributeMetadataDefaultValueKey
{
  return @"INIntentResponseParameterMetadataDefaultValue";
}

+ (id)__INCodableEnumAttributeMetadataKey
{
  return @"INIntentResponseParameterMetadata";
}

+ (id)__INCodableMeasurementAttributeMetadataUnitKey
{
  return @"INIntentResponseParameterMetadataUnit";
}

+ (id)__INCodableMeasurementAttributeMetadataSupportsNegativeNumbersKey
{
  return @"INIntentResponseParameterMetadataSupportsNegativeNumbers";
}

+ (id)__INCodableMeasurementAttributeMetadataDefaultValueKey
{
  return @"INIntentResponseParameterMetadataDefaultValue";
}

+ (id)__INCodableMeasurementAttributeMetadataDefaultUnitKey
{
  return @"INIntentResponseParameterMetadataDefaultUnit";
}

+ (id)__INCodablePlacemarkAttributeMetadataTypeKey
{
  return @"INIntentResponseParameterMetadataType";
}

+ (id)__INCodablePlacemarkAttributeMetadataKey
{
  return @"INIntentResponseParameterMetadata";
}

+ (id)__INCodablePersonAttributeMetadataTypeKey
{
  return @"INIntentResponseParameterMetadataType";
}

+ (id)__INCodablePersonAttributeMetadataKey
{
  return @"INIntentResponseParameterMetadata";
}

+ (id)__INCodableDateComponentsAttributeMetadataTypeKey
{
  return @"INIntentResponseParameterMetadataType";
}

+ (id)__INCodableDateComponentsAttributeMetadataTimeStyleKey
{
  return @"INIntentResponseParameterMetadataTimeStyle";
}

+ (id)__INCodableDateComponentsAttributeMetadataTemplateIDKey
{
  return @"INIntentResponseParameterMetadataTemplateID";
}

+ (id)__INCodableDateComponentsAttributeMetadataTemplateKey
{
  return @"INIntentResponseParameterMetadataTemplate";
}

+ (id)__INCodableDateComponentsAttributeMetadataFormatKey
{
  return @"INIntentResponseParameterMetadataFormat";
}

+ (id)__INCodableDateComponentsAttributeMetadataDateStyleKey
{
  return @"INIntentResponseParameterMetadataDateStyle";
}

+ (id)__INCodableNumberAttributeMetadataTypeKey
{
  return @"INIntentResponseParameterMetadataType";
}

+ (id)__INCodableNumberAttributeMetadataSupportsNegativeNumbersKey
{
  return @"INIntentResponseParameterMetadataSupportsNegativeNumbers";
}

+ (id)__INCodableNumberAttributeMetadataMinimumValueKey
{
  return @"INIntentResponseParameterMetadataMinimumValue";
}

+ (id)__INCodableNumberAttributeMetadataMaximumValueKey
{
  return @"INIntentResponseParameterMetadataMaximumValue";
}

+ (id)__INCodableNumberAttributeMetadataDefaultValueKey
{
  return @"INIntentResponseParameterMetadataDefaultValue";
}

+ (id)__INCodableAttributePromptDialogTypeKey
{
  return @"INIntentResponseParameterPromptDialogType";
}

+ (id)__INCodableAttributePromptDialogKey
{
  return @"INIntentResponseParameterPromptDialog";
}

+ (id)__INCodableAttributeRelationshipPredicateValuesKey
{
  return @"INIntentResponseParameterRelationshipPredicateValues";
}

+ (id)__INCodableAttributeRelationshipPredicateValueKey
{
  return @"INIntentResponseParameterRelationshipPredicateValue";
}

+ (id)__INCodableAttributeRelationshipPredicateNameKey
{
  return @"INIntentResponseParameterRelationshipPredicateName";
}

+ (id)__INCodableAttributeRelationshipParentNameKey
{
  return @"INIntentResponseParameterRelationshipParentName";
}

+ (id)__INCodableURLAttributeMetadataDefaultValueKey
{
  return @"INIntentResponseParameterMetadataDefaultValue";
}

+ (id)__INCodableURLAttributeMetadataKey
{
  return @"INIntentResponseParameterMetadata";
}

@end