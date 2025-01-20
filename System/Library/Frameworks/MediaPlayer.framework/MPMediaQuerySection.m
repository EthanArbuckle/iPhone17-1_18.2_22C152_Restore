@interface MPMediaQuerySection
+ (BOOL)supportsSecureCoding;
- (MPMediaQuerySection)init;
- (MPMediaQuerySection)initWithCoder:(id)a3;
- (NSRange)range;
- (NSString)title;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)sectionIndexTitleIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setSectionIndexTitleIndex:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation MPMediaQuerySection

- (void).cxx_destruct
{
}

- (unint64_t)sectionIndexTitleIndex
{
  return self->_sectionIndexTitleIndex;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void)setSectionIndexTitleIndex:(unint64_t)a3
{
  self->_sectionIndexTitleIndex = a3;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MPMediaQuerySection;
  return [(MPMediaQuerySection *)&v3 init];
}

- (NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) _init];
  [v4 setTitle:self->_title];
  objc_msgSend(v4, "setRange:", self->_range.location, self->_range.length);
  [v4 setSectionIndexTitleIndex:self->_sectionIndexTitleIndex];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"MPTitle"];
  [v5 encodeInteger:self->_range.location forKey:@"MPRangeLocation"];
  [v5 encodeInteger:self->_range.length forKey:@"MPRangeLength"];
  [v5 encodeInteger:self->_sectionIndexTitleIndex forKey:@"MPSectionIndex"];
}

- (MPMediaQuerySection)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MPMediaQuerySection *)self _init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPTitle"];
    [(MPMediaQuerySection *)v5 setTitle:v6];

    -[MPMediaQuerySection setRange:](v5, "setRange:", [v4 decodeIntegerForKey:@"MPRangeLocation"], objc_msgSend(v4, "decodeIntegerForKey:", @"MPRangeLength"));
    -[MPMediaQuerySection setSectionIndexTitleIndex:](v5, "setSectionIndexTitleIndex:", [v4 decodeIntegerForKey:@"MPSectionIndex"]);
  }

  return v5;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)MPMediaQuerySection;
  objc_super v3 = [(MPMediaQuerySection *)&v8 description];
  title = self->_title;
  id v5 = NSStringFromRange(self->_range);
  v6 = [v3 stringByAppendingFormat:@" title=%@, range=%@, sectionIndexTitleIndex=%lu", title, v5, self->_sectionIndexTitleIndex];

  return v6;
}

- (MPMediaQuerySection)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end