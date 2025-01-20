@interface INCodableAttribute
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isConfigurable;
- (BOOL)isDefaultAttribute;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFixedSizeArray;
- (BOOL)supportsDynamicEnumeration;
- (BOOL)supportsResolution;
- (BOOL)supportsSearch;
- (Class)_relationshipValueTransformerClass;
- (Class)objectClass;
- (Class)resolutionResultClass;
- (INCodableAttribute)initWithCoder:(id)a3;
- (INCodableAttributeMetadata)metadata;
- (INCodableAttributeRelationship)relationship;
- (INCodableDescription)_codableDescription;
- (NSArray)promptDialogs;
- (NSArray)unsupportedReasons;
- (NSNumber)displayPriorityRank;
- (NSString)_typeString;
- (NSString)description;
- (NSString)displayName;
- (NSString)displayNameID;
- (NSString)entityKeypath;
- (NSString)languageCode;
- (NSString)localizedDisplayName;
- (NSString)propertyName;
- (SEL)getter;
- (SEL)setter;
- (id)__INCodableDescriptionArraySizeSizeClassKey;
- (id)__INCodableDescriptionArraySizeSizeKey;
- (id)__INCodableDescriptionArraySizesKey;
- (id)__INCodableDescriptionConfigurableKey;
- (id)__INCodableDescriptionDefaultKey;
- (id)__INCodableDescriptionDisplayNameIDKey;
- (id)__INCodableDescriptionDisplayNameKey;
- (id)__INCodableDescriptionDisplayPriorityKey;
- (id)__INCodableDescriptionEntityKeypathKey;
- (id)__INCodableDescriptionEnumTypeKey;
- (id)__INCodableDescriptionFixedSizeArrayKey;
- (id)__INCodableDescriptionMetadataKey;
- (id)__INCodableDescriptionNameKey;
- (id)__INCodableDescriptionPromptDialogsKey;
- (id)__INCodableDescriptionRelationshipKey;
- (id)__INCodableDescriptionSupportsDynamicEnumerationKey;
- (id)__INCodableDescriptionSupportsMultipleValuesKey;
- (id)__INCodableDescriptionSupportsResolutionKey;
- (id)__INCodableDescriptionSupportsSearchKey;
- (id)__INCodableDescriptionTagKey;
- (id)__INCodableDescriptionTypeKey;
- (id)__INCodableDescriptionUnsupportedReasonsKey;
- (id)__INCodableDescriptionWindowSizeKey;
- (id)__INIntentResponseCodableDescriptionArraySizeSizeClassKey;
- (id)__INIntentResponseCodableDescriptionArraySizeSizeKey;
- (id)__INIntentResponseCodableDescriptionArraySizesKey;
- (id)__INIntentResponseCodableDescriptionConfigurableKey;
- (id)__INIntentResponseCodableDescriptionDefaultKey;
- (id)__INIntentResponseCodableDescriptionDisplayNameIDKey;
- (id)__INIntentResponseCodableDescriptionDisplayNameKey;
- (id)__INIntentResponseCodableDescriptionDisplayPriorityKey;
- (id)__INIntentResponseCodableDescriptionEntityKeypathKey;
- (id)__INIntentResponseCodableDescriptionEnumTypeKey;
- (id)__INIntentResponseCodableDescriptionFixedSizeArrayKey;
- (id)__INIntentResponseCodableDescriptionMetadataKey;
- (id)__INIntentResponseCodableDescriptionNameKey;
- (id)__INIntentResponseCodableDescriptionPromptDialogsKey;
- (id)__INIntentResponseCodableDescriptionRelationshipKey;
- (id)__INIntentResponseCodableDescriptionSupportsDynamicEnumerationKey;
- (id)__INIntentResponseCodableDescriptionSupportsMultipleValuesKey;
- (id)__INIntentResponseCodableDescriptionSupportsResolutionKey;
- (id)__INIntentResponseCodableDescriptionSupportsSearchKey;
- (id)__INIntentResponseCodableDescriptionTagKey;
- (id)__INIntentResponseCodableDescriptionTypeKey;
- (id)__INIntentResponseCodableDescriptionUnsupportedReasonsKey;
- (id)__INIntentResponseCodableDescriptionWindowSizeKey;
- (id)__INTypeCodableDescriptionArraySizeSizeClassKey;
- (id)__INTypeCodableDescriptionArraySizeSizeKey;
- (id)__INTypeCodableDescriptionArraySizesKey;
- (id)__INTypeCodableDescriptionConfigurableKey;
- (id)__INTypeCodableDescriptionDefaultKey;
- (id)__INTypeCodableDescriptionDisplayNameIDKey;
- (id)__INTypeCodableDescriptionDisplayNameKey;
- (id)__INTypeCodableDescriptionDisplayPriorityKey;
- (id)__INTypeCodableDescriptionEntityKeypathKey;
- (id)__INTypeCodableDescriptionEnumTypeKey;
- (id)__INTypeCodableDescriptionFixedSizeArrayKey;
- (id)__INTypeCodableDescriptionMetadataKey;
- (id)__INTypeCodableDescriptionNameKey;
- (id)__INTypeCodableDescriptionPromptDialogsKey;
- (id)__INTypeCodableDescriptionRelationshipKey;
- (id)__INTypeCodableDescriptionSupportsDynamicEnumerationKey;
- (id)__INTypeCodableDescriptionSupportsMultipleValuesKey;
- (id)__INTypeCodableDescriptionSupportsResolutionKey;
- (id)__INTypeCodableDescriptionSupportsSearchKey;
- (id)__INTypeCodableDescriptionTagKey;
- (id)__INTypeCodableDescriptionTypeKey;
- (id)__INTypeCodableDescriptionUnsupportedReasonsKey;
- (id)__INTypeCodableDescriptionWindowSizeKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionAtIndent:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)localizedDisplayNameWithLocalizer:(id)a3;
- (id)promptDialogWithType:(unint64_t)a3;
- (id)unsupportedReasonWithIndex:(unint64_t)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)_attributeType;
- (int64_t)arraySizeForSizeClass:(id)a3;
- (int64_t)modifier;
- (int64_t)valueType;
- (int64_t)windowSize;
- (unint64_t)hash;
- (unint64_t)indexForUnsupportedReason:(id)a3;
- (void)_setCodableDescription:(id)a3;
- (void)_setPromptDialogs:(id)a3;
- (void)_setTypeString:(id)a3;
- (void)_setUnsupportedReasons:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setConfigurable:(BOOL)a3;
- (void)setDefaultAttribute:(BOOL)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplayNameID:(id)a3;
- (void)setDisplayPriorityRank:(id)a3;
- (void)setEntityKeypath:(id)a3;
- (void)setFixedSizeArray:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setModifier:(int64_t)a3;
- (void)setPropertyName:(id)a3;
- (void)setRelationship:(id)a3;
- (void)setSupportsDynamicEnumeration:(BOOL)a3;
- (void)setSupportsResolution:(BOOL)a3;
- (void)setSupportsSearch:(BOOL)a3;
- (void)setWindowSize:(int64_t)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableAttribute

