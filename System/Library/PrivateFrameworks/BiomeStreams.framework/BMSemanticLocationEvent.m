@interface BMSemanticLocationEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMSemanticLocationEvent)initWithProto:(id)a3;
- (BMSemanticLocationEvent)initWithProtoData:(id)a3;
- (BMSemanticLocationEvent)initWithUserSpecificPlaceType:(unint64_t)a3 placeType:(unint64_t)a4 loiIdentifier:(id)a5 starting:(BOOL)a6;
- (BMSemanticLocationEvent)initWithUserSpecificPlaceType:(unint64_t)a3 placeType:(unint64_t)a4 starting:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStarting;
- (NSString)description;
- (NSString)loiIdentifier;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (unint64_t)placeType;
- (unint64_t)userSpecificPlaceType;
- (unsigned)dataVersion;
- (void)proto;
- (void)setStarting:(BOOL)a3;
@end

@implementation BMSemanticLocationEvent

- (BMSemanticLocationEvent)initWithUserSpecificPlaceType:(unint64_t)a3 placeType:(unint64_t)a4 starting:(BOOL)a5
{
  return [(BMSemanticLocationEvent *)self initWithUserSpecificPlaceType:a3 placeType:a4 loiIdentifier:0 starting:a5];
}

- (BMSemanticLocationEvent)initWithUserSpecificPlaceType:(unint64_t)a3 placeType:(unint64_t)a4 loiIdentifier:(id)a5 starting:(BOOL)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMSemanticLocationEvent;
  v12 = [(BMEventBase *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_userSpecificPlaceType = a3;
    v12->_placeType = a4;
    objc_storeStrong((id *)&v12->_loiIdentifier, a5);
    v13->_starting = a6;
  }

  return v13;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [NSNumber numberWithUnsignedInteger:self->_userSpecificPlaceType];
  v5 = [NSNumber numberWithUnsignedInteger:self->_placeType];
  loiIdentifier = self->_loiIdentifier;
  v7 = [NSNumber numberWithBool:self->_starting];
  v8 = (void *)[v3 initWithFormat:@"SemanticLocation event with userSpecificPlaceType: %@, placeType: %@, loiIdentifier: %@, starting: %@", v4, v5, loiIdentifier, v7];

  return (NSString *)v8;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1) {
    v4 = (objc_class *)BMSemanticLocationEvent_v1;
  }
  else {
    v4 = (objc_class *)a1;
  }
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithProtoData:v5];

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(BMSemanticLocationEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (BMSemanticLocationEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = typeFromBMPBSemanticLocationUserSpecificPlaceType([v5 userSpecificPlaceType]);
      uint64_t v7 = [v5 placeType];
      uint64_t v8 = v7;
      if (v7 >= 4)
      {
        id v11 = __biome_log_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[BMSemanticLocationEvent initWithProto:](v8);
        }

        uint64_t v9 = 0;
      }
      else
      {
        uint64_t v9 = qword_18EB37078[(int)v7];
      }
      v12 = [v5 loiIdentifier];
      self = [(BMSemanticLocationEvent *)self initWithUserSpecificPlaceType:v6 placeType:v9 loiIdentifier:v12 starting:[v5 starting]];

      v10 = self;
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMSemanticLocationEvent initWithProto:]();
      }
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BMSemanticLocationEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBSemanticLocationEvent alloc] initWithData:v4];

    self = [(BMSemanticLocationEvent *)self initWithProto:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)proto
{
  id v3 = objc_opt_new();
  objc_msgSend(v3, "setStarting:", -[BMSemanticLocationEvent isStarting](self, "isStarting"));
  uint64_t v4 = [(BMSemanticLocationEvent *)self userSpecificPlaceType];
  uint64_t v5 = 0;
  int v6 = 1;
  switch(v4)
  {
    case 0:
      break;
    case 1:
      uint64_t v5 = 1;
      break;
    case 2:
      uint64_t v5 = 2;
      break;
    case 3:
      uint64_t v5 = 3;
      break;
    case 4:
      uint64_t v5 = 4;
      break;
    default:
      uint64_t v7 = __biome_log_for_category();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[BMSemanticLocationEvent proto](v4);
      }

      int v6 = 0;
      uint64_t v5 = 0xFFFFFFFFLL;
      break;
  }
  unint64_t v8 = [(BMSemanticLocationEvent *)self placeType];
  uint64_t v9 = v8;
  if (v8 >= 4)
  {
    v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[BMSemanticLocationEvent proto](v9);
    }
  }
  else if (v6)
  {
    uint64_t v10 = dword_18EB370A0[v8];
    [v3 setUserSpecificPlaceType:v5];
    [v3 setPlaceType:v10];
    id v11 = [(BMSemanticLocationEvent *)self loiIdentifier];
    [v3 setLoiIdentifier:v11];

    id v12 = v3;
    goto LABEL_16;
  }
  id v12 = 0;
LABEL_16:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    int v7 = [(BMSemanticLocationEvent *)self isStarting];
    if (v7 != [v6 isStarting]
      || (unint64_t v8 = [(BMSemanticLocationEvent *)self userSpecificPlaceType],
          v8 != [v6 userSpecificPlaceType])
      || (unint64_t v9 = -[BMSemanticLocationEvent placeType](self, "placeType"), v9 != [v6 placeType]))
    {
      char v13 = 0;
LABEL_11:

      goto LABEL_12;
    }
    uint64_t v10 = [(BMSemanticLocationEvent *)self loiIdentifier];
    if (v10 || ([v6 loiIdentifier], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v11 = [(BMSemanticLocationEvent *)self loiIdentifier];
      id v12 = [v6 loiIdentifier];
      char v13 = [v11 isEqualToString:v12];

      if (v10)
      {
LABEL_15:

        goto LABEL_11;
      }
    }
    else
    {
      char v13 = 1;
    }

    goto LABEL_15;
  }
  char v13 = 0;
LABEL_12:

  return v13;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSemanticLocationEvent isStarting](self, "isStarting"));
  uint64_t v4 = [v3 hash];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BMSemanticLocationEvent userSpecificPlaceType](self, "userSpecificPlaceType"));
  uint64_t v6 = [v5 hash] ^ v4;
  int v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BMSemanticLocationEvent placeType](self, "placeType"));
  uint64_t v8 = [v7 hash];
  unint64_t v9 = [(BMSemanticLocationEvent *)self loiIdentifier];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (unint64_t)userSpecificPlaceType
{
  return self->_userSpecificPlaceType;
}

- (unint64_t)placeType
{
  return self->_placeType;
}

- (NSString)loiIdentifier
{
  return self->_loiIdentifier;
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
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMSemanticLocationEvent: unable to convert BMPBSemanticLocationPlaceType enum value: %@", v4, v5, v6, v7, v8);
}

- (void)initWithProto:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_18E67D000, v2, v3, "%@: tried to initialize with a non-BMPBSemanticLocationEvent proto", v4, v5, v6, v7, v8);
}

- (void)proto
{
  v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMSemanticLocationEvent: unable to convert BMSemanticLocationUserSpecificPlaceType enum value: %@", v4, v5, v6, v7, v8);
}

@end