@interface PARZeroKeywordRequest
+ (BOOL)supportsSecureCoding;
- (unsigned)nwActivityLabel;
@end

@implementation PARZeroKeywordRequest

- (unsigned)nwActivityLabel
{
  return 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end