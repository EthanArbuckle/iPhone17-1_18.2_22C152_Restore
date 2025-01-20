@interface DYTransportMessage
+ (id)messageWithKind:(int)a3;
+ (id)messageWithKind:(int)a3 BOOLPayload:(BOOL)a4;
+ (id)messageWithKind:(int)a3 attributes:(id)a4;
+ (id)messageWithKind:(int)a3 attributes:(id)a4 BOOLPayload:(BOOL)a5;
+ (id)messageWithKind:(int)a3 attributes:(id)a4 objectPayload:(id)a5;
+ (id)messageWithKind:(int)a3 attributes:(id)a4 payload:(id)a5;
+ (id)messageWithKind:(int)a3 attributes:(id)a4 plistPayload:(id)a5;
+ (id)messageWithKind:(int)a3 attributes:(id)a4 stringPayload:(id)a5;
+ (id)messageWithKind:(int)a3 objectPayload:(id)a4;
+ (id)messageWithKind:(int)a3 payload:(id)a4;
+ (id)messageWithKind:(int)a3 plistPayload:(id)a4;
+ (id)messageWithKind:(int)a3 stringPayload:(id)a4;
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)BOOLPayload;
- (BOOL)hasBeenSent;
- (DYTransport)transport;
- (DYTransportMessage)init;
- (DYTransportMessage)initWithKind:(int)a3 attributes:(id)a4 BOOLPayload:(BOOL)a5;
- (DYTransportMessage)initWithKind:(int)a3 attributes:(id)a4 objectPayload:(id)a5;
- (DYTransportMessage)initWithKind:(int)a3 attributes:(id)a4 payload:(id)a5;
- (DYTransportMessage)initWithKind:(int)a3 attributes:(id)a4 plistPayload:(id)a5;
- (DYTransportMessage)initWithKind:(int)a3 attributes:(id)a4 stringPayload:(id)a5;
- (NSData)encodedAttributes;
- (NSData)payload;
- (NSDictionary)attributes;
- (NSString)description;
- (double)doubleForKey:(id)a3;
- (id)archiver:(id)a3 willEncodeObject:(id)a4;
- (id)attributeForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectPayload;
- (id)plistPayload;
- (id)stringPayload;
- (int)kind;
- (unint64_t)uint64ForKey:(id)a3;
- (unsigned)replySerial;
- (unsigned)serial;
- (unsigned)transportSize;
- (unsigned)uint32ForKey:(id)a3;
- (void)_setSerial:(unsigned int)a3 replySerial:(unsigned int)a4 transport:(id)a5;
- (void)_setTransportSize:(unsigned int)a3;
- (void)dealloc;
- (void)setEncodedAttributes:(id)a3;
@end

@implementation DYTransportMessage

+ (id)messageWithKind:(int)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:0 payload:0];

  return v3;
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:a4 payload:0];

  return v4;
}

+ (id)messageWithKind:(int)a3 payload:(id)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:0 payload:a4];

  return v4;
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 payload:(id)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:a4 payload:a5];

  return v5;
}

+ (id)messageWithKind:(int)a3 BOOLPayload:(BOOL)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:0 BOOLPayload:a4];

  return v4;
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 BOOLPayload:(BOOL)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:a4 BOOLPayload:a5];

  return v5;
}

+ (id)messageWithKind:(int)a3 plistPayload:(id)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:0 plistPayload:a4];

  return v4;
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 plistPayload:(id)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:a4 plistPayload:a5];

  return v5;
}

+ (id)messageWithKind:(int)a3 stringPayload:(id)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:0 stringPayload:a4];

  return v4;
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 stringPayload:(id)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:a4 stringPayload:a5];

  return v5;
}

+ (id)messageWithKind:(int)a3 objectPayload:(id)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:0 objectPayload:a4];

  return v4;
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 objectPayload:(id)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:a4 objectPayload:a5];

  return v5;
}

- (DYTransportMessage)init
{
  return 0;
}

- (DYTransportMessage)initWithKind:(int)a3 attributes:(id)a4 payload:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)DYTransportMessage;
  v8 = [(DYTransportMessage *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_kind = a3;
    *(void *)&v8->_serial = -1;
    v8->_attributes = (NSDictionary *)a4;
    v9->_payload = (NSData *)a5;
  }
  return v9;
}

