@interface INTypeCodableDescription
+ (BOOL)supportsSecureCoding;
+ (id)__ClassNameKey;
+ (id)__ClassPrefixKey;
+ (id)__DisplayNameIDKey;
+ (id)__DisplayNameKey;
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
+ (id)__PropertiesKey;
+ (id)__PropertyKey;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (INTypeCodableDescription)initWithCoder:(id)a3;
- (NSString)displayName;
- (NSString)displayNameLocID;
- (NSString)localizedDisplayName;
- (id)_attributeKey;
- (id)_attributesKey;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)localizedDisplayNameWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)codableDescriptionType;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplayNameLocID:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INTypeCodableDescription

+ (id)__INCodableObjectAttributeTypeKey
{
  return @"INTypePropertyType";
}

+ (id)__INCodableAttributeWindowSizeKey
{
  return @"INTypePropertyWindowSize";
}

+ (id)__INCodableAttributeUnsupportedReasonsKey
{
  return @"INTypePropertyUnsupportedReasons";
}

+ (id)__INCodableAttributeSupportsSearchKey
{
  return @"INTypePropertySupportsSearch";
}

+ (id)__INCodableAttributeSupportsResolutionKey
{
  return @"INTypePropertySupportsResolution";
}

+ (id)__INCodableAttributeSupportsMultipleValuesKey
{
  return @"INTypePropertySupportsMultipleValues";
}

+ (id)__INCodableAttributeSupportsDynamicEnumerationKey
{
  return @"INTypePropertySupportsDynamicEnumeration";
}

+ (id)__INCodableAttributePromptDialogsKey
{
  return @"INTypePropertyPromptDialogs";
}

+ (id)__INCodableAttributeNameKey
{
  return @"INTypePropertyName";
}

+ (id)__INCodableAttributeMetadataKey
{
  return @"INTypePropertyMetadata";
}

+ (id)__INCodableAttributeFixedSizeArrayKey
{
  return @"INTypePropertyFixedSizeArray";
}

+ (id)__INCodableAttributeDisplayPriorityKey
{
  return @"INTypePropertyDisplayPriority";
}

+ (id)__INCodableAttributeDisplayNameIDKey
{
  return @"INTypePropertyDisplayNameID";
}

+ (id)__INCodableAttributeDisplayNameKey
{
  return @"INTypePropertyDisplayName";
}

+ (id)__INCodableAttributeDefaultKey
{
  return @"INTypePropertyDefault";
}

+ (id)__INCodableAttributeConfigurableKey
{
  return @"INTypePropertyConfigurable";
}

+ (id)__INCodableAttributeArraySizesKey
{
  return @"INTypePropertyArraySizes";
}

- (id)_attributeKey
{
  v2 = objc_opt_class();

  return (id)objc_msgSend(v2, "__PropertyKey");
}

+ (id)__PropertyKey
{
  return @"INTypeProperty";
}

+ (id)__INCodableAttributeTagKey
{
  return @"INTypePropertyTag";
}

+ (id)__INCodableAttributeRelationshipKey
{
  return @"INTypePropertyRelationship";
}

+ (id)__INCodableAttributeEntityKeypathKey
{
  return @"INTypePropertyEntityKeypath";
}

+ (id)__INCodableAttributeEnumTypeKey
{
  return @"INTypePropertyEnumType";
}

+ (id)__INCodableAttributeMetadataPlaceholderIDKey
{
  return @"INTypePropertyMetadataPlaceholderID";
}

+ (id)__INCodableAttributeMetadataPlaceholderKey
{
  return @"INTypePropertyMetadataPlaceholder";
}

+ (id)__INCodableStringAttributeMetadataMultilineKey
{
  return @"INTypePropertyMetadataMultiline";
}

+ (id)__INCodableStringAttributeMetadataDisableSmartQuotesKey
{
  return @"INTypePropertyMetadataDisableSmartQuotes";
}

