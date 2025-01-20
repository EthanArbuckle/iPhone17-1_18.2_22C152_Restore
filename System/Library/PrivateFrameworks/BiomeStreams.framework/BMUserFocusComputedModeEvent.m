@interface BMUserFocusComputedModeEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMUserFocusComputedModeEvent)initWithMode:(id)a3 semanticModeIdentifier:(id)a4 starting:(BOOL)a5 modeUpdateReason:(unint64_t)a6 modeSemanticType:(int64_t)a7 modeUpdateSource:(int64_t)a8;
- (BMUserFocusComputedModeEvent)initWithMode:(id)a3 starting:(BOOL)a4;
- (BMUserFocusComputedModeEvent)initWithMode:(id)a3 starting:(BOOL)a4 modeUpdateReason:(unint64_t)a5 modeSemanticType:(int64_t)a6;
- (BMUserFocusComputedModeEvent)initWithMode:(id)a3 starting:(BOOL)a4 modeUpdateReason:(unint64_t)a5 modeSemanticType:(int64_t)a6 modeUpdateSource:(int64_t)a7;
- (BMUserFocusComputedModeEvent)initWithProto:(id)a3;
- (BMUserFocusComputedModeEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStarting;
- (NSString)description;
- (NSString)mode;
- (NSString)semanticModeIdentifier;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (int64_t)modeSemanticType;
- (int64_t)modeUpdateSource;
- (unint64_t)hash;
- (unint64_t)modeUpdateReason;
- (unsigned)dataVersion;
- (void)proto;
- (void)setMode:(id)a3;
- (void)setModeSemanticType:(int64_t)a3;
- (void)setModeUpdateReason:(unint64_t)a3;
- (void)setModeUpdateSource:(int64_t)a3;
- (void)setSemanticModeIdentifier:(id)a3;
- (void)setStarting:(BOOL)a3;
@end

@implementation BMUserFocusComputedModeEvent

- (BMUserFocusComputedModeEvent)initWithMode:(id)a3 starting:(BOOL)a4
{
  return [(BMUserFocusComputedModeEvent *)self initWithMode:a3 starting:a4 modeUpdateReason:0 modeSemanticType:-1 modeUpdateSource:0];
}

- (BMUserFocusComputedModeEvent)initWithMode:(id)a3 starting:(BOOL)a4 modeUpdateReason:(unint64_t)a5 modeSemanticType:(int64_t)a6
{
  return [(BMUserFocusComputedModeEvent *)self initWithMode:a3 starting:a4 modeUpdateReason:a5 modeSemanticType:a6 modeUpdateSource:0];
}

- (BMUserFocusComputedModeEvent)initWithMode:(id)a3 starting:(BOOL)a4 modeUpdateReason:(unint64_t)a5 modeSemanticType:(int64_t)a6 modeUpdateSource:(int64_t)a7
{
  return [(BMUserFocusComputedModeEvent *)self initWithMode:a3 semanticModeIdentifier:0 starting:a4 modeUpdateReason:a5 modeSemanticType:a6 modeUpdateSource:a7];
}

- (BMUserFocusComputedModeEvent)initWithMode:(id)a3 semanticModeIdentifier:(id)a4 starting:(BOOL)a5 modeUpdateReason:(unint64_t)a6 modeSemanticType:(int64_t)a7 modeUpdateSource:(int64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BMUserFocusComputedModeEvent;
  v17 = [(BMEventBase *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_mode, a3);
    objc_storeStrong((id *)&v18->_semanticModeIdentifier, a4);
    v18->_starting = a5;
    v18->_modeUpdateReason = a6;
    v18->_modeSemanticType = a7;
    v18->_modeUpdateSource = a8;
  }

  return v18;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  mode = self->_mode;
  semanticModeIdentifier = self->_semanticModeIdentifier;
  v6 = [NSNumber numberWithBool:self->_starting];
  v7 = [NSNumber numberWithUnsignedInteger:self->_modeUpdateReason];
  v8 = [NSNumber numberWithInteger:self->_modeSemanticType];
  v9 = [NSNumber numberWithInteger:self->_modeUpdateSource];
  v10 = (void *)[v3 initWithFormat:@"User mode event, currentMode: %@, semanticModeIdentifier: %@, starting: %@, modeUpdateReason: %@, modeSemanticType: %@, modeUpdateSource: %@", mode, semanticModeIdentifier, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (id)jsonDict
{
  v14[6] = *MEMORY[0x1E4F143B8];
  v13[0] = @"mode";
  id v3 = [(BMUserFocusComputedModeEvent *)self mode];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v4;
  v13[1] = @"semanticModeIdentifier";
  v5 = [(BMUserFocusComputedModeEvent *)self semanticModeIdentifier];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v6;
  v13[2] = @"starting";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMUserFocusComputedModeEvent isStarting](self, "isStarting"));
  v14[2] = v7;
  v13[3] = @"modeUpdateReason";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BMUserFocusComputedModeEvent modeUpdateReason](self, "modeUpdateReason"));
  v14[3] = v8;
  v13[4] = @"modeSemanticType";
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[BMUserFocusComputedModeEvent modeSemanticType](self, "modeSemanticType"));
  v14[4] = v9;
  v13[5] = @"modeUpdateSource";
  v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[BMUserFocusComputedModeEvent modeUpdateSource](self, "modeUpdateSource"));
  v14[5] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];

  if (!v5) {
  if (!v3)
  }

  return v11;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  id v3 = [(BMUserFocusComputedModeEvent *)self jsonDict];
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
  if (a4 == 2) {
    v4 = (objc_class *)BMUserFocusComputedModeEvent_v2;
  }
  else {
    v4 = (objc_class *)a1;
  }
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithProtoData:v5];

  return v6;
}