- (INCodableAttribute)initWithCoder:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)INCodableAttribute;
  v5 = [(INCodableAttribute *)&v48 init];
  if (v5)
  {
    -[INCodableAttribute setModifier:](v5, "setModifier:", [v4 decodeIntegerForKey:@"modifier"]);
    -[INCodableAttribute setFixedSizeArray:](v5, "setFixedSizeArray:", [v4 decodeBoolForKey:@"fixedSizeArray"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"propertyName"];
    [(INCodableAttribute *)v5 setPropertyName:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayPriorityRank"];
    [(INCodableAttribute *)v5 setDisplayPriorityRank:v7];

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"displayName"];
    [(INCodableAttribute *)v5 setDisplayName:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayNameID"];
    [(INCodableAttribute *)v5 setDisplayNameID:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
    [(INCodableAttribute *)v5 setMetadata:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relationship"];
    [(INCodableAttribute *)v5 setRelationship:v14];

    -[INCodableAttribute setSupportsResolution:](v5, "setSupportsResolution:", [v4 decodeBoolForKey:@"supportsResolution"]);
    -[INCodableAttribute setConfigurable:](v5, "setConfigurable:", [v4 decodeBoolForKey:@"configurable"]);
    -[INCodableAttribute setSupportsDynamicEnumeration:](v5, "setSupportsDynamicEnumeration:", [v4 decodeBoolForKey:@"supportsDynamicEnumeration"]);
    -[INCodableAttribute setSupportsSearch:](v5, "setSupportsSearch:", [v4 decodeBoolForKey:@"supportsSearch"]);
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v18 = [v4 decodeObjectOfClasses:v17 forKey:@"promptDialogs"];
    [(INCodableAttribute *)v5 _setPromptDialogs:v18];

    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v22 = [v4 decodeObjectOfClasses:v21 forKey:@"unsupportedReasons"];
    [(INCodableAttribute *)v5 _setUnsupportedReasons:v22];

    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_codableDescription"];
    [(INCodableAttribute *)v5 _setCodableDescription:v23];

    v43 = v4;
    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_typeString"];
    [(INCodableAttribute *)v5 _setTypeString:v24];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v25 = [(INCodableAttribute *)v5 promptDialogs];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v45;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v45 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v44 + 1) + 8 * v29);
          promptDialogsByType = v5->_promptDialogsByType;
          if (!promptDialogsByType)
          {
            v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            v33 = v5->_promptDialogsByType;
            v5->_promptDialogsByType = v32;

            promptDialogsByType = v5->_promptDialogsByType;
          }
          v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v30, "type"));
          [(NSMutableDictionary *)promptDialogsByType setObject:v30 forKeyedSubscript:v34];

          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v27);
    }

    id v4 = v43;
    v35 = [v43 decodeObjectOfClass:objc_opt_class() forKey:@"entityKeypath"];
    [(INCodableAttribute *)v5 setEntityKeypath:v35];

    v36 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v37 = objc_opt_class();
    uint64_t v38 = objc_opt_class();
    v39 = objc_msgSend(v36, "setWithObjects:", v37, v38, objc_opt_class(), 0);
    uint64_t v40 = [v43 decodeObjectOfClasses:v39 forKey:@"_arraySizesBySizeClass"];
    arraySizesBySizeClass = v5->_arraySizesBySizeClass;
    v5->_arraySizesBySizeClass = (NSDictionary *)v40;

    -[INCodableAttribute setWindowSize:](v5, "setWindowSize:", [v43 decodeIntegerForKey:@"windowSize"]);
  }

  return v5;
}

- (void)setPropertyName:(id)a3
{
}

- (void)setModifier:(int64_t)a3
{
  self->_modifier = a3;
}

- (void)setDisplayPriorityRank:(id)a3
{
}

- (void)setWindowSize:(int64_t)a3
{
  self->_windowSize = a3;
}

- (void)setSupportsSearch:(BOOL)a3
{
  self->_supportsSearch = a3;
}

- (void)setSupportsResolution:(BOOL)a3
{
  self->_supportsResolution = a3;
}

- (void)setSupportsDynamicEnumeration:(BOOL)a3
{
  self->_supportsDynamicEnumeration = a3;
}

- (void)setRelationship:(id)a3
{
}

- (void)setMetadata:(id)a3
{
}

- (void)setFixedSizeArray:(BOOL)a3
{
  self->_fixedSizeArray = a3;
}

- (void)setEntityKeypath:(id)a3
{
}

- (void)setDisplayNameID:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (void)setConfigurable:(BOOL)a3
{
  self->_configurable = a3;
}

- (NSArray)promptDialogs
{
  return self->_promptDialogs;
}

- (void)_setUnsupportedReasons:(id)a3
{
}

- (void)_setTypeString:(id)a3
{
}

- (void)_setPromptDialogs:(id)a3
{
}

- (INCodableAttributeRelationship)relationship
{
  return self->_relationship;
}

- (void)_setCodableDescription:(id)a3
{
}

- (id)__INCodableDescriptionTagKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeTagKey");

  return v3;
}

