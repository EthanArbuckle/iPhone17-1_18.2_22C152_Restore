@interface _DKPRStream
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)name;
- (uint64_t)type;
- (unint64_t)hash;
- (void)setName:(uint64_t)a1;
- (void)setType:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation _DKPRStream

- (void)setType:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setName:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_name) {
    -[_DKPRStream writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_type) {
    -[_DKPRStream writeTo:]();
  }
  PBDataWriterWriteSubmessage();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_DKPRStream;
  id v4 = [(_DKPRStream *)&v8 description];
  id v5 = [(_DKPRStream *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  type = self->_type;
  if (type)
  {
    v7 = [(_DKPRValueType *)type dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"type"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _DKPRStreamReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(_DKPRValueType *)self->_type copyWithZone:a3];
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
    type = self->_type;
    if ((unint64_t)type | v4[2]) {
      char v7 = -[_DKPRValueType isEqual:](type, "isEqual:");
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
  return [(_DKPRValueType *)self->_type hash] ^ v3;
}

- (uint64_t)name
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)type
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_DKPRStream writeTo:]", "_DKPRStream.m", 97, "nil != self->_name");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[_DKPRStream writeTo:]", "_DKPRStream.m", 102, "self->_type != nil");
}

@end