- (unint64_t)hash
{
  id v3 = [(BMUserFocusComputedModeEvent *)self mode];
  uint64_t v4 = [v3 hash];
  id v5 = [(BMUserFocusComputedModeEvent *)self semanticModeIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMUserFocusComputedModeEvent isStarting](self, "isStarting"));
  uint64_t v8 = v6 ^ [v7 hash];
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BMUserFocusComputedModeEvent modeUpdateReason](self, "modeUpdateReason"));
  uint64_t v10 = [v9 hash];
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[BMUserFocusComputedModeEvent modeSemanticType](self, "modeSemanticType"));
  uint64_t v12 = v8 ^ v10 ^ [v11 hash];
  v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[BMUserFocusComputedModeEvent modeUpdateSource](self, "modeUpdateSource"));
  unint64_t v14 = v12 ^ [v13 hash];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    uint64_t v8 = [(BMUserFocusComputedModeEvent *)self mode];
    v9 = [v7 mode];
    if (![v8 isEqual:v9])
    {
      BOOL v12 = 0;
LABEL_21:

      goto LABEL_22;
    }
    uint64_t v10 = [(BMUserFocusComputedModeEvent *)self semanticModeIdentifier];
    if (v10 || ([v7 semanticModeIdentifier], (v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v3 = [(BMUserFocusComputedModeEvent *)self semanticModeIdentifier];
      uint64_t v4 = [v7 semanticModeIdentifier];
      if (![v3 isEqualToString:v4])
      {
        BOOL v12 = 0;
        goto LABEL_17;
      }
      int v11 = 1;
    }
    else
    {
      v18 = 0;
      int v11 = 0;
    }
    int v13 = [(BMUserFocusComputedModeEvent *)self isStarting];
    if (v13 == [v7 isStarting]
      && (int64_t v14 = [(BMUserFocusComputedModeEvent *)self modeSemanticType],
          v14 == [v7 modeSemanticType])
      && (unint64_t v15 = [(BMUserFocusComputedModeEvent *)self modeUpdateReason],
          v15 == [v7 modeUpdateReason]))
    {
      int64_t v16 = [(BMUserFocusComputedModeEvent *)self modeUpdateSource];
      BOOL v12 = v16 == [v7 modeUpdateSource];
      if ((v11 & 1) == 0) {
        goto LABEL_18;
      }
    }
    else
    {
      BOOL v12 = 0;
      if (!v11)
      {
LABEL_18:
        if (!v10) {

        }
        goto LABEL_21;
      }
    }
LABEL_17:

    goto LABEL_18;
  }
  BOOL v12 = 0;
LABEL_22:

  return v12;
}

