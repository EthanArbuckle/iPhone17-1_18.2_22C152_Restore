@interface ACProtobufVariableKeyValuePair
- (ACProtobufVariableKeyValuePair)initWithObjectValue:(id)a3 forKey:(id)a4;
- (ACProtobufVariableValue)value;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ACProtobufVariableKeyValuePair

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ACProtobufVariableKeyValuePair;
  v4 = [(ACProtobufVariableKeyValuePair *)&v8 description];
  v5 = [(ACProtobufVariableKeyValuePair *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  value = self->_value;
  if (value)
  {
    v7 = [(ACProtobufVariableValue *)value dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"value"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ACProtobufVariableKeyValuePairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 setKey:key];
  [v5 setValue:self->_value];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(ACProtobufVariableValue *)self->_value copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[1])) || -[NSString isEqual:](key, "isEqual:")))
  {
    value = self->_value;
    if ((unint64_t)value | v4[2]) {
      char v7 = -[ACProtobufVariableValue isEqual:](value, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  return [(ACProtobufVariableValue *)self->_value hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  char v7 = v4;
  if (v4[1])
  {
    -[ACProtobufVariableKeyValuePair setKey:](self, "setKey:");
    v4 = v7;
  }
  value = self->_value;
  uint64_t v6 = v4[2];
  if (value)
  {
    if (v6) {
      -[ACProtobufVariableValue mergeFrom:](value, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ACProtobufVariableKeyValuePair setValue:](self, "setValue:");
  }

  MEMORY[0x1F41817F8]();
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (ACProtobufVariableValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

- (ACProtobufVariableKeyValuePair)initWithObjectValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[ACProtobufVariableValue alloc] initWithObjectValue:v7];

  if (v8 && (v9 = [(ACProtobufVariableKeyValuePair *)self init], (self = v9) != 0))
  {
    [(ACProtobufVariableKeyValuePair *)v9 setKey:v6];
    [(ACProtobufVariableKeyValuePair *)self setValue:v8];
    self = self;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end