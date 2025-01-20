@interface LNAssistantIntentMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNAssistantIntentMetadata)initWithCoder:(id)a3;
- (LNAssistantIntentMetadata)initWithIntentIdentifier:(id)a3 phraseTemplates:(id)a4 parameterValues:(id)a5 availabilityAnnotations:(id)a6;
- (LNAssistantIntentMetadata)initWithIntentIdentifier:(id)a3 phraseTemplates:(id)a4 parameterValues:(id)a5 impliedValues:(id)a6 availabilityAnnotations:(id)a7;
- (NSArray)phraseTemplates;
- (NSDictionary)availabilityAnnotations;
- (NSDictionary)impliedValues;
- (NSDictionary)parameterValues;
- (NSString)intentIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAssistantIntentMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityAnnotations, 0);
  objc_storeStrong((id *)&self->_impliedValues, 0);
  objc_storeStrong((id *)&self->_parameterValues, 0);
  objc_storeStrong((id *)&self->_phraseTemplates, 0);
  objc_storeStrong((id *)&self->_intentIdentifier, 0);
}

- (NSDictionary)availabilityAnnotations
{
  return self->_availabilityAnnotations;
}

- (NSDictionary)impliedValues
{
  return self->_impliedValues;
}

- (NSDictionary)parameterValues
{
  return self->_parameterValues;
}

- (NSArray)phraseTemplates
{
  return self->_phraseTemplates;
}

- (NSString)intentIdentifier
{
  return self->_intentIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNAssistantIntentMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_44:

      goto LABEL_45;
    }
    v7 = [(LNAssistantIntentMetadata *)self intentIdentifier];
    v8 = [(LNAssistantIntentMetadata *)v6 intentIdentifier];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_42;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_43:

        goto LABEL_44;
      }
    }
    v16 = [(LNAssistantIntentMetadata *)self phraseTemplates];
    v17 = [(LNAssistantIntentMetadata *)v6 phraseTemplates];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_41;
      }
      int v21 = [v14 isEqualToArray:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_42:

        goto LABEL_43;
      }
    }
    v22 = [(LNAssistantIntentMetadata *)self parameterValues];
    v23 = [(LNAssistantIntentMetadata *)v6 parameterValues];
    id v20 = v22;
    id v24 = v23;
    v19 = v24;
    id v40 = v20;
    if (v20 == v24)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24) {
        goto LABEL_40;
      }
      int v12 = [v20 isEqual:v24];

      if (!v12) {
        goto LABEL_41;
      }
    }
    v26 = [(LNAssistantIntentMetadata *)self impliedValues];
    v27 = [(LNAssistantIntentMetadata *)v6 impliedValues];
    id v28 = v26;
    id v29 = v27;
    v38 = v29;
    id v39 = v28;
    if (v28 == v29)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v30 = v29;
        v19 = v37;
        goto LABEL_38;
      }
      v30 = v29;
      v19 = v37;
      if (!v29)
      {
LABEL_38:

        goto LABEL_39;
      }
      int v31 = [v28 isEqual:v29];

      if (!v31)
      {
        LOBYTE(v12) = 0;
        v19 = v37;
LABEL_39:
        v25 = v38;
        id v20 = v39;
LABEL_40:

        id v20 = v40;
LABEL_41:

        goto LABEL_42;
      }
    }
    v32 = [(LNAssistantIntentMetadata *)self availabilityAnnotations];
    v33 = [(LNAssistantIntentMetadata *)v6 availabilityAnnotations];
    id v28 = v32;
    id v34 = v33;
    v35 = v34;
    if (v28 == v34)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v28)
      {
        v19 = v37;
        if (v34) {
          LOBYTE(v12) = [v28 isEqual:v34];
        }
        goto LABEL_36;
      }
    }
    v19 = v37;
LABEL_36:

    v30 = v35;
    goto LABEL_38;
  }
  LOBYTE(v12) = 1;
