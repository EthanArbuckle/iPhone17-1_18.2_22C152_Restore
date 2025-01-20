@interface ADUserTransparencyResponse
- (ADTransparencyDetails)transparencyDetails;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTransparencyDetails:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ADUserTransparencyResponse

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ADUserTransparencyResponse;
  v4 = [(ADUserTransparencyResponse *)&v8 description];
  v5 = [(ADUserTransparencyResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  transparencyDetails = self->_transparencyDetails;
  if (transparencyDetails)
  {
    v5 = [(ADTransparencyDetails *)transparencyDetails dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"transparencyDetails"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ADUserTransparencyResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_transparencyDetails) {
    -[ADUserTransparencyResponse writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ADTransparencyDetails *)self->_transparencyDetails copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    transparencyDetails = self->_transparencyDetails;
    if ((unint64_t)transparencyDetails | v4[1]) {
      char v6 = -[ADTransparencyDetails isEqual:](transparencyDetails, "isEqual:");
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
  return [(ADTransparencyDetails *)self->_transparencyDetails hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  transparencyDetails = self->_transparencyDetails;
  uint64_t v6 = v4[1];
  if (transparencyDetails)
  {
    if (v6) {
      -[ADTransparencyDetails mergeFrom:](transparencyDetails, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ADUserTransparencyResponse setTransparencyDetails:](self, "setTransparencyDetails:");
  }
  MEMORY[0x1F41817F8]();
}

- (ADTransparencyDetails)transparencyDetails
{
  return self->_transparencyDetails;
}

- (void)setTransparencyDetails:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ADUserTransparencyResponse writeTo:]", "ADUserTransparencyResponse.m", 86, "self->_transparencyDetails != nil");
}

@end