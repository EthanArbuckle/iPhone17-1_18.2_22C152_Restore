@interface GEOComposedStringFormatStyle
+ (BOOL)supportsSecureCoding;
- (GEOComposedStringFormatStyle)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedStringFormatStyle

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_token copy];
  v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  *(_DWORD *)(v4 + 8) = self->_type;
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedStringFormatStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedStringFormatStyle;
  uint64_t v5 = [(GEOComposedStringFormatStyle *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_token"];
    token = v5->_token;
    v5->_token = (NSString *)v6;

    v5->_type = [v4 decodeIntegerForKey:@"_type"];
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  token = self->_token;
  id v5 = a3;
  [v5 encodeObject:token forKey:@"_token"];
  [v5 encodeInteger:self->_type forKey:@"_type"];
}

- (void).cxx_destruct
{
}

@end