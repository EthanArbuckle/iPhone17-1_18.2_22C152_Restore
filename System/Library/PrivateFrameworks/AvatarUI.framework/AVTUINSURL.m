@interface AVTUINSURL
- (unint64_t)hash;
@end

@implementation AVTUINSURL

- (unint64_t)hash
{
  v2 = [(AVTUINSURL *)self path];
  v3 = [v2 lastPathComponent];
  unint64_t v4 = [v3 hash];

  return v4;
}

@end