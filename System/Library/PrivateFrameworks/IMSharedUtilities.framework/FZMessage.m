@interface FZMessage
+ (BOOL)supportsSecureCoding;
- (FZMessage)initWithCoder:(id)a3;
- (FZMessage)initWithIMRemoteObjectSerializedDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithIMRemoteObjectSerializedDictionary:(id)a3;
@end

@implementation FZMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FZMessage;
  return [(IMMessageItem *)&v4 copyWithZone:a3];
}

- (FZMessage)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FZMessage;
  return [(IMMessageItem *)&v4 initWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FZMessage;
  [(IMMessageItem *)&v3 encodeWithCoder:a3];
}

- (void)encodeWithIMRemoteObjectSerializedDictionary:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FZMessage;
  [(IMItem *)&v3 encodeWithIMRemoteObjectSerializedDictionary:a3];
}

- (FZMessage)initWithIMRemoteObjectSerializedDictionary:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FZMessage;
  return [(IMItem *)&v4 initWithIMRemoteObjectSerializedDictionary:a3];
}

@end