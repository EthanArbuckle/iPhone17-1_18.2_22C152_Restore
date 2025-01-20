@interface NSURLSessionMutableEffectiveConfiguration
+ (BOOL)supportsSecureCoding;
- (NSURLSessionMutableEffectiveConfiguration)initWithCoder:(id)a3;
- (id)_initWithConfiguration:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSURLSessionMutableEffectiveConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSURLSessionMutableEffectiveConfiguration)initWithCoder:(id)a3
{
  if ([a3 decodeIntForKey:@"EffectiveConfigurationVersion"] == 1) {
    v4 = (NSURLSessionConfiguration *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_config"];
  }
  else {
    v4 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  }

  return (NSURLSessionMutableEffectiveConfiguration *)v4;
}

- (id)_initWithConfiguration:(id)a3
{
  return a3;
}

@end