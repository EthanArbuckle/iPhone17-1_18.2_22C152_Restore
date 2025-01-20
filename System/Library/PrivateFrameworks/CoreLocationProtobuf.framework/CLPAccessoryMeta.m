@interface CLPAccessoryMeta
- (BOOL)hasMake;
- (BOOL)hasModel;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)make;
- (NSString)model;
- (NSString)version;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMake:(id)a3;
- (void)setModel:(id)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPAccessoryMeta

- (BOOL)hasMake
{
  return self->_make != 0;
}

- (BOOL)hasModel
{
  return self->_model != 0;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPAccessoryMeta;
  v4 = [(CLPAccessoryMeta *)&v8 description];
  v5 = [(CLPAccessoryMeta *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  make = self->_make;
  if (make) {
    [v3 setObject:make forKey:@"make"];
  }
  model = self->_model;
  if (model) {
    [v4 setObject:model forKey:@"model"];
  }
  version = self->_version;
  if (version) {
    [v4 setObject:version forKey:@"version"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CLPAccessoryMetaReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_make)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_model)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_version)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_make)
  {
    objc_msgSend(v4, "setMake:");
    id v4 = v5;
  }
  if (self->_model)
  {
    objc_msgSend(v5, "setModel:");
    id v4 = v5;
  }
  if (self->_version)
  {
    objc_msgSend(v5, "setVersion:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_make copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_model copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_version copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((make = self->_make, !((unint64_t)make | v4[1])) || -[NSString isEqual:](make, "isEqual:"))
    && ((model = self->_model, !((unint64_t)model | v4[2]))
     || -[NSString isEqual:](model, "isEqual:")))
  {
    version = self->_version;
    if ((unint64_t)version | v4[3]) {
      char v8 = -[NSString isEqual:](version, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_make hash];
  NSUInteger v4 = [(NSString *)self->_model hash] ^ v3;
  return v4 ^ [(NSString *)self->_version hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[1]) {
    -[CLPAccessoryMeta setMake:](self, "setMake:");
  }
  if (v4[2]) {
    -[CLPAccessoryMeta setModel:](self, "setModel:");
  }
  if (v4[3]) {
    -[CLPAccessoryMeta setVersion:](self, "setVersion:");
  }
}

- (NSString)make
{
  return self->_make;
}

- (void)setMake:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_make, 0);
}

@end