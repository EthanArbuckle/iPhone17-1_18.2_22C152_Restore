@interface IKDOMSchema
- (BOOL)validateDocument:(id)a3 error:(id *)a4;
- (IKDOMSchema)initWithSchemaData:(id)a3;
- (void)dealloc;
@end

@implementation IKDOMSchema

- (IKDOMSchema)initWithSchemaData:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IKDOMSchema;
  v5 = [(IKDOMSchema *)&v15 init];
  if (!v5) {
    goto LABEL_5;
  }
  id v6 = v4;
  Memory = xmlReadMemory((const char *)[v6 bytes], objc_msgSend(v6, "length"), 0, 0, 0);
  if (!Memory)
  {
    v12 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[IKDOMSchema initWithSchemaData:]();
    }
    goto LABEL_13;
  }
  v8 = Memory;
  v9 = xmlSchemaNewDocParserCtxt(Memory);
  if (!v9)
  {
    v13 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[IKDOMSchema initWithSchemaData:]();
    }

    xmlFreeDoc(v8);
    goto LABEL_14;
  }
  v10 = v9;
  xmlSchemaSetParserErrors(v9, MEMORY[0x1E4F14830], 0, (void *)*MEMORY[0x1E4F143C8]);
  v5->_schemaPtr = xmlSchemaParse(v10);
  xmlSchemaFreeParserCtxt(v10);
  xmlFreeDoc(v8);
  if (!v5->_schemaPtr)
  {
    v12 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[IKDOMSchema initWithSchemaData:]();
    }
LABEL_13:

LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
LABEL_5:
  v11 = v5;
LABEL_15:

  return v11;
}

- (void)dealloc
{
  schemaPtr = self->_schemaPtr;
  if (schemaPtr) {
    xmlSchemaFree(schemaPtr);
  }
  v4.receiver = self;
  v4.super_class = (Class)IKDOMSchema;
  [(IKDOMSchema *)&v4 dealloc];
}

- (BOOL)validateDocument:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 nodePtr];
  if (!v6 || (v7 = (xmlDoc *)v6, (schemaPtr = self->_schemaPtr) == 0))
  {
    v13 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[IKDOMSchema validateDocument:error:]();
    }

    if (!a4) {
      return 0;
    }
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22 = @"Invalid docPtr or schemaPtr given for validating DOM Document";
    objc_super v15 = (void *)MEMORY[0x1E4F1C9E8];
    v16 = &v22;
    v17 = &v21;
    goto LABEL_12;
  }
  v9 = xmlSchemaNewValidCtxt(schemaPtr);
  if (!v9)
  {
    v20 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[IKDOMSchema validateDocument:error:]();
    }

    if (!a4) {
      return 0;
    }
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"Failed to create schema context";
    objc_super v15 = (void *)MEMORY[0x1E4F1C9E8];
    v16 = (__CFString **)v24;
    v17 = &v23;
LABEL_12:
    v18 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
    *a4 = [v14 errorWithDomain:@"ITMLKitErrorDomain" code:201 userInfo:v18];

    return 0;
  }
  v10 = v9;
  xmlSchemaSetValidErrors(v9, MEMORY[0x1E4F14830], 0, (void *)*MEMORY[0x1E4F143C8]);
  int v11 = xmlSchemaValidateDoc(v10, v7);
  BOOL v12 = v11 == 0;
  if (a4 && v11)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ITMLKitErrorDomain" code:201 userInfo:0];
  }
  xmlSchemaFreeValidCtxt(v10);
  return v12;
}

- (void)initWithSchemaData:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1E2ACE000, v0, v1, "Schema could not be loaded", v2, v3, v4, v5, v6);
}

- (void)initWithSchemaData:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1E2ACE000, v0, v1, "Failed to create parser context for schema", v2, v3, v4, v5, v6);
}

- (void)initWithSchemaData:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1E2ACE000, v0, v1, "Schema is not valid", v2, v3, v4, v5, v6);
}

- (void)validateDocument:error:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1E2ACE000, v0, v1, "Invalid docPtr or schemaPtr given for validating DOM Document", v2, v3, v4, v5, v6);
}

- (void)validateDocument:error:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1E2ACE000, v0, v1, "Failed to create schema context", v2, v3, v4, v5, v6);
}

@end