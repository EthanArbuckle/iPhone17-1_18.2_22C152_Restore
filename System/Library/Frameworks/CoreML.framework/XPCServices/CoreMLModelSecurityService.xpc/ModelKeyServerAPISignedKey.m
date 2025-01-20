@interface ModelKeyServerAPISignedKey
- (BOOL)hasData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)data;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ModelKeyServerAPISignedKey

- (BOOL)hasData
{
  return self->_data != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ModelKeyServerAPISignedKey;
  v3 = [(ModelKeyServerAPISignedKey *)&v7 description];
  v4 = [(ModelKeyServerAPISignedKey *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  data = self->_data;
  if (data) {
    [v3 setObject:data forKey:@"data"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ModelKeyServerAPISignedKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_data) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  data = self->_data;
  if (data) {
    [a3 setData:data];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_data copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    data = self->_data;
    if ((unint64_t)data | v4[1]) {
      unsigned __int8 v6 = -[NSData isEqual:](data, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSData *)self->_data hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[ModelKeyServerAPISignedKey setData:](self, "setData:");
  }
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end