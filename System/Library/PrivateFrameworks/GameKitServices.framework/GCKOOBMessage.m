@interface GCKOOBMessage
+ (BOOL)supportsSecureCoding;
- (GCKOOBMessage)init;
- (GCKOOBMessage)initWithCoder:(id)a3;
- (id)data;
- (unsigned)band;
- (unsigned)type;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCKOOBMessage

- (GCKOOBMessage)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCKOOBMessage;
  result = [(GCKOOBMessage *)&v3 init];
  if (result)
  {
    *(void *)&result->type = 0;
    result->data = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)type
{
  return self->type;
}

- (unsigned)band
{
  return self->band;
}

- (id)data
{
  return self->data;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt32:self->type forKey:@"type"];
  [a3 encodeInt32:self->band forKey:@"band"];
  data = self->data;
  if (data && [(NSData *)data length]) {
    v6 = self->data;
  }
  else {
    v6 = (NSData *)[MEMORY[0x263EFF8F8] data];
  }
  [a3 encodeObject:v6 forKey:@"data"];
}

- (GCKOOBMessage)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GCKOOBMessage;
  v4 = [(GCKOOBMessage *)&v9 init];
  if (v4)
  {
    CFDataRef v5 = (const __CFData *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = objc_alloc(MEMORY[0x263EFF8F8]);
      BytePtr = CFDataGetBytePtr(v5);
      v4->data = (NSData *)[v6 initWithBytes:BytePtr length:CFDataGetLength(v5)];
    }
    v4->band = [a3 decodeInt32ForKey:@"band"];
    v4->type = [a3 decodeInt32ForKey:@"type"];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GCKOOBMessage;
  [(GCKOOBMessage *)&v3 dealloc];
}

@end