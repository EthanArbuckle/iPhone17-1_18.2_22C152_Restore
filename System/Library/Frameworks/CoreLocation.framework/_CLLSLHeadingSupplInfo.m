@interface _CLLSLHeadingSupplInfo
+ (BOOL)supportsSecureCoding;
- (_CLLSLHeadingSupplInfo)initWithCoder:(id)a3;
- (_CLLSLMapRoadSegment)roadSegment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setRoadSegment:(id)a3;
@end

@implementation _CLLSLHeadingSupplInfo

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CLLSLHeadingSupplInfo;
  [(_CLLSLHeadingSupplInfo *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = [(_CLLSLMapRoadSegment *)self->_roadSegment copyWithZone:a3];
  return v5;
}

- (_CLLSLHeadingSupplInfo)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_CLLSLHeadingSupplInfo;
  v4 = [(_CLLSLHeadingSupplInfo *)&v6 init];
  if (v4) {
    v4->_roadSegment = (_CLLSLMapRoadSegment *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"roadSegment"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return [(_CLLSLHeadingSupplInfo *)self descriptionWithMemberIndent:@"\t" endIndent:&stru_1EE006720];
}

- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4
{
  return (id)[NSString stringWithFormat:@"<_CLLSLHeadingSupplInfo: %p> {\n%@.roadSegment = %@\n%@}", self, a3, -[_CLLSLMapRoadSegment descriptionWithMemberIndent:endIndent:](-[_CLLSLHeadingSupplInfo roadSegment](self, "roadSegment"), "descriptionWithMemberIndent:endIndent:", objc_msgSend(a3, "stringByAppendingString:", @"\t", objc_msgSend(a4, "stringByAppendingString:", @"\t", a4];
}

- (_CLLSLMapRoadSegment)roadSegment
{
  return self->_roadSegment;
}

- (void)setRoadSegment:(id)a3
{
}

@end