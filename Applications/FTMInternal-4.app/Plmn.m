@interface Plmn
- (BOOL)hasEncodedPlmn;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encodedPlmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncodedPlmn:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation Plmn

- (BOOL)hasEncodedPlmn
{
  return self->_encodedPlmn != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)Plmn;
  v3 = [(Plmn *)&v7 description];
  v4 = [(Plmn *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  encodedPlmn = self->_encodedPlmn;
  if (encodedPlmn) {
    [v3 setObject:encodedPlmn forKey:@"encoded_plmn"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10007DC60((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_encodedPlmn) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  encodedPlmn = self->_encodedPlmn;
  if (encodedPlmn) {
    [a3 setEncodedPlmn:encodedPlmn];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_encodedPlmn copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    encodedPlmn = self->_encodedPlmn;
    if ((unint64_t)encodedPlmn | v4[1]) {
      unsigned __int8 v6 = -[NSData isEqual:](encodedPlmn, "isEqual:");
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
  return (unint64_t)[(NSData *)self->_encodedPlmn hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[Plmn setEncodedPlmn:](self, "setEncodedPlmn:");
  }
}

- (NSData)encodedPlmn
{
  return self->_encodedPlmn;
}

- (void)setEncodedPlmn:(id)a3
{
}

- (void).cxx_destruct
{
}

@end