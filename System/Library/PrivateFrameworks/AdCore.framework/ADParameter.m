@interface ADParameter
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (NSString)value;
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

@implementation ADParameter

- (NSString)key
{
  return self->_key;
}

- (NSString)value
{
  return self->_value;
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
  if (value) {
    [v4 setObject:value forKey:@"value"];
  }
  return v4;
}

+ (id)options
{
  if (options_once_1 != -1) {
    dispatch_once(&options_once_1, &__block_literal_global_3);
  }
  v2 = (void *)options_sOptions_1;
  return v2;
}

void __22__ADParameter_options__block_invoke()
{
  v0 = (void *)options_sOptions_1;
  options_sOptions_1 = (uint64_t)&unk_1F2715460;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ADParameter;
  v4 = [(ADParameter *)&v8 description];
  v5 = [(ADParameter *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return ADParameterReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_key) {
    -[ADParameter writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_value) {
    -[ADParameter writeTo:]();
  }
  PBDataWriterWriteStringField();
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

  uint64_t v8 = [(NSString *)self->_value copyWithZone:a3];
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
      char v7 = -[NSString isEqual:](value, "isEqual:");
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
  return [(NSString *)self->_value hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[ADParameter setKey:](self, "setKey:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[ADParameter setValue:](self, "setValue:");
    id v4 = v5;
  }
}

- (void)setKey:(id)a3
{
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ADParameter writeTo:]", "ADParameter.m", 96, "nil != self->_key");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[ADParameter writeTo:]", "ADParameter.m", 101, "nil != self->_value");
}

@end