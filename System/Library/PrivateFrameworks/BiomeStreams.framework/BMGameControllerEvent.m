@interface BMGameControllerEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMGameControllerEvent)initWithIsControllerConnected:(BOOL)a3 numberOfControllersConnected:(unint64_t)a4;
- (BMGameControllerEvent)initWithProto:(id)a3;
- (BMGameControllerEvent)initWithProtoData:(id)a3;
- (BOOL)isControllerConnected;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (unint64_t)numberOfControllersConnected;
- (unsigned)dataVersion;
- (void)setIsControllerConnected:(BOOL)a3;
- (void)setNumberOfControllersConnected:(unint64_t)a3;
@end

@implementation BMGameControllerEvent

- (BMGameControllerEvent)initWithIsControllerConnected:(BOOL)a3 numberOfControllersConnected:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BMGameControllerEvent;
  result = [(BMEventBase *)&v7 init];
  if (result)
  {
    result->_isControllerConnected = a3;
    result->_numberOfControllersConnected = a4;
  }
  return result;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [NSNumber numberWithBool:self->_isControllerConnected];
  v5 = [NSNumber numberWithUnsignedInteger:self->_numberOfControllersConnected];
  v6 = (void *)[v3 initWithFormat:@"GameControllerEvent event with isControllerConnected: %@, numberOfControllersConnected: %@", v4, v5];

  return (NSString *)v6;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(BMGameControllerEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (BMGameControllerEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BMGameControllerEvent initWithProto:]((uint64_t)self, v9);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  uint64_t v6 = [v5 isControllerConnected];
  int v7 = [v5 numberOfControllersConnected];

  self = [(BMGameControllerEvent *)self initWithIsControllerConnected:v6 numberOfControllersConnected:v7];
  v8 = self;
LABEL_8:

  return v8;
}

- (BMGameControllerEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBGameControllerEvent alloc] initWithData:v4];

    self = [(BMGameControllerEvent *)self initWithProto:v5];
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
  objc_msgSend(v3, "setIsControllerConnected:", -[BMGameControllerEvent isControllerConnected](self, "isControllerConnected"));
  objc_msgSend(v3, "setNumberOfControllersConnected:", -[BMGameControllerEvent numberOfControllersConnected](self, "numberOfControllersConnected"));

  return v3;
}

- (unint64_t)hash
{
  id v3 = [NSNumber numberWithBool:self->_isControllerConnected];
  uint64_t v4 = [v3 hash];
  id v5 = [NSNumber numberWithUnsignedInteger:self->_numberOfControllersConnected];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int isControllerConnected = self->_isControllerConnected;
    if (isControllerConnected == [v5 isControllerConnected])
    {
      unint64_t numberOfControllersConnected = self->_numberOfControllersConnected;
      BOOL v8 = numberOfControllersConnected == [v5 numberOfControllersConnected];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isControllerConnected
{
  return self->_isControllerConnected;
}

- (void)setIsControllerConnected:(BOOL)a3
{
  self->_int isControllerConnected = a3;
}

- (unint64_t)numberOfControllersConnected
{
  return self->_numberOfControllersConnected;
}

- (void)setNumberOfControllersConnected:(unint64_t)a3
{
  self->_unint64_t numberOfControllersConnected = a3;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  unint64_t v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBGameControllerEventDataVersion proto", (uint8_t *)&v5, 0xCu);
}

@end