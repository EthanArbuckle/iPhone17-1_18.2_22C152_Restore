@interface _CLLSLHeadingEstimation
+ (BOOL)supportsSecureCoding;
- (NSArray)headings;
- (_CLLSLHeadingEstimation)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4;
- (int)status;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setHeadings:(id)a3;
- (void)setStatus:(int)a3;
@end

@implementation _CLLSLHeadingEstimation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CLLSLHeadingEstimation;
  [(_CLLSLHeadingEstimation *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 8) = self->_status;
  *(void *)(v5 + 16) = [(NSArray *)self->_headings copyWithZone:a3];
  return (id)v5;
}

- (_CLLSLHeadingEstimation)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_CLLSLHeadingEstimation;
  v4 = [(_CLLSLHeadingEstimation *)&v8 init];
  if (v4)
  {
    v4->_status = [a3 decodeIntForKey:@"status"];
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    v4->_headings = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"headings");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt:self->_status forKey:@"status"];
  headings = self->_headings;

  [a3 encodeObject:headings forKey:@"headings"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return [(_CLLSLHeadingEstimation *)self descriptionWithMemberIndent:@"\t" endIndent:&stru_1EE006720];
}

- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v6 appendString:objc_msgSend(NSString, "stringWithFormat:", @"<NSArray: %p> {\n", -[_CLLSLHeadingEstimation headings](self, "headings"))];
  NSUInteger v7 = [(NSArray *)[(_CLLSLHeadingEstimation *)self headings] count];
  if (v7)
  {
    NSUInteger v8 = v7;
    uint64_t v9 = 0;
    NSUInteger v16 = v7 - 1;
    do
    {
      v10 = NSString;
      id v11 = [(NSArray *)[(_CLLSLHeadingEstimation *)self headings] objectAtIndex:v9];
      uint64_t v12 = [NSString stringWithFormat:@"%@\t\t", a3];
      [v6 appendString:objc_msgSend(v10, "stringWithFormat:", @"%@%@%@", a3, @"\t", objc_msgSend(v11, "descriptionWithMemberIndent:endIndent:", v12, objc_msgSend(NSString, "stringWithFormat:", @"%@\t\t", a4)))];
      uint64_t v13 = v9 + 1;
      if (v16 == v9) {
        v14 = @"\n";
      }
      else {
        v14 = @",\n";
      }
      [v6 appendString:v14];
      ++v9;
    }
    while (v8 != v13);
  }
  [v6 appendString:objc_msgSend(NSString, "stringWithFormat:", @"%@}", a3)];
  return (id)[NSString stringWithFormat:@"<_CLLSLHeadingEstimation: %p> {\n%@.status = %d,\n%@.headings = %@\n%@}", self, a3, -[_CLLSLHeadingEstimation status](self, "status"), a3, v6, a4];
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (NSArray)headings
{
  return self->_headings;
}

- (void)setHeadings:(id)a3
{
}

@end