- (void)updateWithDictionary:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(INCodableAttribute *)self __INCodableDescriptionNameKey];
  v6 = [v4 objectForKeyedSubscript:v5];
  v7 = objc_msgSend(v6, "if_stringByLowercasingFirstCharacter");
  v8 = (NSString *)[v7 copy];
  propertyName = self->_propertyName;
  self->_propertyName = v8;

  v10 = [(INCodableAttribute *)self __INCodableDescriptionDisplayNameKey];
  v11 = [v4 objectForKeyedSubscript:v10];
  displayName = self->_displayName;
  self->_displayName = v11;

  v13 = [(INCodableAttribute *)self __INCodableDescriptionDisplayNameIDKey];
  v14 = [v4 objectForKeyedSubscript:v13];
  displayNameID = self->_displayNameID;
  self->_displayNameID = v14;

  uint64_t v16 = [(INCodableAttribute *)self __INCodableDescriptionDisplayPriorityKey];
  v17 = [v4 objectForKeyedSubscript:v16];
  displayPriorityRank = self->_displayPriorityRank;
  self->_displayPriorityRank = v17;

  v19 = [(INCodableAttribute *)self __INCodableDescriptionDefaultKey];
  uint64_t v20 = [v4 objectForKeyedSubscript:v19];
  self->_defaultAttribute = [v20 BOOLValue];

  v21 = [(INCodableAttribute *)self __INCodableDescriptionSupportsResolutionKey];
  v22 = [v4 objectForKeyedSubscript:v21];
  self->_supportsResolution = [v22 BOOLValue];

  v23 = [(INCodableAttribute *)self __INCodableDescriptionSupportsDynamicEnumerationKey];
  v24 = [v4 objectForKeyedSubscript:v23];
  self->_supportsDynamicEnumeration = [v24 BOOLValue];

  v25 = [(INCodableAttribute *)self __INCodableDescriptionSupportsSearchKey];
  uint64_t v26 = [v4 objectForKeyedSubscript:v25];
  self->_supportsSearch = [v26 BOOLValue];

  uint64_t v27 = [(INCodableAttribute *)self __INCodableDescriptionConfigurableKey];
  uint64_t v28 = [v4 objectForKeyedSubscript:v27];
  self->_configurable = [v28 BOOLValue];

  uint64_t v29 = [(INCodableAttribute *)self __INCodableDescriptionWindowSizeKey];
  v30 = [v4 objectForKeyedSubscript:v29];

  if (v30)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v31 = v30;
    }
    else {
      v31 = 0;
    }
  }
  else
  {
    v31 = 0;
  }
  id v32 = v31;

  if ([v32 integerValue] < 1) {
    int64_t v33 = 6;
  }
  else {
    int64_t v33 = [v32 integerValue];
  }

  self->_windowSize = v33;
  v34 = [(INCodableAttribute *)self __INCodableDescriptionSupportsMultipleValuesKey];
  v35 = [v4 objectForKeyedSubscript:v34];
  int v36 = [v35 BOOLValue];

  self->_modifier = v36 ^ 1u;
  uint64_t v37 = [(INCodableAttribute *)self __INCodableDescriptionFixedSizeArrayKey];
  uint64_t v38 = [v4 objectForKeyedSubscript:v37];
  self->_fixedSizeArray = [v38 BOOLValue];

  v39 = [(INCodableAttribute *)self __INCodableDescriptionPromptDialogsKey];
  uint64_t v40 = [v4 objectForKeyedSubscript:v39];

  if (v40)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v41 = v40;
    }
    else {
      v41 = 0;
    }
  }
  else
  {
    v41 = 0;
  }
  id v42 = v41;

  v94[0] = MEMORY[0x1E4F143A8];
  v94[1] = 3221225472;
  v94[2] = __43__INCodableAttribute_updateWithDictionary___block_invoke;
  v94[3] = &unk_1E5519500;
  v94[4] = self;
  v87 = v42;
  v43 = objc_msgSend(v42, "if_map:", v94);
  objc_storeStrong((id *)&self->_promptDialogs, v43);
  long long v44 = [(INCodableAttribute *)self __INCodableDescriptionArraySizesKey];
  long long v45 = [v4 objectForKeyedSubscript:v44];

  if (v45)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v46 = v45;
    }
    else {
      long long v46 = 0;
    }
  }
  else
  {
    long long v46 = 0;
  }
  id v47 = v46;

  v86 = v47;
  if ([v47 count])
  {
    v84 = v43;
    id v85 = v4;
    id obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v47, "count"));
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v48 = v47;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v90 objects:v95 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v91;
      do
      {
        uint64_t v52 = 0;
        do
        {
          if (*(void *)v91 != v51) {
            objc_enumerationMutation(v48);
          }
          v53 = *(void **)(*((void *)&v90 + 1) + 8 * v52);
          v54 = [(INCodableAttribute *)self __INCodableDescriptionArraySizeSizeClassKey];
          v55 = [v53 objectForKeyedSubscript:v54];

          if (INCodableAttributeAvailableArraySizeClasses_onceToken != -1) {
            dispatch_once(&INCodableAttributeAvailableArraySizeClasses_onceToken, &__block_literal_global_47473);
          }
          if ([(id)INCodableAttributeAvailableArraySizeClasses_codableAvailableArraySizeClasses containsObject:v55])
          {
            v56 = [(INCodableAttribute *)self __INCodableDescriptionArraySizeSizeKey];
            v57 = [v53 objectForKeyedSubscript:v56];
            objc_msgSend(obj, "if_setObjectIfNonNil:forKey:", v57, v55);
          }
          ++v52;
        }
        while (v50 != v52);
        uint64_t v50 = [v48 countByEnumeratingWithState:&v90 objects:v95 count:16];
      }
      while (v50);
    }

    v43 = v84;
    id v4 = v85;
    v58 = obj;
  }
  else
  {
    v58 = (void *)MEMORY[0x1E4F1CC08];
  }
  objc_storeStrong((id *)&self->_arraySizesBySizeClass, v58);
  v59 = [(INCodableAttribute *)self __INCodableDescriptionUnsupportedReasonsKey];
  v60 = [v4 objectForKeyedSubscript:v59];

  if (v60)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v61 = v60;
    }
    else {
      v61 = 0;
    }
  }
  else
  {
    v61 = 0;
  }
  id v62 = v61;

  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __43__INCodableAttribute_updateWithDictionary___block_invoke_2;
  v89[3] = &unk_1E5519500;
  v89[4] = self;
  objc_msgSend(v62, "if_map:", v89);
  v63 = (NSArray *)objc_claimAutoreleasedReturnValue();

  unsupportedReasons = self->_unsupportedReasons;
  self->_unsupportedReasons = v63;

  v65 = [(INCodableAttribute *)self __INCodableDescriptionMetadataKey];
  v66 = [v4 objectForKeyedSubscript:v65];

  v67 = [(INCodableAttribute *)self __INCodableDescriptionTypeKey];
  v68 = [v4 objectForKeyedSubscript:v67];
  typeString = self->_typeString;
  self->_typeString = v68;

  v70 = [(INCodableAttribute *)self __INCodableDescriptionEnumTypeKey];
  v71 = [v4 objectForKeyedSubscript:v70];
  if (v71)
  {
    v72 = @"Enum";
    v73 = @"Enum";
  }
  else
  {
    INCodableAttributeMetadataTypeNameWithTypeName(self->_typeString);
    v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  v74 = (objc_class *)INCodableAttributeMetadataClassWithMetadataTypeName(v72);
  if (v74) {
    v75 = (INCodableAttributeMetadata *)[[v74 alloc] initWithName:v72 codableAttribute:self];
  }
  else {
    v75 = 0;
  }
  -[INCodableAttributeMetadata updateWithDictionary:](v75, "updateWithDictionary:", v66, v84, v85);
  metadata = self->_metadata;
  self->_metadata = v75;

  v77 = [[INCodableAttributeRelationship alloc] initWithCodableAttribute:self];
  v78 = [(INCodableAttribute *)self __INCodableDescriptionRelationshipKey];
  v79 = [v4 objectForKeyedSubscript:v78];
  [(INCodableAttributeRelationship *)v77 updateWithDictionary:v79];

  relationship = self->_relationship;
  self->_relationship = v77;

  v81 = [(INCodableAttribute *)self __INCodableDescriptionEntityKeypathKey];
  v82 = [v4 objectForKeyedSubscript:v81];
  entityKeypath = self->_entityKeypath;
  self->_entityKeypath = v82;
}

- (id)__INCodableDescriptionWindowSizeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeWindowSizeKey");

  return v3;
}

- (id)__INCodableDescriptionSupportsSearchKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsSearchKey");

  return v3;
}

- (id)__INCodableDescriptionSupportsResolutionKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsResolutionKey");

  return v3;
}

- (id)__INCodableDescriptionSupportsMultipleValuesKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsMultipleValuesKey");

  return v3;
}

- (id)__INCodableDescriptionSupportsDynamicEnumerationKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsDynamicEnumerationKey");

  return v3;
}

- (id)__INCodableDescriptionPromptDialogsKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogsKey");

  return v3;
}

- (id)__INCodableDescriptionNameKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeNameKey");

  return v3;
}

- (id)__INCodableDescriptionFixedSizeArrayKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeFixedSizeArrayKey");

  return v3;
}

- (id)__INCodableDescriptionDisplayPriorityKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDisplayPriorityKey");

  return v3;
}

- (INCodableDescription)_codableDescription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalCodableDescription);

  return (INCodableDescription *)WeakRetained;
}

