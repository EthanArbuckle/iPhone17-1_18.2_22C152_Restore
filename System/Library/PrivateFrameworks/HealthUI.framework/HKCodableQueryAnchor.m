@interface HKCodableQueryAnchor
- (BOOL)hasEncodedQueryAnchorData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encodedQueryAnchorData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncodedQueryAnchorData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableQueryAnchor

- (BOOL)hasEncodedQueryAnchorData
{
  return self->_encodedQueryAnchorData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableQueryAnchor;
  v4 = [(HKCodableQueryAnchor *)&v8 description];
  v5 = [(HKCodableQueryAnchor *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  encodedQueryAnchorData = self->_encodedQueryAnchorData;
  if (encodedQueryAnchorData) {
    [v3 setObject:encodedQueryAnchorData forKey:@"encodedQueryAnchorData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableQueryAnchorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_encodedQueryAnchorData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  encodedQueryAnchorData = self->_encodedQueryAnchorData;
  if (encodedQueryAnchorData) {
    [a3 setEncodedQueryAnchorData:encodedQueryAnchorData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_encodedQueryAnchorData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    encodedQueryAnchorData = self->_encodedQueryAnchorData;
    if ((unint64_t)encodedQueryAnchorData | v4[1]) {
      char v6 = -[NSData isEqual:](encodedQueryAnchorData, "isEqual:");
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
  return [(NSData *)self->_encodedQueryAnchorData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[HKCodableQueryAnchor setEncodedQueryAnchorData:](self, "setEncodedQueryAnchorData:");
  }
}

- (NSData)encodedQueryAnchorData
{
  return self->_encodedQueryAnchorData;
}

- (void)setEncodedQueryAnchorData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end