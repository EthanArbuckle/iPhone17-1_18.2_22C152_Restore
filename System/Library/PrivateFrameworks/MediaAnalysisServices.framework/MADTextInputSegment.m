@interface MADTextInputSegment
+ (BOOL)supportsSecureCoding;
- (MADTextInputSegment)initWithCoder:(id)a3;
- (int64_t)type;
@end

@implementation MADTextInputSegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADTextInputSegment)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MADTextInputSegment;
  return [(MADTextInputSegment *)&v4 init];
}

- (int64_t)type
{
  return 0;
}

@end