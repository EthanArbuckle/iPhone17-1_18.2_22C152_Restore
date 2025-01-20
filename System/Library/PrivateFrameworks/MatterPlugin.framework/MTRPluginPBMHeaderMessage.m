@interface MTRPluginPBMHeaderMessage
- (BOOL)hasHeader;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTRPluginPBMHeader)header;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHeader:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMHeaderMessage

- (BOOL)hasHeader
{
  return self->_header != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMHeaderMessage;
  v4 = [(MTRPluginPBMHeaderMessage *)&v8 description];
  v5 = [(MTRPluginPBMHeaderMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  header = self->_header;
  if (header)
  {
    v5 = [(MTRPluginPBMHeader *)header dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"header"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMHeaderMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_header) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  header = self->_header;
  if (header) {
    [a3 setHeader:header];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MTRPluginPBMHeader *)self->_header copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    header = self->_header;
    if ((unint64_t)header | v4[1]) {
      char v6 = -[MTRPluginPBMHeader isEqual:](header, "isEqual:");
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
  return [(MTRPluginPBMHeader *)self->_header hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  header = self->_header;
  uint64_t v6 = v4[1];
  if (header)
  {
    if (v6) {
      -[MTRPluginPBMHeader mergeFrom:](header, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[MTRPluginPBMHeaderMessage setHeader:](self, "setHeader:");
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

- (void).cxx_destruct
{
}

@end