+ (id)__INCodableStringAttributeMetadataDisableSmartDashesKey
{
  return @"INTypePropertyMetadataDisableSmartDashes";
}

+ (id)__INCodableStringAttributeMetadataDisableAutocorrectKey
{
  return @"INTypePropertyMetadataDisableAutocorrect";
}

+ (id)__INCodableStringAttributeMetadataDefaultValueIDKey
{
  return @"INTypePropertyMetadataDefaultValueID";
}

+ (id)__INCodableStringAttributeMetadataDefaultValueKey
{
  return @"INTypePropertyMetadataDefaultValue";
}

+ (id)__INCodableStringAttributeMetadataCapitalizationKey
{
  return @"INTypePropertyMetadataCapitalization";
}

+ (id)__INCodableScalarAttributeTypeKey
{
  return @"INTypePropertyType";
}

- (id)_attributesKey
{
  v2 = objc_opt_class();

  return (id)objc_msgSend(v2, "__PropertiesKey");
}

+ (id)__PropertiesKey
{
  return @"INTypeProperties";
}

+ (id)__NameKey
{
  return @"INTypeName";
}

+ (id)__INCodableCustomObjectAttributeObjectTypeNamespaceKey
{
  return @"INTypePropertyObjectTypeNamespace";
}

+ (id)__INCodableCustomObjectAttributeObjectTypeKey
{
  return @"INTypePropertyObjectType";
}

+ (id)__INCodableAttributeTypeKey
{
  return @"INTypePropertyType";
}

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)INTypeCodableDescription;
  [(INCodableDescription *)&v23 updateWithDictionary:v4];
  v5 = objc_msgSend((id)objc_opt_class(), "__ClassNameKey");
  v6 = [v4 objectForKeyedSubscript:v5];

  if ([v6 length])
  {
    id v7 = v6;
  }
  else
  {
    v8 = NSString;
    v9 = objc_msgSend((id)objc_opt_class(), "__ClassPrefixKey");
    uint64_t v10 = [v4 objectForKeyedSubscript:v9];
    v11 = (void *)v10;
    if (v10) {
      v12 = (__CFString *)v10;
    }
    else {
      v12 = &stru_1EDA6DB28;
    }
    v13 = [(INCodableDescription *)self typeName];
    id v7 = [v8 stringWithFormat:@"%@%@", v12, v13];
  }
  [(INCodableDescription *)self setClassName:v7];
  v14 = objc_msgSend((id)objc_opt_class(), "__DisplayNameKey");
  v15 = [v4 objectForKeyedSubscript:v14];
  [(INTypeCodableDescription *)self setDisplayName:v15];

  v16 = objc_msgSend((id)objc_opt_class(), "__DisplayNameIDKey");
  uint64_t v17 = [v4 objectForKeyedSubscript:v16];
  [(INTypeCodableDescription *)self setDisplayNameLocID:v17];

  v18 = [(INCodableDescription *)self _nullable_schema];
  LOBYTE(v17) = [v18 isSystem];

  if ((v17 & 1) == 0)
  {
    v19 = [(INCodableDescription *)self attributes];
    v20 = (void *)[v19 mutableCopy];

    v21 = [[INCodableScalarAttribute alloc] initWithPropertyName:@"subtitleString" type:7];
    [(INCodableAttribute *)v21 _setCodableDescription:self];
    [(INCodableAttribute *)v21 setDisplayPriorityRank:&unk_1EDBA74B0];
    [v20 setObject:v21 forKeyedSubscript:&unk_1EDBA74C8];

    v22 = objc_alloc_init(INCodableObjectAttribute);
    [(INCodableAttribute *)v22 _setCodableDescription:self];
    [(INCodableAttribute *)v22 setModifier:1];
    [(INCodableAttribute *)v22 setPropertyName:@"displayImage"];
    [(INCodableObjectAttribute *)v22 setTypeName:@"Image"];
    [(INCodableAttribute *)v22 setDisplayPriorityRank:&unk_1EDBA74B0];
    [v20 setObject:v22 forKeyedSubscript:&unk_1EDBA74E0];

    [(INCodableDescription *)self setAttributes:v20];
  }
}

