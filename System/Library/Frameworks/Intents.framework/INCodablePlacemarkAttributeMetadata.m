@interface INCodablePlacemarkAttributeMetadata
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (INCodablePlacemarkAttributeMetadata)initWithCoder:(id)a3;
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

@implementation INCodablePlacemarkAttributeMetadata

- (INCodablePlacemarkAttributeMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)INCodablePlacemarkAttributeMetadata;
  v5 = [(INCodableAttributeMetadata *)&v7 initWithCoder:v4];
  if (v5) {
    -[INCodablePlacemarkAttributeMetadata setType:](v5, "setType:", [v4 decodeIntegerForKey:@"type"]);
  }

  return v5;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)updateWithDictionary:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)INCodablePlacemarkAttributeMetadata;
  id v4 = a3;
  [(INCodableAttributeMetadata *)&v10 updateWithDictionary:v4];
  v5 = [(INCodablePlacemarkAttributeMetadata *)self __INCodableDescriptionTypeKey];
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

  int64_t v9 = INCodablePlacemarkAttributeMetadataTypeWithString(v8);
  self->_type = v9;
}

- (id)__INCodableDescriptionTypeKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodablePlacemarkAttributeMetadataTypeKey");

  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INCodablePlacemarkAttributeMetadata;
  id v4 = a3;
  [(INCodableAttributeMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)INCodablePlacemarkAttributeMetadata;
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
  v16[1] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)INCodablePlacemarkAttributeMetadata;
  id v4 = [(INCodableAttributeMetadata *)&v14 dictionaryRepresentationWithLocalizer:a3];
  objc_super v5 = [(INCodablePlacemarkAttributeMetadata *)self __INCodableDescriptionTypeKey];
  v15 = v5;
  int64_t v6 = [(INCodablePlacemarkAttributeMetadata *)self type];
  id v7 = @"Name";
  if (v6 == 1) {
    id v7 = @"Address";
  }
  if (v6 == 2) {
    id v7 = @"City";
  }
  v16[0] = v7;
  id v8 = (void *)MEMORY[0x1E4F1C9E8];
  int64_t v9 = v7;
  objc_super v10 = [v8 dictionaryWithObjects:v16 forKeys:&v15 count:1];

  objc_super v11 = objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v10);

  id v12 = objc_msgSend(v11, "if_dictionaryWithNonEmptyValues");

  return v12;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___INCodablePlacemarkAttributeMetadata;
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
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodablePlacemarkAttributeMetadataTypeKey");

  return v3;
}

- (id)__INTypeCodableDescriptionKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodablePlacemarkAttributeMetadataKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTypeKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodablePlacemarkAttributeMetadataTypeKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodablePlacemarkAttributeMetadataKey");

  return v3;
}

- (id)__INCodableDescriptionKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodablePlacemarkAttributeMetadataKey");

  return v3;
}

@end