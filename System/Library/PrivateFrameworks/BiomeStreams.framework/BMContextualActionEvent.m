@interface BMContextualActionEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMContextualActionEvent)initWithIdentifier:(id)a3 appName:(id)a4 actionName:(id)a5 contents:(id)a6 parameters:(id)a7;
- (BMContextualActionEvent)initWithProto:(id)a3;
- (BMContextualActionEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)contents;
- (NSArray)parameters;
- (NSString)actionName;
- (NSString)appName;
- (NSString)description;
- (NSString)identifier;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unsigned)dataVersion;
- (void)proto;
@end

@implementation BMContextualActionEvent

- (BMContextualActionEvent)initWithIdentifier:(id)a3 appName:(id)a4 actionName:(id)a5 contents:(id)a6 parameters:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMContextualActionEvent;
  v17 = [(BMEventBase *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v18->_appName, a4);
    objc_storeStrong((id *)&v18->_actionName, a5);
    objc_storeStrong((id *)&v18->_contents, a6);
    objc_storeStrong((id *)&v18->_parameters, a7);
  }

  return v18;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"Contextual action event with identifier: %@ app name: %@ action name: %@", self->_identifier, self->_appName, self->_actionName];
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (id)jsonDict
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"identifier";
  v3 = [(BMContextualActionEvent *)self identifier];
  v11[0] = v3;
  v10[1] = @"appName";
  v4 = [(BMContextualActionEvent *)self appName];
  v11[1] = v4;
  v10[2] = @"actionName";
  id v5 = [(BMContextualActionEvent *)self actionName];
  v11[2] = v5;
  v10[3] = @"contents";
  v6 = [(BMContextualActionEvent *)self contents];
  v11[3] = v6;
  v10[4] = @"parameters";
  v7 = [(BMContextualActionEvent *)self parameters];
  v11[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMContextualActionEvent *)self jsonDict];
  uint64_t v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  uint64_t v5 = v8;

  if (v5)
  {
    v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMPOICategoryEvent json](v6);
    }
  }

  return v4;
}

- (id)encodeAsProto
{
  v2 = [(BMContextualActionEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMContextualActionEvent)initWithProto:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = self;
      uint64_t v5 = v4;
      id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v7 = [v5 contents];
      uint64_t v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v37 = v5;
      v9 = [v5 contents];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v45;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v45 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v44 + 1) + 8 * i);
            id v15 = (void *)MEMORY[0x1E4F28DC0];
            uint64_t v16 = objc_opt_class();
            id v43 = 0;
            v17 = [v15 unarchivedObjectOfClass:v16 fromData:v14 error:&v43];
            id v18 = v43;
            if (v18)
            {
              objc_super v21 = v18;
              v29 = __biome_log_for_category();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
                -[BMContextualActionEvent initWithProto:]();
              }
              v32 = 0;
LABEL_30:
              self = v36;
              v31 = v37;
              goto LABEL_31;
            }
            [v8 addObject:v17];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v49 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      id v19 = objc_alloc(MEMORY[0x1E4F1CA48]);
      id v20 = [v5 parameters];
      v9 = objc_msgSend(v19, "initWithCapacity:", objc_msgSend(v20, "count"));

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      objc_super v21 = [v5 parameters];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v40;
        id v35 = v4;
        while (2)
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v40 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void *)(*((void *)&v39 + 1) + 8 * j);
            v27 = (void *)MEMORY[0x1E4F28DC0];
            uint64_t v28 = objc_opt_class();
            id v38 = 0;
            v29 = [v27 unarchivedObjectOfClass:v28 fromData:v26 error:&v38];
            id v30 = v38;
            if (v30)
            {
              v17 = v30;
              v33 = __biome_log_for_category();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                -[BMContextualActionEvent initWithProto:]();
              }

              v32 = 0;
              id v4 = v35;
              goto LABEL_30;
            }
            [v9 addObject:v29];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v39 objects:v48 count:16];
          id v4 = v35;
          if (v23) {
            continue;
          }
          break;
        }
      }

      v31 = v5;
      objc_super v21 = [v5 identifier];
      v17 = [v5 appName];
      v29 = [v5 actionName];
      self = [(BMContextualActionEvent *)v36 initWithIdentifier:v21 appName:v17 actionName:v29 contents:v8 parameters:v9];
      v32 = self;
