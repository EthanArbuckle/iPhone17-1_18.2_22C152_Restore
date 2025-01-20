@interface CLPLOGENTRYVISIONLSLHeadingSupplInfo
- (BOOL)hasRoadSegment;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPLOGENTRYVISIONLSLMapRoadSegment)roadSegment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRoadSegment:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPLOGENTRYVISIONLSLHeadingSupplInfo

- (BOOL)hasRoadSegment
{
  return self->_roadSegment != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLOGENTRYVISIONLSLHeadingSupplInfo;
  v4 = [(CLPLOGENTRYVISIONLSLHeadingSupplInfo *)&v8 description];
  v5 = [(CLPLOGENTRYVISIONLSLHeadingSupplInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  roadSegment = self->_roadSegment;
  if (roadSegment)
  {
    v5 = [(CLPLOGENTRYVISIONLSLMapRoadSegment *)roadSegment dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"road_segment"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONLSLHeadingSupplInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_roadSegment) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  roadSegment = self->_roadSegment;
  if (roadSegment) {
    [a3 setRoadSegment:roadSegment];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CLPLOGENTRYVISIONLSLMapRoadSegment *)self->_roadSegment copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    roadSegment = self->_roadSegment;
    if ((unint64_t)roadSegment | v4[1]) {
      char v6 = -[CLPLOGENTRYVISIONLSLMapRoadSegment isEqual:](roadSegment, "isEqual:");
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
  return [(CLPLOGENTRYVISIONLSLMapRoadSegment *)self->_roadSegment hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  roadSegment = self->_roadSegment;
  uint64_t v6 = v4[1];
  if (roadSegment)
  {
    if (v6) {
      -[CLPLOGENTRYVISIONLSLMapRoadSegment mergeFrom:](roadSegment, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[CLPLOGENTRYVISIONLSLHeadingSupplInfo setRoadSegment:](self, "setRoadSegment:");
  }

  MEMORY[0x1F41817F8]();
}

- (CLPLOGENTRYVISIONLSLMapRoadSegment)roadSegment
{
  return self->_roadSegment;
}

- (void)setRoadSegment:(id)a3
{
}

- (void).cxx_destruct
{
}

@end