@interface MKShape
- (CLLocationCoordinate2D)coordinate;
- (MKShape)initWithCoder:(id)a3;
- (NSString)subtitle;
- (NSString)title;
- (void)encodeWithCoder:(id)a3;
- (void)setSubtitle:(NSString *)subtitle;
- (void)setTitle:(NSString *)title;
@end

@implementation MKShape

- (CLLocationCoordinate2D)coordinate
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"-[MKShape coordinate] must only be invoked on a concrete subclass." userInfo:0];
  objc_exception_throw(v2);
}

- (MKShape)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKShape;
  v5 = [(MKShape *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKShapeTitle"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKShapeSubtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"MKShapeTitle"];
  [v5 encodeObject:self->_subtitle forKey:@"MKShapeSubtitle"];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(NSString *)title
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(NSString *)subtitle
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end