- (void)setDisplayNameLocID:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

+ (id)__DisplayNameIDKey
{
  return @"INTypeDisplayNameID";
}

+ (id)__DisplayNameKey
{
  return @"INTypeDisplayName";
}

+ (id)__ClassNameKey
{
  return @"INTypeClassName";
}

+ (id)__INCodableEnumAttributeEnumTypeKey
{
  return @"INTypePropertyEnumType";
}

+ (id)__INCodableEnumAttributeEnumTypeNamespaceKey
{
  return @"INTypePropertyEnumTypeNamespace";
}

+ (id)__ClassPrefixKey
{
  return @"INTypeClassPrefix";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INTypeCodableDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INTypeCodableDescription;
  v5 = [(INCodableDescription *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"displayName"];
    [(INTypeCodableDescription *)v5 setDisplayName:v9];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayNameLocID"];
    [(INTypeCodableDescription *)v5 setDisplayNameLocID:v10];
  }
  return v5;
}

+ (id)__INCodableDateComponentsAttributeMetadataTypeKey
{
  return @"INTypePropertyMetadataType";
}

+ (id)__INCodableDateComponentsAttributeMetadataTimeStyleKey
{
  return @"INTypePropertyMetadataTimeStyle";
}

+ (id)__INCodableDateComponentsAttributeMetadataTemplateIDKey
{
  return @"INTypePropertyMetadataTemplateID";
}

+ (id)__INCodableDateComponentsAttributeMetadataTemplateKey
{
  return @"INTypePropertyMetadataTemplate";
}

+ (id)__INCodableDateComponentsAttributeMetadataFormatKey
{
  return @"INTypePropertyMetadataFormat";
}

+ (id)__INCodableDateComponentsAttributeMetadataDateStyleKey
{
  return @"INTypePropertyMetadataDateStyle";
}

+ (id)__INCodableEnumAttributeMetadataDefaultValueKey
{
  return @"INTypePropertyMetadataDefaultValue";
}

+ (id)__INCodableNumberAttributeMetadataMinimumValueKey
{
  return @"INTypePropertyMetadataMinimumValue";
}

+ (id)__INCodableNumberAttributeMetadataMaximumValueKey
{
  return @"INTypePropertyMetadataMaximumValue";
}

+ (id)__INCodableNumberAttributeMetadataTypeKey
{
  return @"INTypePropertyMetadataType";
}

+ (id)__INCodableNumberAttributeMetadataDefaultValueKey
{
  return @"INTypePropertyMetadataDefaultValue";
}

+ (id)__INCodablePlacemarkAttributeMetadataTypeKey
{
  return @"INTypePropertyMetadataType";
}

+ (id)__INCodableBooleanAttributeMetadataTrueDisplayNameIDKey
{
  return @"INTypePropertyMetadataTrueDisplayNameID";
}

+ (id)__INCodableBooleanAttributeMetadataTrueDisplayNameKey
{
  return @"INTypePropertyMetadataTrueDisplayName";
}

+ (id)__INCodableBooleanAttributeMetadataFalseDisplayNameIDKey
{
  return @"INTypePropertyMetadataFalseDisplayNameID";
}

+ (id)__INCodableBooleanAttributeMetadataFalseDisplayNameKey
{
  return @"INTypePropertyMetadataFalseDisplayName";
}

+ (id)__INCodableBooleanAttributeMetadataDefaultValueKey
{
  return @"INTypePropertyMetadataDefaultValue";
}

