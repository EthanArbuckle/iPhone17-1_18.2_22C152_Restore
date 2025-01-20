@interface DRSTaskingSystemMessage
+ (BOOL)isJSONDictForClass:(id)a3;
+ (id)messageType;
- (BOOL)_isEqualToMessage:(id)a3;
- (BOOL)_versionIsSupported:(id)a3;
- (BOOL)isEqual:(id)a3;
- (DRSTaskingSystemMessage)initWithJSONDict:(id)a3;
- (DRSTaskingSystemMessage)initWithVersion:(id)a3 messageUUID:(id)a4 dateBroadcast:(id)a5 dateReceived:(id)a6;
- (NSDate)dateBroadcast;
- (NSDate)dateReceived;
- (NSString)messageType;
- (NSString)version;
- (NSUUID)messageUUID;
- (id)_mutableJSONDictRepresentation;
- (id)_versionFromJSONDict:(id)a3;
- (id)debugDescription;
@end

@implementation DRSTaskingSystemMessage

+ (BOOL)isJSONDictForClass:(id)a3
{
  if (!a3) {
    return 0;
  }
  v4 = [a3 objectForKeyedSubscript:@"type"];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [a1 messageType];
    char v6 = [v4 isEqualToString:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_versionFromJSONDict:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"version"];
}

- (BOOL)_versionIsSupported:(id)a3
{
  return 0;
}

- (DRSTaskingSystemMessage)initWithJSONDict:(id)a3
{
  return 0;
}

+ (id)messageType
{
  return &stru_26BDF7DE8;
}

- (NSString)messageType
{
  v2 = objc_opt_class();

  return (NSString *)[v2 messageType];
}

- (id)_mutableJSONDictRepresentation
{
  v17[5] = *MEMORY[0x263EF8340];
  v16[0] = @"version";
  v3 = [(DRSTaskingSystemMessage *)self version];
  v17[0] = v3;
  v16[1] = @"type";
  v4 = [(id)objc_opt_class() messageType];
  v17[1] = v4;
  v16[2] = kDRSTaskingSystemMessage_messageUUIDKey;
  v5 = [(DRSTaskingSystemMessage *)self messageUUID];
  char v6 = [v5 UUIDString];
  v17[2] = v6;
  v16[3] = kDRSTaskingSystemMessage_DateReceivedKey;
  v7 = NSNumber;
  v8 = [(DRSTaskingSystemMessage *)self dateReceived];
  [v8 timeIntervalSince1970];
  v9 = objc_msgSend(v7, "numberWithDouble:");
  v17[3] = v9;
  v16[4] = kDRSTaskingSystemMessage_DateBroadcastKey;
  v10 = NSNumber;
  v11 = [(DRSTaskingSystemMessage *)self dateBroadcast];
  [v11 timeIntervalSince1970];
  v12 = objc_msgSend(v10, "numberWithDouble:");
  v17[4] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];
  v14 = (void *)[v13 mutableCopy];

  return v14;
}

- (id)debugDescription
{
  v2 = [(DRSTaskingSystemMessage *)self jsonDictRepresentation];
  v3 = [v2 description];

  return v3;
}

- (DRSTaskingSystemMessage)initWithVersion:(id)a3 messageUUID:(id)a4 dateBroadcast:(id)a5 dateReceived:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v12)
  {
    v18 = DPLogHandle_TaskingMessageError();
    if (!os_signpost_enabled(v18)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v19 = "nil UUID";
LABEL_18:
    v20 = v18;
    uint32_t v21 = 2;
    goto LABEL_19;
  }
  if (!v11)
  {
    v18 = DPLogHandle_TaskingMessageError();
    if (!os_signpost_enabled(v18)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v19 = "nil version";
    goto LABEL_18;
  }
  if (![(DRSTaskingSystemMessage *)self _versionIsSupported:v11])
  {
    v18 = DPLogHandle_TaskingMessageError();
    if (os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v11;
      v19 = "Unsupported version %{public}@";
      v20 = v18;
      uint32_t v21 = 12;
LABEL_19:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSTaskingSystemMessageFailedInit", v19, buf, v21);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (!v13)
  {
    v18 = DPLogHandle_TaskingMessageError();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      v19 = "nil dateBroadcast";
      goto LABEL_18;
    }
LABEL_20:

    v17 = 0;
    goto LABEL_21;
  }
  if (!v14)
  {
    id v14 = [MEMORY[0x263EFF910] date];
  }
  v23.receiver = self;
  v23.super_class = (Class)DRSTaskingSystemMessage;
  v15 = [(DRSTaskingSystemMessage *)&v23 init];
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_version, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 4, a5);
    objc_storeStrong(p_isa + 3, v14);
  }
  self = p_isa;
  v17 = self;
LABEL_21:

  return v17;
}

- (BOOL)_isEqualToMessage:(id)a3
{
  v4 = (DRSTaskingSystemMessage *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    char v18 = 1;
    goto LABEL_7;
  }
  char v6 = [(DRSTaskingSystemMessage *)self dateBroadcast];
  [v6 timeIntervalSince1970];
  double v8 = v7;
  v9 = [(DRSTaskingSystemMessage *)v5 dateBroadcast];
  [v9 timeIntervalSince1970];
  double v11 = v10;

  if (v8 != v11) {
    goto LABEL_5;
  }
  id v12 = [(DRSTaskingSystemMessage *)self dateReceived];
  [v12 timeIntervalSince1970];
  double v14 = v13;
  v15 = [(DRSTaskingSystemMessage *)v5 dateReceived];
  [v15 timeIntervalSince1970];
  double v17 = v16;

  if (v14 == v17)
  {
    v20 = [(DRSTaskingSystemMessage *)self version];
    uint32_t v21 = [(DRSTaskingSystemMessage *)v5 version];
    if ([v20 isEqualToString:v21])
    {
      v22 = [(DRSTaskingSystemMessage *)self messageUUID];
      objc_super v23 = [(DRSTaskingSystemMessage *)v5 messageUUID];
      char v18 = [v22 isEqual:v23];
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
LABEL_5:
    char v18 = 0;
  }
LABEL_7:

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(DRSTaskingSystemMessage *)self _isEqualToMessage:v4];

  return v5;
}

- (NSString)version
{
  return self->_version;
}

- (NSUUID)messageUUID
{
  return self->_messageUUID;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (NSDate)dateBroadcast
{
  return self->_dateBroadcast;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateBroadcast, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

@end