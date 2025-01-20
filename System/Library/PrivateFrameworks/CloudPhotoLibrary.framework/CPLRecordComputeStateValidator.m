@interface CPLRecordComputeStateValidator
+ (BOOL)supportsSecureCoding;
- (BOOL)isComputeStateValid:(id)a3;
@end

@implementation CPLRecordComputeStateValidator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isComputeStateValid:(id)a3
{
  return 1;
}

@end