@interface BMUserStatusChangeEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMUserStatusChangeEvent)initWithIDSHandle:(id)a3 statusChangeType:(id)a4;
- (BMUserStatusChangeEvent)initWithIDSHandles:(id)a3 statusChangeType:(id)a4;
- (BMUserStatusChangeEvent)initWithProto:(id)a3;
- (BMUserStatusChangeEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)idsHandles;
- (NSString)description;
- (NSString)idsHandle;
- (NSString)statusChangeType;
- (id)encodeAsProto;
- (id)proto;
- (unsigned)dataVersion;
- (void)setIdsHandle:(id)a3;
- (void)setIdsHandles:(id)a3;
- (void)setStatusChangeType:(id)a3;
@end

@implementation BMUserStatusChangeEvent

- (BMUserStatusChangeEvent)initWithIDSHandle:(id)a3 statusChangeType:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)&self->_idsHandle, a3);
  id v7 = a3;
  id v8 = a4;
  v12[0] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  v10 = [(BMUserStatusChangeEvent *)self initWithIDSHandles:v9 statusChangeType:v8];
  return v10;
}

- (BMUserStatusChangeEvent)initWithIDSHandles:(id)a3 statusChangeType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMUserStatusChangeEvent;
  id v8 = [(BMEventBase *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    idsHandles = v8->_idsHandles;
    v8->_idsHandles = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_statusChangeType, a4);
  }

  return v8;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"UserStatusChangeEvent event with idsHandles: %@, statusChangeType: %@", self->_idsHandles, self->_statusChangeType];

  return (NSString *)v2;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[BMUserStatusChangeEvent eventWithData:dataVersion:](a4, v7);
    }

    id v8 = 0;
  }
  else
  {
    id v8 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }

  return v8;
}

- (id)encodeAsProto
{
  v2 = [(BMUserStatusChangeEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMUserStatusChangeEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    id v8 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BMUserStatusChangeEvent initWithProto:]((uint64_t)self, v9);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  id v6 = [v5 idsHandles];
  id v7 = [v5 statusChangeType];

  self = [(BMUserStatusChangeEvent *)self initWithIDSHandles:v6 statusChangeType:v7];
  id v8 = self;
LABEL_8:

  return v8;
}

- (BMUserStatusChangeEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBUserStatusChangeEvent alloc] initWithData:v4];

    self = [(BMUserStatusChangeEvent *)self initWithProto:v5];
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
  v3 = objc_opt_new();
  id v4 = [(BMUserStatusChangeEvent *)self idsHandles];
  id v5 = (void *)[v4 mutableCopy];
  [v3 setIdsHandles:v5];

  id v6 = [(BMUserStatusChangeEvent *)self statusChangeType];
  [v3 setStatusChangeType:v6];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    idsHandles = self->_idsHandles;
    id v7 = [v5 idsHandles];
    if ([(NSArray *)idsHandles isEqual:v7])
    {
      statusChangeType = self->_statusChangeType;
      uint64_t v9 = [v5 statusChangeType];
      BOOL v10 = [(NSString *)statusChangeType isEqualToString:v9];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (NSString)idsHandle
{
  return self->_idsHandle;
}

- (void)setIdsHandle:(id)a3
{
}

- (NSString)statusChangeType
{
  return self->_statusChangeType;
}

- (void)setStatusChangeType:(id)a3
{
}

- (NSArray)idsHandles
{
  return self->_idsHandles;
}

- (void)setIdsHandles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsHandles, 0);
  objc_storeStrong((id *)&self->_statusChangeType, 0);

  objc_storeStrong((id *)&self->_idsHandle, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 0;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMUserStatusChangeEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  __int16 v3 = (objc_class *)objc_opt_class();
  int v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBUserStatusChangeEvent proto", (uint8_t *)&v5, 0xCu);
}

@end