- (id)__INCodableDescriptionDisplayNameIDKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDisplayNameIDKey");

  return v3;
}

- (id)__INCodableDescriptionDisplayNameKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDisplayNameKey");

  return v3;
}

- (id)__INCodableDescriptionDefaultKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDefaultKey");

  return v3;
}

- (id)__INCodableDescriptionConfigurableKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeConfigurableKey");

  return v3;
}

- (id)__INCodableDescriptionUnsupportedReasonsKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonsKey");

  return v3;
}

- (id)__INCodableDescriptionMetadataKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeMetadataKey");

  return v3;
}

- (id)__INCodableDescriptionArraySizesKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeArraySizesKey");

  return v3;
}

- (id)__INCodableDescriptionRelationshipKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipKey");

  return v3;
}

- (id)__INCodableDescriptionEntityKeypathKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeEntityKeypathKey");

  return v3;
}

- (id)__INCodableDescriptionEnumTypeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeEnumTypeKey");

  return v3;
}

- (id)__INCodableDescriptionTypeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeTypeKey");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if (![v5 isMemberOfClass:objc_opt_class()])
  {
    char v9 = 0;
    goto LABEL_21;
  }
  v6 = [(INCodableAttribute *)self propertyName];
  if (v6)
  {
    v3 = [(INCodableAttribute *)self propertyName];
    id v7 = v5;
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    id v11 = v8;

    v12 = [v11 propertyName];

    char v10 = [v3 isEqual:v12];
  }
  else
  {
    char v10 = 0;
  }

  v13 = [(INCodableAttribute *)self displayPriorityRank];
  if (!v13)
  {
    v3 = [v5 displayPriorityRank];
    if (!v3)
    {
      char v16 = 1;
LABEL_16:

      goto LABEL_17;
    }
  }
  v14 = [(INCodableAttribute *)self displayPriorityRank];
  v15 = [v5 displayPriorityRank];
  char v16 = [v14 isEqual:v15];

  if (!v13) {
    goto LABEL_16;
  }
LABEL_17:

  int64_t v17 = [(INCodableAttribute *)self modifier];
  if (v17 == [v5 modifier]) {
    char v18 = v10;
  }
  else {
    char v18 = 0;
  }
  char v9 = v18 & v16;
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  v3 = [(INCodableAttribute *)self propertyName];
  uint64_t v4 = [v3 hash];
  id v5 = [(INCodableAttribute *)self displayPriorityRank];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[INCodableAttribute modifier](self, "modifier"));
  uint64_t v8 = [v7 hash];
  v11.receiver = self;
  v11.super_class = (Class)INCodableAttribute;
  unint64_t v9 = v6 ^ [(INCodableAttribute *)&v11 hash] ^ v8;

  return v9;
}

- (NSNumber)displayPriorityRank
{
  return self->_displayPriorityRank;
}

- (int64_t)modifier
{
  return self->_modifier;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (BOOL)supportsResolution
{
  return self->_supportsResolution;
}

- (BOOL)supportsDynamicEnumeration
{
  return self->_supportsDynamicEnumeration;
}

INCodableAttributePromptDialog *__43__INCodableAttribute_updateWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(INCodableAttributePromptDialog);
  [(INCodableAttributeDialog *)v4 _setCodableAttribute:*(void *)(a1 + 32)];
  [(INCodableAttributePromptDialog *)v4 updateWithDictionary:v3];

  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 8);
    *(void *)(v7 + 8) = v6;

    id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  unint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[INCodableAttributePromptDialog type](v4, "type"));
  [v5 setObject:v4 forKeyedSubscript:v9];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__relationshipValueTransformerClass, 0);
  objc_storeStrong((id *)&self->_displayPriorityRank, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_promptDialogs, 0);
  objc_storeStrong((id *)&self->_entityKeypath, 0);
  objc_storeStrong((id *)&self->_unsupportedReasons, 0);
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_displayNameID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_destroyWeak((id *)&self->_internalCodableDescription);
  objc_storeStrong((id *)&self->_arraySizesBySizeClass, 0);

  objc_storeStrong((id *)&self->_promptDialogsByType, 0);
}

