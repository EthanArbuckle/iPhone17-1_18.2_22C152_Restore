@interface BMUserFocusActivityEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMUserFocusActivityEvent)initWithMode:(id)a3 clientID:(id)a4 isStart:(BOOL)a5;
- (BMUserFocusActivityEvent)initWithProto:(id)a3;
- (BMUserFocusActivityEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStart;
- (NSString)clientID;
- (NSString)description;
- (NSString)mode;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)setClientID:(id)a3;
- (void)setMode:(id)a3;
@end

@implementation BMUserFocusActivityEvent

- (BMUserFocusActivityEvent)initWithMode:(id)a3 clientID:(id)a4 isStart:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMUserFocusActivityEvent;
  v11 = [(BMEventBase *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_clientID, a4);
    objc_storeStrong((id *)&v12->_mode, a3);
    v12->_isStart = a5;
  }

  return v12;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  clientID = self->_clientID;
  mode = self->_mode;
  v6 = [NSNumber numberWithBool:self->_isStart];
  v7 = (void *)[v3 initWithFormat:@"User activity event, clientId: %@, currentMode: %@, isStart: %@", clientID, mode, v6];

  return (NSString *)v7;
}

- (id)jsonDict
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"clientID";
  id v3 = [(BMUserFocusActivityEvent *)self clientID];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[0] = v4;
  v10[1] = @"mode";
  v5 = [(BMUserFocusActivityEvent *)self mode];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v6;
  v10[2] = @"isStart";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMUserFocusActivityEvent isStart](self, "isStart"));
  v11[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  if (!v5) {
  if (!v3)
  }

  return v8;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  id v3 = [(BMUserFocusActivityEvent *)self jsonDict];
  uint64_t v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:3 error:&v8];
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

- (unint64_t)hash
{
  id v3 = [(BMUserFocusActivityEvent *)self mode];
  uint64_t v4 = [v3 hash];
  id v5 = [(BMUserFocusActivityEvent *)self clientID];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMUserFocusActivityEvent isStart](self, "isStart"));
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    BOOL v7 = [(BMUserFocusActivityEvent *)self isStart];
    int v8 = v7 ^ [v6 isStart];
    id v9 = [(BMUserFocusActivityEvent *)self clientID];
    if (v9 || ([v6 clientID], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v10 = [(BMUserFocusActivityEvent *)self clientID];
      v11 = [v6 clientID];
      char v12 = [v10 isEqual:v11];

      if (v9)
      {
LABEL_9:
        char v14 = v8 ^ 1;

        v15 = [(BMUserFocusActivityEvent *)self mode];
        if (v15 || ([v6 mode], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v16 = [(BMUserFocusActivityEvent *)self mode];
          v17 = [v6 mode];
          char v18 = [v16 isEqual:v17];

          if (v15)
          {
LABEL_15:

            char v13 = v14 & v12 & v18;
            goto LABEL_16;
          }
        }
        else
        {
          char v18 = 1;
        }

        goto LABEL_15;
      }
    }
    else
    {
      char v12 = 1;
    }

    goto LABEL_9;
  }
  char v13 = 0;
LABEL_16:

  return v13;
}

- (id)encodeAsProto
{
  v2 = [(BMUserFocusActivityEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (BMUserFocusActivityEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    id v9 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BMUserFocusActivityEvent initWithProto:]((uint64_t)self, v10);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  id v6 = [v5 mode];
  BOOL v7 = [v5 clientID];
  uint64_t v8 = [v5 isStart];

  self = [(BMUserFocusActivityEvent *)self initWithMode:v6 clientID:v7 isStart:v8];
  id v9 = self;
LABEL_8:

  return v9;
}

- (BMUserFocusActivityEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBUserFocusActivityEvent alloc] initWithData:v4];

    self = [(BMUserFocusActivityEvent *)self initWithProto:v5];
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
  id v3 = objc_opt_new();
  id v4 = [(BMUserFocusActivityEvent *)self mode];
  [v3 setMode:v4];

  id v5 = [(BMUserFocusActivityEvent *)self clientID];
  [v3 setClientID:v5];

  objc_msgSend(v3, "setIsStart:", -[BMUserFocusActivityEvent isStart](self, "isStart"));

  return v3;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (NSString)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);

  objc_storeStrong((id *)&self->_clientID, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBUserFocusActivityEvent proto", (uint8_t *)&v5, 0xCu);
}

@end