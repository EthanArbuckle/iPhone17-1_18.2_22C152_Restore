@interface MTRPluginPBMVariableKeyValuePair
- (BOOL)hasKey;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTRPluginPBMVariableKeyValuePair)initWithObjectValue:(id)a3 forKey:(id)a4;
- (MTRPluginPBMVariableValue)value;
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

@implementation MTRPluginPBMVariableKeyValuePair

- (MTRPluginPBMVariableKeyValuePair)initWithObjectValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[MTRPluginPBMVariableValue alloc] initWithObjectValue:v7];

  if (v8 && (v9 = [(MTRPluginPBMVariableKeyValuePair *)self init], (self = v9) != 0))
  {
    [(MTRPluginPBMVariableKeyValuePair *)v9 setKey:v6];
    [(MTRPluginPBMVariableKeyValuePair *)self setValue:v8];
    self = self;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMVariableKeyValuePair;
  v4 = [(MTRPluginPBMVariableKeyValuePair *)&v8 description];
  v5 = [(MTRPluginPBMVariableKeyValuePair *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  value = self->_value;
  if (value)
  {
    id v7 = [(MTRPluginPBMVariableValue *)value dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"value"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMVariableKeyValuePairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v5;
  }
  if (self->_value)
  {
    objc_msgSend(v5, "setValue:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(MTRPluginPBMVariableValue *)self->_value copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[1])) || -[NSString isEqual:](key, "isEqual:")))
  {
    value = self->_value;
    if ((unint64_t)value | v4[2]) {
      char v7 = -[MTRPluginPBMVariableValue isEqual:](value, "isEqual:");
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
  return [(MTRPluginPBMVariableValue *)self->_value hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = v4;
  if (v4[1])
  {
    -[MTRPluginPBMVariableKeyValuePair setKey:](self, "setKey:");
    id v4 = v7;
  }
  value = self->_value;
  uint64_t v6 = v4[2];
  if (value)
  {
    if (v6) {
      -[MTRPluginPBMVariableValue mergeFrom:](value, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[MTRPluginPBMVariableKeyValuePair setValue:](self, "setValue:");
  }
  MEMORY[0x270F9A758]();
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (MTRPluginPBMVariableValue)value
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

@end