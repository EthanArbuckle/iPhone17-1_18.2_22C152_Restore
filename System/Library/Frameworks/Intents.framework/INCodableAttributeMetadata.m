@interface INCodableAttributeMetadata
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (INCodableAttribute)codableAttribute;
- (INCodableAttributeMetadata)initWithCoder:(id)a3;
- (INCodableAttributeMetadata)initWithName:(id)a3 codableAttribute:(id)a4;
- (INCodableDescription)_codableDescription;
- (INCodableLocalizationTable)_localizationTable;
- (NSString)description;
- (NSString)localizedPlaceholder;
- (NSString)name;
- (NSString)placeholder;
- (NSString)placeholderID;
- (id)__INCodableDescriptionPlaceholderIDKey;
- (id)__INCodableDescriptionPlaceholderKey;
- (id)__INIntentResponseCodableDescriptionPlaceholderIDKey;
- (id)__INIntentResponseCodableDescriptionPlaceholderKey;
- (id)__INTypeCodableDescriptionPlaceholderIDKey;
- (id)__INTypeCodableDescriptionPlaceholderKey;
- (id)_localizedDialogTokensWithLocalizer:(id)a3;
- (id)descriptionAtIndent:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)localizedPlaceholderWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCodableAttribute:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setPlaceholderID:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableAttributeMetadata

- (INCodableAttributeMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)INCodableAttributeMetadata;
  v5 = [(INCodableAttributeMetadata *)&v20 init];
  if (v5)
  {
    id v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v7 = v6;
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    id v8 = v7;

    [v8 _allowDecodingCyclesInSecureMode];
    uint64_t v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v6 decodeObjectOfClasses:v13 forKey:@"placeholder"];
    placeholder = v5->_placeholder;
    v5->_placeholder = (NSString *)v14;

    uint64_t v16 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"placeholderID"];
    placeholderID = v5->_placeholderID;
    v5->_placeholderID = (NSString *)v16;

    v18 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"codableAttribute"];
    objc_storeWeak((id *)&v5->_codableAttribute, v18);
  }
  return v5;
}

- (INCodableDescription)_codableDescription
{
  v2 = [(INCodableAttributeMetadata *)self codableAttribute];
  v3 = [v2 _codableDescription];

  return (INCodableDescription *)v3;
}

- (INCodableAttribute)codableAttribute
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_codableAttribute);

  return (INCodableAttribute *)WeakRetained;
}

- (INCodableAttributeMetadata)initWithName:(id)a3 codableAttribute:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INCodableAttributeMetadata;
  id v8 = [(INCodableAttributeMetadata *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeWeak((id *)&v8->_codableAttribute, v7);
  }

  return v8;
}

- (void)updateWithDictionary:(id)a3
{
  id v14 = a3;
  id v4 = [(INCodableAttributeMetadata *)self __INCodableDescriptionPlaceholderKey];
  v5 = [v14 objectForKeyedSubscript:v4];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  placeholder = self->_placeholder;
  self->_placeholder = v7;

  uint64_t v9 = [(INCodableAttributeMetadata *)self __INCodableDescriptionPlaceholderIDKey];
  v10 = [v14 objectForKeyedSubscript:v9];

  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  objc_super v12 = v11;

  placeholderID = self->_placeholderID;
  self->_placeholderID = v12;
}

- (id)__INCodableDescriptionPlaceholderIDKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeMetadataPlaceholderIDKey");

  return v3;
}

- (id)__INCodableDescriptionPlaceholderKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeMetadataPlaceholderKey");

  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_codableAttribute);
  objc_storeStrong((id *)&self->_placeholderID, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setCodableAttribute:(id)a3
{
}

- (void)setPlaceholderID:(id)a3
{
}

- (NSString)placeholderID
{
  return self->_placeholderID;
}

- (void)setPlaceholder:(id)a3
{
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (NSString)name
{
  return self->_name;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_placeholder forKey:@"placeholder"];
  [v5 encodeObject:self->_placeholderID forKey:@"placeholderID"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_codableAttribute);
  [v5 encodeConditionalObject:WeakRetained forKey:@"codableAttribute"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = [v5 dictionary];
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_name, @"name");
  id v8 = [(NSString *)self->_placeholder intents_encodeForPlistRepresentationWithParameters:v6];

  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v8, @"placeholder");
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_placeholderID, @"placeholderID");

  return v7;
}

- (id)_localizedDialogTokensWithLocalizer:(id)a3
{
  return 0;
}

- (id)localizedPlaceholderWithLocalizer:(id)a3
{
  id v4 = a3;
  id v5 = [(INCodableAttributeMetadata *)self placeholderID];
  id v6 = [(INCodableAttributeMetadata *)self placeholder];
  id v7 = [(INCodableAttributeMetadata *)self _localizationTable];
  id v8 = INLocalizedStringFromCodable(v5, v6, v7, v4, 0);

  return v8;
}

- (NSString)localizedPlaceholder
{
  v3 = objc_opt_new();
  id v4 = [(INCodableAttributeMetadata *)self localizedPlaceholderWithLocalizer:v3];

  return (NSString *)v4;
}

- (INCodableLocalizationTable)_localizationTable
{
  v2 = [(INCodableAttributeMetadata *)self codableAttribute];
  v3 = [v2 _codableDescription];

  id v4 = [v3 _customLocalizationTable];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 _localizationTable];
  }
  id v7 = v6;

  return (INCodableLocalizationTable *)v7;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  id v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INCodableAttributeMetadata;
  id v6 = [(INCodableAttributeMetadata *)&v11 description];
  id v7 = [(INCodableAttributeMetadata *)self dictionaryRepresentation];
  id v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INCodableAttributeMetadata *)self descriptionAtIndent:0];
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(INCodableAttributeMetadata *)self __INCodableDescriptionPlaceholderKey];
  v14[0] = v5;
  id v6 = [(INCodableAttributeMetadata *)self localizedPlaceholderWithLocalizer:v4];

  id v7 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v7;
  id v8 = [(INCodableAttributeMetadata *)self __INCodableDescriptionPlaceholderIDKey];
  v14[1] = v8;
  uint64_t v9 = [(INCodableAttributeMetadata *)self placeholderID];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v10;
  objc_super v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  if (!v9) {

  }
  if (!v6) {
  objc_super v12 = objc_msgSend(v11, "if_dictionaryWithNonEmptyValues");
  }

  return v12;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  id v4 = [(INCodableAttributeMetadata *)self dictionaryRepresentationWithLocalizer:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)a1);
  uint64_t v7 = objc_msgSend(v5, "intents_stringForKey:", @"name");
  id v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = objc_msgSend(v5, "intents_stringForKey:", @"placeholder");
  v10 = (void *)v6[2];
  v6[2] = v9;

  uint64_t v11 = objc_msgSend(v5, "intents_stringForKey:", @"placeholderID");

  objc_super v12 = (void *)v6[3];
  v6[3] = v11;

  return v6;
}

- (id)__INTypeCodableDescriptionPlaceholderIDKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeMetadataPlaceholderIDKey");

  return v3;
}

- (id)__INTypeCodableDescriptionPlaceholderKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeMetadataPlaceholderKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionPlaceholderIDKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeMetadataPlaceholderIDKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionPlaceholderKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeMetadataPlaceholderKey");

  return v3;
}

@end