LABEL_45:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNAssistantIntentMetadata *)self intentIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(LNAssistantIntentMetadata *)self phraseTemplates];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(LNAssistantIntentMetadata *)self parameterValues];
  uint64_t v8 = [v7 hash];
  id v9 = [(LNAssistantIntentMetadata *)self impliedValues];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(LNAssistantIntentMetadata *)self availabilityAnnotations];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNAssistantIntentMetadata *)self intentIdentifier];
  v7 = [(LNAssistantIntentMetadata *)self phraseTemplates];
  uint64_t v8 = [(LNAssistantIntentMetadata *)self parameterValues];
  id v9 = [(LNAssistantIntentMetadata *)self impliedValues];
  uint64_t v10 = [(LNAssistantIntentMetadata *)self availabilityAnnotations];
  v11 = [v3 stringWithFormat:@"<%@: %p, intentIdentifier: %@, phraseTemplates: %@, parameterValues: %@, impliedValues: %@, availabilityAnnotation: %@>", v5, self, v6, v7, v8, v9, v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNAssistantIntentMetadata *)self intentIdentifier];
  [v4 encodeObject:v5 forKey:@"intentIdentifier"];

  uint64_t v6 = [(LNAssistantIntentMetadata *)self phraseTemplates];
  [v4 encodeObject:v6 forKey:@"phraseTemplates"];

  v7 = [(LNAssistantIntentMetadata *)self parameterValues];
  [v4 encodeObject:v7 forKey:@"parameterValues"];

  uint64_t v8 = [(LNAssistantIntentMetadata *)self impliedValues];
  [v4 encodeObject:v8 forKey:@"impliedValues"];

  id v9 = [(LNAssistantIntentMetadata *)self availabilityAnnotations];
  [v4 encodeObject:v9 forKey:@"availabilityAnnotations"];
}

- (LNAssistantIntentMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentIdentifier"];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"phraseTemplates"];

    if (v9)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
      id v14 = [v4 decodeObjectOfClasses:v13 forKey:@"parameterValues"];

      int v15 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      id v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
      v19 = [v4 decodeObjectOfClasses:v18 forKey:@"impliedValues"];

      id v20 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = objc_opt_class();
      v23 = objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
      id v24 = [v4 decodeObjectOfClasses:v23 forKey:@"availabilityAnnotations"];

      v25 = [[LNAssistantIntentMetadata alloc] initWithIntentIdentifier:v5 phraseTemplates:v9 parameterValues:v14 impliedValues:v19 availabilityAnnotations:v24];
    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (LNAssistantIntentMetadata)initWithIntentIdentifier:(id)a3 phraseTemplates:(id)a4 parameterValues:(id)a5 impliedValues:(id)a6 availabilityAnnotations:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    int v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"LNAssistantIntentMetadata.m", 24, @"Invalid parameter not satisfying: %@", @"intentIdentifier" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:a2, self, @"LNAssistantIntentMetadata.m", 25, @"Invalid parameter not satisfying: %@", @"phraseTemplates" object file lineNumber description];

LABEL_3:
  v33.receiver = self;
  v33.super_class = (Class)LNAssistantIntentMetadata;
  id v18 = [(LNAssistantIntentMetadata *)&v33 init];
  if (v18)
  {
    uint64_t v19 = [v13 copy];
    intentIdentifier = v18->_intentIdentifier;
    v18->_intentIdentifier = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    phraseTemplates = v18->_phraseTemplates;
    v18->_phraseTemplates = (NSArray *)v21;

    uint64_t v23 = [v15 copy];
    parameterValues = v18->_parameterValues;
    v18->_parameterValues = (NSDictionary *)v23;

    uint64_t v25 = [v16 copy];
    impliedValues = v18->_impliedValues;
    v18->_impliedValues = (NSDictionary *)v25;

    uint64_t v27 = [v17 copy];
    availabilityAnnotations = v18->_availabilityAnnotations;
    v18->_availabilityAnnotations = (NSDictionary *)v27;

    id v29 = v18;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNAssistantIntentMetadata)initWithIntentIdentifier:(id)a3 phraseTemplates:(id)a4 parameterValues:(id)a5 availabilityAnnotations:(id)a6
{
  return [(LNAssistantIntentMetadata *)self initWithIntentIdentifier:a3 phraseTemplates:a4 parameterValues:a5 impliedValues:MEMORY[0x1E4F1CC08] availabilityAnnotations:a6];
}

@end