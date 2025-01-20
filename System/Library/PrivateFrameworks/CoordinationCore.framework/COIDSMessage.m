@interface COIDSMessage
- (BOOL)checkValue:(id)a3 forKey:(id)a4 isKindOfClass:(Class)a5 error:(id *)a6;
- (BOOL)validateCommand:(id *)a3 error:(id *)a4;
- (BOOL)validateData:(id *)a3 error:(id *)a4;
- (BOOL)validateError:(id *)a3 error:(id *)a4;
- (BOOL)validateMetadata:(id *)a3 error:(id *)a4;
- (BOOL)validateType:(id *)a3 error:(id *)a4;
- (BOOL)validateVersion:(id *)a3 error:(id *)a4;
- (COIDSMessage)initWithDictionary:(id)a3 error:(id *)a4;
- (COIDSMessage)initWithError:(id)a3;
- (COIDSMessage)initWithRequest:(id)a3;
- (COIDSMessage)initWithResponse:(id)a3;
- (NSData)payload;
- (NSDictionary)metadata;
- (NSError)error;
- (NSString)command;
- (id)dictionaryRepresentation;
- (id)unarchivePayloadOfTypes:(id)a3 error:(id *)a4;
- (unint64_t)type;
- (unint64_t)version;
- (void)_commandPayload:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation COIDSMessage

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithUnsignedInteger:1];
  [v3 setObject:v4 forKey:@"VR"];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[COIDSMessage type](self, "type"));
  [v3 setObject:v5 forKey:@"MT"];

  if ([(COIDSMessage *)self type] == 2)
  {
    v6 = [(COIDSMessage *)self error];
    v7 = _errorToDictionary(v6);
    [v3 setObject:v7 forKey:@"ER"];
  }
  else
  {
    v8 = [(COIDSMessage *)self payload];
    [v3 setObject:v8 forKey:@"PL"];

    v6 = [(COIDSMessage *)self command];
    [v3 setObject:v6 forKey:@"CM"];
  }

  v9 = [(COIDSMessage *)self metadata];

  if (v9)
  {
    v10 = [(COIDSMessage *)self metadata];
    [v3 setObject:v10 forKey:@"MK"];
  }
  return v3;
}

- (BOOL)checkValue:(id)a3 forKey:(id)a4 isKindOfClass:(Class)a5 error:(id *)a6
{
  v16[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    if (!a6) {
      goto LABEL_9;
    }
    v10 = @"missing property '%@'";
LABEL_8:
    v11 = objc_msgSend(NSString, "stringWithFormat:", v10, v9);
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F07F80];
    v16[0] = v11;
    v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *a6 = [v12 errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:v13];

    LOBYTE(a6) = 0;
    goto LABEL_9;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a6) {
      goto LABEL_9;
    }
    v10 = @"property '%@' has wrong type";
    goto LABEL_8;
  }
  LOBYTE(a6) = 1;
LABEL_9:

  return (char)a6;
}

- (BOOL)validateVersion:(id *)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  BOOL v6 = [(COIDSMessage *)self checkValue:*a3 forKey:@"version" isKindOfClass:objc_opt_class() error:a4];
  if (v6)
  {
    uint64_t v7 = [*a3 unsignedIntegerValue];
    LOBYTE(v6) = v7 == 1;
    if (a4)
    {
      if (v7 != 1)
      {
        id v8 = objc_msgSend(NSString, "stringWithFormat:", @"invalid version '%lu'", v7);
        id v9 = (void *)MEMORY[0x263F087E8];
        uint64_t v12 = *MEMORY[0x263F07F80];
        v13[0] = v8;
        v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
        *a4 = [v9 errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:v10];

        LOBYTE(v6) = 0;
      }
    }
  }
  return v6;
}

- (BOOL)validateType:(id *)a3 error:(id *)a4
{
  v4 = a4;
  v22[1] = *MEMORY[0x263EF8340];
  if ([(COIDSMessage *)self checkValue:*a3 forKey:@"type" isKindOfClass:objc_opt_class() error:a4])
  {
    id v7 = *a3;
    unint64_t v8 = [v7 unsignedIntegerValue];
    if (v8 >= 3)
    {
      if (!v4)
      {
LABEL_14:

        return (char)v4;
      }
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"invalid message type '%lu'", v8);
      v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v21 = *MEMORY[0x263F07F80];
      v22[0] = v9;
      v11 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id *v4 = [v10 errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:v11];

LABEL_5:
      LOBYTE(v4) = 0;
      goto LABEL_14;
    }
    if (v8 >= 2)
    {
      if (!self->_error)
      {
        if (!v4) {
          goto LABEL_14;
        }
        uint64_t v12 = (void *)MEMORY[0x263F087E8];
        uint64_t v17 = *MEMORY[0x263F07F80];
        v18 = @"'error' property missing";
        v13 = NSDictionary;
        v14 = &v18;
        uint64_t v15 = &v17;
LABEL_18:
        id v9 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];
        id *v4 = [v12 errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:v9];
        goto LABEL_5;
      }
    }
    else if (self->_command && !self->_payload)
    {
      if (!v4) {
        goto LABEL_14;
      }
      uint64_t v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = *MEMORY[0x263F07F80];
      v20 = @"'payload' property missing";
      v13 = NSDictionary;
      v14 = &v20;
      uint64_t v15 = &v19;
      goto LABEL_18;
    }
    LOBYTE(v4) = 1;
    goto LABEL_14;
  }
  LOBYTE(v4) = 0;
  return (char)v4;
}

- (BOOL)validateCommand:(id *)a3 error:(id *)a4
{
  id v4 = *a3;
  if (!*a3) {
    return 1;
  }
  uint64_t v7 = objc_opt_class();
  return [(COIDSMessage *)self checkValue:v4 forKey:@"command" isKindOfClass:v7 error:a4];
}

