@interface CLKUITimeViewConfiguration
+ (BOOL)supportsSecureCoding;
- (CLKUITimeViewConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)backgroundStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundStyle:(unint64_t)a3;
@end

@implementation CLKUITimeViewConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(CLKUITimeViewConfiguration);
  v5 = v4;
  if (v4) {
    [(CLKUITimeViewConfiguration *)v4 setBackgroundStyle:self->_backgroundStyle];
  }
  return v5;
}

- (CLKUITimeViewConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLKUITimeViewConfiguration;
  v5 = [(CLKUITimeViewConfiguration *)&v8 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundStyle"];
    v5->_backgroundStyle = [v6 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v3 = NSNumber;
  unint64_t backgroundStyle = self->_backgroundStyle;
  id v5 = a3;
  id v6 = [v3 numberWithUnsignedInteger:backgroundStyle];
  [v5 encodeObject:v6 forKey:@"backgroundStyle"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_unint64_t backgroundStyle = a3;
}

@end