LABEL_31:
    }
    else
    {
      v31 = __biome_log_for_category();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
        -[BMContextualActionEvent initWithProto:]((uint64_t)self, v31);
      }
      v32 = 0;
    }
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (BMContextualActionEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [[BMPBContextualActionEvent alloc] initWithData:v4];

    self = [(BMContextualActionEvent *)self initWithProto:v5];
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
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = [(BMContextualActionEvent *)self identifier];
  [v3 setIdentifier:v4];

  uint64_t v5 = [(BMContextualActionEvent *)self appName];
  [v3 setAppName:v5];

  id v6 = [(BMContextualActionEvent *)self actionName];
  [v3 setActionName:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [(BMContextualActionEvent *)self contents];
  v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v10 = [(BMContextualActionEvent *)self contents];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        id v39 = 0;
        uint64_t v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v15 requiringSecureCoding:1 error:&v39];
        id v17 = v39;
        if (v17)
        {
          v29 = v17;
          id v30 = __biome_log_for_category();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            -[BMContextualActionEvent proto]();
          }

LABEL_24:
          id v28 = 0;
          goto LABEL_25;
        }
        [v9 addObject:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  [v3 setContents:v9];
  id v18 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v19 = [(BMContextualActionEvent *)self parameters];
  uint64_t v10 = objc_msgSend(v18, "initWithCapacity:", objc_msgSend(v19, "count"));

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v20 = [(BMContextualActionEvent *)self parameters];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v36;
    while (2)
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v36 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v35 + 1) + 8 * j);
        id v34 = 0;
        uint64_t v26 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v25 requiringSecureCoding:1 error:&v34];
        id v27 = v34;
        if (v27)
        {
          v31 = v27;
          v32 = __biome_log_for_category();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            -[BMContextualActionEvent proto]();
          }

          goto LABEL_24;
        }
        [v10 addObject:v26];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }

  [v3 setParameters:v10];
  id v28 = v3;
LABEL_25:

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    v9 = [(BMContextualActionEvent *)self identifier];
    if (v9 || ([v8 identifier], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v4 = [(BMContextualActionEvent *)self identifier];
      uint64_t v5 = [v8 identifier];
      char v10 = [v4 isEqual:v5];

      if (v9)
      {
LABEL_9:

        uint64_t v12 = [(BMContextualActionEvent *)self appName];
        if (v12 || ([v8 appName], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v5 = [(BMContextualActionEvent *)self appName];
          uint64_t v13 = [v8 appName];
          char v14 = [v5 isEqual:v13];

          if (v12)
          {
LABEL_15:

            uint64_t v15 = [(BMContextualActionEvent *)self actionName];
            if (v15 || ([v8 actionName], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              uint64_t v16 = [(BMContextualActionEvent *)self actionName];
              id v17 = [v8 actionName];
              char v18 = [v16 isEqual:v17];

              if (v15)
              {
LABEL_21:

                id v19 = [(BMContextualActionEvent *)self parameters];
                uint64_t v20 = [v8 parameters];
                char v21 = [v19 isEqual:v20];

                uint64_t v22 = [(BMContextualActionEvent *)self contents];
                uint64_t v23 = [v8 contents];
                LOBYTE(v20) = [v22 isEqual:v23];

                char v11 = v10 & v14 & v18 & v21 & v20;
                goto LABEL_22;
              }
            }
            else
            {
              char v18 = 1;
            }

            goto LABEL_21;
          }
        }
        else
        {
          char v14 = 1;
        }

        goto LABEL_15;
      }
    }
    else
    {
      char v10 = 1;
    }

    goto LABEL_9;
  }
  char v11 = 0;
LABEL_22:

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)appName
{
  return self->_appName;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (NSArray)contents
{
  return self->_contents;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_appName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_18E67D000, v0, v1, "Error while unarchiving parameters: %@", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_18E67D000, v0, v1, "Error while unarchiving contents: %@", v2, v3, v4, v5, v6);
}

- (void)initWithProto:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBContextualActionEvent proto", v5, 0xCu);
}

- (void)proto
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_18E67D000, v0, v1, "Error while archiving contents: %@", v2, v3, v4, v5, v6);
}

@end