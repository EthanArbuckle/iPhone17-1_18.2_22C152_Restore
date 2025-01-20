@interface MTRPluginPBMURL
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTRPluginPBMURL)initWithURL:(id)a3;
- (NSString)value;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setUrl:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMURL

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMURL;
  v4 = [(MTRPluginPBMURL *)&v8 description];
  v5 = [(MTRPluginPBMURL *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  value = self->_value;
  if (value) {
    [v3 setObject:value forKey:@"value"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMURLReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_value) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  value = self->_value;
  if (value) {
    [a3 setValue:value];
  }
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
  v4 = a3;
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
    -[MTRPluginPBMURL setValue:](self, "setValue:");
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

- (MTRPluginPBMURL)initWithURL:(id)a3
{
  id v4 = a3;
  if (v4 && (self = [(MTRPluginPBMURL *)self init]) != 0)
  {
    v5 = [v4 absoluteString];
    [(MTRPluginPBMURL *)self setValue:v5];

    self = self;
    char v6 = self;
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)setUrl:(id)a3
{
  id v4 = [a3 absoluteString];
  [(MTRPluginPBMURL *)self setValue:v4];
}

- (NSURL)url
{
  id v3 = objc_alloc(NSURL);
  id v4 = [(MTRPluginPBMURL *)self value];
  v5 = (void *)[v3 initWithString:v4];

  return (NSURL *)v5;
}

@end