@interface BRFieldXattr
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)value;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setName:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BRFieldXattr

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BRFieldXattr;
  v4 = [(BRFieldXattr *)&v8 description];
  v5 = [(BRFieldXattr *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  value = self->_value;
  if (value) {
    [v4 setObject:value forKey:@"value"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BRFieldXattrReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_name) {
    -[BRFieldXattr writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_value) {
    -[BRFieldXattr writeTo:]();
  }
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 setName:name];
  [v5 setValue:self->_value];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_value copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[1])) || -[NSString isEqual:](name, "isEqual:")))
  {
    value = self->_value;
    if ((unint64_t)value | v4[2]) {
      char v7 = -[NSData isEqual:](value, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NSData *)self->_value hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[BRFieldXattr setName:](self, "setName:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[BRFieldXattr setValue:](self, "setValue:");
    id v4 = v5;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[BRFieldXattr writeTo:]", "BRFieldXattr.m", 83, "nil != self->_name");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[BRFieldXattr writeTo:]", "BRFieldXattr.m", 88, "nil != self->_value");
}

@end