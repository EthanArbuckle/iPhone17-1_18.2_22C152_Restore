@interface ATPRequest
- (BOOL)hasCommand;
- (BOOL)hasDataClass;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)command;
- (NSString)dataClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCommand:(id)a3;
- (void)setDataClass:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATPRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataClass, 0);

  objc_storeStrong((id *)&self->_command, 0);
}

- (void)setDataClass:(id)a3
{
}

- (NSString)dataClass
{
  return self->_dataClass;
}

- (void)setCommand:(id)a3
{
}

- (NSString)command
{
  return self->_command;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[ATPRequest setCommand:](self, "setCommand:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[ATPRequest setDataClass:](self, "setDataClass:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_command hash];
  return [(NSString *)self->_dataClass hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((command = self->_command, !((unint64_t)command | v4[1]))
     || -[NSString isEqual:](command, "isEqual:")))
  {
    dataClass = self->_dataClass;
    if ((unint64_t)dataClass | v4[2]) {
      char v7 = -[NSString isEqual:](dataClass, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_command copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_dataClass copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_command)
  {
    objc_msgSend(v4, "setCommand:");
    id v4 = v5;
  }
  if (self->_dataClass)
  {
    objc_msgSend(v5, "setDataClass:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_command)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_dataClass)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ATPRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  command = self->_command;
  if (command) {
    [v3 setObject:command forKey:@"command"];
  }
  dataClass = self->_dataClass;
  if (dataClass) {
    [v4 setObject:dataClass forKey:@"dataClass"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATPRequest;
  id v4 = [(ATPRequest *)&v8 description];
  id v5 = [(ATPRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasDataClass
{
  return self->_dataClass != 0;
}

- (BOOL)hasCommand
{
  return self->_command != 0;
}

@end