- (Class)_relationshipValueTransformerClass
{
  return self->__relationshipValueTransformerClass;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (int64_t)windowSize
{
  return self->_windowSize;
}

- (NSString)entityKeypath
{
  return self->_entityKeypath;
}

- (NSArray)unsupportedReasons
{
  return self->_unsupportedReasons;
}

- (INCodableAttributeMetadata)metadata
{
  return self->_metadata;
}

- (BOOL)supportsSearch
{
  return self->_supportsSearch;
}

- (void)setDefaultAttribute:(BOOL)a3
{
  self->_defaultAttribute = a3;
}

- (BOOL)isDefaultAttribute
{
  return self->_defaultAttribute;
}

- (NSString)displayNameID
{
  return self->_displayNameID;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)isFixedSizeArray
{
  return self->_fixedSizeArray;
}

- (NSString)_typeString
{
  return self->_typeString;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t modifier = self->_modifier;
  id v6 = a3;
  [v6 encodeInteger:modifier forKey:@"modifier"];
  [v6 encodeObject:self->_propertyName forKey:@"propertyName"];
  [v6 encodeObject:self->_displayName forKey:@"displayName"];
  [v6 encodeObject:self->_displayNameID forKey:@"displayNameID"];
  [v6 encodeObject:self->_displayPriorityRank forKey:@"displayPriorityRank"];
  [v6 encodeBool:self->_supportsResolution forKey:@"supportsResolution"];
  [v6 encodeBool:self->_supportsDynamicEnumeration forKey:@"supportsDynamicEnumeration"];
  [v6 encodeBool:self->_supportsSearch forKey:@"supportsSearch"];
  [v6 encodeBool:self->_configurable forKey:@"configurable"];
  [v6 encodeObject:self->_metadata forKey:@"metadata"];
  [v6 encodeObject:self->_relationship forKey:@"relationship"];
  [v6 encodeObject:self->_promptDialogs forKey:@"promptDialogs"];
  [v6 encodeObject:self->_unsupportedReasons forKey:@"unsupportedReasons"];
  [v6 encodeObject:self->_typeString forKey:@"_typeString"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalCodableDescription);
  [v6 encodeConditionalObject:WeakRetained forKey:@"_codableDescription"];

  [v6 encodeObject:self->_entityKeypath forKey:@"entityKeypath"];
  [v6 encodeBool:self->_fixedSizeArray forKey:@"fixedSizeArray"];
  [v6 encodeObject:self->_arraySizesBySizeClass forKey:@"_arraySizesBySizeClass"];
  [v6 encodeInteger:self->_windowSize forKey:@"windowSize"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v7, "intents_setIntegerIfNonZero:forKey:", self->_modifier, @"modifier");
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_propertyName, @"propertyName");
  uint64_t v8 = [v6 languageCode];
  if ([(INCodableAttribute *)self isConfigurable]
    && v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v10 = +[INStringLocalizer localizerForLanguage:v8];
    unint64_t v9 = [(INCodableAttribute *)self localizedDisplayNameWithLocalizer:v10];
  }
  else
  {
    unint64_t v9 = [(NSString *)self->_displayName intents_encodeForPlistRepresentationWithParameters:v6];
  }
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v9, @"displayName");

  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v8, @"languageCode");
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_displayNameID, @"displayNameID");
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_displayPriorityRank, @"displayPriorityRank");
  objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_supportsResolution, @"supportsResolution");
  objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_supportsDynamicEnumeration, @"supportsDynamicEnumeration");
  objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_supportsSearch, @"supportsSearch");
  objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_configurable, @"configurable");
  relationship = self->_relationship;
  id v21 = 0;
  objc_msgSend(v7, "intents_setWidgetPlistRepresentable:forKey:error:", relationship, @"relationship", &v21);
  id v12 = v21;
  if (v12) {
    goto LABEL_10;
  }
  metadata = self->_metadata;
  id v20 = 0;
  objc_msgSend(v7, "intents_setWidgetPlistRepresentable:forKey:parameters:error:", metadata, @"metadata", v6, &v20);
  id v12 = v20;
  if (v12) {
    goto LABEL_10;
  }
  promptDialogs = self->_promptDialogs;
  id v19 = 0;
  objc_msgSend(v7, "intents_setArrayOfWidgetPlistRepresentable:forKey:error:", promptDialogs, @"promptDialogs", &v19);
  id v12 = v19;
  if (v12
    || (unsupportedReasons = self->_unsupportedReasons,
        id v18 = 0,
        objc_msgSend(v7, "intents_setArrayOfWidgetPlistRepresentable:forKey:error:", unsupportedReasons, @"unsupportedReasons", &v18), (id v12 = v18) != 0))
  {
LABEL_10:
    if (a4)
    {
      id v12 = v12;
      id v16 = 0;
      *a4 = v12;
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_typeString, @"_typeString");
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_entityKeypath, @"entityKeypath");
    objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_fixedSizeArray, @"fixedSizeArray");
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_arraySizesBySizeClass, @"_arraySizesBySizeClass");
    objc_msgSend(v7, "intents_setIntegerIfNonZero:forKey:", self->_windowSize, @"windowSize");
    id v16 = v7;
    id v12 = 0;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setModifier:", -[INCodableAttribute modifier](self, "modifier"));
  id v5 = [(INCodableAttribute *)self propertyName];
  [v4 setPropertyName:v5];

  id v6 = [(INCodableAttribute *)self displayPriorityRank];
  [v4 setDisplayPriorityRank:v6];

  uint64_t v7 = [(INCodableAttribute *)self displayName];
  [v4 setDisplayName:v7];

  uint64_t v8 = [(INCodableAttribute *)self displayNameID];
  [v4 setDisplayNameID:v8];

  unint64_t v9 = [(INCodableAttribute *)self metadata];
  [v4 setMetadata:v9];

  char v10 = [(INCodableAttribute *)self relationship];
  [v4 setRelationship:v10];

  objc_msgSend(v4, "setSupportsResolution:", -[INCodableAttribute supportsResolution](self, "supportsResolution"));
  objc_msgSend(v4, "setSupportsDynamicEnumeration:", -[INCodableAttribute supportsDynamicEnumeration](self, "supportsDynamicEnumeration"));
  objc_msgSend(v4, "setSupportsSearch:", -[INCodableAttribute supportsSearch](self, "supportsSearch"));
  objc_msgSend(v4, "setConfigurable:", -[INCodableAttribute isConfigurable](self, "isConfigurable"));
  objc_super v11 = [(INCodableAttribute *)self promptDialogs];
  [v4 _setPromptDialogs:v11];

  id v12 = [(INCodableAttribute *)self unsupportedReasons];
  [v4 _setUnsupportedReasons:v12];

  v13 = [(INCodableAttribute *)self _codableDescription];
  [v4 _setCodableDescription:v13];

  v14 = [(INCodableAttribute *)self _typeString];
  [v4 _setTypeString:v14];

  objc_storeStrong(v4 + 1, self->_promptDialogsByType);
  objc_msgSend(v4, "setFixedSizeArray:", -[INCodableAttribute isFixedSizeArray](self, "isFixedSizeArray"));
  objc_storeStrong(v4 + 2, self->_arraySizesBySizeClass);
  objc_msgSend(v4, "setWindowSize:", -[INCodableAttribute windowSize](self, "windowSize"));
  return v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(INCodableAttribute *)self promptDialogWithType:0];
  uint64_t v7 = [v6 dictionaryRepresentationWithLocalizer:v4];
  objc_msgSend(v5, "if_addObjectIfNonNil:", v7);

  uint64_t v8 = [(INCodableAttribute *)self promptDialogWithType:1];
  unint64_t v9 = [v8 dictionaryRepresentationWithLocalizer:v4];
  objc_msgSend(v5, "if_addObjectIfNonNil:", v9);

  char v10 = [(INCodableAttribute *)self promptDialogWithType:2];
  objc_super v11 = [v10 dictionaryRepresentationWithLocalizer:v4];
  objc_msgSend(v5, "if_addObjectIfNonNil:", v11);

  id v12 = [(INCodableAttribute *)self promptDialogWithType:3];
  v13 = [v12 dictionaryRepresentationWithLocalizer:v4];
  objc_msgSend(v5, "if_addObjectIfNonNil:", v13);

  v14 = [(INCodableAttribute *)self promptDialogWithType:4];
  v15 = [v14 dictionaryRepresentationWithLocalizer:v4];
  objc_msgSend(v5, "if_addObjectIfNonNil:", v15);

  id v16 = [(INCodableAttribute *)self promptDialogWithType:5];
  int64_t v17 = [v16 dictionaryRepresentationWithLocalizer:v4];
  objc_msgSend(v5, "if_addObjectIfNonNil:", v17);

  id v18 = (void *)MEMORY[0x1E4F1CA48];
  id v19 = [(INCodableAttribute *)self unsupportedReasons];
  id v20 = objc_msgSend(v18, "arrayWithCapacity:", objc_msgSend(v19, "count"));

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v21 = [(INCodableAttribute *)self unsupportedReasons];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v88 objects:v94 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v89 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = [*(id *)(*((void *)&v88 + 1) + 8 * i) dictionaryRepresentationWithLocalizer:v4];
        [v20 addObject:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v88 objects:v94 count:16];
    }
    while (v23);
  }

  uint64_t v27 = [(INCodableAttribute *)self _codableDescription];
  id v85 = [(INCodableAttribute *)self __INCodableDescriptionNameKey];
  v92[0] = v85;
  uint64_t v28 = [(INCodableAttribute *)self propertyName];
  uint64_t v29 = (void *)v28;
  if (!v28)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v60 = (void *)v28;
  v93[0] = v28;
  v83 = [(INCodableAttribute *)self __INCodableDescriptionDisplayNameKey];
  v92[1] = v83;
  uint64_t v30 = [(INCodableAttribute *)self localizedDisplayNameWithLocalizer:v4];
  v31 = (void *)v30;
  if (!v30)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v59 = (void *)v30;
  v93[1] = v30;
  v81 = [(INCodableAttribute *)self __INCodableDescriptionDisplayNameIDKey];
  v92[2] = v81;
  uint64_t v32 = [(INCodableAttribute *)self displayNameID];
  int64_t v33 = (void *)v32;
  if (!v32)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v84 = v29;
  v58 = (void *)v32;
  v93[2] = v32;
  v79 = [(INCodableAttribute *)self __INCodableDescriptionDisplayPriorityKey];
  v92[3] = v79;
  uint64_t v34 = [(INCodableAttribute *)self displayPriorityRank];
  v35 = (void *)v34;
  if (!v34)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v57 = (void *)v34;
  v93[3] = v34;
  v77 = [(INCodableAttribute *)self __INCodableDescriptionDefaultKey];
  v92[4] = v77;
  uint64_t v36 = objc_msgSend(NSNumber, "numberWithBool:", -[INCodableAttribute isDefaultAttribute](self, "isDefaultAttribute"));
  v76 = (void *)v36;
  if (!v36)
  {
    uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v56 = (void *)v36;
  v93[4] = v36;
  v75 = [(INCodableAttribute *)self __INCodableDescriptionSupportsMultipleValuesKey];
  v92[5] = v75;
  int64_t v74 = [(INCodableAttribute *)self modifier];
  v82 = v31;
  if (v74)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  }
  else
  {
    uint64_t v37 = MEMORY[0x1E4F1CC38];
  }
  v61 = (void *)v37;
  v93[5] = v37;
  v73 = [(INCodableAttribute *)self __INCodableDescriptionSupportsResolutionKey];
  v92[6] = v73;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(NSNumber, "numberWithBool:", -[INCodableAttribute supportsResolution](self, "supportsResolution"));
  }
  else {
  v72 = [MEMORY[0x1E4F1CA98] null];
  }
  v93[6] = v72;
  v71 = [(INCodableAttribute *)self __INCodableDescriptionConfigurableKey];
  v92[7] = v71;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(NSNumber, "numberWithBool:", -[INCodableAttribute isConfigurable](self, "isConfigurable"));
  }
  else {
  v70 = [MEMORY[0x1E4F1CA98] null];
  }
  v93[7] = v70;
  v69 = [(INCodableAttribute *)self __INCodableDescriptionSupportsDynamicEnumerationKey];
  v92[8] = v69;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(NSNumber, "numberWithBool:", -[INCodableAttribute supportsDynamicEnumeration](self, "supportsDynamicEnumeration"));
  }
  else {
  v68 = [MEMORY[0x1E4F1CA98] null];
  }
  v93[8] = v68;
  v67 = [(INCodableAttribute *)self __INCodableDescriptionPromptDialogsKey];
  v92[9] = v67;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v39 = (void *)MEMORY[0x1E4F1CBF0];
  if (isKindOfClass) {
    id v40 = v5;
  }
  else {
    id v40 = (id)MEMORY[0x1E4F1CBF0];
  }
  v93[9] = v40;
  v66 = [(INCodableAttribute *)self __INCodableDescriptionUnsupportedReasonsKey];
  v92[10] = v66;
  objc_opt_class();
  v86 = (void *)v27;
  if (objc_opt_isKindOfClass()) {
    v41 = v20;
  }
  else {
    v41 = v39;
  }
  v93[10] = v41;
  v65 = [(INCodableAttribute *)self __INCodableDescriptionMetadataKey];
  v92[11] = v65;
  v64 = [(INCodableAttribute *)self metadata];
  uint64_t v42 = [v64 dictionaryRepresentationWithLocalizer:v4];
  v43 = (void *)v42;
  if (!v42)
  {
    uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
  }
  v78 = v35;
  v80 = v33;
  v87 = v5;
  v55 = (void *)v42;
  v93[11] = v42;
  v63 = [(INCodableAttribute *)self __INCodableDescriptionRelationshipKey];
  v92[12] = v63;
  id v62 = [(INCodableAttribute *)self relationship];
  uint64_t v44 = [v62 dictionaryRepresentationWithLocalizer:v4];
  long long v45 = (void *)v44;
  if (!v44)
  {
    uint64_t v44 = [MEMORY[0x1E4F1CA98] null];
  }
  v93[12] = v44;
  long long v46 = [(INCodableAttribute *)self __INCodableDescriptionEntityKeypathKey];
  v92[13] = v46;
  id v47 = [(INCodableAttribute *)self entityKeypath];
  id v48 = v47;
  if (!v47)
  {
    id v48 = [MEMORY[0x1E4F1CA98] null];
  }
  v93[13] = v48;
  uint64_t v49 = [(INCodableAttribute *)self __INCodableDescriptionWindowSizeKey];
  v92[14] = v49;
  uint64_t v50 = objc_msgSend(NSNumber, "numberWithInteger:", -[INCodableAttribute windowSize](self, "windowSize"));
  v93[14] = v50;
  uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:15];

  if (!v47) {
  if (!v45)
  }

  if (!v43) {
  if (v74)
  }

  if (!v76) {
  if (!v78)
  }

  if (!v80) {
  if (!v82)
  }

  if (!v84) {
  uint64_t v52 = objc_msgSend(v51, "if_dictionaryWithNonEmptyValues");
  }

  return v52;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_opt_new();
  id v4 = [(INCodableAttribute *)self dictionaryRepresentationWithLocalizer:v3];

  return v4;
}

