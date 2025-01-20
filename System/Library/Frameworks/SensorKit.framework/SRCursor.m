@interface SRCursor
+ (BOOL)supportsSecureCoding;
+ (SRCursor)new;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (SRCursor)init;
- (SRCursor)initWithCoder:(id)a3;
- (id)_payloadOfClass:(Class)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)initWithPayload:(void *)a3 hmac:;
@end

@implementation SRCursor

- (SRCursor)init
{
  return 0;
}

+ (SRCursor)new
{
  return 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogCursor = (uint64_t)os_log_create("com.apple.SensorKit", "SRCursor");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SRCursor alloc];
  payload = self->_payload;
  hmac = self->_hmac;

  return -[SRCursor initWithPayload:hmac:](v4, payload, hmac);
}

- (void)initWithPayload:(void *)a3 hmac:
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)SRCursor;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    v5[1] = [a2 copy];
    v5[2] = [a3 copy];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  LOBYTE(v6) = 0;
  if (self && (isKindOfClass & 1) != 0)
  {
    payload = self->_payload;
    if (a3)
    {
      BOOL v6 = [(NSData *)payload isEqualToData:*((void *)a3 + 1)];
      if (!v6) {
        return v6;
      }
      uint64_t v8 = *((void *)a3 + 2);
    }
    else
    {
      BOOL v10 = [(NSData *)payload isEqualToData:0];
      uint64_t v8 = 0;
      if (!v10)
      {
        LOBYTE(v6) = 0;
        return v6;
      }
    }
    hmac = self->_hmac;
    LOBYTE(v6) = [(NSData *)hmac isEqualToData:v8];
  }
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_payload hash];
  return [(NSData *)self->_hmac hash] ^ v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@ (%p)", NSStringFromClass(v4), self];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRCursor;
  [(SRCursor *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRCursor.m", 86, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]");
  }
  [a3 encodeObject:self->_payload forKey:@"payload"];
  hmac = self->_hmac;

  [a3 encodeObject:hmac forKey:@"hmac"];
}

- (SRCursor)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRCursor.m", 92, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]");
  }
  BOOL v6 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
  objc_super v7 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"hmac"];

  return (SRCursor *)-[SRCursor initWithPayload:hmac:](self, v6, v7);
}

- (id)_payloadOfClass:(Class)a3 error:(id *)a4
{
  if (self) {
    payload = self->_payload;
  }
  else {
    payload = 0;
  }
  return (id)[MEMORY[0x263F08928] unarchivedObjectOfClass:a3 fromData:payload error:a4];
}

@end