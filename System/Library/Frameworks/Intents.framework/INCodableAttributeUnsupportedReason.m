@interface INCodableAttributeUnsupportedReason
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (INCodableAttributeUnsupportedReason)initWithCoder:(id)a3;
- (NSString)code;
- (NSString)predicateFormat;
- (id)__INCodableDescriptionCodeKey;
- (id)__INCodableDescriptionFormatStringDictionaryKey;
- (id)__INCodableDescriptionFormatStringDictionaryLanguageCodeKey;
- (id)__INCodableDescriptionFormatStringIDKey;
- (id)__INCodableDescriptionFormatStringKey;
- (id)__INCodableDescriptionFormatStringLanguageCodeKey;
- (id)__INCodableDescriptionKey;
- (id)__INIntentResponseCodableDescriptionCodeKey;
- (id)__INIntentResponseCodableDescriptionKey;
- (id)__INTypeCodableDescriptionCodeKey;
- (id)__INTypeCodableDescriptionKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCode:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableAttributeUnsupportedReason

- (void).cxx_destruct
{
}

- (void)setCode:(id)a3
{
}

- (NSString)code
{
  return self->_code;
}

- (INCodableAttributeUnsupportedReason)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INCodableAttributeUnsupportedReason;
  v5 = [(INCodableAttributeDialog *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"code"];
    code = v5->_code;
    v5->_code = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)INCodableAttributeUnsupportedReason;
  id v4 = a3;
  [(INCodableAttributeDialog *)&v6 encodeWithCoder:v4];
  v5 = [(INCodableAttributeUnsupportedReason *)self code];
  [v4 encodeObject:v5 forKey:@"code"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)INCodableAttributeUnsupportedReason;
  id v13 = 0;
  objc_super v6 = [(INCodableAttributeDialog *)&v12 widgetPlistableRepresentationWithParameters:a3 error:&v13];
  id v7 = v13;
  v8 = v7;
  if (v7)
  {
    objc_super v9 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    v10 = [(INCodableAttributeUnsupportedReason *)self code];
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", v10, @"code");

    objc_super v9 = (void *)[v6 copy];
  }

  return v9;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)INCodableAttributeUnsupportedReason;
  id v4 = [(INCodableAttributeDialog *)&v11 dictionaryRepresentationWithLocalizer:a3];
  v5 = [(INCodableAttributeUnsupportedReason *)self __INCodableDescriptionCodeKey];
  objc_super v12 = v5;
  objc_super v6 = [(INCodableAttributeUnsupportedReason *)self code];
  v13[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v8 = objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v7);

  objc_super v9 = objc_msgSend(v8, "if_dictionaryWithNonEmptyValues");

  return v9;
}

- (void)updateWithDictionary:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)INCodableAttributeUnsupportedReason;
  id v4 = a3;
  [(INCodableAttributeDialog *)&v8 updateWithDictionary:v4];
  v5 = [(INCodableAttributeUnsupportedReason *)self __INCodableDescriptionCodeKey];
  objc_super v6 = [v4 objectForKeyedSubscript:v5];

  code = self->_code;
  self->_code = v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (v9.receiver = self,
        v9.super_class = (Class)INCodableAttributeUnsupportedReason,
        [(INCodableAttributeDialog *)&v9 isEqual:v4]))
  {
    v5 = [(INCodableAttributeUnsupportedReason *)self code];
    objc_super v6 = [v4 code];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)INCodableAttributeUnsupportedReason;
  unint64_t v3 = [(INCodableAttributeDialog *)&v7 hash];
  id v4 = [(INCodableAttributeUnsupportedReason *)self code];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)INCodableAttributeUnsupportedReason;
  id v4 = [(INCodableAttributeDialog *)&v7 copyWithZone:a3];
  unint64_t v5 = [(INCodableAttributeUnsupportedReason *)self code];
  [v4 setCode:v5];

  return v4;
}

- (NSString)predicateFormat
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = +[INSchema _supportedTypesDictionary];
  id v4 = [(INCodableAttributeDialog *)self _codableAttribute];
  unint64_t v5 = [v4 _typeString];
  objc_super v6 = [v3 objectForKeyedSubscript:v5];

  if (v6)
  {
    objc_super v7 = [v6 objectForKeyedSubscript:@"UnsupportedReasons"];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_super v8 = v7;
      }
      else {
        objc_super v8 = 0;
      }
    }
    else
    {
      objc_super v8 = 0;
    }
    id v10 = v8;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      v25 = v6;
      v26 = v3;
      uint64_t v14 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "objectForKeyedSubscript:", @"Code", v25, v26, (void)v27);
          if (v17)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v18 = v17;
            }
            else {
              v18 = 0;
            }
          }
          else
          {
            v18 = 0;
          }
          id v19 = v18;

          v20 = [(INCodableAttributeUnsupportedReason *)self code];
          int v21 = [v19 isEqualToString:v20];

          if (v21)
          {
            v22 = [v16 objectForKeyedSubscript:@"Predicate"];
            if (v22)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v23 = v22;
              }
              else {
                v23 = 0;
              }
            }
            else
            {
              v23 = 0;
            }
            objc_super v6 = v25;
            unint64_t v3 = v26;
            id v9 = v23;

            goto LABEL_29;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      id v9 = 0;
      objc_super v6 = v25;
      unint64_t v3 = v26;
    }
    else
    {
      id v9 = 0;
    }
LABEL_29:
  }
  else
  {
    id v9 = 0;
  }

  return (NSString *)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___INCodableAttributeUnsupportedReason;
  id v15 = 0;
  objc_super v7 = objc_msgSendSuper2(&v14, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v15);
  id v8 = v15;
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
    uint64_t v11 = objc_msgSend(v6, "intents_stringForKey:", @"code");
    uint64_t v12 = (void *)v7[5];
    v7[5] = v11;

    id v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionCodeKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonCodeKey");

  return v3;
}

- (id)__INTypeCodableDescriptionKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionCodeKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonCodeKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonKey");

  return v3;
}

- (id)__INCodableDescriptionCodeKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonCodeKey");

  return v3;
}

- (id)__INCodableDescriptionKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonKey");

  return v3;
}

- (id)__INCodableDescriptionFormatStringLanguageCodeKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonFormatStringLanguageCodeKey");

  return v3;
}

- (id)__INCodableDescriptionFormatStringIDKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonFormatStringIDKey");

  return v3;
}

- (id)__INCodableDescriptionFormatStringDictionaryLanguageCodeKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonFormatStringDictionaryLanguageCodeKey");

  return v3;
}

- (id)__INCodableDescriptionFormatStringDictionaryKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonFormatStringDictionaryKey");

  return v3;
}

- (id)__INCodableDescriptionFormatStringKey
{
  v2 = [(INCodableAttributeDialog *)self _codableDescription];
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonFormatStringKey");

  return v3;
}

@end