INCodableAttributeUnsupportedReason *__43__INCodableAttribute_updateWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(INCodableAttributeUnsupportedReason);
  [(INCodableAttributeDialog *)v4 _setCodableAttribute:*(void *)(a1 + 32)];
  [(INCodableAttributeUnsupportedReason *)v4 updateWithDictionary:v3];

  return v4;
}

- (id)promptDialogWithType:(unint64_t)a3
{
  promptDialogsByType = self->_promptDialogsByType;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  uint64_t v7 = [(NSMutableDictionary *)promptDialogsByType objectForKeyedSubscript:v6];

  if (!v7)
  {
    unint64_t v8 = a3 - 2;
    if (a3 == 2
      && (-[NSMutableDictionary objectForKeyedSubscript:](self->_promptDialogsByType, "objectForKeyedSubscript:", &unk_1EDBA7540), unint64_t v9 = objc_claimAutoreleasedReturnValue(), [v9 formatString], v10 = objc_claimAutoreleasedReturnValue(), v11 = objc_msgSend(v10, "length"), v10, v9, v11))
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = objc_alloc_init(INCodableAttributePromptDialog);
      [(INCodableAttributeDialog *)v7 _setCodableAttribute:self];
      [(INCodableAttributePromptDialog *)v7 setType:a3];
      [(INCodableAttributeDialog *)v7 setDefaultDialog:1];
      if (a3 - 1 > 5) {
        id v12 = @"Primary";
      }
      else {
        id v12 = off_1E551E3D8[a3 - 1];
      }
      v13 = [(__CFString *)v12 stringByAppendingString:@"PromptDialog"];
      [(INCodableAttributeDialog *)v7 setFormatStringID:v13];

      if (v8 > 3) {
        v14 = 0;
      }
      else {
        v14 = off_1E551E3B8[v8];
      }
      v15 = v14;
      [(INCodableAttributeDialog *)v7 setFormatString:v15];
    }
  }

  return v7;
}