+ (id)__INCodablePersonAttributeMetadataTypeKey
{
  return @"INTypePropertyMetadataType";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayNameLocID, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

+ (id)__INCodableAttributeUnsupportedReasonCodeKey
{
  return @"INTypePropertyUnsupportedReasonCode";
}

+ (id)__INCodableAttributeUnsupportedReasonKey
{
  return @"INTypePropertyUnsupportedReason";
}

+ (id)__INCodableFileAttributeMetadataTypeKey
{
  return @"INTypePropertyMetadataType";
}

+ (id)__INCodableFileAttributeMetadataCustomUTIsKey
{
  return @"INTypePropertyMetadataCustomUTIs";
}

+ (id)__Key
{
  return @"INType";
}

- (NSString)displayNameLocID
{
  return self->_displayNameLocID;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INTypeCodableDescription;
  id v4 = a3;
  [(INCodableDescription *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayName, @"displayName", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_displayNameLocID forKey:@"displayNameLocID"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INTypeCodableDescription;
  id v14 = 0;
  uint64_t v7 = [(INCodableDescription *)&v13 widgetPlistableRepresentationWithParameters:v6 error:&v14];
  id v8 = v14;
  v9 = v8;
  if (v8)
  {
    id v10 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    v11 = [(NSString *)self->_displayName intents_encodeForPlistRepresentationWithParameters:v6];
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v11, @"displayName");

    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_displayNameLocID, @"displayNameLocID");
    id v10 = v7;
  }

  return v10;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)INTypeCodableDescription;
  id v4 = a3;
  objc_super v5 = [(INCodableDescription *)&v20 dictionaryRepresentationWithLocalizer:v4];
  v19 = objc_msgSend((id)objc_opt_class(), "__ClassNameKey");
  v21[0] = v19;
  uint64_t v6 = [(INCodableDescription *)self className];
  uint64_t v7 = (void *)v6;
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v18 = (void *)v6;
  v22[0] = v6;
  id v8 = objc_msgSend((id)objc_opt_class(), "__DisplayNameKey");
  v21[1] = v8;
  v9 = [(INTypeCodableDescription *)self localizedDisplayNameWithLocalizer:v4];

  id v10 = v9;
  if (!v9)
  {
    id v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[1] = v10;
  v11 = objc_msgSend((id)objc_opt_class(), "__DisplayNameIDKey");
  v21[2] = v11;
  objc_super v12 = [(INTypeCodableDescription *)self displayNameLocID];
  objc_super v13 = v12;
  if (!v12)
  {
    objc_super v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  v15 = objc_msgSend(v5, "if_dictionaryByAddingEntriesFromDictionary:", v14);

  if (!v12) {
  if (!v9)
  }

  if (!v7) {
  v16 = objc_msgSend(v15, "if_dictionaryWithNonEmptyValues");
  }

  return v16;
}

- (id)localizedDisplayNameWithLocalizer:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(INTypeCodableDescription *)self displayNameLocID];
  uint64_t v6 = [(INTypeCodableDescription *)self displayName];
  uint64_t v7 = [(INCodableDescription *)self _localizationTable];
  id v8 = INLocalizedStringFromCodable(v5, v6, v7, v4, 0);

  return v8;
}

- (NSString)localizedDisplayName
{
  v3 = objc_opt_new();
  id v4 = [(INTypeCodableDescription *)self localizedDisplayNameWithLocalizer:v3];

  return (NSString *)v4;
}

- (int64_t)codableDescriptionType
{
  return 3;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___INTypeCodableDescription;
  id v15 = 0;
  uint64_t v7 = objc_msgSendSuper2(&v14, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v15);
  id v8 = v15;
  v9 = v8;
  if (v8)
  {
    id v10 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    v11 = objc_msgSend(v6, "intents_stringForKey:", @"displayName");
    [v7 setDisplayName:v11];

    objc_super v12 = objc_msgSend(v6, "intents_stringForKey:", @"displayNameLocID");
    [v7 setDisplayNameLocID:v12];

    id v10 = v7;
  }

  return v10;
}

+ (id)__INCodableObjectAttributeKey
{
  return @"INTypeProperty";
}

