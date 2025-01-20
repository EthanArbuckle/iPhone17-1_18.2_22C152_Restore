@interface NSNull
+ (BOOL)supportsSecureCoding;
+ (NSNull)allocWithZone:(_NSZone *)a3;
+ (NSNull)null;
- (NSNull)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)retainCount;
@end

@implementation NSNull

+ (NSNull)null
{
  return (NSNull *)&__kCFNull;
}

- (id)description
{
  return @"<null>";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSNull)allocWithZone:(_NSZone *)a3
{
  return (NSNull *)&__kCFNull;
}

- (unint64_t)retainCount
{
  return -1;
}

- (NSNull)initWithCoder:(id)a3
{
  return 0;
}

@end