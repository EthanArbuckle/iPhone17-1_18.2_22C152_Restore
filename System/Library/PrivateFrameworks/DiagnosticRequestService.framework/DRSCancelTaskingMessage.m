@interface DRSCancelTaskingMessage
+ (id)messageType;
- (BOOL)_isEqualToMessage:(id)a3;
- (BOOL)_versionIsSupported:(id)a3;
- (DRSCancelTaskingMessage)initWithJSONDict:(id)a3;
- (DRSCancelTaskingMessage)initWithVersion:(id)a3 messageUUID:(id)a4 dateBroadcast:(id)a5 dateReceived:(id)a6 perTeamCancelledConfigUUIDs:(id)a7;
- (NSDictionary)perTeamCancelledConfigUUIDs;
- (id)jsonDictRepresentation;
@end

@implementation DRSCancelTaskingMessage

- (BOOL)_versionIsSupported:(id)a3
{
  return [(id)kDRSCancelTaskingMessageCurrentVersion isEqualToString:a3];
}

+ (id)messageType
{
  return @"CancelTaskingMessage";
}

- (DRSCancelTaskingMessage)initWithVersion:(id)a3 messageUUID:(id)a4 dateBroadcast:(id)a5 dateReceived:(id)a6 perTeamCancelledConfigUUIDs:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (_checkCancelNonNil((uint64_t)v12, (uint64_t)"version")
    && _checkCancelNonNil((uint64_t)v13, (uint64_t)"cancelTaskingUUID")
    && _checkCancelNonNil((uint64_t)v16, (uint64_t)"perTeamCancelledConfigUUIDs"))
  {
    v21.receiver = self;
    v21.super_class = (Class)DRSCancelTaskingMessage;
    v17 = [(DRSTaskingSystemMessage *)&v21 initWithVersion:v12 messageUUID:v13 dateBroadcast:v14 dateReceived:v15];
    v18 = v17;
    if (v17) {
      objc_storeStrong((id *)&v17->_perTeamCancelledConfigUUIDs, a7);
    }
    self = v18;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)_isEqualToMessage:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DRSCancelTaskingMessage;
  if ([(DRSTaskingSystemMessage *)&v10 _isEqualToMessage:v4])
  {
    id v5 = v4;
    v6 = [(DRSCancelTaskingMessage *)self perTeamCancelledConfigUUIDs];
    v7 = [v5 perTeamCancelledConfigUUIDs];

    char v8 = [v6 isEqualToDictionary:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)jsonDictRepresentation
{
  v13[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(DRSCancelTaskingMessage *)self perTeamCancelledConfigUUIDs];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__DRSCancelTaskingMessage_jsonDictRepresentation__block_invoke;
  v10[3] = &unk_263FCA608;
  id v11 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];

  uint64_t v12 = kDRSCancelTaskingMessage_perTeamCancelledConfigUUIDsKey;
  v13[0] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v9.receiver = self;
  v9.super_class = (Class)DRSCancelTaskingMessage;
  v7 = [(DRSTaskingSystemMessage *)&v9 _mutableJSONDictRepresentation];
  [v7 addEntriesFromDictionary:v6];

  return v7;
}

void __49__DRSCancelTaskingMessage_jsonDictRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "UUIDString", (void)v14);
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
}

- (DRSCancelTaskingMessage)initWithJSONDict:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() isJSONDictForClass:v4])
  {
    id v5 = [v4 objectForKeyedSubscript:kDRSTaskingSystemMessage_messageUUIDKey];
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v7 = DPLogHandle_TaskingMessageError();
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelTaskingMessageJSONInitError", "Invalid cancelTaskingUUID", buf, 2u);
      }
      id v13 = 0;
      id v6 = v5;
      goto LABEL_21;
    }
    id v6 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v5];

    v7 = _dateFromJSONDict(v4, kDRSTaskingSystemMessage_DateReceivedKey);
    id v8 = _dateFromJSONDict(v4, (uint64_t)kDRSTaskingSystemMessage_DateBroadcastKey);
    uint64_t v9 = [v4 objectForKeyedSubscript:kDRSCancelTaskingMessage_perTeamCancelledConfigUUIDsKey];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(void *)buf = 0;
        v20 = buf;
        uint64_t v21 = 0x2020000000;
        char v22 = 0;
        uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __44__DRSCancelTaskingMessage_initWithJSONDict___block_invoke;
        v16[3] = &unk_263FCA630;
        v18 = buf;
        id v11 = v10;
        id v17 = v11;
        [v9 enumerateKeysAndObjectsUsingBlock:v16];
        int v12 = v20[24];

        _Block_object_dispose(buf, 8);
        if (!v12) {
          goto LABEL_15;
        }
      }
      else
      {
        long long v14 = DPLogHandle_TaskingMessageError();
        if (os_signpost_enabled(v14))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelTaskingMessageJSONInitError", "Invalid perTeamCancelledUUIDStringsDict", buf, 2u);
        }

        id v11 = 0;
      }
      id v13 = 0;
      goto LABEL_20;
    }
    id v11 = 0;
LABEL_15:

    uint64_t v9 = [(DRSTaskingSystemMessage *)self _versionFromJSONDict:v4];
    self = [(DRSCancelTaskingMessage *)self initWithVersion:v9 messageUUID:v6 dateBroadcast:v8 dateReceived:v7 perTeamCancelledConfigUUIDs:v11];
    id v13 = self;
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  id v6 = DPLogHandle_TaskingMessageError();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelTaskingMessageJSONInitError", "JSON dictionary of wrong type", buf, 2u);
  }
  id v13 = 0;
LABEL_22:

  return v13;
}

void __44__DRSCancelTaskingMessage_initWithJSONDict___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [MEMORY[0x263EFF980] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      uint64_t v23 = a1;
      id v24 = v7;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        uint64_t v16 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v15];
        if (!v16)
        {
          uint64_t v19 = DPLogHandle_TaskingMessageError();
          if (os_signpost_enabled(v19))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v30 = v15;
            v20 = "Invalid UUID string (%{public}@)";
            uint64_t v21 = v19;
            uint32_t v22 = 12;
LABEL_19:
            _os_signpost_emit_with_name_impl(&dword_209E70000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelTaskingMessageJSONInitError", v20, buf, v22);
          }
          goto LABEL_20;
        }
        id v17 = (void *)v16;
        [v9 addObject:v16];

        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
          a1 = v23;
          id v7 = v24;
          if (v12) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
      uint64_t v19 = DPLogHandle_TaskingMessageError();
      if (os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        v20 = "Invalid UUID string class";
        uint64_t v21 = v19;
        uint32_t v22 = 2;
        goto LABEL_19;
      }
LABEL_20:
      id v7 = v24;

      *(unsigned char *)(*(void *)(*(void *)(v23 + 40) + 8) + 24) = 1;
      *a4 = 1;

      goto LABEL_21;
    }
LABEL_11:

    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
LABEL_21:
  }
  else
  {
    v18 = DPLogHandle_TaskingMessageError();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelTaskingMessageJSONInitError", "Invalid perTeamCancelledUUIDStringsDict class", buf, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (NSDictionary)perTeamCancelledConfigUUIDs
{
  return self->_perTeamCancelledConfigUUIDs;
}

- (void).cxx_destruct
{
}

@end