+ (id)__INCodableScalarAttributeKey
{
  return @"INTypeProperty";
}

+ (id)__INCodableAttributeArraySizeSizeClassKey
{
  return @"INTypePropertyArraySizeSizeClass";
}

+ (id)__INCodableAttributeArraySizeSizeKey
{
  return @"INTypePropertyArraySizeSize";
}

+ (id)__INCodableTimeIntervalAttributeMetadataUnitKey
{
  return @"INTypePropertyMetadataUnit";
}

+ (id)__INCodableTimeIntervalAttributeMetadataMinimumValueKey
{
  return @"INTypePropertyMetadataMinimumValue";
}

+ (id)__INCodableTimeIntervalAttributeMetadataMinimumUnitKey
{
  return @"INTypePropertyMetadataMinimumUnit";
}

+ (id)__INCodableTimeIntervalAttributeMetadataMaximumValueKey
{
  return @"INTypePropertyMetadataMaximumValue";
}

+ (id)__INCodableTimeIntervalAttributeMetadataMaximumUnitKey
{
  return @"INTypePropertyMetadataMaximumUnit";
}

+ (id)__INCodableTimeIntervalAttributeMetadataDefaultValueKey
{
  return @"INTypePropertyMetadataDefaultValue";
}

+ (id)__INCodableTimeIntervalAttributeMetadataDefaultUnitKey
{
  return @"INTypePropertyMetadataDefaultUnit";
}

+ (id)__INCodableCurrencyAmountAttributeMetadataCurrencyCodesKey
{
  return @"INTypePropertyMetadataCurrencyCodes";
}

+ (id)__INCodableCurrencyAmountAttributeMetadataCurrencyCodeKey
{
  return @"INTypePropertyMetadataCurrencyCode";
}

+ (id)__INCodableEnumAttributeMetadataKey
{
  return @"INTypePropertyMetadata";
}

+ (id)__INCodableMeasurementAttributeMetadataUnitKey
{
  return @"INTypePropertyMetadataUnit";
}

+ (id)__INCodableMeasurementAttributeMetadataSupportsNegativeNumbersKey
{
  return @"INTypePropertyMetadataSupportsNegativeNumbers";
}

+ (id)__INCodableMeasurementAttributeMetadataDefaultValueKey
{
  return @"INTypePropertyMetadataDefaultValue";
}

+ (id)__INCodableMeasurementAttributeMetadataDefaultUnitKey
{
  return @"INTypePropertyMetadataDefaultUnit";
}

+ (id)__INCodablePlacemarkAttributeMetadataKey
{
  return @"INTypePropertyMetadata";
}

+ (id)__INCodablePersonAttributeMetadataKey
{
  return @"INTypePropertyMetadata";
}

+ (id)__INCodableNumberAttributeMetadataSupportsNegativeNumbersKey
{
  return @"INTypePropertyMetadataSupportsNegativeNumbers";
}

+ (id)__INCodableAttributePromptDialogTypeKey
{
  return @"INTypePropertyPromptDialogType";
}

+ (id)__INCodableAttributePromptDialogKey
{
  return @"INTypePropertyPromptDialog";
}

+ (id)__INCodableAttributeRelationshipPredicateValuesKey
{
  return @"INTypePropertyRelationshipPredicateValues";
}

+ (id)__INCodableAttributeRelationshipPredicateValueKey
{
  return @"INTypePropertyRelationshipPredicateValue";
}

+ (id)__INCodableAttributeRelationshipPredicateNameKey
{
  return @"INTypePropertyRelationshipPredicateName";
}

+ (id)__INCodableAttributeRelationshipParentNameKey
{
  return @"INTypePropertyRelationshipParentName";
}

+ (id)__INCodableURLAttributeMetadataDefaultValueKey
{
  return @"INTypePropertyMetadataDefaultValue";
}

+ (id)__INCodableURLAttributeMetadataKey
{
  return @"INTypePropertyMetadata";
}

@end