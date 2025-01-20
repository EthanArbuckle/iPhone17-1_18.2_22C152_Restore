@interface RTSourceCoreRoutine
+ (BOOL)supportsSecureCoding;
- (RTSourceCoreRoutine)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTSourceCoreRoutine

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTSourceCoreRoutine)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RTSourceCoreRoutine;
  return [(RTSource *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RTSourceCoreRoutine;
  [(RTSource *)&v3 encodeWithCoder:a3];
}

@end