@interface DRSTaskingMessage
+ (id)messageType;
- (BOOL)_isEqualToMessage:(id)a3;
- (BOOL)_versionIsSupported:(id)a3;
- (DRSTaskingMessage)initWithJSONDict:(id)a3;
- (DRSTaskingMessage)initWithVersion:(id)a3 messageUUID:(id)a4 dateBroadcast:(id)a5 dateReceived:(id)a6 teamTaskings:(id)a7;
- (NSDictionary)teamTaskings;
- (id)jsonDictRepresentation;
@end

@implementation DRSTaskingMessage

- (BOOL)_versionIsSupported:(id)a3
{
  return [@"1.0" isEqualToString:a3];
}

+ (id)messageType
{
  return @"TaskingMessage";
}

- (DRSTaskingMessage)initWithVersion:(id)a3 messageUUID:(id)a4 dateBroadcast:(id)a5 dateReceived:(id)a6 teamTaskings:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = v16;
  if (!v13)
  {
    v19 = DPLogHandle_TaskingMessageError();
    if (!os_signpost_enabled(v19)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v20 = "nil taskingMessageUUID";
LABEL_12:
    _os_signpost_emit_with_name_impl(&dword_209E70000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSTaskingMessageFailedInit", v20, buf, 2u);
    goto LABEL_13;
  }
  if (!v16)
  {
    v19 = DPLogHandle_TaskingMessageError();
    if (!os_signpost_enabled(v19)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v20 = "nil teamTaskings";
    goto LABEL_12;
  }
  if (![v16 count])
  {
    v19 = DPLogHandle_TaskingMessageError();
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      v20 = "Empty teamTaskings";
      goto LABEL_12;
    }
LABEL_13:

    v18 = 0;
    goto LABEL_18;
  }
  *(void *)buf = 0;
  v27 = buf;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __89__DRSTaskingMessage_initWithVersion_messageUUID_dateBroadcast_dateReceived_teamTaskings___block_invoke;
  v25[3] = &unk_263FCA590;
  v25[4] = buf;
  [v17 enumerateKeysAndObjectsUsingBlock:v25];
  if (v27[24])
  {
    v18 = 0;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)DRSTaskingMessage;
    v21 = [(DRSTaskingSystemMessage *)&v24 initWithVersion:v12 messageUUID:v13 dateBroadcast:v14 dateReceived:v15];
    v22 = v21;
    if (v21) {
      objc_storeStrong((id *)&v21->_teamTaskings, a7);
    }
    self = v22;
    v18 = self;
  }
  _Block_object_dispose(buf, 8);
LABEL_18:

  return v18;
}

