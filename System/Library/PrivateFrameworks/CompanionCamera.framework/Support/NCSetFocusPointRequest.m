@interface NCSetFocusPointRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)pointAtIndex:(unint64_t)a3;
- (float)points;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)pointsCount;
- (void)addPoint:(float)a3;
- (void)clearPoints;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setPoints:(float *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation NCSetFocusPointRequest

- (void)dealloc
{
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)NCSetFocusPointRequest;
  [(NCSetFocusPointRequest *)&v3 dealloc];
}

- (unint64_t)pointsCount
{
  return self->_points.count;
}

- (float)points
{
  return self->_points.list;
}

- (void)clearPoints
{
}

- (void)addPoint:(float)a3
{
}

- (float)pointAtIndex:(unint64_t)a3
{
  p_points = &self->_points;
  unint64_t count = self->_points.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_points->list[a3];
}

- (void)setPoints:(float *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NCSetFocusPointRequest;
  objc_super v3 = [(NCSetFocusPointRequest *)&v7 description];
  v4 = [(NCSetFocusPointRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v2 = +[NSMutableDictionary dictionary];
  objc_super v3 = PBRepeatedFloatNSArray();
  [v2 setObject:v3 forKey:@"point"];

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100023748((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_points = &self->_points;
  if (p_points->count)
  {
    PBDataWriterPlaceMark();
    if (p_points->count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v6;
      }
      while (v6 < p_points->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if ([(NCSetFocusPointRequest *)self pointsCount])
  {
    [v7 clearPoints];
    unint64_t v4 = [(NCSetFocusPointRequest *)self pointsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        [(NCSetFocusPointRequest *)self pointAtIndex:i];
        objc_msgSend(v7, "addPoint:");
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedFloatCopy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()]) {
    char IsEqual = PBRepeatedFloatIsEqual();
  }
  else {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  return PBRepeatedFloatHash();
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  unint64_t v4 = (char *)[v7 pointsCount];
  if (v4)
  {
    unint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      [v7 pointAtIndex:i];
      -[NCSetFocusPointRequest addPoint:](self, "addPoint:");
    }
  }
}

@end