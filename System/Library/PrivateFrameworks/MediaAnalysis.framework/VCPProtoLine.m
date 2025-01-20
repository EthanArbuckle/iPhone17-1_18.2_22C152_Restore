@interface VCPProtoLine
+ (id)lineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CGPoint)endPointValue;
- (CGPoint)startPointValue;
- (VCPProtoPoint)end;
- (VCPProtoPoint)start;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEnd:(id)a3;
- (void)setStart:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoLine

+ (id)lineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  v8 = objc_alloc_init(VCPProtoLine);
  v9 = +[VCPProtoPoint pointWithPoint:](VCPProtoPoint, "pointWithPoint:", v7, v6);
  [(VCPProtoLine *)v8 setStart:v9];

  v10 = +[VCPProtoPoint pointWithPoint:](VCPProtoPoint, "pointWithPoint:", x, y);
  [(VCPProtoLine *)v8 setEnd:v10];

  return v8;
}

- (CGPoint)startPointValue
{
  v2 = [(VCPProtoLine *)self start];
  [v2 pointValue];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)endPointValue
{
  v2 = [(VCPProtoLine *)self end];
  [v2 pointValue];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (id)description
{
  double v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoLine;
  double v4 = [(VCPProtoLine *)&v8 description];
  double v5 = [(VCPProtoLine *)self dictionaryRepresentation];
  double v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  start = self->_start;
  if (start)
  {
    double v5 = [(VCPProtoPoint *)start dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"start"];
  }
  end = self->_end;
  if (end)
  {
    double v7 = [(VCPProtoPoint *)end dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"end"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLineReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  start = self->_start;
  id v5 = a3;
  [v5 setStart:start];
  [v5 setEnd:self->_end];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoPoint *)self->_start copyWithZone:a3];
  double v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(VCPProtoPoint *)self->_end copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((start = self->_start, !((unint64_t)start | v4[2])) || -[VCPProtoPoint isEqual:](start, "isEqual:")))
  {
    end = self->_end;
    if ((unint64_t)end | v4[1]) {
      char v7 = -[VCPProtoPoint isEqual:](end, "isEqual:");
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
  unint64_t v3 = [(VCPProtoPoint *)self->_start hash];
  return [(VCPProtoPoint *)self->_end hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  double v4 = a3;
  start = self->_start;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (start)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[VCPProtoPoint mergeFrom:](start, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[VCPProtoLine setStart:](self, "setStart:");
  }
  double v4 = v9;
LABEL_7:
  end = self->_end;
  uint64_t v8 = v4[1];
  if (end)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[VCPProtoPoint mergeFrom:](end, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[VCPProtoLine setEnd:](self, "setEnd:");
  }
  double v4 = v9;
LABEL_13:
}

- (VCPProtoPoint)start
{
  return self->_start;
}

- (void)setStart:(id)a3
{
}

- (VCPProtoPoint)end
{
  return self->_end;
}

- (void)setEnd:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_end, 0);
}

@end