- (DYTransportMessage)initWithKind:(int)a3 attributes:(id)a4 BOOLPayload:(BOOL)a5
{
  uint64_t v6 = *(void *)&a3;
  BOOL v12 = a5;
  uint64_t v8 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v12 length:1];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(DYTransportMessage *)self initWithKind:v6 attributes:a4 payload:v8];
  }
  else
  {

    return 0;
  }
  return v10;
}

- (DYTransportMessage)initWithKind:(int)a3 attributes:(id)a4 plistPayload:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  if (!a5)
  {
    Data = 0;
    goto LABEL_5;
  }
  Data = (DYTransportMessage *)CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x263EFFB08], a5, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (Data)
  {
LABEL_5:
    v9 = [(DYTransportMessage *)self initWithKind:v6 attributes:a4 payload:Data];
    self = Data;
    goto LABEL_6;
  }
  v9 = 0;
LABEL_6:

  return v9;
}

- (DYTransportMessage)initWithKind:(int)a3 attributes:(id)a4 stringPayload:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  if (!a5)
  {
    ExternalRepresentation = 0;
    goto LABEL_5;
  }
  ExternalRepresentation = (DYTransportMessage *)CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)a5, 0x8000100u, 0);
  if (ExternalRepresentation)
  {
LABEL_5:
    v9 = [(DYTransportMessage *)self initWithKind:v6 attributes:a4 payload:ExternalRepresentation];
    self = ExternalRepresentation;
    goto LABEL_6;
  }
  v9 = 0;
LABEL_6:

  return v9;
}

- (DYTransportMessage)initWithKind:(int)a3 attributes:(id)a4 objectPayload:(id)a5
{
  id v5 = a5;
  uint64_t v7 = *(void *)&a3;
  if (a5)
  {
    v9 = (void *)MEMORY[0x253361500](self, a2);
    v10 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
    [v10 setDelegate:self];
    [v10 encodeObject:v5 forKey:@"root"];
    id v5 = (id)[v10 encodedData];
  }
  objc_super v11 = [(DYTransportMessage *)self initWithKind:v7 attributes:a4 payload:v5];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t kind = self->_kind;
  payload = self->_payload;
  attributes = self->_attributes;

  return (id)[v4 initWithKind:kind attributes:attributes payload:payload];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYTransportMessage;
  [(DYTransportMessage *)&v3 dealloc];
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)DYTransportMessage;
  return (NSString *)[NSString stringWithFormat:@"%@ kind=0x%x serial=%u, reply serial=%u", -[DYTransportMessage description](&v3, sel_description), self->_kind, self->_serial, self->_replySerial];
}

- (BOOL)hasBeenSent
{
  return [(DYTransportMessage *)self serial] != -1;
}

- (void)_setSerial:(unsigned int)a3 replySerial:(unsigned int)a4 transport:(id)a5
{
  self->_serial = a3;
  self->_replySerial = a4;
  self->_transport = (DYTransport *)a5;
}

- (void)_setTransportSize:(unsigned int)a3
{
  self->_transportSize = a3;
}

- (id)attributeForKey:(id)a3
{
  v4 = [(DYTransportMessage *)self attributes];

  return [(NSDictionary *)v4 objectForKey:a3];
}

- (unsigned)uint32ForKey:(id)a3
{
  id v3 = [(NSDictionary *)[(DYTransportMessage *)self attributes] objectForKey:a3];

  return [v3 unsignedIntValue];
}

- (unint64_t)uint64ForKey:(id)a3
{
  id v3 = [(NSDictionary *)[(DYTransportMessage *)self attributes] objectForKey:a3];

  return [v3 unsignedLongLongValue];
}

- (double)doubleForKey:(id)a3
{
  id v3 = [(NSDictionary *)[(DYTransportMessage *)self attributes] objectForKey:a3];

  [v3 doubleValue];
  return result;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v3 = [(NSDictionary *)[(DYTransportMessage *)self attributes] objectForKey:a3];

  return [v3 BOOLValue];
}

