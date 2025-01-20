@interface MADMultiModalInputSegment
+ (BOOL)supportsSecureCoding;
- (MADMultiModalInputSegment)initWithCoder:(id)a3;
- (int64_t)type;
@end

@implementation MADMultiModalInputSegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMultiModalInputSegment)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MADMultiModalInputSegment;
  return [(MADMultiModalInputSegment *)&v4 init];
}

- (int64_t)type
{
  return 0;
}

@end