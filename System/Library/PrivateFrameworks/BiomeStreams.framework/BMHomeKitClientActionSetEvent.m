@interface BMHomeKitClientActionSetEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMHomeKitClientActionSetEvent)initWithBase:(id)a3 actionSetUniqueIdentifier:(id)a4 actionSetType:(id)a5 associatedAccessoryUniqueIdentifiers:(id)a6 actionSetName:(id)a7 homeName:(id)a8;
- (BMHomeKitClientActionSetEvent)initWithProto:(id)a3;
- (BMHomeKitClientActionSetEvent)initWithProtoData:(id)a3;
- (BMHomeKitClientBase)base;
- (BOOL)isEqual:(id)a3;
- (NSArray)associatedAccessoryUniqueIdentifiers;
- (NSString)actionSetName;
- (NSString)actionSetType;
- (NSString)actionSetUniqueIdentifier;
- (NSString)description;
- (NSString)homeName;
- (id)encodeAsProto;
- (id)proto;
- (unsigned)dataVersion;
@end

@implementation BMHomeKitClientActionSetEvent

- (BMHomeKitClientActionSetEvent)initWithBase:(id)a3 actionSetUniqueIdentifier:(id)a4 actionSetType:(id)a5 associatedAccessoryUniqueIdentifiers:(id)a6 actionSetName:(id)a7 homeName:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)BMHomeKitClientActionSetEvent;
  v18 = [(BMEventBase *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_base, a3);
    objc_storeStrong((id *)&v19->_actionSetUniqueIdentifier, a4);
    objc_storeStrong((id *)&v19->_actionSetType, a5);
    objc_storeStrong((id *)&v19->_associatedAccessoryUniqueIdentifiers, a6);
    objc_storeStrong((id *)&v19->_actionSetName, a7);
    objc_storeStrong((id *)&v19->_homeName, a8);
  }

  return v19;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"BMHomeKitClientActionSetEvent event with base: %@, actionSetUniqueIdentifier: %@, actionSetType: %@, associatedAccessoryUniqueIdentifiers: %@, actionSetName: %@, homeName: %@", self->_base, self->_actionSetUniqueIdentifier, self->_actionSetType, self->_associatedAccessoryUniqueIdentifiers, self->_actionSetName, self->_homeName];

  return (NSString *)v2;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4)
  {
    v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[BMHomeKitClientActionSetEvent eventWithData:dataVersion:](v7);
    }

    v8 = 0;
  }
  else
  {
    v8 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }

  return v8;
}

