@interface BMReadMessageEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMReadMessageEvent)initWithIDSHandle:(id)a3;
- (BMReadMessageEvent)initWithProto:(id)a3;
- (BMReadMessageEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)markedUnread;
- (NSString)idsHandle;
- (id)encodeAsProto;
- (id)initMarkUnreadWithIDSHandle:(id)a3;
- (id)proto;
- (unsigned)dataVersion;
- (void)setIdsHandle:(id)a3;
@end

@implementation BMReadMessageEvent

- (BMReadMessageEvent)initWithIDSHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMReadMessageEvent;
  v6 = [(BMEventBase *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_idsHandle, a3);
    v7->_markedUnread = 0;
  }

  return v7;
}

- (id)initMarkUnreadWithIDSHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMReadMessageEvent;
  v6 = [(BMEventBase *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_idsHandle, a3);
    v7->_markedUnread = 1;
  }

  return v7;
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
    v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[BMReadMessageEvent eventWithData:dataVersion:](a4, v7);
    }

    v8 = 0;
  }
  else
  {
    v8 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }

  return v8;
}

- (id)encodeAsProto
{
  v2 = [(BMReadMessageEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMReadMessageEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BMReadMessageEvent initWithProto:]((uint64_t)self, v9);
    }

    goto LABEL_8;
  }
  id v5 = v4;
  int v6 = [v5 markedUnread];
  v7 = [v5 idsHandle];
  if (v6) {
    v8 = [(BMReadMessageEvent *)self initMarkUnreadWithIDSHandle:v7];
  }
  else {
    v8 = [(BMReadMessageEvent *)self initWithIDSHandle:v7];
  }
  self = v8;

  v10 = self;
LABEL_11:

  return v10;
}

- (BMReadMessageEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBReadMessageEvent alloc] initWithData:v4];

    self = [(BMReadMessageEvent *)self initWithProto:v5];
    int v6 = self;
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(BMReadMessageEvent *)self idsHandle];
  id v5 = (void *)[v4 mutableCopy];
  [v3 setIdsHandle:v5];

  objc_msgSend(v3, "setMarkedUnread:", -[BMReadMessageEvent markedUnread](self, "markedUnread"));

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    idsHandle = self->_idsHandle;
    v7 = [v5 idsHandle];
    if ([(NSString *)idsHandle isEqual:v7])
    {
      int markedUnread = self->_markedUnread;
      BOOL v9 = markedUnread == [v5 markedUnread];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSString)idsHandle
{
  return self->_idsHandle;
}

- (void)setIdsHandle:(id)a3
{
}

- (BOOL)markedUnread
{
  return self->_markedUnread;
}

- (void).cxx_destruct
{
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 0;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMReadMessageEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  __int16 v3 = (objc_class *)objc_opt_class();
  int v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  int v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBReadMessageEvent proto", (uint8_t *)&v5, 0xCu);
}

@end