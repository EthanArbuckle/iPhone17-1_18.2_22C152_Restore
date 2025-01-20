@interface ACProtobufUUID
- (ACProtobufUUID)initWithUUID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)value;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setUuid:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ACProtobufUUID

- (ACProtobufUUID)initWithUUID:(id)a3
{
  id v4 = a3;
  if (v4 && (self = [(ACProtobufUUID *)self init]) != 0)
  {
    v5 = [v4 UUIDString];
    [(ACProtobufUUID *)self setValue:v5];

    self = self;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setUuid:(id)a3
{
  id v4 = [a3 UUIDString];
  [(ACProtobufUUID *)self setValue:v4];
}

- (NSUUID)uuid
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  id v4 = [(ACProtobufUUID *)self value];
  v5 = (void *)[v3 initWithUUIDString:v4];

  return (NSUUID *)v5;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ACProtobufUUID;
  id v4 = [(ACProtobufUUID *)&v8 description];
  v5 = [(ACProtobufUUID *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  value = self->_value;
  if (value) {
    [v3 setObject:value forKey:@"value"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ACProtobufUUIDReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_value copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    value = self->_value;
    if ((unint64_t)value | v4[1]) {
      char v6 = -[NSString isEqual:](value, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_value hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[ACProtobufUUID setValue:](self, "setValue:");
  }
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end