- (BOOL)BOOLPayload
{
  payload = self->_payload;
  if (!payload) {
    return (char)payload;
  }
  unsigned int decodedPayloadType = self->_decodedPayloadType;
  if (decodedPayloadType != 5)
  {
    if (decodedPayloadType == 4)
    {
LABEL_7:
      char v8 = 0;
      [(NSData *)payload getBytes:&v8 length:1];
      self->_unsigned int decodedPayloadType = 4;
      LOBYTE(payload) = v8 != 0;
      return (char)payload;
    }
    if (decodedPayloadType) {
      goto LABEL_14;
    }
    if ([(NSData *)payload length] == 1)
    {
      payload = self->_payload;
      goto LABEL_7;
    }
    unsigned int v5 = self->_decodedPayloadType;
    if (!v5)
    {
      id decodedPayload = [(DYTransportMessage *)self objectPayload];
      if (decodedPayload) {
        self->_unsigned int decodedPayloadType = 5;
      }
      goto LABEL_11;
    }
    if (v5 != 5)
    {
LABEL_14:
      LOBYTE(payload) = 0;
      return (char)payload;
    }
  }
  id decodedPayload = self->_decodedPayload;
LABEL_11:

  LOBYTE(payload) = [decodedPayload BOOLValue];
  return (char)payload;
}

- (id)plistPayload
{
  payload = self->_payload;
  if (!payload || (self->_decodedPayloadType | 2) != 2) {
    return 0;
  }
  id result = self->_decodedPayload;
  if (!result)
  {
    id result = (id)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFDataRef)payload, 0, 0, 0);
    self->_id decodedPayload = result;
    if (result)
    {
      self->_unsigned int decodedPayloadType = 2;
      char v5 = objc_opt_respondsToSelector();
      id result = self->_decodedPayload;
      if (v5)
      {
        int v6 = objc_msgSend((id)objc_msgSend(result, "objectForKey:", @"$archiver"), "isEqual:", @"NSKeyedArchiver");
        id result = self->_decodedPayload;
        if (v6)
        {
          [result objectForKey:@"$top"];
          char v7 = objc_opt_respondsToSelector();
          id result = self->_decodedPayload;
          if (v7)
          {
            uint64_t v8 = objc_msgSend((id)objc_msgSend(result, "objectForKey:", @"$top"), "objectForKey:", @"root");
            id result = self->_decodedPayload;
            if (v8)
            {
              uint64_t v9 = [result objectForKey:@"$version"];
              id result = self->_decodedPayload;
              if (v9)
              {
                uint64_t v10 = [result objectForKey:@"$objects"];
                id result = self->_decodedPayload;
                if (v10)
                {

                  id result = 0;
                  self->_id decodedPayload = 0;
                  self->_unsigned int decodedPayloadType = 0;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (id)stringPayload
{
  payload = self->_payload;
  if (!payload) {
    return 0;
  }
  unsigned int decodedPayloadType = self->_decodedPayloadType;
  if (decodedPayloadType != 3 && decodedPayloadType != 0) {
    return 0;
  }
  id result = self->_decodedPayload;
  if (!result)
  {
    id result = (id)CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFDataRef)payload, 0x8000100u);
    self->_id decodedPayload = result;
    if (result) {
      self->_unsigned int decodedPayloadType = 3;
    }
  }
  return result;
}

- (id)objectPayload
{
  v7[6] = *MEMORY[0x263EF8340];
  if (!self->_payload || self->_decodedPayloadType > 1) {
    return 0;
  }
  id result = self->_decodedPayload;
  if (!result)
  {
    v4 = (void *)MEMORY[0x253361500](0, a2);
    char v5 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:self->_payload error:0];
    [v5 setDecodingFailurePolicy:0];
    int v6 = (void *)[MEMORY[0x263EFF9C0] set];
    v7[0] = objc_opt_class();
    v7[1] = objc_opt_class();
    v7[2] = objc_opt_class();
    v7[3] = objc_opt_class();
    v7[4] = objc_opt_class();
    v7[5] = objc_opt_class();
    objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v7, 6));
    objc_msgSend(v6, "addObjectsFromArray:", -[NSSet allObjects](+[DYKeyedUnarchiver allClassSet](DYKeyedUnarchiver, "allClassSet"), "allObjects"));
    self->_id decodedPayload = (id)[v5 decodeObjectOfClasses:v6 forKey:@"root"];
    [v5 finishDecoding];

    id result = self->_decodedPayload;
    if (result) {
      self->_unsigned int decodedPayloadType = 1;
    }
  }
  return result;
}

- (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return a4;
  }

  return (id)[a4 array];
}

- (int)kind
{
  return self->_kind;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSData)encodedAttributes
{
  return self->_encodedAttributes;
}

- (void)setEncodedAttributes:(id)a3
{
}

- (unsigned)serial
{
  return self->_serial;
}

- (unsigned)replySerial
{
  return self->_replySerial;
}

- (DYTransport)transport
{
  return self->_transport;
}

- (unsigned)transportSize
{
  return self->_transportSize;
}

@end