- (id)encodeAsProto
{
  v2 = [(BMHomeKitClientActionSetEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMHomeKitClientActionSetEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BMHomeKitClientActionSetEvent initWithProto:]((uint64_t)self, v15);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  id v6 = [BMHomeKitClientBase alloc];
  v7 = [v5 base];
  v8 = [(BMHomeKitClientBase *)v6 initWithProto:v7];
  v9 = [v5 actionSetUniqueIdentifier];
  v10 = [v5 actionSetType];
  v11 = [v5 associatedAccessoryUniqueIdentifiers];
  v12 = [v5 actionSetName];
  v13 = [v5 homeName];

  self = [(BMHomeKitClientActionSetEvent *)self initWithBase:v8 actionSetUniqueIdentifier:v9 actionSetType:v10 associatedAccessoryUniqueIdentifiers:v11 actionSetName:v12 homeName:v13];
  v14 = self;
LABEL_8:

  return v14;
}

- (BMHomeKitClientActionSetEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBHomeKitClientActionSetEvent alloc] initWithData:v4];

    self = [(BMHomeKitClientActionSetEvent *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(BMHomeKitClientActionSetEvent *)self base];
  id v5 = [v4 proto];
  [v3 setBase:v5];

  id v6 = [(BMHomeKitClientActionSetEvent *)self actionSetUniqueIdentifier];
  [v3 setActionSetUniqueIdentifier:v6];

  v7 = [(BMHomeKitClientActionSetEvent *)self actionSetType];
  [v3 setActionSetType:v7];

  v8 = (void *)MEMORY[0x1E4F1CA48];
  v9 = [(BMHomeKitClientActionSetEvent *)self associatedAccessoryUniqueIdentifiers];
  v10 = [v8 arrayWithArray:v9];
  [v3 setAssociatedAccessoryUniqueIdentifiers:v10];

  v11 = [(BMHomeKitClientActionSetEvent *)self actionSetName];
  [v3 setActionSetName:v11];

  v12 = [(BMHomeKitClientActionSetEvent *)self homeName];
  [v3 setHomeName:v12];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    v11 = [(BMHomeKitClientActionSetEvent *)self base];
    if (v11 || ([v10 base], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v4 = [(BMHomeKitClientActionSetEvent *)self base];
      id v5 = [v10 base];
      char v29 = [v4 isEqual:v5];

      if (v11)
      {
LABEL_9:

        v13 = [(BMHomeKitClientActionSetEvent *)self actionSetUniqueIdentifier];
        if (v13
          || ([v10 actionSetUniqueIdentifier], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v5 = [(BMHomeKitClientActionSetEvent *)self actionSetUniqueIdentifier];
          id v6 = [v10 actionSetUniqueIdentifier];
          char v28 = [v5 isEqual:v6];

          if (v13)
          {
LABEL_15:

            v14 = [(BMHomeKitClientActionSetEvent *)self actionSetType];
            if (v14 || ([v10 actionSetType], (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              id v6 = [(BMHomeKitClientActionSetEvent *)self actionSetType];
              v7 = [v10 actionSetType];
              char v15 = [v6 isEqual:v7];

              if (v14)
              {
LABEL_21:

                id v16 = [(BMHomeKitClientActionSetEvent *)self associatedAccessoryUniqueIdentifiers];
                if (v16
                  || ([v10 associatedAccessoryUniqueIdentifiers],
                      (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  v7 = [(BMHomeKitClientActionSetEvent *)self associatedAccessoryUniqueIdentifiers];
                  id v17 = [v10 associatedAccessoryUniqueIdentifiers];
                  char v18 = [v7 isEqual:v17];

                  if (v16)
                  {
LABEL_27:

                    v19 = [(BMHomeKitClientActionSetEvent *)self actionSetName];
                    if (v19
                      || ([v10 actionSetName], (v7 = objc_claimAutoreleasedReturnValue()) != 0))
                    {
                      v20 = [(BMHomeKitClientActionSetEvent *)self actionSetName];
                      id v21 = [v10 actionSetName];
                      char v22 = [v20 isEqual:v21];

                      if (v19)
                      {
LABEL_33:

                        id v23 = [(BMHomeKitClientActionSetEvent *)self homeName];
                        if (v23
                          || ([v10 homeName], (v7 = objc_claimAutoreleasedReturnValue()) != 0))
                        {
                          objc_super v24 = [(BMHomeKitClientActionSetEvent *)self homeName];
                          v25 = [v10 homeName];
                          char v26 = [v24 isEqual:v25];

                          if (v23)
                          {
LABEL_39:

                            char v12 = v29 & v28 & v15 & v18 & v22 & v26;
                            goto LABEL_40;
                          }
                        }
                        else
                        {
                          char v26 = 1;
                        }

                        goto LABEL_39;
                      }
                    }
                    else
                    {
                      char v22 = 1;
                    }

                    goto LABEL_33;
                  }
                }
                else
                {
                  char v18 = 1;
                }

                goto LABEL_27;
              }
            }
            else
            {
              char v15 = 1;
            }

            goto LABEL_21;
          }
        }
        else
        {
          char v28 = 1;
        }

        goto LABEL_15;
      }
    }
    else
    {
      char v29 = 1;
    }

    goto LABEL_9;
  }
  char v12 = 0;
LABEL_40:

  return v12;
}

- (BMHomeKitClientBase)base
{
  return self->_base;
}

- (NSString)actionSetUniqueIdentifier
{
  return self->_actionSetUniqueIdentifier;
}

- (NSString)actionSetType
{
  return self->_actionSetType;
}

- (NSArray)associatedAccessoryUniqueIdentifiers
{
  return self->_associatedAccessoryUniqueIdentifiers;
}

- (NSString)actionSetName
{
  return self->_actionSetName;
}

- (NSString)homeName
{
  return self->_homeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_actionSetName, 0);
  objc_storeStrong((id *)&self->_associatedAccessoryUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_actionSetType, 0);
  objc_storeStrong((id *)&self->_actionSetUniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_base, 0);
}

+ (void)eventWithData:(os_log_t)log dataVersion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "Mismatched BMHomeKitClientActionSetEvent data versions, cannot deserialize", v1, 2u);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBHomeKitClientActionSetEvent proto", (uint8_t *)&v5, 0xCu);
}

@end