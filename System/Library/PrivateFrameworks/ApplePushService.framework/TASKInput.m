@interface TASKInput
- (BOOL)hasEdgeDNS;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (TASKEdgeDnsInput)edgeDNS;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEdgeDNS:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TASKInput

- (BOOL)hasEdgeDNS
{
  return self->_edgeDNS != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TASKInput;
  v3 = [(TASKInput *)&v7 description];
  v4 = [(TASKInput *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  edgeDNS = self->_edgeDNS;
  if (edgeDNS)
  {
    v5 = [(TASKEdgeDnsInput *)edgeDNS dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"edgeDNS"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10003B7EC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_edgeDNS) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  edgeDNS = self->_edgeDNS;
  if (edgeDNS) {
    [a3 setEdgeDNS:edgeDNS];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(TASKEdgeDnsInput *)self->_edgeDNS copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    edgeDNS = self->_edgeDNS;
    if ((unint64_t)edgeDNS | v4[1]) {
      unsigned __int8 v6 = -[TASKEdgeDnsInput isEqual:](edgeDNS, "isEqual:");
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
  return [(TASKEdgeDnsInput *)self->_edgeDNS hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  edgeDNS = self->_edgeDNS;
  uint64_t v6 = v4[1];
  if (edgeDNS)
  {
    if (v6) {
      -[TASKEdgeDnsInput mergeFrom:](edgeDNS, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[TASKInput setEdgeDNS:](self, "setEdgeDNS:");
  }
  _objc_release_x1();
}

- (TASKEdgeDnsInput)edgeDNS
{
  return self->_edgeDNS;
}

- (void)setEdgeDNS:(id)a3
{
}

- (void).cxx_destruct
{
}

@end