@interface INCodablePersonAttributeMetadata
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (INCodablePersonAttributeMetadata)initWithCoder:(id)a3;
- (id)__INCodableDescriptionKey;
- (id)__INCodableDescriptionTypeKey;
- (id)__INIntentResponseCodableDescriptionKey;
- (id)__INIntentResponseCodableDescriptionTypeKey;
- (id)__INTypeCodableDescriptionKey;
- (id)__INTypeCodableDescriptionTypeKey;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(int64_t)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodablePersonAttributeMetadata

- (void)updateWithDictionary:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)INCodablePersonAttributeMetadata;
  id v4 = a3;
  [(INCodableAttributeMetadata *)&v10 updateWithDictionary:v4];
  v5 = [(INCodablePersonAttributeMetadata *)self __INCodableDescriptionTypeKey];
  v6 = [v4 objectForKeyedSubscript:v5];

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

  int64_t v9 = INCodablePersonAttributeMetadataTypeWithString(v8);
  self->_type = v9;
}

- (id)__INCodableDescriptionTypeKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodablePersonAttributeMetadataTypeKey");

  return v3;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (INCodablePersonAttributeMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)INCodablePersonAttributeMetadata;
  v5 = [(INCodableAttributeMetadata *)&v7 initWithCoder:v4];
  if (v5) {
    -[INCodablePersonAttributeMetadata setType:](v5, "setType:", [v4 decodeIntegerForKey:@"type"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INCodablePersonAttributeMetadata;
  id v4 = a3;
  [(INCodableAttributeMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)INCodablePersonAttributeMetadata;
  id v12 = 0;
  v6 = [(INCodableAttributeMetadata *)&v11 widgetPlistableRepresentationWithParameters:a3 error:&v12];
  id v7 = v12;
  id v8 = v7;
  if (v7)
  {
    int64_t v9 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_type, @"type");
    int64_t v9 = (void *)[v6 copy];
  }

  return v9;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)INCodablePersonAttributeMetadata;
  id v4 = [(INCodableAttributeMetadata *)&v12 dictionaryRepresentationWithLocalizer:a3];
  objc_super v5 = [(INCodablePersonAttributeMetadata *)self __INCodableDescriptionTypeKey];
  v13 = v5;
  int64_t v6 = [(INCodablePersonAttributeMetadata *)self type];
  if ((unint64_t)(v6 - 1) > 3) {
    id v7 = @"Contact";
  }
  else {
    id v7 = off_1E551B970[v6 - 1];
  }
  v14[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  int64_t v9 = objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v8);

  objc_super v10 = objc_msgSend(v9, "if_dictionaryWithNonEmptyValues");

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___INCodablePersonAttributeMetadata;
  id v13 = 0;
  id v7 = objc_msgSendSuper2(&v12, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v13);
  id v8 = v13;
  int64_t v9 = v8;
  if (v8)
  {
    id v10 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    objc_msgSend(v7, "setType:", objc_msgSend(v6, "intents_intForKey:", @"type"));
    id v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionTypeKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodablePersonAttributeMetadataTypeKey");

  return v3;
}

- (id)__INTypeCodableDescriptionKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodablePersonAttributeMetadataKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTypeKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodablePersonAttributeMetadataTypeKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodablePersonAttributeMetadataKey");

  return v3;
}

- (id)__INCodableDescriptionKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodablePersonAttributeMetadataKey");

  return v3;
}

@end