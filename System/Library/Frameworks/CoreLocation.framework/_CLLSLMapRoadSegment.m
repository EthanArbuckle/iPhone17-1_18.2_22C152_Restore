@interface _CLLSLMapRoadSegment
+ (BOOL)supportsSecureCoding;
- (NSArray)polylines;
- (_CLLSLMapRoadSegment)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4;
- (unint64_t)roadID;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setPolylines:(id)a3;
- (void)setRoadID:(unint64_t)a3;
@end

@implementation _CLLSLMapRoadSegment

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CLLSLMapRoadSegment;
  [(_CLLSLMapRoadSegment *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_roadID;
  v5[2] = [(NSArray *)self->_polylines copyWithZone:a3];
  return v5;
}

- (_CLLSLMapRoadSegment)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_CLLSLMapRoadSegment;
  v4 = [(_CLLSLMapRoadSegment *)&v8 init];
  if (v4)
  {
    v4->_roadID = [a3 decodeInt64ForKey:@"roadID"];
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    v4->_polylines = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"polylines");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt64:self->_roadID forKey:@"roadID"];
  polylines = self->_polylines;

  [a3 encodeObject:polylines forKey:@"polylines"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return [(_CLLSLMapRoadSegment *)self descriptionWithMemberIndent:@"\t" endIndent:&stru_1EE006720];
}

- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v6 appendString:objc_msgSend(NSString, "stringWithFormat:", @"<NSArray: %p> {\n", -[_CLLSLMapRoadSegment polylines](self, "polylines"))];
  NSUInteger v7 = [(NSArray *)[(_CLLSLMapRoadSegment *)self polylines] count];
  if (v7)
  {
    NSUInteger v8 = v7;
    uint64_t v9 = 0;
    NSUInteger v10 = v7 - 1;
    do
    {
      [v6 appendString:objc_msgSend(NSString, "stringWithFormat:", @"%@%@%@", a3, @"\t", -[NSArray objectAtIndex:](-[_CLLSLMapRoadSegment polylines](self, "polylines"), "objectAtIndex:", v9))];
      uint64_t v11 = v9 + 1;
      if (v10 == v9) {
        v12 = @"\n";
      }
      else {
        v12 = @",\n";
      }
      [v6 appendString:v12];
      ++v9;
    }
    while (v8 != v11);
  }
  [v6 appendString:objc_msgSend(NSString, "stringWithFormat:", @"%@}", a3)];
  return (id)[NSString stringWithFormat:@"<_CLLSLMapRoadSegment: %p> {\n%@.roadID = %llu,\n%@.polylines = %@\n%@}", self, a3, -[_CLLSLMapRoadSegment roadID](self, "roadID"), a3, v6, a4];
}

- (unint64_t)roadID
{
  return self->_roadID;
}

- (void)setRoadID:(unint64_t)a3
{
  self->_roadID = a3;
}

- (NSArray)polylines
{
  return self->_polylines;
}

- (void)setPolylines:(id)a3
{
}

@end