@interface _CLVLLocalizationDebugInfo
+ (BOOL)supportsSecureCoding;
- (_CLVLLocalizationDebugInfo)initWithCoder:(id)a3;
- (_CLVLLocalizationDebugInfo)initWithVLLocalizationDebugInfo:(id)a3;
- (_CLVLLocalizationMaps488Details)maps488Details;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4;
- (void)dealloc;
- (void)setMaps488Details:(id)a3;
@end

@implementation _CLVLLocalizationDebugInfo

- (_CLVLLocalizationDebugInfo)initWithVLLocalizationDebugInfo:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_CLVLLocalizationDebugInfo;
  result = [(_CLVLLocalizationDebugInfo *)&v5 init];
  if (result)
  {
    if (a3)
    {
      result->_maps488Details = 0;
    }
    else
    {

      return 0;
    }
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CLVLLocalizationDebugInfo;
  [(_CLVLLocalizationDebugInfo *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = [(_CLVLLocalizationMaps488Details *)self->_maps488Details copyWithZone:a3];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CLVLLocalizationDebugInfo)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_CLVLLocalizationDebugInfo;
  result = [(_CLVLLocalizationDebugInfo *)&v4 init];
  if (result) {
    result->_maps488Details = 0;
  }
  return result;
}

- (id)description
{
  return [(_CLVLLocalizationDebugInfo *)self descriptionWithMemberIndent:@"\t" endIndent:&stru_1EE006720];
}

- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4
{
  uint64_t v7 = [a3 stringByAppendingString:@"\t"];
  uint64_t v8 = [a4 stringByAppendingString:@"\t"];
  return (id)[NSString stringWithFormat:@"<_CLVLLocalizationDebugInfo: %p> {\n%@.maps488Details = %@\n%@}", self, a3, -[_CLVLLocalizationMaps488Details descriptionWithMemberIndent:endIndent:](-[_CLVLLocalizationDebugInfo maps488Details](self, "maps488Details"), "descriptionWithMemberIndent:endIndent:", v7, v8), a4];
}

- (_CLVLLocalizationMaps488Details)maps488Details
{
  return self->_maps488Details;
}

- (void)setMaps488Details:(id)a3
{
}

@end