- (id)localizedDisplayNameWithLocalizer:(id)a3
{
  id v4 = a3;
  id v5 = [(INCodableAttribute *)self _codableDescription];
  id v6 = [(INCodableAttribute *)self displayNameID];
  uint64_t v7 = [(INCodableAttribute *)self displayName];
  unint64_t v8 = [v5 _customLocalizationTable];
  if (v8)
  {
    unint64_t v9 = INLocalizedStringFromCodable(v6, v7, v8, v4, 0);
  }
  else
  {
    char v10 = [v5 _localizationTable];
    unint64_t v9 = INLocalizedStringFromCodable(v6, v7, v10, v4, 0);
  }

  return v9;
}

- (NSString)localizedDisplayName
{
  id v3 = objc_opt_new();
  id v4 = [(INCodableAttribute *)self localizedDisplayNameWithLocalizer:v3];

  return (NSString *)v4;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  id v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INCodableAttribute;
  id v6 = [(INCodableAttribute *)&v11 description];
  uint64_t v7 = [(INCodableAttribute *)self dictionaryRepresentation];
  unint64_t v8 = [v7 descriptionAtIndent:a3];
  unint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INCodableAttribute *)self descriptionAtIndent:1];
}

- (BOOL)isConfigurable
{
  return self->_configurable || [(INCodableAttribute *)self supportsResolution];
}

- (int64_t)arraySizeForSizeClass:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_arraySizesBySizeClass objectForKeyedSubscript:v4];
  if ([(INCodableAttribute *)self isFixedSizeArray])
  {
    if (v5)
    {
      if ([v5 integerValue] >= 1)
      {
        uint64_t v6 = [v5 integerValue];
LABEL_12:
        int64_t v7 = v6;
        goto LABEL_19;
      }
LABEL_18:
      int64_t v7 = 1;
      goto LABEL_19;
    }
    char v8 = [v4 isEqualToString:@"ExtraLarge"];
    unint64_t v9 = @"Large";
    if ((v8 & 1) == 0)
    {
      char v10 = [v4 isEqualToString:@"Large"];
      unint64_t v9 = @"Medium";
      if ((v10 & 1) == 0)
      {
        if (([v4 isEqualToString:@"Medium"] & 1) != 0
          || ([v4 isEqualToString:@"AccessoryCorner"] & 1) != 0)
        {
          unint64_t v9 = @"Small";
        }
        else if ([v4 isEqualToString:@"AccessoryCircular"])
        {
          unint64_t v9 = @"AccessoryCorner";
        }
        else
        {
          if (([v4 isEqualToString:@"AccessoryRectangular"] & 1) == 0
            && ![v4 isEqualToString:@"AccessoryInline"])
          {
            goto LABEL_18;
          }
          unint64_t v9 = @"AccessoryCircular";
        }
      }
    }
    uint64_t v6 = [(INCodableAttribute *)self arraySizeForSizeClass:v9];
    goto LABEL_12;
  }
  int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_19:

  return v7;
}

- (unint64_t)indexForUnsupportedReason:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(INCodableAttribute *)self unsupportedReasons];
  unint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    uint64_t v8 = 1;
    while (2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = v8 + v6;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_super v11 = [*(id *)(*((void *)&v15 + 1) + 8 * v9) code];
        id v12 = [v4 code];
        char v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          unint64_t v6 = v8 + v9;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v6 != v9);
      unint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v8 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)unsupportedReasonWithIndex:(unint64_t)a3
{
  unint64_t v4 = a3 - 1;
  id v5 = [(INCodableAttribute *)self unsupportedReasons];
  unint64_t v6 = [v5 count];

  if (v4 >= v6)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = [(INCodableAttribute *)self unsupportedReasons];
    uint64_t v8 = [v7 objectAtIndex:v4];
  }

  return v8;
}

- (Class)resolutionResultClass
{
  return 0;
}

- (Class)objectClass
{
  return 0;
}

- (int64_t)valueType
{
  return 0;
}

- (SEL)setter
{
  v2 = [(INCodableAttribute *)self propertyName];
  id v3 = (objc_class *)objc_opt_class();
  unint64_t v4 = INSetterFromString(v2, v3);

  return v4;
}

- (SEL)getter
{
  v2 = [(INCodableAttribute *)self propertyName];
  id v3 = NSSelectorFromString(v2);

  return v3;
}

- (int64_t)_attributeType
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init((Class)a1);
  objc_msgSend(v7, "setModifier:", objc_msgSend(v6, "intents_intForKey:", @"modifier"));
  objc_msgSend(v7, "setFixedSizeArray:", objc_msgSend(v6, "intents_BOOLForKey:", @"fixedSizeArray"));
  uint64_t v8 = objc_msgSend(v6, "intents_stringForKey:", @"propertyName");
  [v7 setPropertyName:v8];

  uint64_t v9 = objc_msgSend(v6, "intents_numberForKey:", @"displayPriorityRank");
  [v7 setDisplayPriorityRank:v9];

  uint64_t v10 = objc_msgSend(v6, "intents_stringForKey:", @"displayName");
  [v7 setDisplayName:v10];

  objc_super v11 = objc_msgSend(v6, "intents_stringForKey:", @"displayNameID");
  [v7 setDisplayNameID:v11];

  id v12 = objc_msgSend(v6, "intents_stringForKey:", @"_typeString");
  [v7 _setTypeString:v12];

  char v13 = objc_msgSend(v6, "intents_stringForKey:", @"languageCode");
  [v7 setLanguageCode:v13];

  v14 = objc_msgSend(v6, "intents_safeObjectForKey:ofType:", @"metadata", objc_opt_class());
  long long v15 = [v6 objectForKeyedSubscript:@"enumType"];
  if (v15)
  {
    long long v16 = @"Enum";
    long long v17 = @"Enum";
  }
  else
  {
    long long v18 = [v7 _typeString];
    INCodableAttributeMetadataTypeNameWithTypeName(v18);
    long long v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  id v65 = 0;
  id v19 = [INCodableAttributeMetadataClassWithMetadataTypeName(v16) makeFromWidgetPlistableRepresentation:v14 error:&v65];
  id v20 = v65;
  if (v20)
  {
    id v21 = v20;
    if (a4)
    {
      id v21 = v20;
      uint64_t v22 = 0;
      *a4 = v21;
    }
    else
    {
      uint64_t v22 = 0;
    }
  }
  else
  {
    [v19 setCodableAttribute:v7];
    [v7 setMetadata:v19];
    id v64 = 0;
    uint64_t v23 = +[NSObject intents_widgetPlistRepresentableInDict:v6 key:@"relationship" error:&v64];
    id v24 = v64;
    if (v24)
    {
      id v21 = v24;
      if (a4)
      {
        id v21 = v24;
        uint64_t v22 = 0;
        *a4 = v21;
      }
      else
      {
        uint64_t v22 = 0;
      }
    }
    else
    {
      [v23 setCodableAttribute:v7];
      [v7 setRelationship:v23];
      objc_msgSend(v7, "setSupportsResolution:", objc_msgSend(v6, "intents_BOOLForKey:", @"supportsResolution"));
      objc_msgSend(v7, "setConfigurable:", objc_msgSend(v6, "intents_BOOLForKey:", @"configurable"));
      objc_msgSend(v7, "setSupportsDynamicEnumeration:", objc_msgSend(v6, "intents_BOOLForKey:", @"supportsDynamicEnumeration"));
      objc_msgSend(v7, "setSupportsSearch:", objc_msgSend(v6, "intents_BOOLForKey:", @"supportsSearch"));
      id v63 = 0;
      v25 = +[NSObject intents_arrayOfWidgetPlistRepresentableInDict:v6 key:@"promptDialogs" error:&v63 resultTransformer:0];
      id v26 = v63;
      if (v26)
      {
        id v21 = v26;
        if (a4)
        {
          id v21 = v26;
          uint64_t v22 = 0;
          *a4 = v21;
        }
        else
        {
          uint64_t v22 = 0;
        }
      }
      else
      {
        [v7 _setPromptDialogs:v25];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __66__INCodableAttribute_makeFromWidgetPlistableRepresentation_error___block_invoke;
        v61[3] = &unk_1E5519528;
        id v27 = v7;
        uint64_t v28 = v25;
        id v29 = v27;
        id v62 = v27;
        v53 = v28;
        [v28 enumerateObjectsUsingBlock:v61];
        id v60 = 0;
        uint64_t v30 = +[NSObject intents_arrayOfWidgetPlistRepresentableInDict:v6 key:@"unsupportedReasons" error:&v60 resultTransformer:0];
        id v31 = v60;
        id v21 = v31;
        uint64_t v52 = v30;
        if (v31)
        {
          uint64_t v22 = 0;
          if (a4) {
            *a4 = v31;
          }
        }
        else
        {
          id v47 = v23;
          id v48 = v19;
          uint64_t v49 = v16;
          uint64_t v50 = v14;
          uint64_t v51 = v6;
          [v29 _setUnsupportedReasons:v30];
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v58[2] = __66__INCodableAttribute_makeFromWidgetPlistableRepresentation_error___block_invoke_2;
          v58[3] = &unk_1E5519550;
          uint64_t v32 = v29;
          id v59 = v32;
          [v30 enumerateObjectsUsingBlock:v58];
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          int64_t v33 = [v32 promptDialogs];
          uint64_t v34 = [v33 countByEnumeratingWithState:&v54 objects:v66 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v55;
            do
            {
              for (uint64_t i = 0; i != v35; ++i)
              {
                if (*(void *)v55 != v36) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v38 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                v39 = (void *)v32[1];
                if (!v39)
                {
                  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  v41 = (void *)v32[1];
                  v32[1] = v40;

                  v39 = (void *)v32[1];
                }
                uint64_t v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v38, "type"));
                [v39 setObject:v38 forKeyedSubscript:v42];
              }
              uint64_t v35 = [v33 countByEnumeratingWithState:&v54 objects:v66 count:16];
            }
            while (v35);
          }

          id v6 = v51;
          v43 = objc_msgSend(v51, "intents_stringForKey:", @"entityKeypath");
          [v32 setEntityKeypath:v43];

          uint64_t v44 = objc_msgSend(v51, "intents_safeObjectForKey:ofType:", @"_arraySizesBySizeClass", objc_opt_class());
          long long v45 = (void *)v32[2];
          v32[2] = v44;

          objc_msgSend(v32, "setWindowSize:", objc_msgSend(v51, "intents_intForKey:", @"windowSize"));
          uint64_t v22 = v32;

          v14 = v50;
          id v19 = v48;
          long long v16 = v49;
          id v21 = 0;
          uint64_t v23 = v47;
        }
        v25 = v53;
      }
    }
  }

  return v22;
}

