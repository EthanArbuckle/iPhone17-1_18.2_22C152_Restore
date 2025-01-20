@interface MDMRequestEnableLostModeCommand
+ (id)requestType;
+ (id)requestWithMessage:(id)a3 phoneNumber:(id)a4 footnote:(id)a5;
+ (unint64_t)requiredAccessRights;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)commandFootnote;
- (NSString)commandMessage;
- (NSString)commandPhoneNumber;
- (id)_responseForError:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)processRequest:(id)a3 completionHandler:(id)a4;
- (void)setCommandFootnote:(id)a3;
- (void)setCommandMessage:(id)a3;
- (void)setCommandPhoneNumber:(id)a3;
@end

@implementation MDMRequestEnableLostModeCommand

+ (id)requestType
{
  return @"EnableLostMode";
}

+ (unint64_t)requiredAccessRights
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MDMRequestEnableLostModeCommand;
  return (unint64_t)objc_msgSendSuper2(&v3, sel_requiredAccessRights);
}

+ (id)requestWithMessage:(id)a3 phoneNumber:(id)a4 footnote:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setCommandMessage:v9];

  [v10 setCommandPhoneNumber:v8];
  [v10 setCommandFootnote:v7];

  return v10;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  BOOL v8 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Message" forKeyPath:@"commandMessage" isRequired:0 defaultValue:0 error:a5])
  {
    BOOL v8 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"PhoneNumber" forKeyPath:@"commandPhoneNumber" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v8 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Footnote" forKeyPath:@"commandFootnote" isRequired:0 defaultValue:0 error:a5];
    }
  }

  return v8;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(MDMRequestEnableLostModeCommand *)self commandMessage];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Message" value:v5 isRequired:0 defaultValue:0];

  v6 = [(MDMRequestEnableLostModeCommand *)self commandPhoneNumber];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"PhoneNumber" value:v6 isRequired:0 defaultValue:0];

  id v7 = [(MDMRequestEnableLostModeCommand *)self commandFootnote];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Footnote" value:v7 isRequired:0 defaultValue:0];

  BOOL v8 = (void *)[v4 copy];
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MDMRequestEnableLostModeCommand;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_commandMessage copy];
  v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_commandPhoneNumber copy];
  BOOL v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSString *)self->_commandFootnote copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  return v4;
}

- (NSString)commandMessage
{
  return self->_commandMessage;
}

- (void)setCommandMessage:(id)a3
{
}

- (NSString)commandPhoneNumber
{
  return self->_commandPhoneNumber;
}

- (void)setCommandPhoneNumber:(id)a3
{
}

- (NSString)commandFootnote
{
  return self->_commandFootnote;
}

- (void)setCommandFootnote:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandFootnote, 0);
  objc_storeStrong((id *)&self->_commandPhoneNumber, 0);
  objc_storeStrong((id *)&self->_commandMessage, 0);
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = (void (**)(id, void *))a4;
  v6 = [(MDMRequestEnableLostModeCommand *)self commandMessage];
  if (v6)
  {
  }
  else
  {
    uint64_t v7 = [(MDMRequestEnableLostModeCommand *)self commandPhoneNumber];

    if (!v7)
    {
      v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263F38B10];
      v13 = DMCErrorArray();
      v14 = objc_msgSend(v11, "DMCErrorWithDomain:code:descriptionArray:errorType:", v12, 12066, v13, *MEMORY[0x263F38A40], 0);
      v15 = [(MDMRequestEnableLostModeCommand *)self _responseForError:v14];
      v5[2](v5, v15);

      goto LABEL_5;
    }
  }
  BOOL v8 = [(MDMRequestEnableLostModeCommand *)self commandMessage];
  uint64_t v9 = [(MDMRequestEnableLostModeCommand *)self commandPhoneNumber];
  v10 = [(MDMRequestEnableLostModeCommand *)self commandFootnote];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__MDMRequestEnableLostModeCommand_Handler__processRequest_completionHandler___block_invoke;
  v16[3] = &unk_264B9E180;
  v16[4] = self;
  v17 = v5;
  +[MDMFindMyUtilities enableManagedLostModeWithMessage:v8 phoneNumber:v9 footnoteText:v10 completion:v16];

LABEL_5:
}

void __77__MDMRequestEnableLostModeCommand_Handler__processRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v11 = v3;
  if (v3)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F38B10];
    BOOL v8 = DMCErrorArray();
    uint64_t v9 = objc_msgSend(v6, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v7, 12066, v8, v11, *MEMORY[0x263F38A40], 0);
    v10 = [v5 _responseForError:v9];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v10);
  }
  else
  {
    BOOL v8 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v8);
  }
}

- (id)_responseForError:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = v4;
    v6 = [v3 DMCVerboseDescription];
    int v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_ERROR, "MDMRequestEnableLostModeCommand+Handler failed to enable MDM Lost Mode with error: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = +[MDMAbstractTunnelParser responseWithError:v3];

  return v7;
}

@end