@interface INCodableFileAttributeMetadata
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (INCodableFileAttributeMetadata)initWithCoder:(id)a3;
- (NSArray)UTIs;
- (NSArray)customUTIs;
- (NSString)type;
- (id)__INCodableDescriptionCustomUTIsKey;
- (id)__INCodableDescriptionTypeKey;
- (id)__INIntentResponseCodableDescriptionCustomUTIsKey;
- (id)__INIntentResponseCodableDescriptionTypeKey;
- (id)__INTypeCodableDescriptionCustomUTIsKey;
- (id)__INTypeCodableDescriptionTypeKey;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableFileAttributeMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customUTIs, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

- (NSArray)customUTIs
{
  return self->_customUTIs;
}

- (NSString)type
{
  return self->_type;
}

- (INCodableFileAttributeMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INCodableFileAttributeMetadata;
  v5 = [(INCodableAttributeMetadata *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"customUTIs"];
    customUTIs = v5->_customUTIs;
    v5->_customUTIs = (NSArray *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INCodableFileAttributeMetadata;
  id v4 = a3;
  [(INCodableAttributeMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_customUTIs forKey:@"customUTIs"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)INCodableFileAttributeMetadata;
  id v12 = 0;
  uint64_t v6 = [(INCodableAttributeMetadata *)&v11 widgetPlistableRepresentationWithParameters:a3 error:&v12];
  id v7 = v12;
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_type, @"type");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_customUTIs, @"customUTIs");
    uint64_t v9 = (void *)[v6 copy];
  }

  return v9;
}

- (NSArray)UTIs
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v3 = [(INCodableFileAttributeMetadata *)self type];
  if ([v3 isEqualToString:@"PlainText"])
  {
    id v4 = [(id)*MEMORY[0x1E4F44470] identifier];
    v27[0] = v4;
    objc_super v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = (id *)v27;
LABEL_7:
    id v7 = [v5 arrayWithObjects:v6 count:1];
LABEL_8:

    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"RichText"])
  {
    id v4 = [(id)*MEMORY[0x1E4F444A0] identifier];
    id v26 = v4;
    objc_super v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = &v26;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"Image"])
  {
    id v4 = [(id)*MEMORY[0x1E4F44400] identifier];
    id v25 = v4;
    objc_super v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = &v25;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"Custom"])
  {
    v19 = v3;
    uint64_t v9 = [(INCodableFileAttributeMetadata *)self customUTIs];
    uint64_t v10 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = v9;
    uint64_t v11 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v4);
          }
          id v15 = *(id *)(*((void *)&v20 + 1) + 8 * i);
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

          v18 = [v17 objectForKey:@"UTI"];

          if (v18)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v10 addObject:v18];
            }
          }
        }
        uint64_t v12 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    id v7 = (void *)[v10 copy];
    v3 = v19;
    goto LABEL_8;
  }
  id v7 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_9:

  return (NSArray *)v7;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)INCodableFileAttributeMetadata;
  id v4 = [(INCodableAttributeMetadata *)&v15 dictionaryRepresentationWithLocalizer:a3];
  objc_super v5 = [(INCodableFileAttributeMetadata *)self __INCodableDescriptionTypeKey];
  v16[0] = v5;
  uint64_t v6 = [(INCodableFileAttributeMetadata *)self type];
  id v7 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v7;
  v8 = [(INCodableFileAttributeMetadata *)self __INCodableDescriptionCustomUTIsKey];
  v16[1] = v8;
  uint64_t v9 = [(INCodableFileAttributeMetadata *)self customUTIs];
  uint64_t v10 = v9;
  if (!v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  uint64_t v12 = objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v11);

  if (!v9) {
  if (!v6)
  }

  uint64_t v13 = objc_msgSend(v12, "if_dictionaryWithNonEmptyValues");

  return v13;
}

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INCodableFileAttributeMetadata;
  [(INCodableAttributeMetadata *)&v15 updateWithDictionary:v4];
  objc_super v5 = [(INCodableFileAttributeMetadata *)self __INCodableDescriptionTypeKey];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

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
  v8 = v7;

  type = self->_type;
  self->_type = v8;

  uint64_t v10 = [(INCodableFileAttributeMetadata *)self __INCodableDescriptionCustomUTIsKey];
  uint64_t v11 = [v4 objectForKeyedSubscript:v10];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = v12;

  customUTIs = self->_customUTIs;
  self->_customUTIs = v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___INCodableFileAttributeMetadata;
  id v17 = 0;
  id v7 = objc_msgSendSuper2(&v16, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v17);
  id v8 = v17;
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    uint64_t v11 = objc_msgSend(v6, "intents_stringForKey:", @"type");
    uint64_t v12 = (void *)v7[5];
    v7[5] = v11;

    uint64_t v13 = objc_msgSend(v6, "intents_safeObjectForKey:ofType:", @"customUTIs", objc_opt_class());
    v14 = (void *)v7[6];
    v7[6] = v13;

    uint64_t v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionTypeKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableFileAttributeMetadataTypeKey");

  return v3;
}

- (id)__INTypeCodableDescriptionCustomUTIsKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableFileAttributeMetadataCustomUTIsKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTypeKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableFileAttributeMetadataTypeKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionCustomUTIsKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableFileAttributeMetadataCustomUTIsKey");

  return v3;
}

- (id)__INCodableDescriptionTypeKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableFileAttributeMetadataTypeKey");

  return v3;
}

- (id)__INCodableDescriptionCustomUTIsKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableFileAttributeMetadataCustomUTIsKey");

  return v3;
}

@end