- (id)encodeAsProto
{
  v2 = [(BMUserFocusComputedModeEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (BMUserFocusComputedModeEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [v5 mode];
      id v7 = [v5 semanticModeIdentifier];
      uint64_t v8 = [v5 starting];
      uint64_t updated = BMUserFocusComputedModeUpdateReasonFromReason([v5 modeUpdateReason]);
      unsigned int v10 = [v5 modeSemanticType];
      if (v10 >= 0xA)
      {
        int v13 = __biome_log_for_category();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[BMUserFocusComputedModeEvent initWithProto:]();
        }

        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v11 = v10 - 1;
      }
      self = [(BMUserFocusComputedModeEvent *)self initWithMode:v6 semanticModeIdentifier:v7 starting:v8 modeUpdateReason:updated modeSemanticType:v11 modeUpdateSource:BMUserFocusComputedModeUpdateSourceFromSource([v5 modeUpdateSource])];

      BOOL v12 = self;
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMUserFocusComputedModeEvent initWithProto:]();
      }
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BMUserFocusComputedModeEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBUserFocusComputedModeEvent alloc] initWithData:v4];

    self = [(BMUserFocusComputedModeEvent *)self initWithProto:v5];
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
  id v4 = [(BMUserFocusComputedModeEvent *)self mode];
  [v3 setMode:v4];

  id v5 = [(BMUserFocusComputedModeEvent *)self semanticModeIdentifier];
  [v3 setSemanticModeIdentifier:v5];

  objc_msgSend(v3, "setStarting:", -[BMUserFocusComputedModeEvent isStarting](self, "isStarting"));
  unint64_t v6 = [(BMUserFocusComputedModeEvent *)self modeUpdateReason];
  if (v6 >= 4)
  {
    uint64_t v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BMUserFocusComputedModeEvent proto](v6);
    }

    unint64_t v6 = 0xFFFFFFFFLL;
    int v7 = 1;
  }
  else
  {
    int v7 = 0;
  }
  int64_t v9 = [(BMUserFocusComputedModeEvent *)self modeSemanticType];
  uint64_t v10 = 0;
  switch(v9)
  {
    case -1:
      break;
    case 0:
      uint64_t v10 = 1;
      break;
    case 1:
      uint64_t v10 = 2;
      break;
    case 2:
      uint64_t v10 = 3;
      break;
    case 3:
      uint64_t v10 = 4;
      break;
    case 4:
      uint64_t v10 = 5;
      break;
    case 5:
      uint64_t v10 = 6;
      break;
    case 6:
      uint64_t v10 = 7;
      break;
    case 7:
      uint64_t v10 = 8;
      break;
    case 8:
      uint64_t v10 = 9;
      break;
    default:
      uint64_t v11 = v9;
      BOOL v12 = __biome_log_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[BMUserFocusComputedModeEvent proto](v11);
      }

      uint64_t v10 = 0xFFFFFFFFLL;
      int v7 = 1;
      break;
  }
  unint64_t v13 = [(BMUserFocusComputedModeEvent *)self modeUpdateSource];
  if (v13 >= 4)
  {
    unint64_t v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[BMUserFocusComputedModeEvent proto](v13);
    }
  }
  else if (!v7)
  {
    [v3 setModeUpdateReason:v6];
    [v3 setModeSemanticType:v10];
    [v3 setModeUpdateSource:v13];
    id v14 = v3;
    goto LABEL_26;
  }
  id v14 = 0;
LABEL_26:

  return v14;
}

- (NSString)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
}

- (NSString)semanticModeIdentifier
{
  return self->_semanticModeIdentifier;
}

- (void)setSemanticModeIdentifier:(id)a3
{
}

- (unint64_t)modeUpdateReason
{
  return self->_modeUpdateReason;
}

- (void)setModeUpdateReason:(unint64_t)a3
{
  self->_modeUpdateReason = a3;
}

- (int64_t)modeSemanticType
{
  return self->_modeSemanticType;
}

- (void)setModeSemanticType:(int64_t)a3
{
  self->_modeSemanticType = a3;
}

- (int64_t)modeUpdateSource
{
  return self->_modeUpdateSource;
}

- (void)setModeUpdateSource:(int64_t)a3
{
  self->_modeUpdateSource = a3;
}

- (BOOL)isStarting
{
  return self->_starting;
}

- (void)setStarting:(BOOL)a3
{
  self->_starting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticModeIdentifier, 0);

  objc_storeStrong((id *)&self->_mode, 0);
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  v0 = objc_msgSend(NSNumber, "numberWithInt:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMUserFocusComputedModeEvent: unable to convert BMPBModeSemanticType enum value: %@", v3, v4, v5, v6, v7);
}

- (void)initWithProto:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_18E67D000, v2, v3, "%@: tried to initialize with a non-BMPBUserFocusComputedModeEvent proto", v4, v5, v6, v7, v8);
}

- (void)proto
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMUserFocusComputedModeEvent: unable to convert BMUserFocusComputedModeUpdateReason enum value: %@", v4, v5, v6, v7, v8);
}

@end