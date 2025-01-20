@interface MTRPluginPBMDeviceControllerMessage
+ (id)deviceControllerMessageFromMessage:(id)a3;
- (BOOL)hasHeader;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)readFrom:(id)a3;
- (MTRPluginPBMHeader)header;
- (MTRPluginPBMVariableValue)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHeader:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMDeviceControllerMessage

+ (id)deviceControllerMessageFromMessage:(id)a3
{
  id v3 = a3;
  v4 = [MTRPluginPBMDeviceControllerMessage alloc];
  v5 = [v3 messageData];

  v6 = [(MTRPluginPBMDeviceControllerMessage *)v4 initWithData:v5];
  if ([(MTRPluginPBMDeviceControllerMessage *)v6 isValid]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isValid
{
  BOOL v3 = [(MTRPluginPBMDeviceControllerMessage *)self hasHeader];
  if (v3)
  {
    v4 = [(MTRPluginPBMDeviceControllerMessage *)self header];
    char v5 = [v4 isValid];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)hasHeader
{
  return self->_header != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (id)description
{
  BOOL v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMDeviceControllerMessage;
  v4 = [(MTRPluginPBMDeviceControllerMessage *)&v8 description];
  char v5 = [(MTRPluginPBMDeviceControllerMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionary];
  header = self->_header;
  if (header)
  {
    char v5 = [(MTRPluginPBMHeader *)header dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"header"];
  }
  value = self->_value;
  if (value)
  {
    v7 = [(MTRPluginPBMVariableValue *)value dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"value"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMDeviceControllerMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_header)
  {
    PBDataWriterWriteSubmessage();
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
  if (self->_header)
  {
    objc_msgSend(v4, "setHeader:");
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
  id v6 = [(MTRPluginPBMHeader *)self->_header copyWithZone:a3];
  v7 = (void *)v5[1];
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
    && ((header = self->_header, !((unint64_t)header | v4[1]))
     || -[MTRPluginPBMHeader isEqual:](header, "isEqual:")))
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
  unint64_t v3 = [(MTRPluginPBMHeader *)self->_header hash];
  return [(MTRPluginPBMVariableValue *)self->_value hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  header = self->_header;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (header)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MTRPluginPBMHeader mergeFrom:](header, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MTRPluginPBMDeviceControllerMessage setHeader:](self, "setHeader:");
  }
  id v4 = v9;
LABEL_7:
  value = self->_value;
  uint64_t v8 = v4[2];
  if (value)
  {
    if (v8) {
      -[MTRPluginPBMVariableValue mergeFrom:](value, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[MTRPluginPBMDeviceControllerMessage setValue:](self, "setValue:");
  }
  MEMORY[0x270F9A758]();
}

- (MTRPluginPBMHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
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
  objc_storeStrong((id *)&self->_header, 0);
}

@end