uint64_t __66__INCodableAttribute_makeFromWidgetPlistableRepresentation_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setCodableAttribute:*(void *)(a1 + 32)];
}

uint64_t __66__INCodableAttribute_makeFromWidgetPlistableRepresentation_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _setCodableAttribute:*(void *)(a1 + 32)];
}

- (id)__INTypeCodableDescriptionWindowSizeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeWindowSizeKey");

  return v3;
}

- (id)__INTypeCodableDescriptionUnsupportedReasonsKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonsKey");

  return v3;
}

- (id)__INTypeCodableDescriptionTypeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeTypeKey");

  return v3;
}

- (id)__INTypeCodableDescriptionTagKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeTagKey");

  return v3;
}

- (id)__INTypeCodableDescriptionSupportsSearchKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsSearchKey");

  return v3;
}

- (id)__INTypeCodableDescriptionSupportsResolutionKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsResolutionKey");

  return v3;
}

- (id)__INTypeCodableDescriptionSupportsMultipleValuesKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsMultipleValuesKey");

  return v3;
}

- (id)__INTypeCodableDescriptionSupportsDynamicEnumerationKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsDynamicEnumerationKey");

  return v3;
}

- (id)__INTypeCodableDescriptionRelationshipKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipKey");

  return v3;
}

- (id)__INTypeCodableDescriptionPromptDialogsKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogsKey");

  return v3;
}

- (id)__INTypeCodableDescriptionNameKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeNameKey");

  return v3;
}

- (id)__INTypeCodableDescriptionMetadataKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeMetadataKey");

  return v3;
}

- (id)__INTypeCodableDescriptionFixedSizeArrayKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeFixedSizeArrayKey");

  return v3;
}

- (id)__INTypeCodableDescriptionEnumTypeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeEnumTypeKey");

  return v3;
}

- (id)__INTypeCodableDescriptionEntityKeypathKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeEntityKeypathKey");

  return v3;
}

- (id)__INTypeCodableDescriptionDisplayPriorityKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDisplayPriorityKey");

  return v3;
}

- (id)__INTypeCodableDescriptionDisplayNameIDKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDisplayNameIDKey");

  return v3;
}

- (id)__INTypeCodableDescriptionDisplayNameKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDisplayNameKey");

  return v3;
}

- (id)__INTypeCodableDescriptionDefaultKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDefaultKey");

  return v3;
}

- (id)__INTypeCodableDescriptionConfigurableKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeConfigurableKey");

  return v3;
}

- (id)__INTypeCodableDescriptionArraySizesKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeArraySizesKey");

  return v3;
}

- (id)__INTypeCodableDescriptionArraySizeSizeClassKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeArraySizeSizeClassKey");

  return v3;
}

- (id)__INTypeCodableDescriptionArraySizeSizeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeArraySizeSizeKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionWindowSizeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeWindowSizeKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionUnsupportedReasonsKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonsKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTypeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeTypeKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTagKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeTagKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionSupportsSearchKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsSearchKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionSupportsResolutionKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsResolutionKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionSupportsMultipleValuesKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsMultipleValuesKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionSupportsDynamicEnumerationKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeSupportsDynamicEnumerationKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionRelationshipKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionPromptDialogsKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogsKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionNameKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeNameKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionMetadataKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeMetadataKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionFixedSizeArrayKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeFixedSizeArrayKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionEnumTypeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeEnumTypeKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionEntityKeypathKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeEntityKeypathKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDisplayPriorityKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDisplayPriorityKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDisplayNameIDKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDisplayNameIDKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDisplayNameKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDisplayNameKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDefaultKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionConfigurableKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeConfigurableKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionArraySizesKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeArraySizesKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionArraySizeSizeClassKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeArraySizeSizeClassKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionArraySizeSizeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeArraySizeSizeKey");

  return v3;
}

- (id)__INCodableDescriptionArraySizeSizeClassKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeArraySizeSizeClassKey");

  return v3;
}

- (id)__INCodableDescriptionArraySizeSizeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeArraySizeSizeKey");

  return v3;
}

@end