@interface INCodableAttributePromptDialog
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (INCodableAttributePromptDialog)initWithCoder:(id)a3;
- (id)__INCodableDescriptionFormatStringDictionaryKey;
- (id)__INCodableDescriptionFormatStringDictionaryLanguageCodeKey;
- (id)__INCodableDescriptionFormatStringIDKey;
- (id)__INCodableDescriptionFormatStringKey;
- (id)__INCodableDescriptionFormatStringLanguageCodeKey;
- (id)__INCodableDescriptionKey;
- (id)__INCodableDescriptionTypeKey;
- (id)__INIntentResponseCodableDescriptionKey;
- (id)__INIntentResponseCodableDescriptionTypeKey;
- (id)__INTypeCodableDescriptionKey;
- (id)__INTypeCodableDescriptionTypeKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableAttributePromptDialog

- (unint64_t)type
{
  return self->_type;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INCodableAttributePromptDialog)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)INCodableAttributePromptDialog;
  v5 = [(INCodableAttributeDialog *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (void)updateWithDictionary:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)INCodableAttributePromptDialog;
  id v4 = a3;
  [(INCodableAttributeDialog *)&v11 updateWithDictionary:v4];
  v5 = [(INCodableAttributePromptDialog *)self __INCodableDescriptionTypeKey];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v7 = v6;
    }
    else {
      objc_super v7 = 0;
    }
  }
  else
  {
    objc_super v7 = 0;
  }
  id v8 = v7;

  id v9 = v8;
  if ([v9 isEqualToString:@"Primary"])
  {
    unint64_t v10 = 0;
  }
  else if ([v9 isEqualToString:@"Concise"])
  {
    unint64_t v10 = 1;
  }
  else if ([v9 isEqualToString:@"DisambiguationIntroduction"])
  {
    unint64_t v10 = 2;
  }
  else if ([v9 isEqualToString:@"SubsequentIntroduction"])
  {
    unint64_t v10 = 3;
  }
  else if ([v9 isEqualToString:@"DisambiguationSelection"])
  {
    unint64_t v10 = 4;
  }
  else if ([v9 isEqualToString:@"Confirmation"])
  {
    unint64_t v10 = 5;
  }
  else if ([v9 isEqualToString:@"Configuration"])
  {
    unint64_t v10 = 6;
  }
  else
  {
    unint64_t v10 = 0;
  }

  self->_type = v10;
}

- (id)__INCodableDescriptionTypeKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogTypeKey");

  return v3;
}

- (id)__INCodableDescriptionFormatStringIDKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogFormatStringIDKey");

  return v3;
}

- (id)__INCodableDescriptionFormatStringKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogFormatStringKey");

  return v3;
}

- (id)__INCodableDescriptionFormatStringLanguageCodeKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogFormatStringLanguageCodeKey");

  return v3;
}

- (id)__INCodableDescriptionFormatStringDictionaryLanguageCodeKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogFormatStringDictionaryLanguageCodeKey");

  return v3;
}

- (id)__INCodableDescriptionFormatStringDictionaryKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogFormatStringDictionaryKey");

  return v3;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INCodableAttributePromptDialog;
  id v4 = a3;
  [(INCodableAttributeDialog *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[INCodableAttributePromptDialog type](self, "type", v5.receiver, v5.super_class), @"type");
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)INCodableAttributePromptDialog;
  id v12 = 0;
  v6 = [(INCodableAttributeDialog *)&v11 widgetPlistableRepresentationWithParameters:a3 error:&v12];
  id v7 = v12;
  id v8 = v7;
  if (v7)
  {
    id v9 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", -[INCodableAttributePromptDialog type](self, "type"), @"type");
    id v9 = (void *)[v6 copy];
  }

  return v9;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)INCodableAttributePromptDialog;
  id v4 = [(INCodableAttributeDialog *)&v12 dictionaryRepresentationWithLocalizer:a3];
  objc_super v5 = [(INCodableAttributePromptDialog *)self __INCodableDescriptionTypeKey];
  v13 = v5;
  unint64_t v6 = [(INCodableAttributePromptDialog *)self type];
  if (v6 - 1 > 5) {
    id v7 = @"Primary";
  }
  else {
    id v7 = off_1E551E3D8[v6 - 1];
  }
  v14[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  id v9 = objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v8);

  unint64_t v10 = objc_msgSend(v9, "if_dictionaryWithNonEmptyValues");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (v8.receiver = self,
        v8.super_class = (Class)INCodableAttributePromptDialog,
        [(INCodableAttributeDialog *)&v8 isEqual:v4]))
  {
    unint64_t v5 = [(INCodableAttributePromptDialog *)self type];
    BOOL v6 = v5 == [v4 type];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)INCodableAttributePromptDialog;
  unint64_t v3 = [(INCodableAttributeDialog *)&v5 hash];
  return [(INCodableAttributePromptDialog *)self type] ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)INCodableAttributePromptDialog;
  id v4 = [(INCodableAttributeDialog *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setType:", -[INCodableAttributePromptDialog type](self, "type"));
  return v4;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___INCodableAttributePromptDialog;
  id v13 = 0;
  id v7 = objc_msgSendSuper2(&v12, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v13);
  id v8 = v13;
  id v9 = v8;
  if (v8)
  {
    unint64_t v10 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    v7[5] = objc_msgSend(v6, "intents_intForKey:", @"type");
    unint64_t v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionTypeKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogTypeKey");

  return v3;
}

- (id)__INTypeCodableDescriptionKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTypeKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogTypeKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogKey");

  return v3;
}

- (id)__INCodableDescriptionKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogKey");

  return v3;
}

@end