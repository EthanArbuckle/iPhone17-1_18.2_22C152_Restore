@interface BMSubscriptionEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (unsigned)latestDataVersion;
- (BMSubscriptionEvent)initWithClient:(id)a3 identifier:(id)a4 useCase:(id)a5 starting:(BOOL)a6;
- (BMSubscriptionEvent)initWithCoder:(id)a3;
- (BMSubscriptionEvent)initWithProto:(id)a3;
- (BMSubscriptionEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)starting;
- (NSString)client;
- (NSString)description;
- (NSString)identifier;
- (NSString)uniqueIdentifier;
- (NSString)useCase;
- (NSUUID)bootUUID;
- (id)_initWithClient:(id)a3 identifier:(id)a4 useCase:(id)a5 starting:(BOOL)a6 bootUUID:(id)a7;
- (id)encodeAsProto;
- (id)jsonDictionary;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMSubscriptionEvent

- (BMSubscriptionEvent)initWithClient:(id)a3 identifier:(id)a4 useCase:(id)a5 starting:(BOOL)a6
{
  BOOL v6 = a6;
  v10 = (void *)MEMORY[0x1E4F29128];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_msgSend(v10, "bm_bootSessionUUID");
  v15 = [(BMSubscriptionEvent *)self _initWithClient:v13 identifier:v12 useCase:v11 starting:v6 bootUUID:v14];

  return v15;
}

- (id)_initWithClient:(id)a3 identifier:(id)a4 useCase:(id)a5 starting:(BOOL)a6 bootUUID:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)BMSubscriptionEvent;
  v17 = [(BMSubscriptionEvent *)&v23 init];
  v18 = v17;
  if (v17)
  {
    v17->_dataVersion = 1;
    objc_storeStrong((id *)&v17->_client, a3);
    objc_storeStrong((id *)&v18->_identifier, a4);
    v19 = [(NSString *)v18->_client stringByAppendingString:@":"];
    uint64_t v20 = [v19 stringByAppendingString:v14];
    uniqueIdentifier = v18->_uniqueIdentifier;
    v18->_uniqueIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v18->_useCase, a5);
    v18->_starting = a6;
    objc_storeStrong((id *)&v18->_bootUUID, a7);
  }

  return v18;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_starting) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  return (NSString *)[v3 stringWithFormat:@"<%@: client=%@, identifier=%@, useCase=%@, starting=%@>", v4, *(_OWORD *)&self->_client, self->_useCase, v5];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_client hash];
  NSUInteger v4 = [(NSString *)self->_identifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_useCase hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (BMSubscriptionEvent *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      client = self->_client;
      if ((client == v5->_client || -[NSString isEqual:](client, "isEqual:"))
        && ((identifier = self->_identifier, identifier == v5->_identifier)
         || -[NSString isEqual:](identifier, "isEqual:")))
      {
        useCase = self->_useCase;
        if (useCase == v5->_useCase) {
          char v9 = 1;
        }
        else {
          char v9 = -[NSString isEqual:](useCase, "isEqual:");
        }
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)jsonDictionary
{
  v15[5] = *MEMORY[0x1E4F143B8];
  v14[0] = @"client";
  client = self->_client;
  NSUInteger v4 = client;
  if (!client)
  {
    NSUInteger v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v4;
  v14[1] = @"identifier";
  identifier = self->_identifier;
  BOOL v6 = identifier;
  if (!identifier)
  {
    BOOL v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v6;
  v14[2] = @"useCase";
  useCase = self->_useCase;
  v8 = useCase;
  if (!useCase)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v9 = MEMORY[0x1E4F1CC38];
  if (!self->_starting) {
    uint64_t v9 = MEMORY[0x1E4F1CC28];
  }
  v15[2] = v8;
  v15[3] = v9;
  v14[3] = @"starting";
  v14[4] = @"bootUUID";
  v10 = [(NSUUID *)self->_bootUUID UUIDString];
  id v11 = v10;
  if (!v10)
  {
    id v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[4] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];
  if (!v10) {

  }
  if (useCase)
  {
    if (identifier) {
      goto LABEL_15;
    }
LABEL_20:

    if (client) {
      goto LABEL_16;
    }
    goto LABEL_21;
  }

  if (!identifier) {
    goto LABEL_20;
  }
LABEL_15:
  if (client) {
    goto LABEL_16;
  }
LABEL_21:

LABEL_16:
  return v12;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    uint64_t v7 = [objc_alloc((Class)a1) initWithProtoData:v6];
    v8 = (void *)v7;
    if (v7) {
      *(_DWORD *)(v7 + 16) = 1;
    }
  }
  else
  {
    uint64_t v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[BMSubscriptionEvent eventWithData:dataVersion:](a4, v9);
    }

    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)encodeAsProto
{
  v2 = [(BMSubscriptionEvent *)self proto];
  NSUInteger v3 = [v2 data];

  return v3;
}

- (BMSubscriptionEvent)initWithProto:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = -[BMPBSubscriptionEvent bootUUID]((uint64_t)v5);

    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F29128]);
      v8 = -[BMPBSubscriptionEvent bootUUID]((uint64_t)v5);
      id v6 = (void *)[v7 initWithUUIDString:v8];
    }
    uint64_t v9 = -[BMPBSubscriptionEvent client]((uint64_t)v5);
    v10 = -[BMPBSubscriptionEvent identifier]((uint64_t)v5);
    id v11 = -[BMPBSubscriptionEvent useCase]((uint64_t)v5);
    self = (BMSubscriptionEvent *)-[BMSubscriptionEvent _initWithClient:identifier:useCase:starting:bootUUID:](self, "_initWithClient:identifier:useCase:starting:bootUUID:", v9, v10, v11, -[BMPBSubscriptionEvent starting]((BOOL)v5), v6);

    id v12 = self;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BMSubscriptionEvent)initWithProtoData:(id)a3
{
  id v4 = a3;
  id v5 = [[BMPBSubscriptionEvent alloc] initWithData:v4];

  if (v5)
  {
    self = [(BMSubscriptionEvent *)self initWithProto:v5];
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
  NSUInteger v3 = objc_opt_new();
  -[BMPBSubscriptionEvent setStarting:]((uint64_t)v3, self->_starting);
  -[BMPBSubscriptionEvent setClient:]((uint64_t)v3, self->_client);
  -[BMPBSubscriptionEvent setIdentifier:]((uint64_t)v3, self->_identifier);
  -[BMPBSubscriptionEvent setUseCase:]((uint64_t)v3, self->_useCase);
  id v4 = [(NSUUID *)self->_bootUUID UUIDString];
  -[BMPBSubscriptionEvent setBootUUID:]((uint64_t)v3, v4);

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMSubscriptionEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"data"];
  objc_msgSend(v4, "encodeInt64:forKey:", objc_msgSend((id)objc_opt_class(), "latestDataVersion"), @"dver");
}

- (BMSubscriptionEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (!v5 || (unint64_t v6 = [v4 decodeInt64ForKey:@"dver"], HIDWORD(v6)))
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(id)objc_opt_class() eventWithData:v5 dataVersion:v6];
  }

  return v7;
}

- (NSString)client
{
  return self->_client;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)useCase
{
  return self->_useCase;
}

- (BOOL)starting
{
  return self->_starting;
}

- (NSUUID)bootUUID
{
  return self->_bootUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootUUID, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AD076000, a2, OS_LOG_TYPE_ERROR, "Unable to decode BMSubscriptionEvent with dataVersion %u", (uint8_t *)v2, 8u);
}

@end