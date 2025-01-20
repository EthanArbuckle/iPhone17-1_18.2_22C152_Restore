@interface GEOXPCMessage
+ (BOOL)canDecodeFromXPCDictionary:(id)a3;
+ (NSString)messageName;
+ (id)decodeFromXPCDictionary:(id)a3 error:(id *)a4;
- (BOOL)sendSync:(id)a3 error:(id *)a4;
- (GEOXPCMessage)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (id)_prepareMessage;
- (id)description;
- (void)send:(id)a3;
@end

@implementation GEOXPCMessage

- (void)send:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    __int16 v10 = 0;
    v6 = MEMORY[0x1E4F14500];
    v7 = "Assertion failed: connection != ((void *)0)";
    v8 = (uint8_t *)&v10;
LABEL_9:
    _os_log_fault_impl(&dword_188D96000, v6, OS_LOG_TYPE_FAULT, v7, v8, 2u);
    goto LABEL_4;
  }
  if (([(GEOXPCMessage *)self conformsToProtocol:&unk_1ED747540] & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    __int16 v9 = 0;
    v6 = MEMORY[0x1E4F14500];
    v7 = "Assertion failed: [self conformsToProtocol:@protocol(GEOXPCMessage)]";
    v8 = (uint8_t *)&v9;
    goto LABEL_9;
  }
  v5 = [(GEOXPCMessage *)self _prepareMessage];
  [v4 sendMessage:v5];

LABEL_4:
}

+ (id)decodeFromXPCDictionary:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([a1 conformsToProtocol:&unk_1ED747540])
  {
    v7 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v6, "message"));
    v8 = [(id)objc_opt_class() messageName];
    char v9 = [v7 isEqual:v8];

    if (v9)
    {
      __int16 v10 = xpc_dictionary_get_value(v6, "__msg");
      if (v10 || (xpc_dictionary_get_value(v6, "userInfo"), (__int16 v10 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v11 = (void *)[objc_alloc((Class)a1) initWithXPCDictionary:v10 error:a4];

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {
      if (a4)
      {
        *a4 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12];
      }
      v12 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOXPC");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        int v16 = 138412546;
        v17 = v14;
        __int16 v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "Can not parse message as %@: \"%@\"", (uint8_t *)&v16, 0x16u);
      }
    }
    v11 = 0;
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    LOWORD(v16) = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [self conformsToProtocol:@protocol(GEOXPCMessage)]", (uint8_t *)&v16, 2u);
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (id)_prepareMessage
{
  if ([(GEOXPCMessage *)self conformsToProtocol:&unk_1ED747540]
    && [(GEOXPCMessage *)self isValid])
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    GEOEncodeModernXPCMessage(self, v3);
    id v4 = [(id)objc_opt_class() messageName];
    xpc_dictionary_set_string(v3, "message", (const char *)[v4 UTF8String]);
  }
  else
  {
    xpc_object_t v3 = 0;
  }

  return v3;
}

+ (BOOL)canDecodeFromXPCDictionary:(id)a3
{
  id v4 = a3;
  if (([a1 conformsToProtocol:&unk_1ED747540] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)char v9 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [self conformsToProtocol:@protocol(GEOXPCMessage)]", v9, 2u);
    }
    goto LABEL_8;
  }
  if (!v4 || MEMORY[0x18C1213B0](v4) != MEMORY[0x1E4F14590])
  {
LABEL_8:
    char v7 = 0;
    goto LABEL_5;
  }
  v5 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v4, "message"));
  id v6 = [(id)objc_opt_class() messageName];
  char v7 = [v5 isEqual:v6];

LABEL_5:
  return v7;
}

- (GEOXPCMessage)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOXPCMessage;
  char v7 = [(GEOXPCMessage *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_object, a3);
    char v9 = v8;
  }

  return v8;
}

- (void).cxx_destruct
{
}

+ (NSString)messageName
{
  return 0;
}

- (BOOL)sendSync:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
LABEL_16:
      BOOL v10 = 0;
      goto LABEL_12;
    }
    __int16 v19 = 0;
    v15 = MEMORY[0x1E4F14500];
    int v16 = "Assertion failed: connection != ((void *)0)";
    v17 = (uint8_t *)&v19;
LABEL_18:
    _os_log_fault_impl(&dword_188D96000, v15, OS_LOG_TYPE_FAULT, v16, v17, 2u);
    goto LABEL_16;
  }
  if (([(GEOXPCMessage *)self conformsToProtocol:&unk_1ED747540] & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    __int16 v18 = 0;
    v15 = MEMORY[0x1E4F14500];
    int v16 = "Assertion failed: [self conformsToProtocol:@protocol(GEOXPCMessage)]";
    v17 = (uint8_t *)&v18;
    goto LABEL_18;
  }
  char v7 = [(GEOXPCMessage *)self _prepareMessage];
  v8 = [v6 sendMessageWithReplySync:v7];
  if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F145A8])
  {
    objc_super v11 = GEOXPCErrorFromReply(v8);
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15 reason:@"Unexpected response"];
    }
    id v9 = v13;

    BOOL v10 = 1;
    if (a4 && v9)
    {
      id v9 = v9;
      BOOL v10 = 0;
      *a4 = v9;
    }
  }
  else
  {
    id v9 = 0;
    BOOL v10 = 1;
  }

LABEL_12:
  return v10;
}

- (id)description
{
  xpc_object_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(id)objc_opt_class() messageName];
  char v7 = [v3 stringWithFormat:@"<%@: %p {messageName: %@ object: %@}>", v5, self, v6, self->_object];

  return v7;
}

@end