- (BOOL)validateData:(id *)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  if (!*a3) {
    goto LABEL_4;
  }
  BOOL v6 = [(COIDSMessage *)self checkValue:*a3 forKey:@"payload" isKindOfClass:objc_opt_class() error:a4];
  if (v6)
  {
    if (self->_command)
    {
LABEL_4:
      LOBYTE(v6) = 1;
      return v6;
    }
    if (a4)
    {
      uint64_t v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = *MEMORY[0x263F07F80];
      v11[0] = @"'command' property missing";
      unint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
      *a4 = [v7 errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:v8];
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)validateError:(id *)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  if (!*a3) {
    return 1;
  }
  if (![(COIDSMessage *)self checkValue:*a3 forKey:@"error" isKindOfClass:objc_opt_class() error:a4])return 0; {
  id v6 = *a3;
  }
  uint64_t v7 = _errorFromDictionary(v6);
  unint64_t v8 = v7;
  BOOL v9 = v7 != 0;
  if (v7)
  {
    *a3 = v7;
  }
  else if (a4)
  {
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F07F80];
    v14[0] = @"'error' data invalid";
    v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a4 = [v10 errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:v11];
  }
  return v9;
}

- (BOOL)validateMetadata:(id *)a3 error:(id *)a4
{
  id v4 = *a3;
  if (!*a3) {
    return 1;
  }
  uint64_t v7 = objc_opt_class();
  return [(COIDSMessage *)self checkValue:v4 forKey:@"metadata" isKindOfClass:v7 error:a4];
}

- (COIDSMessage)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)COIDSMessage;
  uint64_t v7 = [(COIDSMessage *)&v16 init];
  if (v7)
  {
    uint64_t v8 = 0;
    while (1)
    {
      BOOL v9 = [v6 objectForKey:initWithDictionary_error__fields[v8]];
      id v15 = v9;
      uint64_t v10 = initWithDictionary_error__fields[v8 + 1];
      int v11 = [(COIDSMessage *)v7 validateValue:&v15 forKey:v10 error:a4];
      id v12 = v15;

      if (!v11) {
        break;
      }
      [(COIDSMessage *)v7 setValue:v12 forKey:v10];

      v8 += 2;
      if (v8 == 12) {
        goto LABEL_5;
      }
    }

    uint64_t v13 = 0;
  }
  else
  {
LABEL_5:
    uint64_t v13 = v7;
  }

  return v13;
}

- (COIDSMessage)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COIDSMessage;
  id v6 = [(COIDSMessage *)&v9 init];
  uint64_t v7 = (COIDSMessage *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = xmmword_22188FF40;
    objc_storeStrong((id *)v6 + 5, a3);
  }

  return v7;
}

- (COIDSMessage)initWithRequest:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COIDSMessage;
  id v5 = [(COIDSMessage *)&v8 init];
  id v6 = (COIDSMessage *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = xmmword_22188FF30;
    [v5 _commandPayload:v4];
  }

  return v6;
}

- (COIDSMessage)initWithResponse:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COIDSMessage;
  id v5 = [(COIDSMessage *)&v8 init];
  id v6 = (COIDSMessage *)v5;
  if (v5)
  {
    *(int64x2_t *)(v5 + 8) = vdupq_n_s64(1uLL);
    [v5 _commandPayload:v4];
  }

  return v6;
}

- (id)unarchivePayloadOfTypes:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(COIDSMessage *)self command];
  char v8 = [v6 containsObject:v7];

  if (v8)
  {
    objc_super v9 = [(COIDSMessage *)self command];
    Class v10 = NSClassFromString(v9);

    int v11 = (void *)MEMORY[0x263F08928];
    id v12 = [(COIDSMessage *)self payload];
    a4 = [v11 unarchivedObjectOfClass:v10 fromData:v12 error:a4];
  }
  else if (a4)
  {
    uint64_t v13 = NSString;
    v14 = [(COIDSMessage *)self command];
    id v15 = [v13 stringWithFormat:@"Invalid type: %@", v14];

    objc_super v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F07F70];
    uint64_t v20 = *MEMORY[0x263F07F80];
    v21[0] = v15;
    v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    *a4 = [v16 errorWithDomain:v17 code:4866 userInfo:v18];

    a4 = 0;
  }
  return a4;
}

- (void)_commandPayload:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  command = self->_command;
  self->_command = v6;

  char v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  payload = self->_payload;
  self->_payload = v8;

  if (!self->_payload)
  {
    if (class_getMethodImplementation(v5, sel_supportsSecureCoding)
      && class_getMethodImplementation(v5, sel_encodeWithCoder_))
    {
      Class v10 = COCoreLogForCategory(17);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[COIDSMessage _commandPayload:]((uint64_t)v4, v10);
      }
    }
    else
    {
      Class v10 = COCoreLogForCategory(17);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[COIDSMessage _commandPayload:](v5, v10);
      }
    }

    int v11 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263F08160] reason:0 userInfo:0];
    [v11 raise];
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)command
{
  return self->_command;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSError)error
{
  return self->_error;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

- (void)_commandPayload:(objc_class *)a1 .cold.1(objc_class *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = NSStringFromClass(a1);
  int v4 = 138412290;
  id v5 = v3;
  _os_log_fault_impl(&dword_2217C1000, a2, OS_LOG_TYPE_FAULT, "%@ does not appear to properly support secure coding which is required for all commands going over IDS!", (uint8_t *)&v4, 0xCu);
}

- (void)_commandPayload:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_2217C1000, a2, OS_LOG_TYPE_FAULT, "Failed to properly archive for sending over IDS: %@", (uint8_t *)&v2, 0xCu);
}

@end