void __89__DRSTaskingMessage_initWithVersion_messageUUID_dateBroadcast_dateReceived_teamTaskings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = [v6 teamID];
  char v8 = [v5 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    v9 = DPLogHandle_TaskingMessageError();
    if (os_signpost_enabled(v9))
    {
      v10 = [v6 teamID];
      int v11 = 138543618;
      id v12 = v5;
      __int16 v13 = 2114;
      id v14 = v10;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSTaskingMessageFailedInit", "Malformed team tasking dict (key: %{public}@, value: %{public}@)", (uint8_t *)&v11, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (BOOL)_isEqualToMessage:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DRSTaskingMessage;
  if ([(DRSTaskingSystemMessage *)&v22 _isEqualToMessage:v4])
  {
    id v5 = v4;
    id v6 = [(DRSTaskingSystemMessage *)self dateBroadcast];
    [v6 timeIntervalSince1970];
    double v8 = v7;
    v9 = [v5 dateBroadcast];
    [v9 timeIntervalSince1970];
    double v11 = v10;

    if (v8 != v11) {
      goto LABEL_4;
    }
    id v12 = [(DRSTaskingSystemMessage *)self dateReceived];
    [v12 timeIntervalSince1970];
    double v14 = v13;
    uint64_t v15 = [v5 dateReceived];
    [v15 timeIntervalSince1970];
    double v17 = v16;

    if (v14 == v17)
    {
      v20 = [(DRSTaskingMessage *)self teamTaskings];
      v21 = [v5 teamTaskings];
      char v18 = [v20 isEqualToDictionary:v21];
    }
    else
    {
LABEL_4:
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (id)jsonDictRepresentation
{
  v21[4] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(DRSTaskingMessage *)self teamTaskings];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __43__DRSTaskingMessage_jsonDictRepresentation__block_invoke;
  v18[3] = &unk_263FCA5B8;
  id v19 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v18];

  v20[0] = kDRSTaskingSystemMessage_messageUUIDKey;
  id v6 = [(DRSTaskingSystemMessage *)self messageUUID];
  double v7 = [v6 UUIDString];
  v21[0] = v7;
  v20[1] = kDRSTaskingSystemMessage_DateReceivedKey;
  double v8 = NSNumber;
  v9 = [(DRSTaskingSystemMessage *)self dateReceived];
  [v9 timeIntervalSince1970];
  double v10 = objc_msgSend(v8, "numberWithDouble:");
  v21[1] = v10;
  v20[2] = kDRSTaskingSystemMessage_DateBroadcastKey;
  double v11 = NSNumber;
  id v12 = [(DRSTaskingSystemMessage *)self dateBroadcast];
  [v12 timeIntervalSince1970];
  double v13 = objc_msgSend(v11, "numberWithDouble:");
  v20[3] = kDRSTaskingMessage_TeamTaskingsKey;
  v21[2] = v13;
  v21[3] = v5;
  double v14 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];

  v17.receiver = self;
  v17.super_class = (Class)DRSTaskingMessage;
  uint64_t v15 = [(DRSTaskingSystemMessage *)&v17 _mutableJSONDictRepresentation];
  [v15 addEntriesFromDictionary:v14];

  return v15;
}

void __43__DRSTaskingMessage_jsonDictRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 jsonDictRepresentation];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (DRSTaskingMessage)initWithJSONDict:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() isJSONDictForClass:v4])
  {
    id v5 = [v4 objectForKeyedSubscript:kDRSTaskingSystemMessage_messageUUIDKey];
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      double v7 = DPLogHandle_TaskingMessageError();
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingMessageJSONInitError", "Invalid taskingMessageUUID", buf, 2u);
      }
      double v13 = 0;
      id v6 = v5;
      goto LABEL_21;
    }
    id v6 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v5];

    double v7 = _dateFromJSONDict(v4, kDRSTaskingSystemMessage_DateReceivedKey);
    double v8 = _dateFromJSONDict(v4, (uint64_t)kDRSTaskingSystemMessage_DateBroadcastKey);
    v9 = [v4 objectForKeyedSubscript:kDRSTaskingMessage_TeamTaskingsKey];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(void *)buf = 0;
        v21 = buf;
        uint64_t v22 = 0x2020000000;
        char v23 = 0;
        double v10 = [MEMORY[0x263EFF9A0] dictionary];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __38__DRSTaskingMessage_initWithJSONDict___block_invoke;
        v16[3] = &unk_263FCA5E0;
        id v19 = buf;
        objc_super v17 = v7;
        id v11 = v10;
        id v18 = v11;
        [v9 enumerateKeysAndObjectsUsingBlock:v16];
        int v12 = v21[24];

        _Block_object_dispose(buf, 8);
        if (!v12) {
          goto LABEL_15;
        }
      }
      else
      {
        double v14 = DPLogHandle_TaskingMessageError();
        if (os_signpost_enabled(v14))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingMessageJSONInitError", "Invalid teamTaskingsDict", buf, 2u);
        }

        id v11 = 0;
      }
      double v13 = 0;
      goto LABEL_20;
    }
    id v11 = 0;
LABEL_15:

    v9 = [(DRSTaskingSystemMessage *)self _versionFromJSONDict:v4];
    self = [(DRSTaskingMessage *)self initWithVersion:v9 messageUUID:v6 dateBroadcast:v8 dateReceived:v7 teamTaskings:v11];
    double v13 = self;
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  id v6 = DPLogHandle_TaskingMessageError();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingMessageJSONInitError", "JSON dictionary of wrong type", buf, 2u);
  }
  double v13 = 0;
LABEL_22:

  return v13;
}

void __38__DRSTaskingMessage_initWithJSONDict___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [[DRSTeamTasking alloc] initWithJSONDict:v8 receivedDate:*(void *)(a1 + 32)];
    if (v9)
    {
      [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v7];
    }
    else
    {
      id v11 = DPLogHandle_TaskingMessageError();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)int v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingMessageJSONInitError", "Invalid teamTasking value", v12, 2u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {
    double v10 = DPLogHandle_TaskingMessageError();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingMessageJSONInitError", "Invalid teamTaskingsDict class", buf, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (NSDictionary)teamTaskings
{
  return self->_teamTaskings;
}

